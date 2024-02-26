
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoConnectivity {

  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get connectivityOnChange;

}


class NetworkInfo implements NetworkInfoConnectivity{
   Connectivity connectivity=Connectivity();

  @override
  Future<bool> isConnected() async {
   var result = await connectivityResult;
   if(result == ConnectivityResult.none){
     return false;
   }
   return true;
  }
  @override
  // TODO: implement connectivityResult
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }


   @override
   // TODO: implement connectivityOnChange
   Stream<ConnectivityResult> get connectivityOnChange {
     return connectivity.onConnectivityChanged;
   }


}