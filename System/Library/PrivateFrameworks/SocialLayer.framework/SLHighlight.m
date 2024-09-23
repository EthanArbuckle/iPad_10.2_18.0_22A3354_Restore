@implementation SLHighlight

+ (id)Sha256ForData:(id)a3 withSalt:(id)a4
{
  id v5;
  id v6;
  id v7;
  const void *v8;
  CC_LONG v9;
  id v10;
  void *v11;
  CC_SHA256_CTX v13;
  unsigned __int8 md[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  memset(&v13, 0, sizeof(v13));
  v6 = a3;
  CC_SHA256_Init(&v13);
  v7 = objc_retainAutorelease(v6);
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)v13.count, *(_OWORD *)&v13.hash[2], *(_OWORD *)&v13.hash[6], *(_OWORD *)&v13.wbuf[2], *(_OWORD *)&v13.wbuf[6], *(_OWORD *)&v13.wbuf[10], *(_QWORD *)&v13.wbuf[14]);
  v9 = objc_msgSend(v7, "length");

  CC_SHA256_Update(&v13, v8, v9);
  if (v5)
  {
    v10 = objc_retainAutorelease(v5);
    CC_SHA256_Update(&v13, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
  }
  CC_SHA256_Final(md, &v13);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);

  return v11;
}

- (SLHighlight)initWithAttribution:(id)a3
{
  id v4;
  SLHighlight *v5;
  SLHighlight *v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *resourceURL;
  uint64_t v10;
  NSDate *timestamp;
  uint64_t v12;
  NSArray *attributions;
  NSDictionary *supplementaryData;
  NSNumber *score;
  uint64_t v16;
  NSURL *resolvedURL;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SLHighlight;
  v5 = -[SLHighlight init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)&stru_1E3797070;

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E3797070);
    v8 = objc_claimAutoreleasedReturnValue();
    resourceURL = v6->_resourceURL;
    v6->_resourceURL = (NSURL *)v8;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = objc_claimAutoreleasedReturnValue();
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v10;

    v20[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    attributions = v6->_attributions;
    v6->_attributions = (NSArray *)v12;

    supplementaryData = v6->_supplementaryData;
    v6->_supplementaryData = (NSDictionary *)MEMORY[0x1E0C9AA70];

    score = v6->_score;
    v6->_score = (NSNumber *)&unk_1E37A9F48;

    -[NSDictionary valueForKey:](v6->_supplementaryData, "valueForKey:", CFSTR("com_apple_mobilesms_resolvedURL"));
    v16 = objc_claimAutoreleasedReturnValue();
    resolvedURL = v6->_resolvedURL;
    v6->_resolvedURL = (NSURL *)v16;

  }
  return v6;
}

