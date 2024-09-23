@implementation UNCNotificationSourceDescription

id __70__UNCNotificationSourceDescription_Factory__systemSourceDirectoryURLs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = a2;
  BSSystemRootDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = CFSTR("UserNotifications");
  v8[3] = CFSTR("Bundles");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __82__UNCNotificationSourceDescription_Factory__setDefaultCategoriesFromArray_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
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
  uint64_t v49;
  id v50;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  void *v64;
  id obj;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  unsigned int v69;
  uint64_t v70;
  unsigned int v71;
  void *v72;
  void *v73;
  uint64_t v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  unsigned int v79;
  void *v80;
  unsigned int v81;
  void *v82;
  unsigned int v83;
  void *v84;
  unsigned int v85;
  void *v86;
  unsigned int v87;
  void *v88;
  unsigned int v89;
  void *v90;
  unsigned int v91;
  void *v92;
  unsigned int v93;
  void *v94;
  unsigned int v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategoryIdentifier"), objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedInfoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategoryHiddenPreviewsBodyPlaceholder"), objc_opt_class());
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v61, objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategorySummaryFormat"), objc_opt_class());
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v59, objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategoryBackgroundStyle"), objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategoryListPriority"), objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategoryIntentIdentifiers"), objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v3;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNCategoryActions"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v5;
  v73 = v4;
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (v74)
  {
    v68 = *MEMORY[0x24BEBF530];
    v70 = *(_QWORD *)v97;
    v66 = *MEMORY[0x24BEBF528];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v97 != v70)
          objc_enumerationMutation(obj);
        v78 = v6;
        v7 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v6);
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionIdentifier"), objc_opt_class());
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionTitle"), objc_opt_class());
        v9 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v9, objc_opt_class());
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 0;
        if (v12)
        {
          v13 = *MEMORY[0x24BDF8988];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8988], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v101 = v64;
            v102 = 2114;
            v103 = v8;
            v104 = 2114;
            v105 = v9;
            _os_log_error_impl(&dword_216DCB000, v13, OS_LOG_TYPE_ERROR, "Error: Category (%{public}@) has an action (%{public}@) whose title key (%{public}@) is mapped to a missing localized string.", buf, 0x20u);
          }
        }
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionTextInputButtonTitle"), objc_opt_class());
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v90, objc_opt_class());
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionTextInputPlaceholder"), objc_opt_class());
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "bs_safeObjectForKey:ofType:", v86, objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionSystemIconName"), objc_opt_class());
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionTemplateIconName"), objc_opt_class());
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionURL"), objc_opt_class());
        v16 = objc_claimAutoreleasedReturnValue();
        v92 = (void *)v9;
        v94 = (void *)v8;
        v84 = (void *)v15;
        v80 = (void *)v16;
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionAuthenticationRequired"), objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "un_safeBoolValue");

        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionDestructive"), objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v20, "un_safeBoolValue");

        objc_msgSend(v7, "objectForKey:", CFSTR("UNActionForeground"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionForeground"), objc_opt_class());
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "un_safeBoolValue");

        }
        else
        {
          v23 = v17 != 0;
        }

        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionPreventNotificationDismissal"), objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "un_safeBoolValue");

        objc_msgSend(v7, "bs_safeObjectForKey:ofType:", CFSTR("UNActionTextInput"), objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = objc_msgSend(v26, "un_safeBoolValue");

        v27 = objc_alloc_init(MEMORY[0x24BEBF3D8]);
        objc_msgSend(v27, "setIdentifier:", v94);
        objc_msgSend(v27, "setTitle:", v11);
        objc_msgSend(v27, "setTextInputButtonTitle:", v88);
        objc_msgSend(v27, "setTextInputPlaceholder:", v14);
        objc_msgSend(v27, "setUrl:", v17);
        objc_msgSend(v27, "setAuthenticationRequired:", v19);
        objc_msgSend(v27, "setDestructive:", v76);
        objc_msgSend(v27, "setForeground:", v23);
        objc_msgSend(v27, "setShouldPreventNotificationDismiss:", v25);
        if ((_DWORD)v24)
          v28 = v68;
        else
          v28 = v66;
        objc_msgSend(v27, "setActionType:", v28);
        if (v84)
          v29 = v84;
        else
          v29 = v82;
        objc_msgSend(v27, "setHasSystemIcon:", v84 != 0);
        objc_msgSend(v27, "setIconImageName:", v29);
        objc_msgSend(v72, "addObject:", v27);

        v6 = v78 + 1;
        v4 = v73;
      }
      while (v74 != v78 + 1);
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    }
    while (v74);
  }

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryAllowInCarPlay"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v30, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryCustomDismissAction"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v31, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryFollowActivityAction"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v32, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryCustomSilenceAction"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v33, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryHiddenPreviewsShowSubtitle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v34, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryHiddenPreviewsShowTitle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v35, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryPresentFullScreenAlertOverList"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v36, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryPreventAutomaticLock"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v37, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryPreventAutomaticRemovalFromRecents"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = objc_msgSend(v38, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryPreventDismissWhenClosed"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v39, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryRevealAdditionalContentWhenPresented"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v40, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryAllowActionsInCarPlay"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v41, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryAllowPersistentBannersInCarPlay"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v42, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryPlayMediaWhenRaised"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v43, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryPreventClearFromList"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v44, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategoryAlwaysDisplayNotificationsIndicator"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v45, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategorySuppressDelayForForwardedNotifications"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v46, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategorySuppressDismissActionInCarPlay"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v47, "un_safeBoolValue");

  objc_msgSend(v62, "objectForKey:", CFSTR("UNCategorySuppressPresentationInAmbient"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "un_safeBoolValue");

  v50 = objc_alloc_init(MEMORY[0x24BEBF3E0]);
  objc_msgSend(v50, "setIdentifier:", v64);
  objc_msgSend(v50, "setPrivateBody:", v60);
  objc_msgSend(v50, "setSummaryFormat:", v58);
  objc_msgSend(v50, "setBackgroundStyle:", v57);
  objc_msgSend(v50, "setListPriority:", v56);
  objc_msgSend(v50, "setActions:", v72);
  objc_msgSend(v50, "setShouldAllowInCarPlay:", v95);
  objc_msgSend(v50, "setHasCustomDismissAction:", v93);
  objc_msgSend(v50, "setHasFollowActivityAction:", v91);
  objc_msgSend(v50, "setHasCustomSilenceAction:", v89);
  objc_msgSend(v50, "setIntentIdentifiers:", v55);
  objc_msgSend(v50, "setPrivacyOptionShowSubtitle:", v87);
  objc_msgSend(v50, "setPrivacyOptionShowTitle:", v85);
  objc_msgSend(v50, "setPresentFullScreenAlertOverList:", v83);
  objc_msgSend(v50, "setPreventAutomaticLock:", v81);
  objc_msgSend(v50, "setPreventAutomaticRemovalFromRecent:", v79);
  objc_msgSend(v50, "setPreventDismissWhenClosed:", v77);
  objc_msgSend(v50, "setRevealAdditionalContentWhenPresented:", v75);
  objc_msgSend(v50, "setShouldAllowActionsInCarPlay:", v71);
  objc_msgSend(v50, "setShouldAllowPersistentBannersInCarPlay:", v69);
  objc_msgSend(v50, "setPlayMediaWhenRaised:", v67);
  objc_msgSend(v50, "setPreventClearFromList:", v63);
  objc_msgSend(v50, "setAlwaysDisplayNotificationsIndicator:", v54);
  objc_msgSend(v50, "setSuppressDelayForForwardedNotifications:", v53);
  objc_msgSend(v50, "setSuppressDismissActionInCarPlay:", v52);
  objc_msgSend(v50, "setSuppressPresentationInAmbient:", v49);

  return v50;
}

