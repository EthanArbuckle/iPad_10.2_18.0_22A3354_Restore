@implementation RKNLEventTokenizer

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[214];
  _QWORD v9[215];

  v9[214] = *MEMORY[0x24BDAC8D0];
  if (!happyEmojiSet)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("🙆‍♀️"), CFSTR("🙆‍♂️"), CFSTR("😀"), CFSTR("😁"), CFSTR("😂"), CFSTR("😃"), CFSTR("😄"), CFSTR("😅"), CFSTR("😆"), CFSTR("😇"), CFSTR("😉"), CFSTR("😊"), CFSTR("😋"), CFSTR("😌"), CFSTR("😍"), CFSTR("😎"), CFSTR("😏"),
      CFSTR("🤑"),
      CFSTR("🤓"),
      CFSTR("😗"),
      CFSTR("😘"),
      CFSTR("🤗"),
      CFSTR("😙"),
      CFSTR("😚"),
      CFSTR("😛"),
      CFSTR("😜"),
      CFSTR("😝"),
      CFSTR("😬"),
      CFSTR("😸"),
      CFSTR("😹"),
      CFSTR("😺"),
      CFSTR("😻"),
      CFSTR("😽"),
      CFSTR("🙂"),
      CFSTR("🙃"),
      CFSTR("🙆"),
      CFSTR("☺️"),
      CFSTR("✊"),
      0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)happyEmojiSet;
    happyEmojiSet = v2;

  }
  if (!sadEmojiSet)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("🙍‍♀️"), CFSTR("🙍‍♂️"), CFSTR("☹️"), CFSTR("🙎‍♀️"), CFSTR("🙎‍♂️"), CFSTR("😐"), CFSTR("😑"), CFSTR("😒"), CFSTR("😓"), CFSTR("🤒"), CFSTR("😔"), CFSTR("😕"), CFSTR("😖"), CFSTR("🤕"), CFSTR("😞"), CFSTR("😟"), CFSTR("😠"),
      CFSTR("😡"),
      CFSTR("😢"),
      CFSTR("😣"),
      CFSTR("😤"),
      CFSTR("😥"),
      CFSTR("😦"),
      CFSTR("😧"),
      CFSTR("😨"),
      CFSTR("😩"),
      CFSTR("😪"),
      CFSTR("😫"),
      CFSTR("😭"),
      CFSTR("😮"),
      CFSTR("😰"),
      CFSTR("😱"),
      CFSTR("😲"),
      CFSTR("😳"),
      CFSTR("😵"),
      CFSTR("😶"),
      CFSTR("😿"),
      CFSTR("🙀"),
      CFSTR("🙁"),
      CFSTR("🙄"),
      CFSTR("🙍"),
      CFSTR("🙎"),
      CFSTR("🙍‍♂️"),
      CFSTR("☹️"),
      CFSTR("😐"),
      CFSTR("😑"),
      CFSTR("🤒"),
      CFSTR("😔"),
      CFSTR("😕"),
      CFSTR("🤕"),
      CFSTR("😞"),
      CFSTR("😟"),
      CFSTR("😢"),
      CFSTR("😦"),
      CFSTR("😧"),
      CFSTR("😨"),
      CFSTR("😩"),
      CFSTR("😫"),
      CFSTR("😭"),
      0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)sadEmojiSet;
    sadEmojiSet = v4;

  }
  if (!specialCharMapping)
  {
    v8[0] = CFSTR("#");
    v8[1] = CFSTR("$");
    v9[0] = CFSTR("#");
    v9[1] = CFSTR("$");
    v8[2] = CFSTR("%");
    v8[3] = CFSTR("&");
    v9[2] = CFSTR("%");
    v9[3] = CFSTR("&");
    v8[4] = CFSTR("'");
    v8[5] = CFSTR(",");
    v9[4] = CFSTR("'");
    v9[5] = CFSTR(",");
    v8[6] = CFSTR("、");
    v8[7] = CFSTR("-");
    v9[6] = CFSTR(",");
    v9[7] = CFSTR("-");
    v8[8] = CFSTR("‒");
    v8[9] = CFSTR("–");
    v9[8] = kEMDash;
    v9[9] = kEMDash;
    v8[10] = CFSTR("‐");
    v8[11] = CFSTR("‑");
    v9[10] = CFSTR("-");
    v9[11] = CFSTR("-");
    v8[12] = CFSTR("—");
    v8[13] = CFSTR("―");
    v9[12] = kEMDash;
    v9[13] = kEMDash;
    v8[14] = CFSTR("­");
    v8[15] = CFSTR(".");
    v9[14] = CFSTR("-");
    v9[15] = CFSTR(".");
    v8[16] = CFSTR("/");
    v8[17] = CFSTR("0");
    v9[16] = CFSTR("/");
    v9[17] = CFSTR("0");
    v8[18] = CFSTR("1");
    v8[19] = CFSTR("2");
    v9[18] = CFSTR("1");
    v9[19] = CFSTR("2");
    v8[20] = CFSTR("3");
    v8[21] = CFSTR("4");
    v9[20] = CFSTR("3");
    v9[21] = CFSTR("4");
    v8[22] = CFSTR("5");
    v8[23] = CFSTR("6");
    v9[22] = CFSTR("5");
    v9[23] = CFSTR("6");
    v8[24] = CFSTR("7");
    v8[25] = CFSTR("8");
    v9[24] = CFSTR("7");
    v9[25] = CFSTR("8");
    v8[26] = CFSTR("9");
    v8[27] = CFSTR(":");
    v9[26] = CFSTR("9");
    v9[27] = CFSTR(":");
    v8[28] = CFSTR("<");
    v8[29] = CFSTR(">");
    v9[28] = CFSTR("<");
    v9[29] = CFSTR(">");
    v8[30] = CFSTR("?");
    v8[31] = CFSTR("@");
    v9[30] = CFSTR("?");
    v9[31] = CFSTR("@");
    v8[32] = CFSTR("A");
    v8[33] = CFSTR("B");
    v9[32] = CFSTR("A");
    v9[33] = CFSTR("B");
    v8[34] = CFSTR("C");
    v8[35] = CFSTR("D");
    v9[34] = CFSTR("C");
    v9[35] = CFSTR("D");
    v8[36] = CFSTR("E");
    v8[37] = CFSTR("F");
    v9[36] = CFSTR("E");
    v9[37] = CFSTR("F");
    v8[38] = CFSTR("G");
    v8[39] = CFSTR("H");
    v9[38] = CFSTR("G");
    v9[39] = CFSTR("H");
    v8[40] = CFSTR("I");
    v8[41] = CFSTR("J");
    v9[40] = CFSTR("I");
    v9[41] = CFSTR("J");
    v8[42] = CFSTR("K");
    v8[43] = CFSTR("L");
    v9[42] = CFSTR("K");
    v9[43] = CFSTR("L");
    v8[44] = CFSTR("M");
    v8[45] = CFSTR("N");
    v9[44] = CFSTR("M");
    v9[45] = CFSTR("N");
    v8[46] = CFSTR("O");
    v8[47] = CFSTR("P");
    v9[46] = CFSTR("O");
    v9[47] = CFSTR("P");
    v8[48] = CFSTR("Q");
    v8[49] = CFSTR("R");
    v9[48] = CFSTR("Q");
    v9[49] = CFSTR("R");
    v8[50] = CFSTR("S");
    v8[51] = CFSTR("T");
    v9[50] = CFSTR("S");
    v9[51] = CFSTR("T");
    v8[52] = CFSTR("U");
    v8[53] = CFSTR("V");
    v9[52] = CFSTR("U");
    v9[53] = CFSTR("V");
    v8[54] = CFSTR("W");
    v8[55] = CFSTR("X");
    v9[54] = CFSTR("W");
    v9[55] = CFSTR("X");
    v8[56] = CFSTR("Y");
    v8[57] = CFSTR("Z");
    v9[56] = CFSTR("Y");
    v9[57] = CFSTR("Z");
    v8[58] = CFSTR("\\");
    v8[59] = CFSTR("_");
    v9[58] = CFSTR("\\");
    v9[59] = CFSTR("_");
    v8[60] = CFSTR("a");
    v8[61] = CFSTR("b");
    v9[60] = CFSTR("a");
    v9[61] = CFSTR("b");
    v8[62] = CFSTR("c");
    v8[63] = CFSTR("d");
    v9[62] = CFSTR("c");
    v9[63] = CFSTR("d");
    v8[64] = CFSTR("e");
    v9[64] = CFSTR("e");
    v8[65] = CFSTR("f");
    v9[65] = CFSTR("f");
    v8[66] = CFSTR("g");
    v9[66] = CFSTR("g");
    v8[67] = CFSTR("h");
    v9[67] = CFSTR("h");
    v8[68] = CFSTR("i");
    v9[68] = CFSTR("i");
    v8[69] = CFSTR("j");
    v9[69] = CFSTR("j");
    v8[70] = CFSTR("k");
    v9[70] = CFSTR("k");
    v8[71] = CFSTR("l");
    v9[71] = CFSTR("l");
    v8[72] = CFSTR("m");
    v9[72] = CFSTR("m");
    v8[73] = CFSTR("n");
    v9[73] = CFSTR("n");
    v8[74] = CFSTR("o");
    v9[74] = CFSTR("o");
    v8[75] = CFSTR("p");
    v9[75] = CFSTR("p");
    v8[76] = CFSTR("q");
    v9[76] = CFSTR("q");
    v8[77] = CFSTR("r");
    v9[77] = CFSTR("r");
    v8[78] = CFSTR("s");
    v9[78] = CFSTR("s");
    v8[79] = CFSTR("t");
    v9[79] = CFSTR("t");
    v8[80] = CFSTR("u");
    v9[80] = CFSTR("u");
    v8[81] = CFSTR("v");
    v9[81] = CFSTR("v");
    v8[82] = CFSTR("w");
    v9[82] = CFSTR("w");
    v8[83] = CFSTR("x");
    v9[83] = CFSTR("x");
    v8[84] = CFSTR("y");
    v9[84] = CFSTR("y");
    v8[85] = CFSTR("z");
    v9[85] = CFSTR("z");
    v8[86] = CFSTR("¢");
    v9[86] = CFSTR("¢");
    v8[87] = CFSTR("£");
    v9[87] = CFSTR("£");
    v8[88] = CFSTR("¥");
    v9[88] = CFSTR("¥");
    v8[89] = CFSTR("§");
    v9[89] = CFSTR("§");
    v8[90] = CFSTR("°");
    v9[90] = CFSTR("°");
    v8[91] = CFSTR("À");
    v9[91] = CFSTR("À");
    v8[92] = CFSTR("Á");
    v9[92] = CFSTR("Á");
    v8[93] = CFSTR("Â");
    v9[93] = CFSTR("Â");
    v8[94] = CFSTR("Ã");
    v9[94] = CFSTR("Ã");
    v8[95] = CFSTR("Ä");
    v9[95] = CFSTR("Ä");
    v8[96] = CFSTR("Å");
    v9[96] = CFSTR("Å");
    v8[97] = CFSTR("Ç");
    v9[97] = CFSTR("Ç");
    v8[98] = CFSTR("È");
    v9[98] = CFSTR("È");
    v8[99] = CFSTR("É");
    v9[99] = CFSTR("É");
    v8[100] = CFSTR("Ê");
    v9[100] = CFSTR("Ê");
    v8[101] = CFSTR("Ë");
    v9[101] = CFSTR("Ë");
    v8[102] = CFSTR("Ì");
    v9[102] = CFSTR("Ì");
    v8[103] = CFSTR("Í");
    v9[103] = CFSTR("Í");
    v8[104] = CFSTR("Î");
    v9[104] = CFSTR("Î");
    v8[105] = CFSTR("Ï");
    v9[105] = CFSTR("Ï");
    v8[106] = CFSTR("Ñ");
    v9[106] = CFSTR("Ñ");
    v8[107] = CFSTR("Ò");
    v9[107] = CFSTR("Ò");
    v8[108] = CFSTR("Ó");
    v9[108] = CFSTR("Ó");
    v8[109] = CFSTR("Ô");
    v9[109] = CFSTR("Ô");
    v8[110] = CFSTR("Õ");
    v9[110] = CFSTR("Õ");
    v8[111] = CFSTR("Ö");
    v9[111] = CFSTR("Ö");
    v8[112] = CFSTR("Ø");
    v9[112] = CFSTR("Ø");
    v8[113] = CFSTR("Ù");
    v9[113] = CFSTR("Ù");
    v8[114] = CFSTR("Ú");
    v9[114] = CFSTR("Ú");
    v8[115] = CFSTR("Ü");
    v9[115] = CFSTR("Ü");
    v8[116] = CFSTR("ß");
    v9[116] = CFSTR("ß");
    v8[117] = CFSTR("à");
    v9[117] = CFSTR("à");
    v8[118] = CFSTR("á");
    v9[118] = CFSTR("á");
    v8[119] = CFSTR("â");
    v9[119] = CFSTR("â");
    v8[120] = CFSTR("ã");
    v9[120] = CFSTR("ã");
    v8[121] = CFSTR("ä");
    v9[121] = CFSTR("ä");
    v8[122] = CFSTR("å");
    v9[122] = CFSTR("å");
    v8[123] = CFSTR("æ");
    v9[123] = CFSTR("æ");
    v8[124] = CFSTR("ç");
    v9[124] = CFSTR("ç");
    v8[125] = CFSTR("è");
    v9[125] = CFSTR("è");
    v8[126] = CFSTR("é");
    v9[126] = CFSTR("é");
    v8[127] = CFSTR("ê");
    v9[127] = CFSTR("ê");
    v8[128] = CFSTR("ë");
    v9[128] = CFSTR("ë");
    v8[129] = CFSTR("ì");
    v9[129] = CFSTR("ì");
    v8[130] = CFSTR("í");
    v9[130] = CFSTR("í");
    v8[131] = CFSTR("î");
    v9[131] = CFSTR("î");
    v8[132] = CFSTR("ï");
    v9[132] = CFSTR("ï");
    v8[133] = CFSTR("ð");
    v9[133] = CFSTR("ð");
    v8[134] = CFSTR("ñ");
    v9[134] = CFSTR("ñ");
    v8[135] = CFSTR("ò");
    v9[135] = CFSTR("ò");
    v8[136] = CFSTR("ó");
    v9[136] = CFSTR("ó");
    v8[137] = CFSTR("ô");
    v9[137] = CFSTR("ô");
    v8[138] = CFSTR("õ");
    v9[138] = CFSTR("õ");
    v8[139] = CFSTR("ö");
    v9[139] = CFSTR("ö");
    v8[140] = CFSTR("ø");
    v9[140] = CFSTR("ø");
    v8[141] = CFSTR("ù");
    v9[141] = CFSTR("ù");
    v8[142] = CFSTR("ú");
    v9[142] = CFSTR("ú");
    v8[143] = CFSTR("û");
    v9[143] = CFSTR("û");
    v8[144] = CFSTR("ü");
    v9[144] = CFSTR("ü");
    v8[145] = CFSTR("\xFF");
    v9[145] = CFSTR("\xFF");
    v8[146] = CFSTR("∼");
    v9[146] = CFSTR("~");
    v8[147] = CFSTR("’");
    v9[147] = CFSTR("'");
    v8[148] = CFSTR("ʼ");
    v9[148] = CFSTR("'");
    v8[149] = CFSTR("Ⅱ");
    v9[149] = CFSTR("II");
    v8[150] = CFSTR("Ⅲ");
    v9[150] = CFSTR("III");
    v8[151] = CFSTR("ƒ");
    v9[151] = CFSTR("f");
    v8[152] = CFSTR("ﬁ");
    v9[152] = CFSTR("fi");
    v8[153] = CFSTR("ı");
    v9[153] = CFSTR("i");
    v8[154] = CFSTR("ẞ");
    v9[154] = CFSTR("s");
    v8[155] = CFSTR("ſ");
    v9[155] = CFSTR("s");
    v8[156] = CFSTR("Ć");
    v9[156] = CFSTR("Ć");
    v8[157] = CFSTR("Ė");
    v9[157] = CFSTR("Ė");
    v8[158] = CFSTR("ė");
    v9[158] = CFSTR("ė");
    v8[159] = CFSTR("ě");
    v9[159] = CFSTR("ě");
    v8[160] = CFSTR("Ķ");
    v9[160] = CFSTR("Ķ");
    v8[161] = CFSTR("ń");
    v9[161] = CFSTR("ń");
    v8[162] = CFSTR("ş");
    v9[162] = CFSTR("ş");
    v8[163] = CFSTR("ż");
    v9[163] = CFSTR("ż");
    v8[164] = CFSTR("ą");
    v9[164] = CFSTR("ą");
    v8[165] = CFSTR("ž");
    v9[165] = CFSTR("ž");
    v8[166] = CFSTR("ś");
    v9[166] = CFSTR("ś");
    v8[167] = CFSTR("ā");
    v9[167] = CFSTR("ā");
    v8[168] = CFSTR("ę");
    v9[168] = CFSTR("ę");
    v8[169] = CFSTR("ğ");
    v9[169] = CFSTR("ğ");
    v8[170] = CFSTR("ř");
    v9[170] = CFSTR("ř");
    v8[171] = CFSTR("Š");
    v9[171] = CFSTR("Š");
    v8[172] = CFSTR("Ż");
    v9[172] = CFSTR("Ż");
    v8[173] = CFSTR("€");
    v9[173] = CFSTR("€");
    v8[174] = CFSTR("Ÿ");
    v9[174] = CFSTR("Ÿ");
    v8[175] = CFSTR("ć");
    v9[175] = CFSTR("ć");
    v8[176] = CFSTR("ī");
    v9[176] = CFSTR("ī");
    v8[177] = CFSTR("ň");
    v9[177] = CFSTR("ň");
    v8[178] = CFSTR("ů");
    v9[178] = CFSTR("ů");
    v8[179] = CFSTR("Œ");
    v9[179] = CFSTR("Œ");
    v8[180] = CFSTR("š");
    v9[180] = CFSTR("š");
    v8[181] = CFSTR("č");
    v9[181] = CFSTR("č");
    v8[182] = CFSTR("ō");
    v9[182] = CFSTR("ō");
    v8[183] = CFSTR("ņ");
    v9[183] = CFSTR("ņ");
    v8[184] = CFSTR("œ");
    v9[184] = CFSTR("œ");
    v8[185] = CFSTR("😁");
    v9[185] = CFSTR("😁");
    v8[186] = CFSTR("😂");
    v9[186] = CFSTR("😂");
    v8[187] = CFSTR("😉");
    v9[187] = CFSTR("😉");
    v8[188] = CFSTR("😊");
    v9[188] = CFSTR("😊");
    v8[189] = CFSTR("👍");
    v9[189] = CFSTR("👍");
    v8[190] = CFSTR("😍");
    v9[190] = CFSTR("😍");
    v8[191] = CFSTR("☺");
    v9[191] = CFSTR("😊");
    v8[192] = CFSTR("😄");
    v9[192] = CFSTR("😄");
    v8[193] = CFSTR("😘");
    v9[193] = CFSTR("😘");
    v8[194] = CFSTR("😱");
    v9[194] = CFSTR("😱");
    v8[195] = CFSTR("👌");
    v9[195] = CFSTR("👌");
    v8[196] = CFSTR("😎");
    v9[196] = CFSTR("😎");
    v8[197] = CFSTR("😡");
    v9[197] = CFSTR("😡");
    v8[198] = CFSTR("❤");
    v9[198] = CFSTR("❤");
    v8[199] = CFSTR("😬");
    v9[199] = CFSTR("😬");
    v8[200] = CFSTR("😃");
    v9[200] = CFSTR("😃");
    v8[201] = CFSTR("😏");
    v9[201] = CFSTR("😏");
    v8[202] = CFSTR("😝");
    v9[202] = CFSTR("😝");
    v8[203] = CFSTR("😩");
    v9[203] = CFSTR("😩");
    v8[204] = CFSTR("😳");
    v9[204] = CFSTR("😳");
    v8[205] = CFSTR("🍸");
    v9[205] = CFSTR("🍸");
    v8[206] = CFSTR("✨");
    v9[206] = CFSTR("✨");
    v8[207] = CFSTR("😜");
    v9[207] = CFSTR("😜");
    v8[208] = CFSTR("😀");
    v9[208] = CFSTR("😀");
    v8[209] = CFSTR("🍷");
    v9[209] = CFSTR("🍷");
    v8[210] = CFSTR("😭");
    v9[210] = CFSTR("😭");
    v8[211] = CFSTR("☹");
    v9[211] = CFSTR("😭");
    v8[212] = CFSTR("👎");
    v9[212] = CFSTR("👎");
    v8[213] = CFSTR("à");
    v9[213] = CFSTR("à");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 214);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)specialCharMapping;
    specialCharMapping = v6;

  }
  if (!emoticonCategoryDict)
  {
    emoticonCategoryDict = (uint64_t)&unk_24C7194A0;

  }
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)RKNLEventTokenizer;
  -[RKNLEventTokenizer dealloc](&v4, sel_dealloc);
}

