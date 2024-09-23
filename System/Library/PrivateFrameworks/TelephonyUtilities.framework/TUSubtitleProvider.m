@implementation TUSubtitleProvider

- (TUSubtitleProvider)initWithMetadataCache:(id)a3 callProviderManager:(id)a4
{
  id v7;
  id v8;
  TUSubtitleProvider *v9;
  TUSubtitleProvider *v10;
  NSCache *v11;
  NSCache *callProviderCache;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUSubtitleProvider;
  v9 = -[TUSubtitleProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_callProviderManager, a4);
    objc_storeStrong((id *)&v10->_metadataCache, a3);
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    callProviderCache = v10->_callProviderCache;
    v10->_callProviderCache = v11;

  }
  return v10;
}

- (id)localizedSubtitleForRecentCall:(id)a3 handle:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Using TUSubtitleProvider", buf, 2u);
  }

  -[TUSubtitleProvider callProviderForRecentCall:](self, "callProviderForRecentCall:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_18;
  if (objc_msgSend(v12, "isFaceTimeProvider"))
  {
    v14 = objc_msgSend(v8, "mediaType");
    TUBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14 == 2)
      v17 = CFSTR("RECENTS_FACETIME_VIDEO");
    else
      v17 = CFSTR("RECENTS_FACETIME_AUDIO");
    objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (objc_msgSend(v13, "isTelephonyProvider"))
  {
    if (v9)
    {
      +[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tu_localizedDisplayStringForHandle:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_36;
    }
    if (objc_msgSend(v8, "isJunk"))
    {
      objc_msgSend(v8, "junkIdentificationCategory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v8, "junkIdentificationCategory");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = CFSTR("MAYBE_JUNK");
      }

      TUBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", v21, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_36;
    }
    +[TUMetadataDestinationID metadataDestinationIDsForCHRecentCall:](TUMetadataDestinationID, "metadataDestinationIDsForCHRecentCall:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[TUSubtitleProvider metadataCache](self, "metadataCache");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "metadataForDestinationID:", v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        if ((objc_msgSend(v8, "callerIdIsBlocked") & 1) != 0
          || (objc_msgSend(v16, "metadataForProvider:", objc_opt_class()),
              (v31 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          if ((objc_msgSend(v8, "callerIdIsBlocked") & 1) != 0
            || (objc_msgSend(v16, "metadataForProvider:", objc_opt_class()),
                (v31 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            objc_msgSend(v16, "metadataForProvider:", objc_opt_class());
            v31 = objc_claimAutoreleasedReturnValue();
            if (!v31)
            {
              objc_msgSend(v16, "metadataForProvider:", objc_opt_class());
              v31 = objc_claimAutoreleasedReturnValue();
            }
          }
        }
        v19 = (void *)v31;
        goto LABEL_34;
      }
    }
    else
    {
      v16 = 0;
    }
    v19 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v22 = objc_msgSend(v8, "mediaType");
  if (v22 == 1)
  {
    v23 = CFSTR("RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_AUDIO");
    goto LABEL_20;
  }
  if (v22 != 2)
  {
LABEL_18:
    v19 = 0;
    goto LABEL_36;
  }
  v23 = CFSTR("RECENTS_CALL_PROVIDER_NAME_%@_CALL_CATEGORY_VIDEO");
LABEL_20:
  v24 = (void *)MEMORY[0x1E0CB3940];
  TUBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v23, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", v25, v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_35:
LABEL_36:
  if (!objc_msgSend(v19, "length"))
  {
    TUBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_LABEL"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v33 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v33;
  }

  return v19;
}

- (id)callProviderForRecentCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "serviceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUSubtitleProvider callProviderManager](self, "callProviderManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_8;
  -[TUSubtitleProvider callProviderCache](self, "callProviderCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "providerForRecentCall:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8 = (void *)v9;
      -[TUSubtitleProvider callProviderCache](self, "callProviderCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v8, v5);

      goto LABEL_9;
    }
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "Could not retrieve a call provider for the specified recent call: %@", (uint8_t *)&v13, 0xCu);
    }

LABEL_8:
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (NSCache)callProviderCache
{
  return self->_callProviderCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProviderCache, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
}

@end
