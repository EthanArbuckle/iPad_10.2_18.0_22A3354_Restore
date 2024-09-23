@implementation TISmartSelector

- (TISmartSelector)initWithOptions:(unint64_t)a3 language:(id)a4 dataChangedHandler:(id)a5
{
  id v8;
  id v9;
  TISmartSelector *v10;
  TISmartSelector *v11;
  uint64_t v12;
  NSLocale *locale;
  void *v14;
  id dataChangedHandler;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *dispatchQueue;
  unint64_t options;
  uint64_t v20;
  TITransientLexiconManager *transientLexiconManager;
  NSObject *v22;
  void *v23;
  TITransientLexiconManager *v24;
  uint64_t v25;
  id contactObserver;
  id v27;
  void *v28;
  uint64_t v29;
  NLTagger *namedEntityTagger;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v35.receiver = self;
  v35.super_class = (Class)TISmartSelector;
  v10 = -[TISmartSelector init](&v35, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_options = a3;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    locale = v11->_locale;
    v11->_locale = (NSLocale *)v12;

    v14 = _Block_copy(v9);
    dataChangedHandler = v11->_dataChangedHandler;
    v11->_dataChangedHandler = v14;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.TextInput.smart_selection", v16);
    dispatchQueue = v11->_dispatchQueue;
    v11->_dispatchQueue = (OS_dispatch_queue *)v17;

    options = v11->_options;
    if ((options & 0x40) != 0)
    {
      -[TISmartSelector loadStaticPhraseDictionary](v11, "loadStaticPhraseDictionary");
      options = v11->_options;
    }
    if ((options & 0xA0) != 0)
    {
      +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
      v20 = objc_claimAutoreleasedReturnValue();
      transientLexiconManager = v11->_transientLexiconManager;
      v11->_transientLexiconManager = (TITransientLexiconManager *)v20;

      options = v11->_options;
    }
    if ((options & 0x80) != 0)
    {
      objc_initWeak(&location, v11);
      TIPersonalizationContactOSLogFacility();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISmartSelector:initWithOptions - adding observer"), "-[TISmartSelector initWithOptions:language:dataChangedHandler:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v23;
        _os_log_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      v24 = v11->_transientLexiconManager;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __63__TISmartSelector_initWithOptions_language_dataChangedHandler___block_invoke;
      v32[3] = &unk_1EA103B78;
      objc_copyWeak(&v33, &location);
      -[TITransientLexiconManager addContactObserver:](v24, "addContactObserver:", v32);
      v25 = objc_claimAutoreleasedReturnValue();
      contactObserver = v11->_contactObserver;
      v11->_contactObserver = (id)v25;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
      options = v11->_options;
    }
    if ((options & 0x100) != 0)
    {
      v27 = objc_alloc(MEMORY[0x1E0CCE168]);
      v36 = *MEMORY[0x1E0CCE0C8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithTagSchemes:", v28);
      namedEntityTagger = v11->_namedEntityTagger;
      v11->_namedEntityTagger = (NLTagger *)v29;

    }
  }

  return v11;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  _LXLexicon *contactDictionary;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  TIPersonalizationContactOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISmartSelector:dealloc - removing observer"), "-[TISmartSelector dealloc]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  -[TITransientLexiconManager removeContactObserver:](self->_transientLexiconManager, "removeContactObserver:", self->_contactObserver);
  contactDictionary = self->_contactDictionary;
  if (contactDictionary)
    CFRelease(contactDictionary);
  v6.receiver = self;
  v6.super_class = (Class)TISmartSelector;
  -[TISmartSelector dealloc](&v6, sel_dealloc);
}

- (void)setLanguage:(id)a3
{
  NSLocale *v4;
  NSLocale *locale;

  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", a3);
  v4 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  locale = self->_locale;
  self->_locale = v4;

  -[TISmartSelector loadStaticPhraseDictionary](self, "loadStaticPhraseDictionary");
}

- (NSString)language
{
  return -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
}

- (_NSRange)selectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  unint64_t options;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  id v36;
  dispatch_time_t v37;
  intptr_t v38;
  intptr_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  unint64_t v51;
  __int128 *v52;
  NSUInteger v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *dsema;
  id v61;
  id v62;
  _QWORD v63[2];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t);
  void *v71;
  TISmartSelector *v72;
  id v73;
  id v74;
  NSObject *v75;
  uint64_t *v76;
  uint64_t v77;
  unint64_t v78;
  NSUInteger v79;
  NSUInteger v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  __n128 (*v84)(__n128 *, __n128 *);
  uint64_t (*v85)();
  const char *v86;
  __int128 v87;
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[5];
  NSObject *v92;
  uint64_t *v93;
  NSUInteger v94;
  NSUInteger v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  __n128 (*v100)(__n128 *, __n128 *);
  uint64_t (*v101)();
  const char *v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _QWORD v106[7];
  NSRange v107;
  _NSRange result;
  NSRange v109;

  length = a4.length;
  location = a4.location;
  v106[5] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v62 = a5;
  v14 = a6;
  v15 = objc_msgSend(v13, "length");
  v107.location = 0;
  v107.length = v15;
  v109.location = location;
  v109.length = length;
  if (v15 >= NSUnionRange(v107, v109).length)
  {
    v16 = v13;
    v97 = 0;
    v98 = &v97;
    v99 = 0x4012000000;
    v100 = __Block_byref_object_copy__3005;
    v101 = __Block_byref_object_dispose__3006;
    v102 = "";
    v103 = xmmword_1DA910F40;
    v17 = dispatch_semaphore_create(0);
    v18 = MEMORY[0x1E0C809B0];
    v61 = v14;
    dsema = v17;
    if ((a7 & self->_options & 0x1FLL) != 0)
    {
      v19 = v17;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1CE78]), "initWithScannerType:passiveIntent:", 0, 1);
      objc_msgSend(v20, "setResultsOptions:", 1601);
      v21 = (void *)MEMORY[0x1E0D1CE70];
      v91[0] = v18;
      v91[1] = 3221225472;
      v91[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke;
      v91[3] = &unk_1EA0FBCF0;
      v94 = location;
      v95 = length;
      v96 = a7;
      v91[4] = self;
      v93 = &v97;
      v92 = v19;
      v13 = v16;
      objc_msgSend(v21, "scanString:range:configuration:completionBlock:", v16, 0, v15, v20, v91);

      v14 = v61;
    }
    else
    {
      dispatch_semaphore_signal(v17);
      v13 = v16;
    }
    options = self->_options;
    if ((a7 & options & 0x20) != 0)
    {
      v23 = MEMORY[0x1E0C809B0];
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_2;
      v90[3] = &unk_1EA100AB0;
      v90[4] = self;
      v58 = -[TISmartSelector longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:](self, "longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:", v13, location, length, v14, v90);
      v25 = v24;
      options = self->_options;
    }
    else
    {
      v25 = 0;
      v58 = 0x7FFFFFFFFFFFFFFFLL;
      v23 = MEMORY[0x1E0C809B0];
    }
    if ((a7 & options & 0x40) != 0)
    {
      -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v62, "isEqualToString:", v26);

      if ((v27 & 1) == 0)
        -[TISmartSelector setLanguage:](self, "setLanguage:", v62);
      v23 = MEMORY[0x1E0C809B0];
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_3;
      v89[3] = &unk_1EA100AB0;
      v89[4] = self;
      v14 = v61;
      v57 = -[TISmartSelector longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:](self, "longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:", v13, location, length, v61, v89);
      v59 = v28;
      options = self->_options;
    }
    else
    {
      v59 = 0;
      v57 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((a7 & options & 0x80) != 0)
    {
      v88[0] = v23;
      v88[1] = 3221225472;
      v88[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_4;
      v88[3] = &unk_1EA100AB0;
      v88[4] = self;
      v55 = -[TISmartSelector longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:](self, "longestRangeEncapsulatingSubstringInDocument:containingRange:tokenizedRanges:meetingCondition:", v13, location, length, v14, v88);
      v56 = v29;
    }
    else
    {
      v55 = 0x7FFFFFFFFFFFFFFFLL;
      v56 = 0;
    }
    v81 = 0;
    v82 = &v81;
    v83 = 0x4012000000;
    v84 = __Block_byref_object_copy__3005;
    v85 = __Block_byref_object_dispose__3006;
    v86 = "";
    v87 = xmmword_1DA910F40;
    v30 = dispatch_semaphore_create(0);
    v31 = v30;
    if ((a7 & self->_options & 0x100) != 0)
    {
      -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v62, "isEqualToString:", v32);

      if ((v33 & 1) == 0)
        -[TISmartSelector setLanguage:](self, "setLanguage:", v62);
      v34 = objc_alloc(MEMORY[0x1E0C99E60]);
      v35 = (void *)objc_msgSend(v34, "initWithObjects:", *MEMORY[0x1E0CCE080], *MEMORY[0x1E0CCE088], *MEMORY[0x1E0CCE060], 0);
      v68 = MEMORY[0x1E0C809B0];
      v69 = 3221225472;
      v70 = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_5;
      v71 = &unk_1EA0FBD40;
      v72 = self;
      v78 = v15;
      v79 = location;
      v80 = length;
      v73 = v13;
      v74 = v35;
      v76 = &v81;
      v77 = 0;
      v75 = v31;
      v36 = v35;
      TIDispatchAsync();

    }
    else
    {
      dispatch_semaphore_signal(v30);
    }
    v37 = dispatch_time(0, 3000000000);
    v38 = dispatch_semaphore_wait(dsema, v37);
    v39 = dispatch_semaphore_wait(v31, v37);
    if (v38)
      *((_OWORD *)v98 + 3) = xmmword_1DA910F40;
    if (v39)
      *((_OWORD *)v82 + 3) = xmmword_1DA910F40;
    *(_QWORD *)&v104 = location;
    *((_QWORD *)&v104 + 1) = length;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v98[6], v98[7]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v40;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v58, v25);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v106[1] = v41;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v57, v59);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v106[2] = v42;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v55, v56);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v106[3] = v43;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v82[6], v82[7]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v106[4] = v44;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v105, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v65 != v49)
            objc_enumerationMutation(v46);
          v63[0] = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "rangeValue");
          v63[1] = v51;
          if (*((_QWORD *)&v104 + 1) >= v51)
            v52 = &v104;
          else
            v52 = (__int128 *)v63;
          v104 = *v52;
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v64, v105, 16);
      }
      while (v48);
      length = *((_QWORD *)&v104 + 1);
      location = v104;
    }

    _Block_object_dispose(&v81, 8);
    _Block_object_dispose(&v97, 8);
    v14 = v61;
  }

  v53 = location;
  v54 = length;
  result.length = v54;
  result.location = v53;
  return result;
}

