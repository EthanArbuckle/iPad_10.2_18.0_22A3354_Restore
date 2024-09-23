@implementation AutocorrectionTestHarness

- (id)keyboardFromWidth:(id)a3 orientation:(id)a4 keyboardLayout:(id)a5
{
  id v7;
  id v8;
  float v9;
  float v10;
  __CFString *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  float v17;
  const __CFString *v18;
  float v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  FILE *v23;
  id v24;
  void *v25;
  void *v26;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "floatValue");
  v10 = v9;
  if (v9 >= 320.0)
  {
    objc_msgSend(MEMORY[0x24BEB5AF0], "sharedKeyboardFactory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0
      || (v14 = objc_msgSend(v7, "isEqualToString:", CFSTR("Portrait")),
          objc_msgSend(MEMORY[0x24BEB5AF0], "sharedKeyboardFactory"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "keyboardPrefixForWidth:andEdge:", v14, v10),
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v11))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Portrait")))
      {
        v16 = CFSTR("Wildcat-PortraitFudge");
        v17 = 1024.0;
        v18 = CFSTR("Wildcat-Portrait");
        v19 = 768.0;
        v20 = CFSTR("iPhone-Portrait");
        if (v10 < 320.0)
          v20 = 0;
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("Landscape")))
        {
          v11 = 0;
          goto LABEL_20;
        }
        v16 = CFSTR("Wildcat-LandscapeFudge");
        v17 = 1366.0;
        v18 = CFSTR("Wildcat-Landscape");
        v19 = 1024.0;
        v20 = CFSTR("iPhone-Caymen");
        v21 = CFSTR("iPhone-Landscape");
        if (v10 < 480.0)
          v21 = 0;
        if (v10 < 568.0)
          v20 = v21;
      }
      if (v10 < v19)
        v18 = v20;
      if (v10 < v17)
        v11 = (__CFString *)v18;
      else
        v11 = (__CFString *)v16;
    }
  }
  else
  {
    v11 = CFSTR("iPhone-Portrait");
  }
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v11, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (FILE *)*MEMORY[0x24BDAC8D8];
  v24 = objc_retainAutorelease(v22);
  fprintf(v23, "Attempting to load keyboard named: %s\n", (const char *)objc_msgSend(v24, "UTF8String"));
  objc_msgSend(MEMORY[0x24BEB5AF0], "sharedKeyboardFactory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "keyboardWithName:inCache:", v24, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (AutocorrectionTestHarness)initWithAttributes:(id)a3
{
  void *v3;
  __CFString *v4;
  id v6;
  AutocorrectionTestHarness *v7;
  uint64_t v8;
  NSString *typologyOutpath;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  TIInputMode *secondaryInputMode;
  TIKeyboardTyper *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  int v65;
  int v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  char v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  char v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  TTKSimpleKeyboardPlane *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  const __CFString *v125;
  void *v126;
  void *v127;
  TITestUserPersona *v128;
  void *v129;
  TITestUserPersona *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  TITestTyperDriver *dslTestDriver;
  NSMutableArray *v136;
  NSMutableArray *insertedText;
  NSMutableArray *v138;
  NSMutableArray *resultClassifiers;
  void *v140;
  void *v141;
  void *v142;
  TITestTyperDriver *v143;
  TITestTyperDriver *v144;
  AutocorrectionTestHarness *v145;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  AutocorrectionTestHarness *v155;
  id v156;
  objc_super v157;

  v6 = a3;
  v157.receiver = self;
  v157.super_class = (Class)AutocorrectionTestHarness;
  v7 = -[AutocorrectionTestHarness init](&v157, sel_init);

  v155 = v7;
  if (!v7)
    goto LABEL_137;
  objc_msgSend(v6, "valueForKey:", CFSTR("TYPOLOGY_OUTPATH"));
  v8 = objc_claimAutoreleasedReturnValue();
  typologyOutpath = v7->_typologyOutpath;
  v7->_typologyOutpath = (NSString *)v8;

  v156 = objc_alloc_init(MEMORY[0x24BEB53B0]);
  objc_msgSend(v156, "setDisableAnalytics:", 1);
  objc_msgSend(v6, "valueForKey:", CFSTR("INPUT_MODE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = v10;
  if (objc_msgSend(v10, "containsString:", CFSTR("sw=")))
  {
    v153 = v10;
  }
  else
  {
    UIKeyboardGetSupportedSoftwareKeyboardsForInputModeAndIdiom();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    UIKeyboardInputModeWithNewSWLayout();
    v153 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("SIRI_MODE"));
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = CFSTR("NO");
  if (!v13)
    v13 = CFSTR("NO");
  v16 = -[__CFString BOOLValue](v13, "BOOLValue");

  v17 = (void *)0x24BEB5000;
  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:isSiriMode:", v153, v16);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "normalizedIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("USE_LANGUAGE_MODEL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5028]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v156, "setUsesWordNgramModel:", objc_msgSend(v20, "BOOLValue"));
  if (!v19)

  if (objc_msgSend(v156, "usesWordNgramModel")
    && (objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v152, "keyboardFeatureSpecializationClassFromInputModeProperties"))
  {
    objc_msgSend(v152, "setQuickTypeKeyboardFeatureSpecializationClass");
  }
  +[AutocorrectionTestHarness overrideInputMode:](AutocorrectionTestHarness, "overrideInputMode:", v152);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setInputMode:", v21);

  objc_msgSend(v156, "inputMode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setAllowsSpaceCorrections:", objc_msgSend(v22, "spaceAutocorrectionEnabled"));

  objc_msgSend(v156, "inputMode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setUsesETSRescoring:", objc_msgSend(v23, "typedStringLMRankingEnabled"));

  objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB4FF8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setUsesTextChecker:", objc_msgSend(v24, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("USE_RETROCORRECTION"));
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25)
    v25 = CFSTR("NO");
  objc_msgSend(v156, "setUsesRetrocorrection:", -[__CFString BOOLValue](v25, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("WORD_LEARNING_ENABLED"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "BOOLValue") & 1) != 0)
  {
    v28 = 1;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("USES_ADAPTATION"));
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = v29;
    if (!v29)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("USE_WORD_NGRAM_MODEL_ADAPTATION"));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v29;
      if (!v29)
        v29 = CFSTR("NO");
    }
    v28 = -[__CFString BOOLValue](v29, "BOOLValue");
    if (!v3)

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v156, "setUsesAdaptation:", v28);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v156, "setUsesWordNgramModelAdaptation:", v28);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("NEGATIVE_LEARNING_ENABLED"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setNegativeLearningDisabled:", objc_msgSend(v30, "BOOLValue") ^ 1);

  objc_msgSend(v6, "objectForKey:", CFSTR("MAX_WORDS_PER_PREDICTION"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (!v31)
    v31 = &unk_24FD5F780;
  objc_msgSend(v156, "setMaxWordsPerPrediction:", objc_msgSend(v31, "integerValue"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("CUSTOM_STATIC_DICTIONARY_PATH"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setUsesCustomStaticDictionary:", v33 != 0);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("CUSTOM_STATIC_DICTIONARY_PATH"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "setStaticDictionaryPath:", v34);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("CUSTOM_LANGUAGE_MODEL_PATH"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setUsesCustomNgramModel:", v35 != 0);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("CUSTOM_LANGUAGE_MODEL_PATH"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36)
  {
    objc_msgSend(v156, "inputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageWithRegion");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    TINgramModelPathForInputMode();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v156, "setNgramModelPath:", v37);
  if (!v36)
  {

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("CUSTOM_DYNAMIC_RESOURCE_PATH"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (!v38)
  {
    UIKeyboardUserDirectory();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v156, "setDynamicResourcePath:", v39);
  if (!v38)

  objc_msgSend(v6, "objectForKey:", CFSTR("CUSTOM_SHAPE_STORE_DIR"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (!v40)
  {
    objc_msgSend(v156, "dynamicResourcePath");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v156, "setShapeStoreResourceDir:", v41);
  if (!v40)

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5048]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setUsesStemSuffixCorrectionFactor:", objc_msgSend(v42, "BOOLValue"));

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("FAVONIUS_LANGUAGE_MODEL_WEIGHT"));
  v43 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v150 = (void *)v43;
    v44 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v44, "setNumberStyle:", 1);
    objc_msgSend(v6, "objectForKey:", CFSTR("FAVONIUS_LANGUAGE_MODEL_WEIGHT"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "numberFromString:", v41);
    v43 = objc_claimAutoreleasedReturnValue();

  }
  if (v43)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v156, "setFavoniusLanguageModelWeight:", v43);
  }
  v151 = (void *)v43;
  objc_msgSend(v6, "objectForKey:", CFSTR("MLTT_BUNDLE_URL"));
  v45 = objc_claimAutoreleasedReturnValue();
  v147 = (void *)v45;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v156, "setMlttBundleURL:", v45);
  objc_msgSend(v156, "setTesting:", 1);
  objc_msgSend(v156, "setUsesUserModelLogging:", 0);
  objc_msgSend(v156, "setStickerSuggestionsEnabled:", 0);
  objc_storeStrong((id *)&v7->_config, v156);
  objc_msgSend(v6, "objectForKey:", CFSTR("MAX_PREDICTIONS"));
  v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("SIZE_OF_AUTOCORRECTION_LIST"));
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v41 = v46;
    if (!v46)
      v46 = CFSTR("3");
  }
  v48 = -[__CFString intValue](v46, "intValue");
  if (!v47)

  objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5040]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "BOOLValue");

  if (v50)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("MULTILINGUAL_ENABLED"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (!v51)
      v51 = (void *)MEMORY[0x24BDBD1C0];
    v155->_multilingualEnabled = objc_msgSend(v51, "BOOLValue");

  }
  else
  {
    v155->_multilingualEnabled = 0;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("KEYBOARD_SECOND_LANGUAGE"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v149, "length"))
  {
    objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v149);
    v53 = objc_claimAutoreleasedReturnValue();
    secondaryInputMode = v155->_secondaryInputMode;
    v155->_secondaryInputMode = (TIInputMode *)v53;

  }
  v55 = -[TIKeyboardTyper initWithInputMode:]([TIKeyboardTyper alloc], "initWithInputMode:", v152);
  objc_msgSend(v6, "objectForKey:", CFSTR("BAD_SENTENCES_FILE_PATH"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringValue");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setBadSentenceLogFilePath:](v55, "setBadSentenceLogFilePath:", v57);

  -[TIKeyboardTyper setInputModeIdentifier:](v55, "setInputModeIdentifier:", v153);
  objc_msgSend(v6, "objectForKey:", CFSTR("PRINT_TYPING_TRANSCRIPT"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setPrintTypingTranscript:](v55, "setPrintTypingTranscript:", objc_msgSend(v58, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("SHOW_CANDIDATE_BAR"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setShowsCandidateBar:](v55, "setShowsCandidateBar:", objc_msgSend(v59, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("TRANSLITERATION_SUMMARIES"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setPrintTranslitSummaries:](v55, "setPrintTranslitSummaries:", objc_msgSend(v60, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("TEST_AUTO_FILL_FEATURE"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = objc_msgSend(v61, "BOOLValue");

  -[TIKeyboardTyper keyboardController](v55, "keyboardController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v57)
    objc_msgSend(v62, "setIsScreenLocked:", 0);
  else
    objc_msgSend(v62, "setIsScreenLocked:", v28 ^ 1);

  objc_msgSend(v6, "objectForKey:", CFSTR("USE_LANGUAGE_MODEL"));
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v63;
  if (v63)
  {
    v65 = 0;
    v66 = 0;
    v67 = (void *)v63;
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("USE_PREDICTION"));
    v68 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v68;
    if (v68)
    {
      v65 = 0;
      v66 = 0;
      v67 = (void *)v68;
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("AUTOCORRECTION_LISTS"));
      v69 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v69;
      if (v69)
      {
        v62 = 0;
        v66 = 0;
        v65 = 1;
        v67 = (void *)v69;
      }
      else
      {
        objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5020]);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        v17 = 0;
        v65 = 1;
        v66 = 1;
      }
    }
  }
  v70 = objc_msgSend(v67, "BOOLValue");
  if (v66)
  {

    if (!v65)
      goto LABEL_81;
LABEL_115:

    if (v64)
      goto LABEL_82;
LABEL_116:

    goto LABEL_82;
  }
  if (v65)
    goto LABEL_115;
LABEL_81:
  if (!v64)
    goto LABEL_116;
LABEL_82:

  if (v70)
    -[TIKeyboardTyper setUsesPrediction:](v55, "setUsesPrediction:", 1);
  -[TIKeyboardTyper setMaxPredictions:](v55, "setMaxPredictions:", v48);
  -[TIKeyboardTyper setKeyboardInputManagerFactory:](v55, "setKeyboardInputManagerFactory:", v155);
  objc_msgSend(v6, "objectForKey:", CFSTR("USE_AUTOCORRECTION"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  v73 = (void *)MEMORY[0x24BDBD1C8];
  if (!v71)
    v71 = (void *)MEMORY[0x24BDBD1C8];
  -[TIKeyboardTyper setUsesAutocorrection:](v55, "setUsesAutocorrection:", objc_msgSend(v71, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("USE_AUTOCAPITALIZATION"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (!v74)
    v74 = v73;
  -[TIKeyboardTyper setUsesAutocapitalization:](v55, "setUsesAutocapitalization:", objc_msgSend(v74, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("WORD_LEARNING_ENABLED"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setWordLearningEnabled:](v55, "setWordLearningEnabled:", objc_msgSend(v76, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("WARN_IF_SELECTING_POPUP_VARIANT"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (!v77)
    v77 = (void *)MEMORY[0x24BDBD1C0];
  -[TIKeyboardTyper setWarnIfSelectingPopupVariant:](v55, "setWarnIfSelectingPopupVariant:", objc_msgSend(v77, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("MAX_PREDICTIONS_REPORTED"));
  v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (!v79)
    v79 = CFSTR("0");
  -[TIKeyboardTyper setMaxPredictionsReported:](v55, "setMaxPredictionsReported:", -[__CFString intValue](v79, "intValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("LOG_DOCUMENT_CONTEXT"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (!v81)
    v81 = (void *)MEMORY[0x24BDBD1C0];
  -[TIKeyboardTyper setLogDocumentContext:](v55, "setLogDocumentContext:", objc_msgSend(v81, "BOOLValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("CONTINUOUS_PATH_ENABLED"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (!v83)
    v83 = v73;
  v85 = objc_msgSend(v83, "BOOLValue");

  -[AutocorrectionTestHarness config](v155, "config");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_opt_respondsToSelector();

  if ((v87 & 1) != 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("CONTINUOUS_PATH_APPEND_SPACE"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88;
    if (!v88)
      v88 = (void *)MEMORY[0x24BDBD1C0];
    -[TIKeyboardTyper setInsertsSpaceAfterPredictiveInput:](v55, "setInsertsSpaceAfterPredictiveInput:", objc_msgSend(v88, "BOOLValue"));

    -[AutocorrectionTestHarness config](v155, "config");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "setUsesContinuousPath:", v85);

    -[AutocorrectionTestHarness config](v155, "config");
    v91 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v91, "setUsesCJContinuousPath:", v85);

    -[AutocorrectionTestHarness config](v155, "config");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v91) = objc_opt_respondsToSelector();

    if ((v91 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("CONTINUOUS_PATH_ALGORITHMS"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = v93;
      if (!v93)
        v93 = &unk_24FD5F798;
      v95 = objc_msgSend(v93, "intValue");
      -[AutocorrectionTestHarness config](v155, "config");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "setContinuousPathEnabledAlgorithms:", v95);

    }
    -[AutocorrectionTestHarness config](v155, "config");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_opt_respondsToSelector();

    if ((v98 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("ENABLE_CONTINUOUS_PATH_RETROCORRECTION"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v99;
      if (!v99)
        v99 = v73;
      v101 = objc_msgSend(v99, "BOOLValue");
      -[AutocorrectionTestHarness config](v155, "config");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setUsesContinuousPathRetrocorrection:", v101);

    }
    -[AutocorrectionTestHarness config](v155, "config");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_opt_respondsToSelector();

    if ((v104 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("CONTINUOUS_PATH_NUM_CANDIDATE_RESCORED_BY_LM"));
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v105;
      if (!v105)
        v105 = &unk_24FD5F7B0;
      v107 = objc_msgSend(v105, "integerValue");
      -[AutocorrectionTestHarness config](v155, "config");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "setCpCandidatesCount:", v107);

    }
    objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5018]);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTestHarness config](v155, "config");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setContinuousPathParams:", v109);

    objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5010]);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTestHarness config](v155, "config");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "setContinuousPathEnsembleSourceWeights:", v111);

    objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BEB5008]);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTestHarness config](v155, "config");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setContinuousPathEnsembleSourceScales:", v113);

  }
  +[ACTUserActionStreamFactory userActionStreamWithParameters:delegate:](ACTUserActionStreamFactory, "userActionStreamWithParameters:delegate:", v6, v55);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper linkWithUserActionStream:](v55, "linkWithUserActionStream:", v115);

  -[TIKeyboardTyper userModel](v55, "userModel");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setUsesTransliteration:](v55, "setUsesTransliteration:", objc_msgSend(v116, "prefersTransliteration"));

  MEMORY[0x2348A84B4](v153);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("TTKKeyboardPlane"));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TIKeyboardTyper keyboardController](v55, "keyboardController");
    v119 = (TTKSimpleKeyboardPlane *)objc_claimAutoreleasedReturnValue();
    -[TTKSimpleKeyboardPlane setTtkLayout:](v119, "setTtkLayout:", v118);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v119 = -[TTKSimpleKeyboardPlane initWithJsonDictionary:]([TTKSimpleKeyboardPlane alloc], "initWithJsonDictionary:", v118);
      -[TIKeyboardTyper keyboardController](v55, "keyboardController");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "setTtkLayout:", v119);

    }
    else
    {
      objc_msgSend(v118, "description");
      v119 = (TTKSimpleKeyboardPlane *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("TTKKeyboardPlane parameter was provided, but was neither a TTKSimpleKeyboardPlane nor a Dictionary of keys. Value was %@"), v119);
    }
  }

  objc_msgSend(v6, "objectForKey:", CFSTR("KEYBOARD_WIDTH"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("KEYBOARD_ORIENTATION"));
  v122 = objc_claimAutoreleasedReturnValue();
  v123 = (void *)v122;
  if (v121)
    v124 = v121;
  else
    v124 = &unk_24FD5F7C8;
  if (v122)
    v125 = (const __CFString *)v122;
  else
    v125 = CFSTR("Portrait");
  -[AutocorrectionTestHarness keyboardFromWidth:orientation:keyboardLayout:](v155, "keyboardFromWidth:orientation:keyboardLayout:", v124, v125, v117);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardTyper setKeyboard:](v55, "setKeyboard:", v126);

  objc_msgSend(v6, "objectForKey:", CFSTR("PERSONA"));
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  if (v127)
  {
    v128 = [TITestUserPersona alloc];
    objc_msgSend(v6, "objectForKey:", CFSTR("PERSONA"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = -[TITestUserPersona initWithPersonaName:](v128, "initWithPersonaName:", v129);
    -[TIKeyboardTyper setUserPersona:](v55, "setUserPersona:", v130);

    -[TIKeyboardTyper userPersona](v55, "userPersona");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardTyper keyplane](v55, "keyplane");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "updateFromKeyplane:", v132);

  }
  else
  {
    -[TIKeyboardTyper setUserPersona:](v55, "setUserPersona:", 0);
  }
  -[TIKeyboardTyper userPersona](v55, "userPersona");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v133)
  {
    +[TIErrorGenerator errorGeneratorWithAttributes:](TIErrorGenerator, "errorGeneratorWithAttributes:", v6);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v134)
    {
      NSLog(CFSTR("Unable to construct generator from attrs."));
      exit(1);
    }
    -[TIKeyboardTyper setErrorGenerator:](v55, "setErrorGenerator:", v134);

  }
  -[TIKeyboardTyper reset](v55, "reset");
  dslTestDriver = v155->_dslTestDriver;
  v155->_dslTestDriver = 0;

  objc_storeStrong((id *)&v155->_testTyper, v55);
  v136 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  insertedText = v155->_insertedText;
  v155->_insertedText = v136;

  v138 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  resultClassifiers = v155->_resultClassifiers;
  v155->_resultClassifiers = v138;

  -[AutocorrectionTestHarness setResultClassifiers](v155, "setResultClassifiers");
  objc_msgSend(v6, "objectForKey:", CFSTR("SAVE_DEBUG_DATA"));
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v140;
  if (!v140)
    v140 = (void *)MEMORY[0x24BDBD1C0];
  v155->_saveDebugData = objc_msgSend(v140, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("RUN_DSL_TEST"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();

  if (v142)
  {
    v143 = -[TITestTyperDriver initWithTestTyper:]([TITestTyperDriver alloc], "initWithTestTyper:", v55);
    v144 = v155->_dslTestDriver;
    v155->_dslTestDriver = v143;

  }
LABEL_137:
  v145 = v155;

  return v145;
}

- (id)newKeyboardInputManager
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  TIMultilingualPreferenceOverrides *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  TIMultilingualPreferenceOverrides *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  TIDynamicLanguageLikelihoodModel *v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  if (-[AutocorrectionTestHarness multilingualEnabled](self, "multilingualEnabled")
    && (-[AutocorrectionTestHarness config](self, "config"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "inputMode"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isSiriMode"),
        v4,
        v3,
        !v5))
  {
    v39 = objc_alloc_init(TIDynamicLanguageLikelihoodModel);
    v12 = [TIMultilingualPreferenceOverrides alloc];
    -[AutocorrectionTestHarness secondaryInputMode](self, "secondaryInputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTestHarness config](self, "config");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTestHarness config](self, "config");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "inputMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "languageWithRegion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[TIMultilingualPreferenceOverrides initWithPreferredSecondaryInputMode:userEnabledInputModes:userPreferredLanguages:](v12, "initWithPreferredSecondaryInputMode:userEnabledInputModes:userPreferredLanguages:", v13, v16, v20);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB53E8]), "initWithLanguageLikelihoodModel:preferenceProvider:", v39, v21);
    -[AutocorrectionTestHarness config](self, "config");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "inputMode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_msgSend(v24, "multilingualInputManagerClass");

    v26 = [v25 alloc];
    -[AutocorrectionTestHarness config](self, "config");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v26, "initWithConfig:keyboardState:languageSelectionController:", v27, 0, v22);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTestingStateObject:", v28);

  }
  else
  {
    -[AutocorrectionTestHarness config](self, "config");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_msgSend(v7, "inputManagerClass");

    v9 = [v8 alloc];
    -[AutocorrectionTestHarness config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithConfig:keyboardState:", v10, 0);

  }
  -[AutocorrectionTestHarness typologyOutpath](self, "typologyOutpath", v39);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29 == 0;

  if (!v30)
  {
    v31 = objc_alloc(MEMORY[0x24BEB5450]);
    -[AutocorrectionTestHarness typologyOutpath](self, "typologyOutpath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithOutputPath:", v32);
    objc_msgSend(v11, "setTypologyPreferences:", v33);

    v34 = objc_alloc(MEMORY[0x24BEB53C0]);
    objc_msgSend(v11, "typologyPreferences");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v34, "initWithTypologyPreferences:", v35);

    objc_msgSend(v11, "setInputManagerLogger:", v36);
    objc_msgSend(v11, "configurationPropertyList");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setConfig:", v37);

  }
  return v11;
}

- (id)testTerminator
{
  return CFSTR(" ");
}

- (id)replayTest:(id)a3 withError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  +[TITypingLog typingLogWithDebug:](TITypingLog, "typingLogWithDebug:", self->_saveDebugData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intended");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expected");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attemptToTypeIntended:expected:typingLog:", v8, v9, v6);

  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commitText");

  return v6;
}

- (id)typeTest:(id)a3 withError:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  +[TITypingLog typingLogWithDebug:](TITypingLog, "typingLogWithDebug:", self->_saveDebugData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attemptToTypeText:typingLog:", v8, v6);

  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitText");

  return v6;
}

- (id)emptyResultForTest:(id)a3
{
  id v4;
  AutocorrectionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = objc_alloc_init(AutocorrectionResult);
  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "input");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tokensForString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setInput:](v5, "setInput:", v8);

  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "prefersContinuousPath") & 1) != 0)
  {
    -[AutocorrectionTestHarness config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "usesContinuousPath");

    if (v12)
    {
      -[AutocorrectionTestHarness testTyper](self, "testTyper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "input");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "tokensForString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "count");
      v17 = v15;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &stru_24FD49B78);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[AutocorrectionResult setIntended:](v5, "setIntended:", v17);
      if (!v16)
      {
LABEL_12:

        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else
  {

  }
  objc_msgSend(v4, "expectedOutput");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19 < 2)
  {
    objc_msgSend(v4, "expectedOutput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 != 1)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", &stru_24FD49B78);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AutocorrectionResult setIntended:](v5, "setIntended:", v15);
      goto LABEL_14;
    }
    -[AutocorrectionTestHarness testTyper](self, "testTyper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expectedOutput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tokensForString:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionResult setIntended:](v5, "setIntended:", v23);

    goto LABEL_12;
  }
  objc_msgSend(v4, "expectedOutput");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setIntended:](v5, "setIntended:", v15);
