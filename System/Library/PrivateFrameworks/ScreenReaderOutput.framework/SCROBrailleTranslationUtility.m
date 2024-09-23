@implementation SCROBrailleTranslationUtility

+ (id)translatedTextInIsolationForBraille:(id)a3 translationMode:(unint64_t)a4
{
  id v5;
  void *v6;
  __CFString *v7;

  if (a3)
  {
    v5 = a3;
    +[SCROBrailleTranslationManager inputManager](SCROBrailleTranslationManager, "inputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textForPrintBraille:language:mode:locations:", v5, 0, a4, 0);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_24CC1DB88;
  }
  return v7;
}

+ (id)spokenStringForInsertedBrailleString:(id)a3 speakLiterally:(BOOL *)a4 modifiers:(id)a5
{
  return (id)objc_msgSend(a1, "_spokenStringForBrailleString:isDelete:speakLiterally:modifiers:", a3, 0, a4, a5);
}

+ (id)_translatedTextForPrefixBraille:(id)a3 printBraille:(id)a4 translationMode:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  void *v47;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", CFSTR("⠿"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v10;
  if (!SCROCustomBrailleEnabled())
  {
    if (a5 == 3)
      goto LABEL_6;
LABEL_10:
    objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v9, a5);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (!objc_msgSend(v10, "length"))
  {
    a5 = 1;
    goto LABEL_10;
  }
  a5 = 1;
  objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", CFSTR("⠿⠿⠿"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_24CC1DB88);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v10, v10, v10, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
    goto LABEL_10;
LABEL_6:
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v8, v9, CFSTR("⠿"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v15, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "rangeOfString:options:", v10, 0);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = &stru_24CC1DB88;
    }
    else
    {
      objc_msgSend(v16, "substringFromIndex:", v17 + v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    v26 = -[__CFString rangeOfString:options:](v19, "rangeOfString:options:", v10, 4);
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = &stru_24CC1DB88;
    }
    else
    {
      -[__CFString substringToIndex:](v19, "substringToIndex:", v26);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(CFSTR("⠿"), "stringByAppendingString:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v27, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v28, "rangeOfString:", v10);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = &stru_24CC1DB88;
    }
    else
    {
      objc_msgSend(v28, "substringFromIndex:", v29 + v30);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    if (!v21 || (v31 = -[__CFString length](v21, "length"), v32 = v21, !v31))
      v32 = v25;
    goto LABEL_26;
  }
  objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v9, 3);
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("⠿"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v22, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v23, "rangeOfString:options:", v10, 4);
  if (v24 == 0x7FFFFFFFFFFFFFFFLL)
  {

    v25 = &stru_24CC1DB88;
  }
  else
  {
    objc_msgSend(v23, "substringToIndex:", v24);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
LABEL_25:
      v32 = v21;
      goto LABEL_26;
    }
  }
  v33 = -[__CFString length](v25, "length");
  v32 = v25;
  if (!v33)
    goto LABEL_25;
LABEL_26:
  v20 = v32;

  a5 = 3;
LABEL_27:
  v34 = v9;
  objc_msgSend(v8, "stringByAppendingString:", v9);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v8, a5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v35, a5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_trimCommonPrefixWithString:fromString:", v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString uppercaseString](v20, "uppercaseString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v38, "length");
  if (v40 == -[__CFString length](v20, "length"))
  {
    if (objc_msgSend(v38, "isEqualToString:", v39))
      v41 = v39;
    else
      v41 = v38;
    v43 = v20;
    v20 = v41;
  }
  else
  {
    objc_msgSend(a1, "translatedTextInIsolationForBraille:translationMode:", v35, 1);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v39 && -[__CFString hasSuffix:](v42, "hasSuffix:", v39))
    {
      v44 = v39;

      v20 = v44;
    }
  }

  v45 = v20;
  return v45;
}