- (SLHighlight)initWithPortraitHighlight:(id)a3 error:(id *)a4
{
  id v6;
  SLHighlight *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSURL *resourceURL;
  void *v15;
  uint64_t v16;
  NSDate *timestamp;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  SLAttribution *v26;
  SLAttribution *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  SLHighlight *v32;
  uint64_t v33;
  NSDictionary *supplementaryData;
  uint64_t v35;
  NSNumber *score;
  void *v37;
  uint64_t v38;
  NSURL *resolvedURL;
  id *v41;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)SLHighlight;
  v7 = -[SLHighlight init](&v49, sel_init);
  if (!v7)
  {
LABEL_32:
    v32 = v7;
    goto LABEL_33;
  }
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v6, "identifier");
      v10 = objc_claimAutoreleasedReturnValue();
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v10;

      objc_msgSend(v6, "resourceURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v6, "resourceURL");
        v13 = objc_claimAutoreleasedReturnValue();
        resourceURL = v7->_resourceURL;
        v7->_resourceURL = (NSURL *)v13;

        objc_msgSend(v6, "timestamp");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v6, "timestamp");
          v16 = objc_claimAutoreleasedReturnValue();
          timestamp = v7->_timestamp;
          v7->_timestamp = (NSDate *)v16;

          v18 = (void *)objc_opt_new();
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v6, "attributionIdentifiers");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (v19)
          {
            v20 = v19;
            v41 = a4;
            v21 = 0;
            v22 = *(_QWORD *)v46;
            while (2)
            {
              v23 = 0;
              v24 = v21;
              do
              {
                if (*(_QWORD *)v46 != v22)
                  objc_enumerationMutation(obj);
                v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v23);
                v26 = [SLAttribution alloc];
                v44 = v24;
                v27 = -[SLAttribution initWithIdentifier:error:](v26, "initWithIdentifier:error:", v25, &v44);
                v21 = v44;

                if (!v27)
                {
                  if (v41)
                  {
                    v43 = v21;
                    objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 5, &v43);
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = v43;

                    *v41 = v30;
                    v21 = v31;
                  }

                  goto LABEL_27;
                }
                objc_msgSend(v18, "addObject:", v27);

                ++v23;
                v24 = v21;
              }
              while (v20 != v23);
              v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
              if (v20)
                continue;
              break;
            }
          }
          else
          {
            v21 = 0;
          }

          objc_storeStrong((id *)&v7->_attributions, v18);
          objc_msgSend(v6, "supplementaryData");
          v33 = objc_claimAutoreleasedReturnValue();
          supplementaryData = v7->_supplementaryData;
          v7->_supplementaryData = (NSDictionary *)v33;

          objc_msgSend(v6, "score");
          v35 = objc_claimAutoreleasedReturnValue();
          score = v7->_score;
          v7->_score = (NSNumber *)v35;

          -[NSDictionary valueForKey:](v7->_supplementaryData, "valueForKey:", CFSTR("com_apple_mobilesms_resolvedURL"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            -[NSDictionary valueForKey:](v7->_supplementaryData, "valueForKey:", CFSTR("com_apple_mobilesms_resolvedURL"));
            v38 = objc_claimAutoreleasedReturnValue();
            resolvedURL = v7->_resolvedURL;
            v7->_resolvedURL = (NSURL *)v38;

          }
          goto LABEL_32;
        }
        if (a4)
        {
          v28 = (void *)objc_opt_class();
          v29 = 4;
          goto LABEL_26;
        }
LABEL_27:
        v32 = 0;
        goto LABEL_33;
      }
      if (!a4)
        goto LABEL_27;
      v28 = (void *)objc_opt_class();
      v29 = 3;
    }
    else
    {
      if (!a4)
        goto LABEL_27;
      v28 = (void *)objc_opt_class();
      v29 = 2;
    }
  }
  else
  {
    if (!a4)
      goto LABEL_27;
    v28 = (void *)objc_opt_class();
    v29 = 1;
  }
LABEL_26:
  objc_msgSend(v28, "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), v29, 0);
  v32 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v32;
}

- (id)portraitHighlight
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SLHighlight attributions](self, "attributions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v10 = objc_alloc(MEMORY[0x1E0D70C60]);
  -[SLHighlight identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight resourceURL](self, "resourceURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight timestamp](self, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight supplementaryData](self, "supplementaryData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight score](self, "score");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithIdentifier:resourceURL:timestamp:attributionIdentifiers:supplementaryData:score:", v11, v12, v13, v3, v14, v15);

  return v16;
}

- (SLHighlight)initWithCSSearchableItem:(id)a3
{
  return -[SLHighlight initWithCSSearchableItem:error:](self, "initWithCSSearchableItem:error:", a3, 0);
}

