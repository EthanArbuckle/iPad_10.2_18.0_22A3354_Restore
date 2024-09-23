@implementation CRLineWrapper

+ (id)joiningDelimiterForLine:(id)a3 useLineSeparatorAsLineBreak:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unint64_t v6;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "lineWrappingType");
  if (v6 <= 5 && ((1 << v6) & 0x23) != 0)
  {
    if (v4)
      v8 = CFSTR("\u2028");
    else
      v8 = CFSTR("\n");
    goto LABEL_13;
  }
  objc_msgSend(v5, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v10))
  {

LABEL_10:
LABEL_12:
    v8 = &stru_1E98DC948;
    goto LABEL_13;
  }
  objc_msgSend(v5, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "languageIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[CRImageReader languageIsJapanese:](CRImageReader, "languageIsJapanese:", v12);

  if (v13)
    goto LABEL_12;
  if (v6 == 3)
  {
    objc_msgSend(v5, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "_crEndsWithHyphen") & 1) == 0)
      goto LABEL_10;
    objc_msgSend(v5, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    v8 = &stru_1E98DC948;
    if (v16 >= 2)
    {
      objc_msgSend(v5, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v18, "length") - 2);

      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v20, "characterIsMember:", v19);

      if ((_DWORD)v19)
        v8 = CFSTR(" ");
    }
  }
  else
  {
    v8 = CFSTR(" ");
    if (v6 == 4)
      v8 = CFSTR("\b");
  }
LABEL_13:

  return v8;
}

+ (id)joiningDelimiterForLine:(id)a3
{
  objc_msgSend(a1, "joiningDelimiterForLine:useLineSeparatorAsLineBreak:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CRLineWrapper)initWithConfiguration:(id)a3
{
  id v5;
  CRLineWrapper *v6;
  CRLineWrapper *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLineWrapper;
  v6 = -[CRLineWrapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_debugLineWrapping = objc_msgSend(v8, "BOOLForKey:", CFSTR("com.apple.CoreRecognition.DebugLineWrapping"));

  }
  return v7;
}

- (unint64_t)_lineWrappingTypeForResult:(id)a3 parameters:(id)a4 strictParameters:(id)a5 context:(id)a6 reason:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  char v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (-[CRLineWrapper _shouldInsertLineBreakForResult:withOverwrappingCorrection:parameters:context:reason:](self, "_shouldInsertLineBreakForResult:withOverwrappingCorrection:parameters:context:reason:", v12, 1, v13, v15, a7))
  {
    v16 = 1;
  }
  else
  {
    if (!v14
      || !-[CRLineWrapper _shouldInsertLineBreakForResult:withOverwrappingCorrection:parameters:context:reason:](self, "_shouldInsertLineBreakForResult:withOverwrappingCorrection:parameters:context:reason:", v12, 1, v14, v15, a7))
    {
      if ((objc_msgSend(v12, "isHyphenatedPrefixOfWord") & 1) != 0)
      {
        v17 = CFSTR("hyphenatedPrefixOfWord");
        v16 = 4;
      }
      else
      {
        objc_msgSend(v15, "text");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "_crEndsWithHyphen");

        if ((v19 & 1) != 0)
        {
          v17 = CFSTR("endsWithHyphen");
        }
        else
        {
          if ((objc_msgSend(v12, "shouldAllowWhitespaceDelimiter") & 1) != 0)
          {
            v16 = 2;
            goto LABEL_15;
          }
          v17 = CFSTR("wrapWithNoDelimiter");
        }
        v16 = 3;
      }
      *a7 = v17;
      goto LABEL_15;
    }
    v16 = 5;
  }
LABEL_15:

  return v16;
}

- (BOOL)_validateGroups:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  if (!-[CRLineWrappingConfiguration mergeOversegmentedTokens](self->_configuration, "mergeOversegmentedTokens"))
    goto LABEL_7;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    CROSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_FAULT, "removeSubregion is not implemented although mergeOversegmentedTokens is enabled.", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(v5, "subregions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    CROSLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_FAULT, "mergeWithLine is not implemented although mergeOversegmentedTokens is enabled.", v11, 2u);
    }

LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }

LABEL_7:
  v8 = 1;
LABEL_14:

  return v8;
}

- (void)predictLineWrappingTypesForAllLinesInGroups:(id)a3
{
  void *v3;
  CRLineWrappingContextCache *v4;
  CRWrappingEvaluationResult *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRWrappingEvaluationResult *v12;
  uint64_t v13;
  void *v14;
  CRWrappingEvaluationResult *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  CRLineWrappingContextCache *v39;
  id v40;
  NSObject *log;
  void (**v42)(_QWORD, _QWORD);
  id v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  CRLineWrappingContextCache *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  id v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  const __CFString *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  if (!-[CRLineWrapper _validateGroups:](self, "_validateGroups:"))
    goto LABEL_35;
  v71 = 0;
  -[CRLineWrapper _allLinesInGroups:groupMapping:](self, "_allLinesInGroups:groupMapping:", v40, &v71);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v71;
  v45 = v3;
  if (!objc_msgSend(v3, "count"))
    goto LABEL_34;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__14;
  v69 = __Block_byref_object_dispose__14;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__14;
  v63 = __Block_byref_object_dispose__14;
  v64 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__14;
  v57 = __Block_byref_object_dispose__14;
  v58 = 0;
  v4 = objc_alloc_init(CRLineWrappingContextCache);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __61__CRLineWrapper_predictLineWrappingTypesForAllLinesInGroups___block_invoke;
  v48[3] = &unk_1E98DB080;
  v50 = &v59;
  v51 = &v53;
  v52 = &v65;
  v39 = v4;
  v49 = v39;
  v42 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D826E9A8](v48);
  objc_msgSend(v3, "firstObject");
  v5 = (CRWrappingEvaluationResult *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i - 1 < (unint64_t)(objc_msgSend(v45, "count") - 1); ++i)
  {
    objc_msgSend(v45, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRWrappingEvaluationResult uuid](v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", v10);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v46 || (objc_msgSend(v9, "canWrapToNextGroup") & 1) != 0)
    {
      v11 = (void *)v66[5];
      if (!v11 || (objc_msgSend(v11, "active") & 1) == 0)
        ((void (**)(_QWORD, CRWrappingEvaluationResult *))v42)[2](v42, v5);
      v12 = [CRWrappingEvaluationResult alloc];
      v13 = v66[5];
      -[CRWrappingEvaluationResult boundingQuad](v5, "boundingQuad");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "normalizationSize");
      v15 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:](v12, "initWithTextFeature:context:imageSize:parameters:", v7, v13, v60[5]);

      if (-[CRWrappingEvaluationResult lineWrappingType](v5, "lineWrappingType"))
      {
        if (self->_debugLineWrapping)
        {
          CROSLogForCategory(4);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            v17 = objc_msgSend(v45, "count");
            v18 = -[CRWrappingEvaluationResult lineWrappingType](v5, "lineWrappingType");
            -[CRWrappingEvaluationResult text](v5, "text");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "text");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316419;
            v73 = "-[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:]";
            v74 = 2048;
            v75 = i;
            v76 = 2048;
            v77 = v17;
            v78 = 2048;
            v79 = v18;
            v80 = 2117;
            v81 = v19;
            v82 = 2117;
            v83 = v20;
            _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "%s: Line %lu/%lu - Keeping lineWrappingType %lu: '%{sensitive}@' | '%{sensitive}@'.", buf, 0x3Eu);

          }
          goto LABEL_23;
        }
      }
      else
      {
        v26 = v60[5];
        v27 = v54[5];
        v28 = v66[5];
        v47 = 0;
        v29 = -[CRLineWrapper _lineWrappingTypeForResult:parameters:strictParameters:context:reason:](self, "_lineWrappingTypeForResult:parameters:strictParameters:context:reason:", v15, v26, v27, v28, &v47);
        v16 = v47;
        -[CRWrappingEvaluationResult setLineWrappingType:](v5, "setLineWrappingType:", v29);
        if (self->_debugLineWrapping)
        {
          CROSLogForCategory(4);
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
          {
            v30 = objc_msgSend(v45, "count");
            -[CRWrappingEvaluationResult text](v5, "text");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "text");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316675;
            v73 = "-[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:]";
            v74 = 2048;
            v75 = i;
            v76 = 2048;
            v77 = v30;
            v78 = 2048;
            v79 = v29;
            v80 = 2117;
            v81 = v31;
            v82 = 2117;
            v83 = v32;
            v84 = 2112;
            v85 = (const __CFString *)v16;
            _os_log_impl(&dword_1D4FB8000, log, OS_LOG_TYPE_DEBUG, "%s: Line %lu/%lu - Updating lineWrappingType %lu: '%{sensitive}@' | '%{sensitive}@' (%@).", buf, 0x48u);

          }
        }
