@implementation MIUninstaller

- (MIUninstaller)initWithIdentitites:(id)a3 options:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  MIUninstaller *v12;
  MIUninstaller *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MIUninstaller;
  v12 = -[MIUninstaller init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identities, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    objc_storeStrong((id *)&v13->_client, a5);
  }

  return v13;
}

+ (id)uninstallerForIdentities:(id)a3 withOptions:(id)a4 forClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithIdentitites:options:forClient:", v10, v9, v8);

  return v11;
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (-[MIUninstaller percentComplete](self, "percentComplete") < v4)
    -[MIUninstaller setPercentComplete:](self, "setPercentComplete:", v4);
  v10[0] = CFSTR("Status");
  v10[1] = CFSTR("PercentComplete");
  v11[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[MIUninstaller percentComplete](self, "percentComplete")));
  v11[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
  objc_msgSend(v9, "sendProgressWithDictionary:", v8);

}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4;

  v4 = a3;
  -[MIUninstaller _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", v4, -[MIUninstaller percentComplete](self, "percentComplete"));

}

- (BOOL)_uninstallUserStuffForIdentity:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personaUniqueString"));
  v27 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainer allContainersForIdentifier:persona:options:error:](MIContainer, "allContainersForIdentifier:persona:options:error:", v6, v7, 2, &v27));
  v9 = v27;

  if (v8)
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v21 = v5;
      MOLogWrite(qword_10009E048, 5, "-[MIUninstaller _uninstallUserStuffForIdentity:error:]", CFSTR("Uninstalling user stuff for identity %@"));
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
LABEL_7:
      v15 = 0;
      v16 = v9;
      while (1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15);
        v22 = v16;
        v18 = objc_msgSend(v17, "purgeContentWithError:", &v22, v21);
        v9 = v22;

        if (!v18)
          break;
        v15 = (char *)v15 + 1;
        v16 = v9;
        if (v13 == v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          LOBYTE(v18) = 1;
          if (v13)
            goto LABEL_7;
          break;
        }
      }
    }
    else
    {
      LOBYTE(v18) = 1;
    }
  }
  else
  {
    v19 = sub_100010E50((uint64_t)"-[MIUninstaller _uninstallUserStuffForIdentity:error:]", 102, MIInstallerErrorDomain, 26, v9, 0, CFSTR("Could not get containers with identity %@"), v10, (uint64_t)v5);
    LOBYTE(v18) = 0;
    v11 = v9;
    v9 = (id)objc_claimAutoreleasedReturnValue(v19);
  }

  if (a4 && (v18 & 1) == 0)
    *a4 = objc_retainAutorelease(v9);

  return v18;
}

- (BOOL)_removeReferenceForBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 temporaryReference:(id)a5 removedInfo:(id)a6 wasLastReference:(BOOL *)a7 gatherOptions:(unint64_t *)a8 error:(id *)a9
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  id v28;
  unsigned __int8 v29;
  void *v30;
  MIUninstallRecord *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  MIUninstallRecord *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  void *v48;
  uint64_t v50;
  id v51;
  void *v52;
  id v53;
  BOOL *v54;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  BOOL v74;
  _BYTE v75[128];

  v13 = a3;
  v60 = a4;
  v14 = a5;
  v61 = a6;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager"));
  v16 = sub_10000B4F8();
  v74 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
  v73 = 0;
  v62 = 3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v17, 3, &v73));
  v19 = v73;
  v20 = v19;
  if (!v18)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domain"));
    if ((objc_msgSend(v27, "isEqualToString:", MIContainerManagerErrorDomain) & 1) != 0)
    {
      v28 = objc_msgSend(v20, "code");

      if (v28 == (id)21)
      {

        v72 = 0;
        v62 = 2;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v17, 2, &v72));
        v20 = v72;
        v22 = v20;
        if (v18)
          goto LABEL_2;
      }
      else
      {
        v22 = v20;
      }
    }
    else
    {
      v22 = v20;

    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:]", CFSTR("Failed to find bundle container for %@ : %@"));
    v30 = 0;
LABEL_25:
    v24 = 0;
    v25 = 0;
    goto LABEL_48;
  }
