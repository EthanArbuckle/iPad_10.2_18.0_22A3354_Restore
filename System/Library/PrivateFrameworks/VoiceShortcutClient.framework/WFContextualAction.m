@implementation WFContextualAction

- (BOOL)definesDisplayOrder
{
  return 0;
}

- (unint64_t)displayOrder
{
  return 0;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (CSSearchableItem)spotlightItem
{
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA6B50]);
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", CFSTR("com.apple.shortcuts.contextual-action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentType:", v4);

  -[WFContextualAction displayString](self, "displayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v6);

  -[WFContextualAction icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContextualAction icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContextualAction icon](self, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFContextualAction icon](self, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setThumbnailURL:", v14);

LABEL_3:
    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(v5, "setThumbnailSymbolName:", v10);
  }
  else
  {
    if (!v12)
    {
      -[WFContextualAction iconImageData](self, "iconImageData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setThumbnailData:", v13);
      goto LABEL_3;
    }
    objc_msgSend(v5, "setThumbnailBundleID:", v12);
  }
LABEL_8:
  -[WFContextualAction creationDate](self, "creationDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentCreationDate:", v15);

  -[WFContextualAction modificationDate](self, "modificationDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentModificationDate:", v16);

  -[WFContextualAction spotlightActionIdentifier](self, "spotlightActionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  WFSpotlightResultRunnableActionIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forCustomKey:", v17, v18);

  -[WFContextualAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v5, "wf_associateWithBundleIdentifier:", v19);
  -[WFContextualAction actionForRunningFromSpotlight](self, "actionForRunningFromSpotlight");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  WFDataFromSpotlightResultRunnable(v20, (uint64_t)&v45);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v45;

  if (v21)
  {
    if ((unint64_t)objc_msgSend(v21, "length") >> 6 >= 0x7D)
    {
      getWFVoiceShortcutClientLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFContextualAction(Spotlight) spotlightItem]";
        _os_log_impl(&dword_1AF681000, v23, OS_LOG_TYPE_FAULT, "%s Packing large objects into CoreSpotlight index", buf, 0xCu);
      }

    }
    WFSpotlightResultRunnableAttributeKey();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forCustomKey:", v21, v24);

    if (-[WFContextualAction definesDisplayOrder](self, "definesDisplayOrder"))
    {
      v25 = -[WFContextualAction displayOrder](self, "displayOrder");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      WFSpotlightResultRunnableDisplayOrderKey();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forCustomKey:", v26, v27);

    }
    v41 = v22;
    -[WFContextualAction accessoryIcon](self, "accessoryIcon");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "systemName");
    v29 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject length](v29, "length"))
    {
      WFSpotlightResultRunnableAccessorySystemImageNameKey();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forCustomKey:", v29, v30);

    }
    v42 = v19;
    -[WFContextualAction associatedSettingsPreference](self, "associatedSettingsPreference");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {
      WFSpotlightResultRunnableAssociatedSettingsPreferenceKey();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forCustomKey:", v31, v32);

    }
    v43 = v12;
    v44 = v10;
    v33 = v8;
    -[WFContextualAction settingBiomeStreamIdentifier](self, "settingBiomeStreamIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
    {
      WFSpotlightResultRunnableSettingBiomeStreamIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setValue:forCustomKey:", v34, v35);

    }
    v36 = objc_alloc(MEMORY[0x1E0CA6B48]);
    -[WFContextualAction uniqueIdentifier](self, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "spotlightDomainIdentifierForBundleIdentifier:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v36, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v37, v38, v5);

    v8 = v33;
    v12 = v43;
    v10 = v44;
    v22 = v41;
    v19 = v42;
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFContextualAction(Spotlight) spotlightItem]";
      v48 = 2112;
      v49 = v22;
      _os_log_impl(&dword_1AF681000, v29, OS_LOG_TYPE_FAULT, "%s Cannot pack WFContextualAction into a data blob: %@", buf, 0x16u);
    }
    v39 = 0;
  }

  return (CSSearchableItem *)v39;
}

