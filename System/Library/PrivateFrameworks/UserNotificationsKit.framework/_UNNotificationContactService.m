@implementation _UNNotificationContactService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance___sharedInstance;
}

- (_UNNotificationContactService)initWithResolver:(id)a3
{
  id v5;
  _UNNotificationContactService *v6;
  NSCache *v7;
  NSCache *resultsByServiceRecord;
  CNContactStore *v9;
  CNContactStore *curatedContactStore;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContactService;
  v6 = -[_UNNotificationContactService init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    resultsByServiceRecord = v6->_resultsByServiceRecord;
    v6->_resultsByServiceRecord = v7;

    -[NSCache setCountLimit:](v6->_resultsByServiceRecord, "setCountLimit:", 100);
    objc_storeStrong((id *)&v6->_resolver, a3);
    v9 = (CNContactStore *)objc_alloc_init(MEMORY[0x24BDBACF8]);
    curatedContactStore = v6->_curatedContactStore;
    v6->_curatedContactStore = v9;

  }
  return v6;
}

- (id)updateServiceWithContact:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _UNCNContactResolver *resolver;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UNNotificationContactService *v19;
  void *v20;
  void *v21;
  void *v22;
  _UNNotificationContactService *v24;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isCNContactIdentifierSuggested") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "cnContactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  resolver = self->_resolver;
  v10 = objc_msgSend(v6, "handleType");
  if (v10 == 1)
  {
    objc_msgSend(v6, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v6, "handleType");
  if (v12 == 2)
  {
    objc_msgSend(v6, "handle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v6, "customIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "handleType"))
  {
    -[_UNCNContactResolver resultForContactIdentifier:emailAddress:phoneNumber:userIdentifier:username:bundleIdentifier:](resolver, "resultForContactIdentifier:emailAddress:phoneNumber:userIdentifier:username:bundleIdentifier:", v8, v11, v13, v14, 0, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "handle");
    v24 = self;
    v16 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNCNContactResolver resultForContactIdentifier:emailAddress:phoneNumber:userIdentifier:username:bundleIdentifier:](resolver, "resultForContactIdentifier:emailAddress:phoneNumber:userIdentifier:username:bundleIdentifier:", v16, v11, v13, v14, v17, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v16;
    self = v24;
  }

  if (v12 == 2)
  if (v10 == 1)

  if (v15 && (objc_msgSend(v15, "isSuggestedContact") & 1) == 0)
  {
    v18 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v15, "cnContactFullname");
    v19 = self;
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCnContactFullname:", v21);

    objc_msgSend(v15, "cnContactIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCnContactIdentifier:", v22);

    v8 = v20;
    objc_msgSend(v18, "setCnContactIdentifierSuggested:", objc_msgSend(v15, "isMatchTypeSuggested"));
    -[_UNNotificationContactService _setResult:forContact:bundleIdentifier:](v19, "_setResult:forContact:bundleIdentifier:", v15, v18, v7);
  }
  else
  {
    -[_UNNotificationContactService _setResult:forContact:bundleIdentifier:](self, "_setResult:forContact:bundleIdentifier:", 0, v6, v7);
    v18 = 0;
  }

  return v18;
}

- (id)curatedContactMatchDetailsForContact:(id)a3 bundleIdentifier:(id)a4
{
  void *v4;
  void *v5;
  _UNNotificationContactServiceMatchDetails *v6;
  _UNNotificationContactServiceMatchDetails *v7;
  void *v8;
  void *v9;

  -[_UNNotificationContactService _matchForContact:bundleIdentifier:](self, "_matchForContact:bundleIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isSuggestedContact") & 1) == 0)
  {
    v7 = [_UNNotificationContactServiceMatchDetails alloc];
    objc_msgSend(v5, "cnContactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cnContactFullname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_UNNotificationContactServiceMatchDetails initWithCnContactIdentifier:cnContactFullname:isSuggestedContact:](v7, "initWithCnContactIdentifier:cnContactFullname:isSuggestedContact:", v8, v9, objc_msgSend(v5, "isMatchTypeSuggested"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)curatedContactForContact:(id)a3 bundleIdentifier:(id)a4 keysToFetch:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CNContactStore *curatedContactStore;
  void *v15;
  id v16;
  id v18;

  v8 = a3;
  v9 = a5;
  -[_UNNotificationContactService _matchForContact:bundleIdentifier:](self, "_matchForContact:bundleIdentifier:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isStrongestMatch") & 1) != 0)
    v12 = v11;
  else
    v12 = v8;
  objc_msgSend(v12, "cnContactIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    curatedContactStore = self->_curatedContactStore;
    v18 = 0;
    -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](curatedContactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v13, v9, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    if (v16 && os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
      -[_UNNotificationContactService curatedContactForContact:bundleIdentifier:keysToFetch:].cold.1();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)confirmCuratedContactSuggestion:(BOOL)a3 forContact:(id)a4 bundleIdentifier:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[_UNNotificationContactService _matchForContact:bundleIdentifier:](self, "_matchForContact:bundleIdentifier:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "isMatchTypeSuggested"))
    {
      -[_UNCNContactResolver confirm:match:](self->_resolver, "confirm:match:", v6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UNNotificationContactService _setResult:forContact:bundleIdentifier:](self, "_setResult:forContact:bundleIdentifier:", v12, v8, v9);

    }
    else if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
    {
      -[_UNNotificationContactService confirmCuratedContactSuggestion:forContact:bundleIdentifier:].cold.2();
    }
  }
  else if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
  {
    -[_UNNotificationContactService confirmCuratedContactSuggestion:forContact:bundleIdentifier:].cold.1();
  }

}

