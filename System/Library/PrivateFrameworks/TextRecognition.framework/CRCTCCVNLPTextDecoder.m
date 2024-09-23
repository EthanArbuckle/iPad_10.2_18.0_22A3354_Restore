@implementation CRCTCCVNLPTextDecoder

- (CRCTCCVNLPTextDecoder)initWithConfiguration:(id)a3 model:(id)a4 error:(id *)a5
{
  id v9;
  CRCTCCVNLPTextDecoder *v10;
  uint64_t v11;
  NSLocale *locale;
  int v13;
  int v14;
  void *v15;
  BOOL *p_shouldUseLM;
  CRBiDiTransform *v17;
  CRBiDiTransform *bidiTransform;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSOrderedSet *characterObservations;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t value;
  uint64_t *end;
  unint64_t *v31;
  uint64_t *begin;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSMutableSet *subscribedLocales;
  NSMutableSet *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  void *v50;
  CRCTCCVNLPTextDecoder *v51;
  void *v53;
  id v54;
  void *v55;
  void **p_begin;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v54 = a4;
  v65.receiver = self;
  v65.super_class = (Class)CRCTCCVNLPTextDecoder;
  v10 = -[CRCTCCVNLPTextDecoder init](&v65, sel_init);
  if (!v10)
  {
LABEL_50:
    v51 = v10;
    goto LABEL_54;
  }
  objc_msgSend(v9, "locale");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:");
  v11 = objc_claimAutoreleasedReturnValue();
  locale = v10->_locale;
  v10->_locale = (NSLocale *)v11;

  v13 = objc_msgSend(v9, "decodeWithLM");
  if (v55)
    v14 = v13;
  else
    v14 = 0;
  if (v14 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "lmSupportedLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_shouldUseLM = objc_msgSend(v15, "containsObject:", v55);
    p_shouldUseLM = &v10->_shouldUseLM;

  }
  else
  {
    v10->_shouldUseLM = 0;
    p_shouldUseLM = &v10->_shouldUseLM;
  }
  v10->_shouldUseFalsePositiveFiltering = objc_msgSend(v9, "falsePositiveFilteringDisabled") ^ 1;
  objc_storeStrong((id *)&v10->_configuration, a3);
  *(_WORD *)&v10->_shouldReverseActivationMatrix = 0;
  if (v55 && +[CRImageReader languageIsArabic:](CRImageReader, "languageIsArabic:", v55))
  {
    *(_WORD *)&v10->_shouldReverseActivationMatrix = 257;
    v17 = objc_alloc_init(CRBiDiTransform);
    bidiTransform = v10->_bidiTransform;
    v10->_bidiTransform = v17;

  }
  objc_storeStrong((id *)&v10->_model, a4);
  v19 = -[CRTextSequenceRecognizerModel codemapArray](v10->_model, "codemapArray");
  v10->_codemapArray = (int *)v19;
  if (v19)
  {
    v20 = -[CRTextSequenceRecognizerModel codemapSize](v10->_model, "codemapSize");
    v10->_codemapSize = v20;
    unicodeArrayToNSStringArray(v10->_codemapArray, v20);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:");
    v21 = objc_claimAutoreleasedReturnValue();
    characterObservations = v10->_characterObservations;
    v10->_characterObservations = (NSOrderedSet *)v21;

    if (-[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](v10, "shouldUseModernizedDecoder"))
    {
      p_begin = (void **)&v10->_spaceLabels.__begin_;
      v10->_spaceLabels.__end_ = v10->_spaceLabels.__begin_;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v23 = objc_msgSend(&unk_1E993F950, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v62 != v24)
              objc_enumerationMutation(&unk_1E993F950);
            v26 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            -[CRCTCCVNLPTextDecoder characterObservations](v10, "characterObservations");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "indexOfObject:", v26);

            if (v28 != 0x7FFFFFFFFFFFFFFFLL)
            {
              end = (uint64_t *)v10->_spaceLabels.__end_;
              value = (unint64_t)v10->_spaceLabels.__end_cap_.__value_;
              if ((unint64_t)end >= value)
              {
                begin = (uint64_t *)*p_begin;
                v33 = ((char *)end - (_BYTE *)*p_begin) >> 3;
                v34 = v33 + 1;
                if ((unint64_t)(v33 + 1) >> 61)
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                v35 = value - (_QWORD)begin;
                if (v35 >> 2 > v34)
                  v34 = v35 >> 2;
                if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
                  v36 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v36 = v34;
                if (v36)
                {
                  v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v10->_spaceLabels.__end_cap_, v36);
                  begin = (uint64_t *)v10->_spaceLabels.__begin_;
                  end = (uint64_t *)v10->_spaceLabels.__end_;
                }
                else
                {
                  v37 = 0;
                }
                v38 = (uint64_t *)&v37[8 * v33];
                *v38 = v28;
                v31 = (unint64_t *)(v38 + 1);
                while (end != begin)
                {
                  v39 = *--end;
                  *--v38 = v39;
                }
                v10->_spaceLabels.__begin_ = (unint64_t *)v38;
                v10->_spaceLabels.__end_ = v31;
                v10->_spaceLabels.__end_cap_.__value_ = (unint64_t *)&v37[8 * v36];
                if (begin)
                  operator delete(begin);
              }
              else
              {
                *end = v28;
                v31 = (unint64_t *)(end + 1);
              }
              v10->_spaceLabels.__end_ = v31;
            }
          }
          v23 = objc_msgSend(&unk_1E993F950, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
        }
        while (v23);
      }
    }
    v40 = (void *)MEMORY[0x1E0C99E20];
    -[NSLocale localeIdentifier](v10->_locale, "localeIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWithObject:", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    subscribedLocales = v10->_subscribedLocales;
    v10->_subscribedLocales = (NSMutableSet *)v42;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v44 = v10->_subscribedLocales;
    v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v58 != v46)
            objc_enumerationMutation(v44);
          v48 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j);
          if (*p_shouldUseLM)
          {
            +[CRLanguageResourcesManager sharedManager](CRLanguageResourcesManager, "sharedManager");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addSubscriber:forLocale:", v10, v48);

          }
          if (objc_msgSend(v9, "filterWithLM"))
          {
            +[CRLanguageResourcesManager postProcessManager](CRLanguageResourcesManager, "postProcessManager");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addSubscriber:forLocale:", v10, v48);

          }
        }
        v45 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v44, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v45);
    }

    goto LABEL_50;
  }
  if (a5)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v51 = 0;
LABEL_54:

  return v51;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_subscribedLocales;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (self->_shouldUseLM)
        {
          +[CRLanguageResourcesManager sharedManager](CRLanguageResourcesManager, "sharedManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeSubscriber:forLocale:", self, v7);

        }
        if (-[CRNeuralRecognizerConfiguration filterWithLM](self->_configuration, "filterWithLM"))
        {
          +[CRLanguageResourcesManager postProcessManager](CRLanguageResourcesManager, "postProcessManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeSubscriber:forLocale:", self, v7);

        }
      }
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  v10.receiver = self;
  v10.super_class = (Class)CRCTCCVNLPTextDecoder;
  -[CRCTCCVNLPTextDecoder dealloc](&v10, sel_dealloc);
}

- (CVNLPTextDecodingPruningPolicy)pruningPolicy
{
  *(_OWORD *)&retstr->var0 = xmmword_1D513BAD0;
  *(_QWORD *)&retstr->var3 = 20;
  return self;
}

+ (id)lmSupportedLanguages
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)shouldDecodeWithLM
{
  return self->_shouldUseLM;
}

- (BOOL)shouldUseModernizedDecoder
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CRCTCCVNLPTextDecoder model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == 2;

  return v4;
}

- (id)newLanguageRecognizerSession
{
  void *v2;
  unint64_t v3;

  -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "revision");

  if (v3 < 3)
    return 0;
  else
    return (id)objc_opt_new();
}

- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 error:(id *)a5
{
  double height;
  double width;
  id v9;
  void *v10;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  objc_msgSend(v9, "textFeatureInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCTCCVNLPTextDecoder _buildActivationMatrices:](self, "_buildActivationMatrices:", v9);
  LOBYTE(a5) = -[CRCTCCVNLPTextDecoder _decodeFeaturesWithInfo:imageSize:error:](self, "_decodeFeaturesWithInfo:imageSize:error:", v10, a5, width, height);

  return (char)a5;
}

- (void)computeLanguageRecognitionForSession:(id)a3 output:(id)a4 imageSize:(CGSize)a5
{
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id Property;
  const char *v31;
  void *v32;
  char v33;
  id v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  const char *v48;
  __CFString *v49;
  id v50;
  id v51;
  _BOOL4 v52;
  const char *v53;
  const char *v54;
  id *v55;
  id v56;
  id v57;
  __CFString *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  id v65;
  const char *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  CRCTCCVNLPTextDecoder *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  id (*v80)(uint64_t, uint64_t);
  void *v81;
  CRCTCCVNLPTextDecoder *v82;
  __int128 v83;
  void *__p[2];
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88[3];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CFTypeRef cf;
  uint64_t v94;
  uint64_t v95;
  _QWORD v96[2];
  void *v97;
  char v98;
  void *v99;
  void *v100;
  uint64_t v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v70 = a4;
  objc_msgSend(v70, "textFeatureInfo");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCTCCVNLPTextDecoder _buildActivationMatrices:](self, "_buildActivationMatrices:", v70);
  -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = self;
  v8 = objc_msgSend(v7, "revision");

  if (v8 < 3)
    goto LABEL_78;
  if (!-[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AB8]), "initWithLanguageResourceBundle:", 0);
    objc_msgSend(MEMORY[0x1E0D09AE8], "defaultWhitespaceCommitActionBehavior");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AE8]), "initWithCommitActionBehavior:", v22);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v24 = v72;
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v102, 16);
    if (!v26)
      goto LABEL_39;
    v27 = *(_QWORD *)v75;
    while (1)
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v75 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v28);
        if (v29)
        {
          Property = objc_getProperty(v29, v25, 80, 1);
          v32 = Property;
          if (Property)
          {
            Property = objc_getProperty(Property, v31, 360, 1);
            v33 = 0;
            goto LABEL_32;
          }
        }
        else
        {
          v32 = 0;
          Property = 0;
        }
        v33 = 1;
LABEL_32:
        v34 = Property;
        objc_msgSend(v21, "setActivationMatrix:", v34);

        objc_msgSend(v21, "greedyDecodingResultWithConfiguration:", v23);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v33 & 1) == 0)
          objc_setProperty_atomic(v32, v35, v36, 352);

        ++v28;
      }
      while (v26 != v28);
      v37 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v102, 16);
      v26 = v37;
      if (!v37)
      {
LABEL_39:

        goto LABEL_40;
      }
    }
  }
  -[CRCTCCVNLPTextDecoder model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ctcBlankLabelIndex");

  BYTE8(v83) = 0;
  *(_QWORD *)&v83 = &unk_1E98D9098;
  __p[1] = 0;
  v85 = 0;
  __p[0] = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(__p, self->_spaceLabels.__begin_, (uint64_t)self->_spaceLabels.__end_, self->_spaceLabels.__end_ - self->_spaceLabels.__begin_);
  v96[0] = &unk_1E98D8E40;
  v96[1] = v10;
  v98 = 0;
  v97 = &unk_1E98D9098;
  v100 = 0;
  v101 = 0;
  v99 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v99, __p[0], (uint64_t)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 3);
  *(_QWORD *)&v83 = &unk_1E98D9098;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  cf = 0;
  v94 = 0;
  v95 = 0;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v11 = v72;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v90;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v90 != v14)
          objc_enumerationMutation(v11);
        v17 = *(id *)(*((_QWORD *)&v89 + 1) + 8 * i);
        if (v17)
          v17 = objc_getProperty(v17, v12, 80, 1);
        v18 = v17;
        -[CRCVNLPTransientResult modernizedActivationMatrix]((uint64_t)&v83, v18);
        CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode(v96, (uint64_t *)&v83, v88);
        if (v86)
        {
          v87 = v86;
          operator delete(v86);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v78 = v15;
        v79 = 3221225472;
        v80 = __79__CRCTCCVNLPTextDecoder_computeLanguageRecognitionForSession_output_imageSize___block_invoke;
        v81 = &unk_1E98DBC80;
        v82 = v73;
        convertToCVNLPTextDecodingResult();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_setProperty_atomic(v18, v19, v20, 352);

        *(_QWORD *)&v83 = v88;
        std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
    }
    while (v13);
  }

  if (cf)
    CFRelease(cf);
  v96[0] = &unk_1E98D8E40;
  v97 = &unk_1E98D9098;
  if (v99)
  {
    v100 = v99;
    operator delete(v99);
  }
LABEL_40:
  v38 = (void *)objc_opt_class();
  if (v38)
  {
    objc_msgSend(v38, "_disambiguatedScriptFeatureIndicesWithInfo:", v72);
    v39 = __p[0];
    v40 = v71;
    if (v39)
    {
      v41 = v40;
      while (v39[4] == v39[3])
      {
LABEL_72:
        v39 = (_QWORD *)*v39;
        if (!v39)
          goto LABEL_77;
      }
      v42 = v39[2];
      -[CRCTCCVNLPTextDecoder locale](v73, "locale");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localeIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42 == 3)
      {
        v58 = CFSTR("uk-UA");

      }
      else
      {
        if (v42 != 2)
        {
          if (v42 == 1)
          {
            -[CRCTCCVNLPTextDecoder locale](v73, "locale");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "localeIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = +[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v46);

            if (v47)
            {
              v49 = CFSTR("en-US");

              v44 = v49;
            }
            if (v41)
              v50 = objc_getProperty(v41, v48, 8, 1);
            else
              v50 = 0;
            v51 = v50;
            v52 = v51 == 0;

            if (v52)
            {
              v55 = -[CRLanguageRecognitionContext initWithScript:defaultLocale:]((id *)[CRLanguageRecognitionContext alloc], (void *)1, v44);
              if (v41)
                objc_setProperty_atomic(v41, v54, v55, 8);

            }
            if (v41)
              v56 = objc_getProperty(v41, v53, 8, 1);
            else
              v56 = 0;
            v57 = v56;
          }
          else
          {
            v57 = 0;
          }
          goto LABEL_62;
        }
        v58 = CFSTR("ru-RU");

      }
      v57 = 0;
      v44 = v58;
LABEL_62:
      v59 = (uint64_t *)v39[3];
      v60 = (uint64_t *)v39[4];
      while (v59 != v60)
      {
        v61 = *v59;
        objc_msgSend(v72, "objectAtIndexedSubscript:", *v59);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v62;
        if (v62)
        {
          v65 = objc_getProperty(v62, v63, 80, 1);
          v67 = v65;
          if (v65)
            objc_setProperty_atomic(v65, v66, v44, 368);
        }
        else
        {
          v67 = 0;
        }

        if (v57)
        {
          objc_msgSend(v72, "objectAtIndexedSubscript:", v61);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRLanguageRecognitionSession processFeature:context:](v41, v68, v57);

        }
        ++v59;
      }

      goto LABEL_72;
    }
  }
  else
  {
    v85 = 0;
    v83 = 0u;
    *(_OWORD *)__p = 0u;
    v69 = v71;
  }
LABEL_77:

  std::__hash_table<std::__hash_value_type<int,std::vector<int>>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::vector<int>>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::vector<int>>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::vector<int>>>>::~__hash_table((uint64_t)&v83);
LABEL_78:

}

