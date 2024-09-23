@implementation WFAutoShortcutContextualAction

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("app-shortcut"), a3);
}

- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 bundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  WFAutoShortcutContextualAction *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutoShortcutContextualAction.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("autoShortcut"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutoShortcutContextualAction.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  objc_msgSend(v7, "parameterlessPhrases");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameterGroups");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 | v10)
  {
    if (objc_msgSend((id)v10, "count"))
    {
      v12 = (id)v10;
      if ((unint64_t)objc_msgSend(v12, "count") >= 2)
      {
        objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(v12, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v13;
    }
    else
    {
      objc_msgSend((id)v11, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "phrases");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v16;
      if ((unint64_t)objc_msgSend(v17, "count") >= 2)
      {
        objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v17, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v18;
    }
    self = -[WFAutoShortcutContextualAction initWithAutoShortcut:phrase:alternativePhrases:bundleIdentifier:](self, "initWithAutoShortcut:phrase:alternativePhrases:bundleIdentifier:", v7, v19, v20, v9);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 phrase:(id)a4 alternativePhrases:(id)a5 bundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFAutoShortcutContextualAction *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "basePhraseTemplates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "key");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "actionIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](self, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", v13, 0, v16, v12, v11, v10, v17, 0, 0, 0, 0);

  return v18;
}

- (WFAutoShortcutContextualAction)initWithAutoShortcut:(id)a3 identifier:(id)a4 parameterlessIdentifier:(id)a5 phrase:(id)a6 alternativePhrases:(id)a7 bundleIdentifier:(id)a8 actionIdentifier:(id)a9 orderOfShortcut:(unint64_t)a10 parentAction:(id)a11 prominentDisplayEligibility:(id)a12 executableAppShortcut:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  WFAutoShortcutContextualAction *v34;
  WFAutoShortcutContextualAction *v35;
  uint64_t v36;
  NSArray *alternativePhrases;
  uint64_t v38;
  NSString *bundleIdentifier;
  uint64_t v40;
  NSString *actionIdentifier;
  WFAutoShortcutContextualAction *v42;
  void *v44;
  uint64_t v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v55;
  id v56;

  v18 = a3;
  v56 = a4;
  v48 = a5;
  v52 = a5;
  v47 = a6;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v51 = a11;
  v50 = a12;
  v49 = a13;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutoShortcutContextualAction.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  objc_msgSend(v18, "attributionBundleIdentifier");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (void *)v23;
  else
    v25 = v21;
  v55 = v25;

  objc_msgSend(v19, "signature");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  v28 = v21;
  if (v56)
  {
    v29 = v56;

    v26 = v29;
  }
  v30 = v22;
  objc_msgSend(v19, "localizedPhrase");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "systemImageName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }
  BYTE2(v45) = 0;
  LOWORD(v45) = 1;
  v34 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](self, "initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:", v26, &stru_1E5FC92C0, v55, MEMORY[0x1E0C9AA60], v31, v31, 0, 0, v33, v45);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_autoShortcut, a3);
    objc_storeStrong((id *)&v35->_phrase, v47);
    v36 = objc_msgSend(v20, "copy");
    alternativePhrases = v35->_alternativePhrases;
    v35->_alternativePhrases = (NSArray *)v36;

    v38 = objc_msgSend(v28, "copy");
    bundleIdentifier = v35->_bundleIdentifier;
    v35->_bundleIdentifier = (NSString *)v38;

    v40 = objc_msgSend(v30, "copy");
    actionIdentifier = v35->_actionIdentifier;
    v35->_actionIdentifier = (NSString *)v40;

    v35->_orderOfShortcut = a10;
    objc_storeStrong((id *)&v35->_cachedProminentDisplayEligibility, a12);
    objc_storeStrong((id *)&v35->_parentAction, a11);
    objc_storeStrong((id *)&v35->_executableAppShortcut, a13);
    objc_storeStrong((id *)&v35->_parameterlessIdentifier, v48);
    v42 = v35;
  }

  return v35;
}

- (WFAutoShortcutContextualAction)initWithExecutableAppShortcut:(id)a3 index:(unint64_t)a4
{
  id v6;
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
  WFAutoShortcutContextualAction *v17;

  v6 = a3;
  objc_msgSend(v6, "underlyingAutoShortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "basePhraseTemplates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "underlyingAutoShortcut");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phrase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alternatePhrases");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "underlyingAutoShortcut");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "actionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](self, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", v11, 0, v10, v12, v13, v14, v16, a4, 0, 0, v6);

  return v17;
}

