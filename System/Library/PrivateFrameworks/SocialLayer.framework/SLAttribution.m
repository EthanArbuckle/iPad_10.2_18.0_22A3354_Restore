@implementation SLAttribution

- (SLAttribution)initWithIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  SLAttribution *v8;
  SLAttribution *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLAttribution;
  v8 = -[SLAttribution init](&v11, sel_init);
  if (!v8)
    goto LABEL_4;
  if (objc_msgSend(v7, "length"))
  {
    objc_storeStrong((id *)&v8->_uniqueIdentifier, a3);
    v8->_lean = 1;
LABEL_4:
    v9 = v8;
    goto LABEL_5;
  }
  if (a4)
  {
    objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 2, 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_5:

  return v9;
}

- (SLAttribution)initWithPortraitAttribution:(id)a3 error:(id *)a4
{
  id v6;
  SLAttribution *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *sourceAppDisplayName;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *conversationIdentifier;
  uint64_t v20;
  NSURL *groupPhotoPath;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  SLPerson *v30;
  SLPerson *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  SLAttribution *v36;
  SLPerson *v37;
  void *v38;
  SLPerson *v39;
  id v40;
  void *v41;
  uint64_t v42;
  NSString *groupDisplayName;
  id v44;
  void *v45;
  uint64_t v46;
  NSUUID *groupID;
  uint64_t v48;
  NSDate *timestamp;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  _SWCollaborationMetadata *v55;
  NSObject *collaborationMetadata;
  void *v57;
  id v58;
  void *v59;
  id *v61;
  id obj;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  objc_super v72;
  uint8_t buf[4];
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)SLAttribution;
  v7 = -[SLAttribution init](&v72, sel_init);
  if (!v7)
  {
LABEL_47:
    v36 = v7;
    goto LABEL_48;
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
      uniqueIdentifier = v7->_uniqueIdentifier;
      v7->_uniqueIdentifier = (NSString *)v10;

      objc_msgSend(v6, "sourceAppDisplayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        objc_msgSend(v6, "sourceAppDisplayName");
        v14 = objc_claimAutoreleasedReturnValue();
        sourceAppDisplayName = v7->_sourceAppDisplayName;
        v7->_sourceAppDisplayName = (NSString *)v14;

        objc_msgSend(v6, "conversationIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v6, "conversationIdentifier");
          v18 = objc_claimAutoreleasedReturnValue();
          conversationIdentifier = v7->_conversationIdentifier;
          v7->_conversationIdentifier = (NSString *)v18;

          if ((objc_opt_respondsToSelector() & 1) != 0)
            v7->_pinned = objc_msgSend(v6, "isStarred");
          v61 = a4;
          objc_msgSend(v6, "groupPhotoPath");
          v20 = objc_claimAutoreleasedReturnValue();
          groupPhotoPath = v7->_groupPhotoPath;
          v7->_groupPhotoPath = (NSURL *)v20;

          obj = (id)objc_opt_new();
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          objc_msgSend(v6, "relatedPeople");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
          if (v23)
          {
            v24 = v23;
            v25 = 0;
            v26 = *(_QWORD *)v69;
            while (2)
            {
              v27 = 0;
              v28 = v25;
              do
              {
                if (*(_QWORD *)v69 != v26)
                  objc_enumerationMutation(v22);
                v29 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v27);
                v30 = [SLPerson alloc];
                v67 = v28;
                v31 = -[SLPerson initWithPortraitPerson:error:](v30, "initWithPortraitPerson:error:", v29, &v67);
                v25 = v67;

                if (!v31)
                {
                  if (v61)
                  {
                    v66 = v25;
                    objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 6, &v66);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = v66;

                    *v61 = v34;
                    v25 = v35;
                  }

                  goto LABEL_25;
                }
                objc_msgSend(obj, "addObject:", v31);

                ++v27;
                v28 = v25;
              }
              while (v24 != v27);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
              if (v24)
                continue;
              break;
            }
          }
          else
          {
            v25 = 0;
          }

          objc_storeStrong((id *)&v7->_relatedPersons, obj);
          v37 = [SLPerson alloc];
          objc_msgSend(v6, "sender");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v25;
          v39 = -[SLPerson initWithPortraitPerson:error:](v37, "initWithPortraitPerson:error:", v38, &v65);
          v40 = v65;

          if (v39)
          {
            objc_storeStrong((id *)&v7->_sender, v39);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v7->_fromMe = objc_msgSend(v6, "isFromMe");
            objc_msgSend(v6, "relatedPeople");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v7->_isGroupConversation = (unint64_t)objc_msgSend(v41, "count") > 2;

            if (v7->_isGroupConversation)
            {
              objc_msgSend(v6, "groupDisplayName");
              v42 = objc_claimAutoreleasedReturnValue();
              groupDisplayName = v7->_groupDisplayName;
              v7->_groupDisplayName = (NSString *)v42;

              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v44 = objc_alloc(MEMORY[0x1E0CB3A28]);
                objc_msgSend(v6, "groupId");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v44, "initWithUUIDString:", v45);
                groupID = v7->_groupID;
                v7->_groupID = (NSUUID *)v46;

              }
            }
            v7->_lean = 0;
            objc_msgSend(v6, "timestamp");
            v48 = objc_claimAutoreleasedReturnValue();
            timestamp = v7->_timestamp;
            v7->_timestamp = (NSDate *)v48;

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v50 = (void *)MEMORY[0x1E0CB3710];
              v51 = objc_opt_class();
              objc_msgSend(v6, "collaborationMetadata");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = 0;
              objc_msgSend(v50, "unarchivedObjectOfClass:fromData:error:", v51, v52, &v63);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v63;

              if (v53)
              {
                v55 = v53;
                collaborationMetadata = v7->_collaborationMetadata;
                v7->_collaborationMetadata = v55;
              }
              else
              {
                SLFrameworkLogHandle();
                collaborationMetadata = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(collaborationMetadata, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v54, "description");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v74 = v59;
                  _os_log_impl(&dword_199EFF000, collaborationMetadata, OS_LOG_TYPE_INFO, "Failed to unarchive Collaboration Metadata: %@", buf, 0xCu);

                }
              }

            }
            goto LABEL_47;
          }
          if (v61)
          {
            v64 = v40;
            objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 5, &v64);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v64;

            *v61 = v57;
            v40 = v58;
          }

