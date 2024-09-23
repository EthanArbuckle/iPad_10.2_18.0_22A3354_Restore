@implementation MIInstallationJournalEntry

- (int)_promoteKeychainItemsForAppClipWithAppIdentifier:(id)a3 toParentAppWithAppIdentifier:(id)a4
{
  return SecItemPromoteAppClipItemsToParentApp(a3, a4);
}

- (id)_containerLinkManager
{
  return +[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", -[MIInstallationJournalEntry installationDomain](self, "installationDomain"));
}

- (id)_keychainAccessGroupTracker
{
  return +[MIKeychainAccessGroupTracker sharedTracker](MIKeychainAccessGroupTracker, "sharedTracker");
}

- (id)_freeProfileValidatedAppTracker
{
  return +[MIFreeProfileValidatedAppTracker sharedTracker](MIFreeProfileValidatedAppTracker, "sharedTracker");
}

- (id)_systemAppState
{
  return +[MISystemAppState sharedList](MISystemAppState, "sharedList");
}

- (id)_containerProtectionManager
{
  return +[MIContainerProtectionManager defaultManager](MIContainerProtectionManager, "defaultManager");
}

- (id)_helperServiceClient
{
  return +[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance");
}

- (id)_uninstalledAppList
{
  return +[MIUninstalledAppList sharedList](MIUninstalledAppList, "sharedList");
}

- (id)_journalInstance
{
  return +[MIJournal sharedInstance](MIJournal, "sharedInstance");
}

+ (id)_registerUsingDiscoveredInfoForAppIdentity:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  return +[MILaunchServicesOperationManager registerUsingDiscoveredInfoForAppIdentity:inDomain:error:](MILaunchServicesOperationManager, "registerUsingDiscoveredInfoForAppIdentity:inDomain:error:", a3, a4, a5);
}

- (id)_registerInstalledInfo:(id)a3 forIdentity:(id)a4 inDomain:(unint64_t)a5 error:(id *)a6
{
  return +[MILaunchServicesOperationManager registerInstalledInfo:forIdentity:inDomain:error:](MILaunchServicesOperationManager, "registerInstalledInfo:forIdentity:inDomain:error:", a3, a4, a5, a6);
}

+ (void)_attemptLSUpdateWithDiscoveredStateForIdentity:(id)a3 domain:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = MIStringForInstallationDomain(a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v11 = v6;
    v12 = v8;
    MOLogWrite(qword_10009E048, 5, "+[MIInstallationJournalEntry _attemptLSUpdateWithDiscoveredStateForIdentity:domain:]", CFSTR("Attempting recovery for app %@/%@"));
  }
  v13 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_registerUsingDiscoveredInfoForAppIdentity:inDomain:error:", v6, a4, &v13, v11, v12));
  v10 = v13;

  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100052924();
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "+[MIInstallationJournalEntry _attemptLSUpdateWithDiscoveredStateForIdentity:domain:]", CFSTR("Failed to recover install for %@/%@ : %@"));
  }

}

- (MIInstallationJournalEntry)initWithIdentity:(id)a3 bundleContainer:(id)a4 existingBundleContainer:(id)a5 installationDomain:(unint64_t)a6 operationType:(unint64_t)a7 installOptions:(id)a8 bundleSigningInfo:(id)a9
{
  id v15;
  id v16;
  id v17;
  MIInstallationJournalEntry *v18;
  MIAppIdentity *v19;
  MIAppIdentity *identity;
  NSUUID *v21;
  NSUUID *journalEntryID;
  id v24;
  id v25;
  objc_super v26;

  v15 = a3;
  v25 = a4;
  v24 = a5;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MIInstallationJournalEntry;
  v18 = -[MIInstallationJournalEntry init](&v26, "init");
  if (v18)
  {
    v19 = (MIAppIdentity *)objc_msgSend(v15, "copy");
    identity = v18->_identity;
    v18->_identity = v19;

    objc_storeStrong((id *)&v18->_bundleContainer, a4);
    objc_storeStrong((id *)&v18->_existingBundleContainer, a5);
    v18->_installationDomain = a6;
    v18->_operationType = a7;
    objc_storeStrong((id *)&v18->_installOptions, a8);
    objc_storeStrong((id *)&v18->_bundleSigningInfo, a9);
    v18->_journalPhase = 1;
    v18->_attemptCount = 0;
    v21 = objc_opt_new(NSUUID);
    journalEntryID = v18->_journalEntryID;
    v18->_journalEntryID = v21;

    if (_os_feature_enabled_impl("MobileInstallation", "install_journal"))
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        MOLogWrite(qword_10009E048, 5, "-[MIInstallationJournalEntry initWithIdentity:bundleContainer:existingBundleContainer:installationDomain:operationType:installOptions:bundleSigningInfo:]", CFSTR("Created install journal entry %@ for %@"));
    }
  }

  return v18;
}

- (BOOL)_populateSigningInfoWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, &v12));
  v8 = v12;
  if (v6)
  {
    objc_storeStrong((id *)&self->_bundleSigningInfo, v6);
  }
  else
  {
    v9 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _populateSigningInfoWithError:]", 228, MIInstallerErrorDomain, 4, v8, 0, CFSTR("Failed to get signing info for bundle %@"), v7, (uint64_t)v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    if (a3)
    {
      v8 = objc_retainAutorelease(v10);
      *a3 = v8;
    }
    else
    {
      v8 = v10;
    }
  }

  return v6 != 0;
}

- (BOOL)_findBundleContainerForToken:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  MIBundleContainer *v8;
  id v9;
  MIBundleContainer *bundleContainer;
  uint64_t v11;
  MIBundleContainer *v12;
  id v13;
  void *v14;
  id v16;

  v6 = a3;
  if (self->_journalPhase == 2)
    v7 = 2;
  else
    v7 = 3;
  v16 = 0;
  v8 = (MIBundleContainer *)objc_msgSend(objc_alloc((Class)MIBundleContainer), "initWithToken:options:error:", v6, v7, &v16);
  v9 = v16;
  bundleContainer = self->_bundleContainer;
  self->_bundleContainer = v8;

  v12 = self->_bundleContainer;
  if (!v12)
  {
    v13 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _findBundleContainerForToken:error:]", 257, MIInstallerErrorDomain, 186, v9, 0, CFSTR("Failed to locate bundle container for token %@"), v11, (uint64_t)v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (a4)
    {
      v9 = objc_retainAutorelease(v14);
      *a4 = v9;
    }
    else
    {
      v9 = v14;
    }
  }

  return v12 != 0;
}

