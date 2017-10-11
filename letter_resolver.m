function [ letter ] = map_result( input_args )

switch input_args
   case 1
      letter = 'A';
   case 2
      letter = 'B';
   case 3
       letter = 'C';
   case 4
       letter = 'D';
   case 5
       letter = 'E';
   case 6
       letter = 'F';
   case 7
       letter = 'G';
   case 8
       letter = 'H';
   case 9
       letter = 'I';
   case 10
       letter = 'J';
    case 11
       letter = 'K';
   case 12
       letter = 'L';
   case 13
       letter = 'M';
   case 14
       letter = 'N';
   case 15
       letter = 'O';
   case 16
       letter = 'P';
   case 17
       letter = 'Q';
   case 18
       letter = 'R';
   case 19
       letter = 'S';
   case 20
       letter = 'T';
   case 21
       letter = 'U';
   case 22
       letter = 'V';
   case 23
       letter = 'W';
   case 24
       letter = 'X';
   case 25
       letter = 'Y';
   case 26
       letter = 'Z';
   
   otherwise
      letter = 'not found';
end

end

