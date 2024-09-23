@implementation CRLanguageCorrection

+ (id)supportedLanguagesForRevision:(unint64_t)a3 error:(id *)a4
{
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 3uLL:
      v9 = CFSTR("en-US");
      v10 = CFSTR("fr-FR");
      v11 = CFSTR("it-IT");
      v12 = CFSTR("de-DE");
      v13 = CFSTR("es-ES");
      v14 = CFSTR("pt-BR");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v9;
LABEL_7:
      v6 = 6;
      goto LABEL_8;
    case 2uLL:
      v15 = CFSTR("en-US");
      v16 = CFSTR("fr-FR");
      v17 = CFSTR("it-IT");
      v18 = CFSTR("de-DE");
      v19 = CFSTR("es-ES");
      v20 = CFSTR("pt-BR");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v15;
      goto LABEL_7;
    case 1uLL:
      v21 = CFSTR("en-US");
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = &v21;
      v6 = 1;
LABEL_8:
      objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
      return (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -4);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (CRLanguageCorrection)initWithRevision:(unint64_t)a3 localeCode:(id)a4 customWords:(id)a5
{
  id v8;
  id v9;
  CRLanguageCorrection *v10;
  uint64_t v11;
  NSString *invalidSingleCharCNNCode;
  uint64_t v13;
  NSLocale *locale;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  CRCHPatternNetwork *v27;
  CRCHPatternNetwork *patternFST;
  CRLanguageCorrection *v29;
  id v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38[2];
  __int16 v39;
  objc_super v40;
  _BYTE v41[128];
  _QWORD v42[3];
  _QWORD v43[5];

  v43[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CRLanguageCorrection;
  v10 = -[CRLanguageCorrection init](&v40, sel_init);
  if (v10)
  {
    v39 = -1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v39, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    invalidSingleCharCNNCode = v10->_invalidSingleCharCNNCode;
    v10->_invalidSingleCharCNNCode = (NSString *)v11;

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Locale was not provided for language correction"), 0);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v31);
    }
    if (!-[CRLanguageCorrection isLanguageCorrectionSupportedForLanguage:revision:](v10, "isLanguageCorrectionSupportedForLanguage:revision:", v8, a3))
    {
      v29 = 0;
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    locale = v10->_locale;
    v10->_locale = (NSLocale *)v13;

    -[NSLocale languageCode](v10->_locale, "languageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLanguageCorrection loadCharacterNgramModel:](v10, "loadCharacterNgramModel:", v8);
    v16 = *MEMORY[0x1E0D43450];
    v42[0] = *MEMORY[0x1E0D434C8];
    v42[1] = v16;
    v43[0] = v15;
    v43[1] = MEMORY[0x1E0C9AAA0];
    v42[2] = *MEMORY[0x1E0D434F8];
    v43[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = 0;
    v18 = LXLexiconCreate();
    v10->_staticLexicon = (_LXLexicon *)v18;
    if (!v18)
      NSLog(CFSTR("[WARNING] Unable to load lexicon for language '%@'. Lexicon checks will be disabled during language correction."), v15);
    v10->_dynamicLexicon = 0;
    v19 = v9;
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[CRLanguageCorrection locale](v10, "locale");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = 0;
        v21 = -[CRLanguageCorrection createDynamicLexiconForLocale:error:](v10, "createDynamicLexiconForLocale:error:", v20, v38);
        v22 = v38[0];
        v10->_dynamicLexicon = (_LXLexicon *)v21;

        if (v22)
          NSLog(CFSTR("[WARNING] Unable to create custom lexicon: %@"), v22);
        if (v10->_dynamicLexicon)
        {
          v32 = v15;
          v33 = v22;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v23 = v19;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
          if (v24)
          {
            v25 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v35 != v25)
                  objc_enumerationMutation(v23);
                if (LXLexiconAdd())
                  LXLexiconIncrementUsageCount();
              }
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
            }
            while (v24);
          }

          v15 = v32;
          v22 = v33;
        }

      }
    }
    v27 = -[CRCHPatternNetwork initWithFile:]([CRCHPatternNetwork alloc], "initWithFile:", CFSTR("P.bin"));
    patternFST = v10->_patternFST;
    v10->_patternFST = v27;

    if (!v10->_patternFST)
      NSLog(CFSTR("[WARNING] Unable to load pattern network"));

  }
  v29 = v10;
LABEL_27:

  return v29;
}