LABEL_25:
          goto LABEL_29;
        }
        if (a4)
        {
          v32 = (void *)objc_opt_class();
          v33 = 4;
          goto LABEL_28;
        }
LABEL_29:
        v36 = 0;
        goto LABEL_48;
      }
      if (!a4)
        goto LABEL_29;
      v32 = (void *)objc_opt_class();
      v33 = 3;
    }
    else
    {
      if (!a4)
        goto LABEL_29;
      v32 = (void *)objc_opt_class();
      v33 = 2;
    }
  }
  else
  {
    v32 = (void *)objc_opt_class();
    v33 = 1;
  }
LABEL_28:
  objc_msgSend(v32, "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), v33, 0);
  v36 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

  return v36;
}

- (id)portraitAttribution
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
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[SLAttribution relatedPersons](self, "relatedPersons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x1E0D70C70]);
        objc_msgSend(v9, "handle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v10, "initWithHandle:displayName:", v11, v12);
        objc_msgSend(v3, "addObject:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v6);
  }

  v14 = objc_alloc(MEMORY[0x1E0D70C70]);
  -[SLAttribution sender](self, "sender");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution sender](self, "sender");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "displayName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithHandle:displayName:", v16, v18);

  v20 = objc_alloc(MEMORY[0x1E0D70C50]);
  -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution groupPhotoPath](self, "groupPhotoPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution groupDisplayName](self, "groupDisplayName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution timestamp](self, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v20, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:", v21, v22, v23, v24, v25, v3, v19, v26);

  return v27;
}