- (MIInstallationJournalEntry)initWithCoder:(id)a3
{
  id v4;
  MIInstallationJournalEntry *v5;
  id v6;
  uint64_t v7;
  MIAppIdentity *identity;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  MIInstallationJournalEntry *v15;
  id v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  unint64_t installationDomain;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;
  uint64_t v31;
  MIInstallOptions *installOptions;
  id v33;
  uint64_t v34;
  NSUUID *journalEntryID;
  id v36;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  id v40;
  MIBundleContainer *v41;
  id v42;
  MIBundleContainer *existingBundleContainer;
  uint64_t v44;
  id v45;
  uint64_t v46;
  NSString *linkToParentBundleID;
  NSMutableArray *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *i;
  id v55;
  NSArray *v56;
  NSArray *noLongerPresentAppExtensionDataContainers;
  void *v58;
  id v59;
  void *v60;
  MIDataContainer *v61;
  id v62;
  MIDataContainer *dataContainer;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  NSArray *v77;
  NSArray *appExtensionDataContainers;
  void *v79;
  uint64_t v80;
  NSArray *appExtensionBundles;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  id obj;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  id v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  id v107;
  objc_super v108;
  _BYTE v109[128];
  _BYTE v110[128];

  v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)MIInstallationJournalEntry;
  v5 = -[MIInstallationJournalEntry init](&v108, "init");
  if (!v5)
  {
    v14 = 0;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MIAppIdentity), CFSTR("identity"));
  v7 = objc_claimAutoreleasedReturnValue(v6);
  identity = v5->_identity;
  v5->_identity = (MIAppIdentity *)v7;

  if (!v5->_identity)
  {
    v17 = (void *)MIInstallerErrorDomain;
    v18 = CFSTR("Decoded object was missing identity.");
    v19 = 278;
LABEL_12:
    v13 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", v19, v17, 186, 0, 0, v18, v9, v90);
    goto LABEL_13;
  }
  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("journalPhase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v5->_journalPhase = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");

  if (v5->_journalPhase - 8 <= 0xFFFFFFFFFFFFFFF8)
  {
    v13 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 285, MIInstallerErrorDomain, 186, 0, 0, CFSTR("Got invalid journal phase: %lu."), v12, v5->_journalPhase);
LABEL_13:
    v16 = (id)objc_claimAutoreleasedReturnValue(v13);
    v28 = 0;
    goto LABEL_14;
  }
  v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("attemptCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v5->_attemptCount = (unint64_t)objc_msgSend(v21, "unsignedIntegerValue");

  ++v5->_attemptCount;
  v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("installationDomain"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v5->_installationDomain = (unint64_t)objc_msgSend(v23, "unsignedIntegerValue");

  installationDomain = v5->_installationDomain;
  if ((MIIsValidInstallationDomain(installationDomain) & 1) == 0)
  {
    v17 = (void *)MIInstallerErrorDomain;
    v90 = installationDomain;
    v18 = CFSTR("Got invalid installation domain: %lu.");
    v19 = 295;
    goto LABEL_12;
  }
  v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("operationType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v5->_operationType = (unint64_t)objc_msgSend(v26, "unsignedIntegerValue");

  if (v5->_operationType - 6 <= 0xFFFFFFFFFFFFFFFALL)
  {
    v13 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 304, MIInstallerErrorDomain, 186, 0, 0, CFSTR("Got invalid journal operation type: %lu."), v27, v5->_operationType);
    goto LABEL_13;
  }
  v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MIInstallOptions), CFSTR("installOptions"));
  v31 = objc_claimAutoreleasedReturnValue(v30);
  installOptions = v5->_installOptions;
  v5->_installOptions = (MIInstallOptions *)v31;

  v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("journalEntryID"));
  v34 = objc_claimAutoreleasedReturnValue(v33);
  journalEntryID = v5->_journalEntryID;
  v5->_journalEntryID = (NSUUID *)v34;

  v36 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MIBundleContainerToken), CFSTR("BundleContainerToken"));
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (!v37)
  {
    v17 = (void *)MIInstallerErrorDomain;
    v18 = CFSTR("Serialized journal entry did not contain bundle container token.");
    v19 = 314;
    goto LABEL_12;
  }
  v38 = (void *)v37;
  v107 = 0;
  v39 = -[MIInstallationJournalEntry _findBundleContainerForToken:error:](v5, "_findBundleContainerForToken:error:", v37, &v107);
  v16 = v107;
  if (!v39)
  {
    v28 = v38;
    goto LABEL_14;
  }
  -[MIInstallationJournalEntry _populateSigningInfoWithError:](v5, "_populateSigningInfoWithError:", 0);
  v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MIBundleContainerToken), CFSTR("ExistingBundleContainerToken"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(v40);

  if (-[MIInstallationJournalEntry journalPhase](v5, "journalPhase") < 2)
  {
    if (v28)
      objc_storeStrong((id *)&v5->_existingBundleContainer, v5->_bundleContainer);
  }
  else if (v28)
  {
    v106 = v16;
    v41 = (MIBundleContainer *)objc_msgSend(objc_alloc((Class)MIBundleContainer), "initWithToken:options:error:", v28, 1, &v106);
    v42 = v106;

    existingBundleContainer = v5->_existingBundleContainer;
    v5->_existingBundleContainer = v41;

    if (!v5->_existingBundleContainer)
    {
      v86 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 330, MIInstallerErrorDomain, 186, v42, 0, CFSTR("Expected to find existing bundle container but lookup failed."), v44, v90);
      v16 = (id)objc_claimAutoreleasedReturnValue(v86);

      goto LABEL_14;
    }
    v16 = v42;
  }
  v45 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("linkToParentBundleID"));
  v46 = objc_claimAutoreleasedReturnValue(v45);
  linkToParentBundleID = v5->_linkToParentBundleID;
  v5->_linkToParentBundleID = (NSString *)v46;

  v48 = objc_opt_new(NSMutableArray);
  v93 = v4;
  v49 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(MIContainerToken), CFSTR("NoLongerPresentContainerTokens"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v53)
          objc_enumerationMutation(v50);
        v55 = objc_msgSend(objc_alloc((Class)MIPluginDataContainer), "initWithToken:options:error:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i), 0, 0);
        if (v55)
          -[NSMutableArray addObject:](v48, "addObject:", v55);

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    }
    while (v52);
  }
  if (-[NSMutableArray count](v48, "count"))
  {
    v56 = (NSArray *)-[NSMutableArray copy](v48, "copy");
    noLongerPresentAppExtensionDataContainers = v5->_noLongerPresentAppExtensionDataContainers;
    v5->_noLongerPresentAppExtensionDataContainers = v56;

  }
  v58 = v93;
  v59 = objc_msgSend(v93, "decodeObjectOfClass:forKey:", objc_opt_class(MIContainerToken), CFSTR("DataContainerToken"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
  if (!v60)
  {
    v91 = 0;
    goto LABEL_44;
  }
  v101 = v16;
  v61 = (MIDataContainer *)objc_msgSend(objc_alloc((Class)MIDataContainer), "initWithToken:options:error:", v60, 0, &v101);
  v62 = v101;

  dataContainer = v5->_dataContainer;
  v5->_dataContainer = v61;

  if (v5->_dataContainer)
  {
    v91 = v60;
    v16 = v62;
    v58 = v93;
LABEL_44:
    v92 = v28;
    v65 = objc_msgSend(v58, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(MIContainerToken), CFSTR("AppExtensionDataContainerTokens"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    -[NSMutableArray removeAllObjects](v48, "removeAllObjects");
    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v67 = v66;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v98;
      obj = v67;
      while (2)
      {
        v71 = 0;
        v72 = v16;
        do
        {
          if (*(_QWORD *)v98 != v70)
            objc_enumerationMutation(obj);
          v73 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v71);
          v74 = objc_alloc((Class)MIPluginDataContainer);
          v96 = v72;
          v75 = objc_msgSend(v74, "initWithToken:options:error:", v73, 0, &v96);
          v16 = v96;

          if (!v75)
          {
            v82 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 383, MIInstallerErrorDomain, 186, v16, 0, CFSTR("Expected to find app extension data container but lookup failed."), v76, v90);
            v83 = objc_claimAutoreleasedReturnValue(v82);
            v67 = obj;
            v84 = obj;
            goto LABEL_60;
          }
          -[NSMutableArray addObject:](v48, "addObject:", v75);

          v71 = (char *)v71 + 1;
          v72 = v16;
        }
        while (v69 != v71);
        v67 = obj;
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
        if (v69)
          continue;
        break;
      }
    }

    if (-[NSMutableArray count](v48, "count"))
    {
      v77 = (NSArray *)-[NSMutableArray copy](v48, "copy");
      appExtensionDataContainers = v5->_appExtensionDataContainers;
      v5->_appExtensionDataContainers = v77;

    }
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v5, "bundle"));
    v95 = v16;
    v80 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "appExtensionBundlesWithError:", &v95));
    v14 = v95;

    appExtensionBundles = v5->_appExtensionBundles;
    v5->_appExtensionBundles = (NSArray *)v80;

    if (!v5->_appExtensionBundles)
    {
      v87 = (void *)MIInstallerErrorDomain;
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v5, "bundle"));
      v89 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 395, v87, 186, v14, 0, CFSTR("Failed to locate app extension bundles in bundle %@."), v88, (uint64_t)v84);
      v83 = objc_claimAutoreleasedReturnValue(v89);
      v16 = v14;
