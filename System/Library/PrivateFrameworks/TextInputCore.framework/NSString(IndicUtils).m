@implementation NSString(IndicUtils)

- (BOOL)_isSingleGlyphInLanguage:()IndicUtils
{
  id v4;
  _BOOL8 v5;
  __CFString *v7;
  id v8;
  CFIndex v9;
  CFIndex i;
  CFIndex MaximumSizeForEncoding;
  UniChar *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CTFont *UIFontForLanguage;
  const __CTFont *v19;
  CFArrayRef v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t j;
  const __CTFontDescriptor *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  uint64_t v33;
  __int16 *v34;
  int v35;
  int ScriptCodeForLanguage;
  __int16 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  const __CTFont *v40;
  UniChar *v41;
  id v42;
  __CFString *v43;
  const __CFString *attribute;
  const __CFArray *obj;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  CFIndex v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[18];
  CFRange v75;

  v74[16] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kn")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("or")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("te")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(a1, "length") && objc_msgSend(v4, "length"))
  {
    v7 = a1;
    v8 = v4;
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    v69 = -[__CFString length](v7, "length");
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    v65 = malloc_type_calloc(v67[3], 2uLL, 0x1000040BDFB0063uLL);
    v58 = 0;
    v59 = &v58;
    v60 = 0x2020000000;
    v61 = 0;
    v61 = malloc_type_calloc(v67[3], 0x10uLL, 0x1000040451B5BE8uLL);
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    v57 = malloc_type_calloc(v67[3], 0x10uLL, 0x1000040451B5BE8uLL);
    v50 = 0;
    v51 = &v50;
    v52 = 0x2020000000;
    v53 = 0;
    v53 = malloc_type_calloc(v67[3], 8uLL, 0x100004000313F17uLL);
    v9 = v67[3];
    if (v9 >= 1)
    {
      for (i = 0; i < v9; ++i)
      {
        *(_QWORD *)(v51[3] + 8 * i) = i;
        v9 = v67[3];
      }
    }
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = v9;
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v9, 0x100u);
    v12 = (UniChar *)malloc_type_calloc(MaximumSizeForEncoding + 1, 1uLL, 0x303EF7FDuLL);
    v75.length = v47[3];
    v75.location = 0;
    CFStringGetCharacters(v7, v75, v12);
    v13 = v8;
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend((id)GetSystemFontForLanguage(NSString *)::__languageToFont, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        if (!GetSystemFontForLanguage(NSString *)::__languageToFont)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)GetSystemFontForLanguage(NSString *)::__languageToFont;
          GetSystemFontForLanguage(NSString *)::__languageToFont = v15;

        }
        objc_msgSend(MEMORY[0x1E0C99DC8], "scriptCodeFromLanguage:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 0.0, 0);
        if (UIFontForLanguage)
        {
          v19 = UIFontForLanguage;
          v20 = CTFontCopyDefaultCascadeListForLanguages(UIFontForLanguage, 0);
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v73 = 0u;
          obj = v20;
          v21 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
          if (v21)
          {
            v22 = v21;
            v40 = v19;
            v41 = v12;
            v42 = v13;
            v43 = v7;
            v23 = *(_QWORD *)v71;
            v24 = (const __CFString *)*MEMORY[0x1E0CA82C8];
            attribute = (const __CFString *)*MEMORY[0x1E0CA8380];
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v71 != v23)
                  objc_enumerationMutation(obj);
                v26 = *(const __CTFontDescriptor **)(*((_QWORD *)&v70 + 1) + 8 * j);
                v27 = (void *)CTFontDescriptorCopyAttribute(v26, v24);
                v28 = (void *)MEMORY[0x1E0C99DC8];
                objc_msgSend(v27, "firstObject");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "scriptCodeFromLanguage:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v30, "isEqualToString:", v17))
                {
                  v31 = (__CFString *)CTFontDescriptorCopyAttribute(v26, attribute);
                  if (-[__CFString length](v31, "length"))
                  {
                    v14 = CTFontCreateWithName(v31, 12.0, 0);
                    v13 = v42;
                    objc_msgSend((id)GetSystemFontForLanguage(NSString *)::__languageToFont, "setObject:forKeyedSubscript:", v14, v42);

                    v7 = v43;
                    goto LABEL_31;
                  }

                }
              }
              v22 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
              if (v22)
                continue;
              break;
            }
            v14 = 0;
            v13 = v42;
            v7 = v43;