LABEL_2:
  if (v14)
  {
    v71 = v20;
    v21 = objc_msgSend(v15, "revokeTemporaryReference:wasLastReference:error:", v14, &v74, &v71);
    v22 = v71;

    if ((v21 & 1) != 0)
    {
      v58 = v17;
      v23 = 0;
      v24 = 0;
      v25 = 0;
LABEL_5:
      *a8 = v23;
      *a7 = v74;
      v26 = 1;
      v17 = v58;
      goto LABEL_52;
    }
    v30 = v18;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:]", CFSTR("Failed to revoke temporary reference for %@ : %@"));
    goto LABEL_25;
  }
  v69 = v20;
  v70 = 0;
  v29 = objc_msgSend(v15, "removeReferenceForIdentity:inDomain:forUserWithID:wasLastReference:resultingPersonaUniqueStrings:error:", v13, v62, v16, &v74, &v70, &v69);
  v57 = v70;
  v56 = v69;

  if ((v29 & 1) != 0)
  {
    v55 = v15;
    v58 = v17;
    v54 = a7;
    if (v74)
    {
      v24 = 0;
      v23 = 0;
    }
    else
    {
      v31 = objc_opt_new(MIUninstallRecord);
      v53 = v13;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
      -[MIUninstallRecord setBundleIdentifier:](v31, "setBundleIdentifier:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundle"));
      -[MIUninstallRecord setIsPlaceholder:](v31, "setIsPlaceholder:", objc_msgSend(v33, "isPlaceholder"));

      v52 = v18;
      -[MIUninstallRecord setHasParallelPlaceholder:](v31, "setHasParallelPlaceholder:", objc_msgSend(v18, "hasParallelPlaceholder"));
      objc_msgSend(v61, "addObject:", v31);
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v34 = v60;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
      if (v35)
      {
        v36 = v35;
        v24 = 0;
        v37 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            v39 = v24;
            if (*(_QWORD *)v66 != v37)
              objc_enumerationMutation(v34);
            v40 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
            v64 = 0;
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v40, v62, &v64, v50, v51));
            v41 = v64;

            if (v24)
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bundle"));
              v43 = objc_opt_new(MIUninstallRecord);
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "identifier"));
              -[MIUninstallRecord setBundleIdentifier:](v31, "setBundleIdentifier:", v44);

              -[MIUninstallRecord setIsPlaceholder:](v31, "setIsPlaceholder:", objc_msgSend(v42, "isPlaceholder"));
              -[MIUninstallRecord setHasParallelPlaceholder:](v31, "setHasParallelPlaceholder:", objc_msgSend(v24, "hasParallelPlaceholder"));
              objc_msgSend(v61, "addObject:", v43);

            }
            else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              v50 = v40;
              v51 = v41;
              MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:]", CFSTR("Failed to get bundle container for child %@ : %@"));
            }

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
        }
        while (v36);
      }
      else
      {
        v24 = 0;
      }

      v23 = 2;
      v18 = v52;
      v13 = v53;
      v15 = v55;
      v14 = 0;
      a7 = v54;
    }
    if (!v57)
    {
      v25 = 0;
      v22 = v56;
      goto LABEL_5;
    }
    v30 = v18;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[MILaunchServicesOperationManager instanceForCurrentUser](MILaunchServicesOperationManager, "instanceForCurrentUser"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
    v63 = v56;
    v47 = objc_msgSend(v45, "setPersonaUniqueStrings:forAppBundleID:inDomain:error:", v57, v46, v62, &v63);
    v22 = v63;

    if ((v47 & 1) != 0)
    {
      v15 = v55;
      v14 = 0;
      v18 = v30;
      a7 = v54;
      v25 = v57;
      goto LABEL_5;
    }
    v15 = v55;
    v14 = 0;
    v17 = v58;
  }
  else if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
  {
    v30 = v18;
    v24 = 0;
    v22 = v56;
  }
  else
  {
    v30 = v18;
    v22 = v56;
    MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:]", CFSTR("Failed to remove reference for %@ : %@"));
    v24 = 0;
  }
  v25 = v57;
LABEL_48:
  if (a9)
  {
    v48 = v25;
    v22 = objc_retainAutorelease(v22);
    v25 = v48;
    v26 = 0;
    *a9 = v22;
  }
  else
  {
    v26 = 0;
  }
  v18 = v30;
LABEL_52:

  return v26;
}

- (id)_uninstallBundleWithIdentity:(id)a3 linkedToChildren:(id)a4 waitForDeletion:(BOOL)a5 uninstallReason:(id)a6 temporaryReference:(id)a7 deleteDataContainers:(BOOL)a8 wasLastReference:(BOOL *)a9 error:(id *)a10
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSMutableSet *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  unsigned __int8 v68;
  uint64_t v69;
  void *v70;
  id v71;
  MIUninstallRecord *v72;
  void *v73;
  void *v74;
  unsigned int v75;
  uint64_t v76;
  void *v77;
  id v78;
  unsigned __int8 v79;
  id v80;
  void *v81;
  unsigned int v82;
  id *v83;
  id v84;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  _BOOL4 v94;
  void *v95;
  id v96;
  NSMutableArray *v97;
  void *v98;
  NSMutableArray *v99;
  NSMutableArray *obj;
  void *v101;
  unsigned int v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  id v123;
  BOOL v124;
  uint64_t v125;
  _BYTE v126[128];
  _BYTE v127[128];

  v10 = a8;
  v94 = a5;
  v15 = a3;
  v16 = a4;
  v96 = a6;
  v17 = a7;
  v18 = objc_opt_new(NSMutableArray);
  v99 = objc_opt_new(NSMutableArray);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bundleID"));
  v125 = 0;
  v124 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "personaUniqueString"));
  if (!+[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled"))
  {
    v22 = 0;
    v124 = 1;
LABEL_6:
    v23 = 5;
    if (v10)
      v23 = 7;
    v125 = v23;
    if (_os_feature_enabled_impl("containermanagerd", "multipersona_reconciliation_on_delete"))
    {

      v20 = 0;
    }
    goto LABEL_10;
  }
  v123 = 0;
  v21 = -[MIUninstaller _removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:](self, "_removeReferenceForBundleWithIdentity:linkedToChildren:temporaryReference:removedInfo:wasLastReference:gatherOptions:error:", v15, v16, v17, v18, &v124, &v125, &v123);
  v22 = v123;
  if ((v21 & 1) == 0)
  {
LABEL_32:
    v37 = 0;
    v38 = 0;
    v95 = 0;
LABEL_97:
    v83 = a10;
    goto LABEL_98;
  }
  if (v124)
    goto LABEL_6;
LABEL_10:
  v24 = v22;
  v122 = v22;
  v25 = objc_claimAutoreleasedReturnValue(+[MIContainer allContainersForIdentifier:persona:options:error:](MIContainer, "allContainersForIdentifier:persona:options:error:", v19, v20, v125, &v122));
  v22 = v122;

  if (!v25)
    goto LABEL_32;
  -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v25);
  v91 = v17;
  v92 = v15;
  v97 = v18;
  v98 = v16;
  v93 = v19;
  v101 = v20;
  v95 = (void *)v25;
  if (objc_msgSend(v16, "count"))
  {
    v26 = objc_opt_new(NSMutableSet);
    v118 = 0u;
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v27 = v16;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v119;
      v106 = MIContainerManagerErrorDomain;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          v32 = v22;
          if (*(_QWORD *)v119 != v30)
            objc_enumerationMutation(v27);
          v33 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)i);
          v117 = v22;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainer allContainersForIdentifier:persona:options:error:](MIContainer, "allContainersForIdentifier:persona:options:error:", v33, v20, v125, &v117, v86, v89));
          v22 = v117;

          if (v34)
          {
LABEL_18:
            -[NSMutableArray addObjectsFromArray:](v99, "addObjectsFromArray:", v34);
            -[NSMutableSet addObject:](v26, "addObject:", v33);
            goto LABEL_26;
          }
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "domain"));
          if ((objc_msgSend(v35, "isEqualToString:", v106) & 1) != 0)
          {
            v36 = objc_msgSend(v22, "code");

            v20 = v101;
            if (v36 == (id)21)
              goto LABEL_18;
          }
          else
          {

            v20 = v101;
          }
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v86 = v33;
            v89 = v22;
            MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to get all containers for child %@ : %@"));
          }
