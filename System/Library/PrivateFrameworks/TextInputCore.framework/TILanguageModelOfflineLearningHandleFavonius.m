@implementation TILanguageModelOfflineLearningHandleFavonius

- (TILanguageModelOfflineLearningHandleFavonius)initWithInputMode:(id)a3
{
  id v4;
  TILanguageModelOfflineLearningHandleFavonius *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *m_ptr;
  uint64_t v16[3];
  objc_super v17;
  void **v18;
  void *v19;
  _BYTE v20[8];
  void *v21;
  _BYTE v22[8];
  void *v23;
  _BYTE v24[8];
  void *v25;
  _BYTE v26[8];
  void *v27;
  uint64_t v28;
  int v29;
  _BYTE v30[8];
  void *v31;
  int v32;
  __int16 v33;
  char v34;
  void *v35;
  char v36;
  int v37;
  __int16 v38;
  char v39;
  void *v40;
  char v41;
  int v42;
  __int16 v43;
  char v44;
  void *v45;
  char v46;
  int v47;
  __int16 v48;
  char v49;
  void *v50;
  char v51;
  uint64_t v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TILanguageModelOfflineLearningHandleFavonius;
  v5 = -[TILanguageModelOfflineLearningHandle initWithInputMode:](&v17, sel_initWithInputMode_, v4);
  if (v5)
  {
    objc_msgSend(v4, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_retainAutorelease(v7);
    v9 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v8, "UTF8String"));
    if (objc_msgSend(v4, "wantsMultilingualUnionOVS"))
      v10 = objc_msgSend(v4, "wantsMultilingualUnionOVS");
    else
      v10 = 0;
    KB::utf8_string((KB *)v8, (uint64_t)v30);
    v32 = 0x100000;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0x100000;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0x100000;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0x100000;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    LODWORD(v52) = v9;
    BYTE4(v52) = v10;
    v53 = 1065353216;
    KB::String::String((KB::String *)&v18, (const KB::String *)v30);
    KB::String::String((KB::String *)v20, (const KB::String *)&v32);
    KB::String::String((KB::String *)v22, (const KB::String *)&v37);
    KB::String::String((KB::String *)v24, (const KB::String *)&v42);
    KB::String::String((KB::String *)v26, (const KB::String *)&v47);
    v28 = v52;
    v29 = v53;
    v11 = operator new(0xB0uLL);
    v12 = (uint64_t)v11 + 176;
    v16[0] = (uint64_t)v11;
    v16[2] = (uint64_t)v11 + 176;
    std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v11, (uint64_t)&v18);
    v16[1] = v12;
    if (v27 && v26[6] == 1)
      free(v27);
    if (v25 && v24[6] == 1)
      free(v25);
    if (v23 && v22[6] == 1)
      free(v23);
    if (v21 && v20[6] == 1)
      free(v21);
    if (v19 && BYTE6(v18) == 1)
      free(v19);
    v13 = operator new();
    KB::DictionaryContainer::DictionaryContainer(v13, v16, 0, 0, 1);
    m_ptr = (unsigned int *)v5->_dictionaries.m_ptr;
    v5->_dictionaries.m_ptr = (DictionaryContainer *)v13;
    if (m_ptr)
      WTF::RefCounted<KB::DictionaryContainer>::deref(m_ptr);
    v18 = (void **)v16;
    std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v18);
    if (v50 && v49 == 1)
      free(v50);
    if (v45 && v44 == 1)
      free(v45);
    if (v40 && v39 == 1)
      free(v40);
    if (v35 && v34 == 1)
      free(v35);
    if (v31 && v30[6] == 1)
      free(v31);

  }
  return v5;
}

