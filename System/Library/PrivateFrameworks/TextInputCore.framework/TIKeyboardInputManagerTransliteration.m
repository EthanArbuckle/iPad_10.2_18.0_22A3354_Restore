@implementation TIKeyboardInputManagerTransliteration

- (TIKeyboardInputManagerTransliteration)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6;
  TIKeyboardInputManagerTransliteration *v7;
  uint64_t v8;
  NSMapTable *transliteratorCandidateByMecabraCandidatePointerValue;
  NSMutableArray *v10;
  NSMutableArray *committedCandidates;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TIKeyboardInputManager *v16;
  TIKeyboardInputManager *nativeModelManager;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIKeyboardInputManagerTransliteration;
  v7 = -[TIKeyboardInputManager initWithConfig:keyboardState:](&v19, sel_initWithConfig_keyboardState_, v6, a4);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    transliteratorCandidateByMecabraCandidatePointerValue = v7->_transliteratorCandidateByMecabraCandidatePointerValue;
    v7->_transliteratorCandidateByMecabraCandidatePointerValue = (NSMapTable *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    committedCandidates = v7->_committedCandidates;
    v7->_committedCandidates = v10;

    objc_msgSend(v6, "inputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "normalizedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguage();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TIKeyboardInputManager initWithInputMode:keyboardState:]([TIKeyboardInputManager alloc], "initWithInputMode:keyboardState:", v15, 0);
    nativeModelManager = v7->_nativeModelManager;
    v7->_nativeModelManager = v16;

  }
  return v7;
}

- (void)initImplementation
{
  _QWORD *v3;
  void *v4;
  void *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  objc_super v34;
  unsigned int *v35;
  unsigned int *v36;
  unsigned int *v37;
  unsigned int *v38;

  v34.receiver = self;
  v34.super_class = (Class)TIKeyboardInputManagerTransliteration;
  v3 = -[TIKeyboardInputManagerTransliterationBase initImplementation](&v34, sel_initImplementation);
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (std::__shared_weak_count *)operator new(0x28uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA1027D0;
  v8 = &v6[1].__vftable;
  v6[1].__shared_owners_ = (uint64_t)v5;
  if (v5)
  {
    CFRetain(v5);
    v6[1].__shared_owners_ = (uint64_t)v5;
  }
  *v8 = &off_1EA102808;

  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  v3[68] = v8;
  v11 = (std::__shared_weak_count *)v3[69];
  v3[69] = v6;
  if (v11)
  {
    v12 = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v3[23];
  if (v14)
  {
    (*(void (**)(unsigned int **__return_ptr))(*(_QWORD *)v14 + 168))(&v38);
    if (v38)
    {
      v15 = v38 + 2;
      v16 = atomic_load(v38 + 2);
      if (v16 == 1)
      {
        (*(void (**)(void))(*(_QWORD *)v38 + 40))();
      }
      else
      {
        do
          v17 = __ldaxr(v15);
        while (__stlxr(v17 - 1, v15));
      }
      v18 = v3[68];
      v19 = (unsigned int *)*TIInputManager::favonius_layout((TIInputManager *)v3);
      v37 = v19;
      if (v19)
      {
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 + 1, v19));
      }
      (*(void (**)(unsigned int **__return_ptr, uint64_t, unsigned int **))(*(_QWORD *)v18 + 16))(&v38, v18, &v37);
      if (v37)
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v37);
      (*(void (**)(unsigned int **__return_ptr))(*(_QWORD *)v3[23] + 168))(&v36);
      v21 = v38;
      v38 = 0;
      v35 = v21;
      (*(void (**)(unsigned int *, unsigned int **))(*(_QWORD *)v36 + 24))(v36, &v35);
      if (v35)
      {
        v22 = v35 + 2;
        v23 = atomic_load(v35 + 2);
        if (v23 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v35 + 8))();
        }
        else
        {
          do
            v24 = __ldaxr(v22);
          while (__stlxr(v24 - 1, v22));
        }
      }
      if (v36)
      {
        v25 = v36 + 2;
        v26 = atomic_load(v36 + 2);
        if (v26 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v36 + 40))();
        }
        else
        {
          do
            v27 = __ldaxr(v25);
          while (__stlxr(v27 - 1, v25));
        }
      }
      if (v38)
      {
        v28 = v38 + 2;
        v29 = atomic_load(v38 + 2);
        if (v29 == 1)
        {
          (*(void (**)(void))(*(_QWORD *)v38 + 8))();
        }
        else
        {
          do
            v30 = __ldaxr(v28);
          while (__stlxr(v30 - 1, v28));
        }
      }
    }
  }
  do
    v31 = __ldaxr(p_shared_owners);
  while (__stlxr(v31 - 1, p_shared_owners));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  do
    v32 = __ldaxr(p_shared_owners);
  while (__stlxr(v32 - 1, p_shared_owners));
  if (!v32)
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
  return v3;
}

- (BOOL)isTransliterationManager
{
  return 1;
}

- (Class)keyEventMapClass
{
  return (Class)objc_opt_class();
}

