@implementation WBSPasswordGenerationManager

+ (id)requirementsForPasswordRuleSet:(id)a3 respectingMinLength:(id)a4 maxLength:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v7)
      goto LABEL_6;
LABEL_5:
    objc_msgSend(v25, "minLengthRule", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_9;
    goto LABEL_6;
  }
  objc_msgSend(v25, "maxLengthRule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
LABEL_6:
  if (!v8)
  {
    if ((unint64_t)objc_msgSend(v7, "unsignedIntegerValue") > 0x13)
    {
      v8 = v7;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 20);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  if (v8)
LABEL_12:
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, CFSTR("PasswordMaxLength"), v25);
  if (v7)
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v7, CFSTR("PasswordMinLength"));
  objc_msgSend(v25, "allowedRule", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  appendedCanonicalizedCharactersFromCharacterClasses(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v13, CFSTR("PasswordAllowedCharacters"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v26, "requiredRules");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          appendedCanonicalizedCharactersFromCharacterClasses(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "length"))
            objc_msgSend(v14, "addObject:", v20);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    objc_msgSend(v27, "setObject:forKeyedSubscript:", v14, CFSTR("PasswordRequiredCharacters"));
    objc_msgSend(v26, "maxConsecutiveRule");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, CFSTR("PasswordConsecutiveCharacterLimit"));
    v23 = v27;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (WBSPasswordGenerationManager)init
{

  return 0;
}

+ (unint64_t)minimumPasswordLength
{
  return 5;
}

- (WBSPasswordGenerationManager)initWithPasswordRequirementsByDomain:(id)a3
{
  id v4;
  WBSPasswordGenerationManager *v5;
  uint64_t v6;
  NSDictionary *passwordRequirementsByDomain;
  void *v8;
  __CFString *v9;
  int v10;
  char v11;
  __CFString *v12;
  NSString *v13;
  WBSPasswordGenerationManager *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSPasswordGenerationManager;
  v5 = -[WBSPasswordGenerationManager init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    passwordRequirementsByDomain = v5->_passwordRequirementsByDomain;
    v5->_passwordRequirementsByDomain = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeIdentifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v10 = -[__CFString hasPrefix:](v9, "hasPrefix:", CFSTR("en"));
    v11 = v10;
    if (v10)
      v12 = v9;
    else
      v12 = CFSTR("en");
    v13 = v12;
    v5->_lexiconForEnglish = (_LXLexicon *)createLexiconWithLocale(v13);
    if ((v11 & 1) == 0)
      v5->_lexiconForUserLocale = (_LXLexicon *)createLexiconWithLocale(&v9->isa);
    v14 = v5;

  }
  return v5;
}

- (void)dealloc
{
  _LXLexicon *lexiconForEnglish;
  _LXLexicon *lexiconForUserLocale;
  objc_super v5;

  lexiconForEnglish = self->_lexiconForEnglish;
  if (lexiconForEnglish)
    CFRelease(lexiconForEnglish);
  lexiconForUserLocale = self->_lexiconForUserLocale;
  if (lexiconForUserLocale)
    CFRelease(lexiconForUserLocale);
  v5.receiver = self;
  v5.super_class = (Class)WBSPasswordGenerationManager;
  -[WBSPasswordGenerationManager dealloc](&v5, sel_dealloc);
}

+ (BOOL)passwordLooksLikePasswordManagerGeneratedPassword:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = passwordMatchesFormatOfGenerationStyle(v3, 2) || passwordMatchesFormatOfGenerationStyle(v3, 0);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)passwordLooksLikePasswordManagerGeneratedMoreTypablePassword:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = passwordMatchesFormatOfGenerationStyle(v3, 2);
  else
    v4 = 0;

  return v4;
}

