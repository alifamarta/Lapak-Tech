class ApiUrl {
  static const String baseUrl = 'http://10.0.2.2/toko-kom-api/public';

  static const String register = baseUrl + '/registrasi';
  static const String login = baseUrl + '/login';
  static const String listProd = baseUrl + '/produk';
  static const String createProd = baseUrl + '/produk';

  static String updateProd(int id) {
    return baseUrl + '/produk/' + id.toString() + '/update';
  }

  static String showProd(int id) {
    return baseUrl + '/produk/' + id.toString();
  }

  static String deleteProd(int id) {
    return baseUrl + '/produk/' + id.toString();
  }
}