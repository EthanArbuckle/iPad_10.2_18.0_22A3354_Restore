@implementation NSString(CRStringUtilities)

- (uint64_t)_crContainsText
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "letterCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_crContainsCharactersInSet:", v2);

  return v3;
}

- (uint64_t)_crStartsWithUppercase
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NSString_CRStringUtilities___crStartsWithUppercase__block_invoke;
  v5[3] = &unk_1E98D9D00;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_crStartsWithLowercase
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = objc_msgSend(a1, "length");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__NSString_CRStringUtilities___crStartsWithLowercase__block_invoke;
  v5[3] = &unk_1E98D9D00;
  v5[4] = &v6;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_crStartsWithCharacterInSet:()CRStringUtilities
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") == 0;
}

- (BOOL)_crContainsCharactersInSet:()CRStringUtilities
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_crIsAllCaps
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "uppercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", a1))
  {
    objc_msgSend(a1, "lowercaseString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", a1) ^ 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_crStringByAppendingString:()CRStringUtilities locale:
{
  return objc_msgSend(a1, "_crStringByAppendingString:locale:mergeHyphenatedWord:", a3, a4, 0);
}

- (uint64_t)_crStringByAppendingString:()CRStringUtilities locale:mergeHyphenatedWord:
{
  return objc_msgSend(a1, "_crStringByAppendingString:locale:mergeHyphenatedWord:allowWhitespaceDelimiter:", a3, a4, a5, 1);
}

- (id)_crStringByAppendingString:()CRStringUtilities locale:mergeHyphenatedWord:allowWhitespaceDelimiter:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int16x4_t v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  int16x4_t v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v36;
  int v37;
  char v38;

  v10 = a3;
  v11 = a4;
  if (!objc_msgSend(a1, "length"))
  {
    v19 = v10;
LABEL_9:
    v20 = (void *)objc_msgSend(v19, "copy");
    goto LABEL_38;
  }
  if (!objc_msgSend(v10, "length"))
  {
    v19 = a1;
    goto LABEL_9;
  }
  v12 = a1;
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v11)
    || +[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v11))
  {
    v13 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v12, "length") - 1);
    v14 = objc_msgSend(v10, "characterAtIndex:", objc_msgSend(v10, "length") - 1);
    v16 = -[NSString _codePointIsSpaceSeparatedScript:]((uint64_t)v12, v13, v15);
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = a6;
    if ((objc_msgSend(v17, "characterIsMember:", v13) & 1) != 0)
    {
      v18 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "characterIsMember:", v13) & 1) != 0)
      {
        v18 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
        v36 = v16;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v23, "characterIsMember:", v13);

        v16 = v36;
      }

    }
    v25 = -[NSString _codePointIsSpaceSeparatedScript:]((uint64_t)v12, v14, v24);
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "characterIsMember:", v14) & 1) != 0)
    {
      v27 = 1;
    }
    else
    {
      v37 = v16;
      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "characterIsMember:", v14) & 1) != 0)
      {
        v27 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v29, "characterIsMember:", v14);

      }
      v16 = v37;
    }

    if (v16 & (v25 | v27) | v25 & v18)
      v22 = CFSTR(" ");
    else
      v22 = &stru_1E98DC948;
    a6 = v38;
  }
  else
  {
    v22 = CFSTR(" ");
  }
  if (objc_msgSend(v12, "_crEndsWithHyphen"))
  {
    v30 = objc_msgSend(v12, "length");
    if (a5)
    {
      objc_msgSend(v12, "substringToIndex:", v30 - 1);
      v31 = objc_claimAutoreleasedReturnValue();

      v22 = &stru_1E98DC948;
      v12 = (id)v31;
    }
    else if (v30 >= 2)
    {
      v32 = objc_msgSend(v12, "characterAtIndex:", objc_msgSend(v12, "length") - 2);
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = objc_msgSend(v33, "characterIsMember:", v32);

      if (!(_DWORD)v32)
        v22 = &stru_1E98DC948;
    }
  }
  if ((a6 & 1) == 0 && -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR(" ")))
    v22 = &stru_1E98DC948;
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("%@%@"), v22, v10);
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = objc_msgSend(v10, "copy");
  }
  v20 = (void *)v34;

LABEL_38:
  return v20;
}

- (uint64_t)_crEndsWithHyphen
{
  void *v2;
  uint64_t v3;

  if (qword_1ED0B43E0 != -1)
    dispatch_once(&qword_1ED0B43E0, &__block_literal_global_9);
  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", _MergedGlobals_13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "hasSuffix:", v2) ^ 1;

  return v3;
}