- (void)loadCharacterNgramModel:(id)a3
{
  id v4;
  NSLocale *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
  v5 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  -[NSLocale languageCode](v5, "languageCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale countryCode](v5, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v23, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("lm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  bzero(v26, 0x400uLL);
  v10 = objc_retainAutorelease(v9);
  if (!pathForResource((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4), 0, (UInt8 *)v26))
  {
    NSLog(CFSTR("[WARNING] Resource path not found for '%@'. Character LM will be disabled during language correction."), v10);
    goto LABEL_8;
  }
  firstMatchingResourceForLocale(v5, &stru_1E98DC948, CFSTR("lm"), (UInt8 *)v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_9:
    NSLog(CFSTR("[WARNING] Resource not found for '%@'. Character LM will be disabled during language correction. Requested locale '%@'."), v11, v4);
    v14 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByDeletingPathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "stringByDeletingLastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x1E0D43450];
  v24[0] = *MEMORY[0x1E0D434C8];
  v24[1] = v19;
  v25[0] = v11;
  v25[1] = MEMORY[0x1E0C9AAA0];
  v20 = *MEMORY[0x1E0D43468];
  v24[2] = *MEMORY[0x1E0D43478];
  v24[3] = v20;
  v25[2] = v18;
  v25[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)LMLanguageModelCreate();
  self->_characterLanguageModel = v22;
  if (!v22)
    NSLog(CFSTR("[WARNING] Unable to load character language model for language '%@'. Character LM will be disabled during language correction."), v11);

LABEL_10:
}

- (BOOL)isLanguageCorrectionSupportedForLanguage:(id)a3 revision:(unint64_t)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "supportedLanguagesForRevision:error:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  return v7;
}

- (void)dealloc
{
  _LXLexicon *staticLexicon;
  _LXLexicon *dynamicLexicon;
  objc_super v5;

  if (self->_characterLanguageModel)
  {
    LMLanguageModelRelease();
    self->_characterLanguageModel = 0;
  }
  staticLexicon = self->_staticLexicon;
  if (staticLexicon)
  {
    CFRelease(staticLexicon);
    self->_staticLexicon = 0;
  }
  dynamicLexicon = self->_dynamicLexicon;
  if (dynamicLexicon)
  {
    CFRelease(dynamicLexicon);
    self->_dynamicLexicon = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLanguageCorrection;
  -[CRLanguageCorrection dealloc](&v5, sel_dealloc);
}

- (id)correctTextFeature:(id)a3 inImage:(id)a4 withTextPieces:(id)a5 withMaxWidthPerRegion:(double)a6 withMedianCharSpacing:(double)a7 withBreakpoints:(const void *)a8 segmenter:(void *)a9 options:(id)a10 numCharCandidates:(int)a11 downscaleSpaceRatio:(BOOL)a12 latticePresetIdx:(int)a13 latticeResults:(id)a14
{
  id v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  CRLatticeRun *v28;
  CRLatticeRun *v29;
  void *v30;
  CRLatticeRun *v31;
  CRLatticeRun *v32;
  uint64_t (***v33)();
  uint64_t v34;
  uint64_t (**v35)();
  uint64_t v36;
  unint64_t v37;
  double v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t (**v44)();
  void *v45;
  id v46;
  id v47;
  TextRow *v48;
  unint64_t v49;
  uint64_t (**v50)();
  double v51;
  TextToken *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  TextToken *v57;
  uint64_t (***v58)();
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v66;
  id v67;
  id obj;
  int v69;
  uint64_t v70;
  TextResults *v73;
  id v74;
  unint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v79;
  id v80;
  unint64_t v81;
  unint64_t v82;
  TextColumn *v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  void *__p[3];
  id v92[11];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  void **v97;
  _BYTE v98[128];
  _QWORD v99[3];
  uint64_t (***v100)();
  _BYTE v101[128];
  uint64_t (**v102)();
  uint64_t (**v103)();
  uint64_t (***v104)();
  void **v105;
  char *v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v74 = a4;
  v67 = a5;
  v19 = a10;
  v77 = a14;
  v66 = v19;
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CRImageReaderNumTopStringCandidates"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");
  if (v21 <= 1)
    v22 = 1;
  else
    v22 = v21;
  v75 = v22;

  v73 = objc_alloc_init(TextResults);
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v67;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
  if (v23)
  {
    v81 = 0;
    if (v75 <= 0xA)
      v24 = 10;
    else
      v24 = v75;
    v69 = v24;
    v70 = *(_QWORD *)v94;
    do
    {
      v79 = 0;
      v76 = v23;
      do
      {
        if (*(_QWORD *)v94 != v70)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v79);
        -[CRLanguageCorrection adjustCaseConfusions:](self, "adjustCaseConfusions:", v25);
        v26 = *(_QWORD *)a8;
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a8 + 1) - *(_QWORD *)a8) >> 3) <= v81)
          std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
        -[CRLanguageCorrection invalidSingleCharCNNCode](self, "invalidSingleCharCNNCode");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        CRLattice::CRLattice((uint64_t)v92, v74, v25, (uint64_t **)(v26 + 24 * v81), v27, (uint64_t)a9, 0, a12, a6, a7, a13);

        v100 = 0;
        if (v77)
        {
          v28 = [CRLatticeRun alloc];
          objc_msgSend(v25, "bounds");
          v29 = -[CRLatticeRun initWithRect:](v28, "initWithRect:");
          objc_msgSend(v77, "addResult:", v29);
          CRLattice::getNetworkEdges((CRLattice *)v92);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRLatticeRun setGraph:](v29, "setGraph:", v30);

          v31 = v29;
          v32 = v31;
          v102 = &off_1E98D9360;
          v103 = (uint64_t (**)())v31;
          v104 = &v102;
          if (v100 == v99)
          {
            v105 = (void **)&off_1E98D9360;
            v106 = v31;
            ((void (*)(uint64_t (***)()))(*v104)[4])(v104);
            v104 = 0;
            ((void (*)(uint64_t (***)(), uint64_t (***)()))(*v100)[3])(v100, &v102);
            ((void (*)(uint64_t (***)()))(*v100)[4])(v100);
            v100 = 0;
            v104 = &v102;
            ((void (*)(uint64_t, _QWORD *))v105[3])((uint64_t)&v105, v99);
            ((void (*)(uint64_t))v105[4])((uint64_t)&v105);
            v100 = (uint64_t (***)())v99;
            v33 = v104;
          }
          else
          {
            v99[0] = &off_1E98D9360;
            v99[1] = v31;
            ((void (*)(uint64_t (***)()))(*v104)[4])(v104);
            v33 = v100;
            v104 = v100;
            v100 = (uint64_t (***)())v99;
          }
          if (v33 == &v102)
          {
            v33 = &v102;
            v34 = 4;
LABEL_21:
            (*v33)[v34]();
          }
          else if (v33)
          {
            v34 = 5;
            goto LABEL_21;
          }

        }
        CRLattice::kBestPaths((uint64_t)v92, v69, (uint64_t)self->_characterLanguageModel, (uint64_t)self->_staticLexicon, (uint64_t)self->_dynamicLexicon, 0, 1, self->_patternFST, (uint64_t)&v102, 1, (uint64_t)v99);
        std::vector<unsigned long>::vector(&v105, 0x6DB6DB6DB6DB6DB7 * (((char *)v103 - (char *)v102) >> 6));
        std::vector<double>::vector(__p, 0x6DB6DB6DB6DB6DB7 * (((char *)v103 - (char *)v102) >> 6));
        v35 = v102;
        if (v103 != v102)
        {
          v36 = 0;
          v37 = 0;
          do
          {
            v105[v37] = (void *)v37;
            v38 = __exp10(-*(double *)&v35[v36 + 14] / (double)(unint64_t)v35[v36 + 2]);
            *((double *)__p[0] + v37++) = v38;
            v35 = v102;
            v36 += 56;
          }
          while (v37 < 0x6DB6DB6DB6DB6DB7 * (((char *)v103 - (char *)v102) >> 6));
        }
        v39 = 126 - 2 * __clz((v106 - (char *)v105) >> 3);
        v97 = __p;
        if (v106 == (char *)v105)
          v40 = 0;
        else
          v40 = v39;
        std::__introsort<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *,false>((uint64_t)v105, (uint64_t *)v106, (uint64_t **)&v97, v40, 1);
        v83 = objc_alloc_init(TextColumn);
        v41 = (v106 - (char *)v105) >> 3;
        if (v41 >= v75)
          v41 = v75;
        v82 = v41;
        if (v41)
        {
          v42 = 0;
          do
          {
            v84 = v42;
            v43 = v105[v42];
            v44 = v102;
            v89 = 0;
            v90 = 0;
            CRLattice::decodePath((uint64_t *)v92, (uint64_t)&v102[56 * (_QWORD)v43], &v90, &v89, a11);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v90;
            v47 = v89;
            v48 = objc_alloc_init(TextRow);
            v49 = 0;
            v50 = &v44[56 * (_QWORD)v43 + 45];
            v51 = 0.0;
            while (v49 < objc_msgSend(v45, "count"))
            {
              v52 = [TextToken alloc];
              objc_msgSend(v45, "objectAtIndexedSubscript:", v49);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = *((double *)*v50 + v49);
              objc_msgSend(v47, "objectAtIndexedSubscript:", v49);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "objectAtIndex:", v49);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              v57 = -[TextToken initWithString:score:features:wordID:properties:](v52, "initWithString:score:features:wordID:properties:", v53, v55, 0, objc_msgSend(v56, "unsignedIntegerValue"), v54 - v51);

              -[TextRow addToken:](v48, "addToken:", v57);
              v51 = *((double *)*v50 + v49);

              ++v49;
            }
            -[TextColumn addRow:](v83, "addRow:", v48);

            v42 = v84 + 1;
          }
          while (v84 + 1 != v82);
        }
        -[TextResults addColumn:](v73, "addColumn:", v83);

        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v105)
        {
          v106 = (char *)v105;
          operator delete(v105);
        }
        v105 = (void **)&v102;
        std::vector<CRCHLatticePath>::__destroy_vector::operator()[abi:ne180100](&v105);
        v58 = v100;
        if (v100 == v99)
        {
          v58 = (uint64_t (***)())v99;
          v59 = 4;
        }
        else
        {
          if (!v100)
            goto LABEL_46;
          v59 = 5;
        }
        (*v58)[v59]();
