@implementation WFEmailTrigger

id __63__WFEmailTrigger_ContentInput__contentCollectionWithEventInfo___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;

  v2 = (objc_class *)MEMORY[0x1E0D13F50];
  v3 = a2;
  v18 = [v2 alloc];
  objc_msgSend(MEMORY[0x1E0D15C58], "identifierKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "accountIdentifierKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "subjectKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "recipientsKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v18, "initWithIdentifier:accountIdentifier:subject:sender:recipients:", v4, v6, v8, v10, v12);
  v14 = (void *)MEMORY[0x1E0D13F68];
  objc_msgSend(v13, "subject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "itemWithObject:named:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