- (id)updatedRequirements:(id)a3 respectingMaxLength:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a4
    && (objc_msgSend(v5, "safari_numberForKey:", CFSTR("PasswordMaxLength")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "unsignedIntegerValue"),
        v7,
        v8 - 1 >= a4))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("PasswordMaxLength"));

  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (id)_moreTypeablePassword
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint32_t v10;
  uint64_t v11;
  __darwin_ct_rune_t v12;
  void *v13;
  uint32_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  __int16 v30;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  randomSyllable();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  randomSyllable();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  randomSyllable();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  randomSyllable();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  randomSyllable();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = randomConsonant();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@%@%@%@%C%C"), v3, v4, v5, v6, v7, v8, randomVowel());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  do
  {
LABEL_2:
    v11 = arc4random_uniform(v10);
    v12 = objc_msgSend(v9, "characterAtIndex:", v11);
  }
  while (v12 == 111);
  v30 = 0;
  v30 = __toupper(v12);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replaceCharactersInRange:withString:", v11, 1, v13);

  v14 = arc4random_uniform(5u);
  objc_msgSend(v9, "substringWithRange:", 0, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", 6, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringWithRange:", 12, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  switch(v14)
  {
    case 0u:
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = randomNumber();
      v21 = v18;
      v22 = v15;
      goto LABEL_8;
    case 1u:
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = randomNumber();
      v21 = v15;
      v22 = v18;
LABEL_8:
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@%C%@%@"), v21, v20, v22, v16);
      v23 = objc_claimAutoreleasedReturnValue();
      break;
    case 2u:
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = randomNumber();
      v26 = v18;
      v27 = v16;
      goto LABEL_11;
    case 3u:
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = randomNumber();
      v26 = v16;
      v27 = v18;
LABEL_11:
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@%@%C%@"), v15, v26, v25, v27);
      v23 = objc_claimAutoreleasedReturnValue();
      break;
    case 4u:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%C"), v15, v16, v17, randomNumber());
      v23 = objc_claimAutoreleasedReturnValue();
      break;
    default:

      goto LABEL_2;
  }
  v28 = (void *)v23;

  return v28;
}

- (void)_lexiconEnumerateEntries:(_LXLexicon *)a3 forString:(id)a4 completionHandler:(id)a5
{
  id v5;
  id v6;

  v6 = a5;
  v5 = v6;
  LXLexiconEnumerateEntriesForString();

}

uint64_t __85__WBSPasswordGenerationManager__lexiconEnumerateEntries_forString_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t MetaFlags;
  uint64_t CategoryFlags;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = LXEntryCopyString();
  MetaFlags = LXEntryGetMetaFlags();
  CategoryFlags = LXEntryGetCategoryFlags();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, MetaFlags, CategoryFlags, a3);
}

