import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';

//firebase ui localizations

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'E-posta ';

  @override
  String get passwordInputLabel => 'Şifre';

  @override
  String get confirmPasswordInputLabel => 'Şifre tekrar';

  @override
  String get signInActionText => 'Giriş Yap';

  @override
  String get registerActionText => 'Kayıt Ol';

  @override
  String get emailIsRequiredErrorText => 'E-posta giriniz!';

  @override
  String get isNotAValidEmailErrorText => 'E-posta geçerli değil!';

  @override
  String get userNotFoundErrorText => 'Kullanıcı Bulunamadı!';

  @override
  String get emailTakenErrorText => 'Bu e-posta daha önce alındı!';

  @override
  String get wrongOrNoPasswordErrorText => 'Geçersiz şifre!';
  @override
  String get passwordIsRequiredErrorText => 'Lütfen şifrenizi giriniz!';

  @override
  String get signInText => 'Giriş Yap';
  @override
  String get registerText => 'Kayıt Ol';

  @override
  String get registerHintText => 'Hesabın yok mu?';

  @override
  String get signInHintText => 'Zaten bir hesabın var mı?';

  @override
  String get confirmPasswordIsRequiredErrorText => 'Şifreyi tekrar giriniz!';

  @override
  String get confirmPasswordDoesNotMatchErrorText => 'Şifreler eşleşmiyor!';
  @override
  String get forgotPasswordButtonLabel => 'Şifremi Hatırlamıyorum';

  @override
  String get forgotPasswordViewTitle => 'Şifremi Hatırlamıyorum';
  @override
  String get resetPasswordButtonLabel => 'Şifremi Sıfırla';
  @override
  String get goBackButtonLabel => 'Geri dön';
  @override
  String get passwordResetEmailSentText =>
      'Şifre sıfırlama maili gönderilmiştir.';
  @override
  String get forgotPasswordHintText =>
      'E-postanızı girin, size şifrenizi sıfırlamak için bir bağlantı gönderelim';

  @override
  String get signInWithGoogleButtonText => 'Google ile giriş yap';
}