LABEL_26:

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
      }
      while (v29);
    }

    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v86 = v93;
      v89 = v26;
      MOLogWrite(qword_10009E048, 5, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Uninstalling identifier %@, plus linked apps: %@"));
    }

  }
  else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v86 = v19;
    MOLogWrite(qword_10009E048, 5, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Uninstalling identifier %@"));
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  obj = v99;
  v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
  v38 = 0;
  if (!v107)
    goto LABEL_86;
  v105 = *(_QWORD *)v114;
  do
  {
    v39 = 0;
    v40 = v38;
    do
    {
      if (*(_QWORD *)v114 != v105)
        objc_enumerationMutation(obj);
      v41 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v39);
      v42 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v39), "identifier", v86, v89, v90));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "personaUniqueString"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "containerURL"));
        v89 = v44;
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "path"));
        v86 = v43;
        MOLogWrite(v42, 5, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Destroying container %@ with persona %@ at %@"));

      }
      objc_opt_class(MIBundleContainer);
      if ((objc_opt_isKindOfClass(v41) & 1) == 0)
      {
        v38 = v40;
        goto LABEL_84;
      }
      v38 = v41;

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "identifier"));

      if (!v47)
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v86 = v38;
          MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to get bundle identifier for bundle in bundle container %@"));
        }
        goto LABEL_83;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[MIFreeProfileValidatedAppTracker sharedTracker](MIFreeProfileValidatedAppTracker, "sharedTracker"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
      v112 = v22;
      v50 = objc_msgSend(v48, "removeReferenceForBundle:error:", v49, &v112);
      v51 = v112;

      if ((v50 & 1) == 0)
      {
        v52 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle", v86, v89, v90));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bundleURL"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "path"));
          v90 = v51;
          v86 = v47;
          MOLogWrite(v52, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to remove reference to %@ at %@ for free profile validated app tracking (%@); invalidating cache."));

        }
        objc_msgSend(v48, "invalidateCache");
        v51 = 0;
      }
      v104 = v48;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle", v86));
      v56 = objc_msgSend(v55, "isPlaceholder");

      LODWORD(v55) = objc_msgSend(v38, "hasParallelPlaceholder");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bundleURL"));

      v103 = v58;
      v102 = v55;
      if ((v56 & 1) == 0)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
        v111 = v51;
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "insecureCachedAppIdentifierIfAppClipForBundle:error:", v58, &v111));
        v60 = v111;

        if (v59)
        {
          v62 = SecItemDeleteKeychainItemsForAppClip(v59);
          if ((_DWORD)v62 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
          {
            v87 = v59;
            v89 = (void *)v62;
            MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to remove keychain items for app clip with application identifier %@: status = %d"));
          }
          goto LABEL_70;
        }
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "domain"));
        if (objc_msgSend(v63, "isEqualToString:", NSPOSIXErrorDomain))
        {
          v64 = objc_msgSend(v60, "code");

          if (v64 == (id)93)
          {
LABEL_69:

            v59 = 0;
            v60 = 0;
            goto LABEL_70;
          }
        }
        else
        {

        }
        v65 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "path"));
          v89 = v60;
          MOLogWrite(v65, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to fetch application identifier from %@ during app clip cleanup: %@"));

        }
        goto LABEL_69;
      }
      v59 = 0;
      v60 = v51;
