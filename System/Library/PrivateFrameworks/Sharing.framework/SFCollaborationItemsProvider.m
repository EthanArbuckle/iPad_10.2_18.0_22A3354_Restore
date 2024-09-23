@implementation SFCollaborationItemsProvider

- (SFCollaborationItemsProvider)initWithActivityItems:(id)a3 delegate:(id)a4 managedFileURL:(id)a5 isURLProviderSupported:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  SFCollaborationItemsProvider *v13;
  SFCollaborationItemsProvider *v14;
  uint64_t v15;
  NSArray *activityItems;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFCollaborationItemsProvider;
  v13 = -[SFCollaborationItemsProvider init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_supportsMultipleCollaboration = 0;
    objc_storeStrong((id *)&v13->_managedFileURL, a5);
    v14->_isURLProviderSupported = a6;
    v15 = objc_msgSend(v10, "copy");
    activityItems = v14->_activityItems;
    v14->_activityItems = (NSArray *)v15;

    objc_storeWeak((id *)&v14->_delegate, v11);
    -[SFCollaborationItemsProvider _updateCollaborationItems](v14, "_updateCollaborationItems");
  }

  return v14;
}

- (SFCollaborationItemsProvider)initWithActivityItems:(id)a3 delegate:(id)a4
{
  return -[SFCollaborationItemsProvider initWithActivityItems:delegate:managedFileURL:isURLProviderSupported:](self, "initWithActivityItems:delegate:managedFileURL:isURLProviderSupported:", a3, a4, 0, 0);
}

- (id)activityItemsForActivity:(id)a3 collaborationResult:(id)a4
{
  return -[SFCollaborationItemsProvider activityItemsForActivity:collaborationResult:isCollaborative:](self, "activityItemsForActivity:collaborationResult:isCollaborative:", a3, a4, 1);
}

- (id)activityItemsForActivity:(id)a3 collaborationResult:(id)a4 isCollaborative:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v5 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a4;
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "activityType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v58 = v10;
    _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Updating activity items including collaboration items for activityType:%@", buf, 0xCu);

  }
  -[SFCollaborationItemsProvider activityItems](self, "activityItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v8, "activityType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = +[SFCollaborationUtilities isHeroCollaborationActivityType:](SFCollaborationUtilities, "isHeroCollaborationActivityType:", v12);

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = v46;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

        v15 = v46;
        v17 = (void *)objc_msgSend(v46, "copy");
        goto LABEL_38;
      }
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      -[SFCollaborationItemsProvider activityItems](self, "activityItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (!v30)
        goto LABEL_37;
      v31 = v30;
      v44 = v11;
      v45 = v8;
      v32 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v49 != v32)
            objc_enumerationMutation(v14);
          v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          -[SFCollaborationItemsProvider collaborationItemForActivityItem:](self, "collaborationItemForActivityItem:", v34, v44, v45);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          if (v35)
          {
            objc_msgSend(v35, "identifier");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "collaborationItemIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v37, "isEqual:", v38);

            if (v39)
            {
              share_sheet_log();
              v40 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v47, "sharingURL");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138478083;
                v58 = v34;
                v59 = 2112;
                v60 = v41;
                _os_log_impl(&dword_1A2830000, v40, OS_LOG_TYPE_DEFAULT, "Replace activity item:%{private}@ with sharingURL:%@", buf, 0x16u);

              }
              objc_msgSend(v47, "sharingURL");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObject:", v42);

            }
            else
            {
              objc_msgSend(v46, "addObject:", v34);
            }
          }

        }
        v31 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v31);
    }
    else
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[SFCollaborationItemsProvider activityItems](self, "activityItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (!v18)
        goto LABEL_37;
      v19 = v18;
      v44 = v11;
      v45 = 0;
      v20 = *(_QWORD *)v53;
      v21 = v46;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v53 != v20)
            objc_enumerationMutation(v14);
          v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
          -[SFCollaborationItemsProvider collaborationItemForActivityItem:](self, "collaborationItemForActivityItem:", v23, v44, v45);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "placeholderActivityItem");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              share_sheet_log();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138478083;
                v58 = v23;
                v59 = 2113;
                v60 = v26;
                _os_log_impl(&dword_1A2830000, v27, OS_LOG_TYPE_DEFAULT, "Replace activity item:%{private}@ with placeholder:%{private}@", buf, 0x16u);
              }

              v21 = v46;
              v28 = v46;
              v29 = v26;
            }
            else
            {
              v28 = v21;
              v29 = v23;
            }
            objc_msgSend(v28, "addObject:", v29);

          }
        }
        v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      }
      while (v19);
    }
    v11 = v44;
    v8 = v45;
    goto LABEL_37;
  }
  -[SFCollaborationItemsProvider collaborationItems](self, "collaborationItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendCopyItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v16;
LABEL_38:

  return v17;
}

