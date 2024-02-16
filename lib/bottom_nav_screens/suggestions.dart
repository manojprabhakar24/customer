class Suggestions {
  static final List<String> fromSuggestions = [
    'Ariyalur, Tamil Nadu',
    'Chengalpattu, Tamil Nadu',
    'Chennai, Tamil Nadu',
    'Coimbatore, Tamil Nadu',
    'Cuddalore, Tamil Nadu',
    'Dharmapuri, Tamil Nadu',
    'Dindigul, Tamil Nadu',
    'Erode, Tamil Nadu',
    'Kallakurichi, Tamil Nadu',
    'Kanchipuram, Tamil Nadu',
    'Kanyakumari, Tamil Nadu',
    'Karur, Tamil Nadu',
    'Krishnagiri, Tamil Nadu',
    'Madurai, Tamil Nadu',
    'Mayiladuthurai, Tamil Nadu',
    'Nagapattinam, Tamil Nadu',
    'Namakkal, Tamil Nadu',
    'Nilgiris, Tamil Nadu',
    'Perambalur, Tamil Nadu',
    'Pudukkottai, Tamil Nadu',
    'Ramanathapuram, Tamil Nadu',
    'Ranipet, Tamil Nadu',
    'Salem, Tamil Nadu',
    'Sivaganga, Tamil Nadu',
    'Tenkasi, Tamil Nadu',
    'Thanjavur, Tamil Nadu',
    'Theni, Tamil Nadu',
    'Thoothukudi, Tamil Nadu',
    'Tiruchirappalli, Tamil Nadu',
    'Tirunelveli, Tamil Nadu',
    'Tirupathur, Tamil Nadu',
    'Tiruppur, Tamil Nadu',
    'Tiruvallur, Tamil Nadu',
    'Tiruvannamalai, Tamil Nadu',
    'Tiruvarur, Tamil Nadu',
    'Vellore, Tamil Nadu',
    'Viluppuram, Tamil Nadu',
    'Virudhunagar, Tamil Nadu'
  ];
  static final List<String> toSuggestions = [
    'Ariyalur, Tamil Nadu',
    'Chengalpattu, Tamil Nadu',
    'Chennai, Tamil Nadu',
    'Coimbatore, Tamil Nadu',
    'Cuddalore, Tamil Nadu',
    'Dharmapuri, Tamil Nadu',
    'Dindigul, Tamil Nadu',
    'Erode, Tamil Nadu',
    'Kallakurichi, Tamil Nadu',
    'Kanchipuram, Tamil Nadu',
    'Kanyakumari, Tamil Nadu',
    'Karur, Tamil Nadu',
    'Krishnagiri, Tamil Nadu',
    'Madurai, Tamil Nadu',
    'Mayiladuthurai, Tamil Nadu',
    'Nagapattinam, Tamil Nadu',
    'Namakkal, Tamil Nadu',
    'Nilgiris, Tamil Nadu',
    'Perambalur, Tamil Nadu',
    'Pudukkottai, Tamil Nadu',
    'Ramanathapuram, Tamil Nadu',
    'Ranipet, Tamil Nadu',
    'Salem, Tamil Nadu',
    'Sivaganga, Tamil Nadu',
    'Tenkasi, Tamil Nadu',
    'Thanjavur, Tamil Nadu',
    'Theni, Tamil Nadu',
    'Thoothukudi, Tamil Nadu',
    'Tiruchirappalli, Tamil Nadu',
    'Tirunelveli, Tamil Nadu',
    'Tirupathur, Tamil Nadu',
    'Tiruppur, Tamil Nadu',
    'Tiruvallur, Tamil Nadu',
    'Tiruvannamalai, Tamil Nadu',
    'Tiruvarur, Tamil Nadu',
    'Vellore, Tamil Nadu',
    'Viluppuram, Tamil Nadu',
    'Virudhunagar, Tamil Nadu'
  ];
  static List<String> filterFromSuggestions(String input) {
    return fromSuggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(input.toLowerCase()))
        .toList();
  }

  static List<String> filterToSuggestions(String input) {
    return toSuggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(input.toLowerCase()))
        .toList();
  }
}
