@implementation ICQLink

- (ICQLink)initWithText:(id)a3 options:(int64_t)a4 action:(int64_t)a5 parameters:(id)a6
{
  id v10;
  id v11;
  ICQLink *v12;
  uint64_t v13;
  NSString *text;
  uint64_t v15;
  NSDictionary *parameters;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICQLink;
  v12 = -[ICQLink init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    text = v12->_text;
    v12->_text = (NSString *)v13;

    v12->_options = a4;
    v12->_action = a5;
    v15 = objc_msgSend(v11, "copy");
    parameters = v12->_parameters;
    v12->_parameters = (NSDictionary *)v15;

  }
  return v12;
}

+ (id)_icqDismissLinkForServerMessageParameters:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v3;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id"), (_QWORD)v14);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("cancel")))
          {
            _ICQLinkForServerMessageParameterWithOptions(v9, 0);
            v11 = objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = (void *)v11;

              goto LABEL_17;
            }
          }

        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
  else
  {
    if (!v3)
    {
      v12 = 0;
      goto LABEL_18;
    }
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v3;
      _os_log_impl(&dword_1CDEBD000, v4, OS_LOG_TYPE_DEFAULT, "links: expected array: invalid server message parameters:%@", buf, 0xCu);
    }
  }
  v12 = 0;
LABEL_17:

LABEL_18:
  return v12;
}

+ (ICQLink)linkWithText:(id)a3 options:(int64_t)a4 action:(int64_t)a5 parameters:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:options:action:parameters:", v11, a4, a5, v10);

  return (ICQLink *)v12;
}

+ (ICQLink)linkWithText:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  return (ICQLink *)objc_msgSend(a1, "linkWithText:options:action:parameters:", a3, 0, a4, a5);
}

- (ICQLink)init
{
  return -[ICQLink initWithText:action:parameters:](self, "initWithText:action:parameters:", &stru_1E8B3C468, 0, MEMORY[0x1E0C9AA70]);
}

- (ICQLink)initWithText:(id)a3 action:(int64_t)a4 parameters:(id)a5
{
  return -[ICQLink initWithText:options:action:parameters:](self, "initWithText:options:action:parameters:", a3, 0, a4, a5);
}