- (BOOL)canAddToCuratedContacts:(id)a3 bundleIdentifier:(id)a4
{
  void *v4;
  char v5;

  -[_UNNotificationContactService _matchForContact:bundleIdentifier:](self, "_matchForContact:bundleIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStrongestMatch") ^ 1;

  return v5;
}

- (id)newCuratedContactForContact:(id)a3 imageData:(id)a4 bundleIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBACA0], "contactWithDisplayName:handleStrings:", v10, MEMORY[0x24BDBD1A8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "mutableCopy");

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBAD50]);
  }
  v13 = objc_msgSend(v7, "handleType");
  if (!v13)
  {
    v18 = objc_alloc(MEMORY[0x24BDBADB0]);
    objc_msgSend(v7, "handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v18, "initWithUrlString:username:userIdentifier:service:displayname:teamIdentifier:bundleIdentifiers:", 0, v19, v20, v21, v10, 0, v22);

    v23 = objc_alloc(MEMORY[0x24BDBAD38]);
    objc_msgSend(v16, "service");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v23, "initWithLabel:value:", v24, v16);

    v29 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSocialProfiles:", v25);
LABEL_10:

    goto LABEL_11;
  }
  if (v13 == 2)
  {
    v26 = objc_alloc(MEMORY[0x24BDBAD88]);
    objc_msgSend(v7, "handle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v26, "initWithStringValue:", v27);

    objc_msgSend(MEMORY[0x24BDBAD38], "labeledValueWithLabel:value:", 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPhoneNumbers:", v25);
    goto LABEL_10;
  }
  if (v13 != 1)
    goto LABEL_12;
  v14 = (void *)MEMORY[0x24BDBAD38];
  objc_msgSend(v7, "handle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "labeledValueWithLabel:value:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEmailAddresses:", v17);
LABEL_11:

LABEL_12:
  if (v8)
    objc_msgSend(v12, "setImageData:", v8);

  return v12;
}

- (void)didAddToCuratedContactsForContact:(id)a3 bundleIdentifier:(id)a4 cnContactIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UNNotificationContactService _matchForContact:bundleIdentifier:](self, "_matchForContact:bundleIdentifier:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isMatchTypeSuggested"))
    v12 = -[_UNCNContactResolver confirm:match:](self->_resolver, "confirm:match:", 0, v11);
  -[_UNCNContactResolver resultForContactIdentifier:emailAddress:phoneNumber:userIdentifier:username:bundleIdentifier:](self->_resolver, "resultForContactIdentifier:emailAddress:phoneNumber:userIdentifier:username:bundleIdentifier:", v10, 0, 0, 0, 0, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 && os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
    -[_UNNotificationContactService didAddToCuratedContactsForContact:bundleIdentifier:cnContactIdentifier:].cold.1();
  -[_UNNotificationContactService _setResult:forContact:bundleIdentifier:](self, "_setResult:forContact:bundleIdentifier:", v13, v8, v9);

}

- (id)_matchForContact:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  _UNNotificationContactServiceRecord *v8;
  _UNNotificationContactService *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(_UNNotificationContactServiceRecord);
  -[_UNNotificationContactServiceRecord setContact:](v8, "setContact:", v6);
  -[_UNNotificationContactServiceRecord setBundleIdentifier:](v8, "setBundleIdentifier:", v7);
  v9 = self;
  objc_sync_enter(v9);
  -[NSCache objectForKey:](v9->_resultsByServiceRecord, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  return v10;
}

- (void)_setResult:(id)a3 forContact:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  _UNNotificationContactServiceRecord *v10;
  _UNNotificationContactService *v11;
  NSCache *resultsByServiceRecord;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(_UNNotificationContactServiceRecord);
  -[_UNNotificationContactServiceRecord setContact:](v10, "setContact:", v8);
  -[_UNNotificationContactServiceRecord setBundleIdentifier:](v10, "setBundleIdentifier:", v9);
  v11 = self;
  objc_sync_enter(v11);
  resultsByServiceRecord = v11->_resultsByServiceRecord;
  if (v13)
    -[NSCache setObject:forKey:](resultsByServiceRecord, "setObject:forKey:", v13, v10);
  else
    -[NSCache removeObjectForKey:](resultsByServiceRecord, "removeObjectForKey:", v10);
  objc_sync_exit(v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedContactStore, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_resultsByServiceRecord, 0);
}

- (void)curatedContactForContact:bundleIdentifier:keysToFetch:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2149F4000, v0, v1, "Contact service unable to fetch contact for identifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)confirmCuratedContactSuggestion:forContact:bundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2149F4000, v0, v1, "Contact service unable to confirm contact. Result not found.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)confirmCuratedContactSuggestion:forContact:bundleIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2149F4000, v0, v1, "Contact service unable to confirm an already confirmed contact", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didAddToCuratedContactsForContact:bundleIdentifier:cnContactIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2149F4000, v0, v1, "Contact service can't resolve newly created contact", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
