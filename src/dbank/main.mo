import Debug "mo:base/Debug"; // used to print values and text
import Time "mo:base/Time";
import Float "mo:base/Float";
actor DBank { // actor is used to create canisters
  stable var currentValue : Float = 300; //stablekeyword changes this variable so that its state doesn't reset
  // currentValue := 300;

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

  
  public func topUp(amount: Float) { 
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
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
  public query func checkBalance(): async Float {
    return currentValue;
  };

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime; 
  };

}