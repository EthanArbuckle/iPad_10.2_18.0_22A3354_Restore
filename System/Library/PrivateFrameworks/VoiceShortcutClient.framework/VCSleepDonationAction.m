@implementation VCSleepDonationAction

+ (id)sleepActionsForShortcuts:(id)a3 bundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__VCSleepDonationAction_INShortcut__sleepActionsForShortcuts_bundleIdentifier___block_invoke;
  v11[3] = &unk_1E5FC6FB8;
  v12 = v5;
  v6 = v5;
  objc_msgSend(a3, "if_compactMap:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v7;

  return v9;
}

+ (id)sleepActionsDictionaryForShortcuts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v19 = v4;
  objc_msgSend(a1, "sleepActionsForShortcuts:bundleIdentifier:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "sourceAppBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
          v15 = v13;
        else
          v15 = (id)objc_opt_new();
        v16 = v15;

        objc_msgSend(v16, "addObject:", v11);
        objc_msgSend(v11, "sourceAppBundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v16, v17);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)sleepActionsDictionaryForShortcutsByApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "sleepActionsForShortcuts:bundleIdentifier:", v12, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

VCSleepDonationAction *__79__VCSleepDonationAction_INShortcut__sleepActionsForShortcuts_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  VCSleepDonationAction *v4;

  v3 = a2;
  v4 = -[VCSleepDonationAction initWithShortcut:bundleIdentifier:]([VCSleepDonationAction alloc], "initWithShortcut:bundleIdentifier:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (VCSleepDonationAction)initWithShortcut:(id)a3
{
  return -[VCSleepDonationAction initWithShortcut:bundleIdentifier:](self, "initWithShortcut:bundleIdentifier:", a3, 0);
}

- (VCSleepDonationAction)initWithShortcut:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  VCSleepDonationAction *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  VCSleepDonationAction *v33;
  VCSleepDonationAction *v34;
  NSObject *v35;
  void *v36;
  void *v38;
  objc_super v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSleepDonationAction.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcut"));

  }
  objc_msgSend(v7, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestedInvocationPhrase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v7, "userActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestedInvocationPhrase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v7, "_title");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v16;

  }
  if (v8)
  {
    v17 = v8;
  }
  else
  {
    objc_msgSend(v7, "_associatedAppBundleIdentifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  v19 = 0;
  if (objc_msgSend(v17, "length") && v12)
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v7, "intent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB36F8];
      objc_msgSend(v7, "intent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      objc_msgSend(v22, "archivedDataWithRootObject:requiringSecureCoding:error:", v23, 1, &v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v40;

      if (objc_msgSend(v24, "length"))
      {
        objc_msgSend(v20, "setValue:forKey:", v24, CFSTR("IntentData"));
        objc_msgSend(v20, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("ForceExecutionOnPhone"));

        v26 = CFSTR("is.workflow.actions.sirikit.donation.handle");
LABEL_20:
        +[VCSleepDonationAction identifierForShortcut:](VCSleepDonationAction, "identifierForShortcut:", v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v18, 1, 0);
        objc_msgSend(v31, "localizedName");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v39.receiver = self;
        v39.super_class = (Class)VCSleepDonationAction;
        v33 = -[VCSleepAction initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:](&v39, sel_initWithIdentifier_workflowActionIdentifier_sourceAppBundleIdentifier_bundleIdentifierForDisplay_title_subtitle_serializedParameters_shortcutAvailability_, v30, v26, v18, v18, v12, v32, v20, objc_msgSend(v7, "wf_shortcutAvailability"));
        self = v33;
        if (v33)
          v34 = v33;

        v19 = self;
        goto LABEL_27;
      }
      getWFVoiceShortcutClientLogObject();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v25, "localizedDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v42 = "-[VCSleepDonationAction initWithShortcut:bundleIdentifier:]";
        v43 = 2114;
        v44 = v36;
        _os_log_impl(&dword_1AF681000, v35, OS_LOG_TYPE_ERROR, "%s Could not create intent data from intent with error: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(v7, "userActivity");
      v19 = (VCSleepDonationAction *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
LABEL_27:

        goto LABEL_28;
      }
      objc_msgSend(v7, "activityData");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "length"))
      {
        objc_msgSend(v20, "setValue:forKey:", v25, CFSTR("UserActivityData"));
        objc_msgSend(v7, "activityImage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_imageData");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setValue:forKey:", v28, CFSTR("UserActivityImageData"));

        objc_msgSend(v7, "activitySubtitle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setValue:forKey:", v29, CFSTR("UserActivitySubtitle"));

        objc_msgSend(v20, "setValue:forKey:", v18, CFSTR("AppBundleIdentifier"));
        v26 = CFSTR("is.workflow.actions.useractivity.open");
        goto LABEL_20;
      }
    }

    v19 = 0;
    goto LABEL_27;
  }
LABEL_28:

  return v19;
}

+ (id)identifierForShortcut:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v31[4];
  id v32;
  id v33;

  v3 = a3;
  objc_msgSend(v3, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_JSONDictionaryRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0D3E558]);
    v8 = (id)objc_msgSend(v7, "combine:", CFSTR("is.workflow.actions.sirikit.donation.handle"));
    v9 = (id)objc_msgSend(v7, "combineContentsOfPropertyListObject:", v6);
    v10 = objc_msgSend(v7, "finalize");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2llX"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "userActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v6 = objc_alloc_init(MEMORY[0x1E0D3E558]);
    v13 = (id)objc_msgSend(v6, "combine:", CFSTR("is.workflow.actions.useractivity.open"));
    objc_msgSend(v3, "userActivity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activityType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v6, "combine:", v15);

    objc_msgSend(v3, "userActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "title");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v3, "userActivity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (id)objc_msgSend(v6, "combine:", v20);

    }
    objc_msgSend(v3, "activityBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "activityBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v6, "combine:", v23);

    }
    v25 = (void *)objc_opt_new();
    objc_msgSend(v3, "userActivity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "requiredUserInfoKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __47__VCSleepDonationAction_identifierForShortcut___block_invoke;
    v31[3] = &unk_1E5FC8358;
    v32 = v3;
    v33 = v25;
    v7 = v25;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v31);

    v28 = (id)objc_msgSend(v6, "combineContentsOfPropertyListObject:", v7);
    v29 = objc_msgSend(v6, "finalize");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%2llX"), v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v11;
}

void __47__VCSleepDonationAction_identifierForShortcut___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userActivity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v10 = v7;

    v11 = *(void **)(a1 + 40);
    objc_msgSend(v10, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "setObject:forKey:", v12, v17);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, v17);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = v8;
        else
          v9 = 0;
      }
      else
      {
        v9 = 0;
      }
      v14 = v9;

      v15 = *(void **)(a1 + 40);
      objc_msgSend(v14, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setObject:forKey:", v16, v17);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v5, v17);
    }
  }

}

@end
