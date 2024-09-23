@implementation TUNicknamesMetadataCacheDataProvider

+ (TUNicknamesMetadataCacheDataProvider)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__TUNicknamesMetadataCacheDataProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (TUNicknamesMetadataCacheDataProvider *)(id)sharedInstance_sNicknamesMetadataCacheDataProvider;
}

void __54__TUNicknamesMetadataCacheDataProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sNicknamesMetadataCacheDataProvider;
  sharedInstance_sNicknamesMetadataCacheDataProvider = (uint64_t)v1;

}

- (TUNicknamesMetadataCacheDataProvider)init
{
  TUNicknamesMetadataCacheDataProvider *v2;
  void *v3;
  objc_class *v4;
  IMNicknameProvider *v5;
  IMNicknameProvider *nicknameProvider;
  objc_super v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v8.receiver = self;
  v8.super_class = (Class)TUNicknamesMetadataCacheDataProvider;
  v2 = -[TUMetadataCacheDataProvider init](&v8, sel_init);
  if (v2)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getIMNicknameProviderClass_softClass;
    v13 = getIMNicknameProviderClass_softClass;
    if (!getIMNicknameProviderClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getIMNicknameProviderClass_block_invoke;
      v9[3] = &unk_1E38A1710;
      v9[4] = &v10;
      __getIMNicknameProviderClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    v5 = (IMNicknameProvider *)objc_alloc_init(v4);
    nicknameProvider = v2->_nicknameProvider;
    v2->_nicknameProvider = v5;

    -[IMNicknameProvider setNicknameListener:](v2->_nicknameProvider, "setNicknameListener:", v2);
  }
  return v2;
}

- (id)fetchNicknameForHandleValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "tuMetadataDestinationIDForHandleValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[TUMetadataCacheDataProvider metadataForDestinationID:](self, "metadataForDestinationID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[TUNicknamesMetadataCacheDataProvider formattedNicknameStringForHandleValue:](self, "formattedNicknameStringForHandleValue:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUMetadataCacheDataProvider setObject:forDestinationID:](self, "setObject:forDestinationID:", v6, v5);
    }
  }
  else
  {
    -[TUNicknamesMetadataCacheDataProvider formattedNicknameStringForHandleValue:](self, "formattedNicknameStringForHandleValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "handle", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "normalizedValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[TUNicknamesMetadataCacheDataProvider fetchNicknameForHandleValue:](self, "fetchNicknameForHandleValue:", v14);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  dispatch_group_leave(v7);
}

- (void)nicknameStoreDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUMetadataCacheDataProvider invalidateCache](self, "invalidateCache");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_msgSend((id)objc_opt_class(), "tuMetadataDestinationIDForHandleValue:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pendingNicknames"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[TUNicknamesMetadataCacheDataProvider formattedNicknameStringForNickname:](self, "formattedNicknameStringForNickname:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUMetadataCacheDataProvider setObject:forDestinationID:](self, "setObject:forDestinationID:", v13, v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

+ (id)tuMetadataDestinationIDForHandleValue:(id)a3
{
  id v3;
  void *v4;
  TUMetadataDestinationID *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    +[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = -[TUMetadataDestinationID initWithHandle:]([TUMetadataDestinationID alloc], "initWithHandle:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)formattedNicknameStringForHandleValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[TUNicknamesMetadataCacheDataProvider nicknameProvider](self, "nicknameProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nicknameForHandleID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "Fetched nickname %@ for handle: %@", (uint8_t *)&v10, 0x16u);
    }

    -[TUNicknamesMetadataCacheDataProvider formattedNicknameStringForNickname:](self, "formattedNicknameStringForNickname:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formattedNicknameStringForNickname:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_6;
  objc_msgSend(v3, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "lastName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      goto LABEL_5;
LABEL_6:
    v15 = 0;
    goto LABEL_7;
  }

LABEL_5:
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "firstName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  TUBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MAYBE_NICKNAME_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v15;
}

- (IMNicknameProvider)nicknameProvider
{
  return self->_nicknameProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nicknameProvider, 0);
}

@end
