// Q1. Supprimez temporairement le Expanded autour de la Column de HomeHeader.
// Réponse : L’avatar se place juste à côté de la Column, selon le Row.
// Sans Expanded, la Column prend uniquement la place nécessaire à son contenu.

// Q2. Pourquoi prenom est-il déclaré final ?
// Réponse : Parce que prenom ne doit pas changer après son initialisation.

// Q3. Quelle différence entre cs.primary et Colors.teal si on change la seedColor du thème ?
// Réponse : cs.primary est une couleur dynamique qui change selon le thème.
// Colors.teal est une couleur fixe qui reste la même, même si seedColor change.

// Q4. Placez le DecoratedBox en premier dans la liste children. Que voyez-vous ? Pourquoi ?
// Réponse : Le DecoratedBox passe derrière les autres éléments, car dans un Stack,
// les premiers éléments sont dessinés en premier et les suivants par-dessus.

// Q5. Retirez ClipRRect. Qu'est-ce qui change ?
// Réponse : L'image n'a plus les coins arrondis. ClipRRect sert à découper
// son contenu selon un rectangle aux coins arrondis.

// Q6. Pourquoi le Positioned des textes a-t-il right: 130 ?
// Réponse : Pour placer les textes à 130 pixels du bord droit du Stack
// et laisser de la place pour l'image ou l'avatar à droite.



// Q7. Pourquoi la Row « note / prix » a-t-elle besoin que la Column soit dans un Expanded pour que Spacer fonctionne ?
// Réponse : Expanded donne à la Column l'espace disponible. Ainsi, Spacer peut
// utiliser l'espace libre pour séparer la note et le prix.

// Q8. Combien de lignes faudrait-il ajouter pour afficher une 7e destination ? Dans quel fichier ?
// Réponse : Il faut ajouter une seule entrée (un objet Destination) dans la liste
// des destinations, dans le fichier où cette liste est déclarée, généralement main.dart
// ou home_screen.dart selon l'organisation du projet.