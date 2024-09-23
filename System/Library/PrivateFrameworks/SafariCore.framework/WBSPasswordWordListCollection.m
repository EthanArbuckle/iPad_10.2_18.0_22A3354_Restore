@implementation WBSPasswordWordListCollection

- (WBSPasswordWordListCollection)init
{
  WBSPasswordWordListCollection *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *wordListsByIdentifiers;
  WBSPasswordWordListCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSPasswordWordListCollection;
  v2 = -[WBSPasswordWordListCollection init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    wordListsByIdentifiers = v2->_wordListsByIdentifiers;
    v2->_wordListsByIdentifiers = v3;

    v5 = v2;
  }

  return v2;
}

- (void)addWordList:(id)a3
{
  NSMutableDictionary *wordListsByIdentifiers;
  id v4;
  id v5;

  wordListsByIdentifiers = self->_wordListsByIdentifiers;
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](wordListsByIdentifiers, "setObject:forKeyedSubscript:", v4, v5);

}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_wordListsByIdentifiers, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "enumerateEntriesForString:withBlock:", v6, v7);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)entriesForString:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__WBSPasswordWordListCollection_entriesForString___block_invoke;
  v9[3] = &unk_1E649E710;
  v7 = v6;
  v10 = v7;
  -[WBSPasswordWordListCollection enumerateEntriesForString:withBlock:](self, "enumerateEntriesForString:withBlock:", v5, v9);

  return v7;
}

uint64_t __50__WBSPasswordWordListCollection_entriesForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)commonPasswordWordListCollection
{
  WBSPasswordWordListCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WBSPasswordOrderedSetWordList *v8;
  void *v9;
  WBSPasswordOrderedSetWordList *v10;

  v2 = objc_alloc_init(WBSPasswordWordListCollection);
  +[WBSPasswordLexiconWordList lexiconWordListWithIdentifier:localeIdentifier:](WBSPasswordLexiconWordList, "lexiconWordListWithIdentifier:localeIdentifier:", CFSTR("EnglishLexicon"), CFSTR("en"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[WBSPasswordWordListCollection addWordList:](v2, "addWordList:", v3);
  objc_msgSend(MEMORY[0x1E0CB34D0], "safari_safariCoreBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("WBSCommonPasswords"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_arrayForKey:", CFSTR("CommonPasswords"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WBSPasswordOrderedSetWordList initWithIdentifier:isSensitive:orderedWordsArray:]([WBSPasswordOrderedSetWordList alloc], "initWithIdentifier:isSensitive:orderedWordsArray:", CFSTR("CommonPasswords"), 0, v7);
  -[WBSPasswordWordListCollection addWordList:](v2, "addWordList:", v8);
  objc_msgSend(v6, "safari_arrayForKey:", CFSTR("CommonSensitivePasswords"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WBSPasswordOrderedSetWordList initWithIdentifier:isSensitive:orderedWordsArray:]([WBSPasswordOrderedSetWordList alloc], "initWithIdentifier:isSensitive:orderedWordsArray:", CFSTR("CommonSensitivePasswords"), 1, v9);
  -[WBSPasswordWordListCollection addWordList:](v2, "addWordList:", v10);

  return v2;
}

+ (id)commonPasscodeWordListCollection
{
  WBSPasswordWordListCollection *v2;
  void *v3;
  WBSPasswordOrderedSetWordList *v4;

  v2 = objc_alloc_init(WBSPasswordWordListCollection);
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObjects:", CFSTR("0102"), CFSTR("0103"), CFSTR("0111"), CFSTR("1101"), CFSTR("1102"), CFSTR("1103"), CFSTR("1110"), CFSTR("1112"), CFSTR("1123"), CFSTR("1201"), CFSTR("1202"), CFSTR("1203"), CFSTR("1210"), CFSTR("1211"), CFSTR("2229"), CFSTR("2580"), CFSTR("5683"),
    CFSTR("7465"),
    CFSTR("030379"),
    CFSTR("101471"),
    CFSTR("123654"),
    CFSTR("147258"),
    CFSTR("159753"),
    CFSTR("321654"),
    CFSTR("520131"),
    CFSTR("789456"),
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBSPasswordOrderedSetWordList initWithIdentifier:isSensitive:orderedWords:]([WBSPasswordOrderedSetWordList alloc], "initWithIdentifier:isSensitive:orderedWords:", CFSTR("CommonPasscodes"), 0, v3);
  -[WBSPasswordWordListCollection addWordList:](v2, "addWordList:", v4);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordListsByIdentifiers, 0);
}

@end
