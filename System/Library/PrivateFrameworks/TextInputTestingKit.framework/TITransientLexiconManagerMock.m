@implementation TITransientLexiconManagerMock

- (TITransientLexiconManagerMock)init
{
  TITransientLexiconManagerMock *v2;
  TITransientLexiconManagerMock *v3;
  uint64_t v4;
  uint64_t v5;
  TITransientLexiconManagerMock *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TITransientLexiconManagerMock;
  v2 = -[TITransientLexiconManagerMock init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_namedEntityLexiconRef = 0;
    v2->_namedEntityPhraseLexiconRef = 0;
    v4 = operator new();
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_DWORD *)(v4 + 32) = 1065353216;
    v3->_addressBookLexicons = (void *)v4;
    v5 = operator new();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_DWORD *)(v5 + 32) = 1065353216;
    v3->_appNameLexicons = (void *)v5;
    v3->_supplementalLexiconSearchEnabled = 1;
    v6 = v3;
  }

  return v3;
}

- (void)addEntry:(id)a3 toLexicon:(_LXLexicon *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getLXLexiconAddSymbolLoc(void)::ptr;
  v13 = getLXLexiconAddSymbolLoc(void)::ptr;
  if (!getLXLexiconAddSymbolLoc(void)::ptr)
  {
    v7 = (void *)LexiconLibrary();
    v6 = dlsym(v7, "LXLexiconAdd");
    v11[3] = (uint64_t)v6;
    getLXLexiconAddSymbolLoc(void)::ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
    goto LABEL_8;
  ((void (*)(_LXLexicon *, id, _QWORD))v6)(a4, v5, 0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v8 = getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr;
  v13 = getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr;
  if (!getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr)
  {
    v9 = (void *)LexiconLibrary();
    v8 = dlsym(v9, "LXLexiconIncrementUsageCount");
    v11[3] = (uint64_t)v8;
    getLXLexiconIncrementUsageCountSymbolLoc(void)::ptr = v8;
  }
  _Block_object_dispose(&v10, 8);
  if (v8)
  {
    ((void (*)(_LXLexicon *, id, uint64_t))v8)(a4, v5, 1);

  }
  else
  {
LABEL_8:
    dlerror();
    abort_report_np();
    __break(1u);
  }
}

- (TITransientLexiconManagerMock)initWithTransientData:(id)a3 namedEntities:(id)a4
{
  id v7;
  TITransientLexiconManagerMock *v8;
  TITransientLexiconManagerMock *v9;
  const __CFAllocator *v10;
  __CFDictionary *Mutable;
  id v12;
  id v13;
  __CFError *v14;
  __CFDictionary *v15;
  id v16;
  id v17;
  __CFError *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  NSMutableArray *v29;
  NSMutableArray *observers;
  uint64_t v31;
  uint64_t v32;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __CFError *v44;
  __CFError *v45;
  objc_super v46;
  _BYTE v47[128];
  uint8_t v48[128];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  __CFError *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)TITransientLexiconManagerMock;
  v35 = v7;
  v8 = -[TITransientLexiconManagerMock init](&v46, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactCollection, a3);
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v12 = getkLXLexiconNameKey();
    CFDictionaryAddValue(Mutable, v12, CFSTR("InputContext-NamedEntityWords"));
    v13 = getkLXLexiconLocaleKey();
    CFDictionaryAddValue(Mutable, v13, CFSTR("en_US"));
    v45 = 0;
    v9->_namedEntityLexiconRef = (_LXLexicon *)__LXLexiconCreateTransient(Mutable, &v45);
    CFRelease(Mutable);
    v14 = v45;
    if (v45)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        v51 = 2112;
        v52 = v14;
        _os_log_impl(&dword_22FA56000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  Error: Unable to create transient mutable lexicon for named entities: %@", buf, 0x16u);
        v14 = v45;
      }
      CFRelease(v14);
    }
    v15 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v16 = getkLXLexiconNameKey();
    CFDictionaryAddValue(v15, v16, CFSTR("InputContext-NamedEntityPhrases"));
    v17 = getkLXLexiconLocaleKey();
    CFDictionaryAddValue(v15, v17, CFSTR("en_US"));
    v44 = 0;
    v9->_namedEntityPhraseLexiconRef = (_LXLexicon *)__LXLexiconCreateTransient(v15, &v44);
    CFRelease(v15);
    v18 = v44;
    if (v44)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "-[TITransientLexiconManagerMock initWithTransientData:namedEntities:]";
        v51 = 2112;
        v52 = v18;
        _os_log_impl(&dword_22FA56000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s  Error: Unable to create transient mutable lexicon for named entity phrases: %@", buf, 0x16u);
        v18 = v44;
      }
      CFRelease(v18);
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16, v34);
    if (v20)
    {
      v21 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v41 != v21)
            objc_enumerationMutation(v19);
          v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          +[TITransientLexiconManagerMock tokenizeEntity:](TITransientLexiconManagerMock, "tokenizeEntity:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v24, "count") >= 2)
            -[TITransientLexiconManagerMock addEntry:toLexicon:](v9, "addEntry:toLexicon:", v23, v9->_namedEntityPhraseLexiconRef);
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v25 = v24;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v37;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v37 != v27)
                  objc_enumerationMutation(v25);
                -[TITransientLexiconManagerMock addEntry:toLexicon:](v9, "addEntry:toLexicon:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), v9->_namedEntityLexiconRef);
              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
            }
            while (v26);
          }

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v20);
    }

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v9->_observers;
    v9->_observers = v29;

    v31 = operator new();
    *(_OWORD *)v31 = 0u;
    *(_OWORD *)(v31 + 16) = 0u;
    *(_DWORD *)(v31 + 32) = 1065353216;
    v9->_addressBookLexicons = (void *)v31;
    v32 = operator new();
    *(_OWORD *)v32 = 0u;
    *(_OWORD *)(v32 + 16) = 0u;
    *(_DWORD *)(v32 + 32) = 1065353216;
    v9->_appNameLexicons = (void *)v32;
    v7 = v35;
  }

  return v9;
}