- (SLAttribution)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  id v6;
  SLAttribution *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSString *v20;
  NSObject *attachmentGUID;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSURL *groupPhotoPath;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSUUID *groupID;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  SLPerson *v39;
  SLPerson *sender;
  SLPerson *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  SLPerson *v48;
  uint64_t v49;
  NSDate *timestamp;
  SLAttribution *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id obj;
  void *v63;
  objc_super v64;

  v6 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SLAttribution;
  v7 = -[SLAttribution init](&v64, sel_init);
  if (!v7)
    goto LABEL_70;
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
      -[SLAttribution initWithCSSearchableItem:error:].cold.3(v6, v14);

    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 8, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_69;
  }
  objc_msgSend(v6, "bundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    objc_storeStrong((id *)&v7->_sourceAppDisplayName, v15);
    objc_msgSend(v6, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v16, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
    }
    else if (v13)
    {
      objc_msgSend(v16, "ownerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uniqueIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = 0;
      v18 = 0;
    }
    if (!objc_msgSend(v18, "length"))
    {
      if (a4)
      {
        objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 2, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = 1;
      goto LABEL_67;
    }
    v61 = v18;
    objc_storeStrong((id *)&v7->_uniqueIdentifier, v18);
    if (objc_msgSend(v63, "length"))
    {
      v20 = v63;
      attachmentGUID = v7->_attachmentGUID;
      v7->_attachmentGUID = v20;
    }
    else
    {
      SLFrameworkLogHandle();
      attachmentGUID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(attachmentGUID, OS_LOG_TYPE_DEBUG))
        -[SLAttribution initWithCSSearchableItem:error:].cold.2();
    }

    if (v11)
    {
      objc_msgSend(v17, "domainIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v61;
    }
    else
    {
      v18 = v61;
      if (v13)
      {
        objc_msgSend(v17, "accountIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
    }
    if (!objc_msgSend(v22, "length"))
    {
      if (a4)
      {
        objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 4, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = 1;
      goto LABEL_66;
    }
    objc_storeStrong((id *)&v7->_conversationIdentifier, v22);
    objc_msgSend(v17, "groupPhotoPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v17;
    if (v23
      || (objc_msgSend(v17, "customAttributeDictionary"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v24, "objectForKey:", CFSTR("com_apple_mobilesms_groupPhotoPath")),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v17 = v58,
          v23))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v23);
      v25 = objc_claimAutoreleasedReturnValue();
      groupPhotoPath = v7->_groupPhotoPath;
      v7->_groupPhotoPath = (NSURL *)v25;

    }
    else
    {
      v23 = v7->_groupPhotoPath;
      v7->_groupPhotoPath = 0;
    }
    v54 = v22;

    objc_msgSend(v17, "displayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      objc_msgSend(v17, "alternateNames");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v55 = v27;
    objc_storeStrong((id *)&v7->_groupDisplayName, v27);
    objc_msgSend(v17, "customAttributeDictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("gid"));
    v30 = objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v30);
      groupID = v7->_groupID;
      v7->_groupID = (NSUUID *)v31;

    }
    v57 = (void *)v30;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "authorNames");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "authorAddresses");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = v36;
    v56 = v34;
    if (!v36)
    {
      if (a4)
      {
        objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 5, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = 1;
      v18 = v61;
      v22 = v54;
      goto LABEL_65;
    }
    v53 = v15;
    v37 = v34;
    if (!v37)
    {
      SLFrameworkLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[SLAttribution initWithCSSearchableItem:error:].cold.1();

      v37 = v36;
    }
    v39 = -[SLPerson initWithHandle:displayName:]([SLPerson alloc], "initWithHandle:displayName:", v36, v37);
    sender = v7->_sender;
    v7->_sender = v39;
    v41 = v39;

    objc_msgSend(obj, "addObject:", v41);
    objc_msgSend(v58, "recipientNames");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "recipientAddresses");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42 && v60)
    {
      v43 = objc_msgSend(v42, "count");
      if (v43 != objc_msgSend(v60, "count"))
      {
LABEL_61:
        if (a4)
        {
          objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 6, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = 1;
        v15 = v53;
        v17 = v58;
        goto LABEL_64;
      }
      if (objc_msgSend(v42, "count"))
      {
        v44 = 0;
        while (1)
        {
          objc_msgSend(v42, "objectAtIndexedSubscript:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectAtIndexedSubscript:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v46;
          if (!v45 || !v46)
            break;
          v48 = -[SLPerson initWithHandle:displayName:]([SLPerson alloc], "initWithHandle:displayName:", v46, v45);
          objc_msgSend(obj, "addObject:", v48);

          if (objc_msgSend(v42, "count") <= (unint64_t)++v44)
            goto LABEL_52;
        }

        goto LABEL_61;
      }
    }
LABEL_52:
    objc_storeStrong((id *)&v7->_relatedPersons, obj);
    v7->_isGroupConversation = -[NSArray count](v7->_relatedPersons, "count") > 2;
    v7->_lean = 0;
    v17 = v58;
    objc_msgSend(v58, "contentCreationDate");
    v49 = objc_claimAutoreleasedReturnValue();
    timestamp = v7->_timestamp;
    v7->_timestamp = (NSDate *)v49;

    v19 = 0;
    v15 = v53;
LABEL_64:
    v18 = v61;
    v22 = v54;

LABEL_65:
LABEL_66:

LABEL_67:
    goto LABEL_68;
  }
  if (a4)
  {
    objc_msgSend((id)objc_opt_class(), "errorForAttributionDomain:andCode:andUnderlyingError:", CFSTR("com.apple.SocialLayer.SLAttributionErrorDomain"), 3, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = 1;
LABEL_68:

  if (!v19)
  {
LABEL_70:
    v51 = v7;
    goto LABEL_71;
  }
LABEL_69:
  v51 = 0;
LABEL_71:

  return v51;
}

- (SLAttribution)initWithDictionary:(id)a3
{
  id v4;
  SLAttribution *v5;
  void *v6;
  void *v7;
  SLAttribution *v8;
  NSObject *v9;
  NSObject *v11;
  NSObject *attachmentGUID;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSURL *groupPhotoPath;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  NSString *groupDisplayName;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  SLPerson *v30;
  SLPerson *v31;
  void *v32;
  SLPerson *v33;
  uint64_t v34;
  NSDate *timestamp;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  NSUUID *groupID;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
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
  v50.super_class = (Class)SLAttribution;
  v5 = -[SLAttribution init](&v50, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "objectForKey:", CFSTR("uid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    SLFrameworkLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SLAttribution initWithDictionary:].cold.1();
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v5->_uniqueIdentifier, v6);
  objc_msgSend(v4, "objectForKey:", CFSTR("l"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_lean = objc_msgSend(v7, "BOOLValue");

  if (!v5->_lean)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("atg"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v9, "length"))
    {
      v11 = v9;
      attachmentGUID = v5->_attachmentGUID;
      v5->_attachmentGUID = (NSString *)&v11->isa;
    }
    else
    {
      SLFrameworkLogHandle();
      attachmentGUID = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(attachmentGUID, OS_LOG_TYPE_DEBUG))
        -[SLAttribution initWithDictionary:].cold.6();
    }

    objc_msgSend(v4, "objectForKey:", CFSTR("sa"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      objc_storeStrong((id *)&v5->_sourceAppDisplayName, v13);
      objc_msgSend(v4, "objectForKey:", CFSTR("cid"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        objc_storeStrong((id *)&v5->_conversationIdentifier, v14);
        objc_msgSend(v4, "objectForKey:", CFSTR("gp"));
        v15 = objc_claimAutoreleasedReturnValue();
        v42 = v9;
        v43 = v13;
        v41 = v14;
        v44 = v6;
        v45 = v15;
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          groupPhotoPath = v5->_groupPhotoPath;
          v5->_groupPhotoPath = (NSURL *)v16;
        }
        else
        {
          groupPhotoPath = v5->_groupPhotoPath;
          v5->_groupPhotoPath = 0;
        }

        objc_msgSend(v4, "objectForKey:", CFSTR("gdn"));
        v21 = objc_claimAutoreleasedReturnValue();
        groupDisplayName = v5->_groupDisplayName;
        v5->_groupDisplayName = (NSString *)v21;

        objc_msgSend(v4, "objectForKey:", CFSTR("rp"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_opt_new();
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v25 = v23;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v47;
          while (2)
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v47 != v28)
                objc_enumerationMutation(v25);
              v30 = -[SLPerson initWithDictionary:]([SLPerson alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
              if (!v30)
              {
                SLFrameworkLogHandle();
                v33 = (SLPerson *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_ERROR))
                  -[SLAttribution initWithDictionary:].cold.5();
                v20 = 1;
                v32 = v25;
                v9 = v42;
                v14 = v41;
                goto LABEL_43;
              }
              v31 = v30;
              objc_msgSend(v24, "addObject:", v30);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
            if (v27)
              continue;
            break;
          }
        }

        objc_storeStrong((id *)&v5->_relatedPersons, v24);
        objc_msgSend(v4, "objectForKey:", CFSTR("s"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[SLPerson initWithDictionary:]([SLPerson alloc], "initWithDictionary:", v32);
        if (v33)
        {
          objc_storeStrong((id *)&v5->_sender, v33);
          v5->_isGroupConversation = -[NSArray count](v5->_relatedPersons, "count") > 2;
          objc_msgSend(v4, "objectForKey:", CFSTR("t"));
          v34 = objc_claimAutoreleasedReturnValue();
          timestamp = v5->_timestamp;
          v5->_timestamp = (NSDate *)v34;

          objc_msgSend(v4, "objectForKey:", CFSTR("pi"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_pinned = objc_msgSend(v36, "BOOLValue");

          objc_msgSend(v4, "objectForKey:", CFSTR("fm"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v5->_fromMe = objc_msgSend(v37, "BOOLValue");

          objc_msgSend(v4, "objectForKey:", CFSTR("gid"));
          v38 = objc_claimAutoreleasedReturnValue();
          -[NSObject UUID](v38, "UUID");
          v39 = objc_claimAutoreleasedReturnValue();
          groupID = v5->_groupID;
          v5->_groupID = (NSUUID *)v39;

          v20 = 0;
          v9 = v42;
        }
        else
        {
          SLFrameworkLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          v9 = v42;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[SLAttribution initWithDictionary:].cold.4();
          v20 = 1;
        }
        v14 = v41;

        v13 = v43;
LABEL_43:

        v6 = v44;
        v19 = v45;
      }
      else
      {
        SLFrameworkLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[SLAttribution initWithDictionary:].cold.3();
        v20 = 1;
      }

      if (!v20)
        goto LABEL_4;
LABEL_9:

      v8 = 0;
      goto LABEL_10;
    }
    SLFrameworkLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SLAttribution initWithDictionary:].cold.2();

LABEL_8:
    goto LABEL_9;
  }
LABEL_4:

LABEL_5:
  v8 = v5;
LABEL_10:

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
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
  void *v36;
  NSObject *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    SLFrameworkLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SLAttribution dictionaryRepresentation].cold.1();
    goto LABEL_34;
  }
  -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("uid"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLAttribution isLean](self, "isLean"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("l"));

  if (!-[SLAttribution isLean](self, "isLean"))
  {
    -[SLAttribution attachmentGUID](self, "attachmentGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SLAttribution attachmentGUID](self, "attachmentGUID");
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("atg"));
    }
    else
    {
      SLFrameworkLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SLAttribution dictionaryRepresentation].cold.8();
    }

    -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("sa"));

      -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cid"));

        -[SLAttribution sender](self, "sender");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("s"));
          -[SLAttribution relatedPersons](self, "relatedPersons");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v39 = v16;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = objc_claimAutoreleasedReturnValue();
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v43 = 0u;
            -[SLAttribution relatedPersons](self, "relatedPersons");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v41;
              while (2)
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v41 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "dictionaryRepresentation");
                  v24 = objc_claimAutoreleasedReturnValue();
                  if (!v24)
                  {
                    SLFrameworkLogHandle();
                    v38 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
                      -[SLAttribution dictionaryRepresentation].cold.7();

                    v16 = v39;
                    goto LABEL_44;
                  }
                  v25 = (void *)v24;
                  -[NSObject addObject:](v18, "addObject:", v24);

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
                if (v21)
                  continue;
                break;
              }
            }

            objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("rp"));
            -[SLAttribution groupPhotoPath](self, "groupPhotoPath");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
            {
              -[SLAttribution groupPhotoPath](self, "groupPhotoPath");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "path");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("gp"));

            }
            -[SLAttribution groupDisplayName](self, "groupDisplayName");
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              -[SLAttribution groupDisplayName](self, "groupDisplayName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("gdn"));

            }
            -[SLAttribution timestamp](self, "timestamp");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v39;
            if (v31)
            {
              -[SLAttribution timestamp](self, "timestamp");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("t"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLAttribution isPinned](self, "isPinned"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("pi"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLAttribution isFromMe](self, "isFromMe"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKey:", v34, CFSTR("fm"));

              -[SLAttribution groupID](self, "groupID");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                -[SLAttribution groupID](self, "groupID");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("gid"));

              }
              goto LABEL_3;
            }
            SLFrameworkLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[SLAttribution dictionaryRepresentation].cold.6();
          }
          else
          {
            SLFrameworkLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              -[SLAttribution dictionaryRepresentation].cold.5();
          }
        }
        else
        {
          SLFrameworkLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[SLAttribution dictionaryRepresentation].cold.4(self, v18);
        }
