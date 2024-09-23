@implementation UISUIActivityViewControllerConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityViewControllerConfiguration)initWithCoder:(id)a3
{
  id v4;
  UISUIActivityViewControllerConfiguration *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
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
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  NSString *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  NSObject *v117;
  NSObject *v118;
  os_signpost_id_t v119;
  uint8_t v121[16];
  uint8_t buf[16];
  NSDirectionalEdgeInsets v123;

  v4 = a3;
  v5 = -[UISUIActivityViewControllerConfiguration init](self, "init");
  if (v5)
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, v5);

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "UISUIAVCConfigurationDecode", (const char *)&unk_19E4D535F, buf, 2u);
    }

    NSStringFromSelector(sel_preferredWidth);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v9);
    -[UISUIActivityViewControllerConfiguration setPreferredWidth:](v5, "setPreferredWidth:");

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_hostActivityConfigurations);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setHostActivityConfigurations:](v5, "setHostActivityConfigurations:", v14);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_hostHiddenActivityConfigurations);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setHostHiddenActivityConfigurations:](v5, "setHostHiddenActivityConfigurations:", v19);

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activityTypesToCreateInShareService);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setActivityTypesToCreateInShareService:](v5, "setActivityTypesToCreateInShareService:", v24);

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activityItemValueClassNames);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setActivityItemValueClassNames:](v5, "setActivityItemValueClassNames:", v29);

    _UISecureStandardPropertyListClasses();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setActivityItemValueExtensionMatchingDictionaries:](v5, "setActivityItemValueExtensionMatchingDictionaries:", v32);

    v33 = objc_opt_class();
    NSStringFromSelector(sel_securityScopedURLsForMatching);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setSecurityScopedURLsForMatching:](v5, "setSecurityScopedURLsForMatching:", v35);

    NSStringFromSelector(sel_allowsEmbedding);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setAllowsEmbedding:](v5, "setAllowsEmbedding:", objc_msgSend(v4, "decodeBoolForKey:", v36));

    NSStringFromSelector(sel_isContentManaged);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setIsContentManaged:](v5, "setIsContentManaged:", objc_msgSend(v4, "decodeBoolForKey:", v37));

    NSStringFromSelector(sel_shouldMatchOnlyUserElectedExtensions);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setShouldMatchOnlyUserElectedExtensions:](v5, "setShouldMatchOnlyUserElectedExtensions:", objc_msgSend(v4, "decodeBoolForKey:", v38));

    NSStringFromSelector(sel_shouldExcludeiCloudAddToDriveActivity);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setShouldExcludeiCloudAddToDriveActivity:](v5, "setShouldExcludeiCloudAddToDriveActivity:", objc_msgSend(v4, "decodeBoolForKey:", v39));

    NSStringFromSelector(sel_shouldExcludeiCloudSharingActivity);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setShouldExcludeiCloudSharingActivity:](v5, "setShouldExcludeiCloudSharingActivity:", objc_msgSend(v4, "decodeBoolForKey:", v40));

    NSStringFromSelector(sel_shouldSkipPeopleSuggestions);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setShouldSkipPeopleSuggestions:](v5, "setShouldSkipPeopleSuggestions:", objc_msgSend(v4, "decodeBoolForKey:", v41));

    NSStringFromSelector(sel_canExcludeExtensionActivities);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setCanExcludeExtensionActivities:](v5, "setCanExcludeExtensionActivities:", objc_msgSend(v4, "decodeBoolForKey:", v42));

    NSStringFromSelector(sel_canShowShareSheetPlugIns);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setCanShowShareSheetPlugIns:](v5, "setCanShowShareSheetPlugIns:", objc_msgSend(v4, "decodeBoolForKey:", v43));

    NSStringFromSelector(sel_whitelistActionActivitiesOnly);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setWhitelistActionActivitiesOnly:](v5, "setWhitelistActionActivitiesOnly:", objc_msgSend(v4, "decodeBoolForKey:", v44));

    NSStringFromSelector(sel_linkedBeforeYukon);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setLinkedBeforeYukon:](v5, "setLinkedBeforeYukon:", objc_msgSend(v4, "decodeBoolForKey:", v45));

    NSStringFromSelector(sel_numberOfVisibleSharingActivities);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setNumberOfVisibleSharingActivities:](v5, "setNumberOfVisibleSharingActivities:", objc_msgSend(v4, "decodeIntegerForKey:", v46));

    NSStringFromSelector(sel_numberOfVisibleActionActivities);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setNumberOfVisibleActionActivities:](v5, "setNumberOfVisibleActionActivities:", objc_msgSend(v4, "decodeIntegerForKey:", v47));

    NSStringFromSelector(sel_hostIdiom);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setHostIdiom:](v5, "setHostIdiom:", objc_msgSend(v4, "decodeIntegerForKey:", v48));

    NSStringFromSelector(sel_requestPeopleSuggestionsData);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setRequestPeopleSuggestionsData:](v5, "setRequestPeopleSuggestionsData:", objc_msgSend(v4, "decodeBoolForKey:", v49));

    NSStringFromSelector(sel_useSlotsForPeopleSuggestions);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setUseSlotsForPeopleSuggestions:](v5, "setUseSlotsForPeopleSuggestions:", objc_msgSend(v4, "decodeBoolForKey:", v50));

    v51 = (void *)MEMORY[0x1E0C99E60];
    v52 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_includedActivityTypes);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setIncludedActivityTypes:](v5, "setIncludedActivityTypes:", v55);

    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_excludedActivityTypes);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setExcludedActivityTypes:](v5, "setExcludedActivityTypes:", v60);

    v61 = (void *)MEMORY[0x1E0C99E60];
    v62 = objc_opt_class();
    objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_activityTypeOrder);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setActivityTypeOrder:](v5, "setActivityTypeOrder:", v65);

    NSStringFromSelector(sel_excludedActivityCategories);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setExcludedActivityCategories:](v5, "setExcludedActivityCategories:", objc_msgSend(v4, "decodeIntegerForKey:", v66));

    NSStringFromSelector(sel_sharingStyle);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setSharingStyle:](v5, "setSharingStyle:", objc_msgSend(v4, "decodeIntegerForKey:", v67));

    NSStringFromSelector(sel__unitTest_disableExcludingSourceApplicationFromOpenActivities);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v5->__unitTest_disableExcludingSourceApplicationFromOpenActivities = objc_msgSend(v4, "decodeBoolForKey:", v68);

    v69 = (void *)MEMORY[0x1E0C99E60];
    v70 = objc_opt_class();
    objc_msgSend(v69, "setWithObjects:", v70, objc_opt_class(), 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_urlsBeingShared);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setUrlsBeingShared:](v5, "setUrlsBeingShared:", v73);

    v74 = (void *)MEMORY[0x1E0C99E60];
    v75 = objc_opt_class();
    objc_msgSend(v74, "setWithObjects:", v75, objc_opt_class(), 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_linkPresentationDataForActivityItems);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setLinkPresentationDataForActivityItems:](v5, "setLinkPresentationDataForActivityItems:", v78);

    v79 = objc_opt_class();
    NSStringFromSelector(sel_hostTintColor);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setHostTintColor:](v5, "setHostTintColor:", v81);

    v82 = (void *)MEMORY[0x1E0C99E60];
    v83 = objc_opt_class();
    objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_initialPhotosAssetDetails);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setInitialPhotosAssetDetails:](v5, "setInitialPhotosAssetDetails:", v86);

    v87 = objc_opt_class();
    NSStringFromSelector(sel_sessionID);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setSessionID:](v5, "setSessionID:", v89);

    v90 = objc_opt_class();
    NSStringFromSelector(sel_hostTraitCollection);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v90, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setHostTraitCollection:](v5, "setHostTraitCollection:", v92);

    v93 = objc_opt_class();
    NSStringFromSelector(sel_hostLocale);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setHostLocale:](v5, "setHostLocale:", v95);

    v96 = objc_opt_class();
    NSStringFromSelector(sel_hostLayoutMargins);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v96, v97);
    v98 = (NSString *)objc_claimAutoreleasedReturnValue();
    v123 = NSDirectionalEdgeInsetsFromString(v98);
    -[UISUIActivityViewControllerConfiguration setHostLayoutMargins:](v5, "setHostLayoutMargins:", v123.top, v123.leading, v123.bottom, v123.trailing);

    v99 = (void *)MEMORY[0x1E0C99E60];
    v100 = objc_opt_class();
    objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_typeIdentifiersForShortcutsMatching);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setTypeIdentifiersForShortcutsMatching:](v5, "setTypeIdentifiersForShortcutsMatching:", v103);

    v104 = (void *)MEMORY[0x1E0C99E60];
    v105 = objc_opt_class();
    objc_msgSend(v104, "setWithObjects:", v105, objc_opt_class(), 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_preferredLocalizations);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setPreferredLocalizations:](v5, "setPreferredLocalizations:", v108);

    NSStringFromSelector(sel_iconSize);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeCGSizeForKey:", v109);
    -[UISUIActivityViewControllerConfiguration setIconSize:](v5, "setIconSize:");

    NSStringFromSelector(sel_iconScale);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v110);
    -[UISUIActivityViewControllerConfiguration setIconScale:](v5, "setIconScale:");

    NSStringFromSelector(sel_isCollaborative);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setIsCollaborative:](v5, "setIsCollaborative:", objc_msgSend(v4, "decodeBoolForKey:", v111));

    v112 = (void *)MEMORY[0x1E0C99E60];
    v113 = objc_opt_class();
    objc_msgSend(v112, "setWithObjects:", v113, objc_opt_class(), 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_recipients);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityViewControllerConfiguration setRecipients:](v5, "setRecipients:", v116);

    share_sheet_log();
    v117 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v118 = objc_claimAutoreleasedReturnValue();
    v119 = os_signpost_id_make_with_pointer(v118, v5);

    if (v119 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v117))
    {
      *(_WORD *)v121 = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v117, OS_SIGNPOST_INTERVAL_END, v119, "UISUIAVCConfigurationDecode", (const char *)&unk_19E4D535F, v121, 2u);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
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
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  int64_t v39;
  void *v40;
  int64_t v41;
  void *v42;
  int64_t v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int64_t v55;
  void *v56;
  int64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  _BOOL8 v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  NSDirectionalEdgeInsets v94;

  v93 = a3;
  -[UISUIActivityViewControllerConfiguration preferredWidth](self, "preferredWidth");
  v5 = v4;
  NSStringFromSelector(sel_preferredWidth);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeDouble:forKey:", v6, v5);

  -[UISUIActivityViewControllerConfiguration hostActivityConfigurations](self, "hostActivityConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hostActivityConfigurations);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v7, v8);

  -[UISUIActivityViewControllerConfiguration hostHiddenActivityConfigurations](self, "hostHiddenActivityConfigurations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hostHiddenActivityConfigurations);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v9, v10);

  -[UISUIActivityViewControllerConfiguration activityTypesToCreateInShareService](self, "activityTypesToCreateInShareService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityTypesToCreateInShareService);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v11, v12);

  -[UISUIActivityViewControllerConfiguration activityItemValueClassNames](self, "activityItemValueClassNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityItemValueClassNames);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v13, v14);

  -[UISUIActivityViewControllerConfiguration activityItemValueExtensionMatchingDictionaries](self, "activityItemValueExtensionMatchingDictionaries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityItemValueExtensionMatchingDictionaries);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v15, v16);

  -[UISUIActivityViewControllerConfiguration securityScopedURLsForMatching](self, "securityScopedURLsForMatching");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_securityScopedURLsForMatching);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v17, v18);

  v19 = -[UISUIActivityViewControllerConfiguration allowsEmbedding](self, "allowsEmbedding");
  NSStringFromSelector(sel_allowsEmbedding);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v19, v20);

  v21 = -[UISUIActivityViewControllerConfiguration isContentManaged](self, "isContentManaged");
  NSStringFromSelector(sel_isContentManaged);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v21, v22);

  v23 = -[UISUIActivityViewControllerConfiguration shouldMatchOnlyUserElectedExtensions](self, "shouldMatchOnlyUserElectedExtensions");
  NSStringFromSelector(sel_shouldMatchOnlyUserElectedExtensions);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v23, v24);

  v25 = -[UISUIActivityViewControllerConfiguration shouldExcludeiCloudAddToDriveActivity](self, "shouldExcludeiCloudAddToDriveActivity");
  NSStringFromSelector(sel_shouldExcludeiCloudAddToDriveActivity);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v25, v26);

  v27 = -[UISUIActivityViewControllerConfiguration shouldExcludeiCloudSharingActivity](self, "shouldExcludeiCloudSharingActivity");
  NSStringFromSelector(sel_shouldExcludeiCloudSharingActivity);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v27, v28);

  v29 = -[UISUIActivityViewControllerConfiguration shouldSkipPeopleSuggestions](self, "shouldSkipPeopleSuggestions");
  NSStringFromSelector(sel_shouldSkipPeopleSuggestions);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v29, v30);

  v31 = -[UISUIActivityViewControllerConfiguration canExcludeExtensionActivities](self, "canExcludeExtensionActivities");
  NSStringFromSelector(sel_canExcludeExtensionActivities);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v31, v32);

  v33 = -[UISUIActivityViewControllerConfiguration canShowShareSheetPlugIns](self, "canShowShareSheetPlugIns");
  NSStringFromSelector(sel_canShowShareSheetPlugIns);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v33, v34);

  v35 = -[UISUIActivityViewControllerConfiguration whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly");
  NSStringFromSelector(sel_whitelistActionActivitiesOnly);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v35, v36);

  v37 = -[UISUIActivityViewControllerConfiguration linkedBeforeYukon](self, "linkedBeforeYukon");
  NSStringFromSelector(sel_linkedBeforeYukon);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v37, v38);

  v39 = -[UISUIActivityViewControllerConfiguration numberOfVisibleSharingActivities](self, "numberOfVisibleSharingActivities");
  NSStringFromSelector(sel_numberOfVisibleSharingActivities);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeInteger:forKey:", v39, v40);

  v41 = -[UISUIActivityViewControllerConfiguration numberOfVisibleActionActivities](self, "numberOfVisibleActionActivities");
  NSStringFromSelector(sel_numberOfVisibleActionActivities);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeInteger:forKey:", v41, v42);

  v43 = -[UISUIActivityViewControllerConfiguration hostIdiom](self, "hostIdiom");
  NSStringFromSelector(sel_hostIdiom);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeInteger:forKey:", v43, v44);

  v45 = -[UISUIActivityViewControllerConfiguration requestPeopleSuggestionsData](self, "requestPeopleSuggestionsData");
  NSStringFromSelector(sel_requestPeopleSuggestionsData);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v45, v46);

  v47 = -[UISUIActivityViewControllerConfiguration useSlotsForPeopleSuggestions](self, "useSlotsForPeopleSuggestions");
  NSStringFromSelector(sel_useSlotsForPeopleSuggestions);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v47, v48);

  -[UISUIActivityViewControllerConfiguration includedActivityTypes](self, "includedActivityTypes");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_includedActivityTypes);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v49, v50);

  -[UISUIActivityViewControllerConfiguration excludedActivityTypes](self, "excludedActivityTypes");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_excludedActivityTypes);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v51, v52);

  -[UISUIActivityViewControllerConfiguration activityTypeOrder](self, "activityTypeOrder");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_activityTypeOrder);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v53, v54);

  v55 = -[UISUIActivityViewControllerConfiguration excludedActivityCategories](self, "excludedActivityCategories");
  NSStringFromSelector(sel_excludedActivityCategories);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeInteger:forKey:", v55, v56);

  v57 = -[UISUIActivityViewControllerConfiguration sharingStyle](self, "sharingStyle");
  NSStringFromSelector(sel_sharingStyle);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeInteger:forKey:", v57, v58);

  -[UISUIActivityViewControllerConfiguration linkPresentationDataForActivityItems](self, "linkPresentationDataForActivityItems");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_linkPresentationDataForActivityItems);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v59, v60);

  if (_isUnitTesting_onceToken != -1)
    dispatch_once(&_isUnitTesting_onceToken, &__block_literal_global_20);
  if (_isUnitTesting_isUnitTesting)
  {
    v61 = _unitTest_disableExcludingSourceApplicationFromOpenActivities_defaultValue;
    NSStringFromSelector(sel__unitTest_disableExcludingSourceApplicationFromOpenActivities);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "encodeBool:forKey:", v61, v62);

  }
  -[UISUIActivityViewControllerConfiguration urlsBeingShared](self, "urlsBeingShared");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_urlsBeingShared);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v63, v64);

  -[UISUIActivityViewControllerConfiguration hostTintColor](self, "hostTintColor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hostTintColor);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v65, v66);

  -[UISUIActivityViewControllerConfiguration initialPhotosAssetDetails](self, "initialPhotosAssetDetails");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initialPhotosAssetDetails);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v67, v68);

  -[UISUIActivityViewControllerConfiguration sessionID](self, "sessionID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sessionID);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v69, v70);

  -[UISUIActivityViewControllerConfiguration hostTraitCollection](self, "hostTraitCollection");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hostTraitCollection);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v71, v72);

  -[UISUIActivityViewControllerConfiguration hostLocale](self, "hostLocale");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hostLocale);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v73, v74);

  -[UISUIActivityViewControllerConfiguration hostLayoutMargins](self, "hostLayoutMargins");
  NSStringFromDirectionalEdgeInsets(v94);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_hostLayoutMargins);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v75, v76);

  -[UISUIActivityViewControllerConfiguration typeIdentifiersForShortcutsMatching](self, "typeIdentifiersForShortcutsMatching");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_typeIdentifiersForShortcutsMatching);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v77, v78);

  -[UISUIActivityViewControllerConfiguration preferredLocalizations](self, "preferredLocalizations");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_preferredLocalizations);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v79, v80);

  -[UISUIActivityViewControllerConfiguration iconSize](self, "iconSize");
  v82 = v81;
  v84 = v83;
  NSStringFromSelector(sel_iconSize);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeCGSize:forKey:", v85, v82, v84);

  -[UISUIActivityViewControllerConfiguration iconScale](self, "iconScale");
  v87 = v86;
  NSStringFromSelector(sel_iconScale);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeDouble:forKey:", v88, v87);

  v89 = -[UISUIActivityViewControllerConfiguration isCollaborative](self, "isCollaborative");
  NSStringFromSelector(sel_isCollaborative);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeBool:forKey:", v89, v90);

  -[UISUIActivityViewControllerConfiguration recipients](self, "recipients");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_recipients);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "encodeObject:forKey:", v91, v92);

}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v13 = objc_opt_class();
  NSAppendPrintF();
  v18 = 0;
  -[UISUIActivityViewControllerConfiguration sessionID](self, "sessionID", v13, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = v18;

  if (-[UISUIActivityViewControllerConfiguration isContentManaged](self, "isContentManaged", v14))
  {
    NSAppendPrintF();
    v4 = v3;

    v3 = v4;
  }
  -[UISUIActivityViewControllerConfiguration includedActivityTypes](self, "includedActivityTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[UISUIActivityViewControllerConfiguration includedActivityTypes](self, "includedActivityTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v7 = v3;

    v3 = v7;
  }
  -[UISUIActivityViewControllerConfiguration excludedActivityTypes](self, "excludedActivityTypes", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[UISUIActivityViewControllerConfiguration excludedActivityTypes](self, "excludedActivityTypes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v10 = v3;

    v3 = v10;
  }
  -[UISUIActivityViewControllerConfiguration activityItemValueExtensionMatchingDictionaries](self, "activityItemValueExtensionMatchingDictionaries", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v11 = v3;

  return v11;
}

- (id)contextForMatchingByActivityItemValueClasses
{
  void *v3;
  void *v4;

  -[UISUIActivityViewControllerConfiguration availableActivityItemValueClasses](self, "availableActivityItemValueClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISUIActivityViewControllerConfiguration _contextForMatchingActivityItems:activityItemValues:activityItemValueClasses:](self, "_contextForMatchingActivityItems:activityItemValues:activityItemValueClasses:", 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contextForMatchingByActivityItems:(id)a3 itemValues:(id)a4
{
  return -[UISUIActivityViewControllerConfiguration _contextForMatchingActivityItems:activityItemValues:activityItemValueClasses:](self, "_contextForMatchingActivityItems:activityItemValues:activityItemValueClasses:", a3, a4, 0);
}

- (id)_contextForMatchingActivityItems:(id)a3 activityItemValues:(id)a4 activityItemValueClasses:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _UIActivityMatchingContext *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (id)MEMORY[0x1E0C9AA60];
  if (a3)
    v10 = a3;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "addObjectsFromArray:", v8);
  }
  else
  {
    -[UISUIActivityViewControllerConfiguration securityScopedURLsForMatching](self, "securityScopedURLsForMatching");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v30 = v9;
      -[UISUIActivityViewControllerConfiguration securityScopedURLsForMatching](self, "securityScopedURLsForMatching");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v29 = v15;
      objc_msgSend(v15, "securityScopedResources");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v32;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21), "url");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v22);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v19);
      }

      objc_msgSend(v13, "addObjectsFromArray:", v16);
      v9 = v30;
    }
  }
  v23 = -[_UIActivityMatchingContext initWithActivityItems:itemValues:]([_UIActivityMatchingContext alloc], "initWithActivityItems:itemValues:", v11, v13);
  -[_UIActivityMatchingContext setActivityItemValueClasses:](v23, "setActivityItemValueClasses:", v9);
  -[UISUIActivityViewControllerConfiguration activityItemValueExtensionMatchingDictionaries](self, "activityItemValueExtensionMatchingDictionaries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setActivityItemValueExtensionMatchingDictionaries:](v23, "setActivityItemValueExtensionMatchingDictionaries:", v24);

  -[_UIActivityMatchingContext setIsContentManaged:](v23, "setIsContentManaged:", -[UISUIActivityViewControllerConfiguration isContentManaged](self, "isContentManaged"));
  -[_UIActivityMatchingContext setShouldMatchOnlyUserElectedExtensions:](v23, "setShouldMatchOnlyUserElectedExtensions:", -[UISUIActivityViewControllerConfiguration shouldMatchOnlyUserElectedExtensions](self, "shouldMatchOnlyUserElectedExtensions"));
  -[_UIActivityMatchingContext setShouldExcludeiCloudAddToDriveActivity:](v23, "setShouldExcludeiCloudAddToDriveActivity:", -[UISUIActivityViewControllerConfiguration shouldExcludeiCloudAddToDriveActivity](self, "shouldExcludeiCloudAddToDriveActivity"));
  -[_UIActivityMatchingContext setShouldExcludeiCloudSharingActivity:](v23, "setShouldExcludeiCloudSharingActivity:", -[UISUIActivityViewControllerConfiguration shouldExcludeiCloudSharingActivity](self, "shouldExcludeiCloudSharingActivity"));
  -[_UIActivityMatchingContext setWhitelistActionActivitiesOnly:](v23, "setWhitelistActionActivitiesOnly:", -[UISUIActivityViewControllerConfiguration whitelistActionActivitiesOnly](self, "whitelistActionActivitiesOnly"));
  -[UISUIActivityViewControllerConfiguration activityTypeOrder](self, "activityTypeOrder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setActivityTypeOrder:](v23, "setActivityTypeOrder:", v25);

  -[UISUIActivityViewControllerConfiguration includedActivityTypes](self, "includedActivityTypes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setIncludedActivityTypes:](v23, "setIncludedActivityTypes:", v26);

  -[UISUIActivityViewControllerConfiguration excludedActivityTypes](self, "excludedActivityTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityMatchingContext setExcludedActivityTypes:](v23, "setExcludedActivityTypes:", v27);

  -[_UIActivityMatchingContext setExcludedActivityCategories:](v23, "setExcludedActivityCategories:", -[UISUIActivityViewControllerConfiguration excludedActivityCategories](self, "excludedActivityCategories"));
  -[_UIActivityMatchingContext setCanExcludeExtensionActivities:](v23, "setCanExcludeExtensionActivities:", -[UISUIActivityViewControllerConfiguration canExcludeExtensionActivities](self, "canExcludeExtensionActivities"));
  -[_UIActivityMatchingContext setSharingStyle:](v23, "setSharingStyle:", -[UISUIActivityViewControllerConfiguration sharingStyle](self, "sharingStyle"));

  return v23;
}

- (id)availableActivityItemValueClasses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UISUIActivityViewControllerConfiguration activityItemValueClassNames](self, "activityItemValueClassNames", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = NSClassFromString(*(NSString **)(*((_QWORD *)&v11 + 1) + 8 * v8));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

+ (void)_unitTest_SetDisableExcludingSourceApplicationFromOpenActivities:(BOOL)a3
{
  _unitTest_disableExcludingSourceApplicationFromOpenActivities_defaultValue = a3;
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (NSArray)hostActivityConfigurations
{
  return self->_hostActivityConfigurations;
}

- (void)setHostActivityConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_hostActivityConfigurations, a3);
}

- (NSArray)hostHiddenActivityConfigurations
{
  return self->_hostHiddenActivityConfigurations;
}

- (void)setHostHiddenActivityConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_hostHiddenActivityConfigurations, a3);
}