LABEL_46:
        ++v81;
        CRLattice::~CRLattice(v92);
        ++v79;
      }
      while (v79 != v76);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v101, 16);
    }
    while (v23);
  }

  -[CRLanguageCorrection findBestPathsForTextResults:numPathsToExtract:ngramsize:](self, "findBestPathsForTextResults:numPathsToExtract:ngramsize:", v73, v75, 6);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "topLeft");
  objc_msgSend(v60, "setTopLeft:");
  objc_msgSend(v80, "topRight");
  objc_msgSend(v60, "setTopRight:");
  objc_msgSend(v80, "bottomLeft");
  objc_msgSend(v60, "setBottomLeft:");
  objc_msgSend(v80, "bottomRight");
  objc_msgSend(v60, "setBottomRight:");
  objc_msgSend(v60, "setFeatureMapID:", objc_msgSend(v80, "featureMapID"));
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v60, "subFeatures");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v86 != v63)
          objc_enumerationMutation(v61);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "setFeatureMapID:", objc_msgSend(v80, "featureMapID"));
      }
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
    }
    while (v62);
  }

  return v60;
}

- (NSCharacterSet)confusableCharacters
{
  return (NSCharacterSet *)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("cosuvwxzCOSUVWXZ"));
}

- (BOOL)preferAllUppercase:(id)a3
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "subFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "stringValueCandidates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
        {
          v12 = 0;
          objc_msgSend(v10, "getCharacters:range:", &v12, 0, 1);
          if (v12 - 65 < 0x1A)
            ++v4;
          ++v5;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4 > v5 - v4;
}