LABEL_70:
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[MIKeychainAccessGroupTracker sharedTracker](MIKeychainAccessGroupTracker, "sharedTracker", v87));
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
      v110 = v60;
      v68 = objc_msgSend(v66, "removeReferencesForBundle:error:", v67, &v110);
      v22 = v110;

      if ((v68 & 1) == 0)
      {
        v69 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "identifier"));
          v89 = v22;
          MOLogWrite(v69, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to remove keychain access group references for %@ (%@); invalidating group reference cache."));

        }
        objc_msgSend(v66, "invalidateCache");
        v22 = 0;
      }
      v71 = objc_msgSend(v98, "containsObject:", v47, v88);
      v72 = objc_opt_new(MIUninstallRecord);
      -[MIUninstallRecord setBundleIdentifier:](v72, "setBundleIdentifier:", v47);
      -[MIUninstallRecord setIsPlaceholder:](v72, "setIsPlaceholder:", v56);
      -[MIUninstallRecord setHasParallelPlaceholder:](v72, "setHasParallelPlaceholder:", v102);
      -[MIUninstallRecord setIsLinked:](v72, "setIsLinked:", v71);
      -[MIUninstallRecord setIsLastReference:](v72, "setIsLastReference:", v124);
      -[NSMutableArray addObject:](v97, "addObject:", v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[MIUninstalledAppList sharedList](MIUninstalledAppList, "sharedList"));
      objc_msgSend(v73, "addIdentifier:", v47);

      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bundle"));
      v75 = objc_msgSend(v74, "bundleType");

      if (v75 == 1)
      {
        if (v96)
        {
          if (objc_msgSend(v96, "isEqualToString:", CFSTR("UninstallReasonSystemAppNotAllowed")))
            v76 = 6;
          else
            v76 = 2;
        }
        else
        {
          v76 = 2;
        }
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[MISystemAppState sharedList](MISystemAppState, "sharedList"));
        objc_msgSend(v77, "addIdentifier:withState:", v47, v76);

      }
      v20 = v101;
LABEL_83:

      v40 = v38;
LABEL_84:
      v39 = (char *)v39 + 1;
    }
    while (v107 != v39);
    v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v113, v126, 16);
  }
  while (v107);
LABEL_86:

  v78 = -[NSMutableArray copy](obj, "copy");
  v109 = v22;
  v79 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v78, v94, &v109);
  v80 = v109;

  if ((v79 & 1) == 0)
  {
    v17 = v91;
    v15 = v92;
    v18 = v97;
    v16 = v98;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v19 = v93;
      MOLogWrite(qword_10009E048, 3, "-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:]", CFSTR("Failed to remove underlying containers for %@ with %@"));
LABEL_96:
      sub_100032844(v80);
      v37 = 0;
      v22 = v80;
      goto LABEL_97;
    }
LABEL_95:
    v19 = v93;
    goto LABEL_96;
  }
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 2));
  v108 = v80;
  v82 = objc_msgSend(v81, "removeParent:error:", v93, &v108);
  v22 = v108;

  v17 = v91;
  v15 = v92;
  v18 = v97;
  v16 = v98;
  if (!v82)
  {
    v80 = v22;
    goto LABEL_95;
  }
  sub_100032844(0);
  v37 = -[NSMutableArray copy](v97, "copy");
  if (!a9)
  {
    v19 = v93;
    goto LABEL_97;
  }
  v19 = v93;
  v83 = a10;
  if (v37)
  {
    *a9 = v124;
    goto LABEL_101;
  }
LABEL_98:
  if (v83 && !v37)
  {
    v22 = objc_retainAutorelease(v22);
    v37 = 0;
    *v83 = v22;
  }
LABEL_101:
  v84 = v37;

  return v84;
}

- (BOOL)performUninstallationWithError:(id *)a3
{
  return -[MIUninstaller performUninstallationByRevokingTemporaryReference:error:](self, "performUninstallationByRevokingTemporaryReference:error:", 0, a3);
}