LABEL_23:

      }
      if (-[CRWrappingEvaluationResult lineWrappingType](v5, "lineWrappingType") == 1)
      {
        objc_msgSend((id)v66[5], "resetContext");
        goto LABEL_30;
      }
      objc_msgSend((id)v66[5], "addResult:mergeOversegmentation:", v15, -[CRLineWrappingConfiguration mergeOversegmentedTokens](self->_configuration, "mergeOversegmentedTokens"));
      if (-[CRWrappingEvaluationResult isOversegmented](v15, "isOversegmented")
        && -[CRLineWrappingConfiguration mergeOversegmentedTokens](self->_configuration, "mergeOversegmentedTokens"))
      {
        -[CRWrappingEvaluationResult setLineWrappingType:](v5, "setLineWrappingType:", 0);
        objc_msgSend(v7, "uuid");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_opt_respondsToSelector();

        if ((v35 & 1) == 0)
          goto LABEL_32;
        objc_msgSend(v7, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeSubregion:", v7);

      }
      else
      {
LABEL_30:
        v36 = v5;
        v5 = v7;
      }

      goto LABEL_32;
    }
    -[CRWrappingEvaluationResult setLineWrappingType:](v5, "setLineWrappingType:", 1);
    if (self->_debugLineWrapping)
    {
      CROSLogForCategory(4);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v22 = objc_msgSend(v45, "count");
        v23 = -[CRWrappingEvaluationResult lineWrappingType](v5, "lineWrappingType");
        -[CRWrappingEvaluationResult text](v5, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "text");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316675;
        v73 = "-[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:]";
        v74 = 2048;
        v75 = i;
        v76 = 2048;
        v77 = v22;
        v78 = 2048;
        v79 = v23;
        v80 = 2117;
        v81 = v24;
        v82 = 2117;
        v83 = v25;
        v84 = 2112;
        v85 = CFSTR("blockBoundary");
        _os_log_impl(&dword_1D4FB8000, v21, OS_LOG_TYPE_DEBUG, "%s: Line %lu/%lu - Updating lineWrappingType %lu: '%{sensitive}@' | '%{sensitive}@' (%@).", buf, 0x48u);

      }
    }
    objc_msgSend((id)v66[5], "resetContext");
    v15 = v5;
    v5 = v7;
LABEL_32:

  }
  objc_msgSend(v45, "lastObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLineWrappingType:", 1);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);

  _Block_object_dispose(&v65, 8);
LABEL_34:

LABEL_35:
}

