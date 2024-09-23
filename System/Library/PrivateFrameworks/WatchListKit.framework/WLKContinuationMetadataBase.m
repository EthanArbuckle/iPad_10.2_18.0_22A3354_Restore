@implementation WLKContinuationMetadataBase

- (id)_mergingIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;

  -[WLKContinuationMetadataBase movieOrShowContent](self, "movieOrShowContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canonicalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLKContinuationMetadataBase movieOrShowContent](self, "movieOrShowContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WLKContinuationMetadataBase movieOrShowContent](self, "movieOrShowContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "canonicalShowID");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  return v4;
}

+ (void)add:(id)a3 toCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  int v17;
  int v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  _DWORD v25[7];

  *(_QWORD *)&v25[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "_mergingIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__WLKContinuationMetadataBase_Merging__add_toCollection___block_invoke;
  v22[3] = &unk_1E68A7998;
  v8 = v7;
  v23 = v8;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend(v9, "firstIndex");
    if (v10 < objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "compare:", v13);

      if (v14 == 1)
      {
        v15 = objc_msgSend(v5, "isRental");
        if (v15 != objc_msgSend(v11, "isRental"))
        {
          WLKSystemLogObject();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = objc_msgSend(v5, "isRental");
            v18 = objc_msgSend(v11, "isRental");
            *(_DWORD *)buf = 67109376;
            v25[0] = v17;
            LOWORD(v25[1]) = 1024;
            *(_DWORD *)((char *)&v25[1] + 2) = v18;
            _os_log_impl(&dword_1B515A000, v16, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Mismatch in continuation.isRental=%d and existingContinuation.isRental=%d", buf, 0xEu);
          }

          objc_msgSend(v5, "setIsRental:", objc_msgSend(v11, "isRental"));
        }
        objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v10, v5);
        WLKSystemLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v25 = v8;
        v20 = "WLKContinuationMetadata (Merging/Delta) - Replacing existing item with delta. Newer timestamp. %@";
      }
      else
      {
        WLKSystemLogObject();
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
LABEL_16:

          goto LABEL_17;
        }
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v25 = v8;
        v20 = "WLKContinuationMetadata (Merging/Delta) - Skipping addition for existing item, timestamp is not newer %@.";
      }
      _os_log_impl(&dword_1B515A000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      goto LABEL_16;
    }
  }
  else
  {
    WLKSystemLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v25 = v8;
      _os_log_impl(&dword_1B515A000, v21, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Adding continuation %@", buf, 0xCu);
    }

    objc_msgSend(v6, "addObject:", v5);
  }
LABEL_17:

}

uint64_t __57__WLKContinuationMetadataBase_Merging__add_toCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "_mergingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)v7)
    *a4 = 1;

  return v7;
}

+ (void)remove:(id)a3 fromCollection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "_mergingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__WLKContinuationMetadataBase_Merging__remove_fromCollection___block_invoke;
  v12[3] = &unk_1E68A7998;
  v7 = v6;
  v13 = v7;
  objc_msgSend(v5, "indexesOfObjectsPassingTest:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Removing existing item: %@", buf, 0xCu);
    }

    objc_msgSend(v5, "removeObjectsAtIndexes:", v8);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKContinuationMetadata (Merging/Delta) - Skipping removal for non-matching-item: %@", buf, 0xCu);
    }

  }
}

uint64_t __62__WLKContinuationMetadataBase_Merging__remove_fromCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "_mergingIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (WLKContinuationMetadataBase)initWithDictionary:(id)a3 context:(id)a4
{
  id v5;
  WLKContinuationMetadataBase *v6;
  uint64_t v7;
  NSDictionary *dictionary;
  id v9;
  WLKBasicContentMetadata *v10;
  WLKBasicContentMetadata *movieOrShowContent;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURL *contentTVAppDeeplinkURL;
  uint64_t v16;
  NSString *context;
  uint64_t v18;
  NSString *localizedContext;
  uint64_t v20;
  NSDate *timestamp;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WLKContinuationMetadataBase;
  v6 = -[WLKContinuationMetadataBase init](&v23, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v7;

    objc_msgSend(v5, "wlk_dictionaryForKey:", CFSTR("content"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 || (v9 = v5) != 0)
    {
      v10 = -[WLKBasicContentMetadata initWithDictionary:]([WLKBasicContentMetadata alloc], "initWithDictionary:", v9);
      movieOrShowContent = v6->_movieOrShowContent;
      v6->_movieOrShowContent = v10;

      v12 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v9, "wlk_stringForKey:", CFSTR("url"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLWithString:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      contentTVAppDeeplinkURL = v6->_contentTVAppDeeplinkURL;
      v6->_contentTVAppDeeplinkURL = (NSURL *)v14;

    }
    objc_msgSend(v5, "wlk_stringForKey:", CFSTR("context"));
    v16 = objc_claimAutoreleasedReturnValue();
    context = v6->_context;
    v6->_context = (NSString *)v16;

    v6->_contextEnum = objc_msgSend((id)objc_opt_class(), "_contextForString:", v6->_context);
    objc_msgSend(v5, "wlk_stringForKey:", CFSTR("localizedContext"));
    v18 = objc_claimAutoreleasedReturnValue();
    localizedContext = v6->_localizedContext;
    v6->_localizedContext = (NSString *)v18;

    v6->_isRental = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", CFSTR("isRental"), 0);
    v6->_isPurchase = objc_msgSend(v5, "wlk_BOOLForKey:defaultValue:", CFSTR("isPurchase"), 0);
    objc_msgSend(v5, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("timestamp"));
    v20 = objc_claimAutoreleasedReturnValue();
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v20;

  }
  return v6;
}

- (WLKContinuationMetadataBase)init
{
  return -[WLKContinuationMetadataBase initWithDictionary:context:](self, "initWithDictionary:context:", 0, 0);
}

+ (int64_t)_contextForString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  if (_contextForString__onceToken != -1)
    dispatch_once(&_contextForString__onceToken, &__block_literal_global_4);
  objc_msgSend((id)_contextForString___sContextLookup, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "integerValue");
  else
    v6 = 0;

  return v6;
}

void __49__WLKContinuationMetadataBase__contextForString___block_invoke()
{
  void *v0;

  v0 = (void *)_contextForString___sContextLookup;
  _contextForString___sContextLookup = (uint64_t)&unk_1E68CA078;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WLKContinuationMetadataBase;
  -[WLKContinuationMetadataBase description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKContinuationMetadataBase movieOrShowContent](self, "movieOrShowContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ content:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (WLKBasicContentMetadata)movieOrShowContent
{
  return self->_movieOrShowContent;
}

- (NSURL)contentTVAppDeeplinkURL
{
  return self->_contentTVAppDeeplinkURL;
}

- (int64_t)contextEnum
{
  return self->_contextEnum;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)localizedContext
{
  return self->_localizedContext;
}

- (BOOL)isRental
{
  return self->_isRental;
}

- (void)setIsRental:(BOOL)a3
{
  self->_isRental = a3;
}

- (BOOL)isPurchase
{
  return self->_isPurchase;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_localizedContext, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentTVAppDeeplinkURL, 0);
  objc_storeStrong((id *)&self->_movieOrShowContent, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