LABEL_14:

  objc_msgSend(v4, "corpusId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setCorpusId:](v5, "setCorpusId:", v24);

  return v5;
}

- (id)emptyResultForPlayback:(id)a3
{
  id v3;
  AutocorrectionResult *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(AutocorrectionResult);
  objc_msgSend(v3, "intended");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setInput:](v4, "setInput:", v5);

  objc_msgSend(v3, "intended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setIntended:](v4, "setIntended:", v6);

  objc_msgSend(v3, "corpusId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionResult setCorpusId:](v4, "setCorpusId:", v7);

  return v4;
}

- (unsigned)seedForTest:(id)a3 trialID:(unint64_t)a4
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;

  v4 = a4;
  objc_msgSend(a3, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    v7 = 0;
    v8 = 5381;
    do
      v8 = 33 * v8 + objc_msgSend(v5, "characterAtIndex:", v7++);
    while (v6 != v7);
    v9 = 33 * v8;
  }
  else
  {
    v9 = 177573;
  }
  v10 = v9 + v4;

  return v10;
}

- (id)friendId
{
  return CFSTR("mailto:friend@apple.com");
}

- (id)selfId
{
  return CFSTR("mailto:self@apple.com");
}

- (void)initializeConversationHistory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[AutocorrectionTestHarness friendId](self, "friendId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF20];
  -[AutocorrectionTestHarness selfId](self, "selfId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4D40]), "initWithRecipientIdentifiers:senderIdentifiers:", v11, v7);
  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyboardController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInputContextHistory:", v8);

}

- (void)nullifyConversationHistory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x24BEB4D40]);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("mailto:null@apple.com"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithRecipientIdentifiers:");
  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInputContextHistory:", v4);

  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncToEmptyDocument");

}