id __78__UNCNotificationSourceDescription_Factory__setDefaultTopicsFromArray_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNTopicIdentifier"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNTopicDisplayName"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedInfoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_safeObjectForKey:ofType:", v5, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeObjectForKey:ofType:", CFSTR("UNTopicDefaultSettings"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBF428], "notificationSourceSettingsDescriptionFromDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BEBF438]);
  objc_msgSend(v10, "setIdentifier:", v4);
  objc_msgSend(v10, "setDisplayName:", v7);
  objc_msgSend(v10, "setSupportsAlerts:", objc_msgSend(v9, "supportsAlerts"));
  objc_msgSend(v10, "setSupportsBadges:", objc_msgSend(v9, "supportsBadges"));
  objc_msgSend(v10, "setSupportsSounds:", objc_msgSend(v9, "supportsSounds"));
  objc_msgSend(v10, "setSupportsLockScreen:", objc_msgSend(v9, "supportsLockScreen"));
  objc_msgSend(v10, "setSupportsNotificationCenter:", objc_msgSend(v9, "supportsNotificationCenter"));
  objc_msgSend(v10, "setSupportsCarPlay:", objc_msgSend(v9, "supportsCarPlay"));
  objc_msgSend(v10, "setEnablesAlerts:", objc_msgSend(v9, "supportsAlerts"));
  objc_msgSend(v10, "setEnablesBadges:", objc_msgSend(v9, "supportsBadges"));
  objc_msgSend(v10, "setEnablesSounds:", objc_msgSend(v9, "supportsSounds"));
  objc_msgSend(v10, "setEnablesLockScreen:", objc_msgSend(v9, "supportsLockScreen"));
  objc_msgSend(v10, "setEnablesNotificationCenter:", objc_msgSend(v9, "supportsNotificationCenter"));
  objc_msgSend(v10, "setEnablesCarPlay:", objc_msgSend(v9, "supportsCarPlay"));
  objc_msgSend(v10, "setModalAlertStyle:", objc_msgSend(v9, "modalAlertStyle"));
  objc_msgSend(v10, "setSupportsTimeSensitive:", objc_msgSend(v9, "supportsTimeSensitive"));

  return v10;
}

@end