- (id)description
{
  void *v3;
  NSString *text;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  text = self->_text;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_options);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQStringForAction(self->_action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Text: %@, Options: %@, Action: %@, Parameters: %@, actionURL: %@"), text, v5, v6, self->_parameters, self->_actionURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSURL)serverUIURL
{
  void *v2;
  void *v3;

  -[NSDictionary valueForKey:](self->_parameters, "valueForKey:", CFSTR("openURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v2);
  else
    v3 = 0;

  return (NSURL *)v3;
}

- (void)setServerUIURL:(id)a3
{
  NSDictionary *parameters;
  id v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  id v9;

  parameters = self->_parameters;
  v5 = a3;
  v9 = (id)-[NSDictionary mutableCopy](parameters, "mutableCopy");
  objc_msgSend(v5, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("openURL"));
  v7 = (NSDictionary *)objc_msgSend(v9, "copy");
  v8 = self->_parameters;
  self->_parameters = v7;

}

- (NSURL)actionURL
{
  NSURL *actionURL;

  actionURL = self->_actionURL;
  if (actionURL)
    return actionURL;
  -[ICQLink serverUIURL](self, "serverUIURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)dynamicUIRouteURL
{
  NSDictionary **p_parameters;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  p_parameters = &self->_parameters;
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
  }
  else
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQLink dynamicUIRouteURL].cold.1((uint64_t)p_parameters, v5, v6, v7, v8, v9, v10, v11);

    v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)hasServerUIAction
{
  int64_t v2;

  v2 = -[ICQLink action](self, "action");
  return (unint64_t)(v2 - 105) <= 0x10 && ((1 << (v2 - 105)) & 0x12481) != 0 || v2 == 3;
}

- (NSString)purchaseAttribution
{
  NSDictionary **p_parameters;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  p_parameters = &self->_parameters;
  -[NSDictionary objectForKeyedSubscript:](self->_parameters, "objectForKeyedSubscript:", CFSTR("purchaseAttribution"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICQLink purchaseAttribution].cold.1((uint64_t)p_parameters, v6, v7, v8, v9, v10, v11, v12);

  }
  return (NSString *)v4;
}

- (BOOL)performAction
{
  return -[ICQLink performActionWithOptions:](self, "performActionWithOptions:", 0);
}

- (BOOL)performActionWithOptions:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  v6 = -[ICQLink action](self, "action");
  -[ICQLink parameters](self, "parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "performAction:parameters:options:", v6, v7, a3);

  return a3;
}

+ (BOOL)performAction:(int64_t)a3 parameters:(id)a4 options:(int64_t)a5
{
  id v8;
  void *v9;
  char isKindOfClass;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  isKindOfClass = 0;
  switch(a3)
  {
    case 'd':
      _ICQGetLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1CDEBD000, v15, OS_LOG_TYPE_DEFAULT, "link - presenting manage storage in Settings", (uint8_t *)&v24, 2u);
      }

      _ICQOpenManageStorageInSettings();
      goto LABEL_28;
    case 'e':
    case 't':
    case 'u':
    case 'v':
LABEL_5:
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      _ICQStringForAction(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v12;
      v13 = "ICQLink: performAction: %@ not handled";
      goto LABEL_7;
    case 'f':
    case 'j':
    case 'k':
    case 'l':
    case 'p':
    case 'q':
    case 'r':
    case 's':
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      _ICQStringForAction(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v12;
      v13 = "ICQLink: performAction: %@ not handled since it requires context";
LABEL_7:
      _os_log_impl(&dword_1CDEBD000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v24, 0xCu);

LABEL_8:
LABEL_9:
      isKindOfClass = 0;
      break;
    case 'g':
      _ICQOpenPrimaryPaymentInSettings();
      goto LABEL_28;
    case 'h':
      _ICQOpenCloudBackupInSettings();
      goto LABEL_28;
    case 'i':
LABEL_10:
      if ((a5 & 1) == 0)
        goto LABEL_9;
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "link - presenting purchase flow in Settings", (uint8_t *)&v24, 2u);
      }

      _ICQOpenPurchaseFlowInSettings();
LABEL_28:
      isKindOfClass = 1;
      break;
    case 'm':
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1CDEBD000, v16, OS_LOG_TYPE_DEFAULT, "link - presenting family setup in Settings", (uint8_t *)&v24, 2u);
      }

      _ICQOpenFamilySetupInSettings();
      goto LABEL_28;
    case 'n':
    case 'o':
    case 'w':
    case 'x':
    case 'y':
    case 'z':
      break;
    case '{':
LABEL_24:
      objc_msgSend(a1, "performHTTPPOSTCallWithParams:options:", v9, a5);
      goto LABEL_9;
    case '|':
      objc_msgSend(a1, "performHTTPGETCallWithParams:options:", v8, a5);
      goto LABEL_9;
    default:
      switch(a3)
      {
        case 1:
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("openURL"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            goto LABEL_24;
          _ICQGetLogSystem();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1CDEBD000, v23, OS_LOG_TYPE_DEFAULT, "ICQLink: performAction: ICQActionDismiss not handled", (uint8_t *)&v24, 2u);
          }

          goto LABEL_9;
        case 2:
          _ICQGetLogSystem();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v24) = 0;
            _os_log_impl(&dword_1CDEBD000, v18, OS_LOG_TYPE_DEFAULT, "link - offer rejected", (uint8_t *)&v24, 2u);
          }

          goto LABEL_28;
        case 3:
          goto LABEL_10;
        case 4:
        case 5:
          goto LABEL_5;
        case 6:
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("URL"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          _ICQGetLogSystem();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v24 = 138412290;
            v25 = v20;
            _os_log_impl(&dword_1CDEBD000, v21, OS_LOG_TYPE_DEFAULT, "link - opening URL %@", (uint8_t *)&v24, 0xCu);
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
            v22 = objc_claimAutoreleasedReturnValue();

            v20 = (void *)v22;
          }
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
            ICQOpenURL(v20);

          goto LABEL_29;
        default:
          goto LABEL_29;
      }
  }
LABEL_29:

  return isKindOfClass & 1;
}

+ (id)urlSession
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", CFSTR("ICQFetchOfferURLSession"));
  objc_msgSend(v2, "set_appleIDContext:", v3);

  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)urlRequestWithParams:(id)a3 options:(int64_t)a4
{
  char v4;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("openURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "HTTP Call - server call to URL %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", v8, 1, 30.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addHeadersToRequest:", v10);
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/x-plist"), CFSTR("Content-Type"));
    objc_msgSend(v10, "setValue:forHTTPHeaderField:", CFSTR("application/x-buddyml"), CFSTR("Accept"));
  }

  return v10;
}

+ (void)performAsyncHTTPPostCallWithURL:(id)a3 parameters:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37A8];
  v7 = a4;
  objc_msgSend(v6, "requestWithURL:cachePolicy:timeoutInterval:", a3, 1, 30.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addHeadersToRequest:", v8);
  objc_msgSend(a1, "addPOSTParams:toRequest:", v7, v8);

  objc_msgSend(a1, "startDataTaskWithRequest:", v8);
}