LABEL_60:

      v16 = (id)v83;
      v28 = v92;
      v4 = v93;
      goto LABEL_14;
    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      MOLogWrite(qword_10009E048, 5, "-[MIInstallationJournalEntry initWithCoder:]", CFSTR("Deserialized install journal entry %@ for %@"));

    v4 = v93;
LABEL_6:
    v15 = v5;
    v16 = v14;
    goto LABEL_18;
  }
  v85 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry initWithCoder:]", 372, MIInstallerErrorDomain, 186, v62, 0, CFSTR("Expected to find data container but lookup failed."), v64, v90);
  v16 = (id)objc_claimAutoreleasedReturnValue(v85);

  v4 = v93;
LABEL_14:

  if (v5->_identity && MIIsValidInstallationDomain(v5->_installationDomain))
    objc_msgSend((id)objc_opt_class(v5), "_attemptLSUpdateWithDiscoveredStateForIdentity:domain:", v5->_identity, v5->_installationDomain);
  objc_msgSend(v4, "failWithError:", v16);
  v15 = 0;
LABEL_18:

  return v15;
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
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  NSArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  NSArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identity"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIInstallationJournalEntry journalPhase](self, "journalPhase")));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("journalPhase"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIInstallationJournalEntry attemptCount](self, "attemptCount")));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("attemptCount"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIInstallationJournalEntry installationDomain](self, "installationDomain")));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("installationDomain"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIInstallationJournalEntry operationType](self, "operationType")));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("operationType"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("installOptions"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry journalEntryID](self, "journalEntryID"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("journalEntryID"));

  v12 = objc_alloc((Class)MIBundleContainerToken);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  v14 = objc_msgSend(v12, "initWithContainer:", v13);

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("BundleContainerToken"));
  v15 = objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));
  v34 = (void *)v15;
  if (v15)
  {
    v16 = objc_msgSend(objc_alloc((Class)MIBundleContainerToken), "initWithContainer:", v15);

    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("ExistingBundleContainerToken"));
    v14 = v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry linkToParentBundleID](self, "linkToParentBundleID"));
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("linkToParentBundleID"));

  v18 = objc_opt_new(NSMutableArray);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v19 = self->_noLongerPresentAppExtensionDataContainers;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v40;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v19);
        v24 = objc_msgSend(objc_alloc((Class)MIContainerToken), "initWithContainer:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v23));
        -[NSMutableArray addObject:](v18, "addObject:", v24);

        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v21);
  }

  if (-[NSMutableArray count](v18, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("NoLongerPresentContainerTokens"));
  v25 = objc_alloc((Class)MIContainerToken);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  v27 = objc_msgSend(v25, "initWithContainer:", v26);

  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("DataContainerToken"));
  -[NSMutableArray removeAllObjects](v18, "removeAllObjects");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = self->_appExtensionDataContainers;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        v33 = objc_msgSend(objc_alloc((Class)MIContainerToken), "initWithContainer:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v32));
        -[NSMutableArray addObject:](v18, "addObject:", v33);

        v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v30);
  }

  if (-[NSMutableArray count](v18, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("AppExtensionDataContainerTokens"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  v7 = MIStringForInstallationDomain(-[MIInstallationJournalEntry installationDomain](self, "installationDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[MIInstallationJournalEntry operationType](self, "operationType");
  v10 = sub_10002DDD4(-[MIInstallationJournalEntry journalPhase](self, "journalPhase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@<%p> %@/%@ op:%lu phase:%@ version:%@>"), v5, self, v6, v8, v9, v11, v13));

  return (NSString *)v14;
}

- (NSString)uniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry journalEntryID](self, "journalEntryID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v4, v6));

  return (NSString *)v7;
}

- (BOOL)shouldPersist
{
  return (id)-[MIInstallationJournalEntry operationType](self, "operationType") == (id)5;
}

- (MIExecutableBundle)bundle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundle"));

  return (MIExecutableBundle *)v3;
}

- (BOOL)shouldModifyExistingContainers
{
  return (id)-[MIInstallationJournalEntry operationType](self, "operationType") != (id)3;
}

- (BOOL)isPlaceholderInstall
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
  v3 = (unint64_t)objc_msgSend(v2, "installTargetType");

  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_writeJournalEntryWithError:(id *)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _journalInstance](self, "_journalInstance"));
  LOBYTE(a3) = objc_msgSend(v5, "writeJournalEntry:withError:", self, a3);

  return (char)a3;
}