- (void)testConversation:(id)a3 testingSender:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7 trialID:(unint64_t)a8 withError:(id)a9 writingResults:(id)a10
{
  id v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  unint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  id obj;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v34 = a6;
  v35 = a7;
  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v39 = a4;
  v31 = a9;
  v32 = a10;
  -[AutocorrectionTestHarness initializeConversationHistory](self, "initializeConversationHistory");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v41;
    do
    {
      v16 = 0;
      v38 = v14;
      v33 = v14 - a5;
      do
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
        objc_msgSend(v17, "senderId");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v39);

        if (!v19)
        {
          if (!v35)
            goto LABEL_14;
          -[AutocorrectionTestHarness testTyper](self, "testTyper");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "keyboardController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "inputContextHistory");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "text");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AutocorrectionTestHarness friendId](self, "friendId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addTextEntry:timestamp:senderIdentifier:", v27, v28, v29);
          goto LABEL_13;
        }
        if (v38 + v16 >= a5)
        {
          -[AutocorrectionTestHarness testTyper](self, "testTyper");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "syncToEmptyDocument");

          TIDispatchWaitForAllBlocks();
          objc_msgSend(v17, "text");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[AutocorrectionTest testWithInput:](AutocorrectionTest, "testWithInput:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          -[AutocorrectionTestHarness runTest:trialID:withError:](self, "runTest:trialID:withError:", v22, a8, v31);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:atIndexedSubscript:", v23, v33 + v16);

        }
        if (v34)
        {
          -[AutocorrectionTestHarness testTyper](self, "testTyper");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "keyboardController");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "inputContextHistory");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "text");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[AutocorrectionTestHarness selfId](self, "selfId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addTextEntry:timestamp:senderIdentifier:", v27, v28, v29);
