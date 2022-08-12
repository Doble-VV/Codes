#!/usr/bin/perl
#
# hello.pl
#
# Autor: Marco Antonio Manzo <amnesiac@unixmonkeys.com>
#
# Descripción:
#   Programa1 de ejemplo - Tutorial Gtk2-Perl
#
# Licencia:
# Este programa puede ser distribuido y modificado bajo
# los mismos términos de la licencia artística de Perl.
#

use strict;
use warnings;

# Cargamos nuestra biblioteca y la inicializamos.
# usar '-init' es Igual a utilizar Gtk->init en el cuerpo del
# programa.
use Gtk2 '-init';

# use Glib qw( TRUE FALSE );
# Definición de constantes que generalmente son
# utilizadas para encender/apagar atributos.
use constant TRUE => 1;
use constant FALSE => !TRUE;

# función( callback ) para manejar el evento 'clicked'
# al presionar el botón.
sub clicked {
    Gtk2->main_quit;
}

# Generamos nuestra nueva ventana instanciando Gtk2::Window
# y le establecemos algunos atributos como el grosor del
# borde. Después conectamos la señal del evento 'destroy'
# con nuestro callback, dicho evento se presenta cuando le damos
# "cerrar" a nuestra ventana
my $window = Gtk2::Window->new( 'toplevel' );
$window->set_border_width( 10 );
$window->signal_connect( destroy => sub{ Gtk2->main_quit } );

# Nuestro mensaje inicial, instanciando Gtk2::Label
my $label = Gtk2::Label->new( 'Hola Mundo( puff!! )' );

# Creamos nuestro botón para cerrar la aplicación, nuevamente
# creamos un objeto de tipo Gtk2::Button. Después conectamos
# la señal del evento 'clicked' hacia nuestro callback definido
# arriba.
my $button = Gtk2::Button->new( 'Salir' );
$button->signal_connect( clicked => \&clicked );

# Mas delante en el tutorial veremos a fondo la clase Gtk2::VBox
# la cual nos ayuda a agrupar widgets.
my $vbox = Gtk2::VBox->new( 5, FALSE );
$vbox->pack_start( $label, FALSE, FALSE, FALSE );
$vbox->pack_start( $button, FALSE, FALSE, FALSE );

# Agregemos nuestra caja con objetos a la ventana, y una vez
# todo listo mostramos los objetos.
$window->add( $vbox );
$window->show_all;

# Y finalmente... nuestro event loop de gtk2, el cual queda
# corriendo mientras no se reciba el Gtk2::main_quit ( o
# en su defecto el programa sea interrumpido )
Gtk2->main;