- (void)_purgeJournalEntry
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _journalInstance](self, "_journalInstance"));
  objc_msgSend(v3, "purgeJournalEntry:withError:", self, 0);

}

- (BOOL)_updateJournalPhaseTo:(unint64_t)a3 withError:(id *)a4
{
  BOOL v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v14;
  id v15;

  -[MIInstallationJournalEntry setJournalPhase:](self, "setJournalPhase:");
  v15 = 0;
  v7 = -[MIInstallationJournalEntry _writeJournalEntryWithError:](self, "_writeJournalEntryWithError:", &v15);
  v8 = v15;
  if (!v7)
  {
    v9 = (void *)MIInstallerErrorDomain;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
    v11 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:]", 531, v9, 188, v8, 0, CFSTR("Failed to write updated journal with phase %lu for %@"), v10, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (a4)
    {
      v8 = objc_retainAutorelease(v12);
      *a4 = v8;
    }
    else
    {
      v8 = v12;
    }
  }

  return v7;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  id v16;

  v6 = a3;
  if (!-[MIInstallationJournalEntry shouldModifyExistingContainers](self, "shouldModifyExistingContainers")
    || objc_msgSend(v6, "status") != (id)1)
  {
    v9 = 0;
LABEL_8:
    v13 = 1;
    goto LABEL_9;
  }
  v16 = 0;
  v7 = objc_msgSend(v6, "regenerateDirectoryUUIDWithError:", &v16);
  v8 = v16;
  v9 = v8;
  if (v7)
  {
    v10 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      MOLogWrite(v10, 5, "-[MIInstallationJournalEntry _refreshUUIDForContainer:withError:]", CFSTR("Data container for %@ is now at %@"));

    }
    goto LABEL_8;
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v8);
    v13 = 0;
    *a4 = v9;
  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (BOOL)_linkToParentApplication:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry linkToParentBundleID](self, "linkToParentBundleID"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _containerLinkManager](self, "_containerLinkManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v12 = 0;
    v9 = objc_msgSend(v6, "linkChild:toParent:error:", v8, v5, &v12);
    v10 = v12;

    if (a3 && (v9 & 1) == 0)
    {
      v10 = objc_retainAutorelease(v10);
      v9 = 0;
      *a3 = v10;
    }
  }
  else
  {
    v10 = 0;
    v9 = 1;
  }

  return v9;
}

- (BOOL)_updateReferencesWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  BOOL v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _keychainAccessGroupTracker](self, "_keychainAccessGroupTracker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _freeProfileValidatedAppTracker](self, "_freeProfileValidatedAppTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
    v34 = 0;
    v12 = objc_msgSend(v5, "updateReferencesWithOldBundle:newBundle:error:", v9, v11, &v34);
    v13 = v34;

    if ((v12 & 1) == 0)
    {
      v14 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        v30 = v13;
        MOLogWrite(v14, 3, "-[MIInstallationJournalEntry _updateReferencesWithError:]", CFSTR("Failed to update keychain references for %@; invalidating cache after error %@"));

      }
      objc_msgSend(v5, "invalidateCache");
      v13 = 0;
    }
LABEL_8:
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleSigningInfo](self, "bundleSigningInfo", v29, v30));
    v19 = objc_msgSend(v18, "profileValidationType");

    if (v19 == (id)3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleSigningInfo](self, "bundleSigningInfo"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "entitlements"));
      v22 = sub_100046A44(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
        v32 = v13;
        v25 = objc_msgSend(v6, "addReferenceForApplicationIdentifier:bundle:error:", v23, v24, &v32);
        v26 = v32;

        if (!v25)
        {
          v27 = 0;
LABEL_14:

          v13 = v26;
          if (!a3)
            goto LABEL_17;
          goto LABEL_15;
        }
        v13 = v26;
      }

    }
    v31 = v13;
    v27 = -[MIInstallationJournalEntry _linkToParentApplication:](self, "_linkToParentApplication:", &v31);
    v26 = v31;
    v23 = v13;
    goto LABEL_14;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  v33 = 0;
  v17 = objc_msgSend(v5, "addReferencesForBundle:error:", v16, &v33);
  v13 = v33;

  if (v17)
    goto LABEL_8;
  v27 = 0;
  if (!a3)
    goto LABEL_17;
LABEL_15:
  if (!v27)
    *a3 = objc_retainAutorelease(v13);
LABEL_17:

  return v27;
}