- (BOOL)wf_shouldLaunchAppWithSurface:(unint64_t)a3 linkAction:(id)a4 actionMetadata:(id)a5 appBundleIdentifier:(id)a6 actionIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  char v16;
  NSObject *v17;
  _BOOL4 v18;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilenotes"))
    && objc_msgSend(v14, "isEqualToString:", CFSTR("CreateNoteLinkAction")))
  {
    v15 = (a3 & 0xFFFFFFFFFFFFFFFELL) != 12;
  }
  else
  {
    v16 = objc_msgSend(v12, "wf_shouldPrewarmAppLaunchWithAction:", v11);
    getWFVoiceShortcutClientLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((v16 & 1) != 0)
    {
      if (v18)
      {
        v20 = 136315650;
        v21 = "-[WFContextualAction(Prewarm_Internal) wf_shouldLaunchAppWithSurface:linkAction:actionMetadata:appBundleId"
              "entifier:actionIdentifier:]";
        v22 = 2114;
        v23 = v13;
        v24 = 2114;
        v25 = v14;
        _os_log_impl(&dword_1AF681000, v17, OS_LOG_TYPE_DEFAULT, "%s The action %{public}@:%{public}@ requires pre-warmed app launch", (uint8_t *)&v20, 0x20u);
      }

      v15 = 1;
    }
    else
    {
      if (v18)
      {
        v20 = 136315650;
        v21 = "-[WFContextualAction(Prewarm_Internal) wf_shouldLaunchAppWithSurface:linkAction:actionMetadata:appBundleId"
              "entifier:actionIdentifier:]";
        v22 = 2114;
        v23 = v13;
        v24 = 2114;
        v25 = v14;
        _os_log_impl(&dword_1AF681000, v17, OS_LOG_TYPE_DEFAULT, "%s The action %{public}@:%{public}@ doesn't require pre-warmed app launch", (uint8_t *)&v20, 0x20u);
      }

      v15 = 0;
    }
  }

  return v15;
}

- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3 linkAction:(id)a4 appBundleIdentifier:(id)a5 actionIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_alloc_init(MEMORY[0x1E0D44208]);
  objc_msgSend(v13, "actionForBundleIdentifier:andActionIdentifier:error:", v11, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && -[WFContextualAction wf_shouldLaunchAppWithSurface:linkAction:actionMetadata:appBundleIdentifier:actionIdentifier:](self, "wf_shouldLaunchAppWithSurface:linkAction:actionMetadata:appBundleIdentifier:actionIdentifier:", a3, v10, v14, v11, v12))
  {
    objc_msgSend(MEMORY[0x1E0D44180], "policyWithActionMetadata:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "effectiveBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "type");

    if (v17)
    {
      getWFVoiceShortcutClientLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[WFContextualAction(Prewarm_Internal) wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionIdentifier:]";
        _os_log_impl(&dword_1AF681000, v18, OS_LOG_TYPE_DEFAULT, "%s The effective bundle identifier is not an app, ignoring app launch", buf, 0xCu);
      }
      goto LABEL_12;
    }
    v19 = objc_alloc(MEMORY[0x1E0C99E08]);
    v20 = *MEMORY[0x1E0D22D88];
    v30[0] = *MEMORY[0x1E0D22DA8];
    v30[1] = v20;
    v31[0] = MEMORY[0x1E0C9AAB0];
    v31[1] = MEMORY[0x1E0C9AAB0];
    v30[2] = *MEMORY[0x1E0D22D50];
    v31[2] = &unk_1E60027C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "initWithDictionary:", v21);

    v22 = (_QWORD *)MEMORY[0x1E0DAB818];
    if (a3 != 5 && a3 != 16)
    {
      if (a3 != 12)
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "effectiveBundleIdentifier");
        v27 = v15;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bundleIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __121__WFContextualAction_Prewarm_Internal__wf_launchAppIfNeededUsingSurface_linkAction_appBundleIdentifier_actionIdentifier___block_invoke;
        v28[3] = &unk_1E5FC6B80;
        v29 = v13;
        objc_msgSend(v23, "openApplication:withOptions:completion:", v26, v24, v28);

        v15 = v27;