- (void)dealloc
{
  _LXLexicon *namedEntityPhraseLexiconRef;
  _LXLexicon *namedEntityLexiconRef;
  void **addressBookLexicons;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  void **appNameLexicons;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  objc_super v13;

  namedEntityPhraseLexiconRef = self->_namedEntityPhraseLexiconRef;
  if (namedEntityPhraseLexiconRef)
    CFRelease(namedEntityPhraseLexiconRef);
  namedEntityLexiconRef = self->_namedEntityLexiconRef;
  if (namedEntityLexiconRef)
    CFRelease(namedEntityLexiconRef);
  addressBookLexicons = (void **)self->_addressBookLexicons;
  if (addressBookLexicons)
  {
    v6 = addressBookLexicons[2];
    if (v6)
    {
      do
      {
        v7 = (_QWORD *)*v6;
        std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)(v6 + 6));
        KB::String::~String((KB::String *)(v6 + 2));
        operator delete(v6);
        v6 = v7;
      }
      while (v7);
    }
    v8 = *addressBookLexicons;
    *addressBookLexicons = 0;
    if (v8)
      operator delete(v8);
    MEMORY[0x2348A8A24](addressBookLexicons, 0x10A0C408EF24B1CLL);
  }
  appNameLexicons = (void **)self->_appNameLexicons;
  if (appNameLexicons)
  {
    v10 = appNameLexicons[2];
    if (v10)
    {
      do
      {
        v11 = (_QWORD *)*v10;
        std::shared_ptr<KB::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)(v10 + 6));
        KB::String::~String((KB::String *)(v10 + 2));
        operator delete(v10);
        v10 = v11;
      }
      while (v11);
    }
    v12 = *appNameLexicons;
    *appNameLexicons = 0;
    if (v12)
      operator delete(v12);
    MEMORY[0x2348A8A24](appNameLexicons, 0x10A0C408EF24B1CLL);
  }
  v13.receiver = self;
  v13.super_class = (Class)TITransientLexiconManagerMock;
  -[TITransientLexiconManagerMock dealloc](&v13, sel_dealloc);
}

- (id)addContactObserver:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  TITransientLexiconManagerMock *v5;
  NSMutableArray *observers;
  void *v7;
  void *v8;

  v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  observers = v5->_observers;
  v7 = (void *)MEMORY[0x2348A8EA4](v4);
  -[NSMutableArray addObject:](observers, "addObject:", v7);

  objc_sync_exit(v5);
  ((void (**)(_QWORD, NSDictionary *))v4)[2](v4, v5->_contactCollection);
  v8 = (void *)MEMORY[0x2348A8EA4](v4);

  return v8;
}