- (BOOL)preferAllLowercase:(id)a3
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int16 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "subFeatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "stringValueCandidates");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
        {
          v12 = 0;
          objc_msgSend(v10, "getCharacters:range:", &v12, 0, 1);
          if (v12 - 97 < 0x1A)
            ++v4;
          ++v5;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v4 > v5 - v4;
}

- (void)adjustCaseConfusions:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  double v32;
  unint64_t j;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  int v39;
  _BOOL4 v40;
  _BOOL4 v41;
  id obj;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  unsigned __int16 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  -[CRLanguageCorrection confusableCharacters](self, "confusableCharacters");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[CRLanguageCorrection preferAllUppercase:](self, "preferAllUppercase:", v38);
  v40 = -[CRLanguageCorrection preferAllLowercase:](self, "preferAllLowercase:", v38);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v38, "subFeatures");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v4)
  {
    v5 = 0;
    v46 = *(_QWORD *)v54;
    do
    {
      v6 = 0;
      v47 = v4;
      v39 = v5 + v4;
      do
      {
        if (*(_QWORD *)v54 != v46)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v6);
        objc_msgSend(v7, "stringValueCandidates");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "length"))
        {
          v52 = 0;
          objc_msgSend(v9, "getCharacters:range:", &v52, 0, 1);
          if (objc_msgSend(v43, "characterIsMember:", v52))
          {
            objc_msgSend(v9, "uppercaseString");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "lowercaseString");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "stringValueCandidates");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "indexOfObject:", v44);

            objc_msgSend(v7, "stringValueCandidates");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "indexOfObject:", v45);

            objc_msgSend(v7, "candidateProbs");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v14, "mutableCopy");

            if (v11 != 0x7FFFFFFFFFFFFFFFLL && v13 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v16 = objc_msgSend(v7, "isUp");
              objc_msgSend(v15, "objectAtIndexedSubscript:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "doubleValue");
              v19 = v18;

              objc_msgSend(v15, "objectAtIndexedSubscript:", v11);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "doubleValue");
              v22 = v21;

              if ((v41 | v16) == 1)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 * 0.8);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:atIndexedSubscript:", v23, v13);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v22 + v22, 1.0));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:atIndexedSubscript:", v24, v11);
                goto LABEL_17;
              }
              if (v5 > 0 && v40)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", fmax(v19 + v19, 1.0));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:atIndexedSubscript:", v26, v13);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 * 0.8);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:atIndexedSubscript:", v24, v11);