LABEL_12:

        goto LABEL_13;
      }
      v22 = (_QWORD *)MEMORY[0x1E0DAB800];
    }
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", *v22, *MEMORY[0x1E0D22D58]);
    goto LABEL_11;
  }
LABEL_13:

}

void __121__WFContextualAction_Prewarm_Internal__wf_launchAppIfNeededUsingSurface_linkAction_appBundleIdentifier_actionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  getWFVoiceShortcutClientLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[WFContextualAction(Prewarm_Internal) wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actio"
            "nIdentifier:]_block_invoke";
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1AF681000, v7, OS_LOG_TYPE_ERROR, "%s Pre-warmed app launch completed with error %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "pid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 136315394;
    v10 = "-[WFContextualAction(Prewarm_Internal) wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionI"
          "dentifier:]_block_invoke";
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1AF681000, v7, OS_LOG_TYPE_DEFAULT, "%s Pre-warmed app launch completed with pid %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15
{
  uint64_t v16;
  uint64_t v17;

  LOWORD(v17) = 0;
  LOBYTE(v16) = a9;
  return -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", a3, a4, a5, a6, a7, a8, v16, a10, a11, a12, a13, a14, a15, 0, v17);
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 type:(unint64_t)a5 correspondingSystemActionType:(unint64_t)a6 associatedAppBundleIdentifier:(id)a7 resultFileOperation:(int64_t)a8 alternate:(BOOL)a9 filteringBehavior:(id)a10 parameters:(id)a11 displayFormatString:(id)a12 title:(id)a13 subtitleFormatString:(id)a14 icon:(id)a15 accessoryIcon:(id)a16 actionShowsUserInterface:(BOOL)a17 isReversible:(BOOL)a18
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  WFContextualAction *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  WFContextualAction *v33;
  uint64_t v34;
  NSString *identifier;
  void *v36;
  uint64_t v37;
  NSString *wfActionIdentifier;
  uint64_t v39;
  NSString *associatedAppBundleIdentifier;
  uint64_t v41;
  NSString *displayFormatString;
  uint64_t v43;
  NSString *title;
  uint64_t v45;
  NSString *subtitleFormatString;
  WFContextualAction *v47;
  void *v49;
  void *v50;
  id v55;
  id v56;
  id v57;
  objc_super v59;
  BOOL v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v57 = a7;
  v56 = a10;
  v55 = a11;
  v22 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = a16;
  v27 = v20;
  if (v20)
  {
    if (v22)
    {
LABEL_3:
      v60 = 0;
      WFSanitizeFormatString(v22, &v60);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = self;
      goto LABEL_4;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualAction.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v22)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualAction.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayFormatString"));

  v60 = 0;
  WFSanitizeFormatString(0, &v60);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

  if (v60)
  {
    getWFVoiceShortcutClientLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v62 = "-[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppB"
            "undleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitl"
            "eFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:]";
      v63 = 2112;
      v64 = v27;
      v65 = 2112;
      v66 = v28;
      _os_log_impl(&dword_1AF681000, v30, OS_LOG_TYPE_FAULT, "%s Display format string contains prohibited specifiers. Only '%%@' can be used. Dropping the specifier. %@ (%@)", buf, 0x20u);
    }

  }
  WFSanitizeFormatString(v24, &v60);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    getWFVoiceShortcutClientLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      v62 = "-[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppB"
            "undleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitl"
            "eFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:]";
      v63 = 2112;
      v64 = v27;
      v65 = 2112;
      v66 = v31;
      _os_log_impl(&dword_1AF681000, v32, OS_LOG_TYPE_FAULT, "%s Subtitle format string contains prohibited specifiers. Only '%%@' can be used. Dropping the specifier. %@ (%@)", buf, 0x20u);
    }

  }
  v59.receiver = v29;
  v59.super_class = (Class)WFContextualAction;
  v33 = -[WFContextualAction init](&v59, sel_init);
  if (v33)
  {
    v34 = objc_msgSend(v27, "copy");
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v34;

    if (v21)
      v36 = v21;
    else
      v36 = v27;
    v37 = objc_msgSend(v36, "copy");
    wfActionIdentifier = v33->_wfActionIdentifier;
    v33->_wfActionIdentifier = (NSString *)v37;

    v33->_type = a5;
    v33->_correspondingSystemActionType = a6;
    v39 = objc_msgSend(v57, "copy");
    associatedAppBundleIdentifier = v33->_associatedAppBundleIdentifier;
    v33->_associatedAppBundleIdentifier = (NSString *)v39;

    v33->_resultFileOperation = a8;
    v33->_alternate = a9;
    objc_storeStrong((id *)&v33->_filteringBehavior, a10);
    objc_storeStrong((id *)&v33->_parameters, a11);
    v41 = objc_msgSend(v28, "copy");
    displayFormatString = v33->_displayFormatString;
    v33->_displayFormatString = (NSString *)v41;

    v43 = objc_msgSend(v23, "copy");
    title = v33->_title;
    v33->_title = (NSString *)v43;

    v45 = objc_msgSend(v31, "copy");
    subtitleFormatString = v33->_subtitleFormatString;
    v33->_subtitleFormatString = (NSString *)v45;

    objc_storeStrong((id *)&v33->_icon, a15);
    objc_storeStrong((id *)&v33->_accessoryIcon, a16);
    v33->_actionShowsUserInterface = a17;
    v33->_reversible = a18;
    v47 = v33;
  }

  return v33;
}

