@implementation UICopyToPasteboardActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

- (int64_t)_defaultSortGroup
{
  return 1;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.CopyToPasteboard");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Copy[Activity]"), CFSTR("Copy"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemImageName
{
  return CFSTR("doc.on.doc");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_UIActivityItemTypes() == 0x4000)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(MEMORY[0x1E0D97420], "isSWYActivityItemProvider:", v9, (_QWORD)v12) & 1) != 0)
          {
            v10 = 0;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_14:

  }
  else
  {
    v10 = (_UIActivityItemTypes() & 0x9F) != 0;
  }

  return v10;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __CFString *v17;
  __CFString *PreferredIdentifierForTag;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  UICopyToPasteboardActivity *v35;
  id v36;
  void *v37;
  void *v38;
  const __CFString *inTagClass;
  void *v40;
  uint8_t buf[8];
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_UIActivityItemTypes() == 0x4000)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UICopyToPasteboardActivity pasteboard](self, "pasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItemProviders:", v6);

    goto LABEL_49;
  }
  v35 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = v4;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  v11 = 0x1E0CB3000uLL;
  if (!v10)
    goto LABEL_39;
  v12 = v10;
  v13 = *(_QWORD *)v45;
  inTagClass = (const __CFString *)*MEMORY[0x1E0CA5A88];
  v38 = (void *)*MEMORY[0x1E0CA5B20];
  v40 = v8;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v45 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_msgSend(v15, "isFileURL") & 1) == 0)
      {
LABEL_19:
        v19 = (id)objc_msgSend(objc_alloc(*(Class *)(v11 + 1736)), "initWithObject:", v15);
        if (!v19)
          goto LABEL_21;
LABEL_20:
        objc_msgSend(v8, "addObject:", v19);

        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "isFileURL"))
      {
        v16 = v15;
        objc_msgSend(v16, "pathExtension");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v17
          || (PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(inTagClass, v17, 0)) == 0)
        {
          PreferredIdentifierForTag = v38;
        }
        v19 = objc_alloc_init(*(Class *)(v11 + 1736));
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __55__UICopyToPasteboardActivity_prepareWithActivityItems___block_invoke_16;
        v42[3] = &unk_1E4002AF0;
        v43 = v16;
        v20 = v16;
        objc_msgSend(v19, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", PreferredIdentifierForTag, 0, 0, v42);
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSuggestedName:", v21);

        v11 = 0x1E0CB3000;
        v8 = v40;
LABEL_35:
        if (v19)
          goto LABEL_20;
        goto LABEL_21;
      }
      if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EE576D88))
        goto LABEL_19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          v19 = (id)objc_msgSend(objc_alloc(*(Class *)(v11 + 1736)), "initWithObject:", v22);
        else
          v19 = 0;

        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v37, "addObject:", v15);
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v15;
        +[SHSheetGroupActivity groupActivityType](SHSheetGroupActivity, "groupActivityType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v19, "hasItemConformingToTypeIdentifier:", v23);

        if (v24)
        {
          share_sheet_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19E419000, v25, OS_LOG_TYPE_DEFAULT, "SharePlay: Filtering out GroupActivity provider from Copy action", buf, 2u);
          }

          v11 = 0x1E0CB3000;
          goto LABEL_21;
        }
        v11 = 0x1E0CB3000;
        goto LABEL_35;
      }
LABEL_21:
      ++v14;
    }
    while (v12 != v14);
    v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    v12 = v26;
  }
  while (v26);
LABEL_39:

  if (!objc_msgSend(v8, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[SHSheetGroupActivity groupActivityType](SHSheetGroupActivity, "groupActivityType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v29, "hasItemConformingToTypeIdentifier:", v30) & 1) != 0)
      {
        objc_msgSend(v29, "registeredTypeIdentifiers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "count");

        if (v32 >= 2)
          objc_msgSend(v8, "addObject:", v29);
      }
      else
      {

      }
    }
  }
  -[UICopyToPasteboardActivity pasteboard](v35, "pasteboard");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setItemProviders:", v8);

  if (objc_msgSend(v37, "count"))
  {
    -[UICopyToPasteboardActivity pasteboard](v35, "pasteboard");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addItems:", v37);

  }
  v4 = v36;
LABEL_49:

}

uint64_t __55__UICopyToPasteboardActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint8_t v7[16];

  v2 = a2;
  +[SHSheetGroupActivity groupActivityType](SHSheetGroupActivity, "groupActivityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hasItemConformingToTypeIdentifier:", v3);

  if (v4)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "SharePlay: Filtering out GroupActivity provider from Copy action", v7, 2u);
    }

  }
  return v4 ^ 1u;
}

uint64_t __55__UICopyToPasteboardActivity_prepareWithActivityItems___block_invoke_16(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0, 0);
  return 0;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (id)pasteboard
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
}

@end