LABEL_17:

              }
            }
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v27 = v15;
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            if (v28)
            {
              v29 = *(_QWORD *)v49;
              v30 = 0.0;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v49 != v29)
                    objc_enumerationMutation(v27);
                  objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "doubleValue");
                  v30 = v30 + v32;
                }
                v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
              }
              while (v28);
            }
            else
            {
              v30 = 0.0;
            }

            for (j = 0; j < objc_msgSend(v27, "count"); ++j)
            {
              objc_msgSend(v27, "objectAtIndexedSubscript:", j);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "doubleValue");
              v36 = v35;

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36 / v30);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:atIndexedSubscript:", v37, j);

            }
            objc_msgSend(v7, "setCandidateProbs:", v27);

          }
        }

        ++v5;
        ++v6;
      }
      while (v6 != v47);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      v5 = v39;
    }
    while (v4);
  }

}

- (_LXLexicon)createDynamicLexiconForLocale:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  _LXLexicon *Mutable;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *MEMORY[0x1E0D437B8];
  v10[0] = *MEMORY[0x1E0D437C8];
  v10[1] = v6;
  v11[0] = CFSTR("CR-Custom-Lexicon");
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (_LXLexicon *)LXLexiconCreateMutable();
  if (a4)
    *a4 = objc_retainAutorelease(0);

  return Mutable;
}

- (id)findBestPathsForTextResults:(id)a3 numPathsToExtract:(unint64_t)a4 ngramsize:(unint64_t)a5
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t i;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  CRTextFeature *v37;
  void *v38;
  void *v39;
  CRTextFeature *v40;
  void *v41;
  void *v44;
  id v45;
  unint64_t v46;
  void *v47;

  v45 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v8 = a5 - 1;
  while (v46 < objc_msgSend(v45, "colCount"))
  {
    objc_msgSend(v45, "cols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v10;
    objc_msgSend(v10, "rows");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "rowCount");
    if (v12 >= a4)
      v13 = a4;
    else
      v13 = v12;
    if (v13)
    {
      v14 = 0;
      while (v14 < objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v16)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "appendString:", CFSTR(" "));
LABEL_12:

        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectAtIndexedSubscript:", v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "appendString:", v20);

        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "score");
        v24 = __exp10(-v23 / (double)(v8 + objc_msgSend(v20, "length")));

        v25 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        objc_msgSend(v25, "numberWithDouble:", v24 + v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:atIndexedSubscript:", v28, v14);

        objc_msgSend(v47, "objectAtIndexedSubscript:", v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "features");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addObjectsFromArray:", v31);

        if (v13 == ++v14)
          goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v18);

      objc_msgSend(v7, "addObject:", &unk_1E9926640);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v17);
      goto LABEL_12;
    }