LABEL_44:

LABEL_35:
        v7 = 0;
        goto LABEL_36;
      }
      SLFrameworkLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SLAttribution dictionaryRepresentation].cold.3();
    }
    else
    {
      SLFrameworkLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SLAttribution dictionaryRepresentation].cold.2();
    }
LABEL_34:

    goto LABEL_35;
  }
LABEL_3:
  v7 = v3;
LABEL_36:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLAttribution)initWithCoder:(id)a3
{
  id v4;
  SLAttribution *v5;
  uint64_t v6;
  NSString *sourceAppDisplayName;
  uint64_t v8;
  NSString *uniqueIdentifier;
  uint64_t v10;
  NSString *attachmentGUID;
  uint64_t v12;
  NSString *conversationIdentifier;
  uint64_t v14;
  NSURL *groupPhotoPath;
  uint64_t v16;
  NSString *groupDisplayName;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *relatedPersons;
  uint64_t v23;
  SLPerson *sender;
  void *v25;
  uint64_t v26;
  NSDate *timestamp;
  uint64_t v28;
  NSUUID *groupID;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SLAttribution;
  v5 = -[SLAttribution init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sa"));
    v6 = objc_claimAutoreleasedReturnValue();
    sourceAppDisplayName = v5->_sourceAppDisplayName;
    v5->_sourceAppDisplayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uid"));
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("atg"));
    v10 = objc_claimAutoreleasedReturnValue();
    attachmentGUID = v5->_attachmentGUID;
    v5->_attachmentGUID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cid"));
    v12 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gp"));
    v14 = objc_claimAutoreleasedReturnValue();
    groupPhotoPath = v5->_groupPhotoPath;
    v5->_groupPhotoPath = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gdn"));
    v16 = objc_claimAutoreleasedReturnValue();
    groupDisplayName = v5->_groupDisplayName;
    v5->_groupDisplayName = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithArray:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("rp"));
    v21 = objc_claimAutoreleasedReturnValue();
    relatedPersons = v5->_relatedPersons;
    v5->_relatedPersons = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v23 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (SLPerson *)v23;

    v5->_isGroupConversation = -[NSArray count](v5->_relatedPersons, "count") > 2;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lean = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("t"));
    v26 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v26;

    v5->_pinned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pi"));
    v5->_fromMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("fm"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gid"));
    v28 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSUUID *)v28;

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
  id v15;

  v4 = a3;
  -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sa"));

  -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uid"));

  -[SLAttribution attachmentGUID](self, "attachmentGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("atg"));

  -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("cid"));

  -[SLAttribution groupPhotoPath](self, "groupPhotoPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("gp"));

  -[SLAttribution groupDisplayName](self, "groupDisplayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("gdn"));

  -[SLAttribution relatedPersons](self, "relatedPersons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("rp"));

  -[SLAttribution sender](self, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("s"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SLAttribution isLean](self, "isLean"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("l"));

  -[SLAttribution timestamp](self, "timestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("t"));

  objc_msgSend(v4, "encodeBool:forKey:", -[SLAttribution isPinned](self, "isPinned"), CFSTR("pi"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SLAttribution isFromMe](self, "isFromMe"), CFSTR("fm"));
  -[SLAttribution groupID](self, "groupID");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("gid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SLAttribution *v4;
  void *v5;
  SLAttribution *v6;

  v4 = [SLAttribution alloc];
  -[SLAttribution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLAttribution initWithDictionary:](v4, "initWithDictionary:", v5);

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
  uint64_t v10;
  char v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "uniqueIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {
LABEL_9:

        v12 = -[SLAttribution isLean](self, "isLean");
        v11 = v12 & v10;
        if (v12 || !(_DWORD)v10)
          goto LABEL_33;
        -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13
          || (objc_msgSend(v6, "sourceAppDisplayName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "sourceAppDisplayName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v14, "isEqualToString:", v15);

          if (v13)
          {

            if (!(_DWORD)v10)
              goto LABEL_32;
          }
          else
          {

            if ((v10 & 1) == 0)
              goto LABEL_32;
          }
        }
        -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          || (objc_msgSend(v6, "conversationIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "conversationIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v17, "isEqualToString:", v18);

          if (v16)
          {

            if (!(_DWORD)v10)
              goto LABEL_32;
          }
          else
          {

            if ((v10 & 1) == 0)
              goto LABEL_32;
          }
        }
        -[SLAttribution groupDisplayName](self, "groupDisplayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(v6, "groupDisplayName");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
LABEL_27:
            -[SLAttribution sender](self, "sender");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22 || (objc_msgSend(v6, "sender"), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              -[SLAttribution sender](self, "sender");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "sender");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v23, "isEqual:", v24);

              if (v22)
              {
LABEL_37:

                goto LABEL_33;
              }
            }
            else
            {
              v11 = 1;
            }

            goto LABEL_37;
          }
        }
        -[SLAttribution groupDisplayName](self, "groupDisplayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "groupDisplayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v20, "isEqualToString:", v21);

        if (v19)
        {

          if ((_DWORD)v10)
            goto LABEL_27;
        }
        else
        {

          if ((v10 & 1) != 0)
            goto LABEL_27;
        }
LABEL_32:
        v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v11 = 0;
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  _BOOL4 v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = -[SLAttribution isLean](self, "isLean");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLAttribution uniqueIdentifier](self, "uniqueIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3)
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@: identifier: %@ ]"), v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SLAttribution attachmentGUID](self, "attachmentGUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution sourceAppDisplayName](self, "sourceAppDisplayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution conversationIdentifier](self, "conversationIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution groupPhotoPath](self, "groupPhotoPath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution groupDisplayName](self, "groupDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution relatedPersons](self, "relatedPersons");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution sender](self, "sender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLAttribution timestamp](self, "timestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SLAttribution isPinned](self, "isPinned");
    v14 = -[SLAttribution isFromMe](self, "isFromMe");
    -[SLAttribution groupID](self, "groupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@: identifier: %@ attachmentGUID:%@ sourceAppDisplayName: %@  conversationIdentifier: %@  groupPhotoPath: %@  displayName: %@  relatedPersons: %@ sender: %@ timestamp: %@ isPinned: %i isFromMe: %i groupID: %@]"), v6, v8, v21, v20, v19, v18, v10, v17, v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)errorForAttributionDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5
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
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  switch(a4)
  {
    case 1:
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("SLAttribution Init failed. Invalid or nil PPSocialAttribution.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = (const __CFString **)v32;
      v10 = &v31;
      goto LABEL_13;
    case 2:
      v29 = *MEMORY[0x1E0CB2938];
      v30 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil identifier.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v30;
      v10 = &v29;
      goto LABEL_13;
    case 3:
      v27 = *MEMORY[0x1E0CB2938];
      v28 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil source app display name.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v28;
      v10 = &v27;
      goto LABEL_13;
    case 4:
      v25 = *MEMORY[0x1E0CB2938];
      v26 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil conversation name.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v26;
      v10 = &v25;
      goto LABEL_13;
    case 5:
      v23 = *MEMORY[0x1E0CB2938];
      v24 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil PPSocialSender.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v24;
      v10 = &v23;
      goto LABEL_13;
    case 6:
      v21 = *MEMORY[0x1E0CB2938];
      v22 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil PPSocialSender.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v22;
      v10 = &v21;
      goto LABEL_13;
    case 7:
      v19 = *MEMORY[0x1E0CB2938];
      v20 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil timestamp.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v20;
      v10 = &v19;
      goto LABEL_13;
    case 8:
      v17 = *MEMORY[0x1E0CB2938];
      v18 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil domain identifier.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v18;
      v10 = &v17;
      goto LABEL_13;
    case 9:
      v15 = *MEMORY[0x1E0CB2938];
      v16 = CFSTR("SLAttribution Init failed. PPSocialAttribution contains an invalid or nil attachment GUID.");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v16;
      v10 = &v15;
LABEL_13:
      objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5)
        goto LABEL_14;
      goto LABEL_15;
    default:
      v11 = 0;
      if (!a5)
        goto LABEL_15;
LABEL_14:
      v12 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v12, "setObject:forKey:", *a5, *MEMORY[0x1E0CB3388]);

      v11 = v12;
LABEL_15:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, a4, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
  }
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isLean
{
  return self->_lean;
}

- (void)setLean:(BOOL)a3
{
  self->_lean = a3;
}

- (NSString)sourceAppDisplayName
{
  return self->_sourceAppDisplayName;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (NSURL)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (NSArray)relatedPersons
{
  return self->_relatedPersons;
}

- (SLPerson)sender
{
  return self->_sender;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (NSUUID)groupID
{
  return self->_groupID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)attachmentGUID
{
  return self->_attachmentGUID;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_attachmentGUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_relatedPersons, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppDisplayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithCSSearchableItem:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLA falling back to handle as displayName for sender.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCSSearchableItem:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLA had no unique identifier (attachment GUID not set).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithCSSearchableItem:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, a2, v4, "Attempted to initialize SLH using a CSSearchableItem outside the attachment/links domain. Failing initialization from CSSearchableItem. domain: %@", v5);

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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLA dictionary uniqueIdentifier was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLA dictionary sourceAppDisplayName was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1(&dword_199EFF000, v0, v1, "SLA dictionary conversationIdentifier was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithDictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, v0, v1, "SLA dictionary sender person was nil. Failing initialization from dictionary. senderDictionary: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDictionary:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_199EFF000, v0, v1, "SLA dictionary related person was nil. Failing initialization from dictionary. personDictionary: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithDictionary:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLA dictionary attachmentGUID was nil.", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_199EFF000, v0, v1, "SLA attachmentGUID was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