id __79__CRCTCCVNLPTextDecoder_computeLanguageRecognitionForSession_output_imageSize___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_buildActivationMatrices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  id Property;
  id v10;
  void *v11;
  _BOOL4 v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  id v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  void *v37;
  CRCVNLPTransientResult *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  char *v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  const char *v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  CRCVNLPTransientResult *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  const char *v80;
  id v81;
  _BOOL8 v82;
  uint64_t v83;
  char isKindOfClass;
  void *v85;
  __int128 v86[10];
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  _OWORD v90[10];
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  _OWORD v116[10];
  uint64_t v117;
  _OWORD v118[10];
  uint64_t v119;
  __int128 v120;
  uint64_t v121;
  char *v122;
  void *__p;
  uint64_t v124;
  __int128 v125[10];
  uint64_t v126;

  v4 = a3;
  objc_msgSend(v4, "textFeatureInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v5;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
    Property = objc_getProperty(v6, v7, 80, 1);
  else
    Property = 0;
  v10 = Property;

  if (!v10)
  {
    __p = 0;
    v122 = 0;
    v124 = 0;
    v81 = v4;
    -[CRCTCCVNLPTextDecoder _create2DArraysFromInputArray:classSize:outputArrays:](self, "_create2DArraysFromInputArray:classSize:outputArrays:", v4, &self->_codemapSize, &v122);
    -[CRCTCCVNLPTextDecoder model](self, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v11, "ctcBlankLabelIndex");

    v120 = 0uLL;
    v121 = 0;
    -[CRCTCCVNLPTextDecoder pruningPolicy](self, "pruningPolicy");
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v12 = -[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder");
    v13 = (char *)__p;
    if (__p != v122)
    {
      v14 = 0;
      v15 = 0xCF3CF3CF3CF3CF3DLL * (((_BYTE *)__p - v122) >> 3);
      v13 = v122;
      v82 = v12;
      do
      {
        v16 = &v13[168 * v14];
        if ((isKindOfClass & 1) != 0)
        {
          v17 = v14 + 1;
          if (v15 <= v14 + 1)
            std::vector<std::vector<BreakPoint>>::__throw_out_of_range[abi:ne180100]();
          v18 = objc_alloc(MEMORY[0x1E0D09AB0]);
          v19 = &v13[168 * v17];
          v20 = *(_OWORD *)v16;
          v21 = *((_OWORD *)v16 + 2);
          v118[1] = *((_OWORD *)v16 + 1);
          v118[2] = v21;
          v118[0] = v20;
          v22 = *((_OWORD *)v16 + 3);
          v23 = *((_OWORD *)v16 + 4);
          v24 = *((_OWORD *)v16 + 5);
          v118[6] = *((_OWORD *)v16 + 6);
          v118[5] = v24;
          v118[4] = v23;
          v118[3] = v22;
          v25 = *((_OWORD *)v16 + 7);
          v26 = *((_OWORD *)v16 + 8);
          v27 = *((_OWORD *)v16 + 9);
          v119 = *((_QWORD *)v16 + 20);
          v118[9] = v27;
          v118[8] = v26;
          v118[7] = v25;
          v28 = *(_OWORD *)v19;
          v29 = *((_OWORD *)v19 + 2);
          v116[1] = *((_OWORD *)v19 + 1);
          v116[2] = v29;
          v116[0] = v28;
          v30 = *((_OWORD *)v19 + 3);
          v31 = *((_OWORD *)v19 + 4);
          v32 = *((_OWORD *)v19 + 6);
          v116[5] = *((_OWORD *)v19 + 5);
          v116[6] = v32;
          v116[3] = v30;
          v116[4] = v31;
          v33 = *((_OWORD *)v19 + 7);
          v34 = *((_OWORD *)v19 + 8);
          v35 = *((_OWORD *)v19 + 9);
          v117 = *((_QWORD *)v19 + 20);
          v116[8] = v34;
          v116[9] = v35;
          v116[7] = v33;
          -[CRCTCCVNLPTextDecoder characterObservations](self, "characterObservations");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v120;
          v115 = v121;
          v37 = (void *)objc_msgSend(v18, "initWithBuffer:indexBuffer:domainType:characterObservations:blankIndex:pruningPolicy:", v118, v116, v82, v36, v83, &v114);

          v38 = [CRCVNLPTransientResult alloc];
          -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "locale");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *((_OWORD *)v16 + 9);
          v111 = *((_OWORD *)v16 + 8);
          v112 = v41;
          v113 = *((_QWORD *)v16 + 20);
          v42 = *((_OWORD *)v16 + 5);
          v107 = *((_OWORD *)v16 + 4);
          v108 = v42;
          v43 = *((_OWORD *)v16 + 7);
          v109 = *((_OWORD *)v16 + 6);
          v110 = v43;
          v44 = *((_OWORD *)v16 + 1);
          v103 = *(_OWORD *)v16;
          v104 = v44;
          v45 = *((_OWORD *)v16 + 3);
          v105 = *((_OWORD *)v16 + 2);
          v106 = v45;
          v46 = *((_OWORD *)v19 + 9);
          v100 = *((_OWORD *)v19 + 8);
          v101 = v46;
          v102 = *((_QWORD *)v19 + 20);
          v47 = *((_OWORD *)v19 + 5);
          v96 = *((_OWORD *)v19 + 4);
          v97 = v47;
          v48 = *((_OWORD *)v19 + 7);
          v98 = *((_OWORD *)v19 + 6);
          v99 = v48;
          v49 = *((_OWORD *)v19 + 1);
          v92 = *(_OWORD *)v19;
          v93 = v49;
          v50 = *((_OWORD *)v19 + 3);
          v94 = *((_OWORD *)v19 + 2);
          v95 = v50;
          v51 = v37;
          v52 = v40;
          if (v38)
          {
            v125[8] = v111;
            v125[9] = v112;
            v126 = v113;
            v125[4] = v107;
            v125[5] = v108;
            v125[6] = v109;
            v125[7] = v110;
            v125[0] = v103;
            v125[1] = v104;
            v125[2] = v105;
            v125[3] = v106;
            v5 = v85;
            v53 = -[CRCVNLPTransientResult initWithActivationMatrix:decodingLocale:activationsBuffer:]((char *)v38, v51, v52, v125);
            v38 = (CRCVNLPTransientResult *)v53;
            if (v53)
            {
              v54 = v53[344];
              v55 = v101;
              *((_OWORD *)v53 + 19) = v100;
              *((_OWORD *)v53 + 20) = v55;
              *((_QWORD *)v53 + 42) = v102;
              v56 = v97;
              *((_OWORD *)v53 + 15) = v96;
              *((_OWORD *)v53 + 16) = v56;
              v57 = v99;
              *((_OWORD *)v53 + 17) = v98;
              *((_OWORD *)v53 + 18) = v57;
              v58 = v93;
              *((_OWORD *)v53 + 11) = v92;
              *((_OWORD *)v53 + 12) = v58;
              v59 = v95;
              *((_OWORD *)v53 + 13) = v94;
              *((_OWORD *)v53 + 14) = v59;
              if (!v54)
                v53[344] = 1;
            }
          }
          else
          {
            v5 = v85;
          }

          objc_msgSend(v5, "objectAtIndexedSubscript:", v14 >> 1);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v60;
          if (v60)
            objc_setProperty_atomic(v60, v61, v38, 80);
        }
        else
        {
          v63 = objc_alloc(MEMORY[0x1E0D09AB0]);
          v64 = *(_OWORD *)v16;
          v65 = *((_OWORD *)v16 + 2);
          v90[1] = *((_OWORD *)v16 + 1);
          v90[2] = v65;
          v90[0] = v64;
          v66 = *((_OWORD *)v16 + 3);
          v67 = *((_OWORD *)v16 + 4);
          v68 = *((_OWORD *)v16 + 6);
          v90[5] = *((_OWORD *)v16 + 5);
          v90[6] = v68;
          v90[3] = v66;
          v90[4] = v67;
          v69 = *((_OWORD *)v16 + 7);
          v70 = *((_OWORD *)v16 + 8);
          v71 = *((_OWORD *)v16 + 9);
          v91 = *((_QWORD *)v16 + 20);
          v90[8] = v70;
          v90[9] = v71;
          v90[7] = v69;
          -[CRCTCCVNLPTextDecoder characterObservations](self, "characterObservations");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = v120;
          v89 = v121;
          v51 = (id)objc_msgSend(v63, "initWithBuffer:domainType:characterObservations:blankIndex:pruningPolicy:", v90, v82, v72, v83, &v88);

          v73 = [CRCVNLPTransientResult alloc];
          -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "locale");
          v52 = (id)objc_claimAutoreleasedReturnValue();
          v74 = *((_OWORD *)v16 + 9);
          v86[8] = *((_OWORD *)v16 + 8);
          v86[9] = v74;
          v87 = *((_QWORD *)v16 + 20);
          v75 = *((_OWORD *)v16 + 5);
          v86[4] = *((_OWORD *)v16 + 4);
          v86[5] = v75;
          v76 = *((_OWORD *)v16 + 7);
          v86[6] = *((_OWORD *)v16 + 6);
          v86[7] = v76;
          v77 = *((_OWORD *)v16 + 1);
          v86[0] = *(_OWORD *)v16;
          v86[1] = v77;
          v78 = *((_OWORD *)v16 + 3);
          v86[2] = *((_OWORD *)v16 + 2);
          v86[3] = v78;
          v38 = (CRCVNLPTransientResult *)-[CRCVNLPTransientResult initWithActivationMatrix:decodingLocale:activationsBuffer:]((char *)v73, v51, v52, v86);
          v5 = v85;
          objc_msgSend(v85, "objectAtIndexedSubscript:", v14);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v79;
          if (v79)
            objc_setProperty_atomic(v79, v80, v38, 80);
          v17 = v14;
        }

        v14 = v17 + 1;
        v13 = v122;
        v15 = 0xCF3CF3CF3CF3CF3DLL * (((_BYTE *)__p - v122) >> 3);
      }
      while (v17 + 1 < v15);
    }
    if (v13)
    {
      __p = v13;
      operator delete(v13);
    }
    v4 = v81;
  }

}

- (void)_create2DArraysFromInputArray:(id)a3 classSize:(unint64_t *)a4 outputArrays:(void *)a5
{
  unint64_t v5;
  char isKindOfClass;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  float *v14;
  float v15;
  float v16;
  unint64_t v17;
  float *v18;
  double v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  BOOL v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  BOOL v44;
  unint64_t v45;
  float *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  BOOL v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  float *v83;
  char v84;
  unint64_t v85;
  char v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  float *v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;

  v70 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v70;
  v9 = v8;
  v86 = isKindOfClass;
  v71 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    if (v8)
    {
      objc_msgSend(v8, "output_label_prob_map", v70);
      v83 = (float *)v114;
      v104 = v117;
      v105 = v118;
      v106 = v116;
      v10 = v119;
      v85 = v120;
      v101 = v122;
      v102 = v121;
      v99 = v124;
      v100 = v123;
      v97 = *((_QWORD *)&v114 + 1);
      v98 = v125;
      v96 = v126;
      objc_msgSend(v9, "output_topk_indices");
      v72 = v114;
    }
    else
    {
      v72 = 0;
      v83 = 0;
      v97 = 0;
      v98 = 0;
      v105 = 0;
      v106 = 0;
      v104 = 0;
      v10 = 0;
      v85 = 0;
      v101 = 0;
      v102 = 0;
      v99 = 0;
      v100 = 0;
      v96 = 0;
    }
  }
  else if (v8)
  {
    objc_msgSend(v8, "output_label_prob_map", v70);
    v83 = (float *)v114;
    v104 = v117;
    v105 = v118;
    v106 = v116;
    v10 = v119;
    v85 = v120;
    v101 = v122;
    v102 = v121;
    v99 = v124;
    v100 = v123;
    v97 = *((_QWORD *)&v114 + 1);
    v98 = v125;
    v96 = v126;
  }
  else
  {
    v96 = 0;
    v98 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
    v102 = 0;
    v85 = 0;
    v10 = 0;
    v104 = 0;
    v105 = 0;
    v106 = 0;
    v97 = 0;
    v83 = 0;
  }

  objc_msgSend(v71, "textFeatureInfo");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
    v11 = 2 * objc_msgSend(v107, "count");
  else
    v11 = objc_msgSend(v107, "count");
  std::vector<espresso_buffer_t>::resize((uint64_t)a5, v11);
  if (-[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
  {
    v12 = v104 * v106 * v105 * v10;
    if (v12)
    {
      v13 = 4 * v12;
      v14 = v83;
      do
      {
        v15 = *v14;
        v16 = logf(*v14);
        if (v15 <= 0.0)
          v16 = -INFINITY;
        *v14++ = v16;
        v13 -= 4;
      }
      while (v13);
    }
  }
  v17 = 0;
  v84 = v86 & 1;
  while (v17 < objc_msgSend(v107, "count", v70))
  {
    objc_msgSend(v107, "objectAtIndexedSubscript:", v17);
    v18 = (float *)objc_claimAutoreleasedReturnValue();
    v19 = -[CRFeatureSequenceRecognitionInfo featureImageSize]((uint64_t)v18);
    if (v18)
      v20 = v18[2];
    else
      v20 = 0.0;
    -[CRCTCCVNLPTextDecoder model](self, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "outputWidthDownscale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v24 = v23;
    -[CRCTCCVNLPTextDecoder model](self, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputWidthOffset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v28 = v27;

    -[CRCTCCVNLPTextDecoder model](self, "model");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "outputFormatVersion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "intValue") == 1;

    v32 = v85;
    v34 = v105;
    v33 = v106;
    v35 = v104;
    v37 = v101;
    v36 = v102;
    v38 = (unint64_t)(ceil(v19 * v20 / v24) + v28 + 2.0);
    v40 = v99;
    v39 = v100;
    v41 = v98;
    if (!v31)
    {
      -[CRCTCCVNLPTextDecoder model](self, "model", v105, v98);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "outputFormatVersion");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "intValue") == 2;

      if (!v44)
      {
        v45 = 0;
        v33 = v94;
        v46 = v95;
        v34 = v92;
        v35 = v93;
        v48 = v90;
        v47 = v91;
        v40 = v88;
        v39 = v89;
        v41 = v87;
        goto LABEL_29;
      }
      v32 = v104;
      v35 = v105;
      v33 = v105;
      v41 = v106;
      v34 = v106;
      v36 = 1;
      v37 = 1;
      v39 = 1;
      v40 = v104 * v106;
    }
    if (v32 >= v38)
      v5 = v38;
    else
      v5 = v32;
    v45 = v17 * v40;
    v46 = &v83[v17 * v40];
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v47 = v36;
    v48 = v37;
    v38 = v5;
LABEL_29:
    v49 = *(_QWORD *)a5 + 168 * (v17 << v84);
    v94 = v33;
    v95 = v46;
    *(_QWORD *)v49 = v46;
    *(_QWORD *)(v49 + 8) = v97;
    *(_OWORD *)(v49 + 16) = v114;
    *(_OWORD *)(v49 + 32) = v115;
    *(_OWORD *)(v49 + 48) = v112;
    *(_OWORD *)(v49 + 64) = v113;
    *(_QWORD *)(v49 + 80) = v33;
    *(_QWORD *)(v49 + 88) = v35;
    v92 = v34;
    v93 = v35;
    *(_QWORD *)(v49 + 96) = v34;
    *(_QWORD *)(v49 + 104) = 1;
    *(_QWORD *)(v49 + 112) = v5;
    *(_QWORD *)(v49 + 120) = v47;
    v90 = v48;
    v91 = v47;
    *(_QWORD *)(v49 + 128) = v48;
    *(_QWORD *)(v49 + 136) = v39;
    v88 = v40;
    v89 = v39;
    *(_QWORD *)(v49 + 144) = v40;
    *(_QWORD *)(v49 + 152) = v41;
    v87 = v41;
    *(_DWORD *)(v49 + 160) = v96;
    if ((v86 & 1) == 0)
      goto LABEL_35;
    -[CRCTCCVNLPTextDecoder model](self, "model");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "outputFormatVersion");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "intValue") == 1;

    v53 = v98;
    v54 = v99;
    v55 = v100;
    v56 = v101;
    v57 = v102;
    v59 = v104;
    v58 = v105;
    v60 = v106;
    if (v52)
      goto LABEL_33;
    -[CRCTCCVNLPTextDecoder model](self, "model", v105, v104, v106);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "outputFormatVersion");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "intValue") == 2;

    v54 = v81;
    v53 = v82;
    v65 = v79;
    v64 = v80;
    v67 = v77;
    v66 = v78;
    v59 = v75;
    v58 = v76;
    v68 = v73;
    v60 = v74;
    if (v63)
    {
      v60 = v105;
      v58 = v106;
      v53 = v106;
      v54 = v106 * v106;
      v55 = 1;
      v56 = 1;
      v57 = 1;
      v59 = v105;
LABEL_33:
      v64 = v55;
      v110 = 0u;
      v111 = 0u;
      v65 = v56;
      v66 = v57;
      v67 = v38;
      v108 = 0u;
      v109 = 0u;
      v68 = v72 + 4 * v45;
    }
    v69 = *(_QWORD *)a5 + 168 * ((v17 << v84) + 1);
    v73 = v68;
    v74 = v60;
    *(_QWORD *)v69 = v68;
    *(_QWORD *)(v69 + 8) = v97;
    *(_OWORD *)(v69 + 16) = v110;
    *(_OWORD *)(v69 + 32) = v111;
    *(_OWORD *)(v69 + 48) = v108;
    *(_OWORD *)(v69 + 64) = v109;
    *(_QWORD *)(v69 + 80) = v60;
    *(_QWORD *)(v69 + 88) = v59;
    v75 = v59;
    v76 = v58;
    *(_QWORD *)(v69 + 96) = v58;
    *(_QWORD *)(v69 + 104) = 1;
    v77 = v67;
    v78 = v66;
    *(_QWORD *)(v69 + 112) = v67;
    *(_QWORD *)(v69 + 120) = v66;
    v79 = v65;
    v80 = v64;
    *(_QWORD *)(v69 + 128) = v65;
    *(_QWORD *)(v69 + 136) = v64;
    v81 = v54;
    v82 = v53;
    *(_QWORD *)(v69 + 144) = v54;
    *(_QWORD *)(v69 + 152) = v53;
    *(_DWORD *)(v69 + 160) = v96;