LABEL_14:

    ++v46;
  }
  for (i = 0; i < objc_msgSend(v7, "count"); ++i)
  {
    v33 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "doubleValue");
    objc_msgSend(v33, "numberWithDouble:", v35 / (double)(unint64_t)objc_msgSend(v45, "colCount"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:atIndexedSubscript:", v36, i);

  }
  v37 = [CRTextFeature alloc];
  objc_msgSend(v47, "objectAtIndexedSubscript:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = -[CRTextFeature initWithSubfeatures:stringValue:](v37, "initWithSubfeatures:stringValue:", v38, v39);

  -[CRTextFeature setStringValueCandidates:](v40, "setStringValueCandidates:", v6);
  -[CRTextFeature setCandidateProbs:](v40, "setCandidateProbs:", v7);
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRTextFeature setConfidence:](v40, "setConfidence:", v41);

  -[CRTextFeature setSubFeatureCandidates:](v40, "setSubFeatureCandidates:", v47);
  return v40;
}

- (void)characterLanguageModel
{
  return self->_characterLanguageModel;
}

- (void)setCharacterLanguageModel:(void *)a3
{
  self->_characterLanguageModel = a3;
}

- (_LXLexicon)staticLexicon
{
  return self->_staticLexicon;
}

- (void)setStaticLexicon:(_LXLexicon *)a3
{
  self->_staticLexicon = a3;
}

- (_LXLexicon)dynamicLexicon
{
  return self->_dynamicLexicon;
}

- (void)setDynamicLexicon:(_LXLexicon *)a3
{
  self->_dynamicLexicon = a3;
}

- (NSString)invalidSingleCharCNNCode
{
  return self->_invalidSingleCharCNNCode;
}

- (void)setInvalidSingleCharCNNCode:(id)a3
{
  objc_storeStrong((id *)&self->_invalidSingleCharCNNCode, a3);
}

- (CRCHPatternNetwork)patternFST
{
  return self->_patternFST;
}

- (void)setPatternFST:(id)a3
{
  objc_storeStrong((id *)&self->_patternFST, a3);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_patternFST, 0);
  objc_storeStrong((id *)&self->_invalidSingleCharCNNCode, 0);
}

- (uint64_t)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
}

- (_QWORD)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_1E98D9360;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

- (id)correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  id result;

  *a2 = &off_1E98D9360;
  result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

- (uint64_t)correctTextFeature:(uint64_t *)a3 inImage:(uint64_t)a4 withTextPieces:(char)a5 withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  int64_t v65;
  uint64_t *v66;
  int64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  double v90;
  uint64_t v91;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;

  v9 = (uint64_t *)result;