- (_NSRange)longestRangeEncapsulatingSubstringInDocument:(id)a3 containingRange:(_NSRange)a4 tokenizedRanges:(id)a5 meetingCondition:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  NSUInteger v11;
  unint64_t v12;
  void *v13;
  NSUInteger v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  void *v21;
  int v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  uint64_t (**v26)(id, void *);
  uint64_t v27;
  id v28;
  NSRange v29;
  _NSRange result;
  NSRange v31;

  length = a4.length;
  location = a4.location;
  v28 = a3;
  v10 = a5;
  v26 = (uint64_t (**)(id, void *))a6;
  v11 = 0;
  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "rangeValue");

      if (v12 < objc_msgSend(v10, "count"))
      {
        v15 = v12;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "rangeValue");
          v19 = v18;

          v20 = v19 - v14 + v17;
          v29.location = v14;
          v29.length = v20;
          v31.location = location;
          v31.length = length;
          if (v20 >= NSUnionRange(v29, v31).length)
          {
            objc_msgSend(v28, "substringWithRange:", v14, v19 - v14 + v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11 < v20)
            {
              v22 = v26[2](v26, v21);
              if (v22)
                v11 = v20;
              v23 = v27;
              if (v22)
                v23 = v14;
              v27 = v23;
            }

          }
          ++v15;
        }
        while (v15 < objc_msgSend(v10, "count"));
      }
      ++v12;
    }
    while (v12 < objc_msgSend(v10, "count"));
  }
  else
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v24 = v27;
  v25 = v11;
  result.length = v25;
  result.location = v24;
  return result;
}