- (id)keyEventMap
{
  void *v3;
  int v4;
  id v5;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hardwareKeyboardMode");

  if (v4)
    v5 = objc_alloc_init(-[TIKeyboardInputManagerTransliteration keyEventMapClass](self, "keyEventMapClass"));
  else
    v5 = 0;
  return v5;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManagerTransliteration;
  v8 = a3;
  -[TIKeyboardInputManager syncToKeyboardState:from:afterContextChange:](&v11, sel_syncToKeyboardState_from_afterContextChange_, v8, a4, v5);
  objc_msgSend(v8, "textInputTraits", v11.receiver, v11.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "keyboardType");
  -[TIKeyboardInputManagerTransliteration setPrioritizeLatinCandidates:](self, "setPrioritizeLatinCandidates:", (v10 & 0xFFFFFFFFFFFFFFFBLL) == 3);
  -[TIKeyboardInputManagerTransliteration loadFavoniusTypingModel](self, "loadFavoniusTypingModel");
}

- (void)suspend
{
  void *v3;
  void *v4;
  objc_super v5;

  -[TIKeyboardInputManagerTransliteration transliteratorCandidateByMecabraCandidatePointerValue](self, "transliteratorCandidateByMecabraCandidatePointerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerTransliteration;
  -[TIKeyboardInputManager suspend](&v5, sel_suspend);
}

- (BOOL)hasInputToTransliterate
{
  void *v3;
  BOOL v4;

  -[TIKeyboardInputManager inputString](self, "inputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = 1;
  else
    v4 = *((_DWORD *)self->super.super.m_impl + 98) >= 0;

  return v4;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  objc_msgSend((id)objc_opt_class(), "transliteratorInputCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "longCharacterIsMember:", v3);

  return v3;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  if (-[TIKeyboardInputManager isWordLearningEnabled](self, "isWordLearningEnabled"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    -[TIKeyboardInputManagerTransliteration transliteratorCandidateByMecabraCandidatePointerValue](self, "transliteratorCandidateByMecabraCandidatePointerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mecabraCandidatePointerValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

    }
    else
    {
LABEL_5:
      -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");
    }

    -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13 >= 0xB)
    {
      -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectsInRange:", 0, objc_msgSend(v15, "count") - 10);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManagerTransliteration;
  -[TIKeyboardInputManager handleAcceptedCandidate:keyboardState:](&v18, sel_handleAcceptedCandidate_keyboardState_, v6, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[TIKeyboardInputManagerTransliteration transliteratorCandidateByMecabraCandidatePointerValue](self, "transliteratorCandidateByMecabraCandidatePointerValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[TIKeyboardInputManagerTransliteration committedCandidates](self, "committedCandidates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerTransliteration;
  -[TIKeyboardInputManager deleteFromInputWithContext:](&v7, sel_deleteFromInputWithContext_, v4);

}

- (id)candidateContextFromDocumentStateOnly
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextBeforeInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") > 0x20)
  {
    objc_msgSend(v6, "subarrayWithRange:", objc_msgSend(v6, "count") - 33, 32);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)dictionaryInputMode
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputMode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autocorrectionLocaleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", &stru_1EA1081D0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)lexiconLocales
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManagerTransliteration dictionaryInputMode](self, "dictionaryInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "normalizedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("hi-Translit"));

  if (v7)
  {
    +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", CFSTR("en_IN"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13[0] = v4;
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)loadDictionaries
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  TIInputManager *m_impl;
  void *v8;
  KB *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  void *v18;
  void *v19;
  _OWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31[3];
  uint64_t v32;
  char *v33;
  char *v34;
  objc_super v35;
  _OWORD buf[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[5];
  int v47;
  _BYTE v48[8];
  void *v49;
  __int16 v50[3];
  char v51;
  void *v52;
  _BYTE v53[8];
  void *v54;
  _BYTE v55[8];
  void *v56;
  _BYTE v57[8];
  void *v58;
  uint64_t v59;
  int v60;
  _BYTE v61[8];
  void *v62;
  __int16 v63[3];
  char v64;
  void *v65;
  _BYTE v66[8];
  void *v67;
  _BYTE v68[8];
  void *v69;
  _BYTE v70[8];
  void *v71;
  uint64_t v72;
  int v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (self->super.super.m_impl)
  {
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "normalizedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("hi-Translit"));

    if ((v5 & 1) != 0)
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel)
      {
        TIOSLogFacility();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading/reloading dictionaries."), "-[TIKeyboardInputManagerTransliteration loadDictionaries]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf[0]) = 138412290;
          *(_QWORD *)((char *)buf + 4) = v27;
          _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);

        }
      }
      m_impl = (TIInputManager *)self->super.super.m_impl;
      -[TIKeyboardInputManagerTransliteration dictionaryInputMode](self, "dictionaryInputMode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "languageWithRegion");
      v9 = (KB *)objc_claimAutoreleasedReturnValue();
      KB::utf8_string(v9, (uint64_t)buf);
      TIInputManager::set_locale_identifier(m_impl, (const KB::String *)buf);
      if (*((_QWORD *)&buf[0] + 1) && BYTE6(buf[0]) == 1)
        free(*((void **)&buf[0] + 1));

      -[TIKeyboardInputManagerTransliteration dictionaryInputMode](self, "dictionaryInputMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager lexiconInfoForInputMode:](self, "lexiconInfoForInputMode:", v10);

      -[TIKeyboardInputManager config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isTesting");

      +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", CFSTR("en_IN"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager lexiconInfoForInputMode:](self, "lexiconInfoForInputMode:", v13);

      v73 = 1061997773;
      v60 = 1045220557;
      KB::String::String((KB::String *)buf, (const KB::String *)v61);
      KB::String::String((KB::String *)&v37, (const KB::String *)v63);
      KB::String::String((KB::String *)&v38, (const KB::String *)v66);
      KB::String::String((KB::String *)&v39, (const KB::String *)v68);
      KB::String::String((KB::String *)v40, (const KB::String *)v70);
      v40[4] = v72;
      v41 = v73;
      KB::String::String((KB::String *)&v42, (const KB::String *)v48);
      KB::String::String((KB::String *)&v43, (const KB::String *)v50);
      KB::String::String((KB::String *)&v44, (const KB::String *)v53);
      KB::String::String((KB::String *)&v45, (const KB::String *)v55);
      KB::String::String((KB::String *)v46, (const KB::String *)v57);
      v46[4] = v59;
      v47 = v60;
      v14 = (char *)operator new(0x160uLL);
      v15 = 0;
      v32 = (uint64_t)v14;
      v34 = v14 + 352;
      do
      {
        std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)&v14[v15 * 16], (uint64_t)&buf[v15]);
        v15 += 11;
      }
      while (v15 != 22);
      v33 = v14 + 352;
      v16 = 22;
      do
      {
        v17 = &buf[v16];
        v18 = *(void **)((char *)&v32 + v16 * 16);
        if (v18 && *((_BYTE *)v17 - 42) == 1)
          free(v18);
        v19 = (void *)*((_QWORD *)v17 - 9);
        if (v19 && *((_BYTE *)&buf[v16 - 4] - 10) == 1)
          free(v19);
        v20 = &buf[v16];
        v21 = (void *)*((_QWORD *)&buf[v16 - 6] - 1);
        if (v21 && *((_BYTE *)v20 - 106) == 1)
          free(v21);
        v22 = (void *)*((_QWORD *)v20 - 17);
        if (v22 && *((_BYTE *)&buf[v16 - 8] - 10) == 1)
          free(v22);
        v23 = (void *)*((_QWORD *)&buf[v16 - 10] - 1);
        if (v23 && *((_BYTE *)&buf[v16 - 10] - 10) == 1)
          free(v23);
        v16 -= 11;
      }
      while (v16 * 16);
      if (v63[0] && v50[0])
      {
        v24 = self->super.super.m_impl;
        memset(v31, 0, sizeof(v31));
        std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(v31, v32, (uint64_t)v33, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v33[-v32] >> 4));
        TIInputManager::load_dictionaries((uint64_t)v24, v31, 1, v12, 0);
        *(_QWORD *)&buf[0] = v31;
        std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
      }
      v25 = *((_QWORD *)self->super.super.m_impl + 28);
      if (!v25 || **(_QWORD **)(v25 + 8) == *(_QWORD *)(*(_QWORD *)(v25 + 8) + 8))
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        TIOSLogFacility();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v28 = (void *)MEMORY[0x1E0CB3940];
          -[TIKeyboardInputManagerTransliteration dictionaryInputMode](self, "dictionaryInputMode");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("%s WARNING: Input manager failed to load static dictionary for: %@"), "-[TIKeyboardInputManagerTransliteration loadDictionaries]", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf[0]) = 138412290;
          *(_QWORD *)((char *)buf + 4) = v30;
          _os_log_debug_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);

        }
      }
      else
      {
        -[TIKeyboardInputManagerTransliteration loadFavoniusTypingModel](self, "loadFavoniusTypingModel");
      }
      *(_QWORD *)&buf[0] = &v32;
      std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
      if (v58 && v57[6] == 1)
        free(v58);
      if (v56 && v55[6] == 1)
        free(v56);
      if (v54 && v53[6] == 1)
        free(v54);
      if (v52 && v51 == 1)
        free(v52);
      if (v49 && v48[6] == 1)
        free(v49);
      if (v71 && v70[6] == 1)
        free(v71);
      if (v69 && v68[6] == 1)
        free(v69);
      if (v67 && v66[6] == 1)
        free(v67);
      if (v65 && v64 == 1)
        free(v65);
      if (v62)
      {
        if (v61[6] == 1)
          free(v62);
      }
    }
    else
    {
      v35.receiver = self;
      v35.super_class = (Class)TIKeyboardInputManagerTransliteration;
      -[TIKeyboardInputManager loadDictionaries](&v35, sel_loadDictionaries);
    }
  }
}

