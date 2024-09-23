@implementation MIReverter

+ (id)reverterForAppIdentity:(id)a3 withOptions:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initForAppIdentity:options:forClient:", v10, v9, v8);

  return v11;
}

- (id)initForAppIdentity:(id)a3 options:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  MIReverter *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MIReverter;
  v12 = -[MIReverter init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_client, v11);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a3);
  }

  return p_isa;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  sub_10000BD6C(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](self, "dataContainer"));
  sub_10000BD6C(v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](self, "appExtensionDataContainers"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        sub_10000BD6C(*(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if (-[MIReverter isLocked](self, "isLocked"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
    sub_10004E89C();

  }
  v12.receiver = self;
  v12.super_class = (Class)MIReverter;
  -[MIReverter dealloc](&v12, "dealloc");
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MIReverter client](self, "client"));
  objc_msgSend(v7, "sendProgressWithStatus:percentComplete:", v6, v4);

}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MIReverter client](self, "client"));
  objc_msgSend(v5, "sendProgressWithStatus:", v4);

}

- (BOOL)_performPreflightWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v20;
  id v21;
  id v22;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));

  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("PreflightingApplication"), 30);
  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v6, 0, 0, &v22));
  v9 = v22;
  if (!v7)
  {
    v17 = sub_100010E50((uint64_t)"-[MIReverter _performPreflightWithError:]", 138, MIInstallerErrorDomain, 26, v9, 0, CFSTR("Could not locate an existing installed app with bundle ID %@ to revert"), v8, (uint64_t)v6);
    v15 = (id)objc_claimAutoreleasedReturnValue(v17);
LABEL_7:

    v10 = 0;
    goto LABEL_8;
  }
  -[MIReverter setExistingBundleContainer:](self, "setExistingBundleContainer:", v7);
  v21 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stashedBundleContainerWithError:", &v21));
  v11 = v21;

  if (!v10)
  {
    v18 = sub_100010E50((uint64_t)"-[MIReverter _performPreflightWithError:]", 145, MIInstallerErrorDomain, 167, v11, 0, CFSTR("Installed app with bundle ID %@ did not have a stashed version"), v12, (uint64_t)v6);
    v15 = (id)objc_claimAutoreleasedReturnValue(v18);
    v9 = v11;
    goto LABEL_7;
  }
  -[MIReverter setStashedContainer:](self, "setStashedContainer:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundle"));
  v20 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appExtensionBundlesWithError:", &v20));
  v15 = v20;

  if (v14)
  {
    -[MIReverter setAppExtensionBundles:](self, "setAppExtensionBundles:", v14);

    v16 = 1;
    goto LABEL_11;
  }
LABEL_8:
  if (a3)
  {
    v15 = objc_retainAutorelease(v15);
    v16 = 0;
    *a3 = v15;
  }
  else
  {
    v16 = 0;
  }
LABEL_11:

  return v16;
}

- (id)_validateBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v20;
  id v21;

  v6 = a3;
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 1, 0, 0, &v21));
  v8 = v21;
  v9 = v8;
  if (!v7)
  {
    v13 = v8;
    goto LABEL_6;
  }
  if (objc_msgSend(v6, "codeSignatureVerificationState") != (id)2)
  {
    v15 = (void *)MIInstallerErrorDomain;
    v16 = objc_msgSend(v6, "codeSignatureVerificationState");
    v18 = sub_100010E50((uint64_t)"-[MIReverter _validateBundle:error:]", 181, v15, 4, 0, 0, CFSTR("Unexpectedly failed to validate code signing (status %lu) for %@"), v17, (uint64_t)v16);
    v13 = (id)objc_claimAutoreleasedReturnValue(v18);

    if (a4)
      goto LABEL_7;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));
  v20 = v9;
  v12 = objc_msgSend(v6, "hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:forPersona:error:", v7, v11, &v20);
  v13 = v20;

  if (!v12)
  {
LABEL_6:
    if (a4)
    {
LABEL_7:
      v13 = objc_retainAutorelease(v13);
      v14 = 0;
      *a4 = v13;
      goto LABEL_10;
    }
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v14 = v7;
LABEL_10:

  return v14;
}