- (RKNLEventTokenizer)initWithLanguageID:(id)a3
{
  id v5;
  RKNLEventTokenizer *v6;
  RKNLEventTokenizer *v7;
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFLocale *v9;
  const __CFAllocator *v10;
  objc_super v12;
  CFRange v13;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RKNLEventTokenizer;
  v6 = -[RKNLEventTokenizer init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_languageID, a3);
    CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(0, (CFStringRef)v7->_languageID);
    v9 = CFLocaleCreate(0, CanonicalLocaleIdentifierFromString);
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v13.length = CFStringGetLength(CFSTR("init"));
    v13.location = 0;
    v7->_tokenizer = CFStringTokenizerCreate(v10, CFSTR("init"), v13, 4uLL, v9);
    CFRelease(CanonicalLocaleIdentifierFromString);
    CFRelease(v9);
  }

  return v7;
}

+ (BOOL)isSpecialToken:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DATE_TIME")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENCY")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DIGIT_STRG")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMOTICON_HAPPY")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMOTICON_PERTURBED")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMOTICONHAPPY")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("EMOTICONPERTURBED")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("DATETIME")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("DIGITSTRG"));
  }

  return v4;
}

- (id)tokenizeWithDataDetectors:(id)a3
{
  id v3;
  id v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  unint64_t v8;
  CFIndex v9;
  const __CFString *v10;
  const void *v11;
  int v12;
  const void *Type;
  unint64_t Range;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFArray *v18;
  CFIndex v19;
  id v20;
  void *v21;
  RKNLEventToken *v22;
  RKNLEventToken *v23;
  void *v24;
  RKNLEventToken *v25;
  CFTypeRef v27;
  CFTypeRef v28;
  CFTypeRef v29;
  CFTypeRef v30;
  CFTypeRef cf2;
  CFTypeRef v32;
  const __CFString *v33;
  _QWORD block[5];
  _QWORD v35[4];

  v3 = a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__RKNLEventTokenizer_tokenizeWithDataDetectors___block_invoke;
  block[3] = &unk_24C6AF080;
  block[4] = v35;
  if (tokenizeWithDataDetectors__onceToken != -1)
    dispatch_once(&tokenizeWithDataDetectors__onceToken, block);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (tokenizeWithDataDetectors__scanner
    && DDScannerScanString()
    && (v5 = (const __CFArray *)DDScannerCopyResultsWithOptions(), (v6 = v5) != 0))
  {
    Count = CFArrayGetCount(v5);
    if (Count >= 1)
    {
      v8 = 0;
      v9 = 0;
      v32 = (CFTypeRef)*MEMORY[0x24BE2B1D8];
      v30 = (CFTypeRef)*MEMORY[0x24BE2B1E0];
      v29 = (CFTypeRef)*MEMORY[0x24BE2B228];
      v28 = (CFTypeRef)*MEMORY[0x24BE2B1D0];
      v27 = (CFTypeRef)*MEMORY[0x24BE2B220];
      cf2 = (CFTypeRef)*MEMORY[0x24BE2B238];
      while (2)
      {
        CFArrayGetValueAtIndex(v6, v9);
        v10 = CFSTR("URL");
        switch(DDResultGetCategory())
        {
          case 1u:
            goto LABEL_18;
          case 2u:
            v10 = CFSTR("PHONE");
            goto LABEL_18;
          case 3u:
            v10 = CFSTR("ADDRESS");
            goto LABEL_18;
          case 4u:
            Type = (const void *)DDResultGetType();
            v10 = CFSTR("DATETIME");
            if (CFEqual(Type, v32) || CFEqual(Type, v30) || CFEqual(Type, v29) || CFEqual(Type, v28))
              goto LABEL_18;
            v12 = CFEqual(Type, v27);
LABEL_11:
            if (v12)
            {
LABEL_18:
              Range = DDResultGetRange();
              v15 = Range;
              v17 = v16;
              if (Range > v8)
              {
                v33 = v10;
                v18 = v6;
                v19 = Count;
                v20 = v3;
                objc_msgSend(v3, "substringWithRange:", v8, Range - v8);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v21, v8, objc_msgSend(v21, "length"));
                objc_msgSend(v4, "addObject:", v22);

                v3 = v20;
                Count = v19;
                v6 = v18;
                v10 = v33;
              }
              v23 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v10, v15, v17);
              objc_msgSend(v4, "addObject:", v23);

              v8 = v15 + v17;
            }
            if (Count == ++v9)
              goto LABEL_26;
            continue;
          default:
            v11 = (const void *)DDResultGetType();
            v12 = CFEqual(v11, cf2);
            v10 = CFSTR("DATETIME");
            goto LABEL_11;
        }
      }
    }
    v8 = 0;