- (id)collaborationItemForActivityItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SFCollaborationItemsProvider collaborationItems](self, "collaborationItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "activityItem");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_15:
          v6 = v9;
          goto LABEL_16;
        }
        if ((v4 != 0) != (v10 == 0))
        {
          v13 = objc_msgSend(v10, "isEqual:", v11);

          if (v13)
            goto LABEL_15;
        }
        else
        {

        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_16:

  return v6;
}

- (NSArray)placeholderActivityItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, uint64_t);
  void *v12;
  SFCollaborationItemsProvider *v13;
  id v14;

  -[SFCollaborationItemsProvider activityItems](self, "activityItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SFCollaborationItemsProvider activityItems](self, "activityItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__SFCollaborationItemsProvider_placeholderActivityItems__block_invoke;
  v12 = &unk_1E4832E18;
  v13 = self;
  v14 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return (NSArray *)v7;
}

void __56__SFCollaborationItemsProvider_placeholderActivityItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "collaborationItemForActivityItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "placeholderActivityItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138478083;
        v11 = v5;
        v12 = 2113;
        v13 = v8;
        _os_log_impl(&dword_1A2830000, v9, OS_LOG_TYPE_DEFAULT, "Replace activity item:%{private}@ with placeholder:%{private}@", (uint8_t *)&v10, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a3, v8);
    }

  }
}

- (void)setActivityItems:(id)a3
{
  NSArray *v4;
  NSArray *activityItems;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_activityItems) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    activityItems = self->_activityItems;
    self->_activityItems = v4;

    -[SFCollaborationItemsProvider _updateCollaborationItems](self, "_updateCollaborationItems");
  }

}

- (void)setCollaborationItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *v16;
  NSArray *collaborationItems;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[SFCollaborationItemsProvider supportsMultipleCollaboration](self, "supportsMultipleCollaboration")
    && (unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "type");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = v4;
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    if (!v7)
    {
LABEL_18:
      v15 = (uint64_t)v4;
LABEL_19:

      v4 = (id)v15;
      goto LABEL_20;
    }
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "type", (_QWORD)v19))
        {
          if (v9 > 0)
            goto LABEL_18;
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v8);

    if (v6 && v9 == 1)
    {
      share_sheet_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138477827;
        v25 = v13;
        _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring file collaboration objects in favour of non-file collaboration object because collaboration is not supported for multiple items. Assumption is that the file objects are send copy items. Collaboration item: %{private}@", buf, 0xCu);

      }
      objc_msgSend(v4, "firstObject");
      v14 = objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v14;
      goto LABEL_19;
    }
  }
LABEL_20:
  if ((objc_msgSend(v4, "isEqualToArray:", self->_collaborationItems, (_QWORD)v19) & 1) == 0)
  {
    v16 = (NSArray *)objc_msgSend(v4, "copy");
    collaborationItems = self->_collaborationItems;
    self->_collaborationItems = v16;

    share_sheet_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v25 = v4;
      _os_log_impl(&dword_1A2830000, v18, OS_LOG_TYPE_DEFAULT, "Did set collaborationItems:%{private}@", buf, 0xCu);
    }

  }
}

- (BOOL)multipleCollaborationItems
{
  return -[NSArray count](self->_collaborationItems, "count") > 1;
}

- (BOOL)supportsCollaboration
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;

  -[SFCollaborationItemsProvider collaborationItems](self, "collaborationItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    LODWORD(v5) = !-[SFCollaborationItemsProvider multipleCollaborationItems](self, "multipleCollaborationItems");
  else
    LOBYTE(v5) = 0;
  if (!objc_msgSend(v4, "type"))
  {
    v6 = v4;
    if ((objc_msgSend(v6, "defaultCollaboration") & 1) != 0 || (objc_msgSend(v6, "isiCloudDrive") & 1) != 0)
    {
      if (objc_msgSend(v6, "isInSharedFolder"))
      {
        share_sheet_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[SFCollaborationItemsProvider supportsCollaboration].cold.1();
      }
      else if (objc_msgSend(v6, "isThirdPartyFileProviderBacked"))
      {
        share_sheet_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[SFCollaborationItemsProvider supportsCollaboration].cold.2();
      }
      else
      {
        if ((objc_msgSend(v6, "isLocalStorage") & 1) != 0 || (objc_msgSend(v6, "isiCloudDrive") & 1) != 0)
          goto LABEL_16;
        share_sheet_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[SFCollaborationItemsProvider supportsCollaboration].cold.3();
      }
    }
    else
    {
      share_sheet_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[SFCollaborationItemsProvider supportsCollaboration].cold.4();
    }

    LOBYTE(v5) = 0;
LABEL_16:

  }
  return (char)v5;
}