- (BOOL)_performVerificationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];

  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("VerifyingApplication"), 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter stashedContainer](self, "stashedContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundle"));
  v24 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter _validateBundle:error:](self, "_validateBundle:error:", v6, &v24));
  v8 = v24;

  if (!v7)
  {
    v17 = 0;
    if (!a3)
      goto LABEL_17;
    goto LABEL_15;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
        v19 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter _validateBundle:error:](self, "_validateBundle:error:", v15, &v19));
        v8 = v19;

        if (!v16)
        {
          v17 = 0;
          goto LABEL_12;
        }
        v13 = (char *)v13 + 1;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_12:

  if (a3)
  {
LABEL_15:
    if (!v17)
      *a3 = objc_retainAutorelease(v8);
  }
LABEL_17:

  return v17;
}

- (BOOL)_validateAndEstablishLinkToParentContainer:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v15;
  id v16;
  id v17;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleMetadataWithError:", &v17));
  v7 = v17;

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](self, "existingBundleContainer"));
    v16 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleMetadataWithError:", &v16));
    v10 = v16;

    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "linkedChildBundleIDs"));
      objc_msgSend(v6, "setLinkedChildBundleIDs:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
      v15 = v10;
      v13 = objc_msgSend(v12, "saveBundleMetadata:withError:", v6, &v15);
      v7 = v15;

      if (!a3)
        goto LABEL_16;
      goto LABEL_14;
    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIReverter _validateAndEstablishLinkToParentContainer:]", CFSTR("Could not read bundle metadata from existing container: %@"));
    v13 = 0;
    v7 = v10;
    if (a3)
    {
LABEL_14:
      if ((v13 & 1) == 0)
        *a3 = objc_retainAutorelease(v7);
    }
  }
  else
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIReverter _validateAndEstablishLinkToParentContainer:]", CFSTR("Could not read bundle metadata from to be restored container: %@"));
    v13 = 0;
    if (a3)
      goto LABEL_14;
  }
LABEL_16:

  return v13;
}

- (BOOL)_performInstallationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("CreatingContainer"), 50);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v19 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer tempAppBundleContainerWithIdentifier:error:](MIBundleContainer, "tempAppBundleContainerWithIdentifier:error:", v6, &v19));
  v8 = v19;

  if (v7)
  {
    -[MIReverter setBundleContainer:](self, "setBundleContainer:", v7);
    -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("InstallingApplication"), 60);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter stashedContainer](self, "stashedContainer"));
    v18 = v8;
    v11 = objc_msgSend(v7, "cloneContentFromStashedBundleContainer:error:", v10, &v18);
    v12 = v18;

    if (!v11)
    {
      v13 = 0;
      if (!a3)
        goto LABEL_10;
      goto LABEL_8;
    }
    v17 = v12;
    v13 = -[MIReverter _validateAndEstablishLinkToParentContainer:](self, "_validateAndEstablishLinkToParentContainer:", &v17);
    v8 = v12;
    v12 = v17;
  }
  else
  {
    v14 = sub_100010E50((uint64_t)"-[MIReverter _performInstallationWithError:]", 279, MIInstallerErrorDomain, 21, v8, &off_10008F320, CFSTR("Failed to create container"), v9, v16);
    v12 = (id)objc_claimAutoreleasedReturnValue(v14);
    v13 = 0;
  }

  if (!a3)
    goto LABEL_10;
LABEL_8:
  if (!v13)
    *a3 = objc_retainAutorelease(v12);
LABEL_10:

  return v13;
}