- (BOOL)_tokensContainUnwantedWords:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  _LXLexicon *lexiconForUserLocale;
  BOOL v12;
  id obj;
  _QWORD aBlock[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      v7 = MEMORY[0x1E0C809B0];
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          aBlock[0] = v7;
          aBlock[1] = 3221225472;
          aBlock[2] = __60__WBSPasswordGenerationManager__tokensContainUnwantedWords___block_invoke;
          aBlock[3] = &unk_1E649DEF0;
          aBlock[4] = v9;
          aBlock[5] = &v20;
          v10 = _Block_copy(aBlock);
          -[WBSPasswordGenerationManager _lexiconEnumerateEntries:forString:completionHandler:](self, "_lexiconEnumerateEntries:forString:completionHandler:", self->_lexiconForEnglish, v9, v10);
          if (*((_BYTE *)v21 + 24)
            || (lexiconForUserLocale = self->_lexiconForUserLocale) != 0
            && (-[WBSPasswordGenerationManager _lexiconEnumerateEntries:forString:completionHandler:](self, "_lexiconEnumerateEntries:forString:completionHandler:", lexiconForUserLocale, v9, v10), *((_BYTE *)v21 + 24)))
          {

            v12 = 1;
            goto LABEL_16;
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        v12 = 0;
        if (v5)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_16:

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __60__WBSPasswordGenerationManager__tokensContainUnwantedWords___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "safari_isCaseAndDiacriticInsensitiveEqualToString:", a2);
  if ((_DWORD)result)
  {
    if ((a3 & 0x3800000) != 0 || (*(_QWORD *)&a4 & 0x3FD00) != 0)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (id)generatedPasswordMatchingRequirements:(id)a3
{
  -[WBSPasswordGenerationManager _generatedPasswordMatchingRequirements:rejectUnwantedWords:](self, "_generatedPasswordMatchingRequirements:rejectUnwantedWords:", a3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_generatedPasswordMatchingRequirements:(id)a3 rejectUnwantedWords:(BOOL)a4
{
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  uint64_t v48;
  _WORD *v49;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  __CFString *v60;
  _WORD *v61;
  char *v62;
  int64_t v63;
  void *v64;
  unint64_t v65;
  int64_t v66;
  _WORD *v67;
  unint64_t v68;
  __int16 *v69;
  char *v70;
  __int16 v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  BOOL v91;
  uint64_t v92;
  unsigned __int16 v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t m;
  int v97;
  unint64_t v98;
  uint64_t v99;
  id v100;
  unint64_t v101;
  void *v102;
  unint64_t v103;
  unint64_t v104;
  int v105;
  int v106;
  int v107;
  char v108;
  char v109;
  uint64_t v110;
  uint64_t v112;
  unsigned __int8 v113;
  unsigned __int8 v114;
  uint64_t j;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  BOOL v119;
  BOOL v120;
  uint64_t v121;
  _WORD *v122;
  _WORD *v123;
  _WORD *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  id obj;
  _BOOL4 v129;
  unint64_t v130;
  void *v131;
  char *v133;
  unint64_t v134;
  unint64_t v135;
  id v136;
  void *v137;
  id v138;
  BOOL v139;
  void *v140;
  __CFString *v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[4];
  _QWORD v147[4];
  void *__p[2];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  void *v152[2];
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _WORD *v156;
  _WORD *v157;
  _WORD *v158;
  uint64_t v159;

  v129 = a4;
  v159 = *MEMORY[0x1E0C80C00];
  v136 = a3;
  objc_msgSend(v136, "safari_numberForKey:", CFSTR("PasswordMinLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v136, "safari_numberForKey:", CFSTR("PasswordMaxLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v130 = v6;
  if (v134 > v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[WBSPasswordGenerationManager _generatedPasswordMatchingRequirements:rejectUnwantedWords:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    v134 = 0;
  }
  objc_msgSend(v136, "safari_stringForKey:", CFSTR("PasswordAllowedCharacters"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v15;
  objc_msgSend(v136, "safari_arrayForKey:", CFSTR("PasswordRequiredCharacters"));
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  v133 = v16;
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = 0u;
    v145 = 0u;
    v142 = 0u;
    v143 = 0u;
    v17 = v133;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v142, __p, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v143 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
          v22 = v15;
          objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "rangeOfCharacterFromSet:", v23) == 0x7FFFFFFFFFFFFFFFLL;

          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v137, "addObject:", v25);

          }
          v15 = v140;
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v142, __p, 16);
      }
      while (v18);
    }

    v26 = v137;
    v15 = v140;
  }
  else
  {
    v26 = 0;
  }
  v141 = v15;
  v138 = v26;
  v27 = v6 - 1;
  if (v6 - 1 >= 0x13
    && v134 <= 0x14
    && (!v141
     || (-[__CFString safari_containsAllCharactersInString:](v141, "safari_containsAllCharactersInString:", CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789")) & 1) != 0)&& (unint64_t)objc_msgSend(v138, "count") <= 0x14)
  {
    v154 = 0u;
    v155 = 0u;
    *(_OWORD *)v152 = 0u;
    v153 = 0u;
    obj = v138;
    v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v152, &v156, 16);
    if (v112)
    {
      v113 = 0;
      v114 = 0;
      v127 = *(_QWORD *)v153;
      while (2)
      {
        for (j = 0; j != v112; ++j)
        {
          if (*(_QWORD *)v153 != v127)
            objc_enumerationMutation(obj);
          v116 = *((_QWORD *)v152[1] + j);
          v117 = objc_msgSend(CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZ"), "rangeOfCharacterFromSet:", v116);
          if (((v117 != 0x7FFFFFFFFFFFFFFFLL) & v114) != 0
            || (v118 = objc_msgSend(CFSTR("0123456789"), "rangeOfCharacterFromSet:", v116),
                v119 = v118 != 0x7FFFFFFFFFFFFFFFLL,
                ((v118 != 0x7FFFFFFFFFFFFFFFLL) & v113) != 0)
            || (v117 == 0x7FFFFFFFFFFFFFFFLL ? (v120 = v118 == 0x7FFFFFFFFFFFFFFFLL) : (v120 = 0),
                v120
             && objc_msgSend(CFSTR("abcdefghijkmnopqrstuvwxyz-"), "rangeOfCharacterFromSet:", v116) == 0x7FFFFFFFFFFFFFFFLL))
          {

            goto LABEL_23;
          }
          v114 |= v117 != 0x7FFFFFFFFFFFFFFFLL;
          v113 |= v119;
        }
        v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v152, &v156, 16);
        if (v112)
          continue;
        break;
      }
    }

    if (v141)
    {
      if (-[__CFString rangeOfString:](v141, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL)
        v121 = 3;
      else
        v121 = 2;
    }
    else
    {
LABEL_180:
      v121 = 2;
    }
    v152[0] = CFSTR("PasswordGenerationStyle");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v121);
    v49 = (_WORD *)objc_claimAutoreleasedReturnValue();
    v156 = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, v152, 1);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_58;
  }

LABEL_23:
  v28 = 12;
  if (v134 <= 0xF)
  {
    v29 = v27 < 0xE;
  }
  else
  {
    v28 = v134;
    v29 = 1;
  }
  if (v27 >= 0xE)
    v30 = v28;
  else
    v30 = v130;
  if (v141)
  {
    if (-[__CFString rangeOfString:](v141, "rangeOfString:", CFSTR("-")) == 0x7FFFFFFFFFFFFFFFLL || v29)
      goto LABEL_32;
  }
  else
  {
    v141 = CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789");
    if (v29)
    {
LABEL_32:
      v31 = 15;
      if (v134 > 0xF)
        v31 = v134;
      if (v27 >= 0xE)
        v30 = v31;
      else
        v30 = v130;
      v32 = 1;
      goto LABEL_40;
    }
  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v141, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), &stru_1E64A2498);
  v33 = objc_claimAutoreleasedReturnValue();

  v32 = 0;
  v141 = (__CFString *)v33;
LABEL_40:
  v34 = v138;
  if (!v138)
  {
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
      v122 = (_WORD *)objc_claimAutoreleasedReturnValue();
      v156 = v122;
      objc_msgSend(MEMORY[0x1E0CB3500], "lowercaseLetterCharacterSet");
      v123 = (_WORD *)objc_claimAutoreleasedReturnValue();
      v157 = v123;
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v124 = (_WORD *)objc_claimAutoreleasedReturnValue();
      v158 = v124;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v156, 3);
      defaultRequiredCharacterSets(void)::requiredCharacterSets = objc_claimAutoreleasedReturnValue();

    }
    v34 = (id)defaultRequiredCharacterSets(void)::requiredCharacterSets;
  }
  if (objc_msgSend(v34, "count") > v30)
  {

    v35 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[WBSPasswordGenerationManager _generatedPasswordMatchingRequirements:rejectUnwantedWords:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
    v34 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v133, "count"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = 0u;
  v155 = 0u;
  *(_OWORD *)v152 = 0u;
  v153 = 0u;
  v44 = v34;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v152, &v156, 16);
  if (v45)
  {
    v46 = *(_QWORD *)v153;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v153 != v46)
          objc_enumerationMutation(v44);
        v48 = *((_QWORD *)v152[1] + k);
        if (-[__CFString rangeOfCharacterFromSet:](v141, "rangeOfCharacterFromSet:", v48) != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v43, "addObject:", v48);
      }
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", v152, &v156, 16);
    }
    while (v45);
  }

  v49 = v43;
  v146[0] = CFSTR("PasswordGenerationStyle");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v32);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v50;
  v146[1] = CFSTR("NumberOfRequiredRandomCharacters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v51;
  v147[2] = v141;
  v146[2] = CFSTR("AllowedCharacters");
  v146[3] = CFSTR("RequiredCharacterSets");
  v147[3] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 4);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v49;