LABEL_26:
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  if (v8 < objc_msgSend(v3, "length", v27))
  {
    objc_msgSend(v3, "substringWithRange:", v8, objc_msgSend(v3, "length") - v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v24, v8, objc_msgSend(v3, "length") - v8);
    objc_msgSend(v4, "addObject:", v25);

  }
  _Block_object_dispose(v35, 8);

  return v4;
}

uint64_t __48__RKNLEventTokenizer_tokenizeWithDataDetectors___block_invoke()
{
  uint64_t result;

  result = DDScannerCreateWithType();
  tokenizeWithDataDetectors__scanner = result;
  return result;
}

- (BOOL)hasEmoticon:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)emoticonCategoryDict;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)processForEmoticonsAndEmojis:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  unint64_t v11;
  void *v12;
  RKNLEventTokenizer *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  RKNLEventToken *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  RKNLEventToken *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  id obj;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, unint64_t, uint64_t);
  void *v42;
  __CFString *v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v4;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v56 != v33)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v7, "string");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v52 = &v51;
        v53 = 0x2020000000;
        v54 = 0;
        v54 = objc_msgSend(v7, "location");
        if (CEMStringContainsEmoji())
        {
          CFStringGetLength(v8);
          v47 = 0;
          v48 = &v47;
          v49 = 0x2020000000;
          v50 = 0;
          v39 = MEMORY[0x24BDAC760];
          v40 = 3221225472;
          v41 = __51__RKNLEventTokenizer_processForEmoticonsAndEmojis___block_invoke;
          v42 = &unk_24C6AF0A8;
          v45 = &v47;
          v9 = v8;
          v43 = v9;
          v10 = v5;
          v44 = v10;
          v46 = &v51;
          CEMEnumerateEmojiTokensInStringWithBlock();
          v11 = v48[3];
          if (v11 < -[__CFString length](v9, "length"))
          {
            v12 = v5;
            v13 = self;
            v14 = v48[3];
            v15 = -[__CFString length](v9, "length");
            -[__CFString substringWithRange:](v9, "substringWithRange:", v14, v15 - v48[3]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = [RKNLEventToken alloc];
            v18 = v52[3];
            v19 = v48[3];
            v20 = -[__CFString length](v9, "length");
            v21 = -[RKNLEventToken initWithString:location:length:](v17, "initWithString:location:length:", v16, v19 + v18, v20 - v48[3]);
            objc_msgSend(v10, "addObject:", v21);

            self = v13;
            v5 = v12;

          }
          _Block_object_dispose(&v47, 8);
        }
        else
        {
          objc_msgSend(v5, "addObject:", v7);
        }
        _Block_object_dispose(&v51, 8);

      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v34);
  }

  v22 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v27, "string");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[RKNLEventTokenizer hasEmoticon:](self, "hasEmoticon:", v28);

        if (v29)
        {
          -[RKNLEventTokenizer processForEmoticons:](self, "processForEmoticons:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v30);

        }
        else
        {
          objc_msgSend(v22, "addObject:", v27);
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v59, 16);
    }
    while (v24);
  }

  return v22;
}