- (shared_ptr<KB::LanguageModel>)loadNewLanguageModel
{
  _QWORD *v2;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  LanguageModel *v26;
  __shared_weak_count *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  _QWORD *v32;
  _QWORD v33[2];
  shared_ptr<KB::LanguageModel> result;

  v32 = v2;
  v33[1] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "usesWordNgramModel");

  -[TIKeyboardInputManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "usesAdaptation"))
  {
    -[TIKeyboardInputManager dynamicResourcePath](self, "dynamicResourcePath");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  -[TIKeyboardInputManager config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v6;
  if (objc_msgSend(v7, "usesCustomNgramModel"))
  {
    -[TIKeyboardInputManager config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ngramModelPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  -[TIKeyboardInputManager languageModelAssets](self, "languageModelAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerTransliteration dictionaryInputMode](self, "dictionaryInputMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodedLMTrialParametersForLocale:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "preferredModelLocaleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "preferredModelLocaleIsMultilingual");
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isSiriMode");
  LOBYTE(v29) = objc_msgSend(v12, "doesSupportInlineCompletion");
  BYTE2(v28) = v19;
  LOWORD(v28) = 0;
  +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v16, v17, v10, v31, v11, v30, v28, v15, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "clientIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "recipientIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerTransliteration lexiconLocales](self, "lexiconLocales");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v20, "loadStubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:", v25, 0, 0);
  }
  else
  {
    *v32 = 0;
    v32[1] = 0;
  }

  result.__cntrl_ = v27;
  result.__ptr_ = v26;
  return result;
}

- (void)loadFavoniusTypingModel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrectionLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerTransliteration;
    -[TIKeyboardInputManager loadFavoniusTypingModel](&v7, sel_loadFavoniusTypingModel);
  }
}