LABEL_58:

  objc_msgSend(v131, "safari_numberForKey:", CFSTR("PasswordGenerationStyle"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "unsignedIntegerValue");

  objc_msgSend(v131, "safari_numberForKey:", CFSTR("NumberOfRequiredRandomCharacters"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = (char *)objc_msgSend(v54, "unsignedIntegerValue");

  std::vector<unsigned short>::vector(v152, (uint64_t)v133);
  objc_msgSend(v131, "safari_stringForKey:", CFSTR("AllowedCharacters"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "safari_numberForKey:", CFSTR("PasswordRepeatedCharacterLimit"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v126 != 0;
  v125 = 0;
  while (1)
  {
    if (v53 < 2)
    {
      objc_msgSend(v136, "safari_stringForKey:", CFSTR("PasswordFirstCharacterCandidates"));
      v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v133 && -[__CFString length](v141, "length"))
      {
        v59 = obj;
        v60 = v141;
        v61 = operator new(2uLL);
        *v61 = 0;
        v157 = v61 + 1;
        v158 = v61 + 1;
        v156 = v61;
        std::vector<unsigned short>::vector(__p, (uint64_t)(v133 - 1));
        getPasswordRandomCharacters((uint64_t *)&v156, v60);
        getPasswordRandomCharacters((uint64_t *)__p, v59);
        v62 = (char *)v152[0];
        v63 = (char *)v152[1] - (char *)v152[0];
        if (v152[1] == v152[0])
          goto LABEL_179;
        *(_WORD *)v152[0] = *v61;
        v64 = __p[0];
        if ((unint64_t)v133 >= 2)
        {
          v65 = v63 >> 1;
          v66 = ((char *)__p[1] - (char *)__p[0]) >> 1;
          if (v65 <= 1)
            v65 = 1;
          v67 = v62 + 2;
          v68 = v65 - 1;
          v69 = (__int16 *)__p[0];
          v70 = v133 - 1;
          while (v66 && v68)
          {
            v71 = *v69++;
            *v67++ = v71;
            --v68;
            --v66;
            if (!--v70)
              goto LABEL_93;
          }
LABEL_179:
          __break(1u);
          goto LABEL_180;
        }
        if (__p[0])
        {
LABEL_93:
          __p[1] = v64;
          operator delete(v64);
        }
        operator delete(v61);

      }
      else
      {
        getPasswordRandomCharacters((uint64_t *)v152, obj);
      }
      if (v53)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v152[0], v133);
        v77 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v78 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (v152[1] == v152[0] || (void *)((char *)v152[1] - (char *)v152[0]) <= (void *)0x16)
          goto LABEL_179;
        v77 = objc_msgSend(v78, "initWithFormat:", CFSTR("%C%C%C-%C%C%C-%C%C%C-%C%C%C"), *(unsigned __int16 *)v152[0], *((unsigned __int16 *)v152[0] + 1), *((unsigned __int16 *)v152[0] + 2), *((unsigned __int16 *)v152[0] + 3), *((unsigned __int16 *)v152[0] + 4), *((unsigned __int16 *)v152[0] + 5), *((unsigned __int16 *)v152[0] + 6), *((unsigned __int16 *)v152[0] + 7), *((unsigned __int16 *)v152[0] + 8), *((unsigned __int16 *)v152[0] + 9), *((unsigned __int16 *)v152[0] + 10), *((unsigned __int16 *)v152[0] + 11));
      }
      v79 = (void *)v77;
      objc_msgSend(v131, "safari_arrayForKey:", CFSTR("RequiredCharacterSets"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v79;
      v81 = v80;
      *(_OWORD *)__p = 0u;
      v149 = 0u;
      v150 = 0u;
      v151 = 0u;
      v82 = v81;
      v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __p, &v156, 16);
      v84 = v56;
      if (v83)
      {
        v85 = *(_QWORD *)v149;
        v84 = v56;
        do
        {
          v86 = 0;
          v87 = v84;
          do
          {
            if (*(_QWORD *)v149 != v85)
              objc_enumerationMutation(v82);
            v89 = objc_msgSend(v87, "rangeOfCharacterFromSet:", *((_QWORD *)__p[1] + v86));
            if (v89 == 0x7FFFFFFFFFFFFFFFLL)
            {

              goto LABEL_154;
            }
            objc_msgSend(v87, "stringByReplacingCharactersInRange:withString:", v89, v88, &stru_1E64A2498);
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            ++v86;
            v87 = v84;
          }
          while (v83 != v86);
          v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __p, &v156, 16);
        }
        while (v83);
      }

      if (v129)
      {
        tokenizedPassword(v56, v53);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = -[WBSPasswordGenerationManager _tokensContainUnwantedWords:](self, "_tokensContainUnwantedWords:", v90);

        if (v91)
          goto LABEL_154;
      }

      goto LABEL_111;
    }
    if (v53 - 2 >= 2)
    {
      v56 = 0;
LABEL_111:
      if (!v139)
      {
        v139 = 0;
        goto LABEL_125;
      }
      goto LABEL_112;
    }
    -[WBSPasswordGenerationManager _moreTypeablePassword](self, "_moreTypeablePassword");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (v129)
    {
      tokenizedPassword(v55, v53);
      v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (-[WBSPasswordGenerationManager _tokensContainUnwantedWords:](self, "_tokensContainUnwantedWords:"))
      {
        v57 = v125 + 1;
        if (v53 == 2)
          v58 = 0;
        else
          v58 = v53;
        if (v58 == 3)
          v58 = 1;
        ++v125;
        if (v57 > 0x64)
          v53 = v58;
LABEL_154:

        goto LABEL_155;
      }

    }
    if (v53 == 2)
    {
      v72 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v56, "substringWithRange:", 0, 6);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "substringWithRange:", 6, 6);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "substringWithRange:", 12, 6);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "stringWithFormat:", CFSTR("%@-%@-%@"), v73, v74, v75);
      v76 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v76 = (uint64_t)v56;
    }
    if (!v139 || objc_msgSend(v126, "integerValue") != 1)
    {
      v139 = 0;
      v56 = (id)v76;
      goto LABEL_125;
    }
    v56 = (id)v76;