- (id)spotlightItem
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  objc_super v86;
  const __CFString *v87;
  _BYTE buf[24];
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)WFAutoShortcutContextualAction;
  -[WFContextualAction spotlightItem](&v86, sel_spotlightItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = CFSTR("com.apple.musicrecognition");
  *(_QWORD *)buf = CFSTR("com.shazam.Shazam");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v87, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "wf_associateWithBundleIdentifier:", v6);

  }
  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFAutoShortcutContextualAction spotlightDomainIdentifierForBundleIdentifier:](WFAutoShortcutContextualAction, "spotlightDomainIdentifierForBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDomainIdentifier:", v9);

  -[WFAutoShortcutContextualAction alternativePhrases](self, "alternativePhrases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "if_compactMap:", &__block_literal_global_106_4250);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v3, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setKeywords:", v11);

    objc_msgSend(v3, "attributeSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlternateNames:", v11);

  }
  -[WFAutoShortcutContextualAction parentAction](self, "parentAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = 98;
  else
    v15 = 99;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRankingHint:", v16);

  objc_msgSend(v3, "attributeSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[WFAutoShortcutContextualAction isEligibleForProminentDisplay](self, "isEligibleForProminentDisplay") ^ 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  WFSpotlightResultRunnableIneligibleForTopHit();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:forCustomKey:", v19, v20);

  -[WFAutoShortcutContextualAction phrase](self, "phrase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedPhrase");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    objc_msgSend(v3, "attributeSet");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutoShortcutContextualAction phrase](self, "phrase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedPhrase");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    WFSpotlightResultRunnablePrimaryPhrase();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forCustomKey:", v26, v27);

  }
  -[WFContextualAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = v28;
  }
  else
  {
    -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v30;

  *(_QWORD *)buf = CFSTR("com.apple.mobilenotes");
  *(_QWORD *)&buf[8] = CFSTR("com.apple.freeform");
  *(_QWORD *)&buf[16] = CFSTR("com.apple.mobilephone");
  v89 = CFSTR("com.apple.facetime");
  v90 = CFSTR("com.apple.Music");
  v91 = CFSTR("com.apple.podcasts");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "containsObject:", v31))
  {
    -[WFAutoShortcutContextualAction phrase](self, "phrase");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "parameterIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
      goto LABEL_19;
    getWFSpotlightSyncLogObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFAutoShortcutContextualAction spotlightItem]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_1AF681000, v35, OS_LOG_TYPE_INFO, "%s Bundle %@ is top hit exclusive, marking as such", buf, 0x16u);
    }

    objc_msgSend(v3, "attributeSet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    WFSpotlightResultRunnableIsAppTopHitExclusive();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setValue:forCustomKey:", MEMORY[0x1E0C9AAB0], v36);

  }
LABEL_19:
  -[WFAutoShortcutContextualAction executableAppShortcut](self, "executableAppShortcut");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entityInfo");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributeSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFAutoShortcutContextualAction isTopHitEligible](self, "isTopHitEligible"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  WFSpotlightResultRunnableIsAppShortcutTopHit();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setValue:forCustomKey:", v40, v41);

  if (-[WFAutoShortcutContextualAction isTopHitEligible](self, "isTopHitEligible"))
  {
    if (!v38)
    {
      -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "localizedShortTitle");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "attributeSet");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setDisplayName:", v53);

      -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedAutoShortcutDescription");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "attributeSet");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setSubtitle:", v56);

      v58 = (uint64_t *)MEMORY[0x1E0CB2AC0];
