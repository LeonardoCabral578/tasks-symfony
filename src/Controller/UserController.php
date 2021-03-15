<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;

use App\Entity\User;
use App\form\RegisterType;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserController extends AbstractController
{
    public function register(Request $request, UserPasswordEncoderInterface $encoder): Response{

        // Crear formulario
        $user = new User();
        $form = $this->createForm(RegisterType::class, $user);

        // Rellenar el objeto con los datos del form
        $form->handleRequest($request);

        // Comprobar si el form se ha enviado
        if($form->isSubmitted() && $form->isValid()){

            // Modificando el objeto para guardarlo
            $user->setRole('role_user');
            $user->setCreatedAt(new \Datetime('now'));

            // Cifrar contraseña
            $encoded = $encoder->encodePassword($user, $user->getPassword());
            $user->setPassword($encoded);

            // Guardar usuario
            $em = $this->getdoctrine()->getManager();
            $em->persist($user);
            $em->flush();

            return $this->redirectToRoute('tasks');
        }

        return $this->render('user/register.html.twig', [
            'form' => $form->createView()
        ]);
    }
}