- (CandidateCollection)autocorrectionCandidateStrings
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CandidateCollection *result;
  void *v10;
  BOOL v11;
  const KB::Candidate **v12;
  const KB::Candidate *v13[3];
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[40];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "autocorrectionEnabled") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autocorrectionType");

  if (v8 == 1)
  {
LABEL_7:
    retstr->var5 = 0;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var2.var0 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var2.var0 = 0u;
    *(_OWORD *)&retstr->var2.var2.var0 = 0u;
    *(_OWORD *)&retstr->var3.var1 = 0u;
    return result;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hardwareKeyboardMode"))
  {
    v11 = -[TIKeyboardInputManager isHardwareKeyboardAutocorrectionEnabled](self, "isHardwareKeyboardAutocorrectionEnabled");

    if (v11)
      goto LABEL_10;
    goto LABEL_7;
  }

LABEL_10:
  (*(void (**)(const KB::Candidate **__return_ptr, void *, _QWORD))(*(_QWORD *)self->super.super.m_impl + 16))(v13, self->super.super.m_impl, -[TIKeyboardInputManager shiftContext](self, "shiftContext"));
  KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)retstr, v13);
  if (v17)
  {
    if (v16[38] == 1)
      free(v17);
  }
  v12 = (const KB::Candidate **)v16;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  v12 = (const KB::Candidate **)&v15;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  v12 = (const KB::Candidate **)&v14;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  v12 = v13;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  return result;
}

- (TLTransliterator)exactStringTransliterator
{
  TLTransliterator *exactStringTransliterator;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TLTransliterator *v10;
  TLTransliterator *v11;

  exactStringTransliterator = self->_exactStringTransliterator;
  if (!exactStringTransliterator)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageWithRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0928]), "initWithLocale:", v8);
    objc_msgSend(v9, "setUseLanguageModel:", 0);
    v10 = (TLTransliterator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0920]), "initWithParameters:", v9);
    v11 = self->_exactStringTransliterator;
    self->_exactStringTransliterator = v10;

    exactStringTransliterator = self->_exactStringTransliterator;
  }
  return exactStringTransliterator;
}

- (TLTransliterator)autocorrectionTransliterator
{
  TLTransliterator *autocorrectionTransliterator;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TLTransliterator *v10;
  TLTransliterator *v11;

  autocorrectionTransliterator = self->_autocorrectionTransliterator;
  if (!autocorrectionTransliterator)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageWithRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0928]), "initWithLocale:", v8);
    objc_msgSend(v9, "setUseLanguageModel:", 0);
    objc_msgSend(v9, "setUseSeq2SeqModel:", 0);
    v10 = (TLTransliterator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0920]), "initWithParameters:", v9);
    v11 = self->_autocorrectionTransliterator;
    self->_autocorrectionTransliterator = v10;

    autocorrectionTransliterator = self->_autocorrectionTransliterator;
  }
  return autocorrectionTransliterator;
}

- (TLTransliterator)transliterator
{
  TLTransliterator *transliterator;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TLTransliterator *v10;
  TLTransliterator *v11;

  transliterator = self->_transliterator;
  if (!transliterator)
  {
    v4 = (void *)MEMORY[0x1E0C99DC8];
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageWithRegion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0928]), "initWithLocale:", v8);
    v10 = (TLTransliterator *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0920]), "initWithParameters:", v9);
    v11 = self->_transliterator;
    self->_transliterator = v10;

    transliterator = self->_transliterator;
  }
  return transliterator;
}