- (void)setNewContactCollection:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_contactCollection, a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)removeContactObserver:(id)a3
{
  id v4;
  NSMutableArray *observers;
  void *v6;
  TITransientLexiconManagerMock *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  observers = obj->_observers;
  v6 = (void *)MEMORY[0x2348A8EA4](v4);

  -[NSMutableArray removeObjectIdenticalTo:](observers, "removeObjectIdenticalTo:", v6);
  objc_sync_exit(obj);

}

- (void)getOnce:(id)a3
{
  (*((void (**)(id, NSDictionary *))a3 + 2))(a3, self->_contactCollection);
}

- (NSArray)observers
{
  return (NSArray *)self->_observers;
}

- (BOOL)searchHelper:(_LXLexicon *)a3 forWord:(__CFString *)a4 caseSensitive:(BOOL)a5
{
  _QWORD *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL result;
  _QWORD v12[6];
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;

  if (!a3)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__TITransientLexiconManagerMock_searchHelper_forWord_caseSensitive___block_invoke;
  v12[3] = &unk_24FD48568;
  v13 = a5;
  v12[4] = &v14;
  v12[5] = a4;
  v7 = v12;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v8 = getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr;
  v21 = getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr;
  if (!getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr)
  {
    v9 = (void *)LexiconLibrary();
    v8 = dlsym(v9, "LXLexiconEnumerateEntriesForString");
    v19[3] = (uint64_t)v8;
    getLXLexiconEnumerateEntriesForStringSymbolLoc(void)::ptr = v8;
  }
  _Block_object_dispose(&v18, 8);
  if (v8)
  {
    ((void (*)(_LXLexicon *, __CFString *, _QWORD *))v8)(a3, a4, v7);

    v10 = *((_BYTE *)v15 + 24) != 0;
    _Block_object_dispose(&v14, 8);
    return v10;
  }
  dlerror();
  result = abort_report_np();
  __break(1u);
  return result;
}

- (BOOL)searchForWord:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[TITransientLexiconManagerMock searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", -[TITransientLexiconManagerMock namedEntityLexicon](self, "namedEntityLexicon"), v4, 1);

  return (char)self;
}

- (BOOL)searchForWordCaseInsensitive:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[TITransientLexiconManagerMock searchHelper:forWord:caseSensitive:](self, "searchHelper:forWord:caseSensitive:", -[TITransientLexiconManagerMock namedEntityLexicon](self, "namedEntityLexicon"), v4, 0);

  return (char)self;
}

- (_LXLexicon)namedEntityLexicon
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexicon
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)namedEntityLexiconForLocale:(const char *)a3
{
  return self->_namedEntityLexiconRef;
}

- (_LXLexicon)namedEntityPhraseLexiconForLocale:(const char *)a3
{
  return self->_namedEntityPhraseLexiconRef;
}

