@implementation WFEmailTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForRecentEmails");
}

- (id)contextStorePredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(a1, "selectedSubject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "subjectKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSubject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "subjectKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSubject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedRecipients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedRecipients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "recipientsKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedRecipients");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSenders");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSenders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedSenders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedAccountIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedAccountIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "accountIdentifierKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "selectedAccountIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "predicateForKeyPath:withFormat:", v21, v15, v22, v14, v20, v19, v13, v18, v12, v11, v10, v2, v3, v9, v4, v5, v6,
    v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setEvaluateOnEveryKeyPathUpdate:", 1);
  return v17;
}

- (uint64_t)contextStoreQualityOfService
{
  return 21;
}

@end