- (uint64_t)_crCountConsecutiveCharactersAtIndex:()CRStringUtilities fromSet:
{
  id v6;
  uint64_t v7;

  v6 = a4;
  if (objc_msgSend(a1, "length") <= a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      if (!objc_msgSend(v6, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", a3 + v7)))
        break;
      ++v7;
    }
    while (a3 + v7 < objc_msgSend(a1, "length"));
  }

  return v7;
}

- (id)_crStringByReplacingCharactersInSet:()CRStringUtilities withString:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_crPredictedLocaleUsingRecognizer:()CRStringUtilities resetContext:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  id v18;
  void *v19;

  v6 = a3;
  v7 = a1;
  objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "_crContainsCharactersInSet:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "lowercaseString");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v10;
  }
  v11 = v6;
  objc_sync_enter(v11);
  if (a4)
    objc_msgSend(v11, "reset");
  objc_msgSend(v11, "processString:", v7);
  objc_msgSend(v11, "languageHypothesesWithMaximum:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v11);

  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  if (v17 <= 0.5)
  {
    v19 = 0;
  }
  else
  {
    v18 = v14;
    objc_opt_self();
    if (qword_1ED0B43F0 != -1)
      dispatch_once(&qword_1ED0B43F0, &__block_literal_global_13);
    objc_msgSend((id)qword_1ED0B43E8, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

- (id)_crStringByPreparingForLanguageRecognition
{
  void *v2;
  void *v3;

  if (qword_1ED0B4400 != -1)
    dispatch_once(&qword_1ED0B4400, &__block_literal_global_15);
  objc_msgSend(a1, "_crStringByReplacingCharactersInSet:withString:", qword_1ED0B43F8, CFSTR(" "));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[ /\\-;]+"),
    CFSTR(" "),
    1024,
    0,
    objc_msgSend(v2, "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_crArrayOfComposedCharacters
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__NSString_CRStringUtilities___crArrayOfComposedCharacters__block_invoke;
  v6[3] = &unk_1E98DA660;
  v4 = v2;
  v7 = v4;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 2, v6);

  return v4;
}

- (id)_crReplacedUkrainianApostrophes
{
  id v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  int v8;

  if ((unint64_t)objc_msgSend(a1, "length") > 2)
  {
    v3 = (void *)objc_msgSend(a1, "mutableCopy");
    if ((unint64_t)(objc_msgSend(a1, "length") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v4 = 1;
      do
      {
        v5 = objc_msgSend(v3, "characterAtIndex:", v4 - 1);
        v6 = objc_msgSend(v3, "characterAtIndex:", v4);
        v7 = v4 + 1;
        v8 = objc_msgSend(v3, "characterAtIndex:", v4 + 1);
        if (v6 == 39 && (v5 - 1024) <= 0x12F && (v8 - 1024) <= 0x12F)
          objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 1, CFSTR("ʼ"));
        ++v4;
      }
      while (v7 < objc_msgSend(a1, "length") - 1);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)_crStringByRemovingInvalidArabicDiacritics
{
  id v3;
  id v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  _BOOL4 v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  int v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  _BOOL4 v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  unsigned __int16 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a1, "length") <= 1)
    return a1;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v5 = 0x1E0CB3000uLL;
  if (objc_msgSend(a1, "length"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v53 = 0;
      v53 = objc_msgSend(a1, "characterAtIndex:", v7);
      objc_msgSend(*(id *)(v5 + 1280), "_crBasicArabicCharacterSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "characterIsMember:", v53) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(v5 + 1280), "_crArabicDiacriticCharacterSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v10, "characterIsMember:", v53);

        v5 = 0x1E0CB3000;
      }

      if ((v6 & v9) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v53, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v11);
      }
      else
      {
        if (objc_msgSend(v4, "length"))
        {
          v12 = (void *)objc_msgSend(v4, "copy");
          objc_msgSend(v3, "addObject:", v12);

        }
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCharacters:length:", &v53, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setString:", v11);
      }

      ++v7;
      v6 = v9;
    }
    while (v7 < objc_msgSend(a1, "length"));
  }
  if (objc_msgSend(v4, "length"))
  {
    v13 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "addObject:", v13);

  }
  v38 = v4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v3;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v50;
    v14 = 32;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v50 != v40)
          objc_enumerationMutation(obj);
        v42 = v15;
        v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0CB3500], "_crBasicArabicCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v17, "characterIsMember:", (unsigned __int16)v14);

        objc_msgSend(MEMORY[0x1E0CB3500], "_crArabicDiacriticCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "characterIsMember:", (unsigned __int16)v14);

        if (objc_msgSend(v16, "length"))
        {
          v20 = 0;
          v21 = -1;
          v22 = v14;
          while (1)
          {
            v14 = objc_msgSend(v16, "characterAtIndex:", v20);
            objc_msgSend(MEMORY[0x1E0CB3500], "_crBasicArabicCharacterSet");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "characterIsMember:", v14);

            objc_msgSend(MEMORY[0x1E0CB3500], "_crArabicDiacriticCharacterSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "characterIsMember:", v14);

            objc_msgSend(MEMORY[0x1E0CB3500], "_crArabicTanweenDiacriticCharacterSet");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "characterIsMember:", v14);

            if (((v20 != 0) & (v48 | v19)) == 0)
            {
              if ((_DWORD)v26)
                break;
            }
            if (v28 && v20 < objc_msgSend(v16, "length") - 1)
            {
              if (v20 != objc_msgSend(v16, "length") - 2
                || (_DWORD)v14 != 1611
                || objc_msgSend(v16, "characterAtIndex:", v20 + 1) != 1575)
              {
                break;
              }
              v29 = 0;
              v30 = 1611;
            }
            else
            {
              v29 = v14 == 1617;
              v30 = v14;
              if (v20 == 1 && (_DWORD)v14 == 1617)
                break;
            }
            v46 = v29;
            v47 = v30;
            if (v20 < objc_msgSend(v16, "length") - 1 && ((_DWORD)v14 == 1609 || (_DWORD)v14 == 1577))
            {
              v43 = objc_msgSend(v16, "length");
              v31 = objc_msgSend(v16, "characterAtIndex:", objc_msgSend(v16, "length") - 1);
              if (v20 + 1 < objc_msgSend(v16, "length"))
              {
                v44 = v21 + v43 - (v31 == 1569);
                objc_msgSend(MEMORY[0x1E0CB3500], "_crBasicArabicCharacterSet");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v16, "rangeOfCharacterFromSet:options:range:", v32, 2, v20 + 1, v44);

                if (v33 != 0x7FFFFFFFFFFFFFFFLL)
                  break;
              }
            }
            if ((_DWORD)v14 == (unsigned __int16)v22)
            {
              switch((unsigned __int16)v22)
              {
                case 0x650u:
                  v14 = 1613;
                  goto LABEL_54;
                case 0x64Fu:
                  v14 = 1612;
                  goto LABEL_54;
                case 0x64Eu:
                  v14 = 1611;
LABEL_54:
                  v53 = v14;
                  objc_msgSend(v45, "replaceCharactersInRange:withCharacters:length:", objc_msgSend(v45, "length") - 1, 1, &v53, 1);
                  v26 = v19;
                  goto LABEL_35;
              }
              if ((v19 & v26 & 1) == 0)
              {
LABEL_51:
                objc_msgSend(v45, "appendFormat:", CFSTR("%C"), v47);
                v48 = v24;
                goto LABEL_35;
              }
            }
            else
            {
              if ((v19 & v26) != 1)
                goto LABEL_51;
              objc_msgSend(MEMORY[0x1E0CB3500], "_crArabicCombiningDiacriticCharacterSet");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "characterIsMember:", v14);

              if ((unsigned __int16)v22 == 1617 && (v35 & 1) != 0)
                goto LABEL_51;
              objc_msgSend(MEMORY[0x1E0CB3500], "_crArabicCombiningDiacriticCharacterSet");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "characterIsMember:", (unsigned __int16)v22);

              if ((v46 & v37) == 1)
                goto LABEL_51;
            }
            v26 = 1;
