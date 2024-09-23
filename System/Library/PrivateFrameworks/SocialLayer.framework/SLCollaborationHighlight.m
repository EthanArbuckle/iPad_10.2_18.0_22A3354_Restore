@implementation SLCollaborationHighlight

- (SLCollaborationHighlight)initWithPortraitCollaborationHighlight:(id)a3 error:(id *)a4
{
  id v6;
  SLCollaborationHighlight *v7;
  void *v8;
  uint64_t v9;
  NSString *collaborationIdentifier;
  SLCollaborationHighlight *v11;
  uint64_t v12;
  NSString *fileName;
  uint64_t v14;
  NSString *contentType;
  uint64_t v16;
  NSDate *creationDate;
  void *v18;
  uint64_t v19;
  NSDictionary *earliestAttributionIdentifiers;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSString *fileProviderID;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  SWPersonIdentity *localIdentity;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  _SWPersonIdentityProof *v37;
  _SWPersonIdentityProof *v38;
  _SWPersonIdentityProof *localProofOfInclusion;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  NSDictionary *v49;
  NSDictionary *v50;
  NSDictionary *handleToIdentityMap;
  NSObject *v52;
  NSObject *v53;
  id v55;
  id v56;
  id v57;
  objc_super v58;

  v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SLCollaborationHighlight;
  v7 = -[SLHighlight initWithPortraitHighlight:error:](&v58, sel_initWithPortraitHighlight_error_, v6, a4);
  if (!v7)
  {
LABEL_64:
    v11 = v7;
    goto LABEL_65;
  }
  objc_msgSend(v6, "collaborationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v6, "collaborationIdentifier");
  else
    objc_msgSend(v6, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  collaborationIdentifier = v7->_collaborationIdentifier;
  v7->_collaborationIdentifier = (NSString *)v9;

  objc_msgSend(v6, "contentDisplayName");
  v11 = (SLCollaborationHighlight *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "contentDisplayName");
    v12 = objc_claimAutoreleasedReturnValue();
    fileName = v7->_fileName;
    v7->_fileName = (NSString *)v12;

    objc_msgSend(v6, "contentType");
    v11 = (SLCollaborationHighlight *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v6, "contentType");
      v14 = objc_claimAutoreleasedReturnValue();
      contentType = v7->_contentType;
      v7->_contentType = (NSString *)v14;

      objc_msgSend(v6, "creationDate");
      v11 = (SLCollaborationHighlight *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "creationDate");
        v16 = objc_claimAutoreleasedReturnValue();
        creationDate = v7->_creationDate;
        v7->_creationDate = (NSDate *)v16;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "earliestAttributionIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v6, "earliestAttributionIdentifiers");
            v19 = objc_claimAutoreleasedReturnValue();
            earliestAttributionIdentifiers = v7->_earliestAttributionIdentifiers;
            v7->_earliestAttributionIdentifiers = (NSDictionary *)v19;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 4, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            earliestAttributionIdentifiers = v7->_earliestAttributionIdentifiers;
            v7->_earliestAttributionIdentifiers = 0;
          }

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "fileProviderId");
          v23 = objc_claimAutoreleasedReturnValue();
          fileProviderID = v7->_fileProviderID;
          v7->_fileProviderID = (NSString *)v23;
        }
        else
        {
          if (a4)
          {
            objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 5, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          fileProviderID = v7->_fileProviderID;
          v7->_fileProviderID = 0;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v6, "localIdentity"),
              v25 = (void *)objc_claimAutoreleasedReturnValue(),
              v25,
              v25))
        {
          v26 = (void *)MEMORY[0x1E0CB3710];
          v27 = objc_opt_class();
          objc_msgSend(v6, "localIdentity");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          objc_msgSend(v26, "unarchivedObjectOfClass:fromData:error:", v27, v28, &v57);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          localIdentity = (SWPersonIdentity *)v57;

          if (localIdentity || !v29)
          {
            SLFrameworkLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:].cold.4();

            if (a4)
              *a4 = objc_retainAutorelease(localIdentity);
          }
          else
          {
            objc_storeStrong((id *)&v7->_localIdentity, v29);
          }

        }
        else
        {
          if (a4)
          {
            objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 7, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          localIdentity = v7->_localIdentity;
          v7->_localIdentity = 0;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v6, "localIdentityProof"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              v32,
              v32))
        {
          v33 = (void *)MEMORY[0x1E0CB3710];
          v34 = objc_opt_class();
          objc_msgSend(v6, "localIdentityProof");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
          objc_msgSend(v33, "unarchivedObjectOfClass:fromData:error:", v34, v35, &v56);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (_SWPersonIdentityProof *)v56;

          if (v37 || !v36)
          {
            if (a4)
              *a4 = objc_retainAutorelease(v37);
            SLFrameworkLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:].cold.3();

            localProofOfInclusion = v7->_localProofOfInclusion;
            v7->_localProofOfInclusion = 0;
          }
          else
          {
            v38 = v36;
            localProofOfInclusion = v7->_localProofOfInclusion;
            v7->_localProofOfInclusion = v38;
          }

        }
        else
        {
          if (a4)
          {
            objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 6, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          v37 = v7->_localProofOfInclusion;
          v7->_localProofOfInclusion = 0;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(v6, "handleToIdentityMap"),
              v41 = (void *)objc_claimAutoreleasedReturnValue(),
              v41,
              v41))
        {
          v42 = (void *)MEMORY[0x1E0CB3710];
          v43 = (void *)MEMORY[0x1E0C99E60];
          v44 = objc_opt_class();
          v45 = objc_opt_class();
          objc_msgSend(v43, "setWithObjects:", v44, v45, objc_opt_class(), 0);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handleToIdentityMap");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
          objc_msgSend(v42, "unarchivedObjectOfClasses:fromData:error:", v46, v47, &v55);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = (NSDictionary *)v55;

          if (v49 || !v48)
          {
            SLFrameworkLogHandle();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:].cold.2();

            if (a4)
              *a4 = objc_retainAutorelease(v49);
            handleToIdentityMap = v7->_handleToIdentityMap;
            v7->_handleToIdentityMap = 0;
          }
          else
          {
            v50 = v48;
            handleToIdentityMap = v7->_handleToIdentityMap;
            v7->_handleToIdentityMap = v50;
          }

        }
        else
        {
          SLFrameworkLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:].cold.1();

          v49 = v7->_handleToIdentityMap;
          v7->_handleToIdentityMap = 0;
        }

        goto LABEL_64;
      }
      v21 = (void *)objc_opt_class();
      v22 = 2;
    }
    else
    {
      v21 = (void *)objc_opt_class();
      v22 = 3;
    }
  }
  else
  {
    v21 = (void *)objc_opt_class();
    v22 = 1;
  }
  objc_msgSend(v21, "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), v22, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_65:

  return v11;
}

