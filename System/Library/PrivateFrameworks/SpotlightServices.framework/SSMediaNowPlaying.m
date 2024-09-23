@implementation SSMediaNowPlaying

- (id)consumerLabel
{
  if (consumerLabel_onceToken_0 != -1)
    dispatch_once(&consumerLabel_onceToken_0, &__block_literal_global_17);
  return (id)consumerLabel_label_0;
}

void __34__SSMediaNowPlaying_consumerLabel__block_invoke()
{
  void *v0;

  v0 = (void *)consumerLabel_label_0;
  consumerLabel_label_0 = (uint64_t)CFSTR("SSMediaNowPlaying");

}

- (id)stream
{
  void *v2;
  void *v3;
  void *v4;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "Media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "NowPlaying");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_54_0);
  return (id)sharedInstance_sharedInstance_0;
}

void __35__SSMediaNowPlaying_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;

}

- (SSMediaNowPlaying)init
{
  SSMediaNowPlaying *v2;
  SSMediaNowPlaying *v3;
  SSMediaNowPlaying *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMediaNowPlaying;
  v2 = -[SSBaseConsumer init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)filterEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "bundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
  v5 = (void *)v4;
  objc_msgSend(v3, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.Music"));

  if (!v7)
    goto LABEL_5;
  objc_msgSend(v3, "iTunesStoreIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    v10 = objc_msgSend(v3, "playbackState") != 1;
  else
LABEL_5:
    v10 = 1;

  return v10;
}

- (void)handleEvent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (!-[SSMediaNowPlaying filterEvent:](self, "filterEvent:", v5))
    {
      objc_msgSend(v5, "iTunesStoreIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      SSRedactString(v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        SSGeneralLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[SSBaseConsumer identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v18 = v9;
          v19 = 2112;
          v20 = v7;
          _os_log_impl(&dword_1B86C5000, v8, OS_LOG_TYPE_DEFAULT, "%@: processing event media nowplaying: %@", buf, 0x16u);

        }
      }
      v10 = CFSTR("com.apple.Music");
      v11 = (id)*MEMORY[0x1E0CB2AC0];
      -[SSMediaNowPlaying _identifierForItemUpdate:](self, "_identifierForItemUpdate:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[SSMediaNowPlaying _itemUpdateForEvent:itemIdentifier:bundleToUpdate:](self, "_itemUpdateForEvent:itemIdentifier:bundleToUpdate:", v5, v12, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13 && v11)
        {
          v16 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSBaseConsumer indexItems:protectionClass:bundleID:](self, "indexItems:protectionClass:bundleID:", v15, v11, v10);

        }
      }

    }
  }

}

- (id)_identifierForItemUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "iTunesStoreIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *MEMORY[0x1E0CA5F50];
    objc_msgSend(v4, "iTunesStoreIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@=%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("com.apple.Music");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSBaseConsumer queryWithString:bundleIDs:fetchAttributes:](self, "queryWithString:bundleIDs:fetchAttributes:", v9, v10, MEMORY[0x1E0C9AA60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") == 1)
    {
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_attributesUpdatesForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "absoluteTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9[0] = CFSTR("_kMDItemLastOutOfSpotlightEngagementDate");
    objc_msgSend(v3, "absoluteTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E0CA6450];
    objc_msgSend(v3, "absoluteTimestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (id)_itemUpdateForEvent:(id)a3 itemIdentifier:(id)a4 bundleToUpdate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  -[SSMediaNowPlaying _attributesUpdatesForEvent:](self, "_attributesUpdatesForEvent:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0CA6B48]);
    objc_msgSend(v12, "setUniqueIdentifier:", v8);
    objc_msgSend(v12, "setBundleID:", v9);
    objc_msgSend(v12, "setIsUpdate:", 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithAttributes:", v11);
    objc_msgSend(v12, "setAttributeSet:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