- (SLHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  id v6;
  SLHighlight *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSURL *v17;
  NSURL *resourceURL;
  void *v19;
  NSDictionary *supplementaryData;
  SLAttribution *v21;
  id v22;
  uint64_t v23;
  NSArray *attributions;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *v33;
  NSObject *resourceUTI;
  int v35;
  NSURL *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSURL *livePhotoComplementURL;
  SLHighlight *v43;
  void *v45;
  id v46;
  NSURL *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  objc_super v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SLHighlight;
  v7 = -[SLHighlight init](&v52, sel_init);
  if (!v7)
    goto LABEL_38;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:", CFSTR("com_apple_mobilesms_indexType"));
  objc_msgSend(v6, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForCustomKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("lnk"));
  objc_msgSend(v6, "domainIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("attachmentDomain"));

  if ((v13 & 1) != 0 || (v11 & 1) != 0)
  {
    objc_msgSend(v6, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || (objc_msgSend(v15, "URL"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v17 = v16;
      resourceURL = v7->_resourceURL;
      v7->_resourceURL = v17;

      -[SLHighlight _uniqueIdentifierForResourceURL:](v7, "_uniqueIdentifierForResourceURL:", v7->_resourceURL);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "length"))
      {
        objc_storeStrong((id *)&v7->_identifier, v19);
        supplementaryData = v7->_supplementaryData;
        v7->_supplementaryData = (NSDictionary *)MEMORY[0x1E0C9AA70];

        v51 = 0;
        v21 = -[SLAttribution initWithCSSearchableItem:error:]([SLAttribution alloc], "initWithCSSearchableItem:error:", v6, &v51);
        v22 = v51;
        if (v21)
        {
          v53[0] = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
          v23 = objc_claimAutoreleasedReturnValue();
          attributions = v7->_attributions;
          v7->_attributions = (NSArray *)v23;

          objc_msgSend(v15, "contentCreationDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            v46 = v22;
            v47 = v17;
            v49 = v25;
            objc_storeStrong((id *)&v7->_timestamp, v25);
            objc_msgSend(v15, "customAttributeDictionary");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKey:", CFSTR("com_apple_mobilesms_isSyndicatedContent"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = v27;
            v7->_syndicationType = objc_msgSend(v27, "unsignedIntegerValue");
            objc_msgSend(v15, "customAttributeDictionary");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectForKey:", CFSTR("com_apple_mobilesms_isSyndicatableMedia"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v7->_isSyndicatableMedia = objc_msgSend(v29, "BOOLValue");

            objc_msgSend(v15, "isLocal");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v7->_isLocalResource = objc_msgSend(v30, "BOOLValue");

            objc_msgSend(v15, "contentType");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v31;
            if (v31)
            {
              v33 = v31;
              resourceUTI = v7->_resourceUTI;
              v7->_resourceUTI = v33;
            }
            else
            {
              SLFrameworkLogHandle();
              resourceUTI = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(resourceUTI, OS_LOG_TYPE_ERROR))
                -[SLHighlight initWithCSSearchableItem:error:].cold.1(v6);
            }

            objc_msgSend(v15, "customAttributeDictionary");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKey:", CFSTR("com_apple_mobilesms_livePhotoComplementPath"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v40);
              v41 = objc_claimAutoreleasedReturnValue();
              livePhotoComplementURL = v7->_livePhotoComplementURL;
              v7->_livePhotoComplementURL = (NSURL *)v41;
            }
            else
            {
              livePhotoComplementURL = v7->_livePhotoComplementURL;
              v7->_livePhotoComplementURL = 0;
            }
            v17 = v47;

            v35 = 0;
            v22 = v46;
            v25 = v49;
          }
          else
          {
            if (a4)
            {
              objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 4, 0);
              v38 = (id)objc_claimAutoreleasedReturnValue();
              v25 = 0;
              *a4 = v38;
            }
            v35 = 1;
          }

        }
        else if (a4)
        {
          v50 = v22;
          objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 5, &v50);
          v48 = (id)objc_claimAutoreleasedReturnValue();
          v36 = v17;
          v37 = v50;

          *a4 = v48;
          v35 = 1;
          v22 = v37;
          v17 = v36;
          v21 = 0;
        }
        else
        {
          v35 = 1;
        }

      }
      else
      {
        if (a4)
        {
          objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 2, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v35 = 1;
      }

    }
    else
    {
      if (a4)
      {
        objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 3, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v35 = 1;
    }

    if (v35)
      goto LABEL_37;
LABEL_38:
    v43 = v7;
    goto LABEL_39;
  }
  SLFrameworkLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SLHighlight initWithCSSearchableItem:error:].cold.2(v6);

  if (a4)
  {
    objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 6, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_37:
  v43 = 0;
LABEL_39:

  return v43;
}

