@implementation SSAppInFocus

- (id)consumerLabel
{
  if (consumerLabel_onceToken != -1)
    dispatch_once(&consumerLabel_onceToken, &__block_literal_global_15);
  return (id)consumerLabel_label;
}

void __29__SSAppInFocus_consumerLabel__block_invoke()
{
  void *v0;

  v0 = (void *)consumerLabel_label;
  consumerLabel_label = (uint64_t)CFSTR("SSAppInFocus");

}

- (id)stream
{
  void *v2;
  void *v3;
  void *v4;

  BiomeLibrary();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "App");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "InFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_54);
  return (id)sharedInstance_sharedInstance;
}

void __30__SSAppInFocus_sharedInstance__block_invoke()
{
  SSAppInFocus *v0;
  void *v1;

  v0 = objc_alloc_init(SSAppInFocus);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (SSAppInFocus)init
{
  SSAppInFocus *v2;
  SSAppInFocus *v3;
  SSAppInFocus *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSAppInFocus;
  v2 = -[SSBaseConsumer init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (BOOL)filterEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "shortVersionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(v3, "exactVersionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      LOBYTE(v6) = 1;
      goto LABEL_5;
    }
  }
  v6 = objc_msgSend(v3, "starting") ^ 1;
LABEL_5:

  return v6;
}

- (void)handleEvent:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "bundleID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (v9)
      {
        if (!-[SSAppInFocus filterEvent:](self, "filterEvent:", v5))
        {
          objc_msgSend(v5, "bundleID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          SSRedactString(v10, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            SSGeneralLog();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              -[SSBaseConsumer identifier](self, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v21 = v13;
              v22 = 2112;
              v23 = v11;
              _os_log_impl(&dword_1B86C5000, v12, OS_LOG_TYPE_DEFAULT, "%@: processing event for bundle %@.", buf, 0x16u);

            }
          }
          -[SSAppInFocus _itemUpdatesForEvent:](self, "_itemUpdatesForEvent:", v5);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "bundleID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v19 = v15;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "bundleID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[SSBaseConsumer indexItems:protectionClass:bundleID:](self, "indexItems:protectionClass:bundleID:", v17, CFSTR("Priority"), v18);

            }
          }

        }
      }
    }

  }
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

- (id)_itemUpdatesForEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[SSAppInFocus _attributesUpdatesForEvent:](self, "_attributesUpdatesForEvent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B50]), "initWithAttributes:", v6);
    v8 = objc_alloc(MEMORY[0x1E0CA6B48]);
    objc_msgSend(v4, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v9, 0, v7);

    objc_msgSend(v10, "setIsUpdate:", 1);
    objc_msgSend(v10, "setBundleID:", CFSTR("com.apple.application"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