- (NSArray)activityItemValueClassNames
{
  return self->_activityItemValueClassNames;
}

- (void)setActivityItemValueClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemValueClassNames, a3);
}

- (NSArray)activityTypesToCreateInShareService
{
  return self->_activityTypesToCreateInShareService;
}

- (void)setActivityTypesToCreateInShareService:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, a3);
}

- (UISUISecurityContext)securityScopedURLsForMatching
{
  return self->_securityScopedURLsForMatching;
}

- (void)setSecurityScopedURLsForMatching:(id)a3
{
  objc_storeStrong((id *)&self->_securityScopedURLsForMatching, a3);
}

- (NSArray)activityItemValueExtensionMatchingDictionaries
{
  return self->_activityItemValueExtensionMatchingDictionaries;
}

- (void)setActivityItemValueExtensionMatchingDictionaries:(id)a3
{
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, a3);
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
  objc_storeStrong((id *)&self->_urlsBeingShared, a3);
}

- (NSArray)linkPresentationDataForActivityItems
{
  return self->_linkPresentationDataForActivityItems;
}

- (void)setLinkPresentationDataForActivityItems:(id)a3
{
  objc_storeStrong((id *)&self->_linkPresentationDataForActivityItems, a3);
}

- (NSArray)typeIdentifiersForShortcutsMatching
{
  return self->_typeIdentifiersForShortcutsMatching;
}