- (BOOL)_postFlightAppExtensionsWithError:(id *)a3
{
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v29;
  id v30;
  id *v31;
  id obj;
  uint64_t v33;
  MIReverter *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v5 = objc_opt_new(NSMutableArray);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v6)
  {
    v7 = v6;
    v31 = a3;
    v8 = 0;
    v33 = *(_QWORD *)v38;
LABEL_3:
    v9 = 0;
    v10 = v8;
    while (1)
    {
      if (*(_QWORD *)v38 != v33)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v9);
      v36 = 0;
      v12 = objc_msgSend(v11, "updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:", 1, &v36);
      v13 = v36;
      if ((v12 & 1) == 0)
        break;
      v14 = v5;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](v34, "identity"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "personaUniqueString"));
      v35 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v16, 0, 0, &v35));
      v8 = v35;

      if (!v17)
      {
        v25 = (void *)MIInstallerErrorDomain;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        v27 = sub_100010E50((uint64_t)"-[MIReverter _postFlightAppExtensionsWithError:]", 332, v25, 21, v8, &off_10008F348, CFSTR("Failed to create app extension data container for  %@"), v26, (uint64_t)v22);
        v19 = (id)objc_claimAutoreleasedReturnValue(v27);
        v10 = v8;
        v5 = v14;
LABEL_18:

        if (v31)
        {
          v19 = objc_retainAutorelease(v19);
          v18 = 0;
          *v31 = v19;
        }
        else
        {
          v18 = 0;
        }
        goto LABEL_21;
      }
      v5 = v14;
      -[NSMutableArray addObject:](v14, "addObject:", v17);

      v9 = (char *)v9 + 1;
      v10 = v8;
      if (v7 == v9)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v20 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v30 = v13;
      MOLogWrite(v20, 3, "-[MIReverter _postFlightAppExtensionsWithError:]", CFSTR("Failed to update container manager with code signing info for %@ : %@"));

    }
    v21 = (void *)MIInstallerErrorDomain;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier", v29, v30));
    objc_msgSend(v11, "isPlaceholder");
    v24 = sub_100010E50((uint64_t)"-[MIReverter _postFlightAppExtensionsWithError:]", 325, v21, 110, v13, 0, CFSTR("Failed to set app extension code signing info with container manager for %@, isPlaceholder: %c"), v23, (uint64_t)v22);
    v19 = (id)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_18;
  }
  v8 = 0;
LABEL_12:

  -[MIReverter setAppExtensionDataContainers:](v34, "setAppExtensionDataContainers:", v5);
  v18 = 1;
  v19 = v8;
LABEL_21:

  return v18;
}

- (BOOL)_postFlightInstallationWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  id v15;
  id v17;
  id v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("PostflightingApplication"), 70);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));

  if (objc_msgSend(v8, "needsDataContainer"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaUniqueString"));
    v18 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v9, 0, 0, &v18));
    v11 = v18;

    if (!v10)
    {
      v15 = sub_100010E50((uint64_t)"-[MIReverter _postFlightInstallationWithError:]", 371, MIInstallerErrorDomain, 4, v11, 0, CFSTR("Failed to locate data container for stashed app %@"), v12, (uint64_t)v6);
      v14 = (id)objc_claimAutoreleasedReturnValue(v15);
      v13 = 0;
      goto LABEL_7;
    }
    -[MIReverter setDataContainer:](self, "setDataContainer:", v10);

  }
  else
  {
    v11 = 0;
  }
  v17 = v11;
  v13 = -[MIReverter _postFlightAppExtensionsWithError:](self, "_postFlightAppExtensionsWithError:", &v17);
  v14 = v17;
LABEL_7:

  if (a3 && !v13)
    *a3 = objc_retainAutorelease(v14);

  return v13;
}