- (_LXLexicon)addressBookLexiconForLocale:(const char *)a3
{
  unint64_t v3;
  const char *v5;
  const char *v6;
  KB *v7;
  NSString *v8;
  void *v9;
  KB *v10;
  NSString *v11;
  char *addressBookLexicons;
  unint64_t *v13;
  unint64_t v14;
  KB::String *v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  uint8x8_t v19;
  unint64_t v20;
  uint64_t **v21;
  uint64_t **v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  float v26;
  float v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  int8x8_t prime;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint8x8_t v37;
  unint64_t v38;
  uint8x8_t v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  _QWORD *v50;
  std::__shared_weak_count *v51;
  _LXLexicon *v52;
  unint64_t *v53;
  unint64_t v54;
  void *v56;
  void *v57;
  __int128 v58;
  char *v59;
  unint64_t *v60;
  uint64_t v61;
  __int128 v62;
  _BYTE v63[32];
  _BYTE v64[32];
  _BYTE v65[32];
  _BYTE v66[32];
  _BYTE v67[32];
  uint64_t v68;
  const char *v69;
  _QWORD v70[4];

  v70[2] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x2348A87B4](&v68, a3);
  if (std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((_QWORD *)self->_addressBookLexicons, &v68))
  {
    goto LABEL_98;
  }
  v5 = v69;
  if (!v69)
    v5 = (const char *)v70;
  if ((_WORD)v68)
    v6 = v5;
  else
    v6 = "";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardStaticUnigramsFile();
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v7, v8);

  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v57);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDeltaLexiconPathForInputMode();
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v10, v11);

  MEMORY[0x2348A87C0](v65, &v68);
  MEMORY[0x2348A87C0](v64, v67);
  MEMORY[0x2348A87C0](v63, v66);
  KB::AddressBookTrieLoader::create();
  KB::String::~String((KB::String *)v63);
  KB::String::~String((KB::String *)v64);
  KB::String::~String((KB::String *)v65);
  addressBookLexicons = (char *)self->_addressBookLexicons;
  MEMORY[0x2348A87C0](&v59, &v68);
  v62 = v58;
  if (*((_QWORD *)&v58 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v58 + 1) + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  if (v60)
    v15 = (KB::String *)v60;
  else
    v15 = (KB::String *)&v61;
  v16 = KB::String::hash(v15, (const char *)(unsigned __int16)v59);
  v17 = v16;
  v18 = *((_QWORD *)addressBookLexicons + 1);
  if (v18)
  {
    v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    v20 = v19.u32[0];
    if (v19.u32[0] > 1uLL)
    {
      v3 = v16;
      if (v18 <= v16)
        v3 = v16 % v18;
    }
    else
    {
      v3 = ((_DWORD)v18 - 1) & v16;
    }
    v21 = *(uint64_t ***)(*(_QWORD *)addressBookLexicons + 8 * v3);
    if (v21)
    {
      v22 = (uint64_t **)*v21;
      if (*v21)
      {
        do
        {
          v23 = (unint64_t)v22[1];
          if (v23 == v17)
          {
            if (v22 + 2 == (uint64_t **)&v59
              || (KB::String::equal((KB::String *)(v22 + 2), (const KB::String *)&v59) & 1) != 0)
            {
              goto LABEL_87;
            }
          }
          else
          {
            if (v20 > 1)
            {
              if (v23 >= v18)
                v23 %= v18;
            }
            else
            {
              v23 &= v18 - 1;
            }
            if (v23 != v3)
              break;
          }
          v22 = (uint64_t **)*v22;
        }
        while (v22);
      }
    }
  }
  v24 = operator new(0x40uLL);
  *v24 = 0;
  v24[1] = v17;
  MEMORY[0x2348A87C0](v24 + 2, &v59);
  v25 = addressBookLexicons + 16;
  *((_OWORD *)v24 + 3) = v62;
  v62 = 0uLL;
  v26 = (float)(unint64_t)(*((_QWORD *)addressBookLexicons + 3) + 1);
  v27 = *((float *)addressBookLexicons + 8);
  if (!v18 || (float)(v27 * (float)v18) < v26)
  {
    v28 = 1;
    if (v18 >= 3)
      v28 = (v18 & (v18 - 1)) != 0;
    v29 = v28 | (2 * v18);
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      prime = (int8x8_t)v30;
    else
      prime = (int8x8_t)v29;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v18 = *((_QWORD *)addressBookLexicons + 1);
    if (*(_QWORD *)&prime > v18)
      goto LABEL_43;
    if (*(_QWORD *)&prime < v18)
    {
      v38 = vcvtps_u32_f32((float)*((unint64_t *)addressBookLexicons + 3) / *((float *)addressBookLexicons + 8));
      if (v18 < 3 || (v39 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        v38 = std::__next_prime(v38);
      }
      else
      {
        v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2)
          v38 = v40;
      }
      if (*(_QWORD *)&prime <= v38)
        prime = (int8x8_t)v38;
      if (*(_QWORD *)&prime >= v18)
      {
        v18 = *((_QWORD *)addressBookLexicons + 1);
      }
      else
      {
        if (prime)
        {
LABEL_43:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v32 = operator new(8 * *(_QWORD *)&prime);
          v33 = *(void **)addressBookLexicons;
          *(_QWORD *)addressBookLexicons = v32;
          if (v33)
            operator delete(v33);
          v34 = 0;
          *((int8x8_t *)addressBookLexicons + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v34++) = 0;
          while (*(_QWORD *)&prime != v34);
          v35 = (_QWORD *)*v25;
          if (*v25)
          {
            v36 = v35[1];
            v37 = (uint8x8_t)vcnt_s8(prime);
            v37.i16[0] = vaddlv_u8(v37);
            if (v37.u32[0] > 1uLL)
            {
              if (v36 >= *(_QWORD *)&prime)
                v36 %= *(_QWORD *)&prime;
            }
            else
            {
              v36 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v36) = v25;
            v41 = (_QWORD *)*v35;
            if (*v35)
            {
              do
              {
                v42 = v41[1];
                if (v37.u32[0] > 1uLL)
                {
                  if (v42 >= *(_QWORD *)&prime)
                    v42 %= *(_QWORD *)&prime;
                }
                else
                {
                  v42 &= *(_QWORD *)&prime - 1;
                }
                if (v42 != v36)
                {
                  if (!*(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v42))
                  {
                    *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v42) = v35;
                    goto LABEL_68;
                  }
                  *v35 = *v41;
                  *v41 = **(_QWORD **)(*(_QWORD *)addressBookLexicons + 8 * v42);
                  **(_QWORD **)(*(_QWORD *)addressBookLexicons + 8 * v42) = v41;
                  v41 = v35;
                }
                v42 = v36;
LABEL_68:
                v35 = v41;
                v41 = (_QWORD *)*v41;
                v36 = v42;
              }
              while (v41);
            }
          }
          v18 = (unint64_t)prime;
          goto LABEL_72;
        }
        v56 = *(void **)addressBookLexicons;
        *(_QWORD *)addressBookLexicons = 0;
        if (v56)
          operator delete(v56);
        v18 = 0;
        *((_QWORD *)addressBookLexicons + 1) = 0;
      }
    }
LABEL_72:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v18 <= v17)
        v3 = v17 % v18;
      else
        v3 = v17;
    }
    else
    {
      v3 = ((_DWORD)v18 - 1) & v17;
    }
  }
  v43 = *(_QWORD **)(*(_QWORD *)addressBookLexicons + 8 * v3);
  if (v43)
  {
    *v24 = *v43;
  }
  else
  {
    *v24 = *((_QWORD *)addressBookLexicons + 2);
    *((_QWORD *)addressBookLexicons + 2) = v24;
    *(_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v3) = v25;
    if (!*v24)
      goto LABEL_86;
    v44 = *(_QWORD *)(*v24 + 8);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v44 >= v18)
        v44 %= v18;
    }
    else
    {
      v44 &= v18 - 1;
    }
    v43 = (_QWORD *)(*(_QWORD *)addressBookLexicons + 8 * v44);
  }
  *v43 = v24;