- (id)mecabraCandidatePointerValueWithCandidate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "mecabraCandidatePointerValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)candidatesWithTypedString:(id)a3 autocorrectedString:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    v7 = (objc_class *)MEMORY[0x1E0DBDDD0];
    v8 = a3;
    v9 = (void *)objc_msgSend([v7 alloc], "initWithCandidate:", v6);
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerTransliteration candidatesWithTypedString:autocorrectedCandidates:](self, "candidatesWithTypedString:autocorrectedCandidates:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = a3;
    -[TIKeyboardInputManagerTransliteration candidatesWithTypedString:autocorrectedCandidates:](self, "candidatesWithTypedString:autocorrectedCandidates:", v12, MEMORY[0x1E0C9AA60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)candidatesWithTypedString:(id)a3 autocorrectedCandidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[TIKeyboardInputManagerTransliteration candidatesForInputString:](self, "candidatesForInputString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "candidate", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerTransliteration candidatesForInputString:](self, "candidatesForInputString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v16);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  -[TIKeyboardInputManagerTransliteration sortedCandidatesFromTypedStringCandidates:autocorrectedStringCandidates:](self, "sortedCandidatesFromTypedStringCandidates:autocorrectedStringCandidates:", v8, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)sortedCandidatesFromTypedStringCandidates:(id)a3 autocorrectedStringCandidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v7;
  v44 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v7, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    objc_msgSend(v8, "addObjectsFromArray:", v6);
    goto LABEL_25;
  }
  objc_msgSend(v6, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "lmScore");
      v14 = v13;
      objc_msgSend(v10, "lmScore");
      v42 = v10;
      if (v14 >= v15)
      {
        objc_msgSend(v8, "addObjectsFromArray:", v6, v12);
        objc_msgSend(v7, "objectAtIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v17);

        v7 = v6;
      }
      else
      {
        objc_msgSend(v7, "objectAtIndex:", 0, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        objc_msgSend(v8, "addObjectsFromArray:", v6);
      }
      v18 = v7;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v50;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v50 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            -[TIKeyboardInputManagerTransliteration mecabraCandidatePointerValueWithCandidate:](self, "mecabraCandidatePointerValueWithCandidate:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              -[TIKeyboardInputManagerTransliteration transliteratorCandidateByMecabraCandidatePointerValue](self, "transliteratorCandidateByMecabraCandidatePointerValue");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v26, "type") != 3)
                objc_msgSend(v8, "addObject:", v23);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        }
        while (v20);
      }

      v10 = v42;
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend(v8, "addObjectsFromArray:", v7);
LABEL_24:

LABEL_25:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v46 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        objc_msgSend(v35, "candidate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v29, "containsObject:", v36);

        if ((v37 & 1) == 0)
        {
          objc_msgSend(v35, "candidate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v38);

          if (objc_msgSend(v35, "isExtensionCandidate"))
            v39 = v28;
          else
            v39 = v27;
          objc_msgSend(v39, "addObject:", v35);
        }
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v32);
  }

  objc_msgSend(v27, "addObjectsFromArray:", v28);
  return v27;
}

- (id)candidatesForInputString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardInputManagerTransliteration transliterator](self, "transliterator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerTransliteration candidatesForInputString:transliterator:](self, "candidatesForInputString:transliterator:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)generateTypingAutocorrectionsWithCandidateRange:(_NSRange)a3
{
  TIKeyboardInputManagerTransliteration *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  unint64_t i;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  id v45;
  void *v46;
  void *v48;
  TIKeyboardInputManagerTransliteration *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  uint64_t v59;

  v3 = self;
  v59 = *MEMORY[0x1E0C80C00];
  v57.receiver = self;
  v57.super_class = (Class)TIKeyboardInputManagerTransliteration;
  -[TIKeyboardInputManager generateTypingAutocorrectionsWithCandidateRange:](&v57, sel_generateTypingAutocorrectionsWithCandidateRange_, a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *((_DWORD *)v3->super.super.m_impl + 98);
  if ((v6 & 0x80000000) == 0)
  {
    objc_msgSend(v4, "corrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autocorrection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
LABEL_5:

    goto LABEL_6;
  }
  -[TIKeyboardInputManager inputString](v3, "inputString");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "autocorrectionEnabled");

  if (v12)
  {
    objc_msgSend(v5, "corrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autocorrection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "candidate");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:
  v51 = (void *)v10;
  v52 = (void *)v9;
  if (v9 == v10)
    v13 = 0;
  else
    v13 = v10;
  -[TIKeyboardInputManagerTransliteration candidatesWithTypedString:autocorrectedString:](v3, "candidatesWithTypedString:autocorrectedString:", v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(v5, "candidates");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
    {
      v37 = v5;
      goto LABEL_46;
    }
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = v16;
  v50 = v5;
  if ((v6 & 0x80000000) == 0)
  {
    v48 = v16;
    v49 = v3;
    objc_msgSend(v5, "corrections");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "autocorrection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
    {
      for (i = 0; i < objc_msgSend(v15, "count"); ++i)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = v21;
          objc_msgSend(v22, "setContinuousPathConversion:", 1);
          objc_msgSend(v22, "setShouldInsertSpaceAfterSelection:", objc_msgSend(v19, "shouldInsertSpaceAfterSelection"));
          if (!i)
            goto LABEL_15;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_20;
          objc_msgSend(v21, "setContinuousPathConversion:", 1);
          if (!i)
LABEL_15:
            objc_msgSend(v21, "setShouldAccept:", objc_msgSend(v19, "shouldAccept"));
        }

LABEL_20:
        if (i)
        {
          objc_msgSend(v21, "candidate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "candidate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "candidateByReplacingWithCandidate:input:", v23, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setObject:atIndexedSubscript:", v26, i);
        }

      }
    }
    v17 = v48;
    if (objc_msgSend(v15, "count"))
    {
      if (v19)
      {
        objc_msgSend(v19, "candidate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "candidate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "candidateByReplacingWithCandidate:input:", v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v48, "insertObject:atIndex:", v30, 0);

        }
      }
    }

    v3 = v49;
  }
  if (!(*(unsigned int (**)(_QWORD))(**((_QWORD **)v3->super.super.m_impl + 23) + 232))(*((_QWORD *)v3->super.super.m_impl + 23)))
  {
    v33 = 0;
    v34 = v17;
    v17 = v15;
    goto LABEL_34;
  }
  v31 = objc_alloc(MEMORY[0x1E0DBDB70]);
  objc_msgSend(v15, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithAutocorrection:alternateCorrections:", v32, 0);

  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
  {
    objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v34);
LABEL_34:

  }
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v40 = v17;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v42; ++j)
      {
        if (*(_QWORD *)v54 != v43)
          objc_enumerationMutation(v40);
        v45 = *(id *)(*((_QWORD *)&v53 + 1) + 8 * j);
        if (objc_msgSend(v45, "isEmojiCandidate"))
          v46 = v39;
        else
          v46 = v38;
        objc_msgSend(v46, "addObject:", v45);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v42);
  }

  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", v33, v38, v39);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v50;
LABEL_46:

  return v37;
}