LABEL_13:

        }
LABEL_14:
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v14 = v38 + v16;
    }
    while (v13);
  }

  -[AutocorrectionTestHarness nullifyConversationHistory](self, "nullifyConversationHistory");
}

- (id)runConversationTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = a5;
  objc_msgSend(v8, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v8, "warmupMessages");

  v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10 - v11);
  if (v10 != v11)
  {
    v12 = v11 - v10;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v13);

    }
    while (!__CFADD__(v12++, 1));
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "sendersToTest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v15;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v18);
        objc_msgSend(v8, "conversation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AutocorrectionTestHarness testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:](self, "testConversation:testingSender:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:trialID:withError:writingResults:", v20, v19, objc_msgSend(v8, "warmupMessages"), objc_msgSend(v8, "adaptToSentMessages"), objc_msgSend(v8, "adaptToReceivedMessages"), a4, v24, v25);

        ++v18;
      }
      while (v16 != v18);
      v15 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeObjectIdenticalTo:", v21);

  return v25;
}

- (id)runTest:(id)a3 trialID:(unint64_t)a4 withError:(id)a5
{
  id v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  unsigned int v40;

  v39 = a3;
  -[NSMutableArray removeAllObjects](self->_insertedText, "removeAllObjects");
  v7 = v39;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    -[AutocorrectionTestHarness emptyResultForPlayback:](self, "emptyResultForPlayback:", v7);
  else
    -[AutocorrectionTestHarness emptyResultForTest:](self, "emptyResultForTest:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSourceMetadata:", v10);

  v40 = -[AutocorrectionTestHarness seedForTest:trialID:](self, "seedForTest:trialID:", v7, a4);
  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userActionStream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRandomNumberSeed:", v40);

  if ((isKindOfClass & 1) != 0)
    -[AutocorrectionTestHarness replayTest:withError:](self, "replayTest:withError:", v7, 0);
  else
    -[AutocorrectionTestHarness typeTest:withError:](self, "typeTest:withError:", v7, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AutocorrectionTestHarness typologyOutpath](self, "typologyOutpath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TIKeyboardTyper inputManager](self->_testTyper, "inputManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputManagerLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "writeToFile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTypologyLogURL:", v18);

    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTypologyTraceLogURL:", v19);

  }
  objc_msgSend(v13, "correctedTransliterationSequence");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
  }
  else
  {
    -[AutocorrectionTestHarness testTyper](self, "testTyper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AutocorrectionTestHarness testTyper](self, "testTyper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tokensForString:", v25);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[AutocorrectionTestHarness config](self, "config");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_21;
  -[AutocorrectionTestHarness config](self, "config");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "usesContinuousPath");

  if (v28)
  {
    objc_msgSend(v9, "intended");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentsJoinedByString:", &stru_24FD49B78);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v26, "hasSuffix:", CFSTR(" ")) & 1) == 0)
    {
      if (objc_msgSend(v13, "adjustForContinuousPath"))
      {
        objc_msgSend(v22, "lastObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR(" "));

        if (v31)
        {
          v32 = objc_msgSend(v22, "count") - 1;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", (int)v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v32)
          {
            for (i = 0; i != v32; ++i)
            {
              objc_msgSend(v22, "objectAtIndex:", i);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "addObject:", v35);

            }
          }

          goto LABEL_22;
        }
      }
    }
LABEL_21:
    v33 = v22;
LABEL_22:

    v22 = v33;
  }
  objc_msgSend(v9, "extractDataFromTypingLog:", v13);
  objc_msgSend(v9, "setCorrected:", v22);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v40);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSeed:", v36);

  -[AutocorrectionTestHarness resultClassifiers](self, "resultClassifiers");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTagsFromClassifiers:", v37);

  return v9;
}

