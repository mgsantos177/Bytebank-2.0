import 'package:bytebank/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.tableSql);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
  // mesmo codigo mas sem utilizar async await

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute('CREATE TABLE contacts('
  //           'id INTEGER PRIMARY KEY, '
  //           'name TEXT, '
  //           'account_number INTEGER)');
  //     },
  //     version: 1,
  //     // onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });
}