LABEL_35:
      v78 = *v58;
      objc_msgSend(v3, "attributeSet");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setProtectionClass:", v78);

      goto LABEL_36;
    }
    objc_msgSend(v38, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setDisplayName:", v42);

    objc_msgSend(v38, "subtitle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "attributeSet");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSubtitle:", v44);

    objc_msgSend(v38, "icon");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "imageURL");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "icon");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v47)
    {
      objc_msgSend(v48, "imageURL");
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "attributeSet");
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString setThumbnailURL:](v51, "setThumbnailURL:", v50);
    }
    else
    {
      objc_msgSend(v48, "systemName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "icon");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v60;
      if (v59)
      {
        objc_msgSend(v60, "systemName");
        v50 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "attributeSet");
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString setThumbnailSymbolName:](v51, "setThumbnailSymbolName:", v50);
      }
      else
      {
        objc_msgSend(v60, "lnPropertyIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (v61)
        {
          objc_msgSend(v3, "attributeSet");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "icon");
          v50 = objc_claimAutoreleasedReturnValue();
          -[NSObject lnPropertyIdentifier](v50, "lnPropertyIdentifier");
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
          WFSpotlightResultRunnableLNPropertyIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setValue:forCustomKey:", v51, v62);

        }
        else
        {
          getWFSpotlightSyncLogObject();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "-[WFAutoShortcutContextualAction spotlightItem]";
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v82;
            _os_log_impl(&dword_1AF681000, v81, OS_LOG_TYPE_DEBUG, "%s Indexing App Shortcut with data backed image for %@, this should be investigated", buf, 0x16u);

          }
          objc_msgSend(v38, "icon");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "imageData");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "attributeSet");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setThumbnailData:", v49);

          if ((unint64_t)objc_msgSend(v49, "length") < 0x7A121)
            goto LABEL_30;
          getWFSpotlightSyncLogObject();
          v50 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
LABEL_29:

LABEL_30:
            objc_msgSend(v38, "subtitle");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "length");

            if (v64)
            {
              objc_msgSend(v3, "attributeSet");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "subtitle");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              WFSpotlightResultRunnableSubtitle();
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "setValue:forCustomKey:", v66, v67);

            }
            objc_msgSend(v38, "icon");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "displayStyle");

            if (v69)
            {
              objc_msgSend(v3, "attributeSet");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v71 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v38, "icon");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "numberWithUnsignedInteger:", objc_msgSend(v72, "displayStyle"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              WFSpotlightResultRunnableImageDisplayStyle();
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setValue:forCustomKey:", v73, v74);

            }
            objc_msgSend(v3, "attributeSet");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v38, "badge"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            WFSpotlightResultRunnableTopHitBadge();
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "setValue:forCustomKey:", v76, v77);

            v58 = (uint64_t *)MEMORY[0x1E0CB2AB0];
            goto LABEL_35;
          }
          v85 = objc_msgSend(v49, "length");
          -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "-[WFAutoShortcutContextualAction spotlightItem]";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v85;
          *(_WORD *)&buf[22] = 2112;
          v89 = v51;
          _os_log_impl(&dword_1AF681000, v50, OS_LOG_TYPE_DEBUG, "%s Indexing large App Shortcut image of size %lu for app %@", buf, 0x20u);
        }
      }
    }

    goto LABEL_29;
  }
LABEL_36:

  return v3;
}

- (BOOL)isTopHitEligible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[WFAutoShortcutContextualAction phrase](self, "phrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFAutoShortcutContextualAction executableAppShortcut](self, "executableAppShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entityInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 1;
  }

  -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemImageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedShortTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
      v12 = v7;
    else
      v12 = 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)definesDisplayOrder
{
  return 1;
}

- (id)relatedApp
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  return v5;
}

- (id)creationDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[WFAutoShortcutContextualAction relatedApp](self, "relatedApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "registrationDate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFAutoShortcutContextualAction;
    -[WFContextualAction creationDate](&v8, sel_creationDate);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (BOOL)isEligibleForProminentDisplay
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSNumber *v11;
  NSNumber *cachedProminentDisplayEligibility;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[WFAutoShortcutContextualAction cachedProminentDisplayEligibility](self, "cachedProminentDisplayEligibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFAutoShortcutContextualAction cachedProminentDisplayEligibility](self, "cachedProminentDisplayEligibility");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    return v5;
  }
  else
  {
    v13[0] = self;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:](WFAutoShortcutContextualAction, "autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "isEligibleForProminentDisplay");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    cachedProminentDisplayEligibility = self->_cachedProminentDisplayEligibility;
    self->_cachedProminentDisplayEligibility = v11;

    return v10;
  }
}

- (id)actionBySettingEligibilityForProminentDisplay:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  WFAutoShortcutContextualAction *v15;
  WFAutoShortcutContextualAction *v17;

  v3 = a3;
  v17 = [WFAutoShortcutContextualAction alloc];
  -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction parameterlessIdentifier](self, "parameterlessIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction phrase](self, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction alternativePhrases](self, "alternativePhrases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction actionIdentifier](self, "actionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFAutoShortcutContextualAction orderOfShortcut](self, "orderOfShortcut");
  -[WFAutoShortcutContextualAction parentAction](self, "parentAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction executableAppShortcut](self, "executableAppShortcut");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](v17, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", v5, 0, v6, v7, v8, v9, v10, v11, v12, v13, v14);

  return v15;
}

