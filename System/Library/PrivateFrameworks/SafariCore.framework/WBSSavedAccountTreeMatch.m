@implementation WBSSavedAccountTreeMatch

- (WBSSavedAccountTreeMatch)initWithDomain:(id)a3 savedAccountTree:(id)a4 matchLevel:(int64_t)a5
{
  id v8;
  id v9;
  WBSSavedAccountTreeMatch *v10;
  uint64_t v11;
  NSString *domain;
  uint64_t v13;
  NSMutableDictionary *accountStoreTreeMatchingSearchCriteria;
  WBSSavedAccountTreeMatch *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WBSSavedAccountTreeMatch;
  v10 = -[WBSSavedAccountTreeMatch init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    domain = v10->_domain;
    v10->_domain = (NSString *)v11;

    deepMutableDictionaryCopy(v9);
    v13 = objc_claimAutoreleasedReturnValue();
    accountStoreTreeMatchingSearchCriteria = v10->_accountStoreTreeMatchingSearchCriteria;
    v10->_accountStoreTreeMatchingSearchCriteria = (NSMutableDictionary *)v13;

    v10->_matchLevel = a5;
    v15 = v10;
  }

  return v10;
}

- (NSMutableArray)flattenedSavedAccountsFromTree
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allValues](self->_accountStoreTreeMatchingSearchCriteria, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(v9, "allValues", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v17;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v17 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  return (NSMutableArray *)v3;
}

- (void)pruneEmptyUsernameTrees
{
  -[NSMutableDictionary removeObjectForKey:](self->_accountStoreTreeMatchingSearchCriteria, "removeObjectForKey:", &stru_1E64A2498);
}

- (void)pruneDontSaveTrees
{
  NSMutableDictionary *accountStoreTreeMatchingSearchCriteria;
  id v3;

  accountStoreTreeMatchingSearchCriteria = self->_accountStoreTreeMatchingSearchCriteria;
  +[WBSDontSaveMarker dontSaveMarker](WBSDontSaveMarker, "dontSaveMarker");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](accountStoreTreeMatchingSearchCriteria, "removeObjectForKey:", v3);

}

- (void)pruneUsernameTreesNotMatchingPartialUsername:(id)a3 orPasskeyIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  WBSSavedAccountTreeMatch *v21;
  id v22;
  id v23;
  id v24;

  v18 = a3;
  v6 = a4;
  if (objc_msgSend(v18, "length"))
  {
    objc_msgSend(v6, "safari_setByApplyingBlock:", &__block_literal_global_58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "hasPrefix:", CFSTR("+1")))
    {
      objc_msgSend(v18, "substringFromIndex:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("@"), v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v11 = v10;
    else
      v11 = v18;
    v12 = v11;
    -[NSMutableDictionary allKeys](self->_accountStoreTreeMatchingSearchCriteria, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __94__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingPartialUsername_orPasskeyIdentifiers___block_invoke_2;
    v19[3] = &unk_1E64A0040;
    v20 = v12;
    v21 = self;
    v22 = v18;
    v23 = v8;
    v24 = v7;
    v14 = v7;
    v15 = v8;
    v16 = v12;
    objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectsForKeys:](self->_accountStoreTreeMatchingSearchCriteria, "removeObjectsForKeys:", v17);
  }

}

uint64_t __94__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingPartialUsername_orPasskeyIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "credentialID");
}

uint64_t __94__WBSSavedAccountTreeMatch_pruneUsernameTreesNotMatchingPartialUsername_orPasskeyIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  char v5;
  BOOL v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 9);
  v5 = objc_msgSend((id)objc_opt_class(), "userNameString:matchesPotentiallyObfuscatedUserNameString:", v3, *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 56), "length"))
    v6 = objc_msgSend(v3, "rangeOfString:options:", *(_QWORD *)(a1 + 56), 9) == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 1;
  v7 = v6 & ~v5;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = v7;
  else
    v8 = 0;
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v22 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", v3);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        v12 = 0;
        v24 = v10;
        do
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v12);
          if ((objc_msgSend(v13, "integerValue") & 2) != 0)
          {
            objc_msgSend(v23, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v27;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v27 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(a1 + 64);
                  objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "passkeyCredentialID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v19) = objc_msgSend(v19, "containsObject:", v20);

                  v8 &= v19 ^ 1;
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              }
              while (v16);
            }

            v10 = v24;
          }
          ++v12;
        }
        while (v12 != v10);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v10);
    }

    v3 = v22;
  }

  return v8 & 1;
}

+ (BOOL)userNameString:(id)a3 matchesPotentiallyObfuscatedUserNameString:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  unint64_t i;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (v7 == objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("*•"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v9 = 0;
      for (i = 0; i != v7; v9 = i >= v7)
      {
        v11 = objc_msgSend(v6, "characterAtIndex:", i);
        if ((objc_msgSend(v8, "characterIsMember:", v11) & 1) == 0
          && objc_msgSend(v5, "characterAtIndex:", i) != (_DWORD)v11)
        {
          break;
        }
        ++i;
      }
    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  __CFString *v22;
  uint64_t v23;
  __int16 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "safari_setByApplyingBlock:", &__block_literal_global_11_3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allValues](self->_accountStoreTreeMatchingSearchCriteria, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(obj);
        v19 = v5;
        v6 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v5);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v6, "allKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v26 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKeyedSubscript:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "integerValue");
              v20[0] = MEMORY[0x1E0C809B0];
              v20[1] = 3221225472;
              v20[2] = __82__WBSSavedAccountTreeMatch_pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers___block_invoke_2;
              v20[3] = &unk_1E64A0088;
              v23 = v14;
              v15 = v4;
              v24 = 256;
              v21 = v15;
              v22 = &stru_1E64A2498;
              objc_msgSend(v13, "safari_removeObjectsPassingTest:", v20);
              if (!objc_msgSend(v13, "count"))
                objc_msgSend(v6, "removeObjectForKey:", v12);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v9);
        }

        v5 = v19 + 1;
      }
      while (v19 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v18);
  }

}

uint64_t __82__WBSSavedAccountTreeMatch_pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "credentialID");
}

uint64_t __82__WBSSavedAccountTreeMatch_pruneTreesWithoutPasswordOrMatchingPasskeyIdentifiers___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;
  void *v8;
  int v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if ((a1[6] & 2) != 0)
  {
    v5 = (void *)a1[4];
    objc_msgSend(v3, "passkeyCredentialID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
    {
      v7 = (unsigned __int8 *)(a1 + 7);
      goto LABEL_8;
    }
    if (a1[6] == 2)
    {
      v7 = (unsigned __int8 *)a1 + 57;
      goto LABEL_8;
    }
  }
  objc_msgSend(v4, "password");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

  v7 = (unsigned __int8 *)(a1 + 7);
  if (v9)
    v7 = (unsigned __int8 *)a1 + 57;
LABEL_8:
  v10 = *v7;

  return v10;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSDictionary)accountStoreTreeMatchingSearchCriteria
{
  return &self->_accountStoreTreeMatchingSearchCriteria->super;
}

- (int64_t)matchLevel
{
  return self->_matchLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_accountStoreTreeMatchingSearchCriteria, 0);
}

@end
