<?php

namespace App\Controller;

use App\Entity\Post;
use App\Entity\Comment;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\PostRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;

class BlogController extends AbstractController
{
    #[Route('/', name: 'app_blog')]
    public function index(PostRepository $ripo)
    {
        $posts = $ripo->findAll();

        return $this->render('blog/index.html.twig', [
            'posts' => $posts
        ]);
    }

    #[Route('/posts/{id}', name: 'show_post')]
    public function show(Post $post, Request $request, EntityManagerInterface $em)
    {

        $comment = new Comment();
        $form = $this->createFormBuilder($comment)
        ->add("Username", TextType::class, [
            "attr" => [
                "class" => "form-control mb-3",
                "label" => "Nom d'utilisateur"
            ]
        ])
        ->add("Text", TextareaType::class, [
            "attr" => [
                "class" => "form-control mb-3"
            ]
        ])
        ->add("Envoyer", SubmitType::class, [
            "attr" => [
                "class" => "btn btn-primary"
            ]
            ])
        ->getForm();

        $comment->setDateCrea(new \dateTime());
        $comment->setPost($post);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {

            $em->persist($comment);
            $em->flush();

        }

        return $this->render('blog/post.html.twig', [
            'post' => $post,
            'form' => $form->createView()
        ]);
    }
}