- (BOOL)performUninstallationByRevokingTemporaryReference:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
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
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  void *v49;
  unsigned int v50;
  id v51;
  __CFString *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  unsigned __int8 v56;
  void *v57;
  void *v58;
  id v59;
  int v60;
  uint64_t v61;
  void *j;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  unsigned int v72;
  id *v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned int v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id *v92;
  unsigned __int8 v93;
  MIUninstallRecord *v94;
  void *v95;
  void *v96;
  id *v97;
  unsigned __int8 v98;
  void *v99;
  BOOL v100;
  uint64_t v101;
  void *v102;
  unsigned __int8 v103;
  id *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  const __CFString *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  _BOOL8 v131;
  void *v132;
  __CFString *v133;
  uint64_t v134;
  uint64_t v135;
  MIUninstallRecord *v136;
  void *v137;
  void *v138;
  _BOOL4 v139;
  void *v140;
  id v141;
  id v142;
  NSObject *v143;
  NSMutableArray *v144;
  BOOL v145;
  BOOL v146;
  NSArray *v148;
  NSArray *receipt;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  __CFString *v155;
  const __CFString *v156;
  void *v158;
  uint64_t v159;
  unsigned int v160;
  id v161;
  id v162;
  NSMutableDictionary *v163;
  void *v164;
  NSMutableArray *v165;
  NSMutableArray *v166;
  int v168;
  uint64_t v169;
  void *v170;
  int v171;
  NSMutableSet *v172;
  unsigned int v173;
  id v174;
  NSMutableDictionary *v175;
  NSMutableDictionary *v176;
  int v177;
  uint64_t v178;
  int v179;
  uint64_t v180;
  uint64_t v181;
  unsigned int v182;
  id v183;
  void *v184;
  NSMutableSet *v185;
  NSMutableArray *v186;
  id v187;
  _QWORD block[4];
  NSMutableArray *v189;
  NSMutableDictionary *v190;
  MIUninstaller *v191;
  NSMutableSet *v192;
  uint64_t *v193;
  uint64_t *v194;
  _BYTE *v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  char v199;
  id v200;
  id v201;
  id v202;
  id v203;
  void *v204;
  void *v205;
  id v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  id v211;
  id v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  id obj;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  uint64_t v223;
  uint64_t *v224;
  uint64_t v225;
  uint64_t (*v226)(uint64_t, uint64_t);
  void (*v227)(uint64_t);
  id v228;
  _BYTE buf[24];
  __CFString *v230;
  _BYTE v231[128];
  _BYTE v232[128];
  int v233[8];
  int v234[10];
  _BYTE v235[128];

  v162 = a3;
  v223 = 0;
  v224 = &v223;
  v225 = 0x3032000000;
  v226 = sub_1000342D8;
  v227 = sub_1000342E8;
  v228 = 0;
  v185 = objc_opt_new(NSMutableSet);
  v166 = objc_opt_new(NSMutableArray);
  v172 = objc_opt_new(NSMutableSet);
  v165 = objc_opt_new(NSMutableArray);
  v184 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 2));
  v176 = objc_opt_new(NSMutableDictionary);
  v175 = objc_opt_new(NSMutableDictionary);
  v163 = objc_opt_new(NSMutableDictionary);
  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller identities](self, "identities"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v219, v235, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v220;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v220 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * v7);
      v9 = (id *)(v224 + 5);
      obj = (id)v224[5];
      v10 = objc_msgSend(v8, "resolvePersonaWithError:", &obj);
      objc_storeStrong(v9, obj);
      if ((v10 & 1) == 0)
        break;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleID"));
      -[NSMutableArray addObject:](v165, "addObject:", v11);

      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v219, v235, 16);
        if (!v5)
          goto LABEL_9;
        goto LABEL_3;
      }
    }
    v161 = 0;
    v170 = 0;
    v158 = 0;
    goto LABEL_182;
  }
LABEL_9:

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UserDataOnly")));
    v15 = objc_msgSend(v14, "isEqual:", &__kCFBooleanTrue);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Placeholder")));
    v182 = objc_msgSend(v17, "isEqual:", &__kCFBooleanTrue);

    if (v182)
    {
      v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "clientName"));
        sub_100052AD0(v20, v234, v19);
      }

      v21 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "clientName"));
        v155 = CFSTR("Placeholder");
        MOLogWrite(v21, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Process %@ is using an unsupported key: %@"));

      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options", v150, v155));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("ParallelPlaceholderOnlyIfExists")));
    HIDWORD(v181) = objc_msgSend(v24, "isEqual:", &__kCFBooleanTrue);

    if (HIDWORD(v181))
    {
      v25 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clientName"));
        sub_100052A64(v27, v233, v26);
      }

      v28 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller client](self, "client"));
        v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "clientName"));
        v156 = CFSTR("ParallelPlaceholderOnlyIfExists");
        MOLogWrite(v28, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Process %@ is using an unsupported key: %@"));

      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options", v151, v156));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", kMIUninstallParallelPlaceholderKey));
    LODWORD(v181) = objc_msgSend(v31, "isEqual:", &__kCFBooleanTrue);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("UninstallPlaceholdersOnly")));
    v173 = objc_msgSend(v33, "isEqual:", &__kCFBooleanTrue);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("WaitForStorageDeletion")));
    v160 = objc_msgSend(v35, "isEqual:", &__kCFBooleanTrue);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller options](self, "options"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("UninstallReason")));
    objc_opt_class(NSString);
    v38 = v37;
    if ((objc_opt_isKindOfClass(v38) & 1) != 0)
      v161 = v38;
    else
      v161 = 0;

    if (v15)
    {
      if ((v182 | v181 | HIDWORD(v181) | v173) == 1)
      {
        v40 = sub_100010E50((uint64_t)"-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", 492, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Illegal option combination passed to MobileInstallationUninstall. Can't uninstall user stuff only and uninstall placeholders."), v39, (uint64_t)v150);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        v170 = 0;
        v158 = 0;
        v4 = (void *)v224[5];
        v224[5] = v41;
        goto LABEL_182;
      }
      v181 = 0;
      v182 = 0;
      v173 = 0;
      v168 = 1;
    }
    else
    {
      v168 = 0;
    }
  }
  else
  {
    v168 = 0;
    v181 = 0;
    v182 = 0;
    v173 = 0;
    v160 = 0;
    v161 = 0;
  }
  -[NSMutableSet addObjectsFromArray:](v185, "addObjectsFromArray:", v165);
  v216 = 0u;
  v217 = 0u;
  v214 = 0u;
  v215 = 0u;
  v186 = v165;
  v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v215;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(_QWORD *)v215 != v43)
          objc_enumerationMutation(v186);
        v45 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * (_QWORD)i);
        v213 = 0;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "childrenForParentBundleID:error:", v45, &v213, v150));
        v47 = (__CFString *)v213;
        v48 = v47;
        if (v46)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v176, "setObject:forKeyedSubscript:", v46, v45);
          -[NSMutableSet unionSet:](v185, "unionSet:", v46);
        }
        else if (v47 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        {
          v152 = v45;
          v155 = v47;
          MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Failed to get children for %@ : %@; ignoring"));
        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", 2, v152, v155));
        v212 = 0;
        v211 = 0;
        v50 = objc_msgSend(v49, "getLinkedParent:forChild:error:", &v212, v45, &v211);
        v51 = v212;
        v52 = (__CFString *)v211;

        if (v51)
          v53 = v50;
        else
          v53 = 0;
        if (v53 == 1)
        {
          -[NSMutableSet addObject:](v185, "addObject:", v51);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v175, "setObject:forKeyedSubscript:", v51, v45);
        }
        else if (v52 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        {
          v150 = v45;
          v155 = v52;
          MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Failed to get parent of %@ : %@; ignoring"));
        }

      }
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v186, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
    }
    while (v42);
  }

  v158 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v185, "allObjects"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "builtInApplicationBundleIDs"));

  sub_10004E780(v158);
  -[MIUninstaller _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("RemovingApplication"), 50);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v56 = objc_msgSend(v55, "allowDeletableSystemApps");

  if ((v56 & 1) != 0)
  {
    v164 = 0;
  }
  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "systemAppPlaceholderBundleIDs"));

  }
  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller identities](self, "identities", v150));
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v207, v231, 16);
  if (v59)
  {
    v60 = v181 | HIDWORD(v181) | v173;
    v179 = v60 | v182;
    v180 = *(_QWORD *)v208;
    v61 = 11;
    if (v168)
      v61 = 12;
    v178 = v61;
    v169 = MIContainerManagerErrorDomain;
    v177 = v182 ^ 1;
    v171 = (v182 ^ 1) & v60;
    v159 = MIInstallerErrorDomain;
    v174 = v58;
    do
    {
      v183 = v59;
      for (j = 0; j != v183; j = (char *)j + 1)
      {
        if (*(_QWORD *)v208 != v180)
          objc_enumerationMutation(v174);
        v63 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * (_QWORD)j);
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](MIAppReferenceManager, "defaultManager", v153));
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bundleID"));
        v66 = objc_msgSend(v64, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:", v65, 2, sub_10000B4F8(), 0);
        v187 = (id)objc_claimAutoreleasedReturnValue(v66);

        if (v187 && objc_msgSend(v187, "count"))
        {
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bundleID"));
          -[NSMutableSet addObject:](v172, "addObject:", v67);

        }
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "personaUniqueString"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bundleID"));
        if (v179)
        {
          v72 = +[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled");
          v73 = (id *)(v224 + 5);
          if (v72)
          {
            v206 = (id)v224[5];
            v74 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v71, 3, &v206));
            objc_storeStrong(v73, v206);
            if (!v74)
            {
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v224[5], "domain"));
              if ((objc_msgSend(v75, "isEqualToString:", v169) & 1) != 0)
              {
                v76 = objc_msgSend((id)v224[5], "code") == (id)21;

                if (v76)
                {
                  v77 = (void *)v224[5];
                  v224[5] = 0;

                  v73 = (id *)(v224 + 5);
                  v205 = (void *)v224[5];
                  v74 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v71, 2, &v205));
                  v78 = v205;
                  goto LABEL_75;
                }
              }
              else
              {

              }
              goto LABEL_96;
            }