- (BOOL)_commitContainersWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned int v15;
  id v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  char *v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  id v25;
  unsigned int v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  void *v43;
  char *v44;
  void *v45;
  id *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  id v53;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  if (!v5 || objc_msgSend(v5, "status") == (id)3)
  {
    v46 = a3;
    v8 = 0;
LABEL_4:
    v45 = v5;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v57;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          v55 = v8;
          v15 = -[MIInstallationJournalEntry _refreshUUIDForContainer:withError:](self, "_refreshUUIDForContainer:withError:", v14, &v55);
          v16 = v55;

          if (!v15)
          {
            LOBYTE(v23) = 0;
            goto LABEL_27;
          }
          if (objc_msgSend(v14, "status") == (id)3)
          {
            v8 = v16;
          }
          else
          {
            v54 = v16;
            v17 = objc_msgSend(v14, "makeContainerLiveWithError:", &v54);
            v8 = v54;

            if (!v17)
            {
              LOBYTE(v23) = 0;
LABEL_26:
              v16 = v8;
              goto LABEL_27;
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
        if (v11)
          continue;
        break;
      }
    }

    if ((id)-[MIInstallationJournalEntry operationType](self, "operationType") == (id)4)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
      v19 = objc_msgSend(v18, "bundleType");

      v5 = v45;
      if (v19 == 1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
        v21 = (char *)objc_msgSend(v20, "lsInstallType");

        if ((unint64_t)(v21 - 7) >= 3)
        {
          if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
          {
            v22 = 3;
          }
          else
          {
            v44 = v21;
            v22 = 3;
            MOLogWrite(qword_10009E048, 3, "-[MIInstallationJournalEntry _commitContainersWithError:]", CFSTR("Unexpected LS Install Type for demoted placeholder: %lu. Using MISystemAppStateAutomaticallyDemoted"));
          }
        }
        else
        {
          v22 = ((_DWORD)v21 - 4);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer", v44));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundle"));
        v32 = objc_msgSend(v31, "bundleType");

        if (v32 == 1)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _systemAppState](self, "_systemAppState"));
          objc_msgSend(v33, "addIdentifier:withState:", v7, v22);

        }
      }
      v29 = 1;
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));

      if (v28)
        v29 = 2;
      else
        v29 = 3;
      v5 = v45;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry installOptions](self, "installOptions"));
    v35 = objc_msgSend(v34, "waitForDeletion");

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));
    v53 = v8;
    v23 = objc_msgSend(v36, "makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:", v37, v29, v35, &v53);
    v16 = v53;

    if (!v23)
    {
LABEL_29:
      a3 = v46;
      if (!v46)
        goto LABEL_32;
      goto LABEL_30;
    }
    if (!v5 || objc_msgSend(v5, "status") != (id)3)
    {
LABEL_49:
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
      v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v49;
        do
        {
          for (j = 0; j != v40; j = (char *)j + 1)
          {
            if (*(_QWORD *)v49 != v41)
              objc_enumerationMutation(v9);
            v43 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v43, "status") == (id)3)
            {
              objc_msgSend(v43, "setParentBundleID:", v7);
              v47 = v16;
              v23 = objc_msgSend(v43, "makeContainerLiveWithError:", &v47);
              v8 = v47;

              if (!v23)
                goto LABEL_26;
              v16 = v8;
            }
          }
          v40 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
          LOBYTE(v23) = 1;
        }
        while (v40);
LABEL_27:
        v5 = v45;
      }
      else
      {
        LOBYTE(v23) = 1;
      }

      goto LABEL_29;
    }
    v52 = v16;
    v38 = objc_msgSend(v5, "makeContainerLiveWithError:", &v52);
    v8 = v52;

    if (v38)
    {
      v16 = v8;
      goto LABEL_49;
    }
LABEL_60:
    LOBYTE(v23) = 0;
    v16 = v8;
    goto LABEL_29;
  }
  v61 = 0;
  v24 = -[MIInstallationJournalEntry _refreshUUIDForContainer:withError:](self, "_refreshUUIDForContainer:withError:", v5, &v61);
  v25 = v61;
  v16 = v25;
  if (v24)
  {
    v46 = a3;
    v60 = v25;
    v26 = objc_msgSend(v5, "makeContainerLiveWithError:", &v60);
    v8 = v60;

    if (!v26)
      goto LABEL_60;
    goto LABEL_4;
  }
  LOBYTE(v23) = 0;
  if (!a3)
    goto LABEL_32;
LABEL_30:
  if ((v23 & 1) == 0)
    *a3 = objc_retainAutorelease(v16);
LABEL_32:

  return v23;
}

- (void)_updateContainerStatePostCommit
{
  MIInstallationJournalEntry *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  char *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  id v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  MIInstallationJournalEntry *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned __int8 v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  MIInstallationJournalEntry *v69;
  uint64_t v70;
  id obj;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  void *v79;
  _BYTE v80[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry noLongerPresentAppExtensionDataContainers](self, "noLongerPresentAppExtensionDataContainers"));
  if (!objc_msgSend(v3, "count"))
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v78 = 0;
  v4 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v3, 0, &v78);
  v5 = v78;
  if ((v4 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v62 = v3;
      v64 = v5;
      MOLogWrite(qword_10009E048, 3, "-[MIInstallationJournalEntry _updateContainerStatePostCommit]", CFSTR("Failed to remove unused app extension data containers %@ : %@"));
    }

    goto LABEL_7;
  }
LABEL_8:
  if (-[MIInstallationJournalEntry shouldModifyExistingContainers](v2, "shouldModifyExistingContainers", v62, v64)
    && !-[MIInstallationJournalEntry isPlaceholderInstall](v2, "isPlaceholderInstall"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _containerProtectionManager](v2, "_containerProtectionManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](v2, "dataContainer"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](v2, "dataContainer"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v2, "bundle"));
      objc_msgSend(v6, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:", v8, v9, 1);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](v2, "appExtensionBundles"));
    v11 = (char *)objc_msgSend(v10, "count");

    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](v2, "appExtensionDataContainers"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", i));

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](v2, "appExtensionBundles"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", i));

        objc_msgSend(v6, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:", v14, v16, 1);
      }
    }

  }
  v69 = v2;
  if (!-[MIInstallationJournalEntry isPlaceholderInstall](v2, "isPlaceholderInstall"))
  {
    v67 = v5;
    v68 = v3;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleSigningInfo](v2, "bundleSigningInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "entitlements"));
    v19 = sub_100046D80(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleSigningInfo](v2, "bundleSigningInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "entitlements"));
    v23 = sub_100046A44(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v20;
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    if (!v25)
      goto LABEL_37;
    v26 = v25;
    v27 = *(_QWORD *)v75;
    v70 = MIContainerManagerErrorDomain;
    while (1)
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v75 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
        v73 = 0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v29, 0, 0, &v73, v63, v65, v66));
        v31 = v73;
        v32 = v31;
        if (v30)
        {
LABEL_23:
          v33 = (id)-[MIInstallationJournalEntry _promoteKeychainItemsForAppClipWithAppIdentifier:toParentAppWithAppIdentifier:](v2, "_promoteKeychainItemsForAppClipWithAppIdentifier:toParentAppWithAppIdentifier:", v29, v24);
          if ((_DWORD)v33 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
          {
            v65 = v24;
            v66 = v33;
            v63 = v29;
            v34 = qword_10009E048;
            v35 = CFSTR("Failed to transfer keychain items from %@ to %@ : %d");
LABEL_34:
            MOLogWrite(v34, 3, "-[MIInstallationJournalEntry _updateContainerStatePostCommit]", v35);
            goto LABEL_35;
          }
          goto LABEL_35;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
        if ((objc_msgSend(v36, "isEqualToString:", v70) & 1) != 0)
        {
          v37 = objc_msgSend(v32, "code");

          v38 = v37 == (id)21;
          v2 = v69;
          if (v38)
            goto LABEL_23;
        }
        else
        {

        }
        v34 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v63 = v29;
          v65 = v32;
          v35 = CFSTR("Failed to query App Clip container for %@ : %@");
          goto LABEL_34;
        }
LABEL_35:

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
      if (!v26)
      {
LABEL_37:

        v5 = v67;
        v3 = v68;
        break;
      }
    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _uninstalledAppList](v2, "_uninstalledAppList", v63));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v2, "bundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
  v79 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v79, 1));
  objc_msgSend(v39, "removeIdentifiers:", v42);

  v43 = v69;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v69, "bundle"));
  if (objc_msgSend(v44, "bundleType") == 1)
  {
    v45 = -[MIInstallationJournalEntry operationType](v69, "operationType");

    if (v45 == (id)4)
      goto LABEL_42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _systemAppState](v69, "_systemAppState"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v69, "bundle"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));
    objc_msgSend(v44, "addIdentifier:withState:", v47, 1);

    v43 = v69;
  }