- (BOOL)_refreshUUIDForContainer:(id)a3 withError:(id *)a4
{
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  id v15;

  v5 = a3;
  if (objc_msgSend(v5, "status") != (id)1)
  {
    v8 = 0;
LABEL_7:
    v12 = 1;
    goto LABEL_8;
  }
  v15 = 0;
  v6 = objc_msgSend(v5, "regenerateDirectoryUUIDWithError:", &v15);
  v7 = v15;
  v8 = v7;
  if (v6)
  {
    v9 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerURL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      MOLogWrite(v9, 5, "-[MIReverter _refreshUUIDForContainer:withError:]", CFSTR("Data container for %@ is now at %@"));

    }
    goto LABEL_7;
  }
  if (a4)
  {
    v8 = objc_retainAutorelease(v7);
    v12 = 0;
    *a4 = v8;
  }
  else
  {
    v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)_finalizeInstallationWithError:(id *)a3
{
  MIReverter *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  id v44;
  unsigned int v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  unsigned int v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  id v66;
  MIReverter *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  unsigned int v71;
  BOOL v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char *v78;
  char *j;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  id obj;
  MIReverter *v95;
  id v96;
  id v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  id v102;
  id v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundle"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  -[MIReverter _fireCallbackWithStatus:percentComplete:](v3, "_fireCallbackWithStatus:percentComplete:", CFSTR("SandboxingApplication"), 80);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](v3, "existingBundleContainer"));

  v95 = v3;
  if (v7)
  {
    v93 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](v3, "existingBundleContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundle"));

    v121 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appExtensionBundlesWithError:", &v121));
    v11 = v121;
    if (v10)
    {
      v91 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](v3, "appExtensionBundles"));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v118;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v118 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)i), "identifier"));
            objc_msgSend(v12, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v117, v125, 16);
        }
        while (v15);
      }
      v90 = v5;

      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v10 = v91;
      obj = v91;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
      if (v19)
      {
        v20 = v19;
        v89 = v9;
        v21 = *(_QWORD *)v114;
        do
        {
          v22 = 0;
          v23 = v11;
          do
          {
            if (*(_QWORD *)v114 != v21)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier", v85, v87));
            v26 = objc_msgSend(v12, "containsObject:", v25);

            if ((v26 & 1) != 0)
            {
              v11 = v23;
            }
            else
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](v95, "identity"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "personaUniqueString"));
              v112 = v23;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 0, v28, 0, 0, &v112));
              v11 = v112;

              v30 = qword_10009E048;
              if (v29)
              {
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
                {
                  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
                  MOLogWrite(v30, 5, "-[MIReverter _finalizeInstallationWithError:]", CFSTR("App no longer needs data container for appex with id %@; removing it"));

                }
                objc_msgSend(v93, "addObject:", v29, v85);
              }
              else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "identifier"));
                v87 = v11;
                MOLogWrite(v30, 3, "-[MIReverter _finalizeInstallationWithError:]", CFSTR("Failed to fetch data container for no longer present app extension with id %@ : %@"));

              }
              v23 = v11;
            }
            v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v124, 16);
        }
        while (v20);
        v9 = v89;
        v5 = v90;
        v3 = v95;
        v10 = v91;
      }
    }
    else
    {
      v31 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_33;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleURL"));
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      v87 = v11;
      obj = v85;
      MOLogWrite(v31, 3, "-[MIReverter _finalizeInstallationWithError:]", CFSTR("Failed to discover bundle identifiers of app extension bundles in previously installed app at %@ : %@"));
    }

LABEL_33:
    v6 = v93;
  }
  v32 = objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer", v85, v87));
  if (v32
    && (v33 = (void *)v32,
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer")),
        v35 = objc_msgSend(v34, "status"),
        v34,
        v33,
        v35 != (id)3))
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer"));
    v111 = 0;
    v69 = -[MIReverter _refreshUUIDForContainer:withError:](v3, "_refreshUUIDForContainer:withError:", v68, &v111);
    v51 = v111;

    if (!v69)
      goto LABEL_69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v3, "dataContainer"));
    v110 = v51;
    v71 = objc_msgSend(v70, "makeContainerLiveWithError:", &v110);
    v36 = v110;

    v51 = v36;
    if (!v71)
      goto LABEL_69;
  }
  else
  {
    v36 = 0;
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](v3, "appExtensionDataContainers"));
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v107;
LABEL_39:
    v41 = 0;
    while (1)
    {
      if (*(_QWORD *)v107 != v40)
        objc_enumerationMutation(v37);
      v42 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v41);
      v105 = v36;
      v43 = -[MIReverter _refreshUUIDForContainer:withError:](v95, "_refreshUUIDForContainer:withError:", v42, &v105);
      v44 = v105;

      if (!v43)
        goto LABEL_68;
      if (objc_msgSend(v42, "status") == (id)3)
      {
        v36 = v44;
      }
      else
      {
        v104 = v44;
        v45 = objc_msgSend(v42, "makeContainerLiveWithError:", &v104);
        v36 = v104;

        if (!v45)
        {
          v44 = v36;
          goto LABEL_68;
        }
      }
      if (v39 == (id)++v41)
      {
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
        if (v39)
          goto LABEL_39;
        break;
      }
    }
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter options](v95, "options"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("WaitForStorageDeletion")));
  v48 = sub_10001113C(v47, 0);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](v95, "bundleContainer"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter existingBundleContainer](v95, "existingBundleContainer"));
  v103 = v36;
  LODWORD(v48) = objc_msgSend(v49, "makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:", v50, 2, v48, &v103);
  v51 = v103;

  if (!(_DWORD)v48)
    goto LABEL_69;
  v52 = objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v95, "dataContainer"));
  if (v52)
  {
    v53 = (void *)v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v95, "dataContainer"));
    v55 = objc_msgSend(v54, "status");

    if (v55 == (id)3)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v95, "dataContainer"));
      v102 = v51;
      v57 = objc_msgSend(v56, "makeContainerLiveWithError:", &v102);
      v58 = v102;

      v51 = v58;
      if (!v57)
        goto LABEL_69;
    }
  }
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](v95, "appExtensionDataContainers"));
  v59 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v99;
