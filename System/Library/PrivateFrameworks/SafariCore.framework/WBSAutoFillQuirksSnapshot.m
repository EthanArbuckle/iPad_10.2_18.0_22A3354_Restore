@implementation WBSAutoFillQuirksSnapshot

- (WBSAutoFillQuirksSnapshot)init
{

  return 0;
}

- (WBSAutoFillQuirksSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  id v6;
  WBSAutoFillQuirksSnapshot *v7;
  uint64_t v8;
  NSDictionary *autoFillQuirks;
  NSDictionary *v10;
  uint64_t v11;
  NSDictionary *passwordRequirementsByDomain;
  uint64_t v13;
  NSArray *domainsWithAssociatedCredentials;
  uint64_t v15;
  NSArray *domainsIneligibleForPasswordAuditing;
  uint64_t v17;
  NSArray *domainsToConsiderIdentical;
  uint64_t v19;
  NSDictionary *changePasswordURLsByDomain;
  uint64_t v21;
  NSDictionary *appIDsToDomainsAssociations;
  uint64_t v23;
  NSSet *domainsIneligibleForAutomaticLogin;
  uint64_t v25;
  NSSet *domainsIneligibleForStreamlinedLogin;
  uint64_t v27;
  NSSet *domainsIneligibleForPasskeys;
  uint64_t v29;
  NSSet *domainsForPasskeyFallbackUI;
  uint64_t v31;
  NSSet *domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  WBSAutoFillQuirksSnapshot *v33;
  objc_super v35;

  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)WBSAutoFillQuirksSnapshot;
  v7 = -[WBSAutoFillQuirksSnapshot init](&v35, sel_init);
  if (!v7)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D80], "safari_dictionaryWithPropertyListData:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  autoFillQuirks = v7->_autoFillQuirks;
  v7->_autoFillQuirks = (NSDictionary *)v8;

  v10 = v7->_autoFillQuirks;
  if (!v10)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v33 = 0;
    goto LABEL_7;
  }
  -[WBSAutoFillQuirksSnapshot _passwordRequirementsByDomainFromAutoFillQuirks:error:](v7, "_passwordRequirementsByDomainFromAutoFillQuirks:error:", v10, a4);
  v11 = objc_claimAutoreleasedReturnValue();
  passwordRequirementsByDomain = v7->_passwordRequirementsByDomain;
  v7->_passwordRequirementsByDomain = (NSDictionary *)v11;

  -[WBSAutoFillQuirksSnapshot _domainsWithAssociatedCredentialsFromAutoFillQuirks:error:](v7, "_domainsWithAssociatedCredentialsFromAutoFillQuirks:error:", v7->_autoFillQuirks, a4);
  v13 = objc_claimAutoreleasedReturnValue();
  domainsWithAssociatedCredentials = v7->_domainsWithAssociatedCredentials;
  v7->_domainsWithAssociatedCredentials = (NSArray *)v13;

  -[WBSAutoFillQuirksSnapshot _domainsIneligibleForPasswordAuditingFromAutoFillQuirks:error:](v7, "_domainsIneligibleForPasswordAuditingFromAutoFillQuirks:error:", v7->_autoFillQuirks, a4);
  v15 = objc_claimAutoreleasedReturnValue();
  domainsIneligibleForPasswordAuditing = v7->_domainsIneligibleForPasswordAuditing;
  v7->_domainsIneligibleForPasswordAuditing = (NSArray *)v15;

  -[WBSAutoFillQuirksSnapshot _domainsToConsiderIdenticalFromAutoFillQuirls:error:](v7, "_domainsToConsiderIdenticalFromAutoFillQuirls:error:", v7->_autoFillQuirks, a4);
  v17 = objc_claimAutoreleasedReturnValue();
  domainsToConsiderIdentical = v7->_domainsToConsiderIdentical;
  v7->_domainsToConsiderIdentical = (NSArray *)v17;

  -[WBSAutoFillQuirksSnapshot _changePasswordURLStringsByDomainFromAutoFillQuirks:error:](v7, "_changePasswordURLStringsByDomainFromAutoFillQuirks:error:", v7->_autoFillQuirks, a4);
  v19 = objc_claimAutoreleasedReturnValue();
  changePasswordURLsByDomain = v7->_changePasswordURLsByDomain;
  v7->_changePasswordURLsByDomain = (NSDictionary *)v19;

  -[WBSAutoFillQuirksSnapshot _appIDsToDomainsAssociationsFromAutoFillQuirks:error:](v7, "_appIDsToDomainsAssociationsFromAutoFillQuirks:error:", v7->_autoFillQuirks, a4);
  v21 = objc_claimAutoreleasedReturnValue();
  appIDsToDomainsAssociations = v7->_appIDsToDomainsAssociations;
  v7->_appIDsToDomainsAssociations = (NSDictionary *)v21;

  -[WBSAutoFillQuirksSnapshot _domainsSetFromAutoFillQuirks:forKey:error:](v7, "_domainsSetFromAutoFillQuirks:forKey:error:", v7->_autoFillQuirks, CFSTR("DomainsIneligibleForAutomaticLogin"), a4);
  v23 = objc_claimAutoreleasedReturnValue();
  domainsIneligibleForAutomaticLogin = v7->_domainsIneligibleForAutomaticLogin;
  v7->_domainsIneligibleForAutomaticLogin = (NSSet *)v23;

  -[WBSAutoFillQuirksSnapshot _domainsSetFromAutoFillQuirks:forKey:error:](v7, "_domainsSetFromAutoFillQuirks:forKey:error:", v7->_autoFillQuirks, CFSTR("DomainsIneligibleForStreamlinedLogin"), a4);
  v25 = objc_claimAutoreleasedReturnValue();
  domainsIneligibleForStreamlinedLogin = v7->_domainsIneligibleForStreamlinedLogin;
  v7->_domainsIneligibleForStreamlinedLogin = (NSSet *)v25;

  -[WBSAutoFillQuirksSnapshot _domainsSetFromAutoFillQuirks:forKey:error:](v7, "_domainsSetFromAutoFillQuirks:forKey:error:", v7->_autoFillQuirks, CFSTR("DomainsIneligibleForPasskeys"), a4);
  v27 = objc_claimAutoreleasedReturnValue();
  domainsIneligibleForPasskeys = v7->_domainsIneligibleForPasskeys;
  v7->_domainsIneligibleForPasskeys = (NSSet *)v27;

  -[WBSAutoFillQuirksSnapshot _domainsSetFromAutoFillQuirks:forKey:error:](v7, "_domainsSetFromAutoFillQuirks:forKey:error:", v7->_autoFillQuirks, CFSTR("DomainsForPasskeyFallbackUI"), a4);
  v29 = objc_claimAutoreleasedReturnValue();
  domainsForPasskeyFallbackUI = v7->_domainsForPasskeyFallbackUI;
  v7->_domainsForPasskeyFallbackUI = (NSSet *)v29;

  -[WBSAutoFillQuirksSnapshot _domainsSetFromAutoFillQuirks:forKey:error:](v7, "_domainsSetFromAutoFillQuirks:forKey:error:", v7->_autoFillQuirks, CFSTR("DomainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices"), a4);
  v31 = objc_claimAutoreleasedReturnValue();
  domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = v7->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
  v7->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices = (NSSet *)v31;

  v33 = v7;