- (void)trainWithCorpus:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[AutocorrectionTestHarness testTyper](self, "testTyper", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attemptToTypeText:", v8);

        -[AutocorrectionTestHarness testTyper](self, "testTyper");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "commitText");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (BOOL)compareExpectedValue:(id)a3 withResult:(id)a4
{
  return objc_msgSend(a3, "isEqualToArray:", a4);
}

- (BOOL)outcomeIsFailureForTest:(id)a3 withResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(v5, "intended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "corrected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[AutocorrectionTestHarness compareExpectedValue:withResult:](self, "compareExpectedValue:withResult:", v6, v7);

  return (char)self;
}

- (void)reset
{
  -[TIKeyboardTyper reset](self->_testTyper, "reset");
}

- (void)tearDown
{
  -[TIKeyboardTyper tearDown](self->_testTyper, "tearDown");
}

- (BOOL)requiresMaintenance
{
  void *v2;
  char v3;

  -[AutocorrectionTestHarness testTyper](self, "testTyper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wordLearningEnabled");

  return v3;
}

- (NSArray)resultClassifiers
{
  return &self->_resultClassifiers->super;
}

- (TIKeyboardTyper)testTyper
{
  return self->_testTyper;
}

- (TITestTyperDriver)dslTestDriver
{
  return self->_dslTestDriver;
}

- (BOOL)saveDebugData
{
  return self->_saveDebugData;
}

- (void)setSaveDebugData:(BOOL)a3
{
  self->_saveDebugData = a3;
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

- (BOOL)multilingualEnabled
{
  return self->_multilingualEnabled;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (NSString)typologyOutpath
{
  return self->_typologyOutpath;
}

- (void)setTypologyOutpath:(id)a3
{
  objc_storeStrong((id *)&self->_typologyOutpath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typologyOutpath, 0);
  objc_storeStrong((id *)&self->_secondaryInputMode, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_dslTestDriver, 0);
  objc_storeStrong((id *)&self->_testTyper, 0);
  objc_storeStrong((id *)&self->_insertedText, 0);
  objc_storeStrong((id *)&self->_resultClassifiers, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

+ (id)overrideInputMode:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "languageWithRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("ars"));

  if (v5)
  {
    objc_msgSend(v3, "languageWithRegion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Override %@ input mode identifier with the ar"), v6);

    objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", CFSTR("ar"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v3;
  }
  v8 = v7;

  return v8;
}

@end