- (void)setTypeIdentifiersForShortcutsMatching:(id)a3
{
  objc_storeStrong((id *)&self->_typeIdentifiersForShortcutsMatching, a3);
}

- (UIColor)hostTintColor
{
  return self->_hostTintColor;
}

- (void)setHostTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_hostTintColor, a3);
}

- (NSArray)initialPhotosAssetDetails
{
  return self->_initialPhotosAssetDetails;
}

- (void)setInitialPhotosAssetDetails:(id)a3
{
  objc_storeStrong((id *)&self->_initialPhotosAssetDetails, a3);
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (UITraitCollection)hostTraitCollection
{
  return self->_hostTraitCollection;
}

- (void)setHostTraitCollection:(id)a3
{
  objc_storeStrong((id *)&self->_hostTraitCollection, a3);
}

- (NSDirectionalEdgeInsets)hostLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_hostLayoutMargins.top;
  leading = self->_hostLayoutMargins.leading;
  bottom = self->_hostLayoutMargins.bottom;
  trailing = self->_hostLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setHostLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_hostLayoutMargins = a3;
}

- (NSLocale)hostLocale
{
  return self->_hostLocale;
}

- (void)setHostLocale:(id)a3
{
  objc_storeStrong((id *)&self->_hostLocale, a3);
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (void)setPreferredLocalizations:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLocalizations, a3);
}