LABEL_112:
    v92 = objc_msgSend(v126, "integerValue");
    if (v92 < 1)
      break;
    v56 = v56;
    v93 = objc_msgSend(v56, "characterAtIndex:", 0);
    v94 = 0;
    v95 = 1;
    for (m = 1; m < objc_msgSend(v56, "length"); ++m)
    {
      v97 = objc_msgSend(v56, "characterAtIndex:", m);
      v98 = m - v94;
      if (m - v94 <= v95)
        v98 = v95;
      if (v97 != v93)
      {
        v95 = v98;
        v94 = m;
      }
      v93 = v97;
    }

    v139 = 1;
    if (v95 <= v92)
      goto LABEL_125;
LABEL_155:

  }
  v139 = 1;
LABEL_125:
  objc_msgSend(v136, "safari_numberForKey:", CFSTR("PasswordConsecutiveCharacterLimit"));
  v141 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v141)
    goto LABEL_156;
  v99 = -[__CFString integerValue](v141, "integerValue");
  if (v99 < 1)
    goto LABEL_156;
  v135 = v53;
  v100 = v56;
  v101 = 0;
  v102 = 0;
  v103 = 1;
  v104 = 1;
  while (2)
  {
    if (v104 < objc_msgSend(v100, "length"))
    {
      v105 = objc_msgSend(v100, "characterAtIndex:", v104);
      v106 = objc_msgSend(v100, "characterAtIndex:", v104 - 1);
      v107 = v106;
      if (v102)
      {
        if (objc_msgSend(v102, "BOOLValue") && v107 + 1 == v105)
          goto LABEL_148;
        v108 = objc_msgSend(v102, "BOOLValue");
        v109 = v107 - 1 == v105 ? v108 : 1;
        if ((v109 & 1) == 0)
          goto LABEL_148;
        if (v107 + 1 == v105)
        {
          v101 = v104 - 1;
          goto LABEL_139;
        }
        if (v107 - 1 == v105)
        {
          v101 = v104 - 1;
LABEL_144:
          v102 = (void *)MEMORY[0x1E0C9AAA0];
LABEL_148:
          ++v104;
          continue;
        }
      }
      else
      {
        if (v106 + 1 == v105)
        {
LABEL_139:
          v102 = (void *)MEMORY[0x1E0C9AAB0];
          goto LABEL_148;
        }
        if (v106 - 1 == v105)
          goto LABEL_144;
      }
      v102 = 0;
      if (v104 - v101 > v103)
        v103 = v104 - v101;
      v101 = v104;
      goto LABEL_148;
    }
    break;
  }
  if (v102)
  {
    v110 = objc_msgSend(v100, "length");
    if (v110 - v101 > v103)
      v103 = v110 - v101;
  }

  v53 = v135;
  if (v103 > v99)
  {
    v56 = v100;
    goto LABEL_154;
  }
LABEL_156:

  if (v152[0])
  {
    v152[1] = v152[0];
    operator delete(v152[0]);
  }

  return v56;
}

- (id)generated15CharacterAlphanumericPassword
{
  return -[WBSPasswordGenerationManager _generated15CharacterAlphanumericPasswordRejectingUnwantedWords:](self, "_generated15CharacterAlphanumericPasswordRejectingUnwantedWords:", 1);
}

- (id)_generated15CharacterAlphanumericPasswordRejectingUnwantedWords:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("PasswordAllowedCharacters");
  v10[0] = CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ0123456789");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPasswordGenerationManager updatedRequirements:respectingMaxLength:](self, "updatedRequirements:respectingMaxLength:", v5, 15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSPasswordGenerationManager _generatedPasswordMatchingRequirements:rejectUnwantedWords:](self, "_generatedPasswordMatchingRequirements:rejectUnwantedWords:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)defaultRequirementsForDomain:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "safari_stringByRemovingWwwDotPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary safari_dictionaryForKey:](self->_passwordRequirementsByDomain, "safari_dictionaryForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v4, "safari_highLevelDomainFromHost");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[NSDictionary safari_dictionaryForKey:](self->_passwordRequirementsByDomain, "safari_dictionaryForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v6 = v8;

  }
  return v6;
}

- (id)defaultRequirementsForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WBSPasswordGenerationManager defaultRequirementsForDomain:](self, "defaultRequirementsForDomain:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)protectionSpaceForGeneratedPasswordsInProtectionSpace:(id)a3
{
  objc_msgSend(a3, "safari_protectionSpaceByReplacingHostWithHighlevelDomain");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)manualPasswordGenerationIsDisallowedByRequirements:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::once != -1)
    dispatch_once(&ignorePasswordGenerationIsDisallowedByRequirements(void)::once, &__block_literal_global_126);
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "safari_BOOLForKey:", CFSTR("ManualPasswordGenerationDisallowed"));

  return v4;
}

- (BOOL)passwordGenerationIsDisallowedByRequirements:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::once != -1)
    dispatch_once(&ignorePasswordGenerationIsDisallowedByRequirements(void)::once, &__block_literal_global_126);
  if (ignorePasswordGenerationIsDisallowedByRequirements(void)::ignorePasswordGenerationIsDisallowedByRequirements)
  {
    v5 = 0;
  }
  else if (-[WBSPasswordGenerationManager manualPasswordGenerationIsDisallowedByRequirements:](self, "manualPasswordGenerationIsDisallowedByRequirements:", v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("PasswordGenerationDisallowed"));
  }

  return v5;
}

- (NSDictionary)passwordRequirementsByDomain
{
  return self->_passwordRequirementsByDomain;
}

- (void)setPasswordRequirementsByDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordRequirementsByDomain, 0);
}

- (void)_generatedPasswordMatchingRequirements:(uint64_t)a3 rejectUnwantedWords:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, a1, a3, "Invalid password generation requirement: more character sets from each of which the password needs to contain at least one symbol than total required random characters in the password. Ignore the character sets.", a5, a6, a7, a8, 0);
}

- (void)_generatedPasswordMatchingRequirements:(uint64_t)a3 rejectUnwantedWords:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1B2621000, a1, a3, "Invalid password generation requirement: min password length > max password length. Ignore min password length value.", a5, a6, a7, a8, 0);
}

@end
