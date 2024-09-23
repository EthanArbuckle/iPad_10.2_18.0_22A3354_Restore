@implementation SBHIconLibraryQuery

- (SBHIconLibraryQuery)initWithSearchString:(id)a3
{
  id v4;
  SBHIconLibraryQuery *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *searchString;
  uint64_t v10;
  NSUUID *queryId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHIconLibraryQuery;
  v5 = -[SBHIconLibraryQuery init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _SBHIconLibraryQueryCanonicalizedString(v4, CFSTR(" "), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    queryId = v5->_queryId;
    v5->_queryId = (NSUUID *)v10;

  }
  return v5;
}

- (SBHIconLibraryQuery)initWithMarkedTextSearchString:(id)a3 markedTextRange:(id)a4 markedTextArray:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBHIconLibraryQuery *v11;
  SBHIconLibraryQuery *v12;
  uint64_t v13;
  UITextRange *markedTextRange;
  uint64_t v15;
  NSArray *markedTextArray;
  uint64_t v17;
  void *searchString;
  void *v20;
  uint64_t v21;
  NSString *v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SBHIconLibraryQuery;
  v11 = -[SBHIconLibraryQuery init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    if (v11->_markedTextRange || v11->_markedTextArray)
    {
      v13 = objc_msgSend(v9, "copy");
      markedTextRange = v12->_markedTextRange;
      v12->_markedTextRange = (UITextRange *)v13;

      v15 = objc_msgSend(v10, "copy");
      markedTextArray = v12->_markedTextArray;
      v12->_markedTextArray = (NSArray *)v15;

      v17 = objc_msgSend(v8, "copy");
      searchString = v12->_searchString;
      v12->_searchString = (NSString *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      searchString = (void *)objc_claimAutoreleasedReturnValue();
      _SBHIconLibraryQueryCanonicalizedString(v8, CFSTR(" "), searchString);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      v22 = v12->_searchString;
      v12->_searchString = (NSString *)v21;

    }
  }

  return v12;
}

- (SBHIconLibraryQuery)init
{

  return 0;
}

- (NSPredicate)predicate
{
  NSPredicate *predicate;
  _BOOL4 v4;
  void *v5;
  NSPredicate *v6;
  NSPredicate *v7;
  NSPredicate *v8;
  NSPredicate *v9;
  _QWORD v11[4];
  id v12;
  id location;

  predicate = self->_predicate;
  if (!predicate)
  {
    objc_initWeak(&location, self);
    v4 = -[SBHIconLibraryQuery _hasSearchString](self, "_hasSearchString");
    v5 = (void *)MEMORY[0x1E0CB3880];
    if (v4)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __32__SBHIconLibraryQuery_predicate__block_invoke;
      v11[3] = &unk_1E8D8BC48;
      objc_copyWeak(&v12, &location);
      objc_msgSend(v5, "predicateWithBlock:", v11);
      v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      v7 = self->_predicate;
      self->_predicate = v6;

      objc_destroyWeak(&v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v8 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
      v9 = self->_predicate;
      self->_predicate = v8;

    }
    objc_destroyWeak(&location);
    predicate = self->_predicate;
  }
  return predicate;
}

uint64_t __32__SBHIconLibraryQuery_predicate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained[3];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v3, "iconLibraryQueryingFilterStrings", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend((id)objc_opt_class(), "string:matchesSearchString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), v5) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (BOOL)string:(id)a3 matchesSearchString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  void (**v15)(void *, id);
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "localizedCaseInsensitiveContainsString:", v6);
  if ((v7 & 1) != 0
    || (__50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke(v7, v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke((uint64_t)v8, v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "localizedCaseInsensitiveContainsString:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3780], "punctuationCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formUnionWithCharacterSet:", v13);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke_2;
    aBlock[3] = &unk_1E8D8BC70;
    v20 = v12;
    v14 = v12;
    v15 = (void (**)(void *, id))_Block_copy(aBlock);
    v15[2](v15, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v16, "localizedCaseInsensitiveContainsString:", v17);

  }
  return v11;
}

id __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _SBHIconLibraryQueryCanonicalizedString(v3, &stru_1E8D8E958, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __50__SBHIconLibraryQuery_string_matchesSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  return _SBHIconLibraryQueryCanonicalizedString(a2, &stru_1E8D8E958, *(void **)(a1 + 32));
}

- (id)aToZComparator
{
  return &__block_literal_global_9_0;
}

uint64_t __37__SBHIconLibraryQuery_aToZComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "iconLibraryQueryingAlphaSortString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconLibraryQueryingAlphaSortString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)prefixComparator
{
  void *v2;
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v2 = (void *)-[NSString copy](self->_searchString, "copy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__SBHIconLibraryQuery_prefixComparator__block_invoke;
  aBlock[3] = &unk_1E8D8BC98;
  v7 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

uint64_t __39__SBHIconLibraryQuery_prefixComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(a2, "iconLibraryQueryingAlphaSortString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconLibraryQueryingAlphaSortString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "localizedStandardRangeOfString:", *(_QWORD *)(a1 + 32));
  v9 = (v8 == 0) ^ (objc_msgSend(v7, "localizedStandardRangeOfString:", *(_QWORD *)(a1 + 32)) != 0);
  v10 = -1;
  if (v8)
    v10 = 1;
  if (v9)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

- (id)_composeComparator:(id)a3 andComparator:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SBHIconLibraryQuery__composeComparator_andComparator___block_invoke;
  v11[3] = &unk_1E8D8BCC0;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = _Block_copy(v11);

  return v9;
}

uint64_t __56__SBHIconLibraryQuery__composeComparator_andComparator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (!v7)
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v7;
}

- (id)comparator
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[SBHIconLibraryQuery aToZComparator](self, "aToZComparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHIconLibraryQuery _hasSearchString](self, "_hasSearchString"))
  {
    -[SBHIconLibraryQuery prefixComparator](self, "prefixComparator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryQuery _composeComparator:andComparator:](self, "_composeComparator:andComparator:", v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  v6 = _Block_copy(v3);

  return v6;
}

- (BOOL)_hasSearchString
{
  return -[NSString length](self->_searchString, "length") != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQuery searchString](self, "searchString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __31__SBHIconLibraryQuery_isEqual___block_invoke;
  v29[3] = &unk_1E8D8BCE8;
  v8 = v4;
  v30 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v29);

  -[SBHIconLibraryQuery keyboardLanguageHint](self, "keyboardLanguageHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __31__SBHIconLibraryQuery_isEqual___block_invoke_2;
  v27[3] = &unk_1E8D8BCE8;
  v11 = v8;
  v28 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v27);

  -[SBHIconLibraryQuery markedTextRange](self, "markedTextRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __31__SBHIconLibraryQuery_isEqual___block_invoke_3;
  v25[3] = &unk_1E8D8BD10;
  v14 = v11;
  v26 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v25);

  -[SBHIconLibraryQuery markedTextArray](self, "markedTextArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7;
  v21 = 3221225472;
  v22 = __31__SBHIconLibraryQuery_isEqual___block_invoke_4;
  v23 = &unk_1E8D8BD10;
  v24 = v14;
  v17 = v14;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", v16, &v20);

  LOBYTE(v16) = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);
  return (char)v16;
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "searchString");
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyboardLanguageHint");
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markedTextRange");
}

uint64_t __31__SBHIconLibraryQuery_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markedTextArray");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryQuery searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[SBHIconLibraryQuery keyboardLanguageHint](self, "keyboardLanguageHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  -[SBHIconLibraryQuery markedTextRange](self, "markedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[SBHIconLibraryQuery markedTextArray](self, "markedTextArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = objc_msgSend(v3, "hash");
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMarkedTextSearchString:markedTextRange:markedTextArray:", self->_searchString, self->_markedTextRange, self->_markedTextArray);
  -[SBHIconLibraryQuery keyboardLanguageHint](self, "keyboardLanguageHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardLanguageHint:", v5);

  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_queryId, CFSTR("queryId"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_markedTextRange, CFSTR("markedTextRange"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_markedTextArray, CFSTR("markedTextArray"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)keyboardLanguageHint
{
  return self->_keyboardLanguageHint;
}

- (void)setKeyboardLanguageHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UITextRange)markedTextRange
{
  return self->_markedTextRange;
}

- (NSArray)markedTextArray
{
  return self->_markedTextArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedTextArray, 0);
  objc_storeStrong((id *)&self->_markedTextRange, 0);
  objc_storeStrong((id *)&self->_keyboardLanguageHint, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_queryId, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