- (void)updateAdaptationContext:(id)a3
{
  id v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  TILanguageModelOfflineLearningHandleFavonius *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __n128 (*v29)(__n128 *, __n128 *);
  uint64_t (*v30)(uint64_t);
  const char *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x4012000000;
  v29 = __Block_byref_object_copy__15698;
  v30 = __Block_byref_object_dispose__15699;
  v32 = 0;
  v33 = 0;
  v31 = "";
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __72__TILanguageModelOfflineLearningHandleFavonius_updateAdaptationContext___block_invoke;
  v22 = &unk_1EA1070B8;
  v23 = self;
  v25 = &v26;
  v5 = v4;
  v24 = v5;
  TIDispatchSync();
  (*(void (**)(uint64_t))(*(_QWORD *)v27[6] + 96))(v27[6]);
  v6 = (std::__shared_weak_count *)v27[7];
  v17 = v27[6];
  v18 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  -[TILanguageModelOfflineLearningHandleFavonius setCurrentModel:](self, "setCurrentModel:", &v17);
  v9 = v18;
  if (v18)
  {
    v10 = (unint64_t *)&v18->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  -[TILanguageModelOfflineLearningHandle setCurrentAdaptationContext:](self, "setCurrentAdaptationContext:", v5);
  -[TILanguageModelOfflineLearningHandle lastAdaptationDate](self, "lastAdaptationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)MEMORY[0x1E0C80D38];
    TIDispatchSync();

  }
  _Block_object_dispose(&v26, 8);
  v14 = v33;
  if (v33)
  {
    v15 = (unint64_t *)&v33->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

}

- (void)load
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int *m_ptr;
  void *v47;
  void *v48;
  void *v49;
  TILanguageModelOfflineLearningHandleFavonius *v50;
  uint64_t v51[3];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void **v60;
  void *v61;
  _BYTE v62[8];
  void *v63;
  _BYTE v64[8];
  void *v65;
  _BYTE v66[8];
  void *v67;
  _BYTE v68[8];
  void *v69;
  uint64_t v70;
  int v71;
  uint8_t buf[4];
  _BYTE v73[12];
  _BYTE v74[8];
  void *v75;
  _BYTE v76[8];
  void *v77;
  int v78;
  __int16 v79;
  char v80;
  void *v81;
  char v82;
  int v83;
  __int16 v84;
  char v85;
  void *v86;
  char v87;
  uint64_t v88;
  int v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ddsAssetContentItemsWithContentType:inputMode:filteredWithRegion:", CFSTR("Lexicon"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v57 = 0u;
  v58 = 0u;
  v56 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v91, 16);
  v50 = self;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v57;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v10), "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "hasSuffix:", CFSTR(".dat")))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

        if ((v14 & 1) != 0)
          break;
      }

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v91, 16);
        if (v8)
          goto LABEL_3;
        v12 = 0;
        break;
      }
    }
    self = v50;
  }
  else
  {
    v12 = 0;
  }

  v15 = &+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s DDS found static dict path: %@"), "-[TILanguageModelOfflineLearningHandleFavonius load]", v12);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v73 = v47;
    _os_log_debug_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  if (!v12)
  {
    -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "languageWithRegion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardStaticUnigramsFile(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ddsAssetContentItemsWithContentType:inputMode:filteredWithRegion:", CFSTR("LexiconDelta"), v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v90, 16);
  v49 = v6;
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v53;
LABEL_21:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v25)
        objc_enumerationMutation(v22);
      objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v26), "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v28, "hasSuffix:", CFSTR(".dat")))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "fileExistsAtPath:", v28);

        if ((v30 & 1) != 0)
          break;
      }

      if (v24 == ++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v90, 16);
        if (v24)
          goto LABEL_21;
        v28 = 0;
        break;
      }
    }
    self = v50;
    v15 = &+[TILanguageModelLoaderManager recipientRecords]::__recipientRecords;
  }
  else
  {
    v28 = 0;
  }

  if (v15[77] != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s DDS found delta dict path: %@"), "-[TILanguageModelOfflineLearningHandleFavonius load]", v28);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v73 = v48;
    _os_log_debug_impl(&dword_1DA6F2000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  if (!v28)
  {
    -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "languageWithRegion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardDeltaLexiconPathForInputMode(v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "locale");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localeIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_retainAutorelease(v37);
  v39 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v38, "UTF8String"));
  -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "wantsMultilingualUnionOVS"))
  {
    -[TILanguageModelOfflineLearningHandle inputMode](self, "inputMode");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "wantsMultilingualUnionOVS");

  }
  else
  {
    v42 = 0;
  }

  KB::utf8_string((KB *)v38, (uint64_t)buf);
  KB::utf8_string((KB *)v12, (uint64_t)v74);
  KB::utf8_string((KB *)v28, (uint64_t)v76);
  v78 = 0x100000;
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0x100000;
  v84 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  LODWORD(v88) = v39;
  BYTE4(v88) = v42;
  v89 = 1065353216;
  KB::String::String((KB::String *)&v60, (const KB::String *)buf);
  KB::String::String((KB::String *)v62, (const KB::String *)v74);
  KB::String::String((KB::String *)v64, (const KB::String *)v76);
  KB::String::String((KB::String *)v66, (const KB::String *)&v78);
  KB::String::String((KB::String *)v68, (const KB::String *)&v83);
  v70 = v88;
  v71 = v89;
  v43 = operator new(0xB0uLL);
  v44 = (uint64_t)v43 + 176;
  v51[0] = (uint64_t)v43;
  v51[2] = (uint64_t)v43 + 176;
  std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v43, (uint64_t)&v60);
  v51[1] = v44;
  if (v69 && v68[6] == 1)
    free(v69);
  if (v67 && v66[6] == 1)
    free(v67);
  if (v65 && v64[6] == 1)
    free(v65);
  if (v63 && v62[6] == 1)
    free(v63);
  if (v61 && BYTE6(v60) == 1)
    free(v61);
  v45 = operator new();
  KB::DictionaryContainer::DictionaryContainer(v45, v51, 0, 0, 1);
  m_ptr = (unsigned int *)v50->_dictionaries.m_ptr;
  v50->_dictionaries.m_ptr = (DictionaryContainer *)v45;
  if (m_ptr)
    WTF::RefCounted<KB::DictionaryContainer>::deref(m_ptr);
  v60 = (void **)v51;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v60);
  if (v86 && v85 == 1)
    free(v86);
  if (v81 && v80 == 1)
    free(v81);
  if (v77 && v76[6] == 1)
    free(v77);
  if (v75 && v74[6] == 1)
    free(v75);
  if (*(_QWORD *)&v73[4] && v73[2] == 1)
    free(*(void **)&v73[4]);

}

