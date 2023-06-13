enum ImageConst {
  avatar('profile-avatar');

  final String value;

  const ImageConst(this.value);
  String get toPath => 'assets/image/$value.png';
}
