with Ada.Text_IO;
with Bank_Accounts;

procedure main is
   Mattis_Account : Bank_Accounts.Account_Type;
   Kevins_Account : Bank_Accounts.Account_Type;
   Balance : Bank_Accounts.Cents_Type := 0;
   Amount : Bank_Accounts.Cents_Type := 10;

begin
   -- working tests
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line("Current Balance: " & Integer'Image(Balance));

   Bank_Accounts.Deposit(Account => Mattis_Account, Amount => 54);
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line("Balance after deposit 54: " & Integer'Image(Balance));

   Bank_Accounts.Withdraw(Mattis_Account, 5);
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line("Balance after withdraw 5: " & Integer'Image(Balance));

   Bank_Accounts.Transfer(Mattis_Account, Kevins_Account, Amount);
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line("Mattis Account after send 10: " & Integer'Image(Balance));
   Balance := Bank_Accounts.Get_Balance(Kevins_Account);
   Ada.Text_IO.Put_Line("Kevins Account after get 10: " & Integer'Image(Balance));

   -- failing tests
   Bank_Accounts.Withdraw(Mattis_Account, 50);
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line("Balance after withdraw 50: " & Integer'Image(Balance));

   Amount := 100;
   Bank_Accounts.Transfer(Mattis_Account, Kevins_Account, Amount);
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line("Mattis Account after send 10: " & Integer'Image(Balance));
   Balance := Bank_Accounts.Get_Balance(Kevins_Account);
   Ada.Text_IO.Put_Line("Kevins Account after get 10: " & Integer'Image(Balance));

end main;