- (id)autocorrectionListForEmptyInputWithDesiredCandidateCount:(unint64_t)a3
{
  TIKeyboardInputManager *nativeModelManager;
  void *v6;

  nativeModelManager = self->_nativeModelManager;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager syncToKeyboardState:](nativeModelManager, "syncToKeyboardState:", v6);

  return -[TIKeyboardInputManager autocorrectionListForEmptyInputWithDesiredCandidateCount:](self->_nativeModelManager, "autocorrectionListForEmptyInputWithDesiredCandidateCount:", a3);
}

- (id)candidatesForInputString:(id)a3 transliterator:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v48;
  id obj;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v43 = v5;
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    i = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:", i, 8);
    v11 = v10;

    v40 = v7;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v46 = 0;
      v12 = v7;
    }
    else
    {
      objc_msgSend(v7, "substringWithRange:", v9, v11);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "substringFromIndex:", v9 + v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[TIKeyboardInputManagerTransliteration candidateContextFromDocumentStateOnly](self, "candidateContextFromDocumentStateOnly");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v6;
    objc_msgSend(v6, "generateCandidatesForInputWord:candidateContextStrings:maxCandidatesCount:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = v14;
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v48)
    {
      v44 = v13;
      v45 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          v15 = v12;
          if (*(_QWORD *)v53 != v45)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v16, "transliteratedWord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "firstObject");
          v18 = objc_claimAutoreleasedReturnValue();
          if (v16 == (void *)v18)
          {

            LODWORD(v20) = 0;
          }
          else
          {
            v19 = (void *)v18;
            LODWORD(v20) = objc_msgSend(v16, "isExtensionCandidate");

          }
          if (objc_msgSend(v16, "type") == 3)
            v20 = v20 | 2;
          else
            v20 = v20;
          if (objc_msgSend(v46, "length"))
          {
            objc_msgSend(v46, "stringByAppendingString:", v17);
            v21 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v21;
          }
          v22 = objc_alloc(MEMORY[0x1E0DBDC88]);
          -[TIKeyboardInputManager inputString](self, "inputString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v22;
          v12 = v15;
          v26 = (void *)objc_msgSend(v25, "initWithCandidate:forInput:latinCandidate:mecabraCandidatePointerValue:withFlags:", v17, v23, v15, v24, v20);

          objc_msgSend(v16, "lmScore");
          *(float *)&v27 = v27;
          objc_msgSend(v26, "setLmScore:", v27);
          -[TIKeyboardInputManagerTransliteration transliteratorCandidateByMecabraCandidatePointerValue](self, "transliteratorCandidateByMecabraCandidatePointerValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v16);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v16, v29);

          objc_msgSend(v16, "seq2seqScore");
          *(float *)&v30 = v30;
          objc_msgSend(v26, "setSeq2seqScore:", v30);
          v13 = v44;
          objc_msgSend(v44, "addObject:", v26);

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v48);
    }

    v6 = v42;
    if (!-[TIKeyboardInputManagerTransliteration prioritizeLatinCandidates](self, "prioritizeLatinCandidates")
      && objc_msgSend(v13, "count"))
    {
      goto LABEL_29;
    }
    v31 = objc_msgSend(v13, "count");
    if (v31)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __81__TIKeyboardInputManagerTransliteration_candidatesForInputString_transliterator___block_invoke;
      v50[3] = &unk_1EA102730;
      i = (uint64_t)&v51;
      v32 = v40;
      v51 = v40;
      v33 = objc_msgSend(v13, "indexOfObjectPassingTest:", v50);
      if (v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v34 = v33;
        objc_msgSend(v13, "objectAtIndexedSubscript:", v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectAtIndex:", v34);
        objc_msgSend(v13, "insertObject:atIndex:", v35, 0);

        goto LABEL_28;
      }
    }
    else
    {
      v32 = v40;
    }
    v36 = (void *)MEMORY[0x1E0DBDBE8];
    -[TIKeyboardInputManager inputString](self, "inputString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "candidateWithCandidate:forInput:", v32, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "insertObject:atIndex:", v38, 0);
    if (!v31)
    {
LABEL_29:

      v5 = v43;
      goto LABEL_30;
    }
LABEL_28:

    goto LABEL_29;
  }
  v13 = (void *)MEMORY[0x1E0C9AA60];
LABEL_30:

  return v13;
}

- (id)keyboardConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerTransliteration;
  -[TIKeyboardInputManager keyboardConfiguration](&v9, sel_keyboardConfiguration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageWithRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = CFSTR("en_IN");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMultilingualLanguages:", v7);

  return v3;
}

- (id)scoreAndResortCandidates:(id)a3 string:(id)a4 geometryScore:(float)a5
{
  id v8;
  id v9;
  void *v10;
  TIKeyboardInputManager *nativeModelManager;
  void *v12;
  void *v13;
  KB *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  int v22;
  const char *v23;
  const char *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  float *v29;
  float v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  void *v36;
  void *v37;
  int v38;
  __int128 v39;
  void *__p[2];
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  _QWORD v46[6];
  _OWORD v47[3];
  int v48;
  void **v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = 0;
  memset(v46, 0, sizeof(v46));
  memset(v47, 0, sizeof(v47));
  v10 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  *(_OWORD *)__p = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v43);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v44);
  memset(v45, 0, 24);
  v38 = 0;
  nativeModelManager = self->_nativeModelManager;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextBeforeInput");
  v14 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v14, (uint64_t)&v49);
  -[TIKeyboardInputManager tokenizeString:context:sentences:](nativeModelManager, "tokenizeString:context:sentences:", &v49, &v39, &v38);
  if (v50 && BYTE6(v49) == 1)
    free(v50);

  v36 = v9;
  v37 = v8;
  *(float *)&v15 = a5;
  -[TIKeyboardInputManagerTransliteration processCandidates:withGeometryScore:originalLatinString:context:intoCandidateCollection:intoStringCandidateMap:](self, "processCandidates:withGeometryScore:originalLatinString:context:intoCandidateCollection:intoStringCandidateMap:", v8, v9, &v39, v46, v10, v15);
  -[TIKeyboardInputManager scoreCandidates:](self->_nativeModelManager, "scoreCandidates:", v46);
  v16 = 0x1CAC083126E978D5 * ((uint64_t)(v46[1] - v46[0]) >> 3);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v16);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v16);
  v19 = v46[1];
  for (i = v46[0]; i != v19; i += 1000)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = *(unsigned __int16 *)(i + 888);
    if (!*(_WORD *)(i + 888))
    {
      KB::Candidate::compute_string((KB::Candidate *)i);
      v22 = *(unsigned __int16 *)(i + 888);
    }
    v23 = *(const char **)(i + 896);
    if (!v23)
      v23 = (const char *)(i + 904);
    if (v22)
      v24 = v23;
    else
      v24 = "";
    objc_msgSend(v21, "stringWithUTF8String:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "containsObject:", v25) & 1) == 0)
    {
      if (*(_QWORD *)i)
      {
        v28 = 240 * *(_QWORD *)i;
        v29 = (float *)(*(_QWORD *)(i + 8) + 56);
        LODWORD(v27) = 1.0;
        do
        {
          v30 = *v29;
          v29 += 60;
          *(float *)&v27 = *(float *)&v27 * v30;
          v28 -= 240;
        }
        while (v28);
      }
      else
      {
        LODWORD(v27) = 1.0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setStaticLinguisticLikelihood:", v31);

      objc_msgSend(v17, "addObject:", v26);
      objc_msgSend(v18, "addObject:", v25);
    }

  }
  v49 = (void **)v45;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v49);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v44);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v43);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v32 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
  if (*((_QWORD *)&v39 + 1))
  {
    v33 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  *(_QWORD *)&v39 = (char *)&v47[1] + 8;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v39);
  *(_QWORD *)&v39 = v47;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v39);
  *(_QWORD *)&v39 = &v46[3];
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v39);
  *(_QWORD *)&v39 = v46;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v39);

  return v17;
}

