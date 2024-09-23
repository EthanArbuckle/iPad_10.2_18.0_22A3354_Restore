@implementation WBSPasswordAuditor

- (WBSPasswordAuditor)init
{

  return 0;
}

- (WBSPasswordAuditor)initWithSavedAccountStore:(id)a3 autoFillQuirksManager:(id)a4
{
  id v7;
  id v8;
  WBSPasswordAuditor *v9;
  WBSPasswordAuditor *v10;
  WBSPasswordAuditor *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSPasswordAuditor;
  v9 = -[WBSPasswordAuditor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_savedAccountStore, a3);
    objc_storeStrong((id *)&v10->_autoFillQuirksManager, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)_savedAccountQualifiesForReuseAuditing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highLevelDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "userIsNeverSaveMarker");

  if ((v7 & 1) == 0
    && objc_msgSend(v6, "length")
    && objc_msgSend(v5, "length")
    && !+[WBSPasswordGenerationManager passwordLooksLikePasswordManagerGeneratedPassword:](WBSPasswordGenerationManager, "passwordLooksLikePasswordManagerGeneratedPassword:", v5))
  {
    -[WBSAutoFillQuirksManager passwordAuditingEligibleDomainsManager](self->_autoFillQuirksManager, "passwordAuditingEligibleDomainsManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "domainsIneligibleForPasswordAuditing");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "containsObject:", v6) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_passwordIsReused:(id)a3 byOtherSavedAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0
    && -[WBSPasswordAuditor _savedAccountQualifiesForReuseAuditing:](self, "_savedAccountQualifiesForReuseAuditing:", v6)&& -[WBSPasswordAuditor _savedAccountQualifiesForReuseAuditing:](self, "_savedAccountQualifiesForReuseAuditing:", v7))
  {
    objc_msgSend(v6, "highLevelDomain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "highLevelDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0
      || (objc_msgSend(v6, "password"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "password"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "isEqualToString:", v11),
          v11,
          v10,
          !v12))
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      -[WBSAutoFillQuirksManager associatedDomainsManager](self->_autoFillQuirksManager, "associatedDomainsManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "domainsWithAssociatedCredentialsForDomain:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_msgSend(v14, "containsObject:", v9) ^ 1;
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (BOOL)accountStoreHasDuplicatedPasswords
{
  void *v3;
  id v4;
  char v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[WBSSavedAccountStore savedAccountsWithPasswords](self->_savedAccountStore, "savedAccountsWithPasswords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke;
  v7[3] = &unk_1E649D7A0;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t v17;

  v13 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_savedAccountQualifiesForReuseAuditing:", v13);
  v8 = v13;
  if (v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke_2;
    v14[3] = &unk_1E649D778;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v17 = a3;
    v14[4] = v9;
    v11 = v13;
    v12 = *(_QWORD *)(a1 + 48);
    v15 = v11;
    v16 = v12;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a4 = 1;

    v8 = v13;
  }

}

void __56__WBSPasswordAuditor_accountStoreHasDuplicatedPasswords__block_invoke_2(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  int v8;
  int v9;
  id v10;

  v7 = a2;
  if (*(_QWORD *)(a1 + 56) < a3)
  {
    v10 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "_savedAccountQualifiesForReuseAuditing:");
    v7 = v10;
    if (v8)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "_passwordIsReused:byOtherSavedAccount:", *(_QWORD *)(a1 + 40), v10);
      v7 = v10;
      if (v9)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

}

- (BOOL)savedAccountIsReused:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WBSPasswordAuditor _savedAccountQualifiesForReuseAuditing:](self, "_savedAccountQualifiesForReuseAuditing:", v4))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[WBSSavedAccountStore savedAccountsWithPasswords](self->_savedAccountStore, "savedAccountsWithPasswords", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (-[WBSPasswordAuditor _savedAccountQualifiesForReuseAuditing:](self, "_savedAccountQualifiesForReuseAuditing:", v10)&& -[WBSPasswordAuditor _passwordIsReused:byOtherSavedAccount:](self, "_passwordIsReused:byOtherSavedAccount:", v4, v10))
          {
            v11 = 1;
            goto LABEL_14;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_14:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)savedAccount:(id)a3 reusesPasswordWithAccountInSavedAccounts:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[WBSPasswordAuditor _passwordIsReused:byOtherSavedAccount:](self, "_passwordIsReused:byOtherSavedAccount:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v6, (_QWORD)v14))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)savedAccountsWithDuplicatedPassword:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  WBSPasswordAuditor *v12;
  id v13;

  v4 = a3;
  if (-[WBSPasswordAuditor _savedAccountQualifiesForReuseAuditing:](self, "_savedAccountQualifiesForReuseAuditing:", v4))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSavedAccountStore savedAccountsWithPasswords](self->_savedAccountStore, "savedAccountsWithPasswords");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__WBSPasswordAuditor_savedAccountsWithDuplicatedPassword___block_invoke;
    v10[3] = &unk_1E649D7C8;
    v11 = v5;
    v12 = self;
    v13 = v4;
    v7 = v5;
    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __58__WBSPasswordAuditor_savedAccountsWithDuplicatedPassword___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "highLevelDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 40), "_passwordIsReused:byOtherSavedAccount:", v3, *(_QWORD *)(a1 + 48)))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
    v5 = 1;
  }

  return v5;
}

- (id)duplicatePasswordsInPasswords:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t);
  void *v14;
  WBSPasswordAuditor *v15;
  id v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke;
  v14 = &unk_1E649D818;
  v15 = self;
  v16 = v5;
  v17 = v4;
  v18 = v6;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);

  return v9;
}

void __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_savedAccountQualifiesForReuseAuditing:")
    && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10) & 1) == 0)
  {
    v5 = a3 + 1;
    v6 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v5, *(_QWORD *)(a1 + 56) - v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke_2;
    v11[3] = &unk_1E649D7F0;
    v8 = *(id *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 32);
    v12 = v8;
    v13 = v9;
    v14 = v10;
    objc_msgSend(v6, "enumerateObjectsAtIndexes:options:usingBlock:", v7, 0, v11);

  }
}

void __52__WBSPasswordAuditor_duplicatePasswordsInPasswords___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "_savedAccountQualifiesForReuseAuditing:", v3)
    && objc_msgSend(*(id *)(a1 + 40), "_passwordIsReused:byOtherSavedAccount:", *(_QWORD *)(a1 + 48), v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

- (WBSSavedAccountStore)savedAccountStore
{
  return self->_savedAccountStore;
}

- (WBSAutoFillQuirksManager)autoFillQuirksManager
{
  return self->_autoFillQuirksManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_savedAccountStore, 0);
}

@end