LABEL_54:
    v62 = 0;
    while (1)
    {
      if (*(_QWORD *)v99 != v61)
        objc_enumerationMutation(v37);
      v63 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v62);
      if (objc_msgSend(v63, "status") == (id)3)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
        objc_msgSend(v63, "setParentBundleID:", v64);

        v97 = v51;
        LODWORD(v64) = objc_msgSend(v63, "makeContainerLiveWithError:", &v97);
        v44 = v97;

        v51 = v44;
        if (!(_DWORD)v64)
          break;
      }
      if (v60 == (id)++v62)
      {
        v60 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
        if (v60)
          goto LABEL_54;
        goto LABEL_61;
      }
    }
LABEL_68:

    v51 = v44;
LABEL_69:
    if (a3)
    {
      v51 = objc_retainAutorelease(v51);
      v72 = 0;
      *a3 = v51;
    }
    else
    {
      v72 = 0;
    }
    goto LABEL_72;
  }
LABEL_61:

  if (objc_msgSend(v6, "count"))
  {
    v96 = v51;
    v65 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v6, 0, &v96);
    v66 = v96;

    v67 = v95;
    if ((v65 & 1) != 0)
    {
      v51 = v66;
    }
    else
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v86 = v6;
        v88 = v66;
        MOLogWrite(qword_10009E048, 3, "-[MIReverter _finalizeInstallationWithError:]", CFSTR("Failed to remove unused app extension data containers : %@ with %@"));
      }

      v51 = 0;
    }
  }
  else
  {
    v67 = v95;
  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v67, "dataContainer", v86, v88));

  if (v74)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerProtectionManager defaultManager](MIContainerProtectionManager, "defaultManager"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](v67, "dataContainer"));
    objc_msgSend(v75, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:", v76, v5, 1);

  }
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](v67, "appExtensionBundles"));
  v78 = (char *)objc_msgSend(v77, "count");

  if (v78)
  {
    for (j = 0; j != v78; ++j)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](v67, "appExtensionDataContainers"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectAtIndexedSubscript:", j));

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](v67, "appExtensionBundles"));
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "objectAtIndexedSubscript:", j));

      v84 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerProtectionManager defaultManager](MIContainerProtectionManager, "defaultManager"));
      v72 = 1;
      objc_msgSend(v84, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:", v81, v83, 1);

      v67 = v95;
    }
  }
  else
  {
    v72 = 1;
  }
LABEL_72:

  return v72;
}