LABEL_86:
  ++*((_QWORD *)addressBookLexicons + 3);
LABEL_87:
  v45 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v46 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  KB::String::~String((KB::String *)&v59);
  if (*((_QWORD *)&v58 + 1))
  {
    v48 = (unint64_t *)(*((_QWORD *)&v58 + 1) + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      (*(void (**)())(**((_QWORD **)&v58 + 1) + 16))();
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v58 + 1));
    }
  }
  KB::String::~String((KB::String *)v66);
  KB::String::~String((KB::String *)v67);

LABEL_98:
  v50 = std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((_QWORD *)self->_addressBookLexicons, &v68);
  if (!v50)
    abort();
  (*(void (**)(char **__return_ptr))(*(_QWORD *)v50[6] + 16))(&v59);
  v51 = (std::__shared_weak_count *)v60;
  v52 = *(_LXLexicon **)v59;
  if (v60)
  {
    v53 = v60 + 1;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  KB::String::~String((KB::String *)&v68);
  return v52;
}

- (_LXLexicon)appNameLexiconForLocale:(const char *)a3
{
  unint64_t v3;
  const char *v5;
  const char *v6;
  KB *v7;
  NSString *v8;
  void *v9;
  KB *v10;
  NSString *v11;
  char *appNameLexicons;
  unint64_t *v13;
  unint64_t v14;
  KB::String *v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  uint8x8_t v19;
  unint64_t v20;
  uint64_t **v21;
  uint64_t **v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  float v26;
  float v27;
  _BOOL8 v28;
  unint64_t v29;
  unint64_t v30;
  int8x8_t prime;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint8x8_t v37;
  unint64_t v38;
  uint8x8_t v39;
  uint64_t v40;
  _QWORD *v41;
  unint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  unint64_t *v48;
  unint64_t v49;
  _QWORD *v50;
  std::__shared_weak_count *v51;
  _LXLexicon *v52;
  unint64_t *v53;
  unint64_t v54;
  void *v56;
  void *v57;
  __int128 v58;
  char *v59;
  unint64_t *v60;
  uint64_t v61;
  __int128 v62;
  _BYTE v63[32];
  _BYTE v64[32];
  _BYTE v65[32];
  _BYTE v66[32];
  _BYTE v67[32];
  uint64_t v68;
  const char *v69;
  _QWORD v70[4];

  v70[2] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x2348A87B4](&v68, a3);
  if (std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((_QWORD *)self->_appNameLexicons, &v68))
  {
    goto LABEL_98;
  }
  v5 = v69;
  if (!v69)
    v5 = (const char *)v70;
  if ((_WORD)v68)
    v6 = v5;
  else
    v6 = "";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardStaticUnigramsFile();
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v7, v8);

  objc_msgSend(MEMORY[0x24BEB5390], "inputModeWithIdentifier:", v57);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDeltaLexiconPathForInputMode();
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v10, v11);

  MEMORY[0x2348A87C0](v65, &v68);
  MEMORY[0x2348A87C0](v64, v67);
  MEMORY[0x2348A87C0](v63, v66);
  KB::AppTrieLoader::create();
  KB::String::~String((KB::String *)v63);
  KB::String::~String((KB::String *)v64);
  KB::String::~String((KB::String *)v65);
  appNameLexicons = (char *)self->_appNameLexicons;
  MEMORY[0x2348A87C0](&v59, &v68);
  v62 = v58;
  if (*((_QWORD *)&v58 + 1))
  {
    v13 = (unint64_t *)(*((_QWORD *)&v58 + 1) + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  if (v60)
    v15 = (KB::String *)v60;
  else
    v15 = (KB::String *)&v61;
  v16 = KB::String::hash(v15, (const char *)(unsigned __int16)v59);
  v17 = v16;
  v18 = *((_QWORD *)appNameLexicons + 1);
  if (v18)
  {
    v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
    v19.i16[0] = vaddlv_u8(v19);
    v20 = v19.u32[0];
    if (v19.u32[0] > 1uLL)
    {
      v3 = v16;
      if (v18 <= v16)
        v3 = v16 % v18;
    }
    else
    {
      v3 = ((_DWORD)v18 - 1) & v16;
    }
    v21 = *(uint64_t ***)(*(_QWORD *)appNameLexicons + 8 * v3);
    if (v21)
    {
      v22 = (uint64_t **)*v21;
      if (*v21)
      {
        do
        {
          v23 = (unint64_t)v22[1];
          if (v23 == v17)
          {
            if (v22 + 2 == (uint64_t **)&v59
              || (KB::String::equal((KB::String *)(v22 + 2), (const KB::String *)&v59) & 1) != 0)
            {
              goto LABEL_87;
            }
          }
          else
          {
            if (v20 > 1)
            {
              if (v23 >= v18)
                v23 %= v18;
            }
            else
            {
              v23 &= v18 - 1;
            }
            if (v23 != v3)
              break;
          }
          v22 = (uint64_t **)*v22;
        }
        while (v22);
      }
    }
  }
  v24 = operator new(0x40uLL);
  *v24 = 0;
  v24[1] = v17;
  MEMORY[0x2348A87C0](v24 + 2, &v59);
  v25 = appNameLexicons + 16;
  *((_OWORD *)v24 + 3) = v62;
  v62 = 0uLL;
  v26 = (float)(unint64_t)(*((_QWORD *)appNameLexicons + 3) + 1);
  v27 = *((float *)appNameLexicons + 8);
  if (!v18 || (float)(v27 * (float)v18) < v26)
  {
    v28 = 1;
    if (v18 >= 3)
      v28 = (v18 & (v18 - 1)) != 0;
    v29 = v28 | (2 * v18);
    v30 = vcvtps_u32_f32(v26 / v27);
    if (v29 <= v30)
      prime = (int8x8_t)v30;
    else
      prime = (int8x8_t)v29;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v18 = *((_QWORD *)appNameLexicons + 1);
    if (*(_QWORD *)&prime > v18)
      goto LABEL_43;
    if (*(_QWORD *)&prime < v18)
    {
      v38 = vcvtps_u32_f32((float)*((unint64_t *)appNameLexicons + 3) / *((float *)appNameLexicons + 8));
      if (v18 < 3 || (v39 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v39.i16[0] = vaddlv_u8(v39), v39.u32[0] > 1uLL))
      {
        v38 = std::__next_prime(v38);
      }
      else
      {
        v40 = 1 << -(char)__clz(v38 - 1);
        if (v38 >= 2)
          v38 = v40;
      }
      if (*(_QWORD *)&prime <= v38)
        prime = (int8x8_t)v38;
      if (*(_QWORD *)&prime >= v18)
      {
        v18 = *((_QWORD *)appNameLexicons + 1);
      }
      else
      {
        if (prime)
        {
LABEL_43:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v32 = operator new(8 * *(_QWORD *)&prime);
          v33 = *(void **)appNameLexicons;
          *(_QWORD *)appNameLexicons = v32;
          if (v33)
            operator delete(v33);
          v34 = 0;
          *((int8x8_t *)appNameLexicons + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v34++) = 0;
          while (*(_QWORD *)&prime != v34);
          v35 = (_QWORD *)*v25;
          if (*v25)
          {
            v36 = v35[1];
            v37 = (uint8x8_t)vcnt_s8(prime);
            v37.i16[0] = vaddlv_u8(v37);
            if (v37.u32[0] > 1uLL)
            {
              if (v36 >= *(_QWORD *)&prime)
                v36 %= *(_QWORD *)&prime;
            }
            else
            {
              v36 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v36) = v25;
            v41 = (_QWORD *)*v35;
            if (*v35)
            {
              do
              {
                v42 = v41[1];
                if (v37.u32[0] > 1uLL)
                {
                  if (v42 >= *(_QWORD *)&prime)
                    v42 %= *(_QWORD *)&prime;
                }
                else
                {
                  v42 &= *(_QWORD *)&prime - 1;
                }
                if (v42 != v36)
                {
                  if (!*(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v42))
                  {
                    *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v42) = v35;
                    goto LABEL_68;
                  }
                  *v35 = *v41;
                  *v41 = **(_QWORD **)(*(_QWORD *)appNameLexicons + 8 * v42);
                  **(_QWORD **)(*(_QWORD *)appNameLexicons + 8 * v42) = v41;
                  v41 = v35;
                }
                v42 = v36;
LABEL_68:
                v35 = v41;
                v41 = (_QWORD *)*v41;
                v36 = v42;
              }
              while (v41);
            }
          }
          v18 = (unint64_t)prime;
          goto LABEL_72;
        }
        v56 = *(void **)appNameLexicons;
        *(_QWORD *)appNameLexicons = 0;
        if (v56)
          operator delete(v56);
        v18 = 0;
        *((_QWORD *)appNameLexicons + 1) = 0;
      }
    }
LABEL_72:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v18 <= v17)
        v3 = v17 % v18;
      else
        v3 = v17;
    }
    else
    {
      v3 = ((_DWORD)v18 - 1) & v17;
    }
  }
  v43 = *(_QWORD **)(*(_QWORD *)appNameLexicons + 8 * v3);
  if (v43)
  {
    *v24 = *v43;
  }
  else
  {
    *v24 = *((_QWORD *)appNameLexicons + 2);
    *((_QWORD *)appNameLexicons + 2) = v24;
    *(_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v3) = v25;
    if (!*v24)
      goto LABEL_86;
    v44 = *(_QWORD *)(*v24 + 8);
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v44 >= v18)
        v44 %= v18;
    }
    else
    {
      v44 &= v18 - 1;
    }
    v43 = (_QWORD *)(*(_QWORD *)appNameLexicons + 8 * v44);
  }
  *v43 = v24;