- (SLCollaborationHighlight)initWithAttribution:(id)a3
{
  SLCollaborationHighlight *v3;
  SLCollaborationHighlight *v4;
  NSString *fileName;
  uint64_t v6;
  NSDate *creationDate;
  NSString *contentType;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SLCollaborationHighlight;
  v3 = -[SLHighlight initWithAttribution:](&v10, sel_initWithAttribution_, a3);
  v4 = v3;
  if (v3)
  {
    fileName = v3->_fileName;
    v3->_fileName = (NSString *)&stru_1E3797070;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    creationDate = v4->_creationDate;
    v4->_creationDate = (NSDate *)v6;

    contentType = v4->_contentType;
    v4->_contentType = (NSString *)&stru_1E3797070;

  }
  return v4;
}

- (SLCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  SLCollaborationHighlight *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  id v19;

  v6 = a4;
  v8 = a3;
  if (v8)
  {
    if (v6 > 1)
    {
      v9 = 0;
    }
    else
    {
      +[SLCollaborationHighlight requiredSpotlightAttributeKeysforHighlightType:](SLCollaborationHighlight, "requiredSpotlightAttributeKeysforHighlightType:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[SLCoreSpotlightUtilities fetchCSSearchableItemForUniqueIdentifier:forContentType:withRequiredAttributes:error:](SLCoreSpotlightUtilities, "fetchCSSearchableItemForUniqueIdentifier:forContentType:withRequiredAttributes:error:", v8, v6, v11, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;

    if (v12)
    {
      self = -[SLCollaborationHighlight initWithCSSearchableItem:error:](self, "initWithCSSearchableItem:error:", v12, a5);
      v10 = self;
    }
    else if (a5)
    {
      v18 = v13;
      +[SLHighlight errorForHighlightDomain:andCode:andUnderlyingError:](SLHighlight, "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 7, &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;

      v16 = v14;
      v10 = 0;
      *a5 = v16;
      v13 = v15;
    }
    else
    {
      v10 = 0;
    }

  }
  else if (a5)
  {
    +[SLHighlight errorForHighlightDomain:andCode:andUnderlyingError:](SLHighlight, "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 8, 0);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SLCollaborationHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  id v6;
  SLCollaborationHighlight *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *fileName;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *contentType;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  NSString *v28;
  NSString *collaborationIdentifier;
  NSObject *v30;
  uint64_t v31;
  SLCollaborationHighlight *v32;
  void *v34;
  uint8_t buf[16];
  objc_super v36;

  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SLCollaborationHighlight;
  v7 = -[SLHighlight initWithCSSearchableItem:error:](&v36, sel_initWithCSSearchableItem_error_, v6, a4);
  if (!v7)
    goto LABEL_35;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:", CFSTR("com_apple_mobilesms_indexType"));
  objc_msgSend(v6, "attributeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForCustomKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("lnk"));
  objc_msgSend(v6, "domainIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("attachmentDomain"));

  if ((v13 & 1) == 0 && (v11 & 1) == 0)
  {
    SLFrameworkLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SLCollaborationHighlight initWithCSSearchableItem:error:].cold.1(v6, v14);

    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLHighlightErrorDomain"), 6, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_34;
  }
  objc_msgSend(v6, "attributeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filename");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    fileName = v7->_fileName;
    v7->_fileName = v18;
LABEL_13:

    goto LABEL_14;
  }
  if (v11)
  {
    fileName = v7->_fileName;
    v7->_fileName = (NSString *)CFSTR("Gelato Collaboration");
    goto LABEL_13;
  }
  if (a4)
  {
    v24 = 1;
    objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
LABEL_14:
  objc_msgSend(v15, "contentCreationDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 2, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = 1;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v7->_creationDate, v20);
  objc_msgSend(v15, "contentType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v21;
  if (v21)
  {
    v22 = v21;
    contentType = v7->_contentType;
    v7->_contentType = v22;
LABEL_22:

LABEL_23:
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:", CFSTR("com_apple_mobilesms_collaborationIdentifier"));
    objc_msgSend(v6, "attributeSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "valueForCustomKey:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = v27;
      collaborationIdentifier = v7->_collaborationIdentifier;
      v7->_collaborationIdentifier = v28;
    }
    else
    {
      SLFrameworkLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199EFF000, v30, OS_LOG_TYPE_INFO, "SLCH collaborationIdentifier was nil defaulting to identifier.", buf, 2u);
      }

      -[SLHighlight identifier](v7, "identifier");
      v31 = objc_claimAutoreleasedReturnValue();
      collaborationIdentifier = v7->_collaborationIdentifier;
      v7->_collaborationIdentifier = (NSString *)v31;
    }

    v24 = 0;
    goto LABEL_31;
  }
  if (v11)
  {
    contentType = v7->_contentType;
    v7->_contentType = (NSString *)CFSTR("public.link");
    goto LABEL_22;
  }
  if (!a4)
    goto LABEL_23;
  objc_msgSend((id)objc_opt_class(), "errorForCollaborationHighlightDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLCollaborationHighlightErrorDomain"), 3, 0);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 1;
LABEL_31:

LABEL_32:
LABEL_33:

  if (!v24)
  {
LABEL_35:
    v32 = v7;
    goto LABEL_36;
  }
LABEL_34:
  v32 = 0;
LABEL_36:

  return v32;
}

+ (id)requiredSpotlightAttributeKeysforHighlightType:(unsigned __int8)a3
{
  void *v3;

  if (a3)
  {
    if (a3 == 1)
    {
      +[SLCoreSpotlightUtilities requiredSpotlightAttributeKeysForFiles](SLCoreSpotlightUtilities, "requiredSpotlightAttributeKeysForFiles");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    +[SLCoreSpotlightUtilities requiredSpotlightAttributeKeysForLinks](SLCoreSpotlightUtilities, "requiredSpotlightAttributeKeysForLinks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (SLCollaborationHighlight)initWithDictionary:(id)a3
{
  id v4;
  SLCollaborationHighlight *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSObject *collaborationIdentifier;
  NSObject *v13;
  SLCollaborationHighlight *v14;
  uint64_t v15;
  NSString *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLCollaborationHighlight;
  v5 = -[SLHighlight initWithDictionary:](&v18, sel_initWithDictionary_, v4);
  if (!v5)
  {
LABEL_18:
    v14 = v5;
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("fn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_storeStrong((id *)&v5->_fileName, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("cd"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_storeStrong((id *)&v5->_creationDate, v7);
      objc_msgSend(v4, "objectForKey:", CFSTR("ct"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        objc_storeStrong((id *)&v5->_contentType, v9);
        objc_msgSend(v4, "objectForKey:", CFSTR("ci"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          v11 = v10;
          collaborationIdentifier = v5->_collaborationIdentifier;
          v5->_collaborationIdentifier = v11;
        }
        else
        {
          -[SLHighlight identifier](v5, "identifier");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v5->_collaborationIdentifier;
          v5->_collaborationIdentifier = (NSString *)v15;

          SLFrameworkLogHandle();
          collaborationIdentifier = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(collaborationIdentifier, OS_LOG_TYPE_ERROR))
            -[SLCollaborationHighlight initWithDictionary:].cold.4();
        }

        goto LABEL_18;
      }
      SLFrameworkLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SLCollaborationHighlight initWithDictionary:].cold.3();

    }
    else
    {
      SLFrameworkLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SLCollaborationHighlight initWithDictionary:].cold.2();
    }
  }
  else
  {
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SLCollaborationHighlight initWithDictionary:].cold.1();
  }

  v14 = 0;
LABEL_19:

  return v14;
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
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SLCollaborationHighlight;
  -[SLHighlight dictionaryRepresentation](&v17, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SLCollaborationHighlight fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLCollaborationHighlight dictionaryRepresentation].cold.1();
    goto LABEL_12;
  }
  -[SLCollaborationHighlight fileName](self, "fileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("fn"));

  -[SLCollaborationHighlight creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLCollaborationHighlight dictionaryRepresentation].cold.2();
    goto LABEL_12;
  }
  -[SLCollaborationHighlight creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("cd"));

  -[SLCollaborationHighlight contentType](self, "contentType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    SLFrameworkLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SLCollaborationHighlight dictionaryRepresentation].cold.3();
LABEL_12:

    v14 = 0;
    goto LABEL_16;
  }
  -[SLCollaborationHighlight contentType](self, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("ct"));

  -[SLCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SLCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("ci"));
  }
  else
  {
    -[SLHighlight identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("ci"));

    SLFrameworkLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SLCollaborationHighlight dictionaryRepresentation].cold.4();
  }

  v14 = v4;
LABEL_16:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationHighlight)initWithCoder:(id)a3
{
  id v4;
  SLCollaborationHighlight *v5;
  uint64_t v6;
  NSString *fileName;
  uint64_t v8;
  NSDate *creationDate;
  uint64_t v10;
  NSString *contentType;
  uint64_t v12;
  NSString *collaborationIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLCollaborationHighlight;
  v5 = -[SLHighlight initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fn"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cd"));
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ct"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ci"));
    v12 = objc_claimAutoreleasedReturnValue();
    collaborationIdentifier = v5->_collaborationIdentifier;
    v5->_collaborationIdentifier = (NSString *)v12;

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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SLCollaborationHighlight;
  v4 = a3;
  -[SLHighlight encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[SLCollaborationHighlight fileName](self, "fileName", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fn"));

  -[SLCollaborationHighlight creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("cd"));

  -[SLCollaborationHighlight contentType](self, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ct"));

  -[SLCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("ci"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SLCollaborationHighlight *v4;
  void *v5;
  SLCollaborationHighlight *v6;

  v4 = [SLCollaborationHighlight alloc];
  -[SLCollaborationHighlight dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLCollaborationHighlight initWithDictionary:](v4, "initWithDictionary:", v5);

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
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v24.receiver = self;
    v24.super_class = (Class)SLCollaborationHighlight;
    if (-[SLHighlight isEqual:](&v24, sel_isEqual_, v6))
    {
      -[SLCollaborationHighlight fileName](self, "fileName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || (objc_msgSend(v6, "fileName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SLCollaborationHighlight fileName](self, "fileName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fileName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v7)
        {

          if (!v10)
            goto LABEL_25;
        }
        else
        {

          if ((v10 & 1) == 0)
            goto LABEL_25;
        }
      }
      -[SLCollaborationHighlight creationDate](self, "creationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 || (objc_msgSend(v6, "creationDate"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[SLCollaborationHighlight creationDate](self, "creationDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "creationDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v12)
        {

          if (!v15)
            goto LABEL_25;
        }
        else
        {

          if ((v15 & 1) == 0)
            goto LABEL_25;
        }
      }
      -[SLCollaborationHighlight contentType](self, "contentType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(v6, "contentType");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
LABEL_20:
          -[SLCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20
            || (objc_msgSend(v6, "collaborationIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[SLCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "collaborationIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v21, "isEqualToString:", v22);

            if (v20)
            {
LABEL_30:

              goto LABEL_26;
            }
          }
          else
          {
            v11 = 1;
          }

          goto LABEL_30;
        }
      }
      -[SLCollaborationHighlight contentType](self, "contentType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if (v16)
      {

        if (v19)
          goto LABEL_20;
      }
      else
      {

        if ((v19 & 1) != 0)
          goto LABEL_20;
      }
    }
LABEL_25:
    v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v11 = 0;
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SLHighlight identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
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
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationHighlight collaborationIdentifier](self, "collaborationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight resourceURL](self, "resourceURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlight supplementaryData](self, "supplementaryData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationHighlight fileName](self, "fileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLCollaborationHighlight contentType](self, "contentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: collaborationIdentifier: %@  resourceURL: %@ supplementaryData: %@ fileName: %@ contentType: %@]"), v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)errorForCollaborationHighlightDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5
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
      v28[0] = CFSTR("SLCollaborationHighlight Init failed. Invalid or nil File Name.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (const __CFString **)v28;
      v10 = &v27;
      goto LABEL_11;
    case 2:
      v25 = *MEMORY[0x1E0CB2938];
      v26 = CFSTR("SLCollaborationHighlight Init failed. Invalid or nil content creation date.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v26;
      v10 = &v25;
      goto LABEL_11;
    case 3:
      v23 = *MEMORY[0x1E0CB2938];
      v24 = CFSTR("SLCollaborationHighlight Init failed. Invalid or nil content type.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v24;
      v10 = &v23;
      goto LABEL_11;
    case 4:
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("SLCollaborationHighlight Init. Invalid or nil earliest attributions Identifiers.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v22;
      v10 = &v21;
      goto LABEL_11;
    case 5:
      v19 = *MEMORY[0x1E0CB2938];
      v20 = CFSTR("SLCollaborationHighlight Init error. Invalid or nil fileProviderID defaulting to nil.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v20;
      v10 = &v19;
      goto LABEL_11;
    case 6:
      v15 = *MEMORY[0x1E0CB2938];
      v16 = CFSTR("SLCollaborationHighlight Init failed. Invalid or nil localIdentityProof defaulting to nil.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v16;
      v10 = &v15;
      goto LABEL_11;
    case 7:
      v17 = *MEMORY[0x1E0CB2938];
      v18 = CFSTR("SLCollaborationHighlight Init error. Invalid or nil localIdentity defaulting to nil.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v18;
      v10 = &v17;
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

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSDictionary)earliestAttributionIdentifiers
{
  return self->_earliestAttributionIdentifiers;
}

- (NSString)fileProviderID
{
  return self->_fileProviderID;
}

- (SWPersonIdentity)localIdentity
{
  return self->_localIdentity;
}

- (_SWPersonIdentityProof)localProofOfInclusion
{
  return self->_localProofOfInclusion;
}

- (NSDictionary)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_localProofOfInclusion, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_fileProviderID, 0);
  objc_storeStrong((id *)&self->_earliestAttributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_3_1();
  _os_log_debug_impl(&dword_199EFF000, v0, OS_LOG_TYPE_DEBUG, "-[PPSocialCollaboration handleToIdentityMap] is nil. This may mean this process is not entitled to have this property surfaced.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, v0, v1, "Could not unarchive handleToIdentityMap from -[PPSocialCollaboration handleToIdentityMap]: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, v0, v1, "Could not unarchive SWPersonIdentityProof from -[PPSocialCollaboration localIdentityProof]: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, v0, v1, "Could not unarchive SWPersonIdentity from -[PPSocialCollaboration localIdentity]: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithCSSearchableItem:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v4, "Attempted to initialize SLCH using a CSSearchableItem outside the attachment/links domain. Failing initialization from CSSearchableItem. domain: %@", v5);

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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLCH dictionary fileName was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLCH dictionary creationDate was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLCH dictionary contentType was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLCH dictionary collaborationIdentifier was nil defaulting to identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dictionaryRepresentation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLCH collaborationIdentifier was nil defaulting to identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
