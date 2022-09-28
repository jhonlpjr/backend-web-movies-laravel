<?php

use Illuminate\Database\Seeder;

use App\Models\Movie;

class MoviesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Movie::truncate();

        $faker = \Faker\Factory::create();

        for($i=0; $i<10; $i++){
            Movie::create([
                'title' => $faker->sentence,
                'synopsis' => $faker->paragraph,
                'year' => $faker->randomDigit,
                'cover' => $faker->sentence,
            ]);
        }

        Movie::create([
            'title' => 'Resident Evil: El huésped maldito',
            'synopsis' => 'Resident Evil: El huésped maldito	En un centro clandestino de investigación genética, se produce un virus mortal. Para contener la fuga, se cierra toda la instalación y se cree que mueren todos los empleados, pero en realidad se convierten en zombis.',
            'year' => 2002,
            'cover' => 'https://2.bp.blogspot.com/-oCee-Ui4s44/WIfHE-t4SEI/AAAAAAAAEE8/duBZTvRC9MI2cuJF47BEEcOT5wtzulEugCLcB/s1600/residentevil01-01.jpeg',
        ]);

        Movie::create([
            'title' => 'Espanta tiburones',
            'synopsis' => 'El hijo de un tiburón mafioso muere cuando le cae un ancla encima. Un pez con mucho descaro y sueños de grandeza se encontraba en la escena del crimen y, para darse importancia, se atribuye la muerte. Sin duda, un grave error.',
            'year' => 2004,
            'cover' => 'https://www.themoviedb.org/t/p/original/wCRT8jjUrAkITnhC31ZbOWIZpHV.jpg',
        ]);
    }
}