void __51__RKNLEventTokenizer_processForEmoticonsAndEmojis___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  RKNLEventToken *v11;
  void *v12;
  RKNLEventToken *v13;
  __CFString *v14;

  CEMEmojiTokenGetString();
  v14 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)specialCharMapping, "objectForKeyedSubscript:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (!v7)
  {
    if ((objc_msgSend((id)happyEmojiSet, "containsObject:") & 1) != 0)
    {
      v8 = CFSTR("EMOTICONHAPPY");
    }
    else if ((objc_msgSend((id)sadEmojiSet, "containsObject:", v14) & 1) != 0)
    {
      v8 = CFSTR("EMOTICONPERTURBED");
    }
    else
    {
      v8 = (__CFString *)(id)kEmojiPlaceholder;
    }

  }
  if (a3 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    v11 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)+ *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), objc_msgSend(v9, "length"));
    objc_msgSend(v10, "addObject:", v11);

  }
  v12 = *(void **)(a1 + 40);
  v13 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + a3, a4);
  objc_msgSend(v12, "addObject:", v13);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + a4;
}

- (id)transform:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  CFIndex Length;
  id v9;
  CFIndex v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __CFString *v24;
  _BOOL4 v25;
  RKNLEventToken *v26;
  uint64_t v27;
  RKNLEventToken *v28;
  void *v29;
  RKNLEventTokenizer *v31;
  id obj;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CFRange RangeOfComposedCharactersAtIndex;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v31 = self;
  v39 = -[NSString isEqualToString:](self->_languageID, "isEqualToString:", CFSTR("ja"))
     || -[NSString isEqualToString:](self->_languageID, "isEqualToString:", CFSTR("zh-Hans"))
     || -[NSString isEqualToString:](self->_languageID, "isEqualToString:", CFSTR("zh-Hant"));
  v33 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v43;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v38 = v5;
        v6 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v5);
        objc_msgSend(v6, "string");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v36 = v6;
        v37 = objc_msgSend(v6, "location");
        v40 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        Length = CFStringGetLength(v7);
        v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        if (Length >= 1)
        {
          v41 = 0;
          v10 = 0;
          v11 = &stru_24C6B9E08;
          while (1)
          {
            RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v7, v10);
            v12 = (id)CFStringCreateWithSubstring(0, v7, RangeOfComposedCharactersAtIndex);
            objc_msgSend((id)specialCharMapping, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              v15 = v13;
            }
            else
            {
              v16 = v12;
              if (v39)
                goto LABEL_18;
              v16 = v12;
              if ((-[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR(" ")) & 1) != 0)
                goto LABEL_18;
              v15 = CFSTR(" ");
              v16 = v12;
              if ((objc_msgSend((id)kAllowedPunctuations, "containsString:", v12) & 1) != 0)
                goto LABEL_18;
            }

            v16 = (__CFString *)v15;
LABEL_18:
            objc_msgSend(v9, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = v17;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v9, "setObject:forKey:", v19, v16);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKey:", v20, v16);

              v19 = 0;
            }
            if (-[__CFString isEqualToString:](v11, "isEqualToString:", v16))
            {
              if (CEMStringContainsEmoji()
                || (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("?")) & 1) != 0
                || (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR(":")) & 1) != 0
                || (v21 = objc_msgSend(v19, "integerValue"), v21 >= kMaxCharRepetitionAllowed))
              {
                v22 = objc_msgSend(v19, "integerValue");
                v23 = v41;
                if (v22 >= kMaxCharRepetitionAllowed)
                  v23 = v41 + 1;
                v41 = v23;
                goto LABEL_31;
              }
            }
            else
            {
              objc_msgSend(v9, "removeAllObjects");
            }
            objc_msgSend(v40, "appendString:", v16);
