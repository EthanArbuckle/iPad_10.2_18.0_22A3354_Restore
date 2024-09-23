@implementation SFStrongPasswordGenerator

- (SFStrongPasswordGenerator)init
{
  SFStrongPasswordGenerator *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  WBSPasswordGenerationManager *passwordGenerationManager;
  SFStrongPasswordGenerator *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFStrongPasswordGenerator;
  v2 = -[SFStrongPasswordGenerator init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE82CA8]);
    objc_msgSend(MEMORY[0x24BDD1488], "safari_safariCoreBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("WBSAutoFillQuirks"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_autoFillQuirksDownloadDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithBuiltInQuirksURL:downloadsDirectoryURL:resourceName:resourceVersion:updateDateDefaultsKey:updateInterval:", v5, v7, CFSTR("AutoFillQuirks"), CFSTR("1"), &stru_24C9367F0, 0.0);

    objc_msgSend(v8, "setShouldAttemptToDownloadConfiguration:", 0);
    objc_msgSend(v8, "beginLoadingQuirksFromDisk");
    objc_msgSend(v8, "passwordGenerationManager");
    v9 = objc_claimAutoreleasedReturnValue();
    passwordGenerationManager = v2->_passwordGenerationManager;
    v2->_passwordGenerationManager = (WBSPasswordGenerationManager *)v9;

    v11 = v2;
  }

  return v2;
}

- (id)generatedPasswordForAppWithAppID:(id)a3 associatedDomains:(id)a4 passwordRules:(id)a5 confirmPasswordRules:(id)a6
{
  return -[SFStrongPasswordGenerator generatedPasswordForAppWithAssociatedDomains:passwordRules:confirmPasswordRules:](self, "generatedPasswordForAppWithAssociatedDomains:passwordRules:confirmPasswordRules:", a4, a5, a6);
}

- (id)generatedPasswordForAppWithAssociatedDomains:(id)a3 passwordRules:(id)a4 confirmPasswordRules:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "length");
  v12 = objc_msgSend(v10, "length");
  if (v11 | v12)
  {
    v13 = (void *)v12;
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BE82D40], "parsePasswordRules:error:", v9, 0);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    if (!v13)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BE82D40], "parsePasswordRules:error:", v10, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    if (v11 && v14)
    {
      objc_msgSend(MEMORY[0x24BE82D40], "mergePasswordRuleSet:withPasswordRuleSet:", v11, v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v14)
      {
LABEL_26:
        objc_msgSend(MEMORY[0x24BE82D20], "requirementsForPasswordRuleSet:respectingMinLength:maxLength:", v11, 0, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSPasswordGenerationManager generatedPasswordMatchingRequirements:](self->_passwordGenerationManager, "generatedPasswordMatchingRequirements:", v26);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
        goto LABEL_28;
      }
      v15 = v14;
      v13 = v15;
    }
    v25 = (uint64_t)v15;

    v11 = v25;
    goto LABEL_26;
  }
  if (objc_msgSend(v8, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v8;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          -[WBSPasswordGenerationManager defaultRequirementsForDomain:](self->_passwordGenerationManager, "defaultRequirementsForDomain:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), (_QWORD)v28);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            goto LABEL_19;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v18)
          continue;
        break;
      }
    }
    v22 = 0;
LABEL_19:

    v23 = (void *)MEMORY[0x24BDBD1B8];
    if (v22)
      v23 = v22;
    v11 = v23;

    -[WBSPasswordGenerationManager generatedPasswordMatchingRequirements:](self->_passwordGenerationManager, "generatedPasswordMatchingRequirements:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  -[WBSPasswordGenerationManager generatedPasswordMatchingRequirements:](self->_passwordGenerationManager, "generatedPasswordMatchingRequirements:", MEMORY[0x24BDBD1B8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passwordGenerationManager, 0);
}

@end
