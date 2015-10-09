require 'curses'
engine1 = [
%s(),
%s(                    (  ) (@@)  ( )  (@)  ()     @@     O     @     o     @     o),
%s(                 (@@@)),
%s(              (    )),
%s(           (@@@@)),
%s(),
%s(        (    )),
%s(       =====        ________                ___________),
%s(   _D _|   |_______/        \__I_I_____===__|_________|),
%s(    | (_)---   |  H\________/ |   |        =|_______|       __________________),
%s(   /        |  |  H  |  |     |   |         ||_| [_]|      _|                 \______A),
%s(  |         |  |  H  |__--------------------| [___] |    =|                          |),
%s(  | ___________|__H__/__|_____/[][]~\_______|       |    -|                          |),
%s(  |/ |   |-------------I_____I [][] []  D   |=======|_____|__________________________|_),
%s(__/ =| o |=-~o=====o=====o=====o\ ______Y___________|__|_____________________________|_),
%s( |/-=|___|=   ||   ||   ||   |___________/~\___/            |_D__D__D_|  |_D__D__D_|),
%s(  \_/      \_/  \_/  \_/  \_/            \_/                 \_/   \_/    \_/   \_/)
]
engine2 = [
%s(),
%s(                    (  ) (@@)  ( )  (@)  ()     @@     O     @     o     @     o),
%s(                 (@@@)),
%s(              (    )),
%s(           (@@@@)),
%s(),
%s(        (    )),
%s(       =====        ________                ___________),
%s(   _D _|   |_______/        \__I_I_____===__|_________|),
%s(    | (_)---   |  H\________/ |   |        =|_______|       __________________),
%s(   /        |  |  H  |  |     |   |         ||_| [_]|      _|                 \______A),
%s(  |         |  |  H  |__--------------------| [___] |    =|                          |),
%s(  | ___________|__H__/__|_____/[][]~\_______|       |    -|                          |),
%s(  |/ |   |-------------I_____I [][] []  D   |=======|_____|__________________________|_),
%s(__/ =| o | / \  / \  / \  / \___________Y___________|__|_____________________________|_),
%s( |/-=|___|=-~o=====o=====o=====o\________/~\___/            |_D__D__D_|  |_D__D__D_|),
%s(  \_/      \_/  \_/  \_/  \_/            \_/                 \_/   \_/    \_/   \_/)
]
engine3 = [
%s(),
%s(                    (  ) (@@)  ( )  (@)  ()     @@     O     @     o     @     o),
%s(                 (@@@)),
%s(              (    )),
%s(           (@@@@)),
%s(),
%s(        (    )),
%s(       =====        ________                ___________),
%s(   _D _|   |_______/        \__I_I_____===__|_________|),
%s(    | (_)---   |  H\________/ |   |        =|_______|       __________________),
%s(   /        |  |  H  |  |     |   |         ||_| [_]|      _|                 \______A),
%s(  |         |  |  H  |__--------------------| [___] |    =|                          |),
%s(  | ___________|__H__/__|_____/[][]~\_______|       |    -|                          |),
%s(  |/ |   |-------------I_____I [][] []  D   |=======|_____|__________________________|_),
%s(__/ =| o | / \  / \  / \  / \___________Y___________|__|_____________________________|_),
%s( |/-=|___|=   ||   ||   ||   |___________/~\___/            |_D__D__D_|  |_D__D__D_|),
%s(  \_/     =\_/o=\_/o=\_/o=\_/==o\        \_/                 \_/   \_/    \_/   \_/)
]
Curses.init_screen
lines = Curses.lines
cols = Curses.cols
j = 0
g = 0
i = 0
k = 0
begin
	Curses.clear	
    0.upto(cols) do |i|
    	if k == 3
    	   k = 0
    	end
    	k+=1
		0.upto(16) do |j|
		

				0.upto(cols) do |g|
					
					Curses.setpos(j+((lines/2)-8),g-i)
					if k == 1
						Curses.addstr(engine1[j][g].to_s)
					elsif k == 2
						Curses.addstr(engine2[j][g].to_s)
				    else
				    	Curses.addstr(engine3[j][g].to_s)
				    end

				end	

		end
		if true
			sleep 0.1
			Curses.refresh
		end
		Curses.clear
	end
ensure
    Curses.close_screen
end