LABEL_34:
            v14 = v22;
LABEL_35:
            ++v20;
            --v21;
            v22 = v14;
            v19 = v26;
            if (v20 >= objc_msgSend(v16, "length"))
              goto LABEL_57;
          }
          v26 = v19;
          goto LABEL_34;
        }
LABEL_57:
        v15 = v42 + 1;
      }
      while (v42 + 1 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v41);
  }

  return v45;
}

- (id)_crStringByRemovingParenthesizedText
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  __int16 v11;

  if (a1 && (unint64_t)objc_msgSend(a1, "length") > 1)
  {
    if (qword_1ED0B4410 != -1)
      dispatch_once(&qword_1ED0B4410, &__block_literal_global_28);
    v2 = (void *)objc_msgSend(a1, "mutableCopy");
    v4 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", qword_1ED0B4408, 0, 0, objc_msgSend(v2, "length"));
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = v4;
      v6 = 0;
      do
      {
        if (v5 == objc_msgSend(v2, "length") - 1)
          break;
        v7 = objc_msgSend(v2, "characterAtIndex:", v5);
        v11 = 0;
        if (objc_msgSend(CFSTR("([{<（［｛＜"), "length"))
        {
          v8 = 0;
          do
          {
            if (objc_msgSend(CFSTR("([{<（［｛＜"), "characterAtIndex:", v8) == v7)
              v11 = objc_msgSend(CFSTR(")]}>）］｝＞"), "characterAtIndex:", v8);
            ++v8;
          }
          while (v8 < objc_msgSend(CFSTR("([{<（［｛＜"), "length"));
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v2, "rangeOfString:options:range:", v9, 0, v5 + 1, objc_msgSend(v2, "length") + ~v5);

        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          ++v6;
        else
          objc_msgSend(v2, "deleteCharactersInRange:", v5, v10 - v5 + 1);
        v5 = objc_msgSend(v2, "rangeOfCharacterFromSet:options:range:", qword_1ED0B4408, 0, v6, objc_msgSend(v2, "length") - v6);
      }
      while (v5 != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  return v2;
}

- (id)_crStringByReversingComposedCharacterSequences
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(a1, "length"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__NSString_CRStringUtilities___crStringByReversingComposedCharacterSequences__block_invoke;
  v7[3] = &unk_1E98DA660;
  v8 = v2;
  v4 = v2;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", 0, v3, 258, v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

@end