LABEL_2:
  v10 = v9;
  while (2)
  {
    v9 = v10;
    v11 = (char *)a2 - (char *)v10;
    v12 = a2 - v10;
    switch(v12)
    {
      case 0:
      case 1:
        return result;
      case 2:
        v42 = *v10;
        v43 = *(a2 - 1);
        if (*(double *)(**a3 + 8 * *v10) < *(double *)(**a3 + 8 * v43))
        {
          *v10 = v43;
          *(a2 - 1) = v42;
        }
        return result;
      case 3:
        return (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v10, v10 + 1, a2 - 1, **a3);
      case 4:
        return (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v10, v10 + 1, v10 + 2, a2 - 1, a3);
      case 5:
        v44 = v10 + 1;
        v45 = v10 + 2;
        v46 = v10 + 3;
        result = (uint64_t)std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v10, v10 + 1, v10 + 2, v10 + 3, a3);
        v47 = v10[3];
        v48 = **a3;
        v49 = *(a2 - 1);
        if (*(double *)(v48 + 8 * v47) < *(double *)(v48 + 8 * v49))
        {
          *v46 = v49;
          *(a2 - 1) = v47;
          v50 = *v45;
          v51 = *v46;
          v52 = *(double *)(v48 + 8 * *v46);
          if (*(double *)(v48 + 8 * *v45) < v52)
          {
            *v45 = v51;
            *v46 = v50;
            v53 = *v44;
            if (*(double *)(v48 + 8 * *v44) < v52)
            {
              v10[1] = v51;
              v10[2] = v53;
              v54 = *v10;
              if (*(double *)(v48 + 8 * *v10) < v52)
              {
                *v10 = v51;
                v10[1] = v54;
              }
            }
          }
        }
        return result;
      default:
        if (v11 <= 191)
        {
          if ((a5 & 1) != 0)
          {
            if (v10 != a2)
            {
              v55 = v10 + 1;
              if (v10 + 1 != a2)
              {
                v56 = **a3;
                v57 = 8;
                v58 = v10;
                do
                {
                  v60 = *v58;
                  v59 = v58[1];
                  v58 = v55;
                  v61 = *(double *)(v56 + 8 * v59);
                  if (*(double *)(v56 + 8 * v60) < v61)
                  {
                    v62 = v57;
                    while (1)
                    {
                      *(uint64_t *)((char *)v10 + v62) = v60;
                      v63 = v62 - 8;
                      if (v62 == 8)
                        break;
                      v60 = *(uint64_t *)((char *)v10 + v62 - 16);
                      v62 -= 8;
                      if (*(double *)(v56 + 8 * v60) >= v61)
                      {
                        v64 = (uint64_t *)((char *)v10 + v63);
                        goto LABEL_75;
                      }
                    }
                    v64 = v10;
LABEL_75:
                    *v64 = v59;
                  }
                  v55 = v58 + 1;
                  v57 += 8;
                }
                while (v58 + 1 != a2);
              }
            }
          }
          else if (v10 != a2)
          {
            v93 = v10 + 1;
            if (v10 + 1 != a2)
            {
              v94 = **a3;
              do
              {
                v96 = *v9;
                v95 = v9[1];
                v9 = v93;
                v97 = *(double *)(v94 + 8 * v95);
                if (*(double *)(v94 + 8 * v96) < v97)
                {
                  do
                  {
                    *v93 = v96;
                    v96 = *(v93 - 2);
                    --v93;
                  }
                  while (*(double *)(v94 + 8 * v96) < v97);
                  *v93 = v95;
                }
                v93 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
          }
          return result;
        }
        if (!a4)
        {
          if (v10 == a2)
            return result;
          v65 = (unint64_t)(v12 - 2) >> 1;
          v66 = *a3;
          v67 = v65;
          do
          {
            v68 = v67;
            if (v65 >= v67)
            {
              v69 = (2 * v67) | 1;
              v70 = &v10[v69];
              v71 = 2 * v67 + 2;
              v72 = *v66;
              if (v71 < v12 && *(double *)(v72 + 8 * v70[1]) < *(double *)(v72 + 8 * *v70))
              {
                ++v70;
                v69 = 2 * v68 + 2;
              }
              v73 = &v10[v68];
              v74 = *v73;
              v75 = *(double *)(v72 + 8 * *v73);
              result = *v70;
              if (v75 >= *(double *)(v72 + 8 * *v70))
              {
                do
                {
                  *v73 = result;
                  v73 = v70;
                  if (v65 < v69)
                    break;
                  v76 = 2 * v69;
                  v69 = (2 * v69) | 1;
                  v70 = &v10[v69];
                  v77 = v76 + 2;
                  if (v77 < v12 && *(double *)(v72 + 8 * v70[1]) < *(double *)(v72 + 8 * *v70))
                  {
                    ++v70;
                    v69 = v77;
                  }
                  result = *v70;
                }
                while (v75 >= *(double *)(v72 + 8 * *v70));
                *v73 = v74;
              }
            }
            v67 = v68 - 1;
          }
          while (v68);
          v78 = (unint64_t)v11 >> 3;
          while (2)
          {
            v79 = 0;
            v80 = *v10;
            v81 = *a3;
            v82 = v10;
            do
            {
              v83 = v82;
              v82 += v79 + 1;
              v84 = 2 * v79;
              v79 = (2 * v79) | 1;
              v85 = v84 + 2;
              if (v85 < v78)
              {
                result = *v81;
                if (*(double *)(*v81 + 8 * v82[1]) < *(double *)(*v81 + 8 * *v82))
                {
                  ++v82;
                  v79 = v85;
                }
              }
              *v83 = *v82;
            }
            while (v79 <= (uint64_t)((unint64_t)(v78 - 2) >> 1));
            if (v82 == --a2)
            {
LABEL_103:
              *v82 = v80;
            }
            else
            {
              *v82 = *a2;
              *a2 = v80;
              v86 = (char *)v82 - (char *)v10 + 8;
              if (v86 >= 9)
              {
                v87 = (((unint64_t)v86 >> 3) - 2) >> 1;
                v88 = &v10[v87];
                v80 = *v82;
                v89 = *v81;
                v90 = *(double *)(v89 + 8 * *v82);
                v91 = *v88;
                if (v90 < *(double *)(v89 + 8 * *v88))
                {
                  do
                  {
                    *v82 = v91;
                    v82 = v88;
                    if (!v87)
                      break;
                    v87 = (v87 - 1) >> 1;
                    v88 = &v10[v87];
                    v91 = *v88;
                  }
                  while (v90 < *(double *)(v89 + 8 * *v88));
                  goto LABEL_103;
                }
              }
            }
            if (v78-- <= 2)
              return result;
            continue;
          }
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = &v10[(unint64_t)v12 >> 1];
        v15 = **a3;
        if ((unint64_t)v11 < 0x401)
        {
          result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v14, v9, a2 - 1, v15);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v9, v14, a2 - 1, v15);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v9 + 1, v14 - 1, a2 - 2, **a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v9 + 2, &v9[v13 + 1], a2 - 3, **a3);
          result = (uint64_t)std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v14 - 1, v14, &v9[v13 + 1], **a3);
          v16 = *v9;
          *v9 = *v14;
          *v14 = v16;
        }
        --a4;
        v17 = *v9;
        v18 = **a3;
        if ((a5 & 1) == 0)
        {
          v19 = *(double *)(v18 + 8 * v17);
          if (v19 < *(double *)(v18 + 8 * *(v9 - 1)))
            goto LABEL_12;
          if (*(double *)(v18 + 8 * *(a2 - 1)) >= v19)
          {
            v34 = v9 + 1;
            do
            {
              v10 = v34;
              if (v34 >= a2)
                break;
              ++v34;
            }
            while (*(double *)(v18 + 8 * *v10) >= v19);
          }
          else
          {
            v10 = v9;
            do
            {
              v33 = v10[1];
              ++v10;
            }
            while (*(double *)(v18 + 8 * v33) >= v19);
          }
          v35 = a2;
          if (v10 < a2)
          {
            v35 = a2;
            do
              v36 = *--v35;
            while (*(double *)(v18 + 8 * v36) < v19);
          }
          if (v10 < v35)
          {
            v37 = *v10;
            v38 = *v35;
            do
            {
              *v10 = v38;
              *v35 = v37;
              do
              {
                v39 = v10[1];
                ++v10;
                v37 = v39;
              }
              while (*(double *)(v18 + 8 * v39) >= v19);
              do
              {
                v40 = *--v35;
                v38 = v40;
              }
              while (*(double *)(v18 + 8 * v40) < v19);
            }
            while (v10 < v35);
          }
          v41 = v10 - 1;
          if (v10 - 1 != v9)
            *v9 = *v41;
          a5 = 0;
          *v41 = v17;
          continue;
        }
        v19 = *(double *)(v18 + 8 * v17);