- (id)parameterDisplayStrings
{
  void *v2;
  void *v3;

  -[WFContextualAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_12500);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)displayString
{
  void *v3;
  void *v4;
  void *v5;

  -[WFContextualAction displayFormatString](self, "displayFormatString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction parameterDisplayStrings](self, "parameterDisplayStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSafeApplyFormatString(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)subtitle
{
  void *v3;
  void *v4;
  void *v5;

  -[WFContextualAction subtitleFormatString](self, "subtitleFormatString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction parameterDisplayStrings](self, "parameterDisplayStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFSafeApplyFormatString(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)outputsFiles
{
  return -[WFContextualAction type](self, "type") == 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction wfActionIdentifier](self, "wfActionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction displayString](self, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction filteringBehavior](self, "filteringBehavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p identifier=%@, wfActionIdentifier =%@, display string=%@, filtering behavior=%@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unint64_t v33;

  v3 = (void *)objc_opt_new();
  -[WFContextualAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v4);

  -[WFContextualAction wfActionIdentifier](self, "wfActionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFContextualAction wfActionIdentifier](self, "wfActionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v7);

  }
  -[WFContextualAction uniqueIdentifier](self, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v9);

  -[WFContextualAction parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFContextualAction parameters](self, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v3, "combine:", v12);

  }
  v14 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction type](self, "type"));
  -[WFContextualAction icon](self, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFContextualAction icon](self, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v3, "combine:", v16);

  }
  -[WFContextualAction accessoryIcon](self, "accessoryIcon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[WFContextualAction accessoryIcon](self, "accessoryIcon");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v3, "combine:", v19);

  }
  -[WFContextualAction displayString](self, "displayString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[WFContextualAction displayString](self, "displayString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v22);

  }
  -[WFContextualAction subtitle](self, "subtitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[WFContextualAction subtitle](self, "subtitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v25);

  }
  -[WFContextualAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[WFContextualAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v28);

  }
  v30 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction correspondingSystemActionType](self, "correspondingSystemActionType"));
  v31 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction showsUserInterfaceWhenRunning](self, "showsUserInterfaceWhenRunning"));
  v32 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction isReversible](self, "isReversible"));
  v33 = objc_msgSend(v3, "finalize");

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualAction *v4;
  WFContextualAction *v5;
  WFContextualAction *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  int v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  uint64_t v67;
  _BOOL4 v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  int v74;
  id v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;

  v4 = (WFContextualAction *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_96:

      goto LABEL_97;
    }
    -[WFContextualAction identifier](v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualAction identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_94;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_95:

        goto LABEL_96;
      }
    }
    -[WFContextualAction wfActionIdentifier](v6, "wfActionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualAction wfActionIdentifier](self, "wfActionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_93;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    -[WFContextualAction uniqueIdentifier](v6, "uniqueIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualAction uniqueIdentifier](self, "uniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v91 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_92;
      v12 = objc_msgSend(v20, "isEqualToString:", v24);

      if (!v12)
        goto LABEL_93;
    }
    v90 = v19;
    -[WFContextualAction parameters](v6, "parameters");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualAction parameters](self, "parameters");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    v28 = v27;
    v29 = v28;
    v89 = v20;
    if (v20 != v28)
    {
      LOBYTE(v12) = 0;
      v30 = v28;
      if (v20)
      {
        v19 = v90;
        if (v28)
        {
          v31 = v28;
          v32 = objc_msgSend(v20, "isEqualToArray:", v28);
          v88 = v31;

          if (!v32)
          {
LABEL_37:
            LOBYTE(v12) = 0;
            v19 = v90;
            v25 = v88;
LABEL_92:

            v20 = v91;
LABEL_93:

            goto LABEL_94;
          }
LABEL_30:
          v33 = -[WFContextualAction type](v6, "type");
          if (v33 != -[WFContextualAction type](self, "type"))
            goto LABEL_37;
          v34 = -[WFContextualAction resultFileOperation](v6, "resultFileOperation");
          if (v34 != -[WFContextualAction resultFileOperation](self, "resultFileOperation"))
            goto LABEL_37;
          -[WFContextualAction filteringBehavior](v6, "filteringBehavior");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContextualAction filteringBehavior](self, "filteringBehavior");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v35;
          v37 = v36;
          v87 = v37;
          if (v20 != v37)
          {
            LOBYTE(v12) = 0;
            v86 = v20;
            if (v20)
            {
              v38 = v37;
              v19 = v90;
              if (v37)
              {
                v39 = objc_msgSend(v20, "isEqual:", v37);

                if (!v39)
                  goto LABEL_41;
LABEL_40:
                v40 = -[WFContextualAction isAlternate](v6, "isAlternate");
                if (v40 != -[WFContextualAction isAlternate](self, "isAlternate"))
                {
LABEL_41:
                  LOBYTE(v12) = 0;
                  v19 = v90;
                  v30 = v87;
                  v29 = v88;
                  goto LABEL_91;
                }
                -[WFContextualAction icon](v6, "icon");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFContextualAction icon](self, "icon");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = v41;
                v44 = v42;
                v84 = v44;
                v85 = v43;
                v86 = v20;
                if (v43 != v44)
                {
                  LOBYTE(v12) = 0;
                  if (v43)
                  {
                    v45 = v44;
                    v46 = v43;
                    v19 = v90;
                    if (v44)
                    {
                      v47 = objc_msgSend(v85, "isEqual:", v44);

                      if (!v47)
                      {
                        LOBYTE(v12) = 0;
                        v19 = v90;
LABEL_89:
                        v38 = v84;
                        v20 = v85;
                        goto LABEL_90;
                      }
LABEL_49:
                      -[WFContextualAction accessoryIcon](v6, "accessoryIcon");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WFContextualAction accessoryIcon](self, "accessoryIcon");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = v48;
                      v51 = v49;
                      v82 = v51;
                      v83 = v50;
                      if (v50 != v51)
                      {
                        LOBYTE(v12) = 0;
                        if (v50)
                        {
                          v52 = v51;
                          v53 = v50;
                          v19 = v90;
                          if (v51)
                          {
                            v80 = objc_msgSend(v83, "isEqual:", v51);

                            if (!v80)
                            {
                              LOBYTE(v12) = 0;
                              v19 = v90;
LABEL_87:
                              v45 = v82;
                              v46 = v83;
                              goto LABEL_88;
                            }
LABEL_55:
                            -[WFContextualAction displayString](v6, "displayString");
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            -[WFContextualAction displayString](self, "displayString");
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            v56 = v54;
                            v57 = v55;
                            v79 = v57;
                            v81 = v56;
                            if (v56 != v57)
                            {
                              LOBYTE(v12) = 0;
                              if (v56)
                              {
                                v58 = v57;
                                v77 = v56;
                                v19 = v90;
                                if (v57)
                                {
                                  v78 = objc_msgSend(v81, "isEqualToString:", v57);

                                  if (!v78)
                                  {
                                    LOBYTE(v12) = 0;
                                    v19 = v90;
LABEL_85:
                                    v52 = v79;
                                    v53 = v81;
                                    goto LABEL_86;
                                  }
LABEL_62:
                                  -[WFContextualAction subtitle](v6, "subtitle");
                                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[WFContextualAction subtitle](self, "subtitle");
                                  v60 = (void *)objc_claimAutoreleasedReturnValue();
                                  v61 = v59;
                                  v62 = v60;
                                  v76 = v62;
                                  v77 = v61;
                                  if (v61 == v62)
                                  {

                                  }
                                  else
                                  {
                                    LOBYTE(v12) = 0;
                                    if (!v61)
                                    {
                                      v63 = v62;
                                      goto LABEL_82;
                                    }
                                    v63 = v62;
                                    if (!v62)
                                    {
LABEL_82:

                                      goto LABEL_83;
                                    }
                                    v74 = objc_msgSend(v61, "isEqualToString:", v62);

                                    if (!v74)
                                    {
                                      LOBYTE(v12) = 0;
LABEL_83:
                                      v19 = v90;
                                      v58 = v76;
                                      goto LABEL_84;
                                    }
                                  }
                                  -[WFContextualAction associatedAppBundleIdentifier](v6, "associatedAppBundleIdentifier");
                                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                                  -[WFContextualAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
                                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                                  v61 = v64;
                                  v73 = v61;
                                  v75 = v65;
                                  if (v61 == v75)
                                  {

                                  }
                                  else
                                  {
                                    if (!v61 || !v75)
                                    {

                                      v63 = v75;
                                      LOBYTE(v12) = 0;
                                      goto LABEL_82;
                                    }
                                    v66 = objc_msgSend(v61, "isEqualToString:", v75);

                                    if (!v66)
                                      goto LABEL_78;
                                  }
                                  v67 = -[WFContextualAction correspondingSystemActionType](v6, "correspondingSystemActionType", v73);
                                  if (v67 == -[WFContextualAction correspondingSystemActionType](self, "correspondingSystemActionType"))
                                  {
                                    v68 = -[WFContextualAction isReversible](v6, "isReversible");
                                    v12 = v68 ^ -[WFContextualAction isReversible](self, "isReversible") ^ 1;
LABEL_79:
                                    v61 = v73;
                                    v63 = v75;
                                    goto LABEL_82;
                                  }
LABEL_78:
                                  LOBYTE(v12) = 0;
                                  goto LABEL_79;
                                }
                              }
                              else
                              {
                                v58 = v57;
                                v77 = 0;
                                v19 = v90;
                              }
LABEL_84:

                              goto LABEL_85;
                            }

                            goto LABEL_62;
                          }
                        }
                        else
                        {
                          v52 = v51;
                          v53 = 0;
                          v19 = v90;
                        }
LABEL_86:
                        v69 = v53;

                        goto LABEL_87;
                      }

                      goto LABEL_55;
                    }
                  }
                  else
                  {
                    v45 = v44;
                    v46 = 0;
                    v19 = v90;
                  }
LABEL_88:

                  goto LABEL_89;
                }

                goto LABEL_49;
              }
            }
            else
            {
              v38 = v37;
              v19 = v90;
            }
LABEL_90:

            v30 = v87;
            v29 = v88;
            v20 = v86;
            goto LABEL_91;
          }

          goto LABEL_40;
        }
      }
      else
      {
        v19 = v90;
      }