LABEL_76:
            v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bundle"));
            v81 = objc_msgSend(v87, "isPlaceholder");

            if (v171)
            {
              _MILogTransactionStep(9, 1, 1, v71, v68, 0, v88, v89, (uint64_t)v154);
              if ((objc_msgSend(v170, "containsObject:", v71) & v81) == 1)
              {
                v90 = qword_10009E048;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
                {
                  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "containerURL"));
                  v154 = v71;
                  v155 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "path"));
                  MOLogWrite(v90, 5, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Uninstalling parallel placeholder for %@ at %@"));

                }
                v92 = (id *)(v224 + 5);
                v203 = (id)v224[5];
                v93 = objc_msgSend(v74, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v203, v154, v155);
                objc_storeStrong(v92, v203);
                if ((v93 & 1) == 0)
                {
                  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                  {
                    v154 = v71;
                    v155 = (__CFString *)v224[5];
                    MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Failed to destroy placeholder bundle container for %@ : %@"));
                  }
                  v83 = 0;
                  v94 = (MIUninstallRecord *)v224[5];
                  v224[5] = 0;
                  v81 = 1;
LABEL_93:

                  goto LABEL_94;
                }
LABEL_92:
                v94 = objc_opt_new(MIUninstallRecord);
                -[MIUninstallRecord setBundleIdentifier:](v94, "setBundleIdentifier:", v71);
                -[MIUninstallRecord setHasParallelPlaceholder:](v94, "setHasParallelPlaceholder:", 1);
                -[MIUninstallRecord setIsPlaceholder:](v94, "setIsPlaceholder:", 1);
                -[NSMutableArray addObject:](v166, "addObject:", v94);
                v83 = 1;
                goto LABEL_93;
              }
              if (objc_msgSend(v74, "hasParallelPlaceholder"))
              {
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
                {
                  v154 = v71;
                  MOLogWrite(qword_10009E048, 5, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Uninstalling parallel placeholder for %@"));
                }
                v95 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager", v154));
                v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "parallelPlaceholderURL"));
                v97 = (id *)(v224 + 5);
                v202 = (id)v224[5];
                v98 = objc_msgSend(v95, "removeItemAtURL:error:", v96, &v202);
                objc_storeStrong(v97, v202);

                if ((v98 & 1) != 0)
                  goto LABEL_92;
                v116 = qword_10009E048;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                {
                  v94 = (MIUninstallRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "parallelPlaceholderURL"));
                  v154 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstallRecord path](v94, "path"));
                  v155 = (__CFString *)v224[5];
                  MOLogWrite(v116, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Couldn't remove parallel placeholder at %@ : %@"));

                  v83 = 0;
                  goto LABEL_93;
                }
                v83 = 0;