LABEL_42:
  v48 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v43, "bundle"));
  if ((objc_msgSend(v48, "isPlaceholder") & 1) != 0)
  {
LABEL_43:

    goto LABEL_50;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](v43, "bundleContainer"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "compatibilityLinkDestination"));

  if (v50)
  {
    v51 = objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](v43, "dataContainer"));
    if (v51)
    {
      v48 = (id)v51;
      v52 = objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](v43, "bundleContainer"));
      if (v52)
      {
        v53 = (void *)v52;
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v43, "bundle"));
        v55 = objc_msgSend(v54, "bundleType");

        if (v55 != 4)
          goto LABEL_50;
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _helperServiceClient](v43, "_helperServiceClient"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](v43, "bundle"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifier"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](v43, "identity"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "personaUniqueString"));
        v72 = v5;
        v61 = objc_msgSend(v56, "makeSymlinkFromAppDataContainerToBundleForIdentifier:forPersona:withError:", v58, v60, &v72);
        v48 = v72;

        if ((v61 & 1) != 0)
        {
          v5 = v48;
          goto LABEL_50;
        }
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          MOLogWrite(qword_10009E048, 3, "-[MIInstallationJournalEntry _updateContainerStatePostCommit]", CFSTR("Error from helper service creating symlink: %@"));
        v5 = 0;
      }
      goto LABEL_43;
    }
  }
LABEL_50:

}

- (BOOL)_gatherLaunchServicesRegistrationInfoWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  char *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  id v28;
  NSArray *v29;
  NSArray *bundleRecordsToRegister;
  void *v32;
  id *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  id v37;
  id v38;

  v36 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundle](self, "bundle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  v7 = objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry progressBlock](self, "progressBlock"));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, const __CFString *, uint64_t))(v7 + 16))(v7, CFSTR("GeneratingApplicationMap"), 90);
  v9 = objc_alloc((Class)MIInstalledInfoGatherer);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  v11 = objc_msgSend(v9, "initWithBundleContainer:dataContainer:", v5, v10);

  v38 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleRecordWithError:", &v38));
  v13 = v38;
  if (!v12)
  {
    v26 = 0;
    if (a3)
    {
LABEL_17:
      v13 = objc_retainAutorelease(v13);
      v27 = 0;
      *a3 = v13;
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  v33 = a3;
  -[NSMutableArray addObject:](v36, "addObject:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](self, "appExtensionBundles"));
  v15 = (char *)objc_msgSend(v14, "count");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
  v17 = (char *)objc_msgSend(v16, "count");

  v34 = v8;
  if (v15 != v17)
  {
    v28 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _gatherLaunchServicesRegistrationInfoWithError:]", 900, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Have %ld app extensions and %ld app extension data containers; they should be equal."),
            v18,
            (uint64_t)v15);
    v23 = v13;
    v13 = (id)objc_claimAutoreleasedReturnValue(v28);
    goto LABEL_16;
  }
  v32 = v5;
  if (v15)
  {
    v19 = 0;
    while (1)
    {
      v20 = v11;
      v21 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionBundles](self, "appExtensionBundles"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v19));

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v19));

      v11 = objc_msgSend(objc_alloc((Class)MIInstalledInfoGatherer), "initWithAppExtensionBundle:inBundleIdentifier:dataContainer:", v23, v35, v25);
      v37 = v21;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleRecordWithError:", &v37));
      v13 = v37;

      if (!v26)
        break;
      -[NSMutableArray addObject:](v36, "addObject:", v26);

      ++v19;
      v12 = v26;
      if (v15 == v19)
        goto LABEL_14;
    }

    v12 = 0;
    v5 = v32;
LABEL_16:

    v26 = v12;
    a3 = v33;
    v8 = v34;
    if (v33)
      goto LABEL_17;
LABEL_11:
    v27 = 0;
    goto LABEL_18;
  }
  v26 = v12;
LABEL_14:
  v29 = (NSArray *)-[NSMutableArray copy](v36, "copy");
  bundleRecordsToRegister = self->_bundleRecordsToRegister;
  self->_bundleRecordsToRegister = v29;

  v27 = 1;
  v5 = v32;
  v8 = v34;
LABEL_18:

  return v27;
}

