@implementation WFMessageTrigger

id __65__WFMessageTrigger_ContentInput__contentCollectionWithEventInfo___block_invoke(uint64_t a1, void *a2)
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
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v2 = (objc_class *)MEMORY[0x1E0D13FF8];
  v3 = a2;
  v16 = [v2 alloc];
  objc_msgSend(MEMORY[0x1E0D15C58], "contentKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "conversationIdentifierKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "recipientContactIDsKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "recipientsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderContactIDKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C58], "senderHandlesKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v16, "initWithContent:conversationID:recipientContactIDs:recipients:senderContactID:senderHandles:", v4, v5, v6, v8, v10, v12);
  objc_msgSend(MEMORY[0x1E0D14000], "itemWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