- (int64_t)hostIdiom
{
  return self->_hostIdiom;
}

- (void)setHostIdiom:(int64_t)a3
{
  self->_hostIdiom = a3;
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

- (int64_t)numberOfVisibleSharingActivities
{
  return self->_numberOfVisibleSharingActivities;
}

- (void)setNumberOfVisibleSharingActivities:(int64_t)a3
{
  self->_numberOfVisibleSharingActivities = a3;
}

- (int64_t)numberOfVisibleActionActivities
{
  return self->_numberOfVisibleActionActivities;
}

- (void)setNumberOfVisibleActionActivities:(int64_t)a3
{
  self->_numberOfVisibleActionActivities = a3;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  self->_allowsEmbedding = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setIsContentManaged:(BOOL)a3
{
  self->_isContentManaged = a3;
}

- (BOOL)shouldMatchOnlyUserElectedExtensions
{
  return self->_shouldMatchOnlyUserElectedExtensions;
}

- (void)setShouldMatchOnlyUserElectedExtensions:(BOOL)a3
{
  self->_shouldMatchOnlyUserElectedExtensions = a3;
}

- (BOOL)shouldExcludeiCloudAddToDriveActivity
{
  return self->_shouldExcludeiCloudAddToDriveActivity;
}

- (void)setShouldExcludeiCloudAddToDriveActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudAddToDriveActivity = a3;
}

- (BOOL)shouldExcludeiCloudSharingActivity
{
  return self->_shouldExcludeiCloudSharingActivity;
}

- (void)setShouldExcludeiCloudSharingActivity:(BOOL)a3
{
  self->_shouldExcludeiCloudSharingActivity = a3;
}

- (BOOL)shouldSkipPeopleSuggestions
{
  return self->_shouldSkipPeopleSuggestions;
}

- (void)setShouldSkipPeopleSuggestions:(BOOL)a3
{
  self->_shouldSkipPeopleSuggestions = a3;
}

- (BOOL)canExcludeExtensionActivities
{
  return self->_canExcludeExtensionActivities;
}

- (void)setCanExcludeExtensionActivities:(BOOL)a3
{
  self->_canExcludeExtensionActivities = a3;
}

- (BOOL)canShowShareSheetPlugIns
{
  return self->_canShowShareSheetPlugIns;
}

- (void)setCanShowShareSheetPlugIns:(BOOL)a3
{
  self->_canShowShareSheetPlugIns = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)linkedBeforeYukon
{
  return self->_linkedBeforeYukon;
}

- (void)setLinkedBeforeYukon:(BOOL)a3
{
  self->_linkedBeforeYukon = a3;
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (void)setIsCollaborative:(BOOL)a3
{
  self->_isCollaborative = a3;
}

- (BOOL)requestPeopleSuggestionsData
{
  return self->_requestPeopleSuggestionsData;
}

- (void)setRequestPeopleSuggestionsData:(BOOL)a3
{
  self->_requestPeopleSuggestionsData = a3;
}

- (BOOL)useSlotsForPeopleSuggestions
{
  return self->_useSlotsForPeopleSuggestions;
}

- (void)setUseSlotsForPeopleSuggestions:(BOOL)a3
{
  self->_useSlotsForPeopleSuggestions = a3;
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_includedActivityTypes, a3);
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_excludedActivityTypes, a3);
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypeOrder, a3);
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (BOOL)_unitTest_disableExcludingSourceApplicationFromOpenActivities
{
  return self->__unitTest_disableExcludingSourceApplicationFromOpenActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_storeStrong((id *)&self->_hostLocale, 0);
  objc_storeStrong((id *)&self->_hostTraitCollection, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_initialPhotosAssetDetails, 0);
  objc_storeStrong((id *)&self->_hostTintColor, 0);
  objc_storeStrong((id *)&self->_typeIdentifiersForShortcutsMatching, 0);
  objc_storeStrong((id *)&self->_linkPresentationDataForActivityItems, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_activityItemValueExtensionMatchingDictionaries, 0);
  objc_storeStrong((id *)&self->_securityScopedURLsForMatching, 0);
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, 0);
  objc_storeStrong((id *)&self->_activityItemValueClassNames, 0);
  objc_storeStrong((id *)&self->_hostHiddenActivityConfigurations, 0);
  objc_storeStrong((id *)&self->_hostActivityConfigurations, 0);
}

@end