- (id)actionForRunningFromSpotlight
{
  WFAutoShortcutContextualAction *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  WFAutoShortcutContextualAction *v10;

  v3 = [WFAutoShortcutContextualAction alloc];
  -[WFContextualAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction parameterlessIdentifier](self, "parameterlessIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction phrase](self, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction actionIdentifier](self, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFAutoShortcutContextualAction orderOfShortcut](self, "orderOfShortcut");
  v10 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](v3, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", 0, v4, v5, v6, 0, v7, v8, v9, 0, MEMORY[0x1E0C9AAA0], 0);

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  objc_super v20;

  v3 = (void *)objc_opt_new();
  v20.receiver = self;
  v20.super_class = (Class)WFAutoShortcutContextualAction;
  v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v20, sel_hash));
  -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "combine:", v5);

  -[WFAutoShortcutContextualAction phrase](self, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFAutoShortcutContextualAction phrase](self, "phrase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "combine:", v8);

  }
  -[WFAutoShortcutContextualAction alternativePhrases](self, "alternativePhrases");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFAutoShortcutContextualAction alternativePhrases](self, "alternativePhrases");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v11);

  }
  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v13);

  -[WFAutoShortcutContextualAction parentAction](self, "parentAction");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[WFAutoShortcutContextualAction parentAction](self, "parentAction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v3, "combine:", v16);

  }
  v18 = objc_msgSend(v3, "finalize");

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  id v39;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WFAutoShortcutContextualAction;
  if (-[WFContextualAction isEqual:](&v40, sel_isEqual_, v4))
  {
    v5 = v4;
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v11) = 0;
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend(v5, "autoShortcut");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutoShortcutContextualAction autoShortcut](self, "autoShortcut");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      v13 = v8;
      if (!v8 || !v9)
        goto LABEL_42;
      v14 = objc_msgSend(v8, "isEqual:", v9);

      if (!v14)
      {
        LOBYTE(v11) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    objc_msgSend(v5, "phrase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutoShortcutContextualAction phrase](self, "phrase");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;
    v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v18 = v17;
      v19 = v13;
      if (!v13 || !v17)
        goto LABEL_41;
      v20 = objc_msgSend(v13, "isEqual:", v17);

      if (!v20)
      {
        LOBYTE(v11) = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    objc_msgSend(v5, "alternativePhrases");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutoShortcutContextualAction alternativePhrases](self, "alternativePhrases");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v23 = v22;
    v18 = v23;
    v39 = v19;
    if (v19 == v23)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v24 = v23;
      if (!v19 || !v23)
        goto LABEL_40;
      v11 = objc_msgSend(v19, "isEqualToArray:", v23);

      if (!v11)
        goto LABEL_41;
    }
    objc_msgSend(v5, "bundleIdentifier", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v25;
    v28 = v26;
    v37 = v28;
    v38 = v27;
    if (v27 == v28)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      if (!v27)
      {
        v29 = v28;
        v18 = v36;
        goto LABEL_38;
      }
      v29 = v28;
      v18 = v36;
      if (!v28)
      {
LABEL_38:

        goto LABEL_39;
      }
      v30 = objc_msgSend(v27, "isEqualToString:", v28);

      if (!v30)
      {
        LOBYTE(v11) = 0;
        v18 = v36;
LABEL_39:
        v24 = v37;
        v19 = v38;
LABEL_40:

        v19 = v39;
LABEL_41:

        goto LABEL_42;
      }
    }
    objc_msgSend(v5, "parentAction");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutoShortcutContextualAction parentAction](self, "parentAction");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v31;
    v33 = v32;
    v34 = v33;
    if (v27 == v33)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v27)
      {
        v18 = v36;
        if (v33)
          LOBYTE(v11) = objc_msgSend(v27, "isEqual:", v33);
        goto LABEL_36;
      }
    }
    v18 = v36;
LABEL_36:

    v29 = v34;
    goto LABEL_38;
  }
  LOBYTE(v11) = 0;
LABEL_45:

  return v11;
}