LABEL_7:

  return v33;
}

- (id)snapshotData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_autoFillQuirks, 200, 0, 0);
}

- (id)_passwordRequirementsByDomainFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("PasswordGenerationRequirements"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__WBSAutoFillQuirksSnapshot__passwordRequirementsByDomainFromAutoFillQuirks_error___block_invoke;
  v11[3] = &unk_1E649B8C8;
  v11[4] = &v12;
  objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*((_BYTE *)v13 + 24))
  {
    v9 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

id __83__WBSAutoFillQuirksSnapshot__passwordRequirementsByDomainFromAutoFillQuirks_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  char isKindOfClass;
  id v10;

  v7 = a3;
  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

  return v10;
}

- (id)_domainsWithAssociatedCredentialsFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  void *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id v18;
  uint64_t v20;
  id *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "safari_arrayForKey:", CFSTR("DomainsWithAssociatedCredentials"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v6 = v5 != 0;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = v8;
    v21 = a4;
    v10 = *(_QWORD *)v27;
    v20 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_20;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v23 != v16)
                objc_enumerationMutation(v13);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_20;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v15)
              continue;
            break;
          }
        }

        v10 = v20;
        if (!v6)
        {
LABEL_20:

          a4 = v21;
          goto LABEL_21;
        }
        v6 = 1;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v9)
        continue;
      break;
    }

    goto LABEL_24;
  }

  if (v5)
  {
LABEL_24:
    v18 = v7;
    goto LABEL_26;
  }
LABEL_21:
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_26:

  return v18;
}

- (id)_domainsIneligibleForPasswordAuditingFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "safari_arrayForKey:", CFSTR("SharedDomains"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0, v12);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }

          v10 = 0;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }

  v10 = v5;
LABEL_13:

  return v10;
}

