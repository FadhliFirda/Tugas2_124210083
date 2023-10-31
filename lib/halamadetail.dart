import 'package:flutter/material.dart';
import 'apidata.dart';
import 'detailusers.dart';

class HalamanDetail extends StatelessWidget {
  final int id;

  HalamanDetail({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail User"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadDetailUser(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final detailUser = DetailUserModel.fromJson(snapshot.data!);

            if (detailUser.data != null) {
              final userData = detailUser.data!;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: Image.network(userData.foto!),
                        ),
                        ListTile(
                          title: Center(child: Text('${userData.namaawal} ${userData.namaterakhir}')),
                          subtitle: Center(child: Text(userData.email!)),
                        ),
                        // Add more user details as needed
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(child: Text("Data Pengguna Tidak Ada."));
            }
          }
          return Center(child: Text("Tidak Ada Data."));
        },
      ),
    );
  }
}