- (void)loadStaticPhraseDictionary
{
  KB *v3;
  void *v4;
  void *v5;
  KB *v6;
  const void ***value;
  const void ***v8;
  _BYTE v9[8];
  void *v10;
  _BYTE v11[8];
  void *v12;
  _BYTE v13[8];
  void *v14;
  _BYTE v15[8];
  void *v16;
  _BYTE v17[8];
  void *v18;
  uint64_t v19;
  int v20;
  _BYTE v21[8];
  void *v22;
  _BYTE v23[8];
  void *v24;
  int v25;
  __int16 v26;
  char v27;
  void *v28;
  char v29;
  int v30;
  __int16 v31;
  char v32;
  void *v33;
  char v34;
  int v35;
  __int16 v36;
  char v37;
  void *v38;
  char v39;
  uint64_t v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v3 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v3, (uint64_t)v21);
  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardPhraseLexiconPathForInputMode(v5);
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v6, (uint64_t)v23);
  v25 = 0x100000;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0x100000;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0x100000;
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  LODWORD(v40) = 1;
  BYTE4(v40) = 0;
  v41 = 1065353216;

  KB::StaticDictionary::create((uint64_t *)&v8);
  std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100]((const void ****)&self->_staticDictionary, v8);
  value = (const void ***)self->_staticDictionary.__ptr_.__value_;
  KB::String::String((KB::String *)v9, (const KB::String *)v21);
  KB::String::String((KB::String *)v11, (const KB::String *)v23);
  KB::String::String((KB::String *)v13, (const KB::String *)&v25);
  KB::String::String((KB::String *)v15, (const KB::String *)&v30);
  KB::String::String((KB::String *)v17, (const KB::String *)&v35);
  v19 = v40;
  v20 = v41;
  KB::StaticDictionary::load(value, (uint64_t)v9);
  if (v18 && v17[6] == 1)
    free(v18);
  if (v16 && v15[6] == 1)
    free(v16);
  if (v14 && v13[6] == 1)
    free(v14);
  if (v12 && v11[6] == 1)
    free(v12);
  if (v10 && v9[6] == 1)
    free(v10);
  if (self->_dataChangedHandler)
    TIDispatchAsync();
  if (v38 && v37 == 1)
    free(v38);
  if (v33 && v32 == 1)
    free(v33);
  if (v28 && v27 == 1)
    free(v28);
  if (v24 && v23[6] == 1)
    free(v24);
  if (v22)
  {
    if (v21[6] == 1)
      free(v22);
  }
}