LABEL_12:
        v20 = 0;
        do
          v21 = v9[++v20];
        while (v19 < *(double *)(v18 + 8 * v21));
        v22 = &v9[v20];
        v23 = a2;
        if (v20 == 1)
        {
          v23 = a2;
          do
          {
            if (v22 >= v23)
              break;
            v25 = *--v23;
          }
          while (v19 >= *(double *)(v18 + 8 * v25));
        }
        else
        {
          do
            v24 = *--v23;
          while (v19 >= *(double *)(v18 + 8 * v24));
        }
        if (v22 >= v23)
        {
          v31 = v22 - 1;
        }
        else
        {
          v26 = *v23;
          v27 = &v9[v20];
          v28 = v23;
          do
          {
            *v27 = v26;
            *v28 = v21;
            do
            {
              v29 = v27[1];
              ++v27;
              v21 = v29;
            }
            while (v19 < *(double *)(v18 + 8 * v29));
            do
            {
              v30 = *--v28;
              v26 = v30;
            }
            while (v19 >= *(double *)(v18 + 8 * v30));
          }
          while (v27 < v28);
          v31 = v27 - 1;
        }
        if (v31 != v9)
          *v9 = *v31;
        *v31 = v17;
        if (v22 < v23)
        {
LABEL_33:
          result = std::__introsort<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *,false>(v9, v31, a3, a4, a5 & 1);
          a5 = 0;
          v10 = v31 + 1;
          continue;
        }
        v32 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v9, v31, a3);
        v10 = v31 + 1;
        result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[CRLanguageCorrection correctTextFeature:inImage:withTextPieces:withMaxWidthPerRegion:withMedianCharSpacing:withBreakpoints:segmenter:options:numCharCandidates:downscaleSpaceRatio:latticePresetIdx:latticeResults:]::$_1 &,unsigned long *>(v31 + 1, a2, a3);
        if (!(_DWORD)result)
        {
          if (v32)
            continue;
          goto LABEL_33;
        }
        a2 = v31;
        if (!v32)
          goto LABEL_2;
        return result;
    }
  }
}

@end