LABEL_35:

    ++v17;
  }

}

- (BOOL)_wordLMShouldFilterCandidate:(id)a3 inLocale:(id)a4 lmConfig:(id)a5
{
  void *v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  long double v31;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  float *v38;
  uint64_t v39;
  int v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "fullString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");
  if (v14 > 0x80)
  {
    v15 = 128;
  }
  else
  {
    objc_msgSend(v9, "fullString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "length");
  }
  objc_msgSend(v12, "substringWithRange:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 <= 0x80)

  v17 = objc_msgSend(v16, "length");
  if (self->_shouldUseLM || -[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
  {
    objc_msgSend(v9, "activationScore");
  }
  else
  {
    objc_msgSend(v9, "activationScore");
    v19 = v31;
    if (!v17)
      goto LABEL_10;
    v18 = pow(v31, 1.0 / (double)v17);
  }
  v19 = v18;
LABEL_10:
  if (v17 < objc_msgSend(v11, "filteringMinimumLength")
    || (objc_msgSend(v11, "filteringActivationThreshold"), v20 = v19, v21 <= v20))
  {
    v25 = 0;
  }
  else
  {
    +[CRLanguageResourcesManager postProcessManager](CRLanguageResourcesManager, "postProcessManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = (float *)&v37;
    v39 = 0x2020000000;
    v40 = 1065353216;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __72__CRCTCCVNLPTextDecoder__wordLMShouldFilterCandidate_inLocale_lmConfig___block_invoke;
    v33[3] = &unk_1E98DBEF0;
    v35 = &v37;
    v36 = v17;
    v34 = v16;
    objc_msgSend(v22, "lockResourcesForLocale:sender:block:", v10, self, v33);
    v23 = v38[6];
    objc_msgSend(v11, "lmThresholdForLength:", v17);
    v25 = v23 < v24;
    if (v23 < v24)
    {
      CROSLogForCategory(3);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "locale");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activationScore");
        v29 = v38[6];
        *(_DWORD *)buf = 138413058;
        v42 = v28;
        v43 = 2048;
        v44 = v17;
        v45 = 2048;
        v46 = v30;
        v47 = 2048;
        v48 = v29;
        _os_log_impl(&dword_1D4FB8000, v26, OS_LOG_TYPE_DEBUG, "Filtering candidate: lang = %@ | length = %ld | activation = %.3f | lmScore = %.3f", buf, 0x2Au);

      }
    }
    else
    {

    }
    _Block_object_dispose(&v37, 8);

  }
  return v25;
}

void __72__CRCTCCVNLPTextDecoder__wordLMShouldFilterCandidate_inLocale_lmConfig___block_invoke(uint64_t a1, void *a2)
{
  float v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "cvnlpCharacterLanguageModel"))
  {
    objc_msgSend(v4, "cvnlpCharacterLanguageModel");
    CVNLPLanguageModelLogJointProbability();
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = expf(v3 / (float)*(uint64_t *)(a1 + 48));
  }

}

+ (unint64_t)_disambiguatedScriptForString:(id)a3
{
  id v3;
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unint64_t v10;

  v3 = a3;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  while (objc_msgSend(v3, "length") > v4)
  {
    v8 = objc_msgSend(v3, "characterAtIndex:", v4);
    if ((v8 - 1024) > 0x12F)
    {
      v9 = (unsigned __int16)((v8 & 0xFFDF) - 65) < 0x1Au || (v8 - 248) < 0x158;
      if ((unsigned __int16)(v8 - 192) < 0x17u)
        v9 = 1;
      if ((v8 - 216) < 0x1F)
        v9 = 1;
      v7 += v9;
    }
    else
    {
      ++v5;
      v6 += utf16CheckIsCyrillicUkrainianOnly(v8);
    }
    ++v4;
  }
  if (v5 | v7 && (double)v5 * 1.5 >= (double)v7)
  {
    if (v6 <= 0)
      v10 = 2;
    else
      v10 = 3;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

+ (unordered_map<CRDisambiguatedScript,)_disambiguatedScriptFeatureIndicesWithInfo:()std:()std:(std:(std:(id)a2 :(SEL)a3 vector<unsigned long>>>> *__return_ptr)retstr :(id)a4 allocator<std::pair<const)CRDisambiguatedScript :equal_to<CRDisambiguatedScript> :hash<CRDisambiguatedScript>
{
  unint64_t v4;
  id v6;
  uint64_t v7;
  __compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<CRDisambiguatedScript, std::vector<unsigned long>>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<CRDisambiguatedScript, std::vector<unsigned long>>, void *>>> *p_var1;
  unint64_t v9;
  unint64_t var0;
  uint8x8_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void **v22;
  void **v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  void **v33;
  void **v34;
  unint64_t v35;
  void **v36;
  uint64_t j;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  id Property;
  const char *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  _QWORD *v55;
  _QWORD *v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t *v59;
  _QWORD *v60;
  unint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  unint64_t *v67;
  unint64_t v68;
  unordered_map<CRDisambiguatedScript, std::vector<unsigned long>, std::hash<CRDisambiguatedScript>, std::equal_to<CRDisambiguatedScript>, std::allocator<std::pair<const CRDisambiguatedScript, std::vector<unsigned long>>>> *result;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v70 = a2;
  v83 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = 0;
  v71 = 1;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v75 = 2;
  v76 = 0;
  v77 = 0;
  v78 = 0;
  v79 = 3;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  retstr->var0.var0 = 0u;
  retstr->var0.var3.var0 = 1.0;
  *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
  p_var1 = &retstr->var0.var1;
  do
  {
    v9 = *(&v71 + 4 * v7);
    var0 = retstr->var0.var0.var0.var1.var0.var0;
    if (var0)
    {
      v11 = (uint8x8_t)vcnt_s8((int8x8_t)var0);
      v11.i16[0] = vaddlv_u8(v11);
      if (v11.u32[0] > 1uLL)
      {
        v4 = *(&v71 + 4 * v7);
        if (var0 <= v9)
          v4 = v9 % var0;
      }
      else
      {
        v4 = (var0 - 1) & v9;
      }
      v12 = retstr->var0.var0.var0.var0[v4];
      if (v12)
      {
        for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
        {
          v14 = i[1];
          if (v14 == v9)
          {
            if (i[2] == v9)
              goto LABEL_74;
          }
          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= var0)
                v14 %= var0;
            }
            else
            {
              v14 &= var0 - 1;
            }
            if (v14 != v4)
              break;
          }
        }
      }
    }
    v15 = operator new(0x30uLL);
    *v15 = 0;
    v15[1] = v9;
    v15[2] = v9;
    v15[4] = 0;
    v15[5] = 0;
    v15[3] = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(v15 + 3, (const void *)*(&v71 + 4 * v7 + 1), *(&v73 + 4 * v7), (*(&v73 + 4 * v7) - *(&v71 + 4 * v7 + 1)) >> 3);
    v16 = (float)(retstr->var0.var2.var0 + 1);
    v17 = retstr->var0.var3.var0;
    if (!var0 || (float)(v17 * (float)var0) < v16)
    {
      v18 = (var0 & (var0 - 1)) != 0;
      if (var0 < 3)
        v18 = 1;
      v19 = v18 | (2 * var0);
      v20 = vcvtps_u32_f32(v16 / v17);
      if (v19 <= v20)
        prime = (int8x8_t)v20;
      else
        prime = (int8x8_t)v19;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      var0 = retstr->var0.var0.var0.var1.var0.var0;
      if (*(_QWORD *)&prime > var0)
        goto LABEL_30;
      if (*(_QWORD *)&prime < var0)
      {
        v28 = vcvtps_u32_f32((float)retstr->var0.var2.var0 / retstr->var0.var3.var0);
        if (var0 < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)var0), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
        {
          v28 = std::__next_prime(v28);
        }
        else
        {
          v30 = 1 << -(char)__clz(v28 - 1);
          if (v28 >= 2)
            v28 = v30;
        }
        if (*(_QWORD *)&prime <= v28)
          prime = (int8x8_t)v28;
        if (*(_QWORD *)&prime >= var0)
        {
          var0 = retstr->var0.var0.var0.var1.var0.var0;
        }
        else
        {
          if (prime)
          {
LABEL_30:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v22 = (void **)operator new(8 * *(_QWORD *)&prime);
            v23 = retstr->var0.var0.var0.var0;
            retstr->var0.var0.var0.var0 = v22;
            if (v23)
              operator delete(v23);
            v24 = 0;
            retstr->var0.var0.var0.var1.var0.var0 = (unint64_t)prime;
            do
              retstr->var0.var0.var0.var0[v24++] = 0;
            while (*(_QWORD *)&prime != v24);
            v25 = p_var1->var0.var0;
            if (p_var1->var0.var0)
            {
              v26 = v25[1];
              v27 = (uint8x8_t)vcnt_s8(prime);
              v27.i16[0] = vaddlv_u8(v27);
              if (v27.u32[0] > 1uLL)
              {
                if (v26 >= *(_QWORD *)&prime)
                  v26 %= *(_QWORD *)&prime;
              }
              else
              {
                v26 &= *(_QWORD *)&prime - 1;
              }
              retstr->var0.var0.var0.var0[v26] = p_var1;
              v31 = (_QWORD *)*v25;
              if (*v25)
              {
                do
                {
                  v32 = v31[1];
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v32 >= *(_QWORD *)&prime)
                      v32 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v32 &= *(_QWORD *)&prime - 1;
                  }
                  if (v32 != v26)
                  {
                    if (!retstr->var0.var0.var0.var0[v32])
                    {
                      retstr->var0.var0.var0.var0[v32] = v25;
                      goto LABEL_55;
                    }
                    *v25 = *v31;
                    *v31 = *(_QWORD *)retstr->var0.var0.var0.var0[v32];
                    *(_QWORD *)retstr->var0.var0.var0.var0[v32] = v31;
                    v31 = v25;
                  }
                  v32 = v26;
LABEL_55:
                  v25 = v31;
                  v31 = (_QWORD *)*v31;
                  v26 = v32;
                }
                while (v31);
              }
            }
            var0 = (unint64_t)prime;
            goto LABEL_59;
          }
          v36 = retstr->var0.var0.var0.var0;
          retstr->var0.var0.var0.var0 = 0;
          if (v36)
            operator delete(v36);
          var0 = 0;
          retstr->var0.var0.var0.var1.var0.var0 = 0;
        }
      }
LABEL_59:
      if ((var0 & (var0 - 1)) != 0)
      {
        if (var0 <= v9)
          v4 = v9 % var0;
        else
          v4 = v9;
      }
      else
      {
        v4 = (var0 - 1) & v9;
      }
    }
    v33 = retstr->var0.var0.var0.var0;
    v34 = (void **)retstr->var0.var0.var0.var0[v4];
    if (v34)
    {
      *v15 = *v34;
LABEL_72:
      *v34 = v15;
      goto LABEL_73;
    }
    *v15 = p_var1->var0.var0;
    p_var1->var0.var0 = v15;
    v33[v4] = p_var1;
    if (*v15)
    {
      v35 = *(_QWORD *)(*v15 + 8);
      if ((var0 & (var0 - 1)) != 0)
      {
        if (v35 >= var0)
          v35 %= var0;
      }
      else
      {
        v35 &= var0 - 1;
      }
      v34 = &retstr->var0.var0.var0.var0[v35];
      goto LABEL_72;
    }
LABEL_73:
    ++retstr->var0.var2.var0;
LABEL_74:
    ++v7;
  }
  while (v7 != 3);
  for (j = 0; j != -96; j -= 32)
  {
    v38 = *(void **)((char *)&v80 + j);
    if (v38)
    {
      *(uint64_t *)((char *)&v81 + j) = (uint64_t)v38;
      operator delete(v38);
    }
  }
  v39 = 0;
LABEL_89:
  if (v39 < objc_msgSend(v6, "count", v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83))
  {
    v40 = (void *)MEMORY[0x1D826E7B0]();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v41;
    if (v41)
    {
      Property = objc_getProperty(v41, v42, 80, 1);
      v46 = Property;
      if (Property)
        Property = objc_getProperty(Property, v45, 352, 1);
    }
    else
    {
      v46 = 0;
      Property = 0;
    }
    v47 = Property;
    objc_msgSend(v47, "candidates");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "firstObject");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "fullString");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_msgSend((id)objc_opt_class(), "_disambiguatedScriptForString:", v50);
    v52 = retstr->var0.var0.var0.var1.var0.var0;
    if (!v52)
      goto LABEL_129;
    v53 = (uint8x8_t)vcnt_s8((int8x8_t)v52);
    v53.i16[0] = vaddlv_u8(v53);
    if (v53.u32[0] > 1uLL)
    {
      v54 = v51;
      if (v51 >= v52)
        v54 = v51 % v52;
    }
    else
    {
      v54 = (v52 - 1) & v51;
    }
    v55 = retstr->var0.var0.var0.var0[v54];
    if (!v55 || (v56 = (_QWORD *)*v55) == 0)