- (SLHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SLHighlight *v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  id v19;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    +[SLHighlight requiredSpotlightAttributeKeys](SLHighlight, "requiredSpotlightAttributeKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    +[SLCoreSpotlightUtilities fetchCSSearchableItemForUniqueIdentifier:forContentType:withRequiredAttributes:error:](SLCoreSpotlightUtilities, "fetchCSSearchableItemForUniqueIdentifier:forContentType:withRequiredAttributes:error:", v8, v6, v10, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v11)
    {
      self = -[SLHighlight initWithCSSearchableItem:error:](self, "initWithCSSearchableItem:error:", v11, a5);
      v13 = self;
    }
    else if (a5)
    {
      v18 = v12;
      objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 7, &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;

      v16 = v14;
      v13 = 0;
      *a5 = v16;
      v12 = v15;
    }
    else
    {
      v13 = 0;
    }

  }
  else if (a5)
  {
    objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 8, 0);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (SLHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4
{
  return -[SLHighlight initWithCSSearchableItemUniqueIdentifier:forContentType:error:](self, "initWithCSSearchableItemUniqueIdentifier:forContentType:error:", a3, 1, a4);
}

+ (id)requiredSpotlightAttributeKeys
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[20];

  v13[19] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0CA5F90];
  v13[0] = *MEMORY[0x1E0CA5F30];
  v13[1] = v3;
  v4 = *MEMORY[0x1E0CA6040];
  v13[2] = *MEMORY[0x1E0CA6018];
  v13[3] = v4;
  v5 = *MEMORY[0x1E0CA6060];
  v13[4] = *MEMORY[0x1E0CA6048];
  v13[5] = v5;
  v6 = *MEMORY[0x1E0CA60F8];
  v13[6] = *MEMORY[0x1E0CA60D0];
  v13[7] = v6;
  v7 = *MEMORY[0x1E0CA6198];
  v13[8] = *MEMORY[0x1E0CA6108];
  v13[9] = v7;
  v8 = *MEMORY[0x1E0CA6510];
  v13[10] = *MEMORY[0x1E0CA63F8];
  v13[11] = v8;
  v9 = *MEMORY[0x1E0CA6978];
  v13[12] = *MEMORY[0x1E0CA6710];
  v13[13] = v9;
  v13[14] = CFSTR("com_apple_mobilesms_livePhotoComplementPath");
  v13[15] = CFSTR("com_apple_mobilesms_groupPhotoPath");
  v13[16] = CFSTR("com_apple_mobilesms_isSyndicatedContent");
  v13[17] = CFSTR("com_apple_mobilesms_isSyndicatableMedia");
  v13[18] = *MEMORY[0x1E0CA6900];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SLHighlight)initWithDictionary:(id)a3
{
  id v4;
  SLHighlight *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  SLAttribution *v15;
  SLAttribution *v16;
  void *v17;
  void *v18;
  NSDate *v19;
  NSObject *p_super;
  NSObject *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *supplementaryData;
  uint64_t v28;
  NSString *resourceUTI;
  uint64_t v30;
  NSNumber *score;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSURL *livePhotoComplementURL;
  void *v37;
  NSURL *v38;
  NSURL *resolvedURL;
  NSObject *v40;
  SLHighlight *v41;
  void *v43;
  NSObject *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SLHighlight;
  v5 = -[SLHighlight init](&v50, sel_init);
  if (!v5)
    goto LABEL_37;
  objc_msgSend(v4, "objectForKey:", CFSTR("i"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&v5->_identifier, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("ru"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7),
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v44 = v8;
      v45 = v7;
      objc_storeStrong((id *)&v5->_resourceURL, v8);
      v9 = (void *)objc_opt_new();
      objc_msgSend(v4, "objectForKey:", CFSTR("a"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v47;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v47 != v13)
              objc_enumerationMutation(v10);
            v15 = -[SLAttribution initWithDictionary:]([SLAttribution alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
            if (!v15)
            {
              SLFrameworkLogHandle();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                -[SLHighlight initWithDictionary:].cold.5();
              v22 = 1;
              v25 = v10;
              v21 = v44;
              v7 = v45;
              goto LABEL_34;
            }
            v16 = v15;
            objc_msgSend(v9, "addObject:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
          if (v12)
            continue;
          break;
        }
      }

      objc_storeStrong((id *)&v5->_attributions, v9);
      objc_msgSend(v4, "objectForKey:", CFSTR("t"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v19 = v17;
        p_super = &v5->_timestamp->super;
        v5->_timestamp = v19;
      }
      else
      {
        SLFrameworkLogHandle();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          -[SLHighlight initWithDictionary:].cold.4();
      }
      v43 = v18;

      objc_msgSend(v4, "objectForKey:", CFSTR("sd"));
      v26 = objc_claimAutoreleasedReturnValue();
      supplementaryData = v5->_supplementaryData;
      v5->_supplementaryData = (NSDictionary *)v26;

      objc_msgSend(v4, "objectForKey:", CFSTR("rt"));
      v28 = objc_claimAutoreleasedReturnValue();
      resourceUTI = v5->_resourceUTI;
      v5->_resourceUTI = (NSString *)v28;

      objc_msgSend(v4, "objectForKey:", CFSTR("sc"));
      v30 = objc_claimAutoreleasedReturnValue();
      score = v5->_score;
      v5->_score = (NSNumber *)v30;

      objc_msgSend(v4, "objectForKey:", CFSTR("st"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_syndicationType = objc_msgSend(v32, "unsignedIntegerValue");

      objc_msgSend(v4, "objectForKey:", CFSTR("m"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isSyndicatableMedia = objc_msgSend(v33, "BOOLValue");

      objc_msgSend(v4, "objectForKey:", CFSTR("lr"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isLocalResource = objc_msgSend(v34, "BOOLValue");

      objc_msgSend(v4, "objectForKey:", CFSTR("lp"));
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
        v35 = objc_claimAutoreleasedReturnValue();
        livePhotoComplementURL = v5->_livePhotoComplementURL;
        v5->_livePhotoComplementURL = (NSURL *)v35;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("com_apple_mobilesms_resolvedURL"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v45;
      if (v37
        && (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v37),
            (v38 = (NSURL *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        resolvedURL = v5->_resolvedURL;
        v5->_resolvedURL = v38;
        v40 = v38;

      }
      else
      {
        SLFrameworkLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          -[SLHighlight initWithDictionary:].cold.3();
      }

      v22 = 0;
      v25 = v43;
      v21 = v44;
LABEL_34:

    }
    else
    {
      SLFrameworkLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SLHighlight initWithDictionary:].cold.2();
      v22 = 1;
    }

    if (v22)
      goto LABEL_36;
LABEL_37:
    v41 = v5;
    goto LABEL_38;
  }
  SLFrameworkLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[SLHighlight initWithDictionary:].cold.1();

LABEL_36:
  v41 = 0;
LABEL_38:

  return v41;
}

- (id)dictionaryRepresentation
{
  void *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    SLFrameworkLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[SLHighlight dictionaryRepresentation].cold.1();
LABEL_35:

LABEL_36:
    v36 = 0;
    goto LABEL_37;
  }
  -[SLHighlight identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("i"));

  -[SLHighlight resourceURL](self, "resourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    SLFrameworkLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[SLHighlight dictionaryRepresentation].cold.2();
    goto LABEL_35;
  }
  -[SLHighlight resourceURL](self, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ru"));

  -[SLHighlight timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLFrameworkLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[SLHighlight dictionaryRepresentation].cold.3();
    goto LABEL_35;
  }
  -[SLHighlight timestamp](self, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("t"));

  -[SLHighlight attributions](self, "attributions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    SLFrameworkLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[SLHighlight dictionaryRepresentation].cold.4();
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[SLHighlight attributions](self, "attributions", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v18, "dictionaryRepresentation");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          SLFrameworkLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[SLHighlight dictionaryRepresentation].cold.5((uint64_t)v18, v38);

          goto LABEL_36;
        }
        v20 = (void *)v19;
        objc_msgSend(v12, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("a"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLHighlight isLocalResource](self, "isLocalResource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("lr"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SLHighlight syndicationType](self, "syndicationType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("st"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLHighlight isSyndicatableMedia](self, "isSyndicatableMedia"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("m"));

  -[SLHighlight score](self, "score");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SLHighlight score](self, "score");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("sc"));

  }
  -[SLHighlight supplementaryData](self, "supplementaryData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SLHighlight supplementaryData](self, "supplementaryData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("sd"));

  }
  -[SLHighlight resolvedURL](self, "resolvedURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SLHighlight resolvedURL](self, "resolvedURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "path");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("rs"));

  }
  -[SLHighlight resourceUTI](self, "resourceUTI");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SLHighlight resourceUTI](self, "resourceUTI");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("rt"));

  }
  -[SLHighlight livePhotoComplementURL](self, "livePhotoComplementURL");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SLHighlight livePhotoComplementURL](self, "livePhotoComplementURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("lp"));

  }
  v36 = v3;
LABEL_37:

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLHighlight)initWithCoder:(id)a3
{
  id v4;
  SLHighlight *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSURL *resourceURL;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *attributions;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *supplementaryData;
  uint64_t v18;
  NSNumber *score;
  void *v20;
  uint64_t v21;
  NSDate *timestamp;
  uint64_t v23;
  NSURL *resolvedURL;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *resourceUTI;
  uint64_t v29;
  NSURL *livePhotoComplementURL;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SLHighlight;
  v5 = -[SLHighlight init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ru"));
    v8 = objc_claimAutoreleasedReturnValue();
    resourceURL = v5->_resourceURL;
    v5->_resourceURL = (NSURL *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("a"));
    v13 = objc_claimAutoreleasedReturnValue();
    attributions = v5->_attributions;
    v5->_attributions = (NSArray *)v13;

    v15 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v15, objc_opt_class(), CFSTR("sd"));
    v16 = objc_claimAutoreleasedReturnValue();
    supplementaryData = v5->_supplementaryData;
    v5->_supplementaryData = (NSDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sc"));
    v18 = objc_claimAutoreleasedReturnValue();
    score = v5->_score;
    v5->_score = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("st"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_syndicationType = objc_msgSend(v20, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
    v21 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com_apple_mobilesms_resolvedURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    resolvedURL = v5->_resolvedURL;
    v5->_resolvedURL = (NSURL *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("m"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSyndicatableMedia = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lr"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isLocalResource = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rt"));
    v27 = objc_claimAutoreleasedReturnValue();
    resourceUTI = v5->_resourceUTI;
    v5->_resourceUTI = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lp"));
    v29 = objc_claimAutoreleasedReturnValue();
    livePhotoComplementURL = v5->_livePhotoComplementURL;
    v5->_livePhotoComplementURL = (NSURL *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  id v16;

  v4 = a3;
  -[SLHighlight identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("i"));

  -[SLHighlight resourceURL](self, "resourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ru"));

  -[SLHighlight attributions](self, "attributions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("a"));

  -[SLHighlight supplementaryData](self, "supplementaryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sd"));

  -[SLHighlight resolvedURL](self, "resolvedURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("com_apple_mobilesms_resolvedURL"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SLHighlight syndicationType](self, "syndicationType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("st"));

  -[SLHighlight timestamp](self, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("t"));

  -[SLHighlight score](self, "score");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("sc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLHighlight isSyndicatableMedia](self, "isSyndicatableMedia"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("m"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLHighlight isLocalResource](self, "isLocalResource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("lr"));

  -[SLHighlight resourceUTI](self, "resourceUTI");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("rt"));

  -[SLHighlight livePhotoComplementURL](self, "livePhotoComplementURL");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("lp"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SLHighlight *v4;
  void *v5;
  SLHighlight *v6;

  v4 = [SLHighlight alloc];
  -[SLHighlight dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLHighlight initWithDictionary:](v4, "initWithDictionary:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  void *v24;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SLHighlight identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLHighlight identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_20;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_20;
      }
    }
    -[SLHighlight resourceURL](self, "resourceURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v6, "resourceURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_15;
    }
    -[SLHighlight resourceURL](self, "resourceURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourceURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    if (v12)
    {

      if (!v15)
        goto LABEL_20;
LABEL_15:
      -[SLHighlight attributions](self, "attributions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      if (v17
        || (objc_msgSend(v6, "attributions"), v3 = (void *)objc_claimAutoreleasedReturnValue(),
                                              objc_msgSend(v3, "count")))
      {
        -[SLHighlight attributions](self, "attributions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        objc_msgSend(v6, "attributions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (!v17)
        if (v19 != v21)
          goto LABEL_20;
      }
      else
      {

      }
      -[SLHighlight attributions](self, "attributions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v23, "isEqualToArray:", v24);

      goto LABEL_21;
    }

    if ((v15 & 1) != 0)
      goto LABEL_15;
LABEL_20:
    v11 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SLHighlight identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLHighlight resourceURL](self, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SLHighlight attributions](self, "attributions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight resourceURL](self, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight supplementaryData](self, "supplementaryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: identifier: %@  resourceURL: %@ supplementaryData: %@]"), v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAttributions:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_attributions, a3);
    v5 = v6;
  }

}

- (id)_uniqueIdentifierForResourceURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "Sha256ForData:withSalt:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorForHighlightDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5
{
  id v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  switch(a4)
  {
    case 1:
      v27 = *MEMORY[0x1E0CB2938];
      v28[0] = CFSTR("SLHighlight Init failed. Invalid or nil PPSocialHighlight.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (const __CFString **)v28;
      v10 = &v27;
      goto LABEL_11;
    case 2:
      v25 = *MEMORY[0x1E0CB2938];
      v26 = CFSTR("SLHighlight Init failed. PPSocialHighlight contains an invalid or nil identifier.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v26;
      v10 = &v25;
      goto LABEL_11;
    case 3:
      v23 = *MEMORY[0x1E0CB2938];
      v24 = CFSTR("SLHighlight Init failed. PPSocialHighlight contains an invalid or nil URL.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v24;
      v10 = &v23;
      goto LABEL_11;
    case 4:
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("SLHighlight Init failed. PPSocialHighlight contains an invalid or nil timestamp.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v22;
      v10 = &v21;
      goto LABEL_11;
    case 5:
      v19 = *MEMORY[0x1E0CB2938];
      v20 = CFSTR("SLHighlight Init failed.  One of the attribution identifiers in PPSocialHighlight is invalid or nil.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v20;
      v10 = &v19;
      goto LABEL_11;
    case 6:
      v17 = *MEMORY[0x1E0CB2938];
      v18 = CFSTR("SLHighlight Init failed. CSSearchableItem contains an invalid or nil domain identifier.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v18;
      v10 = &v17;
      goto LABEL_11;
    case 7:
      v15 = *MEMORY[0x1E0CB2938];
      v16 = CFSTR("SLHighlight Init failed. Failed to fetch CSSearchableItem.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v16;
      v10 = &v15;
LABEL_11:
      objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
        goto LABEL_12;
      goto LABEL_13;
    default:
      v11 = 0;
      if (!a5)
        goto LABEL_13;
LABEL_12:
      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v12, "setObject:forKey:", *a5, *MEMORY[0x1E0CB3388]);

      v11 = v12;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, a4, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (NSDictionary)supplementaryData
{
  return self->_supplementaryData;
}

- (NSNumber)score
{
  return self->_score;
}

- (BOOL)isLocalResource
{
  return self->_isLocalResource;
}

- (BOOL)isSyndicatableMedia
{
  return self->_isSyndicatableMedia;
}

- (NSURL)livePhotoComplementURL
{
  return self->_livePhotoComplementURL;
}

- (NSString)resourceUTI
{
  return self->_resourceUTI;
}

- (unint64_t)syndicationType
{
  return self->_syndicationType;
}

- (NSURL)resolvedURL
{
  return self->_resolvedURL;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_resourceUTI, 0);
  objc_storeStrong((id *)&self->_livePhotoComplementURL, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_supplementaryData, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCSSearchableItem:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "WARNING: Item with unique identifier %@ had a nil UTI.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)initWithCSSearchableItem:(void *)a1 error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "domainIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_199EFF000, v2, v3, "Attempted to initialize SLH using a CSSearchableItem outside the attachment/links domain. Failing initialization from CSSearchableItem. domain: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)initWithDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLH dictionary identifier was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLH dictionary resourceURL was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLH dictionary resolvedURL was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLH dictionary timestamp was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLH dictionary attribution was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dictionaryRepresentation
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "SLH an SLA failed dictionary serialization. Failing dictionary serialization for the SLH as well. Offending SLA: %@", (uint8_t *)&v2, 0xCu);
}

@end