LABEL_94:
                v82 = 1;
              }
              else
              {
                v82 = 0;
                v83 = 0;
              }
              v84 = 9;
            }
            else
            {
              _MILogTransactionStep(10, 1, 1, v71, v68, 0, v88, v89, (uint64_t)v154);
              v82 = 0;
              v83 = 0;
              v84 = 10;
            }
LABEL_106:

            goto LABEL_107;
          }
          v204 = (void *)v224[5];
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v71, 0, 0, &v204));
          v78 = v204;
LABEL_75:
          v85 = v78;
          v86 = *v73;
          *v73 = v85;

          if (v74)
            goto LABEL_76;
LABEL_96:
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v224[5], "domain"));
          if (objc_msgSend(v99, "isEqualToString:", v169))
          {
            v100 = objc_msgSend((id)v224[5], "code") == (id)21;

            if (v100)
            {
LABEL_103:
              v74 = 0;
              v81 = 0;
              v82 = 0;
              v83 = 0;
              v84 = 0;
              goto LABEL_106;
            }
          }
          else
          {

          }
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            v154 = v71;
            v155 = (__CFString *)v224[5];
            MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Failed to look up container for %@ : %@"));
          }
          goto LABEL_103;
        }
        _MILogTransactionStep(v178, 1, 1, v71, v68, 0, v69, v70, (uint64_t)v154);
        v81 = 0;
        v82 = 0;
        v83 = 0;
        v84 = v178;
LABEL_107:
        v101 = 1;
        if ((v181 | HIDWORD(v181) & v82) == 1)
          goto LABEL_166;
        if (!(v177 | v81))
          goto LABEL_166;
        v101 = v83;
        if ((v173 & (v82 | v81 ^ 1) & 1) != 0)
          goto LABEL_166;
        if ((v168 & 1) != 0)
        {
          -[MIUninstaller _uninstallUserStuffForIdentity:error:](self, "_uninstallUserStuffForIdentity:error:", v63, 0);
          v101 = 1;
LABEL_166:
          _MILogTransactionStep(v84, 2, v101, v71, v68, 0, v79, v80, (uint64_t)v154);
          goto LABEL_167;
        }
        if (!objc_msgSend(v170, "containsObject:", v71))
          goto LABEL_142;
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
        v103 = objc_msgSend(v102, "allowsInternalSecurityPolicy");

        if ((v103 & 1) == 0)
        {
          v114 = qword_10009E048;
          if (qword_10009E048)
          {
            v115 = CFSTR("%@ is a built in app and cannot be uninstalled (The device doesn't allow internal security policy)");
            if (*(int *)(qword_10009E048 + 44) <= 2)
              goto LABEL_165;
          }
          else
          {
            v115 = CFSTR("%@ is a built in app and cannot be uninstalled (The device doesn't allow internal security policy)");
          }
LABEL_164:
          v154 = v71;
          MOLogWrite(v114, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", v115);
LABEL_165:
          v101 = 0;
          goto LABEL_166;
        }
        v104 = (id *)(v224 + 5);
        v201 = (id)v224[5];
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v71, 2, &v201));
        objc_storeStrong(v104, v201);
        if (v105)
        {
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
          v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "systemAppBundleIDToInfoMap"));
          v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectForKeyedSubscript:", v71));

          if (v110)
          {
            v111 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "systemAppBundleIDToInfoMap"));
            v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectForKeyedSubscript:", v71));
            goto LABEL_133;
          }
          v117 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
          v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "internalAppBundleIDToInfoMap"));
          v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "objectForKeyedSubscript:", v71));

          if (v119)
          {
            v111 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "internalAppBundleIDToInfoMap"));
            v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectForKeyedSubscript:", v71));
            goto LABEL_133;
          }
          v120 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
          v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "coreServicesAppBundleIDToInfoMap"));
          v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "objectForKeyedSubscript:", v71));

          if (v122)
          {
            v111 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
            v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "coreServicesAppBundleIDToInfoMap"));
            v113 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "objectForKeyedSubscript:", v71));
LABEL_133:
            v123 = (void *)v113;

          }
          else
          {
            v123 = 0;
          }
          v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL"), v154));
          objc_opt_class(NSURL);
          v125 = v124;
          if ((objc_opt_isKindOfClass(v125) & 1) != 0)
            v126 = v125;
          else
            v126 = 0;

          if (!v126)
          {
            _MILogTransactionStep(v84, 2, 0, v71, v68, 0, v127, v128, (uint64_t)v154);

            goto LABEL_162;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v163, "setObject:forKeyedSubscript:", v126, v71);
          v129 = qword_10009E048;
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
          {
            v154 = v71;
            v155 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "path"));
            MOLogWrite(v129, 5, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Will uninstall upgrade for built-in app %@ (%@)"));

          }