- (WFAutoShortcutContextualAction)initWithCoder:(id)a3
{
  id v4;
  WFAutoShortcutContextualAction *v5;
  WFAutoShortcutContextualAction *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  WFAutoShortcutContextualAction *v23;
  void *v24;
  void *v25;
  WFAutoShortcutContextualAction *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFAutoShortcutContextualAction;
  v5 = -[WFContextualAction initWithCoder:](&v32, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = v5;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v7 = (void *)getLNAutoShortcutClass_softClass;
    v41 = getLNAutoShortcutClass_softClass;
    if (!getLNAutoShortcutClass_softClass)
    {
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __getLNAutoShortcutClass_block_invoke;
      v36 = &unk_1E5FC8858;
      v37 = &v38;
      __getLNAutoShortcutClass_block_invoke((uint64_t)&v33);
      v7 = (void *)v39[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v38, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("autoShortcut"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterlessIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executableAppShortcut"));
    v11 = objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v12 = (void *)getLNAutoShortcutLocalizedPhraseClass_softClass;
    v41 = getLNAutoShortcutLocalizedPhraseClass_softClass;
    if (!getLNAutoShortcutLocalizedPhraseClass_softClass)
    {
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __getLNAutoShortcutLocalizedPhraseClass_block_invoke;
      v36 = &unk_1E5FC8858;
      v37 = &v38;
      __getLNAutoShortcutLocalizedPhraseClass_block_invoke((uint64_t)&v33);
      v12 = (void *)v39[3];
    }
    v28 = (void *)v11;
    v13 = (void *)v10;
    v14 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v38, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("phrase"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("alternativePhrases"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("orderOfShortcut"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentAction"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v15)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cachedProminentDisplayEligibility"));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v6;
        v24 = (void *)v22;
        v25 = v28;
        v26 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](v23, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", v31, v29, v13, v15, v19, v9, v30, v20, v21, v22, v28);

        v6 = v26;
LABEL_13:

        goto LABEL_14;
      }
      v6 = -[WFAutoShortcutContextualAction initWithAutoShortcut:bundleIdentifier:](v6, "initWithAutoShortcut:bundleIdentifier:", v31, v9);
      v26 = v6;
    }
    else
    {
      v26 = 0;
    }
    v25 = v28;
    goto LABEL_13;
  }
  v26 = 0;
LABEL_14:

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAutoShortcutContextualAction;
  v4 = a3;
  -[WFContextualAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_autoShortcut, CFSTR("autoShortcut"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_phrase, CFSTR("phrase"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alternativePhrases, CFSTR("alternativePhrases"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionIdentifier, CFSTR("actionIdentifier"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_orderOfShortcut, CFSTR("orderOfShortcut"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentAction, CFSTR("parentAction"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cachedProminentDisplayEligibility, CFSTR("cachedProminentDisplayEligibility"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_executableAppShortcut, CFSTR("executableAppShortcut"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterlessIdentifier, CFSTR("parameterlessIdentifier"));

}

- (id)workflowRunKind
{
  __CFString *v2;

  v2 = CFSTR("AppShortcut");
  return CFSTR("AppShortcut");
}

- (LNAutoShortcut)autoShortcut
{
  return self->_autoShortcut;
}

- (LNAutoShortcutLocalizedPhrase)phrase
{
  return self->_phrase;
}

- (NSArray)alternativePhrases
{
  return self->_alternativePhrases;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (WFAutoShortcutContextualAction)parentAction
{
  return self->_parentAction;
}

- (unint64_t)orderOfShortcut
{
  return self->_orderOfShortcut;
}

- (NSNumber)cachedProminentDisplayEligibility
{
  return self->_cachedProminentDisplayEligibility;
}

- (WFExecutableAppShortcut)executableAppShortcut
{
  return self->_executableAppShortcut;
}

- (NSString)parameterlessIdentifier
{
  return self->_parameterlessIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterlessIdentifier, 0);
  objc_storeStrong((id *)&self->_executableAppShortcut, 0);
  objc_storeStrong((id *)&self->_cachedProminentDisplayEligibility, 0);
  objc_storeStrong((id *)&self->_parentAction, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_alternativePhrases, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_autoShortcut, 0);
}

id __47__WFAutoShortcutContextualAction_spotlightItem__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "localizedPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(v2, "localizedPhrase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)allActionsForAutoShortcut:(id)a3 bundleIdentifier:(id)a4 startIndex:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  WFAutoShortcutContextualAction *v19;
  void *v20;
  WFAutoShortcutContextualAction *v21;
  WFAutoShortcutContextualAction *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  WFAutoShortcutContextualAction *v32;
  unint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAutoShortcutContextualAction.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("autoShortcut"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAutoShortcutContextualAction.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

LABEL_3:
  objc_msgSend(v9, "parameterlessPhrases");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parameterGroups");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13 | v12)
  {
    v14 = (id)v12;
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
    {
      objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v14, "count") - 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v14, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v15;
    if (v17)
    {
      v19 = [WFAutoShortcutContextualAction alloc];
      objc_msgSend(v9, "actionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](v19, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", v9, 0, 0, v17, v18, v11, v20, a5, 0, 0, 0);

      ++a5;
    }
    else
    {
      v21 = 0;
    }
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __88__WFAutoShortcutContextualAction_allActionsForAutoShortcut_bundleIdentifier_startIndex___block_invoke;
    v29[3] = &unk_1E5FC5970;
    v33 = a5;
    v30 = v9;
    v31 = v11;
    v22 = v21;
    v32 = v22;
    objc_msgSend((id)v13, "if_compactMap:", v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      v34[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v24);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v23;
    }

  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

+ (id)autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFAutoShortcutContextualAction.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("autoShortcutContextualActions"));

  }
  objc_msgSend(v5, "if_map:", &__block_literal_global_4265);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v16 = 0;
  objc_msgSend(v7, "actionsWithFullyQualifiedIdentifiers:error:", v6, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __104__WFAutoShortcutContextualAction_autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay___block_invoke_94;
    v14[3] = &unk_1E5FC59D8;
    v15 = v8;
    objc_msgSend(v5, "if_compactMap:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
  }
  else
  {
    getWFVoiceShortcutClientLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "+[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:]";
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1AF681000, v11, OS_LOG_TYPE_FAULT, "%s Error fetching auto shortcut metadata, are you properly entitled to talk to linkd?: %@", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)legacySpotlightDomainIdentifier
{
  return CFSTR("app-shortcut");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

id __104__WFAutoShortcutContextualAction_autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    getWFVoiceShortcutClientLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = "+[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:]_block_invoke";
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1AF681000, v9, OS_LOG_TYPE_FAULT, "%s We got auto shortcut metadata with no error, but can't find %@ in the returned set", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_9;
  }
  objc_msgSend(v3, "autoShortcut");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    getWFVoiceShortcutClientLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "autoShortcut");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315650;
      v18 = "+[WFAutoShortcutContextualAction autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay:]_block_invoke";
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1AF681000, v12, OS_LOG_TYPE_FAULT, "%s We got auto shortcut metadata with no error, but can't find %@ in the returned set (for bundle %@)", (uint8_t *)&v17, 0x20u);

    }
    v9 = 0;
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "actionBySettingEligibilityForProminentDisplay:", -[NSObject openAppWhenRun](v9, "openAppWhenRun") ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v10;
}

id __104__WFAutoShortcutContextualAction_autoShortcutContextualActionsByQueryingEligibilityForProminentDisplay___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0D43CE0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "autoShortcut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithActionIdentifier:bundleIdentifier:", v6, v7);
  return v8;
}

WFAutoShortcutContextualAction *__88__WFAutoShortcutContextualAction_allActionsForAutoShortcut_bundleIdentifier_startIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  WFAutoShortcutContextualAction *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  WFAutoShortcutContextualAction *v15;

  v5 = a1[7];
  objc_msgSend(a2, "phrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 + a3;
  v10 = v7;

  v11 = [WFAutoShortcutContextualAction alloc];
  v12 = (void *)a1[4];
  v13 = a1[5];
  objc_msgSend(v12, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFAutoShortcutContextualAction initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:](v11, "initWithAutoShortcut:identifier:parameterlessIdentifier:phrase:alternativePhrases:bundleIdentifier:actionIdentifier:orderOfShortcut:parentAction:prominentDisplayEligibility:executableAppShortcut:", v12, 0, 0, v8, v10, v13, v14, v9, a1[6], 0, 0);

  return v15;
}

- (void)wf_launchAppIfNeededUsingSurface:(unint64_t)a3
{
  void *v5;
  id v6;

  -[WFAutoShortcutContextualAction bundleIdentifier](self, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutoShortcutContextualAction actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContextualAction wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionIdentifier:](self, "wf_launchAppIfNeededUsingSurface:linkAction:appBundleIdentifier:actionIdentifier:", a3, 0, v6, v5);

}

@end
