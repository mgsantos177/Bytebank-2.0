class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  @override
  String toString() {
    // TODO: implement toString
    return 'Contact name= $name conta= $accountNumber';
  }
}