LABEL_129:
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    while (1)
    {
      v57 = v56[1];
      if (v57 == v51)
      {
        if (v56[2] == v51)
        {
          v58 = v56[5];
          v59 = (unint64_t *)v56[4];
          if ((unint64_t)v59 >= v58)
          {
            v61 = (unint64_t *)v56[3];
            v62 = v59 - v61;
            if ((unint64_t)(v62 + 1) >> 61)
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            v63 = v58 - (_QWORD)v61;
            v64 = (uint64_t)(v58 - (_QWORD)v61) >> 2;
            if (v64 <= v62 + 1)
              v64 = v62 + 1;
            if (v63 >= 0x7FFFFFFFFFFFFFF8)
              v65 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v65 = v64;
            if (v65)
            {
              v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v56 + 5), v65);
              v61 = (unint64_t *)v56[3];
              v59 = (unint64_t *)v56[4];
            }
            else
            {
              v66 = 0;
            }
            v67 = (unint64_t *)&v66[8 * v62];
            *v67 = v39;
            v60 = v67 + 1;
            while (v59 != v61)
            {
              v68 = *--v59;
              *--v67 = v68;
            }
            v56[3] = v67;
            v56[4] = v60;
            v56[5] = &v66[8 * v65];
            if (v61)
              operator delete(v61);
          }
          else
          {
            *v59 = v39;
            v60 = v59 + 1;
          }
          v56[4] = v60;

          objc_autoreleasePoolPop(v40);
          ++v39;
          goto LABEL_89;
        }
      }
      else
      {
        if (v53.u32[0] > 1uLL)
        {
          if (v57 >= v52)
            v57 %= v52;
        }
        else
        {
          v57 &= v52 - 1;
        }
        if (v57 != v54)
          goto LABEL_129;
      }
      v56 = (_QWORD *)*v56;
      if (!v56)
        goto LABEL_129;
    }
  }

  return result;
}

- (BOOL)_shouldUseCharacterDecodingToken
{
  void *v3;
  BOOL v4;

  -[CRCTCCVNLPTextDecoder model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportCharacterBoxes"))
    v4 = -[CRCTCCVNLPTextDecoder shouldUseLM](self, "shouldUseLM");
  else
    v4 = 0;

  return v4;
}

- (id)_commitActionBehavior
{
  if (-[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"))
    objc_msgSend(MEMORY[0x1E0D09AE8], "defaultCharacterCommitActionBehavior");
  else
    objc_msgSend(MEMORY[0x1E0D09AE8], "defaultWhitespaceCommitActionBehavior");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_decodeFeaturesWithInfo:(id)a3 imageSize:(CGSize)a4 error:(id *)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  id Property;
  id v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  SEL v28;
  void *v29;
  void *v30;
  const char *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v41;
  void *v42;
  void *v43;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numTopStringCandidates");
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;

  if (v11 <= 3)
    v12 = 3;
  else
    v12 = v11;
  -[CRCTCCVNLPTextDecoder _commitActionBehavior](self, "_commitActionBehavior");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AE0]), "initWithCommitActionBehavior:beamWidth:pathCount:shouldOptimizeAlignment:pruneProblematicMixedScriptWordPaths:", v13, v12, v11, 0, 1);
  objc_msgSend(v14, "setShouldApplyWordLMToLastWord:", 1);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AE8]), "initWithCommitActionBehavior:", v13);
  if (-[CRCTCCVNLPTextDecoder shouldUseLM](self, "shouldUseLM"))
    v42 = 0;
  else
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AB8]), "initWithLanguageResourceBundle:", 0);
  -[CRCTCCVNLPTextDecoder model](self, "model");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  v39 = (void *)v13;
  v16 = objc_msgSend(v15, "supportCharacterBoxes");

  v17 = 0;
  do
  {
    v18 = v17;
    v19 = objc_msgSend(v8, "count");
    if (v18 >= v19)
      break;
    objc_msgSend(v8, "objectAtIndexedSubscript:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v20;
    if (v20)
      Property = objc_getProperty(v20, v21, 80, 1);
    else
      Property = 0;
    v24 = Property;

    if (v24 && objc_getProperty(v24, v25, 376, 1))
    {
      v27 = objc_getProperty(v24, v26, 376, 1);
      dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
      objc_setProperty_atomic(v24, v28, 0, 376);
    }
    -[CRCTCCVNLPTextDecoder locale](self, "locale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localeIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24 && objc_getProperty(v24, v31, 368, 1))
    {
      v33 = objc_getProperty(v24, v32, 368, 1);

      v30 = v33;
    }
    -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRLanguageModelConfiguration configurationForLanguageIdentifier:rev:](CRLanguageModelConfiguration, "configurationForLanguageIdentifier:rev:", v30, objc_msgSend(v34, "revision"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", v18);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[CRCTCCVNLPTextDecoder _decodeSingleFeatureWithInfo:decodingLocale:greedyDecoder:greedyConfig:beamSearchConfig:imageSize:useCharacterBoxes:lmConfig:error:](self, "_decodeSingleFeatureWithInfo:decodingLocale:greedyDecoder:greedyConfig:beamSearchConfig:imageSize:useCharacterBoxes:lmConfig:error:", v36, v30, v42, v43, v41, v16, width, height, v35, a5);

    v17 = v18 + 1;
  }
  while (v37);

  return v18 >= v19;
}

- (id)_cvnlpDecodingResultForActivationMatrix:(id)a3 decodingLocale:(id)a4 beamSearchConfig:(id)a5 lmConfig:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  id v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__25;
  v34 = __Block_byref_object_dispose__25;
  v35 = 0;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __112__CRCTCCVNLPTextDecoder__cvnlpDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke;
  v25[3] = &unk_1E98DBF18;
  v25[4] = self;
  v16 = v15;
  v26 = v16;
  v17 = v12;
  v27 = v17;
  v29 = &v30;
  v18 = v14;
  v28 = v18;
  v19 = (void *)MEMORY[0x1D826E9A8](v25);
  +[CRLanguageResourcesManager sharedManager](CRLanguageResourcesManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "lockResourcesForLocale:sender:block:", v13, self, v19);
  if (a7)
    v22 = v21;
  else
    v22 = 1;
  if ((v22 & 1) != 0)
  {
    v23 = (id)v31[5];
  }
  else
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -6);
    v23 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v30, 8);
  return v23;
}

void __112__CRCTCCVNLPTextDecoder__cvnlpDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cvnlpLanguageResourceBundle:lmConfig:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AB8]), "initWithLanguageResourceBundle:", v4);
  objc_msgSend(v5, "setActivationMatrix:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "decodingResultWithConfiguration:withContext:", *(_QWORD *)(a1 + 56), 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>)_createBeamScorerWithBundle:(SEL)a3 beamSearchConfig:(id)a4 lmConfig:(id)a5
{
  id v10;
  id v11;
  id v12;
  unint64_t codemapSize;
  int *codemapArray;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  void **v23;
  void **v24;
  uint64_t v25;
  void *v26;
  float v27;
  _DWORD *v28;
  _DWORD *v29;
  _BOOL4 v30;
  void **v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  char *v42;
  char *v43;
  int v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  const void *v63;
  uint64_t v64;
  std::vector<unsigned int>::pointer end;
  unsigned int *v66;
  std::vector<unsigned int>::pointer begin;
  int64_t v68;
  unint64_t v69;
  int64_t v70;
  unint64_t v71;
  uint64_t v72;
  unsigned int *v73;
  uint64_t v74;
  __int128 v75;
  unsigned int *value;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  void *v82;
  void *v83;
  void *v84;
  _LXLexicon *v85;
  _LXLexicon *v86;
  std::vector<unsigned int>::pointer v87;
  unsigned int *v88;
  std::vector<unsigned int>::pointer v89;
  int64_t v90;
  unint64_t v91;
  int64_t v92;
  unint64_t v93;
  uint64_t v94;
  unsigned int *v95;
  uint64_t v96;
  __int128 v97;
  unsigned int *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  void **v106;
  void **v107;
  unsigned int *v108;
  unsigned int *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState> *result;
  uint64_t v114;
  id v115;
  CFTypeRef *v116;
  CFTypeRef *v117;
  uint64_t v118;
  uint64_t (**v119)();
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  unint64_t v123;
  void **v124;
  void **v125;
  void *__p;
  char *v127;
  uint64_t v128;
  std::vector<unsigned int> v129;
  int v130;
  uint64_t v131[3];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  *(_OWORD *)&retstr->var1 = xmmword_1D513BAB0;
  retstr->var0 = (void **)&off_1E98D90E0;
  retstr->var3.var0 = 0;
  retstr->var3.var1 = 0;
  retstr->var3.var2.var0 = 0;
  codemapArray = self->_codemapArray;
  codemapSize = self->_codemapSize;
  v127 = 0;
  v128 = 0;
  __p = 0;
  v115 = v11;
  if (codemapSize)
  {
    std::vector<unsigned int>::__vallocate[abi:ne180100](&__p, codemapSize);
    v15 = 0;
    v16 = v127;
    do
    {
      *(_DWORD *)&v16[v15 * 4] = codemapArray[v15];
      ++v15;
    }
    while (codemapSize != v15);
    v127 = &v16[v15 * 4];
  }
  -[CRCTCCVNLPTextDecoder characterObservations](self, "characterObservations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v17, "indexOfObject:", CFSTR(" "));

  objc_msgSend(v12, "characterLMWeight");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v12, "characterLMWeight");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20 > 0.0;

  }
  else
  {
    v21 = 0;
  }

  if (objc_msgSend(v10, "lmCharacterLanguageModel"))
    v22 = v21;
  else
    v22 = 0;
  if (v22)
  {
    v23 = (void **)objc_msgSend(v10, "lmCharacterLanguageModel");
    v24 = v23;
    if (v23)
      CFRetain(v23);
    v119 = (uint64_t (**)())v24;
    v25 = operator new();
    if (v24)
      CFRetain(v24);
    v125 = v24;
    -[CRCTCCVNLPTextDecoder model](self, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "supportCharacterBoxes"))
      v27 = 0.0;
    else
      v27 = 0.25;
    *(_OWORD *)(v25 + 8) = xmmword_1D513BAB0;
    *(_QWORD *)v25 = &off_1E98D9008;
    if (v24)
      CFRetain(v24);
    *(_QWORD *)(v25 + 32) = 0;
    *(_QWORD *)(v25 + 24) = v24;
    *(_QWORD *)(v25 + 40) = 0;
    *(_QWORD *)(v25 + 48) = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((_QWORD *)(v25 + 32), __p, (uint64_t)v127, (v127 - (_BYTE *)__p) >> 2);
    *(_DWORD *)(v25 + 56) = 5;
    *(_QWORD *)(v25 + 64) = -1;
    *(float *)(v25 + 72) = v27;
    v29 = *(_DWORD **)(v25 + 32);
    v28 = *(_DWORD **)(v25 + 40);
    while (v29 != v28)
      *v29++ = CVNLPNormalizeCodepointForCharLM();

    if (v24)
      CFRelease(v24);
    v11 = v115;
    objc_msgSend(v12, "characterLMWeight");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    *(_QWORD *)(v25 + 8) = v36;

    CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>::addScorer(retstr, v25);
    if (v24)
      CFRelease(v24);
  }
  else
  {
    if (objc_msgSend(v10, "cvnlpCharacterLanguageModel"))
      v30 = v21;
    else
      v30 = 0;
    if (v30)
    {
      v31 = (void **)objc_msgSend(v10, "cvnlpCharacterLanguageModel");
      v32 = v31;
      if (v31)
        CFRetain(v31);
      v119 = (uint64_t (**)())v32;
      v33 = operator new();
      v34 = v33;
      if (v32)
      {
        CFRetain(v32);
        v124 = v32;
        *(_OWORD *)(v34 + 8) = xmmword_1D513BAB0;
        *(_QWORD *)v34 = &off_1E98D8FC0;
        CFRetain(v32);
      }
      else
      {
        v124 = 0;
        *(_OWORD *)(v33 + 8) = xmmword_1D513BAB0;
        *(_QWORD *)v33 = &off_1E98D8FC0;
      }
      *(_QWORD *)(v34 + 24) = v32;
      *(_QWORD *)(v34 + 40) = 0;
      *(_QWORD *)(v34 + 48) = 0;
      *(_QWORD *)(v34 + 32) = 0;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((_QWORD *)(v34 + 32), __p, (uint64_t)v127, (v127 - (_BYTE *)__p) >> 2);
      *(_QWORD *)(v34 + 56) = -1;
      if (v32)
        CFRelease(v32);
      objc_msgSend(v12, "characterLMWeight");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      *(_QWORD *)(v34 + 8) = v38;

      CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>::addScorer(retstr, v34);
      if (v32)
        CFRelease(v32);
    }
  }
  if (objc_msgSend(v11, "pruneProblematicMixedScriptWordPaths"))
  {
    objc_msgSend(v10, "locale");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localeIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = +[CRImageReader languageIsArabic:](CRImageReader, "languageIsArabic:", v40);

    if (v41)
    {
      memset(&v129, 0, sizeof(v129));
      std::vector<unsigned int>::reserve(&v129, (v127 - (_BYTE *)__p) >> 2);
      v42 = (char *)__p;
      v43 = v127;
      v131[0] = (uint64_t)&v129;
      if (__p != v127)
      {
        do
        {
          v44 = *(unsigned __int16 *)v42;
          if ((v44 - 48) >= 0xA)
          {
            if ((v44 - 1632) >= 0xA)
            {
              v45 = 2;
              if ((v44 - 42) >= 6)
              {
                v46 = v44 - 1642;
                v47 = v44 - 1548;
                if ((v44 - 151) >= 0x8C && (v44 - 101) >= 0x2C)
                  v49 = 4;
                else
                  v49 = 3;
                if (v47 < 2)
                  v49 = 2;
                if (v46 >= 4)
                  v45 = v49;
                else
                  v45 = 2;
              }
            }
            else
            {
              v45 = 1;
            }
          }
          else
          {
            v45 = 0;
          }
          v130 = v45;
          std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](v131, &v130);
          v42 += 4;
        }
        while (v42 != v43);
      }
      v120 = xmmword_1D513BAB0;
      v122 = 0;
      v121 = 0uLL;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v121, v129.__begin_, (uint64_t)v129.__end_, v129.__end_ - v129.__begin_);
      v123 = 0xC08F400000000000;
      v119 = &off_1E98D8420;
      if (v129.__begin_)
      {
        v129.__end_ = v129.__begin_;
        operator delete(v129.__begin_);
      }
      v11 = v115;
      v50 = operator new();
      *(_OWORD *)(v50 + 8) = v120;
      *(_OWORD *)(v50 + 24) = v121;
      *(_QWORD *)(v50 + 40) = v122;
      v122 = 0;
      v121 = 0uLL;
      *(_QWORD *)(v50 + 48) = v123;
      *(_QWORD *)v50 = &off_1E98D8420;
      v119 = (uint64_t (**)())v50;
      CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>::addScorer(retstr, (uint64_t *)&v119);
    }
    else
    {
      objc_msgSend(v10, "locale");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localeIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v52))
      {

      }
      else
      {
        objc_msgSend(v10, "locale");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localeIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = +[CRImageReader languageIsCyrillic:](CRImageReader, "languageIsCyrillic:", v54);

        if (!v55)
          goto LABEL_75;
      }
      memset(&v129, 0, sizeof(v129));
      std::vector<unsigned int>::reserve(&v129, (v127 - (_BYTE *)__p) >> 2);
      v56 = (char *)__p;
      v57 = v127;
      v131[0] = (uint64_t)&v129;
      while (v56 != v57)
      {
        v130 = CVNLPCodepointToScriptCode();
        std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](v131, &v130);
        v56 += 4;
      }
      v120 = xmmword_1D513BAB0;
      v122 = 0;
      v121 = 0uLL;
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v121, v129.__begin_, (uint64_t)v129.__end_, v129.__end_ - v129.__begin_);
      v123 = 0xC08F400000000000;
      v119 = &off_1E98D9218;
      if (v129.__begin_)
      {
        v129.__end_ = v129.__begin_;
        operator delete(v129.__begin_);
      }
      v11 = v115;
      v58 = operator new();
      *(_OWORD *)(v58 + 8) = v120;
      *(_OWORD *)(v58 + 24) = v121;
      *(_QWORD *)(v58 + 40) = v122;
      v122 = 0;
      v121 = 0uLL;
      *(_QWORD *)(v58 + 48) = v123;
      *(_QWORD *)v58 = &off_1E98D9218;
      v119 = (uint64_t (**)())v58;
      CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>::addScorer(retstr, (uint64_t *)&v119);
    }
    if (v119)
      (*((void (**)(uint64_t (**)()))*v119 + 1))(v119);
  }
