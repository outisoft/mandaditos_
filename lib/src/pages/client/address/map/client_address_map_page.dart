import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mandaditos_expres/src/pages/client/address/map/client_address_map_controller.dart';
import 'package:mandaditos_expres/src/utils/my_colors.dart';
import 'package:mandaditos_expres/src/widgets/no_data_widget.dart';

class ClientAddressMapPage extends StatefulWidget {
  const ClientAddressMapPage({Key key}) : super(key: key);

  @override
  _ClientAddressMapPageState createState() => _ClientAddressMapPageState();
}

class _ClientAddressMapPageState extends State<ClientAddressMapPage> {

  ClientAddressMapController _con =  new ClientAddressMapController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text('Ubica tu direccion en el mapa'),
      ),
      body: Stack(
        children: [
          _googleMaps()
        ],
      ),
    );
  }
  Widget _googleMaps(){
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _con.initialPosition,
      onMapCreated: _con.onMapCreated
    );
  }

  void refresh(){
    setState(() {});
  }
}