- (BOOL)supportsSendCopy
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[SFCollaborationItemsProvider collaborationItems](self, "collaborationItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendCopyItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)_updateCollaborationItems
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _SFCollaborationItemsRequest *v17;
  _SFCollaborationItemsRequest *v18;
  void *v19;
  __int128 v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE buf[12];
  __int16 v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SFCollaborationItemsProvider currentRequest](self, "currentRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFCollaborationItemsProvider currentRequest](self, "currentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    -[SFCollaborationItemsProvider setCurrentRequest:](self, "setCurrentRequest:", 0);
  }
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SFCollaborationItemsProvider activityItems](self, "activityItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "update collaboration items for activityItems:%{private}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SFCollaborationItemsProvider activityItems](self, "activityItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v26;
    *(_QWORD *)&v10 = 138478083;
    v20 = v10;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[SFCollaborationItemsProvider collaborationItemForActivityItem:](self, "collaborationItemForActivityItem:", v13, v20);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          share_sheet_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v20;
            *(_QWORD *)&buf[4] = v14;
            v30 = 2113;
            v31 = v13;
            _os_log_impl(&dword_1A2830000, v15, OS_LOG_TYPE_DEFAULT, "did found cached collaboration item:%{private}@ for activityItem:%{private}@", buf, 0x16u);
          }

          objc_msgSend(v7, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v21, "addObject:", v13);
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v21, "count"))
  {
    share_sheet_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v21;
      _os_log_impl(&dword_1A2830000, v16, OS_LOG_TYPE_DEFAULT, "request collaboration items for activity items:%{private}@", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v17 = [_SFCollaborationItemsRequest alloc];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke;
    v22[3] = &unk_1E4833B30;
    v23 = v7;
    objc_copyWeak(&v24, (id *)buf);
    v18 = -[_SFCollaborationItemsRequest initWithActivityItems:completionHandler:](v17, "initWithActivityItems:completionHandler:", v21, v22);
    -[_SFCollaborationItemsRequest setDelegate:](v18, "setDelegate:", self);
    -[_SFCollaborationItemsRequest setSupportsMultipleCollaboration:](v18, "setSupportsMultipleCollaboration:", -[SFCollaborationItemsProvider supportsMultipleCollaboration](self, "supportsMultipleCollaboration"));
    -[SFCollaborationItemsProvider managedFileURL](self, "managedFileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFCollaborationItemsRequest setManagedFileURL:](v18, "setManagedFileURL:", v19);

    -[_SFCollaborationItemsRequest setIsURLProviderSupported:](v18, "setIsURLProviderSupported:", -[SFCollaborationItemsProvider isURLProviderSupported](self, "isURLProviderSupported"));
    -[SFCollaborationItemsProvider setCurrentRequest:](self, "setCurrentRequest:", v18);
    -[_SFCollaborationItemsRequest perform](v18, "perform");

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[SFCollaborationItemsProvider setCollaborationItems:](self, "setCollaborationItems:", v7);
  }

}

void __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke_2;
  v8[3] = &unk_1E4833B08;
  v9 = *(id *)(a1 + 32);
  v7 = v5;
  v10 = v7;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  sf_dispatch_on_main_queue(v8);
  objc_destroyWeak(&v11);

}

void __57__SFCollaborationItemsProvider__updateCollaborationItems__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "arrayByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_didCompleteCollaborationItems:", v3);

}

- (void)_didCompleteCollaborationItems:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138477827;
    v7 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "did found collaboration items:%{private}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SFCollaborationItemsProvider setCollaborationItems:](self, "setCollaborationItems:", v4);
  -[SFCollaborationItemsProvider setCurrentRequest:](self, "setCurrentRequest:", 0);

}

- (id)collaborationItemsRequest:(id)a3 resolveActivityItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SFCollaborationItemsProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collaborationItemsProvider:resolveActivityItem:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)collaborationServiceForItemsRequest:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[SFCollaborationItemsProvider delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SFCollaborationItemsProvider delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "collaborationServiceForItemsProvider:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (SFCollaborationItemsProviderDelegate)delegate
{
  return (SFCollaborationItemsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (BOOL)isURLProviderSupported
{
  return self->_isURLProviderSupported;
}

- (NSArray)collaborationItems
{
  return self->_collaborationItems;
}

- (_SFCollaborationItemsRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequest, a3);
}

- (BOOL)supportsMultipleCollaboration
{
  return self->_supportsMultipleCollaboration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_collaborationItems, 0);
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityItems, 0);
}

- (void)supportsCollaboration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_4(&dword_1A2830000, v0, v1, "File is not in iCloud Drive and default app does not support collaboration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