LABEL_75:
  objc_msgSend(v12, "lexiconWeight");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v59)
    goto LABEL_124;
  objc_msgSend(v12, "lexiconWeight");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "doubleValue");
  v62 = v61;

  if (v62 <= 0.0)
    goto LABEL_124;
  memset(&v129, 0, sizeof(v129));
  if (objc_msgSend(v10, "staticLexicon"))
  {
    v63 = (const void *)objc_msgSend(v10, "staticLexicon");
    v64 = (uint64_t)v63;
    if (v63)
      CFRetain(v63);
    v131[0] = v64;
    end = v129.__end_;
    if (v129.__end_ >= v129.__end_cap_.__value_)
    {
      begin = v129.__begin_;
      v68 = ((char *)v129.__end_ - (char *)v129.__begin_) >> 3;
      v69 = v68 + 1;
      if ((unint64_t)(v68 + 1) >> 61)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v70 = (char *)v129.__end_cap_.__value_ - (char *)v129.__begin_;
      if (v129.__end_cap_.__value_ - v129.__begin_ > v69)
        v69 = v70 >> 2;
      if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF8)
        v71 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v71 = v69;
      *((_QWORD *)&v121 + 1) = &v129.__end_cap_;
      if (v71)
      {
        v71 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v71);
        begin = v129.__begin_;
        end = v129.__end_;
      }
      else
      {
        v72 = 0;
      }
      v73 = (unsigned int *)(v71 + 8 * v68);
      *(_QWORD *)&v121 = v71 + 8 * v72;
      *(_QWORD *)v73 = v64;
      *((_QWORD *)&v120 + 1) = v73 + 2;
      if (end == begin)
      {
        v66 = v73 + 2;
      }
      else
      {
        do
        {
          v74 = *((_QWORD *)end - 1);
          end -= 2;
          *((_QWORD *)v73 - 1) = v74;
          v73 -= 2;
          *(_QWORD *)end = 0;
        }
        while (end != begin);
        v66 = (unsigned int *)*((_QWORD *)&v120 + 1);
      }
      v75 = *(_OWORD *)&v129.__begin_;
      v129.__begin_ = v73;
      v129.__end_ = v66;
      v120 = v75;
      value = v129.__end_cap_.__value_;
      v129.__end_cap_.__value_ = (unsigned int *)v121;
      *(_QWORD *)&v121 = value;
      v119 = (uint64_t (**)())v75;
      std::__split_buffer<applesauce::CF::ObjectRef<_LXLexicon const*>>::~__split_buffer((uint64_t)&v119);
    }
    else
    {
      *(_QWORD *)v129.__end_ = v64;
      v66 = end + 2;
    }
    v129.__end_ = v66;
  }
  -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "customWords");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v78)
    goto LABEL_120;
  -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "customWords");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_119:
LABEL_120:

    goto LABEL_121;
  }
  v81 = objc_msgSend(v10, "isCustomWordsSupported");

  if (v81)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class(), &retstr->var3);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "customWords");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "filteredArrayUsingPredicate:", v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v78, "count"))
    {
      -[CRCTCCVNLPTextDecoder locale](self, "locale");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = +[CRLanguageUtils createDynamicLexicon:forLocale:error:](CRLanguageUtils, "createDynamicLexicon:forLocale:error:", v78, v84, 0);
      v86 = v85;
      v131[0] = (uint64_t)v85;
      v87 = v129.__end_;
      if (v129.__end_ >= v129.__end_cap_.__value_)
      {
        v89 = v129.__begin_;
        v90 = ((char *)v129.__end_ - (char *)v129.__begin_) >> 3;
        v91 = v90 + 1;
        if ((unint64_t)(v90 + 1) >> 61)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v92 = (char *)v129.__end_cap_.__value_ - (char *)v129.__begin_;
        if (v129.__end_cap_.__value_ - v129.__begin_ > v91)
          v91 = v92 >> 2;
        if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF8)
          v93 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v93 = v91;
        *((_QWORD *)&v121 + 1) = &v129.__end_cap_;
        if (v93)
        {
          v93 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,int>>>(v93);
          v89 = v129.__begin_;
          v87 = v129.__end_;
        }
        else
        {
          v94 = 0;
        }
        v95 = (unsigned int *)(v93 + 8 * v90);
        *(_QWORD *)&v121 = v93 + 8 * v94;
        *(_QWORD *)v95 = v86;
        *((_QWORD *)&v120 + 1) = v95 + 2;
        if (v87 == v89)
        {
          v88 = v95 + 2;
        }
        else
        {
          do
          {
            v96 = *((_QWORD *)v87 - 1);
            v87 -= 2;
            *((_QWORD *)v95 - 1) = v96;
            v95 -= 2;
            *(_QWORD *)v87 = 0;
          }
          while (v87 != v89);
          v88 = (unsigned int *)*((_QWORD *)&v120 + 1);
        }
        v97 = *(_OWORD *)&v129.__begin_;
        v129.__begin_ = v95;
        v129.__end_ = v88;
        v120 = v97;
        v98 = v129.__end_cap_.__value_;
        v129.__end_cap_.__value_ = (unsigned int *)v121;
        *(_QWORD *)&v121 = v98;
        v119 = (uint64_t (**)())v97;
        std::__split_buffer<applesauce::CF::ObjectRef<_LXLexicon const*>>::~__split_buffer((uint64_t)&v119);
      }
      else
      {
        *(_QWORD *)v129.__end_ = v85;
        v88 = v87 + 2;
      }
      v129.__end_ = v88;

    }
    goto LABEL_119;
  }
LABEL_121:
  if (v129.__begin_ != v129.__end_)
  {
    v99 = operator new();
    v116 = 0;
    v117 = 0;
    v118 = 0;
    std::vector<applesauce::CF::ObjectRef<_LXLexicon const*>>::__init_with_size[abi:ne180100]<applesauce::CF::ObjectRef<_LXLexicon const*>*,applesauce::CF::ObjectRef<_LXLexicon const*>*>(&v116, (CFTypeRef *)v129.__begin_, (CFTypeRef *)v129.__end_, ((char *)v129.__end_ - (char *)v129.__begin_) >> 3);
    *(_OWORD *)(v99 + 8) = xmmword_1D513BAB0;
    *(_QWORD *)v99 = &off_1E98D8F28;
    *(_QWORD *)(v99 + 24) = 0;
    *(_QWORD *)(v99 + 32) = 0;
    *(_QWORD *)(v99 + 40) = 0;
    std::vector<applesauce::CF::ObjectRef<_LXLexicon const*>>::__init_with_size[abi:ne180100]<applesauce::CF::ObjectRef<_LXLexicon const*>*,applesauce::CF::ObjectRef<_LXLexicon const*>*>((_QWORD *)(v99 + 24), v116, v117, v117 - v116);
    *(_QWORD *)(v99 + 48) = 0;
    *(_QWORD *)(v99 + 56) = 0;
    *(_QWORD *)(v99 + 64) = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((_QWORD *)(v99 + 48), __p, (uint64_t)v127, (v127 - (_BYTE *)__p) >> 2);
    *(_QWORD *)(v99 + 72) = v114;
    *(_QWORD *)(v99 + 80) = -1;
    *(_BYTE *)(v99 + 88) = 0;
    *(_QWORD *)(v99 + 96) = 0;
    v119 = (uint64_t (**)())&v116;
    std::vector<applesauce::CF::ObjectRef<_LXLexicon const*>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v119);
    objc_msgSend(v12, "lexiconWeight");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "doubleValue");
    *(_QWORD *)(v99 + 8) = v101;

    *(_BYTE *)(v99 + 88) = 1;
    CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>::addScorer(retstr, v99);
  }
  v119 = (uint64_t (**)())&v129;
  std::vector<applesauce::CF::ObjectRef<_LXLexicon const*>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v119);
LABEL_124:
  if (objc_msgSend(v10, "wordLanguageModel"))
  {
    objc_msgSend(v12, "wordLMWeight");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102)
    {
      objc_msgSend(v12, "wordLMWeight");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "doubleValue");
      v105 = v104;

      if (v105 > 0.0)
      {
        v106 = (void **)objc_msgSend(v10, "wordLanguageModel");
        v107 = v106;
        if (v106)
          CFRetain(v106);
        v119 = (uint64_t (**)())v107;
        v108 = (unsigned int *)objc_msgSend(v10, "wordTokenizer");
        v109 = v108;
        if (v108)
          CFRetain(v108);
        v129.__begin_ = v109;
        v110 = operator new();
        if (v107)
          CFRetain(v107);
        if (v109)
          CFRetain(v109);
        *(_OWORD *)(v110 + 8) = xmmword_1D513BAB0;
        *(_QWORD *)v110 = &off_1E98D8EB8;
        if (v107)
          CFRetain(v107);
        *(_QWORD *)(v110 + 24) = v107;
        if (v109)
          CFRetain(v109);
        *(_QWORD *)(v110 + 40) = 0;
        *(_QWORD *)(v110 + 32) = v109;
        *(_QWORD *)(v110 + 48) = 0;
        *(_QWORD *)(v110 + 56) = 0;
        std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>((_QWORD *)(v110 + 40), __p, (uint64_t)v127, (v127 - (_BYTE *)__p) >> 2);
        *(_QWORD *)(v110 + 64) = v114;
        *(_QWORD *)(v110 + 72) = -1;
        *(_BYTE *)(v110 + 80) = 0;
        if (v109)
          CFRelease(v109);
        if (v107)
          CFRelease(v107);
        objc_msgSend(v12, "wordLMWeight");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "doubleValue");
        *(_QWORD *)(v110 + 8) = v112;

        *(_BYTE *)(v110 + 80) = objc_msgSend(v11, "shouldApplyWordLMToLastWord");
        CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>::addScorer(retstr, v110);
        if (v109)
          CFRelease(v109);
        if (v107)
          CFRelease(v107);
      }
    }
  }
  if (__p)
  {
    v127 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

- (id)_cvnlpGreedyModernizedDecodingResultForActivationMatrix:(const void *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  void *__p;
  _BYTE *v11;
  uint64_t v12;
  uint64_t (**v13)();
  uint64_t v14;
  uint64_t (**v15)();
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CFTypeRef v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  void **v25;

  -[CRCTCCVNLPTextDecoder model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ctcBlankLabelIndex");

  v23 = 0uLL;
  v24 = 0;
  if (-[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"))
  {
    v13 = &off_1E98D8E68;
    v14 = v6;
    v16 = 0;
    v15 = &off_1E98D91D0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::CharacterSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode((uint64_t)&v13, (unint64_t *)a3, (uint64_t *)&v9);
    std::vector<CoreRecognition::decoder::DecodingPath>::__vdeallocate((void ***)&v23);
    v23 = v9;
    v24 = __p;
    v25 = (void **)&v9;
    __p = 0;
    v9 = 0uLL;
    std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v25);
  }
  else
  {
    BYTE8(v9) = 0;
    *(_QWORD *)&v9 = &unk_1E98D9098;
    v11 = 0;
    v12 = 0;
    __p = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, self->_spaceLabels.__begin_, (uint64_t)self->_spaceLabels.__end_, self->_spaceLabels.__end_ - self->_spaceLabels.__begin_);
    v13 = (uint64_t (**)())&unk_1E98D8E40;
    v14 = v6;
    v16 = 0;
    v15 = (uint64_t (**)())&unk_1E98D9098;
    v18 = 0;
    v19 = 0;
    v17 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v17, __p, (uint64_t)v11, (v11 - (_BYTE *)__p) >> 3);
    *(_QWORD *)&v9 = &unk_1E98D9098;
    if (__p)
    {
      v11 = __p;
      operator delete(__p);
    }
    v20 = 0;
    v21 = 0;
    v22 = 0;
    CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode(&v13, (uint64_t *)a3, (uint64_t *)&v9);
    std::vector<CoreRecognition::decoder::DecodingPath>::__vdeallocate((void ***)&v23);
    v23 = v9;
    v24 = __p;
    v25 = (void **)&v9;
    __p = 0;
    v9 = 0uLL;
    std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v25);
    if (v20)
      CFRelease(v20);
    v13 = (uint64_t (**)())&unk_1E98D8E40;
    v15 = (uint64_t (**)())&unk_1E98D9098;
    if (v17)
    {
      v18 = v17;
      operator delete(v17);
    }
  }
  convertToCVNLPTextDecodingResult();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (uint64_t (**)())&v23;
  std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  return v7;
}

id __81__CRCTCCVNLPTextDecoder__cvnlpGreedyModernizedDecodingResultForActivationMatrix___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cvnlpModernizedDecodingResultForActivationMatrix:(const void *)a3 decodingLocale:(id)a4 beamSearchConfig:(id)a5 lmConfig:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  id v21;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  const void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__25;
  v32 = __Block_byref_object_dispose__25;
  v33 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __122__CRCTCCVNLPTextDecoder__cvnlpModernizedDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke;
  v23[3] = &unk_1E98DBF40;
  v23[4] = self;
  v15 = v13;
  v24 = v15;
  v16 = v14;
  v26 = &v28;
  v27 = a3;
  v25 = v16;
  v17 = (void *)MEMORY[0x1D826E9A8](v23);
  +[CRLanguageResourcesManager sharedManager](CRLanguageResourcesManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "lockResourcesForLocale:sender:block:", v12, self, v17);
  if (a7)
    v20 = v19;
  else
    v20 = 1;
  if ((v20 & 1) != 0)
  {
    v21 = (id)v29[5];
  }
  else
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -6);
    v21 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v28, 8);
  return v21;
}

