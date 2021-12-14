with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Maps;  use Ada.Strings.Maps;
procedure jdoodle is
   type Value_Type is digits 12
         range -999_999_999_999.0e999 .. 999_999_999_999.0e999;

   package T_IO renames Ada.Text_IO;
   package F_IO is new  Ada.Text_IO.Float_IO (Value_Type);

   Value_1 : Value_Type;
   Value_2 : Value_Type;
   Result    : Value_Type;
   Operation : Character;
   Answer : String (1 .. 1);


begin
   <<Restart>>
   T_IO.Put (ASCII.LF &"First Value : ");
   F_IO.Get (Value_1);
   T_IO.Put (ASCII.LF &"Operation    : ");
   T_IO.Get (Operation);
   T_IO.Put (ASCII.LF &"Second Value : ");
   F_IO.Get (Value_2);



    case Operation is
     when '+' =>
        Result := Value_1 + Value_2;
     when '-' =>
        Result := Value_1 - Value_2;
     when '/' =>
        Result := Value_1 / Value_2;
     when '*' =>
     if Value_2 > Value_Type(0) then 
        Result := Value_1 * Value_2;
        else 
        T_IO.Put_Line (ASCII.LF &"cannot divide by zero");
        goto Exit_Not_Supported;
     end if;
     when '^' =>
        Result := Value_1 ** natural(Value_2);
     when others =>
        T_IO.Put_Line (ASCII.LF &"Illegal Operation.");
        goto Exit_Not_Supported;
  end case;
   F_IO.Put (Value_1);
   T_IO.Put (Operation);
   F_IO.Put (Value_2);
   T_IO.Put (" = ");
   F_IO.Put (Result);
   T_IO.Put (ASCII.LF & "do you have another calculation to make? y for yes n for no:" );
   T_IO.Get (Answer);

   if Answer = "y"then
     goto Restart;
    elsif Answer = "Y"then
     goto Restart;
   end if;
<<Exit_Not_Supported>>
  return;
  exception
    when CONSTRAINT_ERROR =>
        Put_Line (ASCII.LF & "Error cannot divide by zero");
end jdoodle;