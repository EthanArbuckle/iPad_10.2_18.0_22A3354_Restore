@implementation SLDCollaborationAttributionViewSlotTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)placeholderTagForMaxWidth:(double)a3 placeholderGlyphConfiguration:(id)a4
{
  id v5;
  SLDCollaborationAttributionViewSlotTag *v6;
  SLDCollaborationAttributionViewSlotTag *v7;

  v5 = a4;
  v6 = [SLDCollaborationAttributionViewSlotTag alloc];
  v7 = -[SLDCollaborationAttributionViewSlotTag initWithTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:isPlaceholder:](v6, "initWithTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:isPlaceholder:", &stru_1E3797070, MEMORY[0x1E0C9AA60], v5, 1, 1, a3);

  return v7;
}

+ (id)tagForTitle:(id)a3 attributions:(id)a4 placeholderGlyphConfiguration:(id)a5 maxWidth:(double)a6 variant:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  SLDCollaborationAttributionViewSlotTag *v14;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[SLDCollaborationAttributionViewSlotTag initWithTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:isPlaceholder:]([SLDCollaborationAttributionViewSlotTag alloc], "initWithTitle:attributions:placeholderGlyphConfiguration:maxWidth:variant:isPlaceholder:", v13, v12, v11, a7, 0, a6);

  return v14;
}

- (SLDCollaborationAttributionViewSlotTag)initWithTitle:(id)a3 attributions:(id)a4 placeholderGlyphConfiguration:(id)a5 maxWidth:(double)a6 variant:(int64_t)a7 isPlaceholder:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  SLDCollaborationAttributionViewSlotTag *v18;
  SLDCollaborationAttributionViewSlotTag *v19;
  double v20;
  uint64_t v21;
  NSNumber *widthNumber;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *collaboratorDisplayNames;
  uint64_t v38;
  NSArray *conversationDrawingMetadata;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v47.receiver = self;
  v47.super_class = (Class)SLDCollaborationAttributionViewSlotTag;
  v18 = -[SLDCollaborationAttributionViewSlotTag init](&v47, sel_init);
  v19 = v18;
  if (v18)
  {
    v41 = v17;
    v42 = v15;
    v18->_isPlaceholder = a8;
    objc_storeStrong((id *)&v18->_placeholderGlyphConfiguration, a5);
    objc_storeStrong((id *)&v19->_title, a3);
    v19->_maxWidth = a6;
    *(float *)&v20 = a6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    widthNumber = v19->_widthNumber;
    v19->_widthNumber = (NSNumber *)v21;

    v19->_variant = a7;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v25 = v16;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v44 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v30, "groupDisplayName", v41, v42, (_QWORD)v43);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v30, "groupDisplayName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v32);
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "recipientsForAttribution:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObjectsFromArray:", v32);
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v27);
    }

    v33 = (void *)objc_opt_class();
    objc_msgSend(v24, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "displayNamesForPersons:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObjectsFromArray:", v35);

    v36 = objc_msgSend(v23, "copy");
    collaboratorDisplayNames = v19->_collaboratorDisplayNames;
    v19->_collaboratorDisplayNames = (NSArray *)v36;

    objc_msgSend((id)objc_opt_class(), "conversationDrawingMetadataForAttributions:", v25);
    v38 = objc_claimAutoreleasedReturnValue();
    conversationDrawingMetadata = v19->_conversationDrawingMetadata;
    v19->_conversationDrawingMetadata = (NSArray *)v38;

    v17 = v41;
    v15 = v42;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SLDCollaborationAttributionViewSlotTag: %p> maxWidth:[%@]"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)resolvedStyleForStyle:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0DC5C60];
  v3 = a3;
  v4 = objc_msgSend(v3, "accessibilityButtonShapes");
  v5 = objc_msgSend(v3, "accessibilityContrast");
  v6 = objc_msgSend(v3, "displayScale");
  v7 = objc_msgSend(v3, "layoutDirection");
  objc_msgSend(v3, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "preferredContentSizeCategory");
  v10 = objc_msgSend(v3, "tintColor");
  v11 = objc_msgSend(v3, "userInterfaceIdiom");
  v12 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(v15, "slotStyleWithAccessibilityButtonShapes:accessibilityContrast:displayRange:displayScale:layoutDirection:legibilityWeight:localization:preferredContentSizeCategory:tintColor:userInterfaceIdiom:userInterfaceStyle:", v4, v5, 1, v6, v7, 0, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)conversationDrawingMetadataForAttributions:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  SLCollaborationAttributionRecipientDrawingMetadata *v18;
  void *v19;
  void *v20;
  SLCollaborationAttributionRecipientDrawingMetadata *v21;
  SLCollaborationAttributionConversationDrawingMetadata *v22;
  void *v23;
  SLCollaborationAttributionRecipientDrawingMetadata *v24;
  void *v25;
  SLCollaborationAttributionConversationDrawingMetadata *v26;
  NSObject *v27;
  void *v28;
  SLCollaborationAttributionRecipientDrawingMetadata *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v38;
  id v39;
  id v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v4;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v51;
    *(_QWORD *)&v6 = 138412546;
    v38 = v6;
    v39 = v5;
    v40 = a1;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(a1, "recipientsForAttribution:", v8, v38);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "count"))
        {
          SLDaemonLogHandle();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "uniqueIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v56 = a1;
            v57 = 2112;
            v58 = v33;
            _os_log_error_impl(&dword_199EFF000, v10, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewSlotTag Found no recipients for attribution with identifier %@", buf, 0x16u);

          }
        }
        v44 = v8;
        v45 = v9;
        if (objc_msgSend(v8, "isGroupConversation") && (unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v12 = v9;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v47;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v47 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
                v18 = [SLCollaborationAttributionRecipientDrawingMetadata alloc];
                objc_msgSend(v17, "contact");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "thumbnailImageData");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[SLCollaborationAttributionRecipientDrawingMetadata initWithContact:contactImageData:](v18, "initWithContact:contactImageData:", v19, v20);

                objc_msgSend(v11, "addObject:", v21);
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            }
            while (v14);
          }

          v22 = [SLCollaborationAttributionConversationDrawingMetadata alloc];
          objc_msgSend(v44, "groupPhotoPath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "groupID");
          v24 = (SLCollaborationAttributionRecipientDrawingMetadata *)objc_claimAutoreleasedReturnValue();
          -[SLCollaborationAttributionRecipientDrawingMetadata UUIDString](v24, "UUIDString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[SLCollaborationAttributionConversationDrawingMetadata initWithGroupPhotoFileURL:recipientDrawingMetadata:groupID:](v22, "initWithGroupPhotoFileURL:recipientDrawingMetadata:groupID:", v23, v11, v25);

          v5 = v39;
          a1 = v40;
        }
        else
        {
          if ((unint64_t)objc_msgSend(v9, "count") >= 2)
          {
            SLDaemonLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "uniqueIdentifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v38;
              v56 = a1;
              v57 = 2112;
              v58 = v34;
              _os_log_error_impl(&dword_199EFF000, v27, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewSlotTag Found more than one recipient, but attribution.isGroupConversation was NO. attribution.uniqueIdentifier: %@", buf, 0x16u);

            }
          }
          objc_msgSend(v9, "firstObject");
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "contact");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "thumbnailImageData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            objc_msgSend(v11, "thumbnailImageData");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v29 = [SLCollaborationAttributionRecipientDrawingMetadata alloc];
          objc_msgSend(v11, "contact");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[SLCollaborationAttributionRecipientDrawingMetadata initWithContact:contactImageData:](v29, "initWithContact:contactImageData:", v30, v23);

          v26 = -[SLCollaborationAttributionConversationDrawingMetadata initWithRecipientDrawingMetadata:]([SLCollaborationAttributionConversationDrawingMetadata alloc], "initWithRecipientDrawingMetadata:", v24);
        }

        if (v26)
        {
          objc_msgSend(v5, "addObject:", v26);
          v31 = v45;
        }
        else
        {
          SLDaemonLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          v31 = v45;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v44, "uniqueIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v56 = a1;
            v57 = 2112;
            v58 = v35;
            _os_log_error_impl(&dword_199EFF000, v32, OS_LOG_TYPE_ERROR, "[%@] SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata was nil! Skipping. attribution.uniqueIdentifier: %@", buf, 0x16u);

          }
        }

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v43);
  }

  v36 = (void *)objc_msgSend(v5, "copy");
  return v36;
}

+ (id)_personOtherThanPerson:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((SLPersonIsEqualToPerson(v10, v5) & 1) == 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)displayNamesForPersons:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "shortDisplayName", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          objc_msgSend(v10, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)recipientsForAttribution:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char IsEqualToPerson;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[SLPerson fetchMeContact](SLPerson, "fetchMeContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFromMe"))
  {
    objc_msgSend(v3, "sender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = v3;
  objc_msgSend(v3, "relatedPersons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "contact");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqual:", v5) & 1) != 0)
        {

        }
        else
        {
          IsEqualToPerson = SLPersonIsEqualToPerson(v6, v12);

          if ((IsEqualToPerson & 1) == 0)
            objc_msgSend(v4, "addObject:", v12);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v4;
}

- (SLDCollaborationAttributionViewSlotTag)initWithCoder:(id)a3
{
  id v4;
  SLDCollaborationAttributionViewSlotTag *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *collaboratorDisplayNames;
  double v13;
  uint64_t v14;
  NSNumber *widthNumber;
  uint64_t v16;
  NSArray *conversationDrawingMetadata;
  uint64_t v18;
  SLDImageSymbolConfiguration *placeholderGlyphConfiguration;
  objc_super v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SLDCollaborationAttributionViewSlotTag;
  v5 = -[SLDCollaborationAttributionViewSlotTag init](&v21, sel_init);
  if (v5)
  {
    v5->_isPlaceholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlaceholder"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("collaboratorDisplayNames"));
    v11 = objc_claimAutoreleasedReturnValue();
    collaboratorDisplayNames = v5->_collaboratorDisplayNames;
    v5->_collaboratorDisplayNames = (NSArray *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxWidth"));
    v5->_maxWidth = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxWidthNumber"));
    v14 = objc_claimAutoreleasedReturnValue();
    widthNumber = v5->_widthNumber;
    v5->_widthNumber = (NSNumber *)v14;

    v5->_variant = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("variant"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conversationMetadata"));
    v16 = objc_claimAutoreleasedReturnValue();
    conversationDrawingMetadata = v5->_conversationDrawingMetadata;
    v5->_conversationDrawingMetadata = (NSArray *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolConfigKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    placeholderGlyphConfiguration = v5->_placeholderGlyphConfiguration;
    v5->_placeholderGlyphConfiguration = (SLDImageSymbolConfiguration *)v18;

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
  id v9;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[SLDCollaborationAttributionViewSlotTag isPlaceholder](self, "isPlaceholder"), CFSTR("isPlaceholder"));
  -[SLDCollaborationAttributionViewSlotTag title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](self, "collaboratorDisplayNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("collaboratorDisplayNames"));

  -[SLDCollaborationAttributionViewSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxWidth"));
  -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("maxWidthNumber"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[SLDCollaborationAttributionViewSlotTag variant](self, "variant"), CFSTR("variant"));
  -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](self, "conversationDrawingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("conversationMetadata"));

  -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](self, "placeholderGlyphConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("symbolConfigKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIsPlaceholder:", -[SLDCollaborationAttributionViewSlotTag isPlaceholder](self, "isPlaceholder"));
  -[SLDCollaborationAttributionViewSlotTag title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](self, "collaboratorDisplayNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCollaboratorDisplayNames:", v6);

  -[SLDCollaborationAttributionViewSlotTag maxWidth](self, "maxWidth");
  objc_msgSend(v4, "setMaxWidth:");
  -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidthNumber:", v7);

  objc_msgSend(v4, "setVariant:", -[SLDCollaborationAttributionViewSlotTag variant](self, "variant"));
  -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](self, "conversationDrawingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConversationDrawingMetadata:", v8);

  -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](self, "placeholderGlyphConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholderGlyphConfiguration:", v9);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  SLDCollaborationAttributionViewSlotTag *v6;
  SLDCollaborationAttributionViewSlotTag *v7;
  _BOOL4 v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (SLDCollaborationAttributionViewSlotTag *)v5;
    v7 = v6;
    if (v6 == self)
    {
      v20 = 1;
LABEL_48:

      goto LABEL_49;
    }
    v8 = -[SLDCollaborationAttributionViewSlotTag isPlaceholder](v6, "isPlaceholder");
    if (v8 != -[SLDCollaborationAttributionViewSlotTag isPlaceholder](self, "isPlaceholder"))
      goto LABEL_47;
    -[SLDCollaborationAttributionViewSlotTag maxWidth](v7, "maxWidth");
    v10 = v9;
    -[SLDCollaborationAttributionViewSlotTag maxWidth](self, "maxWidth");
    if (!SL_CGFloatApproximatelyEqualToFloat(v10, v11))
      goto LABEL_47;
    -[SLDCollaborationAttributionViewSlotTag title](self, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      || (-[SLDCollaborationAttributionViewSlotTag title](v7, "title"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLDCollaborationAttributionViewSlotTag title](self, "title");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_43;
      v14 = (void *)v13;
      -[SLDCollaborationAttributionViewSlotTag title](v7, "title");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_42;
      v16 = (void *)v15;
      -[SLDCollaborationAttributionViewSlotTag title](self, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDCollaborationAttributionViewSlotTag title](v7, "title");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if (v12)
      {

        if (!v19)
          goto LABEL_47;
      }
      else
      {

        if ((v19 & 1) == 0)
          goto LABEL_47;
      }
    }
    -[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](self, "collaboratorDisplayNames");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      || (-[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](v7, "collaboratorDisplayNames"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](self, "collaboratorDisplayNames");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](v7, "collaboratorDisplayNames");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToArray:", v23);

      if (v21)
      {

        if (!v24)
          goto LABEL_47;
      }
      else
      {

        if ((v24 & 1) == 0)
          goto LABEL_47;
      }
    }
    -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      || (-[SLDCollaborationAttributionViewSlotTag widthNumber](v7, "widthNumber"),
          (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_43;
      v14 = (void *)v25;
      -[SLDCollaborationAttributionViewSlotTag widthNumber](v7, "widthNumber");
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_42;
      v27 = (void *)v26;
      -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDCollaborationAttributionViewSlotTag widthNumber](v7, "widthNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToNumber:", v29);

      if (v12)
      {

        if (!v30)
          goto LABEL_47;
      }
      else
      {

        if ((v30 & 1) == 0)
          goto LABEL_47;
      }
    }
    v31 = -[SLDCollaborationAttributionViewSlotTag variant](self, "variant");
    if (v31 != -[SLDCollaborationAttributionViewSlotTag variant](v7, "variant"))
      goto LABEL_47;
    -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](self, "conversationDrawingMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](v7, "conversationDrawingMetadata");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_36:
        -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](self, "placeholderGlyphConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](v7, "placeholderGlyphConfiguration");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            v20 = 1;
LABEL_54:

            goto LABEL_45;
          }
        }
        -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](self, "placeholderGlyphConfiguration");
        v38 = objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          v39 = (void *)v38;
          -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](v7, "placeholderGlyphConfiguration");
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v41 = (void *)v40;
            -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](self, "placeholderGlyphConfiguration");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](v7, "placeholderGlyphConfiguration");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v42, "isEqual:", v43);

            if (!v12)
              goto LABEL_54;
LABEL_45:

            goto LABEL_48;
          }

        }
        v20 = 0;
        if (!v12)
          goto LABEL_54;
        goto LABEL_45;
      }
    }
    -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](self, "conversationDrawingMetadata");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
LABEL_43:
      v20 = 0;
      if (!v12)
        v12 = v3;
      goto LABEL_45;
    }
    v14 = (void *)v32;
    -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](v7, "conversationDrawingMetadata");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)v33;
      -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](self, "conversationDrawingMetadata");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](v7, "conversationDrawingMetadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqualToArray:", v36);

      if (v12)
      {

        if (v37)
          goto LABEL_36;
      }
      else
      {

        if ((v37 & 1) != 0)
          goto LABEL_36;
      }
LABEL_47:
      v20 = 0;
      goto LABEL_48;
    }
LABEL_42:

    goto LABEL_43;
  }
  v20 = 0;
LABEL_49:

  return v20;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[SLDCollaborationAttributionViewSlotTag widthNumber](self, "widthNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SLDCollaborationAttributionViewSlotTag collaboratorDisplayNames](self, "collaboratorDisplayNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = v6 ^ -[SLDCollaborationAttributionViewSlotTag variant](self, "variant");
  v8 = -[SLDCollaborationAttributionViewSlotTag isPlaceholder](self, "isPlaceholder");
  -[SLDCollaborationAttributionViewSlotTag conversationDrawingMetadata](self, "conversationDrawingMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SLDCollaborationAttributionViewSlotTag title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SLDCollaborationAttributionViewSlotTag placeholderGlyphConfiguration](self, "placeholderGlyphConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (SLDImageSymbolConfiguration)placeholderGlyphConfiguration
{
  return self->_placeholderGlyphConfiguration;
}

- (void)setPlaceholderGlyphConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderGlyphConfiguration, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (NSArray)collaboratorDisplayNames
{
  return self->_collaboratorDisplayNames;
}

- (void)setCollaboratorDisplayNames:(id)a3
{
  objc_storeStrong((id *)&self->_collaboratorDisplayNames, a3);
}

- (NSArray)conversationDrawingMetadata
{
  return self->_conversationDrawingMetadata;
}

- (void)setConversationDrawingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_conversationDrawingMetadata, a3);
}

- (NSNumber)widthNumber
{
  return self->_widthNumber;
}

- (void)setWidthNumber:(id)a3
{
  objc_storeStrong((id *)&self->_widthNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthNumber, 0);
  objc_storeStrong((id *)&self->_conversationDrawingMetadata, 0);
  objc_storeStrong((id *)&self->_collaboratorDisplayNames, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_placeholderGlyphConfiguration, 0);
}

@end
