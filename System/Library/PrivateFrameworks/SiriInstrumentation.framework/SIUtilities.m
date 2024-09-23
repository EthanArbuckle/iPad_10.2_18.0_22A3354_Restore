@implementation SIUtilities

+ (int)convertLanguageCodeToSchemaLocale:(id)a3
{
  void *v3;
  int v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR-AE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR-SA")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CA-ES")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CS-CZ")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DA-DK")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DE-AT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DE-CH")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DE-DE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EL-GR")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-AE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-AU")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-CA")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-GB")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-ID")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-IE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-IN")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-MY")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-NZ")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-PH")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-SA")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-SG")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-US")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EN-ZA")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ES-CL")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ES-CO")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ES-ES")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ES-MX")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ES-US")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FI-FI")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FR-BE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FR-CA")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FR-CH")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FR-FR")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HE-IL")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HI-IN")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HR-HR")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HU-HU")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ID-ID")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IT-CH")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IT-IT")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JA-JP")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KO-KR")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MS-MY")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NB-NO")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL-BE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL-NL")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PL-PL")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PT-BR")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PT-PT")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RO-RO")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RU-RU")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SK-SK")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SV-SE")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TH-TH")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TR-TR")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UK-UA")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VI-VN")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WUU-CN")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YUE-CN")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZH-CN")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZH-HK")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ZH-TW")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)convertCountryCodeToSchemaCountryCode:(id)a3
{
  void *v3;
  int v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AE")) & 1) != 0)
  {
    v4 = 222;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AF")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AG")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AI")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AM")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AO")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AQ")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AU")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AW")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AX")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AZ")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BA")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BB")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BD")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BE")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BF")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BG")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BH")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BI")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BJ")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BL")) & 1) != 0)
  {
    v4 = 248;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BM")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BN")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BO")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BQ")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BR")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BS")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BT")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BV")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BW")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BY")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BZ")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CA")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CC")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CD")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CF")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CG")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CH")) & 1) != 0)
  {
    v4 = 204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CI")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CK")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CL")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CM")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CN")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CO")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CR")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CU")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CV")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CW")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CX")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CY")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CZ")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DE")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DJ")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DK")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DM")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DO")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DZ")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EC")) & 1) != 0)
  {
    v4 = 238;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EE")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EG")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EH")) & 1) != 0)
  {
    v4 = 234;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ER")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ES")) & 1) != 0)
  {
    v4 = 198;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ET")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FI")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FJ")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FK")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FM")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FO")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FR")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GA")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GB")) & 1) != 0)
  {
    v4 = 223;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GD")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GE")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GF")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GG")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GH")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GI")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GL")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GM")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GN")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GP")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GQ")) & 1) != 0)
  {
    v4 = 239;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GR")) & 1) != 0)
  {
    v4 = 240;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GS")) & 1) != 0)
  {
    v4 = 196;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GT")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GU")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GW")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GY")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HK")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HM")) & 1) != 0)
  {
    v4 = 241;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HN")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HR")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HT")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HU")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ID")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IE")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IL")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IM")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IO")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IQ")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IR")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IS")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IT")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JE")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JM")) & 1) != 0)
  {
    v4 = 242;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JO")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("JP")) & 1) != 0)
  {
    v4 = 243;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KE")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KG")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KH")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KI")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KM")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KN")) & 1) != 0)
  {
    v4 = 178;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KP")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KR")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KW")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KY")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("KZ")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LA")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LB")) & 1) != 0)
  {
    v4 = 119;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LC")) & 1) != 0)
  {
    v4 = 179;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LI")) & 1) != 0)
  {
    v4 = 123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LK")) & 1) != 0)
  {
    v4 = 199;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LR")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LS")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LT")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LU")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LV")) & 1) != 0)
  {
    v4 = 118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LY")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MA")) & 1) != 0)
  {
    v4 = 146;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MC")) & 1) != 0)
  {
    v4 = 142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MD")) & 1) != 0)
  {
    v4 = 141;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ME")) & 1) != 0)
  {
    v4 = 144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MF")) & 1) != 0)
  {
    v4 = 180;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MG")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MH")) & 1) != 0)
  {
    v4 = 134;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MK")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ML")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MM")) & 1) != 0)
  {
    v4 = 148;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MN")) & 1) != 0)
  {
    v4 = 143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MO")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MP")) & 1) != 0)
  {
    v4 = 245;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MQ")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MR")) & 1) != 0)
  {
    v4 = 136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MS")) & 1) != 0)
  {
    v4 = 145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MT")) & 1) != 0)
  {
    v4 = 133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MU")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MV")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MW")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MX")) & 1) != 0)
  {
    v4 = 139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MZ")) & 1) != 0)
  {
    v4 = 147;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NA")) & 1) != 0)
  {
    v4 = 149;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NC")) & 1) != 0)
  {
    v4 = 153;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NE")) & 1) != 0)
  {
    v4 = 156;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NF")) & 1) != 0)
  {
    v4 = 159;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NG")) & 1) != 0)
  {
    v4 = 157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NI")) & 1) != 0)
  {
    v4 = 155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NL")) & 1) != 0)
  {
    v4 = 152;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NP")) & 1) != 0)
  {
    v4 = 151;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NR")) & 1) != 0)
  {
    v4 = 150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NU")) & 1) != 0)
  {
    v4 = 158;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NZ")) & 1) != 0)
  {
    v4 = 154;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OM")) & 1) != 0)
  {
    v4 = 161;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PA")) & 1) != 0)
  {
    v4 = 165;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PE")) & 1) != 0)
  {
    v4 = 246;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PF")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PG")) & 1) != 0)
  {
    v4 = 166;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PH")) & 1) != 0)
  {
    v4 = 168;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PK")) & 1) != 0)
  {
    v4 = 162;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PL")) & 1) != 0)
  {
    v4 = 170;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PM")) & 1) != 0)
  {
    v4 = 181;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PN")) & 1) != 0)
  {
    v4 = 169;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PR")) & 1) != 0)
  {
    v4 = 172;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PS")) & 1) != 0)
  {
    v4 = 164;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PT")) & 1) != 0)
  {
    v4 = 171;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PW")) & 1) != 0)
  {
    v4 = 163;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PY")) & 1) != 0)
  {
    v4 = 167;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QA")) & 1) != 0)
  {
    v4 = 173;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RE")) & 1) != 0)
  {
    v4 = 247;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RO")) & 1) != 0)
  {
    v4 = 174;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RS")) & 1) != 0)
  {
    v4 = 187;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RU")) & 1) != 0)
  {
    v4 = 175;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RW")) & 1) != 0)
  {
    v4 = 176;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SA")) & 1) != 0)
  {
    v4 = 186;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SB")) & 1) != 0)
  {
    v4 = 193;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SC")) & 1) != 0)
  {
    v4 = 188;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SD")) & 1) != 0)
  {
    v4 = 200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SE")) & 1) != 0)
  {
    v4 = 203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SG")) & 1) != 0)
  {
    v4 = 190;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SH")) & 1) != 0)
  {
    v4 = 177;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SI")) & 1) != 0)
  {
    v4 = 192;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SJ")) & 1) != 0)
  {
    v4 = 202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SK")) & 1) != 0)
  {
    v4 = 191;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SL")) & 1) != 0)
  {
    v4 = 189;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SM")) & 1) != 0)
  {
    v4 = 184;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SN")) & 1) != 0)
  {
    v4 = 249;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SO")) & 1) != 0)
  {
    v4 = 194;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SR")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SS")) & 1) != 0)
  {
    v4 = 197;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ST")) & 1) != 0)
  {
    v4 = 185;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SV")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SX")) & 1) != 0)
  {
    v4 = 250;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SY")) & 1) != 0)
  {
    v4 = 205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SZ")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TC")) & 1) != 0)
  {
    v4 = 218;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TD")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TF")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TG")) & 1) != 0)
  {
    v4 = 211;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TH")) & 1) != 0)
  {
    v4 = 209;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TJ")) & 1) != 0)
  {
    v4 = 207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TK")) & 1) != 0)
  {
    v4 = 212;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TL")) & 1) != 0)
  {
    v4 = 210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TM")) & 1) != 0)
  {
    v4 = 217;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TN")) & 1) != 0)
  {
    v4 = 215;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TO")) & 1) != 0)
  {
    v4 = 213;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TR")) & 1) != 0)
  {
    v4 = 216;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TT")) & 1) != 0)
  {
    v4 = 214;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV")) & 1) != 0)
  {
    v4 = 219;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TW")) & 1) != 0)
  {
    v4 = 206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TZ")) & 1) != 0)
  {
    v4 = 208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UA")) & 1) != 0)
  {
    v4 = 221;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UG")) & 1) != 0)
  {
    v4 = 220;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UM")) & 1) != 0)
  {
    v4 = 224;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("US")) & 1) != 0)
  {
    v4 = 225;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UY")) & 1) != 0)
  {
    v4 = 226;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UZ")) & 1) != 0)
  {
    v4 = 227;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VA")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VC")) & 1) != 0)
  {
    v4 = 182;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VE")) & 1) != 0)
  {
    v4 = 229;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VG")) & 1) != 0)
  {
    v4 = 231;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VI")) & 1) != 0)
  {
    v4 = 232;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VN")) & 1) != 0)
  {
    v4 = 230;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VU")) & 1) != 0)
  {
    v4 = 228;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WF")) & 1) != 0)
  {
    v4 = 233;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WS")) & 1) != 0)
  {
    v4 = 183;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XK")) & 1) != 0)
  {
    v4 = 244;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YE")) & 1) != 0)
  {
    v4 = 235;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YT")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZA")) & 1) != 0)
  {
    v4 = 195;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZM")) & 1) != 0)
  {
    v4 = 236;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ZW")))
  {
    v4 = 237;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