- (id)_launchServicesBundleRecordsWithError:(id *)a3
{
  NSMutableArray *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  id v27;
  uint64_t v28;
  NSMutableArray *v29;
  void *v31;
  void *v32;
  id *v33;
  id v34;
  void *v35;
  id v36;
  id v37;

  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("GeneratingApplicationMap"), 90);
  v7 = objc_alloc((Class)MIInstalledInfoGatherer);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter bundleContainer](self, "bundleContainer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter dataContainer](self, "dataContainer"));
  v10 = objc_msgSend(v7, "initWithBundleContainer:dataContainer:", v8, v9);

  v37 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleRecordWithError:", &v37));
  v12 = v37;
  if (!v11)
  {
    v26 = 0;
    if (!a3)
      goto LABEL_16;
    goto LABEL_14;
  }
  -[NSMutableArray addObject:](v5, "addObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
  v14 = objc_msgSend(v13, "count");

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](self, "appExtensionDataContainers"));
  v16 = objc_msgSend(v15, "count");

  if (v14 != v16)
  {
    v27 = sub_100010E50((uint64_t)"-[MIReverter _launchServicesBundleRecordsWithError:]", 590, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Have %ld app extensions and %ld app extension data containers; they should be equal."),
            v17,
            (uint64_t)v14);
    v28 = objc_claimAutoreleasedReturnValue(v27);

    v26 = 0;
    v12 = (id)v28;
    if (!a3)
      goto LABEL_16;
    goto LABEL_14;
  }
  v32 = v6;
  v33 = a3;
  v31 = v11;
  if (v14)
  {
    v34 = v14;
    v18 = 0;
    while (1)
    {
      v19 = v10;
      v20 = v12;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionBundles](self, "appExtensionBundles"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", v18));

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter appExtensionDataContainers](self, "appExtensionDataContainers"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v18));

      v10 = objc_msgSend(objc_alloc((Class)MIInstalledInfoGatherer), "initWithAppExtensionBundle:inBundleIdentifier:dataContainer:", v22, v35, v24);
      v36 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleRecordWithError:", &v36));
      v12 = v36;

      if (!v25)
        break;
      -[NSMutableArray addObject:](v5, "addObject:", v25);

      if (v34 == (id)++v18)
        goto LABEL_7;
    }

    v26 = 0;
  }
  else
  {
LABEL_7:
    v26 = v5;
  }
  v6 = v32;
  a3 = v33;
  v11 = v31;
  if (v33)
  {
LABEL_14:
    if (!v26)
      *a3 = objc_retainAutorelease(v12);
  }
LABEL_16:
  v29 = v26;

  return v29;
}