- (void)adaptToParagraph:(id)a3 timeStamp:(double)a4 adaptationType:(int)a5
{
  id v5;
  id v6;

  v6 = a3;
  v5 = v6;
  TIDispatchSync();

}

- (void)didFinishLearning
{
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;

  if (-[TILanguageModelOfflineLearningHandle isValid](self, "isValid"))
  {
    -[TILanguageModelOfflineLearningHandleFavonius currentModel](self, "currentModel");
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v4 = __ldaxr(p_shared_owners);
      while (__stlxr(v4 - 1, p_shared_owners));
      if (!v4)
      {
        ((void (*)())v6->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (v5)
      TIDispatchSync();
  }
}

- (shared_ptr<KB::LanguageModel>)currentModel
{
  LanguageModel **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<KB::LanguageModel> result;

  cntrl = self->_currentModel.__cntrl_;
  *v2 = self->_currentModel.__ptr_;
  v2[1] = (LanguageModel *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LanguageModel *)self;
  return result;
}

- (void)setCurrentModel:(shared_ptr<KB::LanguageModel>)a3
{
  std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](&self->_currentModel.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (RefPtr<KB::DictionaryContainer>)dictionaries
{
  unsigned int **v2;
  unsigned int *m_ptr;
  unsigned int v4;

  m_ptr = (unsigned int *)self->_dictionaries.m_ptr;
  *v2 = m_ptr;
  if (m_ptr)
  {
    do
      v4 = __ldaxr(m_ptr);
    while (__stlxr(v4 + 1, m_ptr));
  }
  return (RefPtr<KB::DictionaryContainer>)self;
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;

  std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&self->_currentModel);
  m_ptr = (unsigned int *)self->_dictionaries.m_ptr;
  if (m_ptr)
    WTF::RefCounted<KB::DictionaryContainer>::deref(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

void __65__TILanguageModelOfflineLearningHandleFavonius_didFinishLearning__block_invoke(uint64_t a1)
{
  unint64_t *p_shared_owners;
  unint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  objc_msgSend(*(id *)(a1 + 32), "currentModel");
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v3 + 568))(v3, 0);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v2 = __ldaxr(p_shared_owners);
    while (__stlxr(v2 - 1, p_shared_owners));
    if (!v2)
    {
      ((void (*)())v4->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void __90__TILanguageModelOfflineLearningHandleFavonius_adaptToParagraph_timeStamp_adaptationType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v2, "currentModel");
  v3 = *(void **)(a1 + 32);
  if (!v3)
  {
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "dictionaries");
LABEL_6:
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length", v8) <= 0x3FFE)
  {
    if ((*(unsigned int (**)(uint64_t, _QWORD))(*(_QWORD *)v9 + 360))(v9, *(_QWORD *)(a1 + 40)))
    {
      v4 = v9;
      KB::utf8_string(*(KB **)(a1 + 40), (uint64_t)v11);
      (*(void (**)(uint64_t, _BYTE *, unsigned int **, _QWORD, _QWORD, double))(*(_QWORD *)v4 + 368))(v4, v11, &v8, 0, *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
      if (v12)
      {
        if (v11[6] == 1)
          free(v12);
      }
    }
  }
  if (v8)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v8);
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void __72__TILanguageModelOfflineLearningHandleFavonius_updateAdaptationContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[TIKeyboardInputManager keyboardUserDirectory](TIKeyboardInputManager, "keyboardUserDirectory");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ddsAssetContentItemsWithContentType:inputMode:filteredWithRegion:", CFSTR("LanguageModel"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  TIAssetsOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s updateAdaptationContext TI: %@"), "-[TILanguageModelOfflineLearningHandleFavonius updateAdaptationContext:]_block_invoke", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredModelLocaleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "preferredModelLocaleIsMultilingual");
  objc_msgSend(*(id *)(a1 + 32), "inputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isSiriMode");
  objc_msgSend(*(id *)(a1 + 32), "inputMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v23) = objc_msgSend(v13, "doesSupportInlineCompletion");
  BYTE2(v22) = v12;
  LOWORD(v22) = 0;
  +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v8, v10, 0, v24, v4, 1, v22, 0, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "inputMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "locale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "languageModelForAdaptationContext:languageLocales:", v15, v18);
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
  }
  std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, (__int128 *)buf);
  v19 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v20 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }

}

void __72__TILanguageModelOfflineLearningHandleFavonius_updateAdaptationContext___block_invoke_53(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double Current;
  id v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 352))(v3);
  }
  else
  {
    Current = CFAbsoluteTimeGetCurrent();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", Current);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastAdaptationDate:", v5);

}

@end
