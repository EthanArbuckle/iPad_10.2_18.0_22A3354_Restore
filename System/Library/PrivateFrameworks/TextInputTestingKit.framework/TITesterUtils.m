@implementation TITesterUtils

+ (id)decomposeDiphthong:(unsigned __int16)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  unsigned __int16 v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("ㅘㅙㅚㅝㅞㅟㅢ"), "rangeOfString:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(&unk_24FD5FC48, "objectAtIndex:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)decomposeDoublePatchim:(unsigned __int16)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  unsigned __int16 v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("ㄳㄵㄶㄺㄻㄼㄽㄾㄿㅀㅄ"), "rangeOfString:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(&unk_24FD5FC60, "objectAtIndex:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)decomposeHangul:(unsigned __int16)a3
{
  void *v3;
  uint64_t v5;
  unsigned __int16 v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  unsigned __int16 v14;

  v14 = a3;
  if ((a3 - 12623) <= 0x14)
  {
    +[TITesterUtils decomposeDiphthong:](TITesterUtils, "decomposeDiphthong:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if ((unsigned __int16)(a3 + 10332) <= 0xD45Bu)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v14, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v5 = (unsigned __int16)(a3 + 21504) / 0x24Cu;
  v6 = (unsigned __int16)(a3 + 21504) % 0x24Cu;
  v7 = v6 / 0x1Cu;
  v8 = v6 % 0x1Cu;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(CFSTR("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ"), "characterAtIndex:", v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  +[TITesterUtils decomposeDiphthong:](TITesterUtils, "decomposeDiphthong:", objc_msgSend(CFSTR("ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ"), "characterAtIndex:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v11);
  if (v8)
  {
    +[TITesterUtils decomposeDoublePatchim:](TITesterUtils, "decomposeDoublePatchim:", objc_msgSend(CFSTR("ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ"), "characterAtIndex:", v8 - 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v12);

  }
  return v9;
}

+ (id)decomposeHangulSequence:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "length");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      +[TITesterUtils decomposeHangul:](TITesterUtils, "decomposeHangul:", objc_msgSend(v3, "characterAtIndex:", i));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendString:", v8);

    }
  }

  return v4;
}

@end