LABEL_86:
  ++*((_QWORD *)appNameLexicons + 3);
LABEL_87:
  v45 = (std::__shared_weak_count *)*((_QWORD *)&v62 + 1);
  if (*((_QWORD *)&v62 + 1))
  {
    v46 = (unint64_t *)(*((_QWORD *)&v62 + 1) + 8);
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }
  KB::String::~String((KB::String *)&v59);
  if (*((_QWORD *)&v58 + 1))
  {
    v48 = (unint64_t *)(*((_QWORD *)&v58 + 1) + 8);
    do
      v49 = __ldaxr(v48);
    while (__stlxr(v49 - 1, v48));
    if (!v49)
    {
      (*(void (**)())(**((_QWORD **)&v58 + 1) + 16))();
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v58 + 1));
    }
  }
  KB::String::~String((KB::String *)v66);
  KB::String::~String((KB::String *)v67);

LABEL_98:
  v50 = std::__hash_table<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::__unordered_map_hasher<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::hash<KB::String>,std::equal_to<KB::String>,true>,std::__unordered_map_equal<KB::String,std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>,std::equal_to<KB::String>,std::hash<KB::String>,true>,std::allocator<std::__hash_value_type<KB::String,std::shared_ptr<KB::AppTrieLoader>>>>::find<KB::String>((_QWORD *)self->_appNameLexicons, &v68);
  if (!v50)
    abort();
  (*(void (**)(char **__return_ptr))(*(_QWORD *)v50[6] + 16))(&v59);
  v51 = (std::__shared_weak_count *)v60;
  v52 = *(_LXLexicon **)v59;
  if (v60)
  {
    v53 = v60 + 1;
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
      std::__shared_weak_count::__release_weak(v51);
    }
  }
  KB::String::~String((KB::String *)&v68);
  return v52;
}