- (void)processCandidates:(id)a3 withGeometryScore:(float)a4 originalLatinString:(id)a5 context:(void *)a6 intoCandidateCollection:(void *)a7 intoStringCandidateMap:(id)a8
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  int v18;
  int v19;
  int v20;
  int v21;
  KB::Candidate *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[748];
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  _BYTE v43[128];
  unint64_t v44;
  char *v45;
  char *v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a8;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v10;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v34 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v16, "candidate");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        KB::String::String((KB::String *)&v44, (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4));
        KB::Candidate::Candidate((KB::Candidate *)v37, (const KB::String *)&v44, 0);
        if (v45 && BYTE6(v44) == 1)
          free(v45);
        objc_opt_class();
        v18 = 0;
        v19 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "seq2seqScore");
          v19 = v20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "lmScore");
          v18 = v21;
        }
        v38 = 0;
        v39 = v18;
        v40 = 0x3E80000000000000;
        v41 = v19;
        KB::LanguageModelContext::operator=((uint64_t)&v42, (uint64_t *)a6);
        v22 = (KB::Candidate *)*((_QWORD *)a7 + 1);
        v23 = *((_QWORD *)a7 + 2);
        if ((unint64_t)v22 >= v23)
        {
          v25 = 0x1CAC083126E978D5 * (((uint64_t)v22 - *(_QWORD *)a7) >> 3);
          v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) > 0x4189374BC6A7EFLL)
            abort();
          v27 = 0x1CAC083126E978D5 * ((uint64_t)(v23 - *(_QWORD *)a7) >> 3);
          if (2 * v27 > v26)
            v26 = 2 * v27;
          if (v27 >= 0x20C49BA5E353F7)
            v28 = 0x4189374BC6A7EFLL;
          else
            v28 = v26;
          v48 = (char *)a7 + 16;
          if (v28)
            v28 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::Candidate>>(v28);
          else
            v29 = 0;
          v30 = (char *)(v28 + 1000 * v25);
          v44 = v28;
          v45 = v30;
          v47 = v28 + 1000 * v29;
          KB::Candidate::Candidate((KB::Candidate *)v30, (const KB::Candidate *)v37);
          v46 = v30 + 1000;
          std::vector<KB::Candidate>::__swap_out_circular_buffer((uint64_t *)a7, &v44);
          v24 = (char *)*((_QWORD *)a7 + 1);
          std::__split_buffer<KB::Candidate>::~__split_buffer((uint64_t)&v44);
        }
        else
        {
          v24 = (char *)KB::Candidate::Candidate(v22, (const KB::Candidate *)v37) + 1000;
        }
        *((_QWORD *)a7 + 1) = v24;
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v17);
        KB::Candidate::~Candidate((KB::Candidate *)v37);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v13);
  }

}