- (BOOL)_beginLaunchServicesRegistrationWithError:(id *)a3
{
  unint64_t v5;
  void *v6;
  void *v7;

  v5 = -[MIInstallationJournalEntry installationDomain](self, "installationDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _registerInstalledInfo:forIdentity:inDomain:error:](self, "_registerInstalledInfo:forIdentity:inDomain:error:", self->_bundleRecordsToRegister, v6, v5, a3));
  if (v7)
    objc_storeStrong((id *)&self->_recordPromise, v7);

  return v7 != 0;
}

- (BOOL)_performJournaledInstallAsReplay:(BOOL)a3 withError:(id *)a4
{
  _BOOL4 v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _BOOL4 v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  unint64_t v21;
  id v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;

  v5 = a3;
  v7 = -[MIInstallationJournalEntry attemptCount](self, "attemptCount");
  if (v7 < 6)
  {
    v21 = -[MIInstallationJournalEntry journalPhase](self, "journalPhase");
    v14 = 0;
    v22 = 0;
    v15 = 0;
    switch(v21)
    {
      case 1uLL:
        v50 = 0;
        v23 = -[MIInstallationJournalEntry _updateJournalPhaseTo:withError:](self, "_updateJournalPhaseTo:withError:", 2, &v50);
        v14 = v50;
        if (!v23)
          goto LABEL_9;
        goto LABEL_22;
      case 2uLL:
LABEL_22:
        v24 = v14;
        v49 = v14;
        v25 = -[MIInstallationJournalEntry _updateReferencesWithError:](self, "_updateReferencesWithError:", &v49);
        v14 = v49;

        if (!v25)
          goto LABEL_9;
        v48 = v14;
        v16 = -[MIInstallationJournalEntry _commitContainersWithError:](self, "_commitContainersWithError:", &v48);
        v22 = v48;

        if (!v16)
        {
          v15 = 1;
          v14 = v22;
          goto LABEL_11;
        }
        if (!-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:](self, "_updateJournalPhaseTo:withError:", 3, 0))
        {
          v26 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
            MOLogWrite(v26, 3, "-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", CFSTR("Ignoring failure to update journal for %@"));

          }
        }
        v15 = 1;
LABEL_29:
        -[MIInstallationJournalEntry _updateContainerStatePostCommit](self, "_updateContainerStatePostCommit", v42);
        if (!-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:](self, "_updateJournalPhaseTo:withError:", 4, 0))
        {
          v27 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
            MOLogWrite(v27, 3, "-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", CFSTR("Ignoring failure to update journal for %@"));

          }
        }
        v47 = v22;
        v16 = -[MIInstallationJournalEntry _gatherLaunchServicesRegistrationInfoWithError:](self, "_gatherLaunchServicesRegistrationInfoWithError:", &v47, v43);
        v14 = v47;

        if (!v16 || !v5)
          goto LABEL_11;
LABEL_35:
        if (!v5
          && !-[MIInstallationJournalEntry _updateJournalPhaseTo:withError:](self, "_updateJournalPhaseTo:withError:", 5, 0))
        {
          v28 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
            MOLogWrite(v28, 3, "-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", CFSTR("Ignoring failure to update journal for %@"));

          }
        }
LABEL_40:
        v29 = v14;
        v46 = v14;
        v30 = -[MIInstallationJournalEntry _beginLaunchServicesRegistrationWithError:](self, "_beginLaunchServicesRegistrationWithError:", &v46, v42);
        v14 = v46;

        v15 = v15;
        if (v30)
        {
          -[MIInstallationJournalEntry setJournalPhase:](self, "setJournalPhase:", 6);
          -[MIInstallationJournalEntry _purgeJournalEntry](self, "_purgeJournalEntry");
          goto LABEL_19;
        }
        break;
      case 3uLL:
        goto LABEL_29;
      case 4uLL:
        goto LABEL_35;
      case 5uLL:
        goto LABEL_40;
      case 6uLL:
        v37 = (void *)MIInstallerErrorDomain;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
        v40 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", 1060, v37, 4, 0, 0, CFSTR("Called again after install journal entry was already complete for %@"), v39, (uint64_t)v38);
        v14 = (id)objc_claimAutoreleasedReturnValue(v40);

        goto LABEL_9;
      case 7uLL:
        v41 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
          MOLogWrite(v41, 3, "-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", CFSTR("Skipping staged background update for %@"));

        }
        v14 = 0;
        goto LABEL_19;
      default:
        v34 = v21;
        v35 = (void *)MIInstallerErrorDomain;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
        v13 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", 1070, v35, 4, 0, 0, CFSTR("Unknown journal phase %lu when finalizing %@"), v36, v34);
        goto LABEL_8;
    }
  }
  else
  {
    v8 = v7;
    -[MIInstallationJournalEntry _purgeJournalEntry](self, "_purgeJournalEntry");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000529B8(self, v8);
    v9 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
      v45 = v8;
      MOLogWrite(v9, 3, "-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", CFSTR("Failed to replay journal entry for %@ after %lu attempts"));

    }
    v10 = (void *)MIInstallerErrorDomain;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity", v42, v45));
    v13 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:]", 972, v10, 4, 0, 0, CFSTR("Tried %lu times to replay journal entry for %@; assuming something is wrong; failing."),
            v12,
            v8);
LABEL_8:
    v14 = (id)objc_claimAutoreleasedReturnValue(v13);

LABEL_9:
    v15 = 0;
  }
  v16 = 0;
LABEL_11:
  if (a4 && (v16 & 1) == 0)
    *a4 = objc_retainAutorelease(v14);
  if ((v15 || v5) && ((v16 ^ 1) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry existingBundleContainer](self, "existingBundleContainer"));

    if (v17)
    {
      v18 = (void *)objc_opt_class(self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry identity](self, "identity"));
      objc_msgSend(v18, "_attemptLSUpdateWithDiscoveredStateForIdentity:domain:", v19, -[MIInstallationJournalEntry installationDomain](self, "installationDomain"));

    }
  }
  if ((v16 & 1) != 0)
  {
LABEL_19:
    v20 = 1;
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _keychainAccessGroupTracker](self, "_keychainAccessGroupTracker"));
    objc_msgSend(v31, "invalidateCache");

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry _freeProfileValidatedAppTracker](self, "_freeProfileValidatedAppTracker"));
    objc_msgSend(v32, "invalidateCache");

    -[MIInstallationJournalEntry _purgeJournalEntry](self, "_purgeJournalEntry");
    v20 = 0;
  }

  return v20;
}

- (BOOL)finalizeContainersWithError:(id *)a3
{
  unint64_t v5;
  BOOL v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;

  v5 = -[MIInstallationJournalEntry journalPhase](self, "journalPhase");
  if (v5 == 1)
  {
    v14 = 0;
    v6 = -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:](self, "_performJournaledInstallAsReplay:withError:", 0, &v14);
    v7 = v14;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = (void *)MIInstallerErrorDomain;
    v9 = sub_10002DDD4(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry finalizeContainersWithError:]", 1108, v8, 4, 0, 0, CFSTR("Finalize called on journal entry in unexpected state; found journal phase %@, should have been %@"),
            v11,
            (uint64_t)v10);
    v7 = (id)objc_claimAutoreleasedReturnValue(v12);

    v6 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v6)
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

  return v6;
}