LABEL_142:
          if (!v164 || !objc_msgSend(v164, "containsObject:", v71))
          {
            v105 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v176, "objectForKeyedSubscript:", v71, v154));
            LOBYTE(v196) = 0;
            v130 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v163, "objectForKeyedSubscript:", v71));
            v131 = v130 == 0;

            v200 = 0;
            v155 = (__CFString *)&v200;
            v132 = (void *)objc_claimAutoreleasedReturnValue(-[MIUninstaller _uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:](self, "_uninstallBundleWithIdentity:linkedToChildren:waitForDeletion:uninstallReason:temporaryReference:deleteDataContainers:wasLastReference:error:", v63, v105, v160, v161, v162, v131));
            v133 = (__CFString *)v200;
            _MILogTransactionStep(v84, 2, v132 != 0, v71, v68, 0, v134, v135, (uint64_t)&v196);
            if (v132)
              goto LABEL_148;
            v137 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v133, "domain"));
            if (objc_msgSend(v137, "isEqualToString:", v159)
              && -[__CFString code](v133, "code") == (id)26)
            {

LABEL_156:
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v153 = v63;
                v155 = v133;
                MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Failed to uninstall %@; will attempt to unregister the existing record. Error: %@"));
              }
              v136 = objc_opt_new(MIUninstallRecord);
              v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "bundleID"));
              -[MIUninstallRecord setBundleIdentifier:](v136, "setBundleIdentifier:", v140);

              -[MIUninstallRecord setIsLastReference:](v136, "setIsLastReference:", 1);
              -[MIUninstallRecord setHasParallelPlaceholder:](v136, "setHasParallelPlaceholder:", 1);
              -[MIUninstallRecord setDoesNotHaveBundleContainer:](v136, "setDoesNotHaveBundleContainer:", 1);
              -[NSMutableArray addObject:](v166, "addObject:", v136);
LABEL_160:

            }
            else
            {
              v138 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString domain](v133, "domain"));
              if ((objc_msgSend(v138, "isEqualToString:", v169) & 1) != 0)
              {
                v139 = -[__CFString code](v133, "code") == (id)21;

                if (v139)
                  goto LABEL_156;
              }
              else
              {

              }
              v141 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v63;
                *(_WORD *)&buf[22] = 2112;
                v230 = v133;
                _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Failed to uninstall %@ : %@", buf, 0x20u);
              }

              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v153 = v63;
                v155 = v133;
                MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("Failed to uninstall %@ : %@"));
              }
LABEL_148:
              -[NSMutableArray addObjectsFromArray:](v166, "addObjectsFromArray:", v132, v153);
              if ((_BYTE)v196)
              {
                v136 = (MIUninstallRecord *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v175, "objectForKeyedSubscript:", v71));
                if (v136)
                  objc_msgSend(v184, "unlinkChild:fromParent:error:", v71, v136, 0);
                goto LABEL_160;
              }
            }

LABEL_162:
            goto LABEL_167;
          }
          v114 = qword_10009E048;
          if (qword_10009E048)
          {
            v115 = CFSTR("%@ is not allowed to be deleted");
            if (*(int *)(qword_10009E048 + 44) < 3)
              goto LABEL_165;
          }
          else
          {
            v115 = CFSTR("%@ is not allowed to be deleted");
          }
          goto LABEL_164;
        }
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v154 = v71;
          MOLogWrite(qword_10009E048, 3, "-[MIUninstaller performUninstallationByRevokingTemporaryReference:error:]", CFSTR("%@ is a built in app and cannot be uninstalled"));
        }
        _MILogTransactionStep(v84, 2, 0, v71, v68, 0, v106, v107, (uint64_t)v154);
LABEL_167:

      }
      v58 = v174;
      v59 = objc_msgSend(v174, "countByEnumeratingWithState:objects:count:", &v207, v231, 16);
    }
    while (v59);
  }

  -[MIUninstaller _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("GeneratingApplicationMap"), 90);
  sub_10004E89C(v158);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v230) = 0;
  v196 = 0;
  v197 = &v196;
  v198 = 0x2020000000;
  v199 = 0;
  v142 = sub_10000B610();
  v143 = objc_claimAutoreleasedReturnValue(v142);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000342F0;
  block[3] = &unk_100085760;
  v144 = v166;
  v189 = v144;
  v193 = &v223;
  v194 = &v196;
  v190 = v163;
  v191 = self;
  v192 = v172;
  v195 = buf;
  dispatch_sync(v143, block);

  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {

    _Block_object_dispose(&v196, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v145 = *((_BYTE *)v197 + 24) == 0;

    _Block_object_dispose(&v196, 8);
    _Block_object_dispose(buf, 8);
    if (v145)
    {
      v148 = (NSArray *)objc_claimAutoreleasedReturnValue(+[MIUninstallRecord uninstallRecordArrayToICLUninstallRecordArray:](MIUninstallRecord, "uninstallRecordArrayToICLUninstallRecordArray:", v144));
      receipt = self->_receipt;
      self->_receipt = v148;

      v146 = 1;
      goto LABEL_184;
    }
  }
  v4 = v164;
LABEL_182:

  v146 = 0;
  if (a4)
    *a4 = objc_retainAutorelease((id)v224[5]);
LABEL_184:

  _Block_object_dispose(&v223, 8);
  return v146;
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (NSArray)identities
{
  return self->_identities;
}

- (NSDictionary)options
{
  return self->_options;
}

- (MIClientConnection)client
{
  return self->_client;
}

- (unsigned)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(unsigned int)a3
{
  self->_percentComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_identities, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
}

@end