+ (id)_trimCommonPrefixWithString:(id)a3 fromString:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(v5, "commonPrefixWithString:options:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_spokenStringForBrailleString:(id)a3 isDelete:(BOOL)a4 speakLiterally:(BOOL *)a5 modifiers:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if (objc_msgSend(v10, "length"))
  {
    if (a5)
      *a5 = 0;
    v12 = (void *)objc_msgSend(&stru_24CC1DB88, "mutableCopy");
    if (SCROCustomBrailleEnabled()
      && (objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "bufferBrailleString"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          v14))
    {
      v33 = v14;
      if (v8)
      {
        v15 = v14;
        if ((unint64_t)objc_msgSend(v15, "length") >= 0xB)
        {
          objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v15, "length") - 10);
          v16 = objc_claimAutoreleasedReturnValue();

          v15 = (id)v16;
        }
        v17 = v10;
      }
      else if (SCROCustomBrailleEnabled())
      {
        objc_msgSend(MEMORY[0x24BE0FC30], "sharedModel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bufferBrailleString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v20, "substringToIndex:", objc_msgSend(v20, "length") - 1);
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        v17 = v10;

      }
      else
      {
        v17 = 0;
        v15 = 0;
      }
      objc_msgSend(a1, "_translatedTextForPrefixBraille:printBraille:translationMode:", v15, v17, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByTrimmingCharactersInSet:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v17;
      if (objc_msgSend(v23, "length"))
      {
        v24 = v23;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BE0FCB0]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v11, "containsObject:", v25);

        if (v26)
        {
          objc_msgSend(v24, "uppercaseString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = v24;
        }
      }
      if (objc_msgSend(v21, "length", v31) == 1
        && objc_msgSend(v21, "characterAtIndex:", 0) >> 11 >= 5
        && objc_msgSend(v21, "characterAtIndex:", 0) >> 8 <= 0x28)
      {
        objc_msgSend(a1, "_dotDescriptionForBrailleString:", v10);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v32;
        if (v27)
          objc_msgSend(v12, "appendString:", v27);

      }
      else if (objc_msgSend(v21, "length"))
      {
        objc_msgSend(v12, "appendString:", v21);
        v28 = v32;
        if (a5)
          *a5 = 1;
      }
      else
      {
        objc_msgSend(a1, "_dotDescriptionForBrailleString:", v10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v12, "appendString:", v29);

        v28 = v32;
      }
      v18 = v12;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)_japaneseIndicatorNameForBrailleString:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 1)
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BE0FC50], "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCandidateSelectionActive");

    if (v6)
    {
      v7 = &stru_24CC1DB88;
      if (v4 == 10248)
        v7 = CFSTR("つぎのこうほ");
      if (v4 == 10241)
        v8 = CFSTR("まえのこうほ");
      else
        v8 = v7;
    }
    else
    {
      v8 = 0;
      if (v4 <= 10277)
      {
        if (v4 > 10263)
        {
          if (v4 == 10264)
          {
            v8 = CFSTR("ようだくてん");
          }
          else if (v4 == 10272)
          {
            v8 = CFSTR("はんだくてん");
          }
        }
        else if (v4 == 10248)
        {
          v8 = CFSTR("ようおんてん");
        }
        else if (v4 == 10256)
        {
          v8 = CFSTR("だくてん");
        }
      }
      else if (v4 <= 10287)
      {
        if (v4 == 10278)
        {
          v8 = CFSTR("がいこくごはじめ");
        }
        else if (v4 == 10280)
        {
          v8 = CFSTR("ようはんだくてん");
        }
      }
      else
      {
        switch(v4)
        {
          case 10288:
            v8 = CFSTR("がいじふ");
            break;
          case 10290:
            v8 = CFSTR("くてん");
            break;
          case 10300:
            v8 = CFSTR("すうふ");
            break;
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return (id)v8;
}

+ (id)_dotDescriptionForBrailleString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v3 = a3;
  if (_dotDescriptionForBrailleString___AXNumberFormatterWithOptionsOnceToken != -1)
    dispatch_once(&_dotDescriptionForBrailleString___AXNumberFormatterWithOptionsOnceToken, &__block_literal_global_3);
  LODWORD(v4) = 0;
  v5 = 0;
  v6 = &stru_24CC1DB88;
  v7 = objc_msgSend(v3, "characterAtIndex:", 0) + 2147473408;
  do
  {
    if ((v7 & (1 << v4)) != 0)
    {
      if (v5)
      {
        -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR(" "));
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v8;
      }
      v9 = (void *)_dotDescriptionForBrailleString___brailleDotNumberFormatter;
      v4 = (v4 + 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromNumber:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      ++v5;
      v6 = (__CFString *)v12;
    }
    else
    {
      LODWORD(v4) = v4 + 1;
    }
  }
  while ((_DWORD)v4 != 8);
  if (v5)
  {
    if (v5 == 1)
      v13 = CFSTR("braille.unknown.key.format");
    else
      v13 = CFSTR("braille.unknown.key.format.multiple");
    objc_msgSend((id)_dotDescriptionForBrailleString___bundle, "localizedStringForKey:value:table:", v13, &stru_24CC1DB88, CFSTR("Server"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SCRCFormattedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __65__SCROBrailleTranslationUtility__dotDescriptionForBrailleString___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_dotDescriptionForBrailleString___brailleDotNumberFormatter;
  _dotDescriptionForBrailleString___brailleDotNumberFormatter = (uint64_t)v0;

  v2 = (void *)_dotDescriptionForBrailleString___brailleDotNumberFormatter;
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_dotDescriptionForBrailleString___bundle;
  _dotDescriptionForBrailleString___bundle = v4;

}

@end
