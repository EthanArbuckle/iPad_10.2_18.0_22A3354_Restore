@implementation TUGeoLocationMetadataCacheDataProvider

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[TUGeoLocationMetadataCacheDataProvider locationForMetadataIdentifier:](self, "locationForMetadataIdentifier:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[TUMetadataCacheDataProvider setObject:forDestinationID:](self, "setObject:forDestinationID:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  dispatch_group_leave(v7);
}

- (id)locationForMetadataIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;

  objc_msgSend(a3, "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "pn_hasInternationalDirectDialingPrefix"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "countryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUGeoLocationMetadataCacheDataProvider phoneNumberResolver](self, "phoneNumberResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v9, "resolvePhoneNumber:countryCode:error:", v5, v8, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;

    if (v11)
    {
      TUDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TUGeoLocationMetadataCacheDataProvider locationForMetadataIdentifier:].cold.1((uint64_t)v5, (uint64_t)v11, v12);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PNRPhoneNumberResolver)phoneNumberResolver
{
  return self->_phoneNumberResolver;
}

- (TUGeoLocationMetadataCacheDataProvider)init
{
  TUGeoLocationMetadataCacheDataProvider *v2;
  void *v3;
  objc_class *v4;
  PNRPhoneNumberResolver *v5;
  PNRPhoneNumberResolver *phoneNumberResolver;
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)TUGeoLocationMetadataCacheDataProvider;
  v2 = -[TUMetadataCacheDataProvider init](&v8, sel_init);
  if (v2)
  {
    if (!PhoneNumberResolverLibraryCore_frameworkLibrary)
    {
      v13 = xmmword_1E38A1748;
      v14 = 0;
      PhoneNumberResolverLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (PhoneNumberResolverLibraryCore_frameworkLibrary)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2050000000;
      v3 = (void *)getPNRPhoneNumberResolverClass_softClass;
      v12 = getPNRPhoneNumberResolverClass_softClass;
      if (!getPNRPhoneNumberResolverClass_softClass)
      {
        *(_QWORD *)&v13 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v13 + 1) = 3221225472;
        v14 = __getPNRPhoneNumberResolverClass_block_invoke;
        v15 = &unk_1E38A1710;
        v16 = &v9;
        __getPNRPhoneNumberResolverClass_block_invoke((uint64_t)&v13);
        v3 = (void *)v10[3];
      }
      v4 = objc_retainAutorelease(v3);
      _Block_object_dispose(&v9, 8);
      v5 = (PNRPhoneNumberResolver *)objc_alloc_init(v4);
      phoneNumberResolver = v2->_phoneNumberResolver;
      v2->_phoneNumberResolver = v5;

    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumberResolver, 0);
}

- (void)locationForMetadataIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_19A50D000, log, OS_LOG_TYPE_ERROR, "Resolving %@ to a geographic location failed with error %@", (uint8_t *)&v3, 0x16u);
}

@end