LABEL_31:
            Length -= CFStringGetLength(v12);
            v10 += CFStringGetLength(v12);
            v24 = v16;

            CFRelease(v12);
            v11 = v24;
            if (Length <= 0)
              goto LABEL_34;
          }
        }
        v41 = 0;
        v24 = &stru_24C6B9E08;
LABEL_34:
        if (objc_msgSend(v40, "length"))
        {
          v25 = +[RKNLEventTokenizer isSpecialToken:](RKNLEventTokenizer, "isSpecialToken:", v40);
          v26 = [RKNLEventToken alloc];
          if (v25)
            v27 = objc_msgSend(v36, "length");
          else
            v27 = objc_msgSend(v40, "length") + v41;
          v28 = -[RKNLEventToken initWithString:location:length:](v26, "initWithString:location:length:", v40, v37, v27);
          objc_msgSend(v33, "addObject:", v28);

        }
        v5 = v38 + 1;
      }
      while (v38 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v35);
  }

  -[RKNLEventTokenizer processForHyphenation:](v31, "processForHyphenation:", v33);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)processForEmoticons:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  unint64_t v8;
  unint64_t Length;
  id v10;
  void *v11;
  CFIndex v12;
  CFRange RangeOfComposedCharactersAtIndex;
  const __CFString *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  RKNLEventToken *v25;
  RKNLEventToken *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  RKNLEventToken *v32;
  unint64_t v33;
  void *v34;
  RKNLEventToken *v35;
  unint64_t v37;
  const __CFString *v38;
  void *v39;
  id v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;

  v3 = a3;
  v40 = (id)objc_opt_new();
  v41 = v3;
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_24C6B9E08, "stringByPaddingToLength:withString:startingAtIndex:", kMaxCharToConsiderForEmoticonDetection, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const __CFString *)objc_msgSend(v4, "stringByAppendingString:", v5);

  v7 = v6;
  v8 = 0x2549B1000uLL;
  Length = CFStringGetLength(v6);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = v10;
  v43 = 0;
  if (Length > kMinCharToConsiderForEmoticonDetection)
  {
    v43 = 0;
    v12 = 0;
    v38 = v7;
    v39 = v10;
    do
    {
      RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex(v7, v12);
      v14 = CFStringCreateWithSubstring(0, v7, RangeOfComposedCharactersAtIndex);
      objc_msgSend(v11, "addObject:", v14);
      if ((unint64_t)objc_msgSend(v11, "count") > *(_QWORD *)(v8 + 2552))
        objc_msgSend(v11, "removeObjectAtIndex:", 0);
      objc_msgSend(v11, "componentsJoinedByString:", &stru_24C6B9E08);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");
      v17 = *(_QWORD *)(v8 + 2552);
      if (v16 <= v17)
        v17 = objc_msgSend(v15, "length");
      if (v17 >= kMinCharToConsiderForEmoticonDetection)
      {
        v18 = v17;
        while (1)
        {
          objc_msgSend(v15, "substringWithRange:", 0, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)emoticonCategoryDict, "objectForKey:", v19);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
            break;

          if (--v18 < kMinCharToConsiderForEmoticonDetection)
          {
            v11 = v39;
            goto LABEL_15;
          }
        }
        v21 = (void *)v20;
        v22 = RangeOfComposedCharactersAtIndex.location - v17 + 1;
        v42 = v22;
        if (v22 > v43)
        {
          v37 = v22 - v43;
          objc_msgSend(v41, "string");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "substringWithRange:", v43, v37);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v24, objc_msgSend(v41, "location") + v43, objc_msgSend(v24, "length"));
          objc_msgSend(v40, "addObject:", v25);

          v22 = v42;
        }
        v26 = -[RKNLEventToken initWithString:location:length:]([RKNLEventToken alloc], "initWithString:location:length:", v21, objc_msgSend(v41, "location") + v22, objc_msgSend(v19, "length"));
        objc_msgSend(v40, "addObject:", v26);

        v43 = objc_msgSend(v19, "length") + v42;
        objc_msgSend(v39, "removeObjectsInRange:", 0, v18);

        v11 = v39;