LABEL_31:
            v19 = v40;
            v12 = v41;
          }
          else
          {
            v14 = 0;
          }

          CFRelease(v19);
        }
        else
        {
          v14 = 0;
        }

      }
    }
    else
    {
      v14 = 0;
    }

    CTFontGetGlyphsForCharacters((CTFontRef)v14, v12, (CGGlyph *)v63[3], v47[3]);
    CTFontInitializeShapingGlyphs();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = ___ZL32GetGlyphCountForStringInLanguageP8NSStringS0__block_invoke;
    v74[3] = &unk_1EA103398;
    v74[4] = &v66;
    v74[5] = &v46;
    v74[6] = &v62;
    v74[7] = &v58;
    v74[8] = &v54;
    v74[9] = &v50;
    CTFontShapeGlyphs();
    v32 = v67[3];
    if (v32 < 1)
    {
      v33 = 0;
    }
    else
    {
      v33 = 0;
      v34 = (__int16 *)v63[3];
      do
      {
        v35 = *v34++;
        if (v35 != -1)
          ++v33;
        --v32;
      }
      while (v32);
    }
    free((void *)v63[3]);
    free((void *)v59[3]);
    free((void *)v55[3]);
    free((void *)v51[3]);
    free(v12);
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(&v50, 8);
    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);

    if (v33 != 2
      || (unint64_t)-[__CFString length](v7, "length", 0, v74) < 2
      || ((ScriptCodeForLanguage = GetScriptCodeForLanguage((NSString *)v13),
           v37 = TI::IndicUtils::initialVowelLetterForScript(ScriptCodeForLanguage),
           v38 = v37 + 43,
           v39 = v37 + 72,
           -[__CFString characterAtIndex:](v7, "characterAtIndex:", 0) != (unsigned __int16)(v37 + 72))
       || (v5 = 1, -[__CFString characterAtIndex:](v7, "characterAtIndex:", 1) != v38))
      && (-[__CFString characterAtIndex:](v7, "characterAtIndex:", 0) != v38
       || (v5 = 1, -[__CFString characterAtIndex:](v7, "characterAtIndex:", 1) != v39)))
    {
      v5 = v33 == 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (__CFString)_lastConjunctInLanguage:()IndicUtils
{
  uint64_t ScriptCodeForLanguage;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;
  void *v10;
  char v11;
  uint64_t v13;
  uint64_t v14;

  ScriptCodeForLanguage = GetScriptCodeForLanguage(a3);
  objc_msgSend(a1, "_lastGrapheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "_contentsExclusivelyInScript:", ScriptCodeForLanguage))
  {
    v6 = &stru_1EA1081D0;
    goto LABEL_21;
  }
  v6 = v5;
  v7 = -[__CFString length](v6, "length") - 1;
  if (v7 < 0)
    goto LABEL_17;
  v8 = 0;
  v9 = TI::IndicUtils::initialVowelLetterForScript(ScriptCodeForLanguage) + 72;
  while (1)
  {
    if (-[__CFString characterAtIndex:](v6, "characterAtIndex:", v7) == v9)
    {
      if (v7 && v7 < (unint64_t)(-[__CFString length](v6, "length") - 1))
      {
        -[__CFString substringWithRange:](v6, "substringWithRange:", v7 - 1, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (GetAkhandConjuncts(void)::onceToken != -1)
          dispatch_once(&GetAkhandConjuncts(void)::onceToken, &__block_literal_global_178);
        v11 = objc_msgSend((id)GetAkhandConjuncts(void)::__akhandConjuncts, "containsObject:", v10);

        if ((v11 & 1) != 0)
          goto LABEL_12;
      }
      ++v8;
    }
    if (v8 == 2)
      break;
LABEL_12:
    if (v7-- <= 0)
      goto LABEL_17;
  }
  -[__CFString substringFromIndex:](v6, "substringFromIndex:", v7 + 1);
  v13 = objc_claimAutoreleasedReturnValue();

  v6 = (__CFString *)v13;
LABEL_17:
  if (GetTallConjuncts(void)::onceToken != -1)
    dispatch_once(&GetTallConjuncts(void)::onceToken, &__block_literal_global_199);
  if (objc_msgSend((id)GetTallConjuncts(void)::__tallConjuncts, "containsObject:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", -[__CFString _lastLongCharacter](v6, "_lastLongCharacter"));
    v14 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v14;
  }
LABEL_21:

  return v6;
}

- (__CFString)_stringByRemovingOffensiveOrVulgarWords
{
  __CFString *v2;

  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("মাং")) & 1) != 0)
    v2 = CFSTR(" ং");
  else
    v2 = a1;
  return v2;
}

@end