- (id)ensureSupplementalLexicons
{
  return 0;
}

- (id)supplementalLexicons
{
  return 0;
}

- (void)debugLogEntities
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (self->_namedEntityLexiconRef)
  {
    +[TITransientLexiconManagerMock getEntries:](TITransientLexiconManagerMock, "getEntries:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "componentsJoinedByString:", CFSTR("|"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Named entities %@"), v3);

    }
    else
    {
      NSLog(CFSTR("Named entities empty"));
    }

  }
  if (self->_namedEntityPhraseLexiconRef)
  {
    +[TITransientLexiconManagerMock getEntries:](TITransientLexiconManagerMock, "getEntries:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Named phrase entities %@"), v4);

    }
    else
    {
      NSLog(CFSTR("Named phrase entities empty"));
    }

  }
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5;

  if (a4 == 3)
  {
    v5 = 60;
  }
  else
  {
    if (a4 != 1)
      return;
    v5 = 64;
  }
  ++*(_DWORD *)((char *)&self->super.isa + v5);
}

- (int)offeredCount
{
  return self->_offeredCount;
}

- (void)setOfferedCount:(int)a3
{
  self->_offeredCount = a3;
}

- (int)acceptedCount
{
  return self->_acceptedCount;
}

- (void)setAcceptedCount:(int)a3
{
  self->_acceptedCount = a3;
}

