@implementation _WBSFieldLabelPatternMatcherFactory

- (_WBSFieldLabelPatternMatcherFactory)init
{
  _WBSFieldLabelPatternMatcherFactory *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *trie;
  _WBSFieldLabelPatternMatcherFactory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WBSFieldLabelPatternMatcherFactory;
  v2 = -[_WBSFieldLabelPatternMatcherFactory init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    trie = v2->_trie;
    v2->_trie = v3;

    v5 = v2;
  }

  return v2;
}

- (void)_addWord:(id)a3 allowingEndOfWordMatch:(BOOL)a4
{
  uint64_t v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 isWordCharacter;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = objc_msgSend(v19, "length");
  v7 = self->_trie;
  if (a4
    || !SafariShared::FieldLabelPatternMatcher::isWordCharacter((SafariShared::FieldLabelPatternMatcher *)objc_msgSend(v19, "characterAtIndex:", 0)))
  {
    v10 = v7;
    if (!v6)
    {
LABEL_13:
      v14 = v10;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 0xFFFFLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 0xFFFFLL);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v10, v15);

    }
    if (!v6)
      goto LABEL_13;
  }
  for (i = 0; i != v6; ++i)
  {
    v12 = objc_msgSend(v19, "characterAtIndex:", i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v14, v13);
    }

    v10 = v14;
  }
LABEL_14:
  isWordCharacter = SafariShared::FieldLabelPatternMatcher::isWordCharacter((SafariShared::FieldLabelPatternMatcher *)objc_msgSend(v19, "characterAtIndex:", v6 - 1));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)((__int16)(isWordCharacter << 15) >> 15));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v17, v18);

}

+ (__WBSFieldLabelPatternMatcherArray)createFieldLabelPatternMatcherArrayFromWordArrays:(id)a3 allowingEndOfWordMatches:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _WBSFieldLabelPatternMatcherFactory *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  int v15;
  unint64_t v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  WTF *v22;
  void *v23;
  WTF *v24;
  void *v25;
  WTF *v26;
  void *v27;
  void *v28;
  WTF **v29;
  WTF *v30;
  WTF *v31;
  WTF *v32;
  id obj;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  WTF *v46;
  uint64_t v47;
  WTF *v48;
  uint64_t v49;
  WTF *v50;
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  v46 = 0;
  v47 = 0;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v9 = objc_alloc_init(_WBSFieldLabelPatternMatcherFactory);
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v39 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "lowercaseString");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[_WBSFieldLabelPatternMatcherFactory _addWord:allowingEndOfWordMatch:](v9, "_addWord:allowingEndOfWordMatch:", v14, v4);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          }
          while (v11);
        }

        LOWORD(v35) = addInitializersForTrie(v9->_trie, (uint64_t)&v50, (uint64_t)&v48);
        *(_QWORD *)&v36 = HIDWORD(v51);
        v37 = HIDWORD(v49);
        v15 = HIDWORD(v47);
        if (HIDWORD(v47) == (_DWORD)v47)
        {
          v16 = WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v46, HIDWORD(v47) + 1, (unint64_t)&v35);
          v15 = HIDWORD(v47);
          v17 = (char *)v46 + 40 * HIDWORD(v47);
          v18 = *(_OWORD *)v16;
          v19 = *(_OWORD *)(v16 + 16);
          *((_QWORD *)v17 + 4) = *(_QWORD *)(v16 + 32);
        }
        else
        {
          v17 = (char *)v46 + 40 * HIDWORD(v47);
          v18 = v35;
          v19 = v36;
          *((_QWORD *)v17 + 4) = v37;
        }
        *(_OWORD *)v17 = v18;
        *((_OWORD *)v17 + 1) = v19;
        HIDWORD(v47) = v15 + 1;

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    }
    while (v5);
  }

  WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v50, HIDWORD(v51));
  WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA::State,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v48, HIDWORD(v49));
  WTF::Vector<SafariShared::FieldLabelPatternMatcher::DFA,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrinkCapacity((unsigned int *)&v46, HIDWORD(v47));
  v20 = operator new();
  v21 = HIDWORD(v47);
  v22 = v46;
  v46 = 0;
  v47 = 0;
  *(_QWORD *)v20 = v21;
  *(_QWORD *)(v20 + 8) = v22;
  WTF::fastFree(0, v23);
  v24 = v50;
  v50 = 0;
  v51 = 0;
  *(_QWORD *)(v20 + 16) = v24;
  WTF::fastFree(0, v25);
  v26 = v48;
  v48 = 0;
  v49 = 0;
  *(_QWORD *)(v20 + 24) = v26;
  WTF::fastFree(0, v27);
  if ((_DWORD)v21)
  {
    v29 = (WTF **)((char *)v22 + 24);
    do
    {
      *(v29 - 2) = v24;
      *v29 = v26;
      v29 += 5;
      --v21;
    }
    while (v21);
  }
  v30 = v46;
  if (v46)
  {
    v46 = 0;
    LODWORD(v47) = 0;
    WTF::fastFree(v30, v28);
  }
  v31 = v48;
  if (v48)
  {
    v48 = 0;
    LODWORD(v49) = 0;
    WTF::fastFree(v31, v28);
  }
  v32 = v50;
  if (v50)
  {
    v50 = 0;
    LODWORD(v51) = 0;
    WTF::fastFree(v32, v28);
  }

  return (__WBSFieldLabelPatternMatcherArray *)v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trie, 0);
}

@end
