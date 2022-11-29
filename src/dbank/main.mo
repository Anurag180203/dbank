import Debug "mo:base/Debug"; // used to print values and text
actor DBank { // actor is used to create canisters
  stable var currentValue : Nat = 300; //stablekeyword changes this variable so that its state doesn't reset
  // currentValue := 100;

  // let id = 2348923840928349;//let creates immutable variables
  // Debug.print("Hello");//by default only text can be printed
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  // func topUp() { //this is a private function ie cannot be called from outside
  //   currentValue += 1;
  //   Debug.print(debug_show(currentValue));
  // };
  //topUp();

  //for testing
  //for calling function from terminal 
  //dfx canister call dbank topUp 
  // or
  // dfx canister id __Candid_UI
  // dfx canister id dbank
  // in browser go to http://127.0.0.1:8000/?canisterId= and put first id here and later id later

  
  public func topUp(amount: Nat) { 
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if(tempValue >=0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else{
      Debug.print("Amount too large, currentValue less than zero.");
    }
  };

  //above method are update methods (they are time expensive)
  //query calls/methods are comparitively faster
  
  // for return use 
  // : datatype after function
  public query func checkBalance(): async Nat {
    return currentValue;
  } 
}