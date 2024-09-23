@implementation TIWordSearchChinesePhonetic

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchChinesePhonetic;
  -[TIWordSearch updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateUserWordEntries](self, "updateUserWordEntries");
  -[TIWordSearch updateDictionaryPaths](self, "updateDictionaryPaths");
}

- (BOOL)shareVocabulary
{
  return 1;
}

- (void)updateFuzzyPinyinSettings
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  int v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;

  -[TIWordSearch inputMode](self, "inputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedIdentifier");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("zh_Hans-Pinyin")) & 1) != 0
    || (objc_msgSend(v20, "isEqualToString:", CFSTR("zh_Hans-Shuangpin")) & 1) != 0
    || (objc_msgSend(v20, "isEqualToString:", CFSTR("zh_Hant-Pinyin")) & 1) != 0
    || objc_msgSend(v20, "isEqualToString:", CFSTR("zh_Hant-Shuangpin")))
  {
    objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", 100);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[TIWordSearchChinesePhonetic fuzzyPinyinEnabled](self, "fuzzyPinyinEnabled");
    if (v5 && (v7 = v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v7 == objc_msgSend(v5, "BOOLValue"))
      {
        -[TIWordSearchChinesePhonetic fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          goto LABEL_19;
      }
      else
      {
        v8 = objc_msgSend(v5, "BOOLValue");
        -[TIWordSearchChinesePhonetic fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v8 & 1) != 0)
        {
LABEL_19:
          objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "valueForKey:", 102);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[TIWordSearchChinesePhonetic fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v15, "isEqualToArray:", v16);

            if ((v17 & 1) != 0)
              goto LABEL_24;
            v18 = objc_msgSend(v15, "copy");
          }
          else
          {
            objc_msgSend(MEMORY[0x24BEB4D08], "defaultFuzzyPinyinPairs");
            v18 = objc_claimAutoreleasedReturnValue();
          }
          v19 = (void *)v18;

          v9 = v19;
LABEL_24:

          v10 = 1;
          v11 = 1;
          if (!-[TIWordSearchChinesePhonetic fuzzyPinyinEnabled](self, "fuzzyPinyinEnabled"))
            goto LABEL_13;
          goto LABEL_12;
        }
      }
    }
    else
    {
      -[TIWordSearchChinesePhonetic fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = 0;
    v11 = 0;
    if (-[TIWordSearchChinesePhonetic fuzzyPinyinEnabled](self, "fuzzyPinyinEnabled"))
      goto LABEL_13;
LABEL_12:
    -[TIWordSearchChinesePhonetic fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    if (v12 == v9)
    {
LABEL_16:

      goto LABEL_17;
    }
LABEL_13:
    -[TIWordSearchChinesePhonetic setFuzzyPinyinPairs:](self, "setFuzzyPinyinPairs:", v9);
    -[TIWordSearchChinesePhonetic setFuzzyPinyinEnabled:](self, "setFuzzyPinyinEnabled:", v11);
    -[TIWordSearch mecabra](self, "mecabra");
    if (-[TIWordSearchChinesePhonetic fuzzyPinyinEnabled](self, "fuzzyPinyinEnabled"))
    {
      -[TIWordSearchChinesePhonetic fuzzyPinyinPairs](self, "fuzzyPinyinPairs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MecabraSetFuzzyPinyinPairs();

    }
    else
    {
      MecabraSetFuzzyPinyinPairs();
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)setCustomDialectLanguageModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[TIWordSearch mecabra](self, "mecabra") && objc_msgSend(v7, "hasSuffix:", CFSTR("Chinese.lm")))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v5, *MEMORY[0x24BEDC800], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);
    -[TIWordSearch mecabra](self, "mecabra");
    MecabraSetAssetDataItemsForType();

  }
}

- (void)updateShuangpinTypeWithReanalysisMode:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[TIWordSearch inputMode](self, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedIdentifier");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("zh_Hans-Shuangpin")) & 1) != 0
    || objc_msgSend(v10, "isEqualToString:", CFSTR("zh_Hant-Shuangpin")))
  {
    if (a3)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForPreferenceKey:", *MEMORY[0x24BEB5100]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v6 = objc_msgSend(v8, "integerValue");
      else
        v6 = 0;

    }
    if ((_DWORD)v6 != -[TIWordSearchChinesePhonetic shuangpinType](self, "shuangpinType"))
    {
      -[TIWordSearchChinesePhonetic setShuangpinType:](self, "setShuangpinType:", v6);
      -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShuangpinType:", v6);

    }
  }

}

- (int)mecabraInputMethodType
{
  void *v2;
  void *v3;
  int v4;

  -[TIWordSearch inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hans-Pinyin")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hans-Shuangpin")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hans")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hant-Pinyin")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hant-Shuangpin")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hant")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("zh_Hant-Zhuyin")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("yue_Hant-Phonetic")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TIWordSearch completeOperationsInQueue](self, "completeOperationsInQueue");
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchChinesePhonetic;
  -[TIWordSearch dealloc](&v3, sel_dealloc);
}

- (unsigned)nameReadingPairGenerationMode
{
  void *v2;
  void *v3;
  int v4;

  -[TIWordSearch inputMode](self, "inputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Zhuyin"));

  if (v4)
    return 3;
  else
    return 1;
}

- (unint64_t)mecabraAnalysisOptionsWithAutocorrectionEnabled:(BOOL)a3 firstSyllableLocked:(BOOL)a4 reanalysisMode:(BOOL)a5 hardwareKeyboardMode:(BOOL)a6 predictionEnabled:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;

  v7 = a7;
  v8 = a5;
  v9 = a4;
  -[TIWordSearchChinesePhonetic updateFuzzyPinyinSettings](self, "updateFuzzyPinyinSettings", a3, a4, a5, a6);
  -[TIWordSearchChinesePhonetic updateShuangpinTypeWithReanalysisMode:](self, "updateShuangpinTypeWithReanalysisMode:", v8);
  if (TI_IS_INTERNAL_INSTALL() && TI_IS_USING_CUSTOM_DIALECT_LM())
    -[TIWordSearchChinesePhonetic setCustomDialectLanguageModel:](self, "setCustomDialectLanguageModel:", TI_DIALECT_LM_PATH());
  if (-[TIWordSearchChinesePhonetic fuzzyPinyinEnabled](self, "fuzzyPinyinEnabled"))
    v11 = 16;
  else
    v11 = 0;
  v12 = -[TIWordSearchChinesePhonetic mecabraInputMethodType](self, "mecabraInputMethodType");
  v13 = v11 | 2;
  if (v7)
    v13 = v11 | 0x800000;
  if (v12 == 5)
    v14 = v13;
  else
    v14 = v11;
  if (-[TIWordSearch autoCorrects](self, "autoCorrects"))
    v14 |= 0x40uLL;
  v15 = -[TIWordSearchChinesePhonetic tenKeyPinyinEnabled](self, "tenKeyPinyinEnabled");
  v16 = 0x2000;
  if (v9)
    v16 = 40960;
  if (!v15)
    v16 = 0;
  v17 = v16 | v14;
  if (v8)
    v18 = v17 | 0x4000;
  else
    v18 = v17;
  v19 = -[TIWordSearch shouldLearnAcceptedCandidate](self, "shouldLearnAcceptedCandidate");
  v20 = v18 | 0x80;
  if (v19)
    v20 = v18;
  return v20 | 0x80000;
}

- (void)clearCacheForInputString:(id)a3 keyboardInput:(id)a4 unambiguousSyllableCount:(unint64_t)a5 selectedDisambiguationCandidateIndex:(unint64_t)a6
{
  _BOOL4 v9;
  MCKeyboardInput *v10;
  NSString *v11;
  void *v12;
  id v13;

  v9 = a6 == 0x7FFFFFFFFFFFFFFFLL;
  v10 = (MCKeyboardInput *)a4;
  v11 = (NSString *)a3;
  -[TIWordSearch candidatesCache](self, "candidatesCache");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  GetCacheKey(v11, v10, v9, a5, 0, 0, 0x7FFFFFFFFFFFFFFFLL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "removeObjectForKey:", v12);
}

- (id)candidatesCacheKeyForOperation:(id)a3
{
  id v3;
  _BOOL4 v4;
  NSString *v5;
  MCKeyboardInput *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "selectedDisambiguationCandidateIndex") == 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "inputString");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyboardInput");
  v6 = (MCKeyboardInput *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "unambiguousSyllableCount");
  v8 = objc_msgSend(v3, "reanalysisMode");
  v9 = objc_msgSend(v3, "predictionEnabled");
  v10 = objc_msgSend(v3, "segmentBreakIndex");

  GetCacheKey(v5, v6, v4, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)uncachedCandidatesForOperation:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  TIWordSearchChinesePhonetic *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  char v22;
  int v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  os_signpost_id_t v27;
  void *v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  os_signpost_id_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  char v55;
  unint64_t v56;
  uint64_t NextCandidate;
  uint64_t v58;
  void *v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  unint64_t v67;
  uint64_t v68;
  BOOL v69;
  char v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *SyllableSequences;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  TIWordSearchChinesePhonetic *v98;
  void *v99;
  void *v100;
  TIWordSearchChinesePhonetic *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t k;
  void *v107;
  void *v108;
  unint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  TIWordSearchChinesePhonetic *v126;
  id v127;
  uint64_t v128;
  void *context;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  id obj;
  id obja;
  void *v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[128];
  _BYTE v152[128];
  uint8_t v153[128];
  uint8_t buf[4];
  void *v155;
  uint64_t v156;

  v156 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BEB5468]);
  v6 = v4;
  objc_msgSend(v6, "inputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "segmentBreakIndex");
  objc_msgSend(v6, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geometryModelData");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v6;
  v128 = objc_msgSend(v6, "unambiguousSyllableCount");
  context = (void *)MEMORY[0x249597680]();
  objc_msgSend((id)objc_opt_class(), "pinyinCharacterSetWithTones");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v10);

  obj = (id)arc4random();
  v134 = v11;
  if (objc_msgSend(v7, "length")
    || (objc_msgSend(v138, "keyboardInput"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v7, "substringFromIndex:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringToIndex:", v8);
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v14;
    }
    v131 = (void *)v13;
    v15 = self;
    v16 = -[TIWordSearch addFacemarkCandidatesToResultSet:forInput:](self, "addFacemarkCandidatesToResultSet:forInput:", v5, v7);
    v17 = v9;
    if (v16)
    {
      v18 = 0;
      v19 = 0;
LABEL_13:

      v21 = v7;
      v22 = 0;
      v23 = 1;
      v133 = v21;
LABEL_14:
      v9 = v17;
      self = v15;
      goto LABEL_15;
    }
    +[TIKeyboardInputManagerChinese GB18030CandidateFromString:](TIKeyboardInputManagerChinese, "GB18030CandidateFromString:", v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      v20 = 0;
      v18 = v19;
LABEL_12:
      objc_msgSend(v5, "addSyntheticMecabraCandidateWithSurface:input:", v18, v7);
      v18 = v20;
      goto LABEL_13;
    }
    +[TIKeyboardInputManagerChinese unicodeCandidateFromString:](TIKeyboardInputManagerChinese, "unicodeCandidateFromString:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "length"))
    {
      v20 = v18;
      goto LABEL_12;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_13;
    v43 = -[TIWordSearchChinesePhonetic mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:](v15, "mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:", 0, v128 != 0, objc_msgSend(v138, "reanalysisMode"), objc_msgSend(v138, "hardwareKeyboardMode"), objc_msgSend(v138, "predictionEnabled"));
    objc_msgSend(v138, "logger");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "markTime:", 2);

    objc_msgSend(v138, "keyboardInput");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      kdebug_trace();
      kac_get_log();
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = os_signpost_id_make_with_pointer(v46, obj);
      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v48 = v47;
        if (os_signpost_enabled(v46))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_248040000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v48, "kbdCPMecabraCandidates", " enableTelemetry=YES ", buf, 2u);
        }
      }

      objc_msgSend(v138, "keyboardInput");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "asSearchString");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIWordSearch mecabraEnvironment](v15, "mecabraEnvironment");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "keyboardInput");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v51, "analyzeInput:options:", v52, v43);

      v54 = v50;
    }
    else
    {
      -[TIWordSearch mecabraEnvironment](v15, "mecabraEnvironment");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "setGeometryModel:modelData:", v17, v130);

      -[TIWordSearch mecabraEnvironment](v15, "mecabraEnvironment");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v120, "analyzeString:options:", v7, v43);

      v54 = v7;
    }
    v21 = v54;
    if ((v53 & 1) == 0)
    {
      v16 = 0;
      v22 = 0;
      v23 = 1;
      v133 = v54;
      goto LABEL_14;
    }
    v36 = v131;
  }
  else
  {
    v35 = v7;
    v21 = v35;
    v36 = 0;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v131 = 0;
      v16 = 0;
      v22 = 0;
      v23 = 1;
      v133 = v35;
      goto LABEL_15;
    }
    v15 = self;
    v17 = v9;
  }
  v131 = v36;
  v37 = v5;
  v38 = 0;
  if ((objc_msgSend(v138, "isCancelled") & 1) != 0)
  {
    v39 = v21;
    v133 = v21;
  }
  else
  {
    v55 = 0;
    v56 = 0x24BEB4000uLL;
    v39 = v21;
    v133 = v21;
    while (1)
    {
      -[TIWordSearch mecabra](v15, "mecabra");
      NextCandidate = MecabraGetNextCandidate();
      if (!NextCandidate)
        break;
      v58 = NextCandidate;
      if (MecabraCandidateGetType() == 6)
      {
        objc_msgSend(v37, "addMecabraProactiveCandidate:triggerSourceType:", v58, 0);
        if ((objc_msgSend(v138, "isCancelled") & 1) != 0)
          break;
      }
      else
      {
        v59 = (void *)objc_msgSend(objc_alloc(*(Class *)(v56 + 3712)), "initWithMecabraCandidate:", v58);
        objc_msgSend(v37, "addMecabraCandidate:mecabraCandidateRef:", v59, v58);
        if ((v55 & 1) != 0)
        {
          v55 = 1;
        }
        else if (-[TIWordSearchChinesePhonetic tenKeyPinyinEnabled](v15, "tenKeyPinyinEnabled"))
        {
          if (objc_msgSend(v39, "length"))
          {
            objc_msgSend(MEMORY[0x24BEB4E80], "convertedInputFromMecabraCandidate:", v58);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            v61 = objc_msgSend(v60, "length");
            v62 = objc_msgSend(v39, "length");
            if (v62 <= v61)
            {
              v55 = 1;
              v133 = v60;
            }
            else
            {
              +[TIKeyboardInputManagerChinesePhonetic stringFallBackForTenKeyInput:range:](TIKeyboardInputManagerChinesePhonetic, "stringFallBackForTenKeyInput:range:", v39, v61, v62 - v61);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v63;
              if (v61)
              {
                objc_msgSend(v60, "stringByAppendingString:", v63);
                v65 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v65 = v63;
              }
              v133 = v65;

              v55 = 1;
            }
          }
          else
          {
            v55 = 0;
          }
          v56 = 0x24BEB4000;
        }
        else
        {
          v55 = 0;
        }
        if ((v38 & 1) == 0)
        {
          objc_msgSend(v59, "candidate");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = v56;
          v68 = objc_msgSend(v66, "compare:", v133);

          v69 = v68 == 0;
          v56 = v67;
          if (v69)
            v38 = 1;
        }

        if (objc_msgSend(v138, "isCancelled"))
          break;
      }
    }
  }
  v5 = v37;
  objc_msgSend(v37, "proactiveTriggers");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  v9 = v17;
  self = v15;
  v21 = v39;
  if (v41 && TICanLogMessageAtLevel())
  {
    TIOSLogFacility();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v121 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "proactiveTriggers");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Mecabra found conversion proactive triggers: %@"), "-[TIWordSearchChinesePhonetic uncachedCandidatesForOperation:]", v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v155 = v123;
      _os_log_debug_impl(&dword_248040000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v23 = 0;
  v16 = 0;
  v22 = v38 & 1;
LABEL_15:
  objc_msgSend(v138, "keyboardInput");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    kdebug_trace();
    kac_get_log();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = os_signpost_id_make_with_pointer(v25, obj);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v27 = v26;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_248040000, v25, OS_SIGNPOST_INTERVAL_END, v27, "kbdCPMecabraCandidates", " enableTelemetry=YES ", buf, 2u);
      }
    }

  }
  v28 = v138;
  objc_msgSend(v138, "logger");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "markTime:", 3);

  objc_msgSend(v5, "candidates");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v132, "count");
  if (-[TIWordSearchChinesePhonetic tenKeyPinyinEnabled](self, "tenKeyPinyinEnabled")
    && !v30
    && objc_msgSend(v21, "length"))
  {
    +[TIKeyboardInputManagerChinesePhonetic stringFallBackForTenKeyInput:range:](TIKeyboardInputManagerChinesePhonetic, "stringFallBackForTenKeyInput:range:", v21, 0, objc_msgSend(v21, "length"));
    v31 = objc_claimAutoreleasedReturnValue();

    v133 = (void *)v31;
  }
  if ((objc_msgSend(v138, "isCancelled") & 1) == 0)
  {
    if ((v22 & 1) == 0)
    {
      if (-[TIWordSearchChinesePhonetic mecabraInputMethodType](self, "mecabraInputMethodType") == 5
        && (unint64_t)objc_msgSend(v21, "length") <= 4
        && objc_msgSend(v21, "length"))
      {
        if (v30 >= 6)
          v32 = 6;
        else
          v32 = v30;
        if (v30 < 7)
        {
          v33 = 0;
        }
        else
        {
          v33 = 0;
          while (1)
          {
            v34 = v33;
            objc_msgSend(v132, "objectAtIndex:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v33, "isEmojiCandidate"))
              break;
            if (v30 == ++v32)
            {
              v32 = v30;
              break;
            }
          }
        }
        objc_msgSend(v5, "insertSyntheticMecabraCandidateWithSurface:input:atIndex:", v133, v133, v32);

        v28 = v138;
      }
      else if (objc_msgSend(v133, "length"))
      {
        objc_msgSend(v5, "addSyntheticMecabraCandidateWithSurface:input:", v133, v133);
      }
    }
    v70 = v134 != 0x7FFFFFFFFFFFFFFFLL || v16;
    if ((v70 & 1) == 0)
    {
      objc_msgSend(v133, "_stringByConvertingFromHalfWidthToFullWidth");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", v71) & 1) == 0)
        objc_msgSend(v5, "addSyntheticMecabraCandidateWithSurface:input:isExtension:", v71, v133, 1);

    }
  }
  if ((objc_msgSend(v28, "isCancelled") & 1) == 0
    && -[TIWordSearchChinesePhonetic tenKeyPinyinEnabled](self, "tenKeyPinyinEnabled")
    && ((v23 | objc_msgSend(v28, "reanalysisMode")) & 1) == 0)
  {
    if ((objc_msgSend(v28, "regenerateDisambiguationCandidates") & 1) != 0
      || (objc_msgSend(v28, "disambiguationCandidates"),
          v72 = (void *)objc_claimAutoreleasedReturnValue(),
          v73 = objc_msgSend(v72, "count"),
          v72,
          !v73))
    {
      v127 = v21;
      if (v128)
      {
        v124 = v9;
        v125 = v5;
        v126 = self;
        -[TIWordSearch mecabra](self, "mecabra");
        SyllableSequences = (void *)MecabraCreateSyllableSequences();
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = 0u;
        v144 = 0u;
        v145 = 0u;
        v146 = 0u;
        obja = SyllableSequences;
        v76 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v152, 16);
        if (v76)
        {
          v77 = v76;
          v78 = *(_QWORD *)v144;
          do
          {
            for (i = 0; i != v77; ++i)
            {
              if (*(_QWORD *)v144 != v78)
                objc_enumerationMutation(obja);
              objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("' "));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = objc_msgSend(v80, "count");
              if (v81 > objc_msgSend(v28, "unambiguousSyllableCount"))
              {
                objc_msgSend(v80, "objectAtIndexedSubscript:", objc_msgSend(v28, "unambiguousSyllableCount"));
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v82, "componentsSeparatedByString:", CFSTR(" "));
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v83, "firstObject");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                v85 = objc_msgSend(v84, "isEqualToString:", CFSTR(")"));

                if (v85)
                {
                  objc_msgSend(v83, "subarrayWithRange:", 1, objc_msgSend(v83, "count") - 1);
                  v86 = objc_claimAutoreleasedReturnValue();

                  v83 = (void *)v86;
                }
                objc_msgSend(v83, "firstObject");
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v87, "hasPrefix:", CFSTR("("))
                  && objc_msgSend(v87, "hasSuffix:", CFSTR(")")))
                {
                  objc_msgSend(v87, "substringWithRange:", 1, objc_msgSend(v87, "length") - 2);
                  v88 = objc_claimAutoreleasedReturnValue();

                  v87 = (void *)v88;
                }
                if (v87 && (objc_msgSend(v87, "isEqualToString:", CFSTR("Mixed")) & 1) == 0)
                  objc_msgSend(v135, "addObject:", v87);

                v28 = v138;
              }

            }
            v77 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v152, 16);
          }
          while (v77);
        }

        objc_msgSend(v135, "allObjects");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "sortedArrayUsingComparator:", &__block_literal_global_50_844);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v90, "count"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v92 = v90;
        v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
        v9 = v124;
        v21 = v127;
        if (v93)
        {
          v94 = v93;
          v95 = *(_QWORD *)v140;
          do
          {
            for (j = 0; j != v94; ++j)
            {
              if (*(_QWORD *)v140 != v95)
                objc_enumerationMutation(v92);
              objc_msgSend(MEMORY[0x24BEB4EA0], "candidateWithPinyinSyllable:", *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * j));
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "addObject:", v97);

            }
            v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
          }
          while (v94);
        }

        if (objc_msgSend(v91, "count"))
        {
          v5 = v125;
          objc_msgSend(v125, "setDisambiguationCandidates:", v91);
        }
        else
        {
          objc_msgSend(v138, "disambiguationCandidates");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v125;
          objc_msgSend(v125, "setDisambiguationCandidates:", v108);

          objc_msgSend(v125, "setSelectedDisambiguationCandidateIndex:", objc_msgSend(v138, "selectedDisambiguationCandidateIndex"));
        }
        self = v126;

        v28 = v138;
      }
      else
      {
        v98 = self;
        v99 = v5;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v98;
        -[TIWordSearch mecabra](v98, "mecabra");
        v147 = 0u;
        v148 = 0u;
        v149 = 0u;
        v150 = 0u;
        v102 = (id)MecabraCreatePinyinSyllableArray();
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v147, v153, 16);
        if (v103)
        {
          v104 = v103;
          v105 = *(_QWORD *)v148;
          do
          {
            for (k = 0; k != v104; ++k)
            {
              if (*(_QWORD *)v148 != v105)
                objc_enumerationMutation(v102);
              objc_msgSend(MEMORY[0x24BEB4EA0], "candidateWithPinyinSyllable:", *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * k));
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "addObject:", v107);

            }
            v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v147, v153, 16);
          }
          while (v104);
        }

        v5 = v99;
        objc_msgSend(v99, "setDisambiguationCandidates:", v100);

        v28 = v138;
        self = v101;
        v21 = v127;
      }
    }
    else
    {
      objc_msgSend(v28, "disambiguationCandidates");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDisambiguationCandidates:", v74);

      objc_msgSend(v5, "setSelectedDisambiguationCandidateIndex:", objc_msgSend(v28, "selectedDisambiguationCandidateIndex"));
    }
  }
  if (objc_msgSend(v131, "length"))
  {
    v109 = -[TIWordSearchChinesePhonetic mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:](self, "mecabraAnalysisOptionsWithAutocorrectionEnabled:firstSyllableLocked:reanalysisMode:hardwareKeyboardMode:predictionEnabled:", 0, v128 != 0, objc_msgSend(v28, "reanalysisMode"), objc_msgSend(v28, "hardwareKeyboardMode"), 0);
    objc_msgSend(v28, "logger");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "markTime:", 2);

    -[TIWordSearch mecabraEnvironment](self, "mecabraEnvironment");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v109) = objc_msgSend(v111, "analyzeString:options:", v131, v109);

    if ((_DWORD)v109)
    {
      while ((objc_msgSend(v28, "isCancelled") & 1) == 0)
      {
        -[TIWordSearch mecabra](self, "mecabra");
        v112 = MecabraGetNextCandidate();
        if (!v112)
          break;
        v113 = v112;
        if (MecabraCandidateGetType() != 6)
        {
          v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E80]), "initWithMecabraCandidate:", v113);
          objc_msgSend(v28, "setCandidateAfterSegmentBreak:", v114);
          objc_msgSend(v5, "setCandidateAfterSegmentBreak:", v114);
          objc_msgSend(v5, "candidateRefsDictionary");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "mecabraCandidatePointerValue");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "setObject:forKey:", v113, v116);

          v28 = v138;
          break;
        }
      }
    }
    objc_msgSend(v28, "logger");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "markTime:", 3);

  }
  objc_autoreleasePoolPop(context);

  return v5;
}

- (BOOL)fuzzyPinyinEnabled
{
  return self->_fuzzyPinyinEnabled;
}

- (void)setFuzzyPinyinEnabled:(BOOL)a3
{
  self->_fuzzyPinyinEnabled = a3;
}

- (BOOL)tenKeyPinyinEnabled
{
  return self->_tenKeyPinyinEnabled;
}

- (void)setTenKeyPinyinEnabled:(BOOL)a3
{
  self->_tenKeyPinyinEnabled = a3;
}

- (int)shuangpinType
{
  return self->_shuangpinType;
}

- (void)setShuangpinType:(int)a3
{
  self->_shuangpinType = a3;
}

- (NSArray)fuzzyPinyinPairs
{
  return self->_fuzzyPinyinPairs;
}

- (void)setFuzzyPinyinPairs:(id)a3
{
  objc_storeStrong((id *)&self->_fuzzyPinyinPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyPinyinPairs, 0);
}

uint64_t __62__TIWordSearchChinesePhonetic_uncachedCandidatesForOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "length");
  if (v6 == objc_msgSend(v4, "length"))
  {
    v7 = objc_msgSend(v5, "compare:", v4);

  }
  else
  {
    v8 = objc_msgSend(v5, "length");

    if (v8 > objc_msgSend(v4, "length"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

+ (id)pinyinCharacterSetWithTones
{
  if (+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__onceToken != -1)
    dispatch_once(&+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__onceToken, &__block_literal_global_872);
  return (id)+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__pinyinCharsWithTones;
}

void __58__TIWordSearchChinesePhonetic_pinyinCharacterSetWithTones__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("āáǎàēéěèìǐíīōòǒóūúǔùüǖǘǚǜĀÁǍÀĒÉĚÈÌǏÍĪÒǑÓŌÙǓÚŪǛǙǗǕÜ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__pinyinCharsWithTones;
  +[TIWordSearchChinesePhonetic pinyinCharacterSetWithTones]::__pinyinCharsWithTones = v0;

}

@end