- (_NSRange)selectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 options:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v11;
  id v12;
  void *v13;
  CFIndex v14;
  const __CFAllocator *v15;
  const __CFLocale *v16;
  CFStringTokenizerRef v17;
  __CFStringTokenizer *v18;
  CFRange CurrentTokenRange;
  void *v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  _NSRange result;
  CFRange v27;

  length = a4.length;
  location = a4.location;
  v11 = (__CFString *)a3;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[__CFString length](v11, "length");
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v16 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v12);
  v27.location = 0;
  v27.length = v14;
  v17 = CFStringTokenizerCreate(v15, v11, v27, 0, v16);
  if (v17)
  {
    v18 = v17;
    while (CFStringTokenizerAdvanceToNextToken(v18))
    {
      CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v18);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v20);

    }
    CFRelease(v18);
    v21 = -[TISmartSelector selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:](self, "selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:", v11, location, length, v12, v13, a6);
    v23 = v22;
  }
  else
  {
    v23 = 0;
    v21 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v24 = v21;
  v25 = v23;
  result.length = v25;
  result.location = v24;
  return result;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (TITransientLexiconManager)transientLexiconManager
{
  return (TITransientLexiconManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransientLexiconManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NLTagger)namedEntityTagger
{
  return (NLTagger *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNamedEntityTagger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)dataChangedHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setDataChangedHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_namedEntityTagger, 0);
  objc_storeStrong((id *)&self->_transientLexiconManager, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong(&self->_contactObserver, 0);
  std::unique_ptr<KB::StaticDictionary>::reset[abi:nn180100]((const void ****)&self->_staticDictionary, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

uint64_t __45__TISmartSelector_loadStaticPhraseDictionary__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
}

void __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSUInteger location;
  NSUInteger length;
  char Category;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  NSRange v19;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "coreResult", (_QWORD)v13);
        v19.location = DDResultGetRangeForURLification();
        location = v19.location;
        length = v19.length;
        if (v19.length >= NSUnionRange(v19, *(NSRange *)(a1 + 56)).length)
        {
          if ((Category = DDResultGetCategory(),
                v11 = *(_QWORD *)(a1 + 72) & *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32),
                (v11 & 8) != 0)
            && (Category & 1) != 0
            || (v11 & 4) != 0 && (Category & 2) != 0
            || (v11 & 2) != 0 && (Category & 3) != 0
            || (v11 & 1) != 0 && (Category & 4) != 0
            || (v11 & 0x10) != 0 && (Category & 6) != 0)
          {
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            *(_QWORD *)(v12 + 48) = location;
            *(_QWORD *)(v12 + 56) = length;
            goto LABEL_21;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_21:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = a2;
  objc_msgSend(v2, "namedEntityPhraseLexicon");
  LODWORD(v2) = LXLexiconGetFirstTokenIDForString();

  return (_DWORD)v2 != 0;
}

BOOL __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_3(uint64_t a1, KB *this)
{
  KB::StaticDictionary *v2;
  _BOOL8 v3;
  BOOL v4;
  _BYTE v6[8];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(KB::StaticDictionary **)(*(_QWORD *)(a1 + 32) + 8);
  KB::utf8_string(this, (uint64_t)v6);
  v3 = KB::StaticDictionary::contains(v2, (const KB::String *)v6, 0, 0.0);
  if (v7)
    v4 = v6[6] == 1;
  else
    v4 = 0;
  if (v4)
    free(v7);
  return v3;
}

BOOL __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_4()
{
  return LXLexiconGetFirstTokenIDForString() != 0;
}

void __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  __int128 v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setString:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  objc_msgSend(*(id *)(v2 + 40), "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLanguage:range:", v4, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 80);
  v8 = *MEMORY[0x1E0CCE0C8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_6;
  v11[3] = &unk_1EA0FBD18;
  v14 = *(_OWORD *)(a1 + 88);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v12 = v9;
  v13 = v10;
  objc_msgSend(v5, "enumerateTagsInRange:unit:scheme:options:usingBlock:", v6, v7, 0, v8, 30, v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __92__TISmartSelector_selectionRangeForTextInDocument_inRange_language_tokenizedRanges_options___block_invoke_6(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, _BYTE *a5)
{
  uint64_t v9;
  id v10;
  NSRange v11;

  v10 = a2;
  v11.location = a3;
  v11.length = a4;
  if (a4 == NSUnionRange(v11, *(NSRange *)(a1 + 48)).length
    && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v9 + 48) = a3;
    *(_QWORD *)(v9 + 56) = a4;
    *a5 = 1;
  }

}

void __63__TISmartSelector_initWithOptions_language_dataChangedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7[2];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TIPersonalizationContactOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TISmartSelector:initWithOptions - processing %lu contacts"), "-[TISmartSelector initWithOptions:language:dataChangedHandler:]_block_invoke", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v6 = (void *)nameVariationsForContactCollection(v3);
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v6;
  TIDispatchAsync();
  objc_destroyWeak(v7);

}

void __63__TISmartSelector_initWithOptions_language_dataChangedHandler___block_invoke_28(uint64_t a1)
{
  const void **WeakRetained;
  const void **v3;
  void (**v4)(_QWORD);
  const void **v5;
  void (**v6)(_QWORD);
  const void *v7;
  const void *v8;
  const void **v9;

  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void (**)(_QWORD))_Block_copy(WeakRetained[9]);
    v5 = v9;
    v6 = v4;
    v7 = v9[2];
    if (v7)
    {
      CFRelease(v7);
      v5 = v9;
    }
    v5[2] = *(const void **)(a1 + 40);
    if (v6)
      v6[2](v6);

    goto LABEL_9;
  }
  v8 = *(const void **)(a1 + 40);
  if (v8)
  {
    CFRelease(v8);
LABEL_9:
    v3 = v9;
  }

}

@end