- (id)_domainsToConsiderIdenticalFromAutoFillQuirls:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v18;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "safari_arrayForKey:", CFSTR("DomainsToConsiderIdentical"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v18 = *(_QWORD *)v25;
    v19 = a4;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
            *v19 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_21:

          v16 = 0;
          goto LABEL_22;
        }
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v19)
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
                  *v19 = (id)objc_claimAutoreleasedReturnValue();
                }

                goto LABEL_21;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v13)
              continue;
            break;
          }
        }

        v8 = v18;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v7)
        continue;
      break;
    }
  }

  v16 = v5;
LABEL_22:

  return v16;
}

- (id)_domainsSetFromAutoFillQuirks:(id)a3 forKey:(id)a4 error:(id *)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];

  objc_msgSend(a3, "safari_arrayForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__WBSAutoFillQuirksSnapshot__domainsSetFromAutoFillQuirks_forKey_error___block_invoke;
  v11[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v11[4] = v7;
  if (objc_msgSend(v6, "safari_allObjectsPassTest:", v11))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = (void *)v8;
    goto LABEL_9;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_9:

  return v9;
}

uint64_t __72__WBSAutoFillQuirksSnapshot__domainsSetFromAutoFillQuirks_forKey_error___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)_changePasswordURLStringsByDomainFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("ChangePasswordURLs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__WBSAutoFillQuirksSnapshot__changePasswordURLStringsByDomainFromAutoFillQuirks_error___block_invoke;
  v11[3] = &unk_1E649B8C8;
  v11[4] = &v12;
  objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*((_BYTE *)v13 + 24))
  {
    v9 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

id __87__WBSAutoFillQuirksSnapshot__changePasswordURLStringsByDomainFromAutoFillQuirks_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  char isKindOfClass;
  id v10;

  v7 = a3;
  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

  return v10;
}

- (id)_appIDsToDomainsAssociationsFromAutoFillQuirks:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  objc_msgSend(v5, "safari_dictionaryForKey:", CFSTR("AppIDsToDomainsAssociations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__WBSAutoFillQuirksSnapshot__appIDsToDomainsAssociationsFromAutoFillQuirks_error___block_invoke;
  v11[3] = &unk_1E649B8C8;
  v11[4] = &v12;
  objc_msgSend(v6, "safari_mapAndFilterKeysAndObjectsUsingBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*((_BYTE *)v13 + 24))
  {
    v9 = v7;
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

id __82__WBSAutoFillQuirksSnapshot__appIDsToDomainsAssociationsFromAutoFillQuirks_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
            *a4 = 1;

            v14 = 0;
            goto LABEL_14;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }

    v14 = v9;
LABEL_14:

  }
  else
  {
    v14 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

  return v14;
}

- (NSDictionary)passwordRequirementsByDomain
{
  return self->_passwordRequirementsByDomain;
}

- (NSArray)domainsWithAssociatedCredentials
{
  return self->_domainsWithAssociatedCredentials;
}

- (NSArray)domainsIneligibleForPasswordAuditing
{
  return self->_domainsIneligibleForPasswordAuditing;
}

- (NSArray)domainsToConsiderIdentical
{
  return self->_domainsToConsiderIdentical;
}

- (NSDictionary)changePasswordURLsByDomain
{
  return self->_changePasswordURLsByDomain;
}

- (NSDictionary)appIDsToDomainsAssociations
{
  return self->_appIDsToDomainsAssociations;
}

- (NSSet)domainsIneligibleForAutomaticLogin
{
  return self->_domainsIneligibleForAutomaticLogin;
}

- (NSSet)domainsIneligibleForStreamlinedLogin
{
  return self->_domainsIneligibleForStreamlinedLogin;
}

- (NSSet)domainsIneligibleForPasskeys
{
  return self->_domainsIneligibleForPasskeys;
}

- (NSSet)domainsForPasskeyFallbackUI
{
  return self->_domainsForPasskeyFallbackUI;
}

- (NSSet)domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices
{
  return self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsThatWhenEmbeddedAsThirdPartyAskForPasswordsForOtherServices, 0);
  objc_storeStrong((id *)&self->_domainsForPasskeyFallbackUI, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForPasskeys, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForStreamlinedLogin, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForAutomaticLogin, 0);
  objc_storeStrong((id *)&self->_appIDsToDomainsAssociations, 0);
  objc_storeStrong((id *)&self->_changePasswordURLsByDomain, 0);
  objc_storeStrong((id *)&self->_domainsToConsiderIdentical, 0);
  objc_storeStrong((id *)&self->_domainsIneligibleForPasswordAuditing, 0);
  objc_storeStrong((id *)&self->_passwordRequirementsByDomain, 0);
  objc_storeStrong((id *)&self->_domainsWithAssociatedCredentials, 0);
  objc_storeStrong((id *)&self->_autoFillQuirks, 0);
}

@end