LABEL_91:
      v70 = v20;
      v71 = v29;

      v25 = v71;
      v20 = v89;
      goto LABEL_92;
    }
    v88 = v28;

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_97:

  return v12;
}

- (NSString)iconSymbolName
{
  void *v2;
  void *v3;

  -[WFContextualAction icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSData)iconImageData
{
  void *v2;
  void *v3;

  -[WFContextualAction icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (double)iconImageScale
{
  void *v2;
  double v3;
  double v4;

  -[WFContextualAction icon](self, "icon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageScale");
  v4 = v3;

  return v4;
}

- (BOOL)showsUserInterfaceWhenRunning
{
  BOOL v2;
  void *v3;
  void *v4;

  if (self->_actionShowsUserInterface)
    return 1;
  -[WFContextualAction parameters](self, "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_firstObjectPassingTest:", &__block_literal_global_46_12494);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = v4 != 0;
  return v2;
}

- (WFContextualAction)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  WFContextualAction *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  WFContextualAction *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  void *v42;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wfActionIdentifier"));
  v39 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  v34 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("correspondingSystemActionType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedAppBundleIdentifier"));
  v38 = objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("resultFileOperation"));
  v6 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("alternate"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filteringBehavior"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("parameters"));
  v37 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayFormatString"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v36 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleFormatString"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryIcon"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("actionShowsUserInterface"));
  v14 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isReversible"));

  v15 = 0;
  v41 = (void *)v4;
  if (v4 && v10)
  {
    BYTE1(v32) = v14;
    LOBYTE(v32) = v13;
    v31 = v12;
    v16 = (void *)v12;
    v17 = (void *)v35;
    v30 = v11;
    v18 = v5;
    v19 = (void *)v11;
    v20 = (void *)v10;
    v21 = (void *)v36;
    v22 = v6;
    v23 = (void *)v37;
    LOBYTE(v29) = v22;
    v24 = v4;
    v25 = (void *)v38;
    v26 = (void *)v39;
    v27 = objc_retain(-[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", v24, v39, v18, v34, v38, v33, v29, v42, v37, v20, v36, v30, v35, v31,
              v32));
    v15 = v27;
  }
  else
  {
    v27 = self;
    v25 = (void *)v38;
    v26 = (void *)v39;
    v19 = (void *)v11;
    v20 = (void *)v10;
    v21 = (void *)v36;
    v23 = (void *)v37;
    v16 = (void *)v12;
    v17 = (void *)v35;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wfActionIdentifier, CFSTR("wfActionIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_correspondingSystemActionType, CFSTR("correspondingSystemActionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedAppBundleIdentifier, CFSTR("associatedAppBundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_resultFileOperation, CFSTR("resultFileOperation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_alternate, CFSTR("alternate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filteringBehavior, CFSTR("filteringBehavior"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayFormatString, CFSTR("displayFormatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleFormatString, CFSTR("subtitleFormatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryIcon, CFSTR("accessoryIcon"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_actionShowsUserInterface, CFSTR("actionShowsUserInterface"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_reversible, CFSTR("reversible"));

}

- (NSString)workflowRunKind
{
  __CFString *v2;

  v2 = CFSTR("ContextualAction");
  return (NSString *)CFSTR("ContextualAction");
}

- (BOOL)actionShowsUserInterface
{
  return self->_actionShowsUserInterface;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)resultFileOperation
{
  return self->_resultFileOperation;
}

- (BOOL)isAlternate
{
  return self->_alternate;
}

- (WFContextualActionIcon)icon
{
  return self->_icon;
}

- (WFContextualActionIcon)accessoryIcon
{
  return self->_accessoryIcon;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (NSString)displayFormatString
{
  return self->_displayFormatString;
}

- (NSString)subtitleFormatString
{
  return self->_subtitleFormatString;
}

- (NSString)wfActionIdentifier
{
  return self->_wfActionIdentifier;
}

- (WFContextualActionFilteringBehavior)filteringBehavior
{
  return self->_filteringBehavior;
}

- (unint64_t)correspondingSystemActionType
{
  return self->_correspondingSystemActionType;
}

- (BOOL)isReversible
{
  return self->_reversible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteringBehavior, 0);
  objc_storeStrong((id *)&self->_wfActionIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitleFormatString, 0);
  objc_storeStrong((id *)&self->_displayFormatString, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_accessoryIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __51__WFContextualAction_showsUserInterfaceWhenRunning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAskEachTime");
}

__CFString *__45__WFContextualAction_parameterDisplayStrings__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  objc_msgSend(a2, "displayString");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E5FC92C0;
  v4 = v2;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10
{
  uint64_t v11;

  BYTE2(v11) = 0;
  LOWORD(v11) = 0;
  return -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v11);
}

- (WFContextualAction)initWithIdentifier:(id)a3 wfActionIdentifier:(id)a4 associatedAppBundleIdentifier:(id)a5 parameters:(id)a6 displayFormatString:(id)a7 title:(id)a8 subtitleFormatString:(id)a9 icon:(id)a10 accessoryIcon:(id)a11 actionShowsUserInterface:(BOOL)a12 actionHasResult:(BOOL)a13 isReversible:(BOOL)a14
{
  uint64_t v15;
  uint64_t v16;

  BYTE1(v16) = a14;
  LOBYTE(v16) = a12;
  LOBYTE(v15) = 0;
  return -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", a3, a4, !a13, 0, a5, 1, v15, 0, a6, a7, a8, a9, a10, a11, v16);
}

- (id)associatedSettingsPreference
{
  return 0;
}

- (id)copyWithParameters:(id)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;

  v25 = a3;
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualAction.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameters"));

  }
  v23 = objc_alloc((Class)objc_opt_class());
  -[WFContextualAction identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction wfActionIdentifier](self, "wfActionIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WFContextualAction type](self, "type");
  v20 = -[WFContextualAction correspondingSystemActionType](self, "correspondingSystemActionType");
  -[WFContextualAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WFContextualAction resultFileOperation](self, "resultFileOperation");
  v6 = -[WFContextualAction isAlternate](self, "isAlternate");
  -[WFContextualAction filteringBehavior](self, "filteringBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction displayFormatString](self, "displayFormatString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction subtitleFormatString](self, "subtitleFormatString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction icon](self, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction accessoryIcon](self, "accessoryIcon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[WFContextualAction actionShowsUserInterface](self, "actionShowsUserInterface");
  BYTE1(v17) = -[WFContextualAction isReversible](self, "isReversible");
  LOBYTE(v17) = v13;
  LOBYTE(v16) = v6;
  v24 = (void *)objc_msgSend(v23, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:isReversible:", v5, v22, v21, v20, v19, v18, v16, v7, v25, v8, v9, v10, v11, v12, v17);

  return v24;
}

- (void)configureIfNeededForContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualAction.m"), 381, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

    v6 = 0;
  }
  (*((void (**)(id, WFContextualAction *, _QWORD))v6 + 2))(v6, self, 0);

}

- (id)contextForSurface:(unint64_t)a3
{
  uint64_t v3;

  if (a3 > 4)
    v3 = 5;
  else
    v3 = qword_1AF7809B0[a3];
  return -[WFContextualActionContext initWithSurface:]([WFContextualActionContext alloc], "initWithSurface:", v3);
}

- (id)runDescriptorForSurface:(unint64_t)a3
{
  WFContextualActionRunDescriptor *v5;
  void *v6;
  WFContextualActionRunDescriptor *v7;

  v5 = [WFContextualActionRunDescriptor alloc];
  -[WFContextualAction contextForSurface:](self, "contextForSurface:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFContextualActionRunDescriptor initWithAction:context:](v5, "initWithAction:context:", self, v6);

  return v7;
}

- (id)runRequestForSurface:(unint64_t)a3
{
  WFContextualActionRunRequest *v5;
  void *v6;
  WFContextualActionRunRequest *v7;

  v5 = [WFContextualActionRunRequest alloc];
  -[WFContextualAction contextForSurface:](self, "contextForSurface:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFContextualActionRunRequest initWithAction:actionContext:](v5, "initWithAction:actionContext:", self, v6);

  return v7;
}

- (id)settingBiomeStreamIdentifier
{
  return 0;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return CFSTR("contextual-action");
}

+ (id)systemActionWithType:(unint64_t)a3 identifier:(id)a4 displayString:(id)a5 inputTypes:(id)a6
{
  id v9;
  id v10;
  id v11;
  WFSystemContextualAction *v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[WFSystemContextualAction initWithType:identifier:displayString:inputTypes:]([WFSystemContextualAction alloc], "initWithType:identifier:displayString:inputTypes:", a3, v11, v10, v9);

  return v12;
}

@end
