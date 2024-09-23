@implementation MusicStringContainsCJKScripts

void __MusicStringContainsCJKScripts_block_invoke(id a1)
{
  id v1;
  id v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  HIDWORD(v5) = 0;
  v1 = objc_msgSend(CFSTR("[^[[:Hani:][:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙]]]"), "length");
  v2 = objc_msgSend(CFSTR("[^[[:Hani:][:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙]]]"), "_fastCharacterContents");
  if (v2)
  {
    MusicStringContainsCJKScripts_sNonCJKCharacterSet = uset_openPattern(v2, v1, (char *)&v5 + 4);
  }
  else
  {
    __chkstk_darwin(0);
    v4 = (char *)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    objc_msgSend(CFSTR("[^[[:Hani:][:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙]]]"), "getCharacters:range:", v4, 0, v1);
    MusicStringContainsCJKScripts_sNonCJKCharacterSet = uset_openPattern(v4, v1, (char *)&v5 + 4);
  }
  if (SHIDWORD(v5) >= 1)
  {
    NSLog(CFSTR("Couldn’t create USet from pattern %@"), CFSTR("[^[[:Hani:][:Hiragana:][:Katakana:][:Katakana_Or_Hiragana:][:Bopomofo:][:Hangul:][ˉˊˇˋ˙]]]"));
    MusicStringContainsCJKScripts_sNonCJKCharacterSet = 0;
  }
}

@end