- (BOOL)performLaunchServicesRegistrationWithError:(id *)a3
{
  unint64_t v5;
  BOOL v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;

  v5 = -[MIInstallationJournalEntry journalPhase](self, "journalPhase");
  if (v5 == 4)
  {
    v14 = 0;
    v6 = -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:](self, "_performJournaledInstallAsReplay:withError:", 0, &v14);
    v7 = v14;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = (void *)MIInstallerErrorDomain;
    v9 = sub_10002DDD4(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v12 = sub_100010E50((uint64_t)"-[MIInstallationJournalEntry performLaunchServicesRegistrationWithError:]", 1132, v8, 4, 0, 0, CFSTR("Asked to register journal entry with LaunchServices in unexpected state; found journal phase %@, should have been %@"),
            v11,
            (uint64_t)v10);
    v7 = (id)objc_claimAutoreleasedReturnValue(v12);

    v6 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v6)
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

  return v6;
}

- (BOOL)finalizeWithError:(id *)a3
{
  if ((id)-[MIInstallationJournalEntry journalPhase](self, "journalPhase") != (id)7)
    return -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:](self, "_performJournaledInstallAsReplay:withError:", 1, a3);
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIInstallationJournalEntry finalizeWithError:]", CFSTR("Skipping staged journal entry: %@"));
  return 1;
}

- (BOOL)stageUpdateForLater:(id *)a3
{
  unsigned int v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v11;
  id v12;

  v12 = 0;
  v5 = -[MIInstallationJournalEntry _updateJournalPhaseTo:withError:](self, "_updateJournalPhaseTo:withError:", 7, &v12);
  v6 = v12;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
    v11 = v6;
    v8 = objc_msgSend(v7, "markContainerAsStagedUpdateContainer:", &v11);
    v9 = v11;

    v6 = v9;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if ((v8 & 1) == 0)
    *a3 = objc_retainAutorelease(v6);
LABEL_7:

  return v8;
}

- (BOOL)makeStagedBackgroundUpdateLive:(id *)a3
{
  unsigned int v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v11;
  id v12;

  v12 = 0;
  v5 = -[MIInstallationJournalEntry _updateJournalPhaseTo:withError:](self, "_updateJournalPhaseTo:withError:", 2, &v12);
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    v11 = v6;
    v8 = -[MIInstallationJournalEntry _performJournaledInstallAsReplay:withError:](self, "_performJournaledInstallAsReplay:withError:", 0, &v11);
    v9 = v11;

    v7 = v9;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v8)
    *a3 = objc_retainAutorelease(v7);
LABEL_7:

  return v8;
}

- (BOOL)cleanUpJournaledDataOnDiskWithError:(id *)a3
{
  void *v5;
  NSMutableArray *v6;
  unsigned __int8 v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  unsigned __int8 v20;
  id v21;
  BOOL v22;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  char v33;
  _BYTE v34[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry bundleContainer](self, "bundleContainer"));
  v6 = objc_opt_new(NSMutableArray);
  v33 = 0;
  v32 = 0;
  v7 = objc_msgSend(v5, "isStagedUpdateContainer:withError:", &v33, &v32);
  v8 = v32;
  if ((v7 & 1) == 0)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v24 = v5;
      v25 = v8;
      MOLogWrite(qword_10009E048, 3, "-[MIInstallationJournalEntry cleanUpJournaledDataOnDiskWithError:]", CFSTR("Failed to query staged container status %@ : %@"));
    }
    v33 = 1;
LABEL_8:
    v31 = v8;
    v9 = objc_msgSend(v5, "clearStagedUpdateContainerStatusWithError:", &v31, v24, v25);
    v10 = v31;

    v8 = v10;
    if (!v9)
      goto LABEL_27;
    goto LABEL_9;
  }
  if (v33)
    goto LABEL_8;
LABEL_9:
  if (objc_msgSend(v5, "isTransient"))
    -[NSMutableArray addObject:](v6, "addObject:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
  v12 = objc_msgSend(v11, "isTransient");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry dataContainer](self, "dataContainer"));
    -[NSMutableArray addObject:](v6, "addObject:", v13);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallationJournalEntry appExtensionDataContainers](self, "appExtensionDataContainers"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "isTransient"))
          -[NSMutableArray addObject:](v6, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v16);
  }

  if (!-[NSMutableArray count](v6, "count"))
  {
    v22 = 1;
    goto LABEL_30;
  }
  v26 = v8;
  v20 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v6, 0, &v26);
  v21 = v26;

  if ((v20 & 1) != 0)
  {
    v22 = 1;
    v8 = v21;
    goto LABEL_30;
  }
  v8 = v21;
LABEL_27:
  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v22 = 0;
    *a3 = v8;
  }
  else
  {
    v22 = 0;
  }
LABEL_30:

  return v22;
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (MIInstallOptions)installOptions
{
  return self->_installOptions;
}

- (MICodeSigningInfo)bundleSigningInfo
{
  return self->_bundleSigningInfo;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)linkToParentBundleID
{
  return self->_linkToParentBundleID;
}

- (void)setLinkToParentBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)noLongerPresentAppExtensionDataContainers
{
  return self->_noLongerPresentAppExtensionDataContainers;
}

- (void)setNoLongerPresentAppExtensionDataContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainer, a3);
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)bundleRecordsToRegister
{
  return self->_bundleRecordsToRegister;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (NSUUID)journalEntryID
{
  return self->_journalEntryID;
}

- (unint64_t)journalPhase
{
  return self->_journalPhase;
}

- (void)setJournalPhase:(unint64_t)a3
{
  self->_journalPhase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_journalEntryID, 0);
  objc_storeStrong((id *)&self->_recordPromise, 0);
  objc_storeStrong((id *)&self->_bundleRecordsToRegister, 0);
  objc_storeStrong((id *)&self->_appExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_appExtensionBundles, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_noLongerPresentAppExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_linkToParentBundleID, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_bundleSigningInfo, 0);
  objc_storeStrong((id *)&self->_installOptions, 0);
  objc_storeStrong((id *)&self->_existingBundleContainer, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