LABEL_15:
        v8 = 0x2549B1000;
        v7 = v38;
      }
      Length -= CFStringGetLength(v14);
      v12 += CFStringGetLength(v14);
      CFRelease(v14);

    }
    while (Length > kMinCharToConsiderForEmoticonDetection);
  }
  objc_msgSend(v41, "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v43 < v28)
  {
    objc_msgSend(v41, "string");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "string");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "substringWithRange:", v43, objc_msgSend(v30, "length") - v43);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = [RKNLEventToken alloc];
    v33 = objc_msgSend(v41, "location") + v43;
    objc_msgSend(v41, "string");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[RKNLEventToken initWithString:location:length:](v32, "initWithString:location:length:", v31, v33, objc_msgSend(v34, "length") - v43);
    objc_msgSend(v40, "addObject:", v35);

  }
  return v40;
}

- (id)processForHyphenation:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;

  v3 = a3;
  v20 = (id)objc_opt_new();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v19 = v3;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4, v19);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "string");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if (objc_msgSend(v7, "count"))
      {
        v9 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("-")))
            v11 = v9 == 0;
          else
            v11 = 1;
          if (!v11
            || objc_msgSend(v10, "containsString:", CFSTR("-"))
            && v9
            && objc_msgSend(v10, "hasPrefix:", CFSTR("-")))
          {
            objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), kEMDash);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
            v14 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v14;
          }
          objc_msgSend(v8, "addObject:", v10);

          ++v9;
        }
        while (v9 < objc_msgSend(v7, "count"));
      }
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v19;
      objc_msgSend(v19, "objectAtIndexedSubscript:", v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setString:", v15);

      objc_msgSend(v19, "objectAtIndexedSubscript:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v17);

      ++v4;
    }
    while (v4 < objc_msgSend(v19, "count"));
  }

  return v20;
}

