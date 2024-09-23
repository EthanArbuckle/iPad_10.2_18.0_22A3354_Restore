@implementation IMLanguageUtilities

+ (id)suffixForLanguage:(id)a3
{
  id v4;
  const __CFString *v5;

  v4 = a3;
  v5 = &stru_296430;
  if (objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(a1, "languageIsTraditionalChinese:", v4) & 1) != 0)
    {
      v5 = CFSTR("zh_tw");
    }
    else if ((objc_msgSend(a1, "languageIsSimplifiedChinese:", v4) & 1) != 0)
    {
      v5 = CFSTR("zh_cn");
    }
    else if ((objc_msgSend(a1, "languageIsHongKongChinese:", v4) & 1) != 0)
    {
      v5 = CFSTR("zh_hk");
    }
    else if ((objc_msgSend(a1, "languageIsJapanese:", v4) & 1) != 0)
    {
      v5 = CFSTR("ja");
    }
    else if ((objc_msgSend(a1, "languageIsKorean:", v4) & 1) != 0)
    {
      v5 = CFSTR("ko");
    }
    else if ((objc_msgSend(a1, "languageIsArabic:", v4) & 1) != 0)
    {
      v5 = CFSTR("ar");
    }
    else if ((objc_msgSend(a1, "languageIsHebrew:", v4) & 1) != 0)
    {
      v5 = CFSTR("he");
    }
    else if ((objc_msgSend(a1, "languageIsDevanagari:", v4) & 1) != 0)
    {
      v5 = CFSTR("hi");
    }
    else if ((objc_msgSend(a1, "languageIsGurmukhi:", v4) & 1) != 0)
    {
      v5 = CFSTR("pa");
    }
    else if ((objc_msgSend(a1, "languageIsGujarati:", v4) & 1) != 0)
    {
      v5 = CFSTR("gu");
    }
    else if ((objc_msgSend(a1, "languageIsTamil:", v4) & 1) != 0)
    {
      v5 = CFSTR("ta");
    }
    else if ((objc_msgSend(a1, "languageIsTelugu:", v4) & 1) != 0)
    {
      v5 = CFSTR("te");
    }
    else if ((objc_msgSend(a1, "languageIsMalayalam:", v4) & 1) != 0)
    {
      v5 = CFSTR("ml");
    }
    else if ((objc_msgSend(a1, "languageIsSinhala:", v4) & 1) != 0)
    {
      v5 = CFSTR("si");
    }
    else if ((objc_msgSend(a1, "languageIsOriya:", v4) & 1) != 0)
    {
      v5 = CFSTR("or");
    }
    else if ((objc_msgSend(a1, "languageIsKannada:", v4) & 1) != 0)
    {
      v5 = CFSTR("kn");
    }
    else if ((objc_msgSend(a1, "languageIsBengali:", v4) & 1) != 0)
    {
      v5 = CFSTR("bn");
    }
    else if ((objc_msgSend(a1, "languageIsThai:", v4) & 1) != 0)
    {
      v5 = CFSTR("th");
    }
    else if ((objc_msgSend(a1, "languageIsTibetan:", v4) & 1) != 0)
    {
      v5 = CFSTR("bo");
    }
    else if (objc_msgSend(a1, "languageIsInuktitut:", v4))
    {
      v5 = CFSTR("iu");
    }
  }

  return (id)v5;
}

+ (BOOL)languageIsTraditionalChinese:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  v5 = 1;
  if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("hant"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_11;
  if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("hans"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v5 = 0;
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("yue")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v6, "hasPrefix:", CFSTR("zh")))
  {
    v5 = objc_msgSend(v6, "rangeOfString:", CFSTR("tw")) != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v5 = 0;
  }

LABEL_11:
  return v5;
}

+ (BOOL)languageIsSimplifiedChinese:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  v6 = 1;
  if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("hans"), 1) == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ((objc_msgSend(a1, "languageIsTraditionalChinese:", v5) & 1) != 0
      || (objc_msgSend(a1, "languageIsHongKongChinese:", v5) & 1) != 0)
    {
LABEL_5:
      v6 = 0;
      goto LABEL_6;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));
    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("zh")) & 1) != 0
      || (objc_msgSend(v8, "hasPrefix:", CFSTR("cmn")) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v8, "hasPrefix:", CFSTR("yue"));
    }

  }
LABEL_6:

  return v6;
}

+ (BOOL)languageIsHongKongChinese:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("zh")))
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("hk")) != (id)0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v3, "rangeOfString:", CFSTR("mo")) != (id)0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)languageIsJapanese:(id)a3
{
  return a3 && objc_msgSend(a3, "rangeOfString:options:", CFSTR("ja"), 1) != (id)0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)languageIsKorean:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ko"));

  return v4;
}

+ (BOOL)languageIsArabic:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ar"));

  return v4;
}

+ (BOOL)languageIsHebrew:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("he"));

  return v4;
}

+ (BOOL)languageIsDevanagari:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("hi"));

  return v4;
}

+ (BOOL)languageIsGurmukhi:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("pa"));

  return v4;
}

+ (BOOL)languageIsGujarati:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("gu"));

  return v4;
}

+ (BOOL)languageIsTamil:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ta"));

  return v4;
}

+ (BOOL)languageIsTelugu:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("te"));

  return v4;
}

+ (BOOL)languageIsMalayalam:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ml"));

  return v4;
}

+ (BOOL)languageIsSinhala:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("si"));

  return v4;
}

+ (BOOL)languageIsOriya:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("or"));

  return v4;
}

+ (BOOL)languageIsKannada:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("kn"));

  return v4;
}

+ (BOOL)languageIsBengali:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("bn"));

  return v4;
}

+ (BOOL)languageIsThai:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("th"));

  return v4;
}

+ (BOOL)languageIsTibetan:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("bo"));

  return v4;
}

+ (BOOL)languageIsInuktitut:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("iu"));

  return v4;
}

+ (BOOL)languageDefaultsToPageProgressLeftToRight:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if (+[IMLanguageUtilities languageIsJapanese:](IMLanguageUtilities, "languageIsJapanese:", v3)
    || +[IMLanguageUtilities languageIsSimplifiedChinese:](IMLanguageUtilities, "languageIsSimplifiedChinese:", v3)|| +[IMLanguageUtilities languageIsTraditionalChinese:](IMLanguageUtilities, "languageIsTraditionalChinese:", v3)|| +[IMLanguageUtilities languageIsHongKongChinese:](IMLanguageUtilities, "languageIsHongKongChinese:", v3)|| +[IMLanguageUtilities languageIsArabic:](IMLanguageUtilities, "languageIsArabic:", v3))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !+[IMLanguageUtilities languageIsHebrew:](IMLanguageUtilities, "languageIsHebrew:", v3);
  }

  return v4;
}

+ (BOOL)languageDefaultsToHorizontalOrientation:(id)a3
{
  id v3;
  unsigned int v4;

  v3 = a3;
  if (+[IMLanguageUtilities languageIsJapanese:](IMLanguageUtilities, "languageIsJapanese:", v3)
    || +[IMLanguageUtilities languageIsSimplifiedChinese:](IMLanguageUtilities, "languageIsSimplifiedChinese:", v3)|| +[IMLanguageUtilities languageIsTraditionalChinese:](IMLanguageUtilities, "languageIsTraditionalChinese:", v3))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = !+[IMLanguageUtilities languageIsHongKongChinese:](IMLanguageUtilities, "languageIsHongKongChinese:", v3);
  }

  return v4;
}

@end