- (void)incrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6 saveToDifferentialPrivacy:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;

  v7 = *(_QWORD *)&a7;
  v12 = a6;
  v13 = a3;
  -[TIKeyboardInputManager incrementLanguageModelCount:tokenID:contextTokens:saveToDifferentialPrivacy:](self, "incrementLanguageModelCount:tokenID:contextTokens:saveToDifferentialPrivacy:", a4, a5, 0, v7);
  -[TIKeyboardInputManagerTransliteration nativeModelManager](self, "nativeModelManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "findTokenIDForWord:contextTokens:tokenLookupMode:", v13, 0, 0);

  -[TIKeyboardInputManagerTransliteration nativeModelManager](self, "nativeModelManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "incrementLanguageModelCount:tokenID:contextTokens:saveToDifferentialPrivacy:", v13, v15, v12, v7);

}

- (void)decrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;

  v10 = a6;
  v11 = a3;
  -[TIKeyboardInputManager decrementLanguageModelCount:tokenID:contextTokens:](self, "decrementLanguageModelCount:tokenID:contextTokens:", a4, a5, v10);
  -[TIKeyboardInputManagerTransliteration nativeModelManager](self, "nativeModelManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "findTokenIDForWord:contextTokens:tokenLookupMode:", v11, 0, 0);

  -[TIKeyboardInputManagerTransliteration nativeModelManager](self, "nativeModelManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "decrementLanguageModelCount:tokenID:contextTokens:", v11, v13, v10);

}

- (void)setTransliterator:(id)a3
{
  objc_storeStrong((id *)&self->_transliterator, a3);
}

- (void)setExactStringTransliterator:(id)a3
{
  objc_storeStrong((id *)&self->_exactStringTransliterator, a3);
}

- (void)setAutocorrectionTransliterator:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectionTransliterator, a3);
}

- (BOOL)prioritizeLatinCandidates
{
  return self->_hasCandidates;
}

- (void)setPrioritizeLatinCandidates:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (BOOL)hasCandidates
{
  return *(&self->_hasCandidates + 1);
}

- (void)setHasCandidates:(BOOL)a3
{
  *(&self->_hasCandidates + 1) = a3;
}

- (NSArray)currentCandidates
{
  return self->_currentCandidates;
}

- (void)setCurrentCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_currentCandidates, a3);
}

- (TIKeyboardInputManager)nativeModelManager
{
  return self->_nativeModelManager;
}

- (void)setNativeModelManager:(id)a3
{
  objc_storeStrong((id *)&self->_nativeModelManager, a3);
}

- (NSMapTable)transliteratorCandidateByMecabraCandidatePointerValue
{
  return self->_transliteratorCandidateByMecabraCandidatePointerValue;
}

- (void)setTransliteratorCandidateByMecabraCandidatePointerValue:(id)a3
{
  objc_storeStrong((id *)&self->_transliteratorCandidateByMecabraCandidatePointerValue, a3);
}

- (NSMutableArray)committedCandidates
{
  return self->_committedCandidates;
}

- (void)setCommittedCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_committedCandidates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedCandidates, 0);
  objc_storeStrong((id *)&self->_transliteratorCandidateByMecabraCandidatePointerValue, 0);
  objc_storeStrong((id *)&self->_nativeModelManager, 0);
  objc_storeStrong((id *)&self->_currentCandidates, 0);
  objc_storeStrong((id *)&self->_autocorrectionTransliterator, 0);
  objc_storeStrong((id *)&self->_exactStringTransliterator, 0);
  objc_storeStrong((id *)&self->_transliterator, 0);
}

uint64_t __81__TIKeyboardInputManagerTransliteration_candidatesForInputString_transliterator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)transliteratorInputCharacterSet
{
  if (+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__onceToken != -1)
    dispatch_once(&+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__onceToken, &__block_literal_global_11860);
  return (id)+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__transliteratorInputCharacterSet;
}

void __72__TIKeyboardInputManagerTransliteration_transliteratorInputCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__transliteratorInputCharacterSet;
  +[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__transliteratorInputCharacterSet = v0;

}

@end