- (BOOL)isSupplementalLexiconSearchEnabled
{
  return self->_supplementalLexiconSearchEnabled;
}

- (void)setSupplementalLexiconSearchEnabled:(BOOL)a3
{
  self->_supplementalLexiconSearchEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __68__TITransientLexiconManagerMock_searchHelper_forWord_caseSensitive___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  const __CFString *v8;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getLXEntryCopyStringSymbolLoc(void)::ptr;
  v13 = getLXEntryCopyStringSymbolLoc(void)::ptr;
  if (!getLXEntryCopyStringSymbolLoc(void)::ptr)
  {
    v7 = (void *)LexiconLibrary();
    v6 = dlsym(v7, "LXEntryCopyString");
    v11[3] = (uint64_t)v6;
    getLXEntryCopyStringSymbolLoc(void)::ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    dlerror();
    v9 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  v8 = (const __CFString *)((uint64_t (*)(uint64_t))v6)(a2);
  if (CFStringCompare(v8, *(CFStringRef *)(a1 + 40), *(_BYTE *)(a1 + 48) == 0) == kCFCompareEqualTo)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  CFRelease(v8);
}

+ (id)tokenizeEntity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CFLocaleRef v8;
  id v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  v7 = objc_msgSend(v5, "length");
  MEMORY[0x24BDAC7A8]();
  v13[0] = objc_msgSend(v5, "length");
  objc_msgSend(v5, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v11 - ((4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * v6, v13, 4, 0, 0, v7, 0);
  v8 = CFLocaleCreate(0, CFSTR("en_US"));
  LMStreamTokenizerCreate();
  v11[1] = MEMORY[0x24BDAC760];
  v11[2] = 3221225472;
  v11[3] = __48__TITransientLexiconManagerMock_tokenizeEntity___block_invoke;
  v11[4] = &unk_24FD48540;
  v9 = v4;
  v12 = v9;
  LMStreamTokenizerPushBytes();
  LMStreamTokenizerRelease();
  CFRelease(v8);

  return v9;
}

+ (id)getEntries:(_LXLexicon *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
}

void __48__TITransientLexiconManagerMock_tokenizeEntity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v5;
  void *v6;
  id v7;

  if ((a4 - 500) <= 0xFFFFFE0C)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
}

@end