void __122__CRCTCCVNLPTextDecoder__cvnlpModernizedDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  float v9;
  unsigned int v10;
  float v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  CFTypeRef v24[3];
  uint64_t (**v25)();
  void *v26;
  uint64_t (**v27)();
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t (**v31)();
  char v32;
  void *__p;
  void *v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  float v39;
  uint64_t v40;
  char v41;
  char v42;
  CFTypeRef cf;
  uint64_t v44;
  void *v45;
  _BYTE *v46;
  uint64_t v47;
  _OWORD v48[3];
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void **v54;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "ctcBlankLabelIndex");

  v6 = objc_msgSend(*(id *)(a1 + 40), "beamWidth");
  v7 = objc_msgSend(*(id *)(a1 + 40), "pathCount");
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v8, "pruningPolicy");
    v9 = *((float *)&v52 + 1);
    v10 = v53;
  }
  else
  {
    v10 = 0;
    v9 = 0.0;
  }
  v11 = logf(v9);
  v49 = 0uLL;
  v50 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldUseCharacterDecodingToken"))
  {
    v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_msgSend(v12, "_createBeamScorerWithBundle:beamSearchConfig:lmConfig:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v13 = *(_OWORD *)((char *)&v48[1] + 8);
      v14 = *((_QWORD *)&v48[2] + 1);
    }
    else
    {
      v14 = 0;
      v13 = 0uLL;
      memset(v48, 0, sizeof(v48));
    }
    v25 = &off_1E98D8F98;
    v26 = v5;
    v28 = *(_OWORD *)((char *)v48 + 8);
    v29 = v13;
    v27 = &off_1E98D90E0;
    v32 = 0;
    v30 = v14;
    v31 = &off_1E98D9188;
    __p = v5;
    v34 = (void *)__PAIR64__(v7, v6);
    v35 = 0xFFF0000000000000;
    *(float *)&v36 = v11;
    v37 = v10;
    LOBYTE(v38) = 1;
    LOBYTE(v39) = 1;
    memset((char *)&v48[1] + 8, 0, 24);
    *(_QWORD *)&v48[0] = &off_1E98D90E0;
    cf = (char *)&v48[1] + 8;
    std::vector<std::unique_ptr<CoreRecognition::decoder::BaseBeamScorer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&cf);
    v19 = *(uint64_t **)(a1 + 64);
    cf = 0;
    v44 = 0;
    v45 = 0;
    CoreRecognition::decoder::CTCBeamSearchDecoder<CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>,CoreRecognition::decoder::CharacterSegmentedPathBuilder<CoreRecognition::decoder::CombinedBeamState>>::decode((uint64_t)&v25, v19, (uint64_t)&cf, (uint64_t *)v48);
    std::vector<CoreRecognition::decoder::DecodingPath>::__vdeallocate((void ***)&v49);
    v49 = v48[0];
    v50 = *(_QWORD *)&v48[1];
    memset(v48, 0, 24);
    v24[0] = v48;
    std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100]((void ***)v24);
    if (cf)
      CFRelease(cf);
    v25 = &off_1E98D8F98;
    v27 = &off_1E98D90E0;
    *(_QWORD *)&v48[0] = &v29;
    std::vector<std::unique_ptr<CoreRecognition::decoder::BaseBeamScorer>>::__destroy_vector::operator()[abi:ne180100]((void ***)v48);
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 32);
    LOBYTE(v44) = 0;
    cf = &off_1E98D9050;
    v46 = 0;
    v47 = 0;
    v45 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v45, *(const void **)(v15 + 8), *(_QWORD *)(v15 + 16), (uint64_t)(*(_QWORD *)(v15 + 16) - *(_QWORD *)(v15 + 8)) >> 3);
    v16 = *(void **)(a1 + 32);
    if (v16)
    {
      objc_msgSend(v16, "_createBeamScorerWithBundle:beamSearchConfig:lmConfig:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v17 = *(_OWORD *)((char *)&v48[1] + 8);
      v18 = *((_QWORD *)&v48[2] + 1);
    }
    else
    {
      v18 = 0;
      v17 = 0uLL;
      memset(v48, 0, sizeof(v48));
    }
    v25 = &off_1E98D8F70;
    v26 = v5;
    v28 = *(_OWORD *)((char *)v48 + 8);
    v29 = v17;
    v27 = &off_1E98D90E0;
    memset((char *)&v48[1] + 8, 0, 24);
    v32 = v44;
    v30 = v18;
    v31 = &off_1E98D9050;
    v34 = 0;
    v35 = 0;
    __p = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v45, (uint64_t)v46, (v46 - (_BYTE *)v45) >> 3);
    v36 = v5;
    v37 = __PAIR64__(v7, v6);
    v38 = 0xFFF0000000000000;
    v39 = v11;
    v40 = v10;
    v41 = 1;
    v42 = 1;
    *(_QWORD *)&v48[0] = &off_1E98D90E0;
    v24[0] = (char *)&v48[1] + 8;
    std::vector<std::unique_ptr<CoreRecognition::decoder::BaseBeamScorer>>::__destroy_vector::operator()[abi:ne180100]((void ***)v24);
    v20 = *(uint64_t **)(a1 + 64);
    memset(v24, 0, sizeof(v24));
    CoreRecognition::decoder::CTCBeamSearchDecoder<CoreRecognition::decoder::AdditiveCombiningBeamScorer<CoreRecognition::decoder::CombinedBeamState>,CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::CombinedBeamState>>::decode((uint64_t)&v25, v20, (uint64_t)v24, (uint64_t *)v48);
    std::vector<CoreRecognition::decoder::DecodingPath>::__vdeallocate((void ***)&v49);
    v49 = v48[0];
    v50 = *(_QWORD *)&v48[1];
    memset(v48, 0, 24);
    v54 = (void **)v48;
    std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v54);
    if (v24[0])
      CFRelease(v24[0]);
    v25 = &off_1E98D8F70;
    v31 = &off_1E98D9050;
    if (__p)
    {
      v34 = __p;
      operator delete(__p);
    }
    v27 = &off_1E98D90E0;
    *(_QWORD *)&v48[0] = &v29;
    std::vector<std::unique_ptr<CoreRecognition::decoder::BaseBeamScorer>>::__destroy_vector::operator()[abi:ne180100]((void ***)v48);
    cf = &off_1E98D9050;
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }
  }
  convertToCVNLPTextDecodingResult();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  v25 = (uint64_t (**)())&v49;
  std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100]((void ***)&v25);

}

id __122__CRCTCCVNLPTextDecoder__cvnlpModernizedDecodingResultForActivationMatrix_decodingLocale_beamSearchConfig_lmConfig_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_cvnlpDecodingResultByRerankingCandidates:(id)a3 decodingLocale:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v34 = a4;
  v35 = v5;
  objc_msgSend(v5, "candidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mutableCopy");

  v32 = (void *)v7;
  if (+[CRImageReader languageIsLatin:](CRImageReader, "languageIsLatin:", v34))
  {
    objc_msgSend(v35, "candidates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v10, "count");

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v35, "candidates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "tokens");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count") == v37;

          if (!v16)
          {

            goto LABEL_37;
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v12);
    }

    if (v37)
    {
      for (j = 0; j != v37; ++j)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v35, "candidates");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        if (v19)
        {
          v20 = 0;
          v21 = 0;
          v22 = 0;
          v23 = *(_QWORD *)v39;
          while (2)
          {
            v24 = 0;
            v36 = v22;
            v33 = v19 + v22;
            do
            {
              if (*(_QWORD *)v39 != v23)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v24), "tokens");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectAtIndexedSubscript:", j);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "string");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if ((unint64_t)objc_msgSend(v27, "length") < 0x11
                || (unint64_t)objc_msgSend(v27, "length") > 0x13
                || objc_msgSend(v27, "characterAtIndex:", 0) != 49
                || objc_msgSend(v27, "characterAtIndex:", 1) != 90
                && objc_msgSend(v27, "characterAtIndex:", 1) != 50
                && objc_msgSend(v27, "characterAtIndex:", 1) != 55)
              {

                goto LABEL_31;
              }
              if (objc_msgSend(v27, "length") == 18)
              {
                v28 = objc_msgSend(v27, "characterAtIndex:", 1) == 90 && v36 + v24 != 0;
                if (v28)
                  v20 = v36 + v24;
                v21 |= v28;
              }

              ++v24;
            }
            while (v19 != v24);
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            v22 = v33;
            if (v19)
              continue;
            break;
          }

LABEL_31:
          if ((v21 & 1) != 0)
          {
            objc_msgSend(v32, "objectAtIndexedSubscript:", v20);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "insertObject:atIndex:", v31, 0);

            objc_msgSend(v32, "removeObjectAtIndex:", v20 + 1);
            break;
          }
        }
        else
        {

        }
      }
    }
  }
LABEL_37:
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09B00]), "initWithCandidates:", v32);

  return v29;
}