+ (void)performHTTPPOSTCallWithParams:(id)a3 options:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "urlRequestWithParams:options:", v6, a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addPOSTParams:toRequest:", v6, v7);

  objc_msgSend(a1, "startDataTaskWithRequest:", v7);
}

+ (void)performHTTPGETCallWithParams:(id)a3 options:(int64_t)a4
{
  id v5;

  objc_msgSend(a1, "urlRequestWithParams:options:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startDataTaskWithRequest:", v5);

}

+ (void)startDataTaskWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "urlSession");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v4, &__block_literal_global_4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resume");
}

void __36__ICQLink_startDataTaskWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localizedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1CDEBD000, v5, OS_LOG_TYPE_DEFAULT, "Error making HTTP call to url: %@", (uint8_t *)&v7, 0xCu);

    }
  }

}

+ (void)addHeadersToRequest:(id)a3
{
  id v3;
  ICQRequestProvider *v4;
  void *v5;
  void *v6;
  ICQRequestProvider *v7;

  v3 = a3;
  v4 = [ICQRequestProvider alloc];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICQRequestProvider initWithAccount:](v4, "initWithAccount:", v6);

  -[ICQRequestProvider addBasicHeadersToRequest:](v7, "addBasicHeadersToRequest:", v3);
}

+ (void)addPOSTParams:(id)a3 toRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 0, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v8)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Could not convert message body to JSON. Error: %@", buf, 0xCu);
    }

    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      +[ICQLink addPOSTParams:toRequest:].cold.1((uint64_t)v5, v10);

  }
  else
  {
    objc_msgSend(v6, "setHTTPBody:", v7);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actionURL, CFSTR("actionURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverUIContent, CFSTR("serverUIContent"));

}

- (ICQLink)initWithCoder:(id)a3
{
  id v4;
  ICQLink *v5;
  uint64_t v6;
  NSString *text;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *parameters;
  uint64_t v13;
  NSURL *actionURL;
  uint64_t v15;
  NSData *serverUIContent;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ICQLink init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    v5->_options = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("options"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9, v18, v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("parameters"));
    v11 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionURL"));
    v13 = objc_claimAutoreleasedReturnValue();
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverUIContent"));
    v15 = objc_claimAutoreleasedReturnValue();
    serverUIContent = v5->_serverUIContent;
    v5->_serverUIContent = (NSData *)v15;

  }
  return v5;
}

- (ICQLink)initWithActionString:(id)a3
{
  return -[ICQLink initWithText:options:action:parameters:](self, "initWithText:options:action:parameters:", &stru_1E8B3C468, 0, _ICQActionForString(a3), MEMORY[0x1E0C9AA70]);
}

- (ICQLink)initWithActionString:(id)a3 url:(id)a4
{
  id v7;
  ICQLink *v8;
  ICQLink *v9;

  v7 = a4;
  v8 = -[ICQLink initWithText:options:action:parameters:](self, "initWithText:options:action:parameters:", &stru_1E8B3C468, 0, _ICQActionForString(a3), MEMORY[0x1E0C9AA70]);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_actionURL, a4);

  return v9;
}

- (ICQLink)initWithAction:(int64_t)a3
{
  return -[ICQLink initWithText:options:action:parameters:](self, "initWithText:options:action:parameters:", &stru_1E8B3C468, 0, a3, MEMORY[0x1E0C9AA70]);
}

- (ICQLink)initWithAction:(int64_t)a3 url:(id)a4
{
  id v7;
  ICQLink *v8;
  ICQLink *v9;

  v7 = a4;
  v8 = -[ICQLink initWithText:options:action:parameters:](self, "initWithText:options:action:parameters:", &stru_1E8B3C468, 0, a3, MEMORY[0x1E0C9AA70]);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_actionURL, a4);

  return v9;
}

- (void)getCachedContentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ICQLiftUICache sharedCache](ICQLiftUICache, "sharedCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICQLink serverUIURL](self, "serverUIURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchResponseForURL:completion:", v5, v4);

}

- (NSString)text
{
  return self->_text;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)action
{
  return self->_action;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSData)serverUIContent
{
  return self->_serverUIContent;
}

- (void)setServerUIContent:(id)a3
{
  objc_storeStrong((id *)&self->_serverUIContent, a3);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setActionURL:(id)a3
{
  objc_storeStrong((id *)&self->_actionURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_serverUIContent, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)dynamicUIRouteURL
{
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, a2, a3, "Unable to find dynamicUI route in params %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

- (void)purchaseAttribution
{
  OUTLINED_FUNCTION_0_2(&dword_1CDEBD000, a2, a3, "Unable to find dynamicUI purchase attribution in params %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0_0();
}

+ (void)addPOSTParams:(uint64_t)a1 toRequest:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1CDEBD000, a2, OS_LOG_TYPE_DEBUG, "Body: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_0_0();
}

@end