- (id)getTokens:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  const __CFAllocator *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFStringTokenizer *v15;
  CFRange CurrentTokenRange;
  __CFString *v17;
  __CFString *MutableCopy;
  void *v19;
  int v20;
  void *v21;
  char v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v36;
  id obj;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CFRange v49;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (getTokens__onceToken != -1)
    dispatch_once(&getTokens__onceToken, &__block_literal_global_1);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v5)
  {
    v6 = 0;
    v40 = *(_QWORD *)v44;
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v42 = &stru_24C6B9E08;
    while (1)
    {
      v8 = 0;
      v41 = v5;
      do
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
        objc_msgSend(v9, "string");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!+[RKNLEventTokenizer isSpecialToken:](RKNLEventTokenizer, "isSpecialToken:", v10))
        {
          v38 = v6;
          v15 = -[RKNLEventTokenizer tokenizer](self, "tokenizer");
          v49.length = CFStringGetLength(v10);
          v49.location = 0;
          CFStringTokenizerSetString(v15, v10, v49);
          if (!CFStringTokenizerAdvanceToNextToken(-[RKNLEventTokenizer tokenizer](self, "tokenizer")))
          {
LABEL_37:
            v32 = objc_msgSend(v9, "location");
            v6 = objc_msgSend(v9, "length") + v32;
            goto LABEL_40;
          }
          v39 = v9;
          while (2)
          {
            CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(-[RKNLEventTokenizer tokenizer](self, "tokenizer"));
            -[__CFString substringWithRange:](v10, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            MutableCopy = CFStringCreateMutableCopy(v7, 0, v17);
            CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);

            if ((-[__CFString isEqualToString:](MutableCopy, "isEqualToString:", CFSTR(" ")) & 1) == 0
              && (-[__CFString isEqualToString:](MutableCopy, "isEqualToString:", CFSTR("\n")) & 1) == 0
              && (-[__CFString isEqualToString:](MutableCopy, "isEqualToString:", CFSTR(" ")) & 1) == 0)
            {
              -[__CFString stringByTrimmingCharactersInSet:](MutableCopy, "stringByTrimmingCharactersInSet:", getTokens__symbolsAndPunctuationSet);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", &stru_24C6B9E08);

              if (v20
                && (-[__CFString stringByTrimmingCharactersInSet:](MutableCopy, "stringByTrimmingCharactersInSet:", getTokens__allowedPunctuationSet), v21 = (void *)objc_claimAutoreleasedReturnValue(), v22 = objc_msgSend(v21, "isEqualToString:", &stru_24C6B9E08), v21, (v22 & 1) == 0))
              {
                v24 = MutableCopy;
                MutableCopy = v24;
                v23 = v42;
LABEL_27:
                v42 = v24;
              }
              else
              {
                v23 = v42;
                if (-[__CFString isEqualToString:](v42, "isEqualToString:", CFSTR("?"))
                  && -[__CFString isEqualToString:](MutableCopy, "isEqualToString:", CFSTR("?"))
                  || CEMStringContainsEmoji()
                  && -[__CFString isEqualToString:](v42, "isEqualToString:", MutableCopy))
                {
                  v24 = MutableCopy;
                  MutableCopy = v24;
                  goto LABEL_27;
                }
                v25 = -[__CFString rangeOfCharacterFromSet:](MutableCopy, "rangeOfCharacterFromSet:", getTokens__nonDigitCommaPeriodSet);
                v23 = (void *)objc_opt_new();
                if (v25 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v26 = v42;
                  if (!-[__CFString isEqualToString:](v42, "isEqualToString:", CFSTR("DIGIT_STRG")))
                  {
                    v27 = v23;
                    v28 = CFSTR("DIGIT_STRG");
                    goto LABEL_33;
                  }
LABEL_31:
                  MutableCopy = MutableCopy;

                  v42 = MutableCopy;
                }
                else
                {
                  -[__CFString stringByReplacingOccurrencesOfString:withString:](MutableCopy, "stringByReplacingOccurrencesOfString:withString:", CFSTR("DATETIME"), CFSTR("DATE_TIME"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("EMOTICONHAPPY"), CFSTR("EMOTICON_HAPPY"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v30, "stringByReplacingOccurrencesOfString:withString:", CFSTR("EMOTICONPERTURBED"), CFSTR("EMOTICON_PERTURBED"));
                  MutableCopy = (__CFString *)objc_claimAutoreleasedReturnValue();

                  v26 = v42;
                  if ((+[RKNLEventTokenizer isSpecialToken:](RKNLEventTokenizer, "isSpecialToken:", MutableCopy)|| objc_msgSend((id)kAllowedPunctuations, "containsString:", MutableCopy))&& -[__CFString isEqualToString:](v42, "isEqualToString:", MutableCopy))
                  {
                    goto LABEL_31;
                  }
                  v27 = v23;
                  v28 = MutableCopy;
LABEL_33:
                  objc_msgSend(v27, "setString:", v28);
                  objc_msgSend(v23, "string");
                  v31 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v23, "setLocation:", CurrentTokenRange.location + v38);
                  objc_msgSend(v23, "setLength:", CurrentTokenRange.length);
                  objc_msgSend(v36, "addObject:", v23);
                  v42 = (__CFString *)v31;
                }
                v9 = v39;
              }

            }
            if (!CFStringTokenizerAdvanceToNextToken(-[RKNLEventTokenizer tokenizer](self, "tokenizer")))
              goto LABEL_37;
            continue;
          }
        }
        -[__CFString stringByReplacingOccurrencesOfString:withString:](v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("DATETIME"), CFSTR("DATE_TIME"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("EMOTICONHAPPY"), CFSTR("EMOTICON_HAPPY"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("EMOTICONPERTURBED"), CFSTR("EMOTICON_PERTURBED"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isEqualToString:", v42))
        {
          v10 = v13;

          v14 = objc_msgSend(v9, "location");
          v6 = objc_msgSend(v9, "length") + v14;
        }
        else
        {
          v33 = (void *)objc_opt_new();
          objc_msgSend(v33, "setString:", v13);
          objc_msgSend(v33, "setLocation:", objc_msgSend(v9, "location"));
          objc_msgSend(v33, "setLength:", objc_msgSend(v9, "length"));
          objc_msgSend(v36, "addObject:", v33);
          v10 = v13;

          v34 = objc_msgSend(v9, "location");
          v6 = objc_msgSend(v9, "length") + v34;

        }
        v42 = v10;
LABEL_40:

        ++v8;
      }
      while (v8 != v41);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (!v5)
        goto LABEL_44;
    }
  }
  v42 = &stru_24C6B9E08;
LABEL_44:

  return v36;
}

void __32__RKNLEventTokenizer_getTokens___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", kAllowedPunctuations);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)getTokens__allowedPunctuationSet;
  getTokens__allowedPunctuationSet = v0;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = (void *)getTokens__symbolsAndPunctuationSet;
  getTokens__symbolsAndPunctuationSet = v3;

  v5 = (void *)getTokens__symbolsAndPunctuationSet;
  objc_msgSend(MEMORY[0x24BDD14A8], "symbolCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v10, "addCharactersInString:", CFSTR(",."));
  objc_msgSend(v10, "invertedSet");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)getTokens__nonDigitCommaPeriodSet;
  getTokens__nonDigitCommaPeriodSet = v8;

}

- (id)buildTokenSquence:(id)a3 withOffset:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  -[RKNLEventTokenizer tokenizeWithDataDetectors:](self, "tokenizeWithDataDetectors:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKNLEventTokenizer processForEmoticonsAndEmojis:](self, "processForEmoticonsAndEmojis:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKNLEventTokenizer transform:](self, "transform:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKNLEventTokenizer getTokens:](self, "getTokens:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLocation:", objc_msgSend(v11, "location") + a4);

      ++v10;
    }
    while (objc_msgSend(v9, "count") > v10);
  }

  return v9;
}

- (NSString)languageID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(__CFStringTokenizer *)a3
{
  self->_tokenizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageID, 0);
}

@end