- (BOOL)_decodeSingleFeatureWithInfo:(id)a3 decodingLocale:(id)a4 greedyDecoder:(id)a5 greedyConfig:(id)a6 beamSearchConfig:(id)a7 imageSize:(CGSize)a8 useCharacterBoxes:(BOOL)a9 lmConfig:(id)a10 error:(id *)a11
{
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  const char *v23;
  id Property;
  id v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;
  id v30;
  const char *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  const char *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  BOOL v50;
  void *v51;
  const char *v52;
  id v53;
  const char *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  uint64_t v61;
  void *v62;
  double v63;
  long double v64;
  double v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  float v71;
  _BOOL4 v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL4 v92;
  const char *v93;
  id v94;
  const char *v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  id v100;
  void *v101;
  BOOL v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo *v117;
  id v118;
  id v119;
  CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo *v120;
  const char *v121;
  SEL v122;
  SEL v123;
  uint64_t v124;
  const char *v125;
  NSObject *v126;
  void *v127;
  id v128;
  const char *v129;
  void *v130;
  id v131;
  double v132;
  double v133;
  double *v134;
  double v135;
  BOOL v136;
  CRMutableRecognizedTextRegion *v137;
  void *v138;
  void *v139;
  const char *v140;
  void *v141;
  id v142;
  id v143;
  uint64_t v144;
  void *v145;
  double v146;
  uint64_t v147;
  void *v148;
  double v149;
  uint64_t v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  unint64_t v155;
  double *v156;
  const char *v157;
  double *v158;
  id v159;
  void *v160;
  double v161;
  const char *v162;
  id v163;
  id v164;
  uint64_t v165;
  double v166;
  double v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  float v187;
  double v188;
  uint64_t v189;
  const char *v190;
  id v191;
  id v192;
  void *v193;
  const char *v194;
  id v195;
  id v196;
  BOOL v197;
  const char *v198;
  id v199;
  id v200;
  void *v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t k;
  void *v206;
  unint64_t v207;
  void *v208;
  NSObject *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  id v213;
  void *v214;
  void *v215;
  const char *v216;
  void *v217;
  uint64_t v218;
  void *v219;
  uint64_t v220;
  unint64_t m;
  void *v222;
  id v223;
  void *v224;
  uint64_t v225;
  double v226;
  double v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  double v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  void *v242;
  double v243;
  id v244;
  void *v245;
  void *v246;
  uint64_t v247;
  void *v248;
  double v249;
  double v250;
  uint64_t v251;
  const __CFString *v252;
  void *v253;
  void *v254;
  const char *v255;
  uint64_t v257;
  void *context;
  id v259;
  id v260;
  id v261;
  id v262;
  id v263;
  id v264;
  _BOOL4 v265;
  double v266;
  void *v267;
  uint64_t v268;
  uint64_t v269;
  int v270;
  uint64_t v271;
  SEL v272;
  unint64_t v274;
  float v275;
  void *v276;
  id v277;
  char v278;
  void *v279;
  id obj;
  _BOOL4 v281;
  id selfa;
  void *v283;
  double v284;
  id v285;
  uint64_t v286;
  double v287;
  id v288;
  uint64_t v289;
  double v290;
  double v291;
  void *v292;
  void *v293;
  BOOL v294;
  int v295;
  double v296;
  void *v297;
  double v298;
  void *v299;
  int v300;
  void *v301;
  char v302;
  id newValue;
  CRMutableRecognizedTextRegion *newValuea;
  uint64_t v305;
  id v306;
  id v308;
  id v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  id v314;
  id v315;
  id v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  id v329;
  id v330;
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  _BYTE v334[128];
  _BYTE v335[24];
  id v336;
  void *v337;
  void *v338;
  uint64_t v339;

  v265 = a9;
  v339 = *MEMORY[0x1E0C80C00];
  selfa = a3;
  v277 = a4;
  v260 = a5;
  v259 = a6;
  v261 = a7;
  v262 = a10;
  if (qword_1ED0B4950 != -1)
    dispatch_once(&qword_1ED0B4950, &__block_literal_global_43);
  context = (void *)MEMORY[0x1D826E7B0]();
  if (-[CRCTCCVNLPTextDecoder shouldUseLM](self, "shouldUseLM"))
  {
    -[CRCTCCVNLPTextDecoder subscribedLocales](self, "subscribedLocales");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v15);
    -[CRCTCCVNLPTextDecoder subscribedLocales](self, "subscribedLocales");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", v277);

    if ((v17 & 1) == 0)
    {
      -[CRCTCCVNLPTextDecoder subscribedLocales](self, "subscribedLocales");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v277);

      +[CRLanguageResourcesManager sharedManager](CRLanguageResourcesManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSubscriber:forLocale:", self, v277);

      -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "filterWithLM");

      if (v21)
      {
        +[CRLanguageResourcesManager postProcessManager](CRLanguageResourcesManager, "postProcessManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addSubscriber:forLocale:", self, v277);

      }
    }
    objc_sync_exit(v15);

    if (-[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
    {
      Property = selfa;
      if (selfa)
        Property = objc_getProperty(selfa, v23, 80, 1);
      v25 = Property;
      -[CRCVNLPTransientResult modernizedActivationMatrix]((uint64_t)v335, v25);

      v268 = *(_QWORD *)v335;
      if (-[CRCTCCVNLPTextDecoder shouldReverseActivationMatrix](self, "shouldReverseActivationMatrix"))
        CoreRecognition::decoder::ActivationMatrix::reverseInTime((unint64_t *)v335);
      v330 = 0;
      -[CRCTCCVNLPTextDecoder _cvnlpModernizedDecodingResultForActivationMatrix:decodingLocale:beamSearchConfig:lmConfig:error:](self, "_cvnlpModernizedDecodingResultForActivationMatrix:decodingLocale:beamSearchConfig:lmConfig:error:", v335, v277, v261, v262, &v330);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v263 = v330;
      if (v337)
      {
        v338 = v337;
        operator delete(v337);
      }
      if (*(_QWORD *)&v335[16])
      {
        v336 = *(id *)&v335[16];
        operator delete(*(void **)&v335[16]);
      }
    }
    else
    {
      if (selfa)
      {
        v35 = objc_getProperty(selfa, v23, 80, 1);
        v37 = v35;
        if (v35)
          v35 = objc_getProperty(v35, v36, 360, 1);
      }
      else
      {
        v37 = 0;
        v35 = 0;
      }
      v38 = v35;

      v268 = objc_msgSend(v38, "timestepCount");
      v329 = 0;
      -[CRCTCCVNLPTextDecoder _cvnlpDecodingResultForActivationMatrix:decodingLocale:beamSearchConfig:lmConfig:error:](self, "_cvnlpDecodingResultForActivationMatrix:decodingLocale:beamSearchConfig:lmConfig:error:", v38, v277, v261, v262, &v329);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v263 = v329;

    }
    +[CRCTCCVNLPTextDecoder _cvnlpDecodingResultByRerankingCandidates:decodingLocale:](CRCTCCVNLPTextDecoder, "_cvnlpDecodingResultByRerankingCandidates:decodingLocale:", v26, v277);
    v264 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (-[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
  {
    v28 = selfa;
    if (selfa)
      v28 = objc_getProperty(selfa, v27, 80, 1);
    v29 = v28;
    -[CRCVNLPTransientResult modernizedActivationMatrix]((uint64_t)v335, v29);

    v268 = *(_QWORD *)v335;
    if (-[CRCTCCVNLPTextDecoder shouldReverseActivationMatrix](self, "shouldReverseActivationMatrix"))
      CoreRecognition::decoder::ActivationMatrix::reverseInTime((unint64_t *)v335);
    -[CRCTCCVNLPTextDecoder _cvnlpGreedyModernizedDecodingResultForActivationMatrix:](self, "_cvnlpGreedyModernizedDecodingResultForActivationMatrix:", v335);
    v264 = (id)objc_claimAutoreleasedReturnValue();
    if (v337)
    {
      v338 = v337;
      operator delete(v337);
    }
    if (*(_QWORD *)&v335[16])
    {
      v336 = *(id *)&v335[16];
      operator delete(*(void **)&v335[16]);
    }
    v263 = 0;
  }
  else
  {
    if (selfa)
    {
      v30 = objc_getProperty(selfa, v27, 80, 1);
      v32 = v30;
      if (v30)
        v30 = objc_getProperty(v30, v31, 360, 1);
    }
    else
    {
      v32 = 0;
      v30 = 0;
    }
    v33 = v30;
    objc_msgSend(v260, "setActivationMatrix:", v33);

    objc_msgSend(v260, "activationMatrix");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = objc_msgSend(v34, "timestepCount");

    objc_msgSend(v260, "greedyDecodingResultWithConfiguration:", v259);
    v264 = (id)objc_claimAutoreleasedReturnValue();
    v263 = 0;
  }
  v39 = v264;
  if (v264)
  {
    objc_msgSend(v264, "candidates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v281 = -[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken");
    if (!objc_msgSend(obj, "count"))
    {
LABEL_231:

      v39 = v264;
      goto LABEL_232;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    if (v265)
    {
      objc_msgSend(obj, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "tokens");
      if (v281)
      {
        v41 = (id)objc_claimAutoreleasedReturnValue();
        +[CRTextDecodingUtils wordTokensFromCharacterTokens:](CRTextDecodingUtils, "wordTokensFromCharacterTokens:", v41);
        v42 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v41 = (id)objc_claimAutoreleasedReturnValue();
        v42 = v41;
      }

      v327 = 0u;
      v328 = 0u;
      v325 = 0u;
      v326 = 0u;
      v43 = v42;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v325, v334, 16);
      if (v44)
      {
        v45 = *(_QWORD *)v326;
        do
        {
          for (i = 0; i != v44; ++i)
          {
            if (*(_QWORD *)v326 != v45)
              objc_enumerationMutation(v43);
            v47 = *(void **)(*((_QWORD *)&v325 + 1) + 8 * i);
            objc_msgSend(v47, "fullString");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v48, "hasPrefix:", CFSTR(" ")) & 1) != 0)
            {
              objc_msgSend(v47, "fullString");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (unint64_t)objc_msgSend(v49, "length") > 1;

              if (v50)
              {
                v292 = 0;
                v51 = v43;
                goto LABEL_62;
              }
            }
            else
            {

            }
          }
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v325, v334, 16);
        }
        while (v44);
      }

      if (v281)
      {
        v51 = v43;
      }
      else
      {
        +[CRTextDecodingUtils graphemeClusterTokensFromTokens:](CRTextDecodingUtils, "graphemeClusterTokensFromTokens:", v43);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

      }
      +[CRTextDecodingUtils filteredTokensFromTokens:falsePositiveFiltering:keepWhitespaceToken:](CRTextDecodingUtils, "filteredTokensFromTokens:falsePositiveFiltering:keepWhitespaceToken:", v51, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](self, "shouldUseFalsePositiveFiltering"), -[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"));
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (selfa)
      {
        v53 = objc_getProperty(selfa, v52, 80, 1);
        v55 = v53;
        if (v53)
          v53 = objc_getProperty(v53, v54, 360, 1);
      }
      else
      {
        v55 = 0;
        v53 = 0;
      }
      v56 = v53;
      +[CRTextDecodingUtils characterRangesForTokens:fromActivation:usingCharacterTokens:](CRTextDecodingUtils, "characterRangesForTokens:fromActivation:usingCharacterTokens:", v43, v56, -[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"));
      v292 = (void *)objc_claimAutoreleasedReturnValue();

      if (v281)
      {
        objc_msgSend(v292, "firstObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v281 = objc_msgSend(v57, "count") == 0;

      }
      else
      {
        v281 = 0;
      }
LABEL_62:

    }
    else
    {
      v292 = 0;
    }
    -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "filterWithLM"))
    {
      objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[CRCTCCVNLPTextDecoder _wordLMShouldFilterCandidate:inLocale:lmConfig:](self, "_wordLMShouldFilterCandidate:inLocale:lmConfig:", v59, v277, v262);

      if (!v60)
        goto LABEL_67;
      v58 = obj;
      obj = (id)MEMORY[0x1E0C9AA60];
    }

LABEL_67:
    v270 = objc_msgSend(v277, "isEqualToString:", CFSTR("uk-UA"));
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    v323 = 0u;
    v324 = 0u;
    v321 = 0u;
    v322 = 0u;
    obj = obj;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v321, v333, 16);
    if (v61)
    {
      v274 = 0;
      v278 = 0;
      v286 = *(_QWORD *)v322;
      v289 = v61;
      do
      {
        v305 = 0;
        do
        {
          if (*(_QWORD *)v322 != v286)
            objc_enumerationMutation(obj);
          v62 = *(void **)(*((_QWORD *)&v321 + 1) + 8 * v305);
          objc_msgSend(v62, "tokens");
          v301 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "score");
          v64 = v63;
          objc_msgSend(v62, "fullString");
          newValue = (id)objc_claimAutoreleasedReturnValue();
          v293 = v62;
          objc_msgSend(v62, "activationScore");
          v66 = v65;
          if (!-[CRCTCCVNLPTextDecoder shouldUseLM](self, "shouldUseLM")
            && !-[CRCTCCVNLPTextDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
          {
            v67 = objc_msgSend(newValue, "length");
            if (v67)
              v64 = pow(v64, 1.0 / (double)v67);
            v68 = objc_msgSend(newValue, "length");
            if (v68)
              v66 = pow(v66, 1.0 / (double)v68);
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v64);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "precisionThreshold");
          v72 = +[CRTextDecodingUtils validateProbability:precisionThreshold:withLM:](CRTextDecodingUtils, "validateProbability:precisionThreshold:withLM:", v69, -[CRCTCCVNLPTextDecoder shouldUseLM](self, "shouldUseLM"), v71);

          if (v72)
          {
            objc_msgSend(newValue, "stringByTrimmingCharactersInSet:", v279);
            v283 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v283, "length"))
            {
              if (-[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"))
              {
                +[CRTextDecodingUtils graphemeClusterTokensFromTokens:](CRTextDecodingUtils, "graphemeClusterTokensFromTokens:", v301);
                v73 = objc_claimAutoreleasedReturnValue();

                v301 = (void *)v73;
              }
              +[CRTextDecodingUtils filteredTokensFromTokens:falsePositiveFiltering:keepWhitespaceToken:](CRTextDecodingUtils, "filteredTokensFromTokens:falsePositiveFiltering:keepWhitespaceToken:", v301, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](self, "shouldUseFalsePositiveFiltering"), -[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              +[CRTextDecodingUtils tokenSequenceStringForTokens:usingCharacterTokens:](CRTextDecodingUtils, "tokenSequenceStringForTokens:usingCharacterTokens:", v74, -[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"));
              v297 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v74, "count"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v319 = 0u;
              v320 = 0u;
              v317 = 0u;
              v318 = 0u;
              v76 = v74;
              v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v317, v332, 16);
              if (v77)
              {
                v78 = 0;
                v79 = *(_QWORD *)v318;
                do
                {
                  for (j = 0; j != v77; ++j)
                  {
                    if (*(_QWORD *)v318 != v79)
                      objc_enumerationMutation(v76);
                    v81 = *(void **)(*((_QWORD *)&v317 + 1) + 8 * j);
                    objc_msgSend(v81, "string");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    v83 = objc_msgSend(v82, "length");

                    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v78, v83);
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "addObject:", v84);

                    objc_msgSend(v81, "fullString");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    v86 = objc_msgSend(v85, "length");

                    v78 += v86;
                  }
                  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v317, v332, 16);
                }
                while (v77);
              }

              if (-[CRCTCCVNLPTextDecoder shouldReverseActivationMatrix](self, "shouldReverseActivationMatrix"))
              {
                +[CRTextDecodingUtils reversedTokens:numTimeSteps:](CRTextDecodingUtils, "reversedTokens:numTimeSteps:", v76, v268);
                v87 = objc_claimAutoreleasedReturnValue();

                v76 = (id)v87;
              }
              if (!-[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken")
                || v281)
              {
                +[CRTextDecodingUtils tokenDelimiterRangesForTokens:usingCharacterTokens:](CRTextDecodingUtils, "tokenDelimiterRangesForTokens:usingCharacterTokens:", v76, -[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken"));
                v88 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                +[CRTextDecodingUtils wordTokensFromCharacterTokens:](CRTextDecodingUtils, "wordTokensFromCharacterTokens:", v76);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                +[CRTextDecodingUtils filteredTokensFromTokens:falsePositiveFiltering:keepWhitespaceToken:](CRTextDecodingUtils, "filteredTokensFromTokens:falsePositiveFiltering:keepWhitespaceToken:", v89, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](self, "shouldUseFalsePositiveFiltering"), 0);
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(obj, "firstObject");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v92 = v293 == v91;

                if (v92)
                {
                  if (selfa)
                  {
                    v94 = objc_getProperty(selfa, v93, 80, 1);
                    v96 = v94;
                    if (v94)
                      v94 = objc_getProperty(v94, v95, 360, 1);
                  }
                  else
                  {
                    v96 = 0;
                    v94 = 0;
                  }
                  v97 = v94;
                  +[CRTextDecodingUtils characterRangesForTokens:fromActivation:usingCharacterTokens:](CRTextDecodingUtils, "characterRangesForTokens:fromActivation:usingCharacterTokens:", v90, v97, 0);
                  v98 = objc_claimAutoreleasedReturnValue();

                  v292 = (void *)v98;
                }
                +[CRTextDecodingUtils tokenDelimiterRangesForTokens:usingCharacterTokens:](CRTextDecodingUtils, "tokenDelimiterRangesForTokens:usingCharacterTokens:", v90, 0);
                v88 = (void *)objc_claimAutoreleasedReturnValue();

              }
              if (objc_msgSend(v88, "count"))
              {
                if (-[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](self, "shouldUseFalsePositiveFiltering"))
                {
                  objc_msgSend(MEMORY[0x1E0CB3500], "_crUnknownScriptCharacterSet");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v294 = objc_msgSend(v297, "rangeOfCharacterFromSet:", v99) != 0x7FFFFFFFFFFFFFFFLL;

                }
                else
                {
                  v294 = 0;
                }
                if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v277))
                {
                  objc_msgSend(MEMORY[0x1E0CB3500], "_crJapaneseKoreanAsUnknownScriptCharacterSet");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v102 = objc_msgSend(v297, "rangeOfCharacterFromSet:", v101) == 0x7FFFFFFFFFFFFFFFLL;

                  if (!v102)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3500], "_crJapaneseKoreanAsUnknownScriptCharacterSet");
                    v103 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v297, "componentsSeparatedByCharactersInSet:", v103);
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    v105 = objc_msgSend(v104, "count");

                    v66 = v66 * fmax((double)(unint64_t)(v105 - 1) * -0.1 + 1.0, 0.1);
                  }
                }
                if (-[CRCTCCVNLPTextDecoder isLocaleRTL](self, "isLocaleRTL"))
                {
                  v335[0] = 1;
                  -[CRCTCCVNLPTextDecoder bidiTransform](self, "bidiTransform");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  v316 = 0;
                  objc_msgSend(v106, "transformVisualToLogical:visualDirectionality:logicalBaseDirectionality:baseDirectionalityPredictionMode:outTokenizedLogicalOrderIndexes:outReorderingPermutation:outMirroredVisualString:outLogicalBaseDirection:", v297, 2, v274, 1, 0, &v316, 0, v335);
                  v107 = objc_claimAutoreleasedReturnValue();
                  v108 = v316;

                  if (!v274)
                    v274 = +[CRBiDiTransform layoutDirectionForVisualString:visualDirectionality:logicalBaseDirection:](CRBiDiTransform, "layoutDirectionForVisualString:visualDirectionality:logicalBaseDirection:", v107, 2, v335[0]);
                  +[CRTextDecodingUtils getTokenPermutationByApplyingReorderingPermutation:toRanges:](CRTextDecodingUtils, "getTokenPermutationByApplyingReorderingPermutation:toRanges:", v108, v75);
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CRTextDecodingUtils invertedPermutation:](CRTextDecodingUtils, "invertedPermutation:", v109);
                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CRTextDecodingUtils reversedPermutation:numTimeSteps:](CRTextDecodingUtils, "reversedPermutation:numTimeSteps:", v110, objc_msgSend(v75, "count"));
                  v111 = (void *)objc_claimAutoreleasedReturnValue();

                  v297 = (void *)v107;
                }
                else
                {
                  v111 = 0;
                }
                if (v270)
                {
                  objc_msgSend(v297, "_crReplacedUkrainianApostrophes");
                  v112 = objc_claimAutoreleasedReturnValue();

                  v297 = (void *)v112;
                }
                if (-[CRCTCCVNLPTextDecoder _shouldUseCharacterDecodingToken](self, "_shouldUseCharacterDecodingToken")
                  && !v281)
                {
                  objc_msgSend(v297, "combinedTokenSequenceString");
                  v113 = objc_claimAutoreleasedReturnValue();

                  v297 = (void *)v113;
                }
                if (+[CRImageReader languageSupportsFullWidthPunctuation:](CRImageReader, "languageSupportsFullWidthPunctuation:", v277))
                {
                  +[CRTextDecodingUtils halfWidthToFullWidthNormalizationForTextString:](CRTextDecodingUtils, "halfWidthToFullWidthNormalizationForTextString:", v297);
                  v114 = objc_claimAutoreleasedReturnValue();

                  v297 = (void *)v114;
                }
                if (-[CRCTCCVNLPTextDecoder isLocaleRTL](self, "isLocaleRTL"))
                {
                  objc_msgSend(v297, "_crStringByRemovingInvalidArabicDiacritics");
                  v115 = (void *)objc_claimAutoreleasedReturnValue();

                  +[CRBiDiTransform rearrangeNumericRunsInLogicalString:layoutDirection:](CRBiDiTransform, "rearrangeNumericRunsInLogicalString:layoutDirection:", v115, v274);
                  v116 = objc_claimAutoreleasedReturnValue();

                  v297 = (void *)v116;
                }
                v117 = [CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo alloc];
                v100 = v297;
                v118 = v88;
                v119 = v111;
                if (v117)
                {
                  *(_QWORD *)v335 = v117;
                  *(_QWORD *)&v335[8] = CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo;
                  v120 = (CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo *)objc_msgSendSuper2((objc_super *)v335, sel_init);
                  v117 = v120;
                  if (v120)
                  {
                    v120->_prob = v64;
                    v120->_activationProb = v66;
                    objc_setProperty_atomic(v120, v121, v100, 24);
                    objc_setProperty_atomic(v117, v122, v118, 32);
                    objc_setProperty_atomic(v117, v123, v119, 40);
                  }
                }

                objc_msgSend(v276, "addObject:", v117);
                v278 |= v294;
              }
              else
              {
                v100 = v297;
              }

            }
          }

          ++v305;
        }
        while (v305 != v289);
        v124 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v321, v333, 16);
        v289 = v124;
      }
      while (v124);
    }
    else
    {
      v274 = 0;
      v278 = 0;
    }

    os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_40);
    if (-[CRCTCCVNLPTextDecoder isLocaleRTL](self, "isLocaleRTL"))
    {
      if (!v274 && objc_msgSend(v276, "count"))
      {
        CROSLogForCategory(0);
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v335 = 0;
          _os_log_impl(&dword_1D4FB8000, v126, OS_LOG_TYPE_FAULT, "Unexpectedly unknown layout direction!", v335, 2u);
        }

      }
      v127 = selfa;
      if (selfa)
      {
        *((_QWORD *)selfa + 9) = v274;
        goto LABEL_141;
      }
    }
    else
    {
      v127 = selfa;
      if (selfa)
      {
LABEL_141:
        v128 = objc_getProperty(v127, v125, 64, 1);
        if (v128)
        {
          v130 = v128;
          v131 = objc_getProperty(selfa, v129, 64, 1);
          objc_msgSend(v131, "activationProbability");
          v133 = v132;
          objc_msgSend(v276, "firstObject");
          v134 = (double *)objc_claimAutoreleasedReturnValue();
          v135 = v134 ? v134[2] : 0.0;
          v136 = v133 < v135;

          if (!v136)
          {
            v150 = objc_opt_new();

            v302 = 0;
            newValuea = 0;
            v276 = (void *)v150;
            goto LABEL_156;
          }
        }
        v302 = 0;
LABEL_146:
        if (objc_msgSend(v276, "count"))
        {
          v137 = [CRMutableRecognizedTextRegion alloc];
          objc_msgSend(selfa, "lineRegion");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          newValuea = -[CRRecognizedTextRegion initWithType:detectedLineRegion:](v137, "initWithType:detectedLineRegion:", 2, v138);

          objc_msgSend(v276, "firstObject");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = v139;
          if (v139)
            v142 = objc_getProperty(v139, v140, 24, 1);
          else
            v142 = 0;
          v143 = v142;
          -[CRRecognizedTextRegion setText:](newValuea, "setText:", v143);

          objc_msgSend(v276, "firstObject");
          v144 = objc_claimAutoreleasedReturnValue();
          v145 = (void *)v144;
          if (v144)
            v146 = *(double *)(v144 + 16);
          else
            v146 = 0.0;
          -[CRRecognizedTextRegion setActivationProbability:](newValuea, "setActivationProbability:", v146);

          objc_msgSend(v276, "firstObject");
          v147 = objc_claimAutoreleasedReturnValue();
          v148 = (void *)v147;
          if (v147)
            v149 = *(double *)(v147 + 8);
          else
            v149 = 0.0;
          -[CRRecognizedTextRegion setConfidence:](newValuea, "setConfidence:", v149);

          -[CRRecognizedTextRegion setLocale:](newValuea, "setLocale:", v277);
        }
        else
        {
          newValuea = 0;
        }
LABEL_156:
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v276, "count"));
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRCTCCVNLPTextDecoder model](self, "model");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "wordBoxesOffsets");
        if (v281)
          v154 = v153;
        else
          v154 = v152;

        v155 = 0;
        v266 = (double)(uint64_t)v154;
        while (v155 < objc_msgSend(v276, "count"))
        {
          objc_msgSend(v276, "objectAtIndexedSubscript:", v155);
          v156 = (double *)objc_claimAutoreleasedReturnValue();
          v158 = v156;
          if (v156)
            v159 = objc_getProperty(v156, v157, 24, 1);
          else
            v159 = 0;
          v306 = v159;
          -[CRRecognizedTextRegion boundingQuad](newValuea, "boundingQuad");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "baselineAngle");
          v298 = v161;

          if (v158)
            v163 = objc_getProperty(v158, v162, 32, 1);
          else
            v163 = 0;
          v164 = v163;
          v314 = 0;
          v315 = 0;
          if ((v302 & 1) != 0)
          {
            v295 = 0;
            v165 = (uint64_t)selfa;
          }
          else
          {
            v165 = (uint64_t)selfa;
            v295 = *((_DWORD *)selfa + 2);
          }
          v166 = -[CRFeatureSequenceRecognitionInfo featureImageSize](v165);
          v287 = v167;
          v290 = v166;
          v284 = -[CRFeatureSequenceRecognitionInfo bounds]((uint64_t)selfa);
          v169 = v168;
          v171 = v170;
          v173 = v172;
          v174 = -[CRFeatureSequenceRecognitionInfo rotatedROI]((uint64_t)selfa);
          v176 = v175;
          v178 = v177;
          v180 = v179;
          -[CRCTCCVNLPTextDecoder model](self, "model");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          -[CRCTCCVNLPTextDecoder model](self, "model");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v183, "wordBoxesOffsets");
          v185 = v184;
          -[CRCTCCVNLPTextDecoder model](self, "model");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "wordBoxesOffsets");
          v187 = v298;
          v275 = -v187;
          *(float *)&v257 = -v187;
          LODWORD(v188) = v295;
          +[CRTextDecodingUtils getWordBoundariesForWhiteSpaceRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:](CRTextDecodingUtils, "getWordBoundariesForWhiteSpaceRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:", v164, &v315, &v314, v181, v182, a8.width, a8.height, v188, v290, v287, *(_QWORD *)&v284, v169, v171, v173, *(_QWORD *)&v174, v176,
            v178,
            v180,
            v257,
            v185,
            v189,
            *(_QWORD *)&v266);
          v285 = v315;
          v288 = v314;

          if (v158)
            v191 = objc_getProperty(v158, v190, 40, 1);
          else
            v191 = 0;
          v192 = v191;
          -[CRRecognizedTextRegion createSubregionsForString:topWhiteSpacePoints:bottomWhiteSpacePoints:hasBoundarySpacePoints:hasCharacterAndWordBoundaries:tokenPermutation:](newValuea, "createSubregionsForString:topWhiteSpacePoints:bottomWhiteSpacePoints:hasBoundarySpacePoints:hasCharacterAndWordBoundaries:tokenPermutation:", v306, v285, v288, 1, v281, v192);
          v193 = (void *)objc_claimAutoreleasedReturnValue();

          if (v158)
            v195 = objc_getProperty(v158, v194, 40, 1);
          else
            v195 = 0;
          v196 = v195;
          v197 = v196 == 0;

          if (!v197)
          {
            if (v158)
              v199 = objc_getProperty(v158, v198, 40, 1);
            else
              v199 = 0;
            v200 = v199;
            +[CRTextDecodingUtils invertedPermutation:](CRTextDecodingUtils, "invertedPermutation:", v200);
            v299 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v193, "count"));
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            v312 = 0u;
            v313 = 0u;
            v310 = 0u;
            v311 = 0u;
            v202 = v299;
            v203 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v310, v331, 16);
            if (v203)
            {
              v204 = *(_QWORD *)v311;
              while (2)
              {
                for (k = 0; k != v203; ++k)
                {
                  if (*(_QWORD *)v311 != v204)
                    objc_enumerationMutation(v202);
                  v206 = *(void **)(*((_QWORD *)&v310 + 1) + 8 * k);
                  v207 = objc_msgSend(v206, "unsignedIntegerValue");
                  if (v207 >= objc_msgSend(v193, "count"))
                  {
                    CROSLogForCategory(3);
                    v209 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_ERROR))
                    {
                      v210 = objc_msgSend(v206, "unsignedIntegerValue");
                      v211 = objc_msgSend(v193, "count");
                      *(_DWORD *)v335 = 134218498;
                      *(_QWORD *)&v335[4] = v210;
                      *(_WORD *)&v335[12] = 2048;
                      *(_QWORD *)&v335[14] = v211;
                      *(_WORD *)&v335[22] = 2112;
                      v336 = v202;
                      _os_log_impl(&dword_1D4FB8000, v209, OS_LOG_TYPE_ERROR, "Invalid permutation index when reordering subregions. Index %ld must be less than number of subregions %ld. Permutation: %@", v335, 0x20u);
                    }

                    goto LABEL_186;
                  }
                  objc_msgSend(v193, "objectAtIndexedSubscript:", objc_msgSend(v206, "unsignedIntegerValue"));
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v201, "addObject:", v208);

                }
                v203 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v310, v331, 16);
                if (v203)
                  continue;
                break;
              }
            }
