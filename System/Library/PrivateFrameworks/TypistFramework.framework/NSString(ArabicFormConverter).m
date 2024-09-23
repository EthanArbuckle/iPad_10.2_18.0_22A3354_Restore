@implementation NSString(ArabicFormConverter)

+ (id)combinedArabicCharacterFormMap
{
  if (combinedArabicCharacterFormMap_onceToken != -1)
    dispatch_once(&combinedArabicCharacterFormMap_onceToken, &__block_literal_global_6);
  return (id)combinedArabicCharacterFormMap_combinedArabicCharacterFormMap;
}

+ (id)arabicNonPresentationFormCharacterSet
{
  if (arabicNonPresentationFormCharacterSet_onceToken != -1)
    dispatch_once(&arabicNonPresentationFormCharacterSet_onceToken, &__block_literal_global_48);
  return (id)arabicNonPresentationFormCharacterSet_arabicNonPresentationFormCharacterSet;
}

+ (id)arabicCharacterFormMap
{
  if (arabicCharacterFormMap_onceToken != -1)
    dispatch_once(&arabicCharacterFormMap_onceToken, &__block_literal_global_50);
  return (id)arabicCharacterFormMap_arabicCharacterFormMap;
}

+ (id)arabicDiacriticCharacterSet
{
  if (arabicDiacriticCharacterSet_onceToken != -1)
    dispatch_once(&arabicDiacriticCharacterSet_onceToken, &__block_literal_global_88);
  return (id)arabicDiacriticCharacterSet_arabicDiacriticCharacterSet;
}

+ (id)arabicFinalFormsCharacterSet
{
  if (arabicFinalFormsCharacterSet_onceToken != -1)
    dispatch_once(&arabicFinalFormsCharacterSet_onceToken, &__block_literal_global_92);
  return (id)arabicFinalFormsCharacterSet_arabicFinalFormsCharacterSet;
}

- (id)stringByConvertingArabicCharactersToPresentationForms
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD17C8], "arabicCharacterFormMap");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "combinedArabicCharacterFormMap");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "arabicDiacriticCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    v4 = 0;
    v5 = 0x24BDD1000uLL;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v26 = v2;
    while (1)
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", v4);
      objc_msgSend(*(id *)(v5 + 1760), "numberWithUnsignedShort:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        break;
      objc_msgSend(v2, "appendFormat:", CFSTR("%C"), v7);
LABEL_40:

      if (++v4 >= (unint64_t)objc_msgSend(a1, "length"))
        goto LABEL_43;
    }
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(v5 + 1760), "numberWithUnsignedShort:", objc_msgSend(a1, "characterAtIndex:", v6));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12
        || (objc_msgSend(v12, "arabicCharacterValue") & 0xFFFF0000) == 0
        && (objc_msgSend(v12, "arabicCharacterValue") & 0xFFFF00000000) == 0)
      {
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      }

      v10 = v6;
      v5 = 0x24BDD1000uLL;
    }
    v27 = v9;
    v6 = v4 + 1;
    v13 = v4 + 1;
    if (v4 + 1 < (unint64_t)objc_msgSend(a1, "length"))
    {
      v13 = v4 + 1;
      do
      {
        if (!objc_msgSend(v3, "characterIsMember:", objc_msgSend(a1, "characterAtIndex:", v13)))
          break;
        ++v13;
      }
      while (v13 < objc_msgSend(a1, "length"));
    }
    if (v13 >= objc_msgSend(a1, "length"))
    {
      LODWORD(v14) = 0;
      v9 = v27;
      goto LABEL_31;
    }
    v14 = objc_msgSend(a1, "characterAtIndex:", v13);
    objc_msgSend(*(id *)(v5 + 1760), "numberWithUnsignedShort:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v14)
    {
      if ((objc_msgSend(v16, "arabicCharacterValue") & 0xFFFF00000000) != 0
        || (v21 = objc_msgSend(v16, "arabicCharacterValue"), (_DWORD)v14 == 1600)
        || HIWORD(v21))
      {

        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        {
          LODWORD(v14) = 0;
          v2 = v26;
          v9 = v27;
LABEL_30:
          v5 = 0x24BDD1000;
LABEL_31:
          v22 = objc_msgSend(v9, "arabicCharacterValue");
          if (v10 != 0x7FFFFFFFFFFFFFFFLL && (_DWORD)v14 && (v22 & 0xFFFF00000000) != 0)
          {
            v23 = HIDWORD(v22);
          }
          else if (v10 == 0x7FFFFFFFFFFFFFFFLL || (v23 = HIWORD(v22)) == 0)
          {
            v23 = v22 >> 16;
            if ((v14 & ((v22 & 0xFFFF0000) != 0)) == 0)
              LOWORD(v23) = v22;
          }
          objc_msgSend(v2, "appendFormat:", CFSTR("%C"), (unsigned __int16)v23);
          v6 = v4;
          goto LABEL_40;
        }
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C"), v7, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v26;
        v9 = v27;
        if (v17)
        {
          v18 = v17;
          v19 = objc_msgSend(v17, "arabicCharacterValue");
          v20 = HIWORD(v19);
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
            LOWORD(v20) = v19;
          objc_msgSend(v26, "appendFormat:", CFSTR("%C"), (unsigned __int16)v20);

          ++v4;
          v5 = 0x24BDD1000;
          goto LABEL_40;
        }
        LODWORD(v14) = 1;
LABEL_29:

        goto LABEL_30;
      }
      LODWORD(v14) = 0;
    }
    v2 = v26;
    v9 = v27;
    goto LABEL_29;
  }
LABEL_43:

  return v2;
}

@end
