<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;
use app\Entity\Post;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
        $faker = Factory::create('fr_FR');

        for ($i=0 ; $i<50 ; $i++){

            $post = new Post();
            $post->setTitle($faker->text(30))
            ->setText($faker->text())
            ->setAuteur($faker->name())
            ->setDatecrea($faker->dateTime());

            $manager->persist($post);


        }

        $manager->flush();
    }
}