LABEL_186:

            v212 = objc_msgSend(v201, "copy");
            v193 = (void *)v212;
          }
          if (!v265 || v281)
          {
            v213 = v193;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRCTCCVNLPTextDecoder model](self, "model");
            v215 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v215, "characterBoxesOffsets");
            v272 = v216;

            -[CRCTCCVNLPTextDecoder model](self, "model");
            v217 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "characterBoxesOffsets");
            v271 = v218;

            -[CRCTCCVNLPTextDecoder model](self, "model");
            v219 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v219, "characterBoxesOffsets");
            v269 = v220;

            for (m = 0; m < objc_msgSend(v193, "count"); ++m)
            {
              if (v155 || !objc_msgSend(v292, "count") || m >= objc_msgSend(v292, "count"))
              {
                objc_msgSend(v193, "objectAtIndexedSubscript:", m);
                v222 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v222, "createCharacterSubFeaturesTopWhiteSpacePoints:bottomWhiteSpacePoints:falsePositiveFiltering:", 0, 0, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](self, "shouldUseFalsePositiveFiltering"));
                v223 = (id)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v214, "addObjectsFromArray:", v223);
              }
              else
              {
                objc_msgSend(v292, "objectAtIndexedSubscript:", m);
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                v308 = 0;
                v309 = 0;
                if ((v302 & 1) != 0)
                {
                  v300 = 0;
                  v225 = (uint64_t)selfa;
                }
                else
                {
                  v225 = (uint64_t)selfa;
                  v300 = *((_DWORD *)selfa + 2);
                }
                v296 = -[CRFeatureSequenceRecognitionInfo featureImageSize](v225);
                v291 = v226;
                v227 = -[CRFeatureSequenceRecognitionInfo bounds]((uint64_t)selfa);
                v229 = v228;
                v231 = v230;
                v233 = v232;
                v234 = -[CRFeatureSequenceRecognitionInfo rotatedROI]((uint64_t)selfa);
                v236 = v235;
                v238 = v237;
                v240 = v239;
                -[CRCTCCVNLPTextDecoder model](self, "model");
                v241 = (void *)objc_claimAutoreleasedReturnValue();
                -[CRCTCCVNLPTextDecoder configuration](self, "configuration");
                v242 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v257 = v275;
                LODWORD(v243) = v300;
                +[CRTextDecodingUtils getCharacterBoundariesForActivationRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:](CRTextDecodingUtils, "getCharacterBoundariesForActivationRanges:topPoints:bottomPoints:imageSize:scale:featureImageSize:rect:rotatedRoi:radians:model:configuration:paddingLeft:paddingRight:rangeOffset:", v224, &v309, &v308, v241, v242, a8.width, a8.height, v243, v296, v291, *(_QWORD *)&v227, v229, v231, v233, *(_QWORD *)&v234, v236,
                  v238,
                  v240,
                  v257,
                  v272,
                  v271,
                  v269);
                v223 = v309;
                v244 = v308;

                objc_msgSend(v193, "objectAtIndexedSubscript:", m);
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v245, "createCharacterSubFeaturesTopWhiteSpacePoints:bottomWhiteSpacePoints:falsePositiveFiltering:", v223, v244, -[CRCTCCVNLPTextDecoder shouldUseFalsePositiveFiltering](self, "shouldUseFalsePositiveFiltering"));
                v246 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v214, "addObjectsFromArray:", v246);
              }

            }
            v213 = v214;

          }
          if (v281)
          {
            objc_msgSend(v306, "combinedTokenSequenceString");
            v247 = objc_claimAutoreleasedReturnValue();

            v306 = (id)v247;
          }
          v248 = (void *)-[CRMutableRecognizedTextRegion mutableCopy](newValuea, "mutableCopy");
          objc_msgSend(v248, "setText:", v306);
          objc_msgSend(v248, "setSubregions:", v213);
          if (v158)
            v249 = v158[1];
          else
            v249 = 0.0;
          objc_msgSend(v248, "setConfidence:", v249);
          if (v158)
            v250 = v158[2];
          else
            v250 = 0.0;
          objc_msgSend(v248, "setActivationProbability:", v250);
          objc_msgSend(v248, "setWhitespaceInjected:", v281 | objc_msgSend(v248, "whitespaceInjected"));
          if ((v302 & 1) == 0 && *((_QWORD *)selfa + 9))
            objc_msgSend(v248, "setLayoutDirection:");
          if ((v278 & 1) != 0)
          {
            if (!v265 || (v251 = objc_msgSend(v292, "count"), v252 = CFSTR(" "), !v251))
              v252 = &stru_1E98DC948;
            objc_msgSend(v248, "removeUnknownScriptMarkersFromTranscripts:", v252);
          }
          if (!v155)
          {
            objc_msgSend(v248, "subregions");
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRRecognizedTextRegion setSubregions:](newValuea, "setSubregions:", v253);

            objc_msgSend(v248, "text");
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRRecognizedTextRegion setText:](newValuea, "setText:", v254);

            -[CRRecognizedTextRegion setWhitespaceInjected:](newValuea, "setWhitespaceInjected:", objc_msgSend(v248, "whitespaceInjected"));
            if ((v302 & 1) == 0)
            {
              if (*((_QWORD *)selfa + 9))
                -[CRRecognizedTextRegion setLayoutDirection:](newValuea, "setLayoutDirection:");
            }
          }
          objc_msgSend(v267, "addObject:", v248);

          ++v155;
        }
        -[CRRecognizedTextRegion setCandidates:](newValuea, "setCandidates:", v267);
        if ((v302 & 1) == 0)
          objc_setProperty_atomic(selfa, v255, newValuea, 64);
        os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_40);

        goto LABEL_231;
      }
    }
    v302 = 1;
    goto LABEL_146;
  }
LABEL_232:

  objc_autoreleasePoolPop(context);
  if (v264 && a11 && v263)
    *a11 = objc_retainAutorelease(v263);

  return v264 != 0;
}

void __156__CRCTCCVNLPTextDecoder__decodeSingleFeatureWithInfo_decodingLocale_greedyDecoder_greedyConfig_beamSearchConfig_imageSize_useCharacterBoxes_lmConfig_error___block_invoke()
{
  _MergedGlobals_40 = 0;
}

- (void)releaseUnusedResources
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CRCTCCVNLPTextDecoder subscribedLocales](self, "subscribedLocales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_subscribedLocales;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (self->_shouldUseLM)
        {
          +[CRLanguageResourcesManager sharedManager](CRLanguageResourcesManager, "sharedManager", (_QWORD)v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "subscriber:willDeactivateForLocale:", self, v8);

        }
        if (-[CRNeuralRecognizerConfiguration filterWithLM](self->_configuration, "filterWithLM", (_QWORD)v11))
        {
          +[CRLanguageResourcesManager postProcessManager](CRLanguageResourcesManager, "postProcessManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "subscriber:willDeactivateForLocale:", self, v8);

        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

- (CRNeuralRecognizerConfiguration)configuration
{
  return (CRNeuralRecognizerConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSMutableSet)subscribedLocales
{
  return self->_subscribedLocales;
}

- (CRTextSequenceRecognizerModel)model
{
  return (CRTextSequenceRecognizerModel *)objc_getProperty(self, a2, 80, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)shouldUseLM
{
  return self->_shouldUseLM;
}

- (void)setShouldUseLM:(BOOL)a3
{
  self->_shouldUseLM = a3;
}

- (BOOL)shouldUseFalsePositiveFiltering
{
  return self->_shouldUseFalsePositiveFiltering;
}

- (void)setShouldUseFalsePositiveFiltering:(BOOL)a3
{
  self->_shouldUseFalsePositiveFiltering = a3;
}

- (BOOL)shouldReverseActivationMatrix
{
  return self->_shouldReverseActivationMatrix;
}

- (BOOL)isLocaleRTL
{
  return self->_isLocaleRTL;
}

- (CRBiDiTransform)bidiTransform
{
  return self->_bidiTransform;
}

- (NSOrderedSet)characterObservations
{
  return self->_characterObservations;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  objc_storeStrong((id *)&self->_characterObservations, 0);
  objc_storeStrong((id *)&self->_bidiTransform, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_subscribedLocales, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  begin = self->_spaceLabels.__begin_;
  if (begin)
  {
    self->_spaceLabels.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