void __61__CRLineWrapper_predictLineWrappingTypesForAllLinesInGroups___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  CRLineWrappingParameters *v5;
  uint64_t v6;
  void *v7;
  CRLineWrappingParameters *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CRWrappingEvaluationResult *v14;
  uint64_t v15;
  void *v16;
  CRWrappingEvaluationResult *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[CRLineWrappingParameters initWithLocale:useStrictConfig:]([CRLineWrappingParameters alloc], "initWithLocale:useStrictConfig:", v4, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = -[CRLineWrappingParameters initWithLocale:useStrictConfig:]([CRLineWrappingParameters alloc], "initWithLocale:useStrictConfig:", v4, 1);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(*(id *)(a1 + 32), "contextForLocale:", v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = [CRWrappingEvaluationResult alloc];
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(v18, "boundingQuad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "normalizationSize");
  v17 = -[CRWrappingEvaluationResult initWithTextFeature:context:imageSize:parameters:](v14, "initWithTextFeature:context:imageSize:parameters:", v18, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "startWithResult:contextSize:", v17, (int)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "lmContextSize"));
}

- (BOOL)_shouldInsertLineBreakForResult:(id)a3 parameters:(id)a4 context:(id)a5 reason:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  __CFString *v19;
  char v20;
  float v22;
  double v23;
  double v24;
  float v25;
  unint64_t v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  int v30;
  int v31;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "featureInTest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastFeature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "confidenceScore");
    v14 = v15;
  }
  v16 = 1.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "confidenceScore");
    v16 = v17;
  }
  if ((objc_msgSend(v9, "matchingLocales") & 1) == 0)
  {
    v19 = CFSTR("localeMismatch");
    goto LABEL_9;
  }
  objc_msgSend(v10, "confidenceThreshold");
  if (v14 < v18)
  {
    v19 = CFSTR("confidenceLow");
    goto LABEL_9;
  }
  objc_msgSend(v10, "contextConfidenceThreshold");
  if (v16 < v22)
  {
    v19 = CFSTR("contextConfidenceLow");
    goto LABEL_9;
  }
  if (!objc_msgSend(v9, "similarHeights") || (objc_msgSend(v9, "similarAngles") & 1) == 0)
  {
    if (objc_msgSend(v9, "similarHeights"))
      v27 = CFSTR("geometryAngle");
    else
      v27 = CFSTR("geometryHeight");
    v28 = objc_retainAutorelease(v27);
    goto LABEL_29;
  }
  if ((objc_msgSend(v9, "isOversegmented") & 1) == 0)
  {
    objc_msgSend(v9, "widthGrowth");
    v24 = v23;
    objc_msgSend(v10, "widthGrowthLimit");
    if (v24 >= v25)
    {
      v26 = objc_msgSend(v9, "tokenCountDiff");
      if (v26 >= objc_msgSend(v10, "tokenCountIncreaseLimit"))
      {
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "widthGrowth");
        objc_msgSend(v33, "stringWithFormat:", CFSTR("widthGrowthAndTokenCount:%4.2f,%ld"), v34, objc_msgSend(v9, "tokenCountDiff"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
        v28 = v35;
LABEL_29:
        *a6 = v28;
        goto LABEL_10;
      }
    }
  }
  if ((objc_msgSend(v9, "isOversegmented") & 1) == 0
    && (objc_msgSend(v9, "leadingAligned") & 1) == 0
    && (objc_msgSend(v9, "centerAligned") & 1) == 0
    && (objc_msgSend(v9, "continuesToNewColumn") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("textAlignment:%d%d%d%d"), objc_msgSend(v9, "isOversegmented"), objc_msgSend(v9, "leadingAligned"), objc_msgSend(v9, "centerAligned"), objc_msgSend(v9, "continuesToNewColumn"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  if (objc_msgSend(v9, "excessiveVerticalDistance"))
  {
    v19 = CFSTR("excessiveVerticalDistance");
  }
  else
  {
    v29 = objc_msgSend(v9, "textBasedEvaluation");
    if (v29 > objc_msgSend(v10, "noWrappingEvaluationThreshold"))
    {
      v30 = objc_msgSend(v9, "continuesToNewColumn");
      if (v29 == 10)
        v31 = v30;
      else
        v31 = 0;
      if (v31 == 1)
      {
        v20 = 0;
        v32 = CFSTR("textEvaluationWithNewColumn");
      }
      else if ((objc_msgSend(v9, "continuesToNewColumn") & 1) != 0
             || v29 < objc_msgSend(v10, "wrappingEvaluationThreshold"))
      {
        if (objc_msgSend(v11, "isClassifierAvailable"))
        {
          *a6 = CFSTR("classifier");
          objc_msgSend(v10, "probabilityThreshold");
          v20 = objc_msgSend(v11, "classifierShouldInsertLineBreakForEvaluationResult:threshold:", v9);
          goto LABEL_11;
        }
        objc_msgSend(v9, "lmScore");
        v37 = v36;
        objc_msgSend(v10, "lmScoreThreshold");
        if (v37 <= v38 || v29 < 3)
        {
          if (v37 <= 0.0)
          {
            v19 = CFSTR("LMUnknown");
          }
          else
          {
            objc_msgSend(v9, "eosLMScore");
            v40 = v39;
            if (v39 > 0.0 && v37 > v39)
            {
              *a6 = CFSTR("LMScoreRatio");
              objc_msgSend(v10, "lmScoreEOSMinRatio");
              v20 = v37 / v40 <= v41;
              goto LABEL_11;
            }
            v19 = CFSTR("LMScoreEOS");
          }
          goto LABEL_9;
        }
        v20 = 0;
        v32 = CFSTR("LMScore");
      }
      else
      {
        v20 = 0;
        v32 = CFSTR("textEvaluationWithoutNewColumn");
      }
      *a6 = v32;
      goto LABEL_11;
    }
    v19 = CFSTR("textEvaluation");
  }
LABEL_9:
  *a6 = v19;
LABEL_10:
  v20 = 1;
LABEL_11:

  return v20;
}

- (BOOL)_shouldInsertLineBreakForResult:(id)a3 withOverwrappingCorrection:(BOOL)a4 parameters:(id)a5 context:(id)a6 reason:(id *)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = -[CRLineWrapper _shouldInsertLineBreakForResult:parameters:context:reason:](self, "_shouldInsertLineBreakForResult:parameters:context:reason:", v12, v13, v14, a7);
  if (v10 && !v15)
  {
    if (objc_msgSend(v14, "classifierShouldCorrectOverwrappingWithEvaluation:correctionMode:", objc_msgSend(v12, "textBasedEvaluation"), objc_msgSend(v13, "correctionMode"))&& (objc_msgSend(v13, "probabilityThreshold"), objc_msgSend(v14, "classifierShouldInsertLineBreakForEvaluationResult:threshold:", v12)))
    {
      objc_msgSend(*a7, "stringByAppendingString:", CFSTR("+overwrappingCorrected"));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = 1;
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }

  return v15;
}

- (id)_allLinesInGroups:(id)a3 groupMapping:(id *)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v18;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = v6;
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "subregions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v13, "uuid");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v14);

              objc_msgSend(v4, "addObject:", v13);
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v5, "count"))
    *a4 = (id)objc_msgSend(v5, "copy");
  v15 = (void *)objc_msgSend(v4, "copy");

  return v15;
}

- (id)paragraphsByUpdatingLineWrappingTypesInGroups:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  CRLayoutParagraph *v14;
  CRLayoutParagraph *v15;
  id v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  -[CRLineWrapper predictLineWrappingTypesForAllLinesInGroups:](self, "predictLineWrappingTypesForAllLinesInGroups:");
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v17;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "subregions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              objc_msgSend(v5, "addObject:", v13);
              if (objc_msgSend(v13, "lineWrappingType") == 1 || !objc_msgSend(v13, "lineWrappingType"))
              {
                v14 = -[CRLayoutParagraph initWithLines:]([CRLayoutParagraph alloc], "initWithLines:", v5);
                objc_msgSend(v4, "addObject:", v14);

                objc_msgSend(v5, "removeAllObjects");
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v5, "count"))
  {
    v15 = -[CRLayoutParagraph initWithLines:]([CRLayoutParagraph alloc], "initWithLines:", v5);
    objc_msgSend(v4, "addObject:", v15);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