- (BOOL)performRevertWithError:(id *)a3
{
  void *v5;
  void *v6;
  id *v7;
  unsigned __int8 v8;
  id *v9;
  NSObject *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id v39;
  id v40;
  uint64_t v41;
  id *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v41 = 0;
  v42 = (id *)&v41;
  v43 = 0x3032000000;
  v44 = sub_10000DE48;
  v45 = sub_10000DE58;
  v46 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIReverter identity](self, "identity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("CreatingStagingDirectory"), 5);
  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("ExtractingPackage"), 15);
  -[MIReverter _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("InspectingPackage"), 20);
  -[MIReverter _fireCallbackWithStatus:](self, "_fireCallbackWithStatus:", CFSTR("TakingInstallLock"));
  sub_10004E780(v6);
  -[MIReverter setIsLocked:](self, "setIsLocked:", 1);
  v7 = v42;
  v40 = v42[5];
  v8 = objc_msgSend(v5, "resolvePersonaWithError:", &v40);
  objc_storeStrong(v7 + 5, v40);
  if ((v8 & 1) == 0)
  {
    v16 = 0;
    goto LABEL_13;
  }
  v9 = v42;
  v39 = v42[5];
  LODWORD(v10) = -[MIReverter _performPreflightWithError:](self, "_performPreflightWithError:", &v39);
  objc_storeStrong(v9 + 5, v39);
  if (!(_DWORD)v10)
    goto LABEL_14;
  v11 = v42;
  obj = v42[5];
  LODWORD(v10) = -[MIReverter _performVerificationWithError:](self, "_performVerificationWithError:", &obj);
  objc_storeStrong(v11 + 5, obj);
  if (!(_DWORD)v10)
    goto LABEL_14;
  v12 = v42;
  v37 = v42[5];
  LODWORD(v10) = -[MIReverter _performInstallationWithError:](self, "_performInstallationWithError:", &v37);
  objc_storeStrong(v12 + 5, v37);
  if (!(_DWORD)v10)
    goto LABEL_14;
  v13 = v42;
  v36 = v42[5];
  LODWORD(v10) = -[MIReverter _postFlightInstallationWithError:](self, "_postFlightInstallationWithError:", &v36);
  objc_storeStrong(v13 + 5, v36);
  if (!(_DWORD)v10
    || (v14 = v42,
        v35 = v42[5],
        LODWORD(v10) = -[MIReverter _finalizeInstallationWithError:](self, "_finalizeInstallationWithError:", &v35),
        objc_storeStrong(v14 + 5, v35),
        !(_DWORD)v10))
  {
LABEL_14:
    v16 = 0;
    goto LABEL_15;
  }
  v15 = v42;
  v34 = v42[5];
  v16 = (id)objc_claimAutoreleasedReturnValue(-[MIReverter _launchServicesBundleRecordsWithError:](self, "_launchServicesBundleRecordsWithError:", &v34));
  objc_storeStrong(v15 + 5, v34);
  if (!v16)
  {
LABEL_13:
    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_receipt, v16);
  if (-[MIReverter isLocked](self, "isLocked"))
  {
    sub_10004E89C(v6);
    -[MIReverter setIsLocked:](self, "setIsLocked:", 0);
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_10000DE48;
  v32 = sub_10000DE58;
  v33 = 0;
  v17 = sub_10000B610();
  v10 = objc_claimAutoreleasedReturnValue(v17);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DE60;
  block[3] = &unk_100084EF0;
  v26 = &v28;
  v16 = v16;
  v24 = v16;
  v25 = v5;
  v27 = &v41;
  dispatch_sync(v10, block);

  v18 = (void *)v29[5];
  LOBYTE(v10) = v18 != 0;
  if (v18)
  {
    objc_storeStrong((id *)&self->_recordPromise, v18);
  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v21 = v6;
    v22 = (uint64_t)v42[5];
    MOLogWrite(qword_10009E048, 3, "-[MIReverter performRevertWithError:]", CFSTR("Failed to register installation record while reverting for %@ : %@"));
  }

  _Block_object_dispose(&v28, 8);
LABEL_15:
  if (-[MIReverter isLocked](self, "isLocked", v21, v22))
  {
    sub_10004E89C(v6);
    -[MIReverter setIsLocked:](self, "setIsLocked:", 0);
  }
  if (a3)
    v19 = (char)v10;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
    *a3 = objc_retainAutorelease(v42[5]);

  _Block_object_dispose(&v41, 8);
  return (char)v10;
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (MIClientConnection)client
{
  return (MIClientConnection *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (MIBundleContainer)existingBundleContainer
{
  return self->_existingBundleContainer;
}

- (void)setExistingBundleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_existingBundleContainer, a3);
}

- (MIStashedBundleContainer)stashedContainer
{
  return self->_stashedContainer;
}

- (void)setStashedContainer:(id)a3
{
  objc_storeStrong((id *)&self->_stashedContainer, a3);
}

- (MIBundleContainer)bundleContainer
{
  return self->_bundleContainer;
}

- (void)setBundleContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bundleContainer, a3);
}

- (NSArray)appExtensionBundles
{
  return self->_appExtensionBundles;
}

- (void)setAppExtensionBundles:(id)a3
{
  objc_storeStrong((id *)&self->_appExtensionBundles, a3);
}

- (MIDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (void)setDataContainer:(id)a3
{
  objc_storeStrong((id *)&self->_dataContainer, a3);
}

- (NSMutableArray)appExtensionDataContainers
{
  return self->_appExtensionDataContainers;
}

- (void)setAppExtensionDataContainers:(id)a3
{
  objc_storeStrong((id *)&self->_appExtensionDataContainers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExtensionDataContainers, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_appExtensionBundles, 0);
  objc_storeStrong((id *)&self->_bundleContainer, 0);
  objc_storeStrong((id *)&self->_stashedContainer, 0);
  objc_storeStrong((id *)&self->_existingBundleContainer, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_recordPromise, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
}

@end
