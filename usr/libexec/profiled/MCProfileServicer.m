@implementation MCProfileServicer

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_xpcConnection);
}

- (id)remoteProcessBundleID
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "auditToken");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }

  v4 = MCBundleIDFromAuditToken(&v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    v6 = _MCLogObjects[2];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "The process XPC-ing to profiled is missing an application-identifier entitlement. Check client logs from the ManagedConfiguration framework for a log fault.", v8, 2u);
    }
  }
  return v5;
}

- (id)remoteProcessEntitlementStringArrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", v4));

  if (v6 && (v7 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v12);
          v14 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
          {

            v15 = 0;
            goto LABEL_14;
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }

    v15 = v8;
LABEL_14:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  void *v14;
  int v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessEntitlementStringArrayForKey:](self, "remoteProcessEntitlementStringArrayForKey:", v7));
    v10 = v9;
    if (v8)
    {
      v11 = objc_msgSend(v9, "containsObject:", v8);
    }
    else if (v9)
    {
      v12 = _MCLogObjects[2];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543362;
        v16 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No containing string demanded from process with array entitlement %{public}@. Granting entitlement since array is present.", (uint8_t *)&v15, 0xCu);
      }
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCProfileServicer.m"), 252, CFSTR("Improper use. No array entitlement demanded from process."));

    v11 = 0;
  }

  return v11;
}

- (BOOL)remoteProcessHasEntitlementArray:(id)a3 containingString:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  if (!-[MCProfileServicer remoteProcessHasEntitlementArray:containingString:](self, "remoteProcessHasEntitlementArray:containingString:", v8, v9)&& !-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.managedconfiguration.profiled-access")))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksArrayEntitlementError:withMemberString:](self, "lacksArrayEntitlementError:withMemberString:", v8, v9));
    v11 = 0;
    if (!a5)
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = 0;
  v11 = 1;
  if (a5)
LABEL_4:
    *a5 = objc_retainAutorelease(v10);
LABEL_5:

  return v11;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MCProfileServicer.m"), 215, CFSTR("Improper use. Entitlement required for call"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", v5));

  v9 = 0;
  if (v7)
  {
    v8 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
      v9 = 1;
  }

  return v9;
}

- (void)setParametersForSettingsByType:(id)a3 configurationUUID:(id)a4 toSystem:(BOOL)a5 user:(BOOL)a6 passcode:(id)a7 credentialSet:(id)a8 completion:(id)a9
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, id);
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  id v52;
  unsigned int v53;
  void (**v54)(id, id);
  id v55;
  id v56;
  id v57;
  id v58;
  _BOOL4 v59;
  id v60;
  MCProfileServicer *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];

  v59 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  v18 = (void (**)(id, id))a9;
  v74 = 0;
  LOBYTE(a8) = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("UserSettings"), &v74);
  v60 = v74;
  if ((a8 & 1) != 0)
    goto LABEL_2;
  v61 = self;
  v53 = v11;
  v55 = v17;
  v56 = v16;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v71;
    v57 = v14;
    v54 = v18;
    while (2)
    {
      v30 = 0;
      v52 = v28;
      do
      {
        if (*(_QWORD *)v71 != v29)
          objc_enumerationMutation(v26);
        v31 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v30);
        v32 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v31, v32) & 1) == 0)
        {
LABEL_30:

          v18 = v54;
          goto LABEL_31;
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v31));
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v34 = v33;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v67;
          while (2)
          {
            for (i = 0; i != v36; i = (char *)i + 1)
            {
              if (*(_QWORD *)v67 != v37)
                objc_enumerationMutation(v34);
              v39 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
              v40 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v39, v40) & 1) == 0)
              {

                v14 = v57;
                goto LABEL_30;
              }
              objc_msgSend(v25, "addObject:", v39);
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
            if (v36)
              continue;
            break;
          }
        }

        v30 = (char *)v30 + 1;
        v14 = v57;
      }
      while (v30 != v52);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
      v18 = v54;
      if (v28)
        continue;
      break;
    }
  }

  if (objc_msgSend(v25, "count"))
  {
    v58 = v14;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v41 = v25;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
    if (!v42)
    {
LABEL_28:

      v14 = v58;
      v17 = v55;
      v16 = v56;
      v11 = v53;
      self = v61;
LABEL_2:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
      v20 = objc_msgSend(v19, "processIdentifier");

      v21 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
      LODWORD(v51) = v20;
      objc_msgSend(v21, "setParametersForSettingsByType:configurationUUID:toSystem:user:passcode:credentialSet:senderPID:sender:completion:", v14, v15, v11, v59, v16, v17, v51, v22, v18);

      v23 = 0;
      v24 = v60;
      goto LABEL_34;
    }
    v43 = v42;
    v44 = *(_QWORD *)v63;
LABEL_22:
    v45 = 0;
    while (1)
    {
      if (*(_QWORD *)v63 != v44)
        objc_enumerationMutation(v41);
      v46 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v45);
      v47 = objc_autoreleasePoolPush();
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.managedconfiguration.feature-setting."), v46));
      if (!-[MCProfileServicer remoteProcessHasBooleanEntitlement:](v61, "remoteProcessHasBooleanEntitlement:", v23))
        break;

      objc_autoreleasePoolPop(v47);
      if (v43 == (id)++v45)
      {
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v62, v79, 16);
        if (v43)
          goto LABEL_22;
        goto LABEL_28;
      }
    }
    v48 = (void *)_MCLogObjects[0];
    if (os_log_type_enabled((os_log_t)_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v49 = v48;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](v61, "remoteProcessBundleID"));
      *(_DWORD *)buf = 138543618;
      v76 = v50;
      v77 = 2114;
      v78 = v23;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Process %{public}@ needs the entitlement “%{public}@”", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v47);

    v14 = v58;
    v17 = v55;
    if (!v23)
      goto LABEL_32;
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksBooleanEntitlementError:](v61, "lacksBooleanEntitlementError:", v23));
    v16 = v56;
    v24 = v60;
    if (v18)
      goto LABEL_33;
  }
  else
  {
LABEL_31:

    v17 = v55;
LABEL_32:
    v24 = v60;
    v21 = v60;
    v23 = 0;
    v16 = v56;
    if (v18)
LABEL_33:
      v18[2](v18, v21);
  }
LABEL_34:

}

- (void)checkInWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectionTracker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  objc_msgSend(v6, "trackRequestFromPID:", objc_msgSend(v7, "processIdentifier"));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v8, "checkInWithCompletion:", v4);

}

- (void)checkCarrierProfileAndForceReinstallation:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v6, "checkCarrierProfileAndForceReinstallation:completion:", v4, v5);

}

- (void)waitForMigrationIncludingPostRestoreMigration:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v6, "waitForMigrationIncludingPostRestoreMigration:completion:", v4, v5);

}

- (void)notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v4, "notifyDeviceUnlockedAndPasscodeRequiredWithCompletion:", v3);

}

- (void)notifyDeviceUnlockedWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v4, "notifyDeviceUnlockedWithCompletion:", v3);

}

- (void)allowedOpenInAppBundleIDs:(id)a3 originatingAppBundleID:(id)a4 originatingIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v12, "allowedOpenInAppBundleIDs:originatingAppBundleID:originatingIsManaged:completion:", v11, v10, v6, v9);

}

- (void)allowedImportFromAppBundleIDs:(id)a3 importingAppBundleID:(id)a4 importingIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v12, "allowedImportFromAppBundleIDs:importingAppBundleID:importingIsManaged:completion:", v11, v10, v6, v9);

}

- (void)defaultAppBundleIDForCommunicationServiceType:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v10, "defaultAppBundleIDForCommunicationServiceType:forAccountWithIdentifier:completion:", v9, v8, v7);

}

- (void)setAutoCorrectionAllowed:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = objc_msgSend(v7, "processIdentifier");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v10, "setAutoCorrectionAllowed:senderPID:sender:completion:", v4, v8, v9, v6);

}

- (void)setSmartPunctuationAllowed:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = objc_msgSend(v7, "processIdentifier");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v10, "setSmartPunctuationAllowed:senderPID:sender:completion:", v4, v8, v9, v6);

}

- (void)setPredictiveKeyboardAllowed:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = objc_msgSend(v7, "processIdentifier");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v10, "setPredictiveKeyboardAllowed:senderPID:sender:completion:", v4, v8, v9, v6);

}

- (void)setContinuousPathKeyboardAllowed:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = objc_msgSend(v7, "processIdentifier");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v10, "setContinuousPathKeyboardAllowed:senderPID:sender:completion:", v4, v8, v9, v6);

}

- (void)setKeyboardShortcutsAllowed:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = objc_msgSend(v7, "processIdentifier");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v10, "setKeyboardShortcutsAllowed:senderPID:sender:completion:", v4, v8, v9, v6);

}

- (void)setSpellCheckAllowed:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = objc_msgSend(v7, "processIdentifier");

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v10, "setSpellCheckAllowed:senderPID:sender:completion:", v4, v8, v9, v6);

}

- (void)setAllowedURLStrings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v9 = objc_msgSend(v8, "processIdentifier");

  v11 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
  objc_msgSend(v11, "setAllowedURLStrings:senderPID:sender:completion:", v7, v9, v10, v6);

}

- (id)lacksBooleanEntitlementError:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = MCXPCErrorDomain;
  v4 = MCErrorArray(CFSTR("XPC_ERROR_LACKS_ENTITLEMENT_CODE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v3, 39000, v5, MCErrorTypeFatal, a3, 0));

  return v6;
}

- (id)lacksArrayEntitlementError:(id)a3 withMemberString:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = MCXPCErrorDomain;
  v5 = MCErrorArray(CFSTR("XPC_ERROR_LACKS_ARRAY_ENTITLEMENT_WITH_STRING"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 39000, v6, MCErrorTypeFatal, a3, a4, 0));

  return v7;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (!-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", v6)
    && !-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.managedconfiguration.profiled-access")))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksBooleanEntitlementError:](self, "lacksBooleanEntitlementError:", v6));
    v8 = 0;
    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  v7 = 0;
  v8 = 1;
  if (a4)
LABEL_4:
    *a4 = objc_retainAutorelease(v7);
LABEL_5:

  return v8;
}

- (void)verifiedMDMProfileIdentifierWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id, _QWORD))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled-access"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "verifiedMDMProfileIdentifierWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6, 0);
  }

}

- (void)isProfileInstalledWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  if (-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.managedconfiguration.profiled.profile-list-read")))
  {
    v8 = 0;
  }
  else
  {
    v13 = 0;
    v9 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("Inspection"), &v13);
    v8 = v13;
    if ((v9 & 1) == 0)
    {
      if (v7)
        v7[2](v7, v8, 0);
      goto LABEL_11;
    }
  }
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allInstalledProfileIdentifiers"));
    v12 = objc_msgSend(v11, "containsObject:", v6);

    if (!v7)
      goto LABEL_11;
    goto LABEL_8;
  }
  v12 = 0;
  if (v7)
LABEL_8:
    ((void (**)(id, id, id))v7)[2](v7, 0, v12);
LABEL_11:

}

- (void)installProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  MCInteractionClient *v27;
  void *v28;
  MCInteractionClient *v29;
  void *v30;
  void *v31;
  uint8_t buf[8];
  id v33;
  void *v34;
  void *v35;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  if (v8)
  {
    v35 = 0;
    v13 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("CustomUIInstallation"), &v35);
    v14 = v35;
  }
  else
  {
    v34 = 0;
    v13 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("SilentNonUIInstallation"), &v34);
    v14 = v34;
  }
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", kMCInstallProfileOptionFilterFlag));
    v17 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0 && objc_msgSend(v16, "integerValue") == (id)2)
    {
      v33 = v15;
      v18 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("CarrierInstallation"), &v33);
      v19 = v33;

      if ((v18 & 1) == 0)
      {
        if (v12)
          v12[2](v12, 0, v19);
LABEL_21:

        v15 = v19;
        goto LABEL_22;
      }
    }
    else
    {
      v19 = v15;
    }
    v20 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    v31 = v16;
    v22 = v10;
    v23 = v19;
    if (v21)
    {
      v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v20);
      objc_msgSend(v24, "setObject:forKey:", v21, kMCInstallProfileOptionInstalledBy);
      v25 = objc_msgSend(v24, "copy");

      v20 = v25;
    }
    else
    {
      v26 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process. Not marking profile's installer.", buf, 2u);
      }
    }
    if (v8)
    {
      v27 = [MCInteractionClient alloc];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
      v29 = -[MCInteractionClient initWithXPCClientConnection:](v27, "initWithXPCClientConnection:", v28);

    }
    else
    {
      v29 = 0;
    }
    v19 = v23;
    v10 = v22;
    v16 = v31;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v30, "installProfileData:interactionClient:options:source:completion:", v10, v29, v20, v21, v12);

    goto LABEL_21;
  }
  if (v12)
    v12[2](v12, 0, v15);
LABEL_22:

}

- (void)appleConnect_installMDMAssociatedProfileData:(id)a3 interactive:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  os_log_t v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  v13 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    *(_DWORD *)buf = 138543362;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AppleConnect installing MDM associated profile data from process: %{public}@", buf, 0xCu);

  }
  v22 = 0;
  v16 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("AppleConnectMDMInstallation"), &v22);
  v17 = v22;
  if ((v16 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DMCPersonaHelper enterprisePersonaIdentifier](DMCPersonaHelper, "enterprisePersonaIdentifier"));
    v19 = _MCLogObjects[0];
    if (v18)
    {
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "AppleConnect adding enterprise persona ID to MDM associated profile data", buf, 2u);
      }
      v20 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", v11);
      objc_msgSend(v20, "setObject:forKey:", v18, kMCInstallProfileOptionPersonaID);
      v21 = objc_msgSend(v20, "copy");

      v11 = v21;
    }
    else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "AppleConnect missing enterprise persona ID when installing MDM associated profile data", buf, 2u);
    }
    -[MCProfileServicer installProfileData:interactive:options:completion:](self, "installProfileData:interactive:options:completion:", v10, v8, v11, v12);

  }
  else if (v12)
  {
    v12[2](v12, 0, v17);
  }

}

- (void)queueProfileDataForInstallation:(id)a3 originalFileName:(id)a4 originatingBundleID:(id)a5 transitionToUI:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, uint64_t, id);
  id v16;
  unsigned __int8 v17;
  void *v18;
  id v19;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, uint64_t, id))a7;
  if (-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.managedconfiguration.vpn-profile-access")))
  {
    v16 = 0;
LABEL_4:
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v18, "queueProfileDataForInstallation:originalFileName:originatingBundleID:transitionToUI:completion:", v12, v13, v14, v8, v15);

    goto LABEL_5;
  }
  v19 = 0;
  v17 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("UIInstallation"), &v19);
  v16 = v19;
  if ((v17 & 1) != 0)
    goto LABEL_4;
  if (v15)
    v15[2](v15, 0, 99, v16);
LABEL_5:

}

- (void)popProfileDataFromHeadOfInstallationQueueWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("PopInstallationQueue"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "popProfileDataFromHeadOfInstallationQueueWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)peekProfileDataFromPurgatoryForDeviceType:(unint64_t)a3 withCompletion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = (void (**)(id, _QWORD, id))a4;
  v13 = 0;
  v7 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("PopInstallationQueue"), &v13);
  v8 = v13;
  if (a3 >= 8 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    v11 = objc_claimAutoreleasedReturnValue(-[MCProfileServicer _invalidValue:forArgument:](self, "_invalidValue:forArgument:", v10, CFSTR("MCProfileTargetDeviceType")));

    v8 = (id)v11;
  }
  else if ((v7 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v12, "peekProfileDataFromPurgatoryForDeviceType:withCompletion:", a3, v6);

    goto LABEL_8;
  }
  if (v6)
    v6[2](v6, 0, v8);
LABEL_8:

}

- (void)updateProfileIdentifier:(id)a3 interactive:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  unsigned __int8 v10;
  id v11;
  MCInteractionClient *v12;
  void *v13;
  MCInteractionClient *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  if (v6)
  {
    v19 = 0;
    v10 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("CustomUIInstallation"), &v19);
    v11 = v19;
    if ((v10 & 1) != 0)
    {
      v12 = [MCInteractionClient alloc];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
      v14 = -[MCInteractionClient initWithXPCClientConnection:](v12, "initWithXPCClientConnection:", v13);

LABEL_6:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
      objc_msgSend(v16, "updateProfileIdentifier:interactionClient:source:completion:", v8, v14, v17, v9);

      goto LABEL_9;
    }
  }
  else
  {
    v18 = 0;
    v15 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("SilentNonUIInstallation"), &v18);
    v11 = v18;
    if ((v15 & 1) != 0)
    {
      v14 = 0;
      goto LABEL_6;
    }
  }
  if (v9)
    v9[2](v9, 0, v11);
LABEL_9:

}

- (id)_invalidValue:(id)a3 forArgument:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = MCProfileRemovalErrorDomain;
  v5 = MCErrorArray(CFSTR("ERROR_PROFILE_REMOVAL_INVALID_ARGUMENT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v4, 1010, v6, MCErrorTypeFatal, a4, a3, 0));

  return v7;
}

- (void)removeProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  unsigned int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v19 = 0;
  v10 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:](self, "remoteProcessCanRemoveProfilesOutError:", &v19);
  v11 = v19;
  if (v10)
  {
    if (-[MCProfileServicer isCloudLockedProfileWithIdentifier:](self, "isCloudLockedProfileWithIdentifier:", v8))
    {
      v12 = MCProfileRemovalErrorDomain;
      v13 = MCErrorArray(CFSTR("ERROR_PROFILE_REMOVAL_PROFILE_PROTECTED"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v12, 52000, v14, MCErrorTypeFatal, 0));
    }
    else
    {
      if ((unint64_t)a4 < 3)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
        objc_msgSend(v16, "removeProfileWithIdentifier:installationType:source:completion:", v8, a4, v17, v9);

        goto LABEL_10;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
      v15 = objc_claimAutoreleasedReturnValue(-[MCProfileServicer _invalidValue:forArgument:](self, "_invalidValue:forArgument:", v18, CFSTR("MCProfileInstallationType")));

      v11 = (id)v18;
    }

    v11 = (id)v15;
  }
  if (v9)
    v9[2](v9, v11);
LABEL_10:

}

- (void)removeUninstalledProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 targetDeviceType:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, id);
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;

  v10 = a3;
  v11 = (void (**)(id, id))a6;
  v20 = 0;
  v12 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:](self, "remoteProcessCanRemoveProfilesOutError:", &v20);
  v13 = v20;
  if ((unint64_t)a4 >= 3 && v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    v16 = CFSTR("MCProfileInstallationType");
LABEL_8:
    v18 = objc_claimAutoreleasedReturnValue(-[MCProfileServicer _invalidValue:forArgument:](self, "_invalidValue:forArgument:", v15, v16));

    v13 = (id)v18;
    goto LABEL_9;
  }
  v17 = v12 ^ 1;
  if (a5 < 8)
    v17 = 1;
  if ((v17 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
    v16 = CFSTR("MCProfileTargetDeviceType");
    goto LABEL_8;
  }
  if (v12)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v19, "removeUninstalledProfileWithIdentifier:installationType:targetDeviceType:completion:", v10, a4, a5, v11);

    goto LABEL_13;
  }
LABEL_9:
  if (v11)
    v11[2](v11, v13);
LABEL_13:

}

- (void)removeProtectedProfileWithIdentifier:(id)a3 installationType:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  unsigned int v10;
  id v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v19 = 0;
  v10 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:](self, "remoteProcessCanRemoveProfilesOutError:", &v19);
  v11 = v19;
  if (v10)
  {
    v12 = -[MCProfileServicer isCloudLockedProfileWithIdentifier:](self, "isCloudLockedProfileWithIdentifier:", v8);
    v13 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:](self, "remoteProcessHasEntitlementArray:containingString:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("CloudLockedRemoval"));
    if (!v12 || (v13 & 1) != 0)
    {
      if ((unint64_t)a4 < 3)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
        objc_msgSend(v15, "removeProfileWithIdentifier:installationType:source:completion:", v8, a4, v16, v9);

        goto LABEL_11;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
      v14 = objc_claimAutoreleasedReturnValue(-[MCProfileServicer _invalidValue:forArgument:](self, "_invalidValue:forArgument:", v18, CFSTR("MCProfileInstallationType")));

      v11 = v17;
    }
    else
    {
      v14 = objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksArrayEntitlementError:withMemberString:](self, "lacksArrayEntitlementError:withMemberString:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("CloudLockedRemoval")));
    }

    v11 = (id)v14;
  }
  if (v9)
    v9[2](v9, v11);
LABEL_11:

}

- (void)removePostSetupAutoInstallSetAsideProfileWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessCanRemoveProfilesOutError:](self, "remoteProcessCanRemoveProfilesOutError:", &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "removePostSetupAutoInstallSetAsideProfileWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)removeSetAsideCloudConfigurationProfileWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("CloudConfiguration"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "removeSetAsideCloudConfigurationProfileWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (BOOL)isCloudLockedProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installedProfileWithIdentifier:", v3));

  v6 = objc_opt_class(MCConfigurationProfile);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "isCloudLocked");
  else
    v7 = 0;

  return v7;
}

- (BOOL)remoteProcessCanRemoveProfilesOutError:(id *)a3
{
  unsigned __int8 v5;

  v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.managedconfiguration.vpn-profile-access"));
  return v5 | -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("Removal"), a3);
}

- (void)applyRestrictionDictionary:(id)a3 overrideRestrictions:(BOOL)a4 appsAndOptions:(id)a5 clientType:(id)a6 clientUUID:(id)a7 localizedClientDescription:(id)a8 localizedWarningMessage:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;

  v26 = a4;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v27 = 0;
  v22 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("ClientRestrictions"), &v27);
  v23 = v27;
  if ((v22 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v24, "applyRestrictionDictionary:overrideRestrictions:appsAndOptions:clientType:clientUUID:sender:localizedClientDescription:localizedWarningMessage:completion:", v15, v26, v16, v17, v18, v25, v19, v20, v21);

  }
  else if (v21)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v21 + 2))(v21, 0, 0, v23);
  }

}

- (void)clearRecoveryPasscodeWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void (**)(id, id))a3;
  v9 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("Passcode"), &v9);
  v6 = v9;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v7, "clearRecoveryPasscodeWithSenderBundleID:completion:", v8, v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)changePasscode:(id)a3 oldPasscode:(id)a4 isRecovery:(BOOL)a5 skipRecovery:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, _QWORD, id);
  unsigned __int8 v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, _QWORD, id))a7;
  v19 = 0;
  v15 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("Passcode"), &v19);
  v16 = v19;
  if ((v15 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    if (v9)
      objc_msgSend(v17, "changePasscode:recoveryPasscode:skipRecovery:senderBundleID:completion:", v12, v13, v8, v18, v14);
    else
      objc_msgSend(v17, "changePasscode:oldPasscode:skipRecovery:senderBundleID:completion:", v12, v13, v8, v18, v14);

  }
  else if (v14)
  {
    v14[2](v14, 0, v16);
  }

}

- (void)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v15 = 0;
  v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("Passcode"), &v15);
  v12 = v15;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v13, "clearPasscodeWithEscrowKeybagData:secret:senderBundleID:completion:", v8, v9, v14, v10);

  }
  else if (v10)
  {
    v10[2](v10, v12);
  }

}

- (void)isPasscodeCompliantWithNamedPolicy:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("PasscodeCompliance"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "isPasscodeCompliantWithNamedPolicy:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }

}

- (void)resetPasscodeMetadataWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("PasscodeMetadata"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "resetPasscodeMetadataWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)removeOrphanedClientRestrictionsWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("ClientRestrictions"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "removeOrphanedClientRestrictionsWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)managedSystemConfigurationServiceIDsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("NetworkExtension"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "managedSystemConfigurationServiceIDsWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)managedWiFiNetworkNamesWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("WiFiNetworks"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "managedWiFiNetworkNamesWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)migrateWithContext:(int)a3 passcodeWasSetInBackup:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  void (**v8)(id, id);
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v8 = (void (**)(id, id))a5;
  v12 = 0;
  v9 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.migration"), &v12);
  v10 = v12;
  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v11, "migrateWithContext:passcodeWasSetInBackup:completion:", v6, v5, v8);

  }
  else if (v8)
  {
    v8[2](v8, v10);
  }

}

- (void)migrateCleanupMigratorWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4;
  void (**v6)(id, id);
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a3;
  v6 = (void (**)(id, id))a4;
  v10 = 0;
  v7 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.migration"), &v10);
  v8 = v10;
  if ((v7 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v9, "migrateCleanupMigratorWithContext:completion:", v4, v6);

  }
  else if (v6)
  {
    v6[2](v6, v8);
  }

}

- (void)removeBoolSetting:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v12 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("UserSettings"), &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v10, "removeBoolSetting:sender:completion:", v6, v11, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)removeValueSetting:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v12 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("UserSettings"), &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v10, "removeValueSetting:sender:completion:", v6, v11, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)openSensitiveURL:(id)a3 unlock:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  v14 = 0;
  v10 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled-access"), &v14);
  v11 = v14;
  if ((v10 & 1) != 0)
  {
    if (-[MCProfileServicer remoteProcessHasBooleanEntitlement:](self, "remoteProcessHasBooleanEntitlement:", CFSTR("com.apple.springboard.opensensitiveurl")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
      objc_msgSend(v12, "openSensitiveURL:unlock:completion:", v8, v6, v9);

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer lacksBooleanEntitlementError:](self, "lacksBooleanEntitlementError:", CFSTR("com.apple.springboard.opensensitiveurl")));
      if (v9)
        v9[2](v9, v13);

    }
  }
  else if (v9)
  {
    v9[2](v9, v11);
  }

}

- (void)storeCertificateData:(id)a3 forIPCUIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  unsigned __int8 v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v14 = 0;
  v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("Certificates"), &v14);
  v12 = v14;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v13, "storeCertificateData:forIPCUIdentifier:completion:", v8, v9, v10);

  }
  else if (v10)
  {
    v10[2](v10, v12);
  }

}

- (void)installProvisioningProfileData:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  unsigned __int8 v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v14 = 0;
  v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.provisioningprofiles"), CFSTR("Installation"), &v14);
  v12 = v14;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v13, "installProvisioningProfileData:managingProfileIdentifier:completion:", v8, v9, v10);

  }
  else if (v10)
  {
    v10[2](v10, v12);
  }

}

- (void)removeProvisioningProfileWithUUID:(id)a3 managingProfileIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v15 = 0;
  v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.provisioningprofiles"), CFSTR("Removal"), &v15);
  v12 = v15;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v13, "removeProvisioningProfileWithUUID:managingProfileIdentifier:sender:completion:", v8, v9, v14, v10);

  }
  else if (v10)
  {
    v10[2](v10, 0, v12);
  }

}

- (void)addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v12 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.provisioningprofiles"), CFSTR("AddTrusted"), &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v10, "addTrustedCodeSigningIdentitiesForProvisioningProfileUUID:sender:completion:", v6, v11, v7);

  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }

}

- (void)isBundleBlocked:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, id, id, _QWORD);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, id, id, id, _QWORD))a4;
  v16 = 0;
  v8 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled-access"), &v16);
  v9 = v16;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v14 = 0;
    v15 = 0;
    v11 = objc_msgSend(v10, "isBundleBlocked:outHash:outHashType:", v6, &v15, &v14);
    v12 = v15;
    v13 = v14;
    v7[2](v7, v11, v12, v13, 0);

  }
  else if (v7)
  {
    ((void (**)(id, id, id, id, id))v7)[2](v7, 0, 0, 0, v9);
  }

}

- (void)areBundlesBlocked:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void (**v23)(id, _QWORD, id);
  id v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v37 = 0;
  LOBYTE(a4) = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled-access"), &v37);
  v8 = v37;
  v9 = v8;
  if ((a4 & 1) != 0)
  {
    v22 = v8;
    v23 = v7;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v29 = objc_opt_new(NSMutableDictionary);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v6;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v10)
    {
      v11 = v10;
      v28 = *(_QWORD *)v34;
      v12 = kMCMISIsBlockedKey;
      v27 = kMCMISHashKey;
      v26 = kMCMISHashTypeKey;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v31 = 0;
          v32 = 0;
          v15 = objc_msgSend(v30, "isBundleBlocked:outHash:outHashType:", v14, &v32, &v31);
          v16 = v32;
          v17 = v31;
          v18 = objc_alloc((Class)NSMutableDictionary);
          v38 = v12;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
          v39 = v19;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
          v21 = objc_msgSend(v18, "initWithDictionary:", v20);

          if (v16)
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, v27);
          if (v17)
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, v26);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v21, v14);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v11);
    }

    v7 = v23;
    ((void (**)(id, NSMutableDictionary *, id))v23)[2](v23, v29, 0);

    v6 = v24;
    v9 = v22;
  }
  else if (v7)
  {
    v7[2](v7, 0, v8);
  }

}

- (void)notifyStartComplianceTimer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.usercompliance"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "notifyStartComplianceTimer:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)notifyHaveSeenComplianceMessageWithLastLockDate:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.usercompliance"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "notifyHaveSeenComplianceMessageWithLastLockDate:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)recomputeUserComplianceWarningWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.usercompliance"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "recomputeUserComplianceWarningWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)recomputePerClientUserComplianceWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.usercompliance"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "recomputePerClientUserComplianceWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)resetAllSettingsToDefaultsIsUserInitiated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, id);
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = (void (**)(id, id))a4;
  v11 = 0;
  v7 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("UserSettings"), &v11);
  v8 = v11;
  if ((v7 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v9, "resetAllSettingsToDefaultsIsUserInitiated:sender:completion:", v4, v10, v6);

  }
  else if (v6)
  {
    v6[2](v6, v8);
  }

}

- (void)setUserInfo:(id)a3 forClientUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v15 = 0;
  v11 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("ClientRestrictions"), &v15);
  v12 = v15;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v13, "setUserInfo:forClientUUID:sender:completion:", v8, v9, v14, v10);

  }
  else if (v10)
  {
    v10[2](v10, v12);
  }

}

- (void)removeExpiredProfilesWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.provisioningprofiles"), CFSTR("Removal"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "removeExpiredProfilesWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)storeProfileData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("DEPInstallation"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "storeProfileData:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)storedProfileDataWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("DEPInstallation"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "storedProfileDataWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)markStoredProfileAsInstalledWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("DEPInstallation"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "markStoredProfileAsInstalledWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)rereadManagedAppAttributesWithCompletion:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("ManagedApplications"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "rereadManagedAppAttributesWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)reducedMachineInfoDataWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("MachineInfo"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "reducedMachineInfoDataWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)cloudConfigurationMachineInfoDataWithAdditionalInfo:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("MachineInfo"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "cloudConfigurationMachineInfoDataWithAdditionalInfo:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, 0, v9);
  }

}

- (void)cloudConfigurationStoreDetails:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("CloudConfiguration"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "cloudConfigurationStoreDetails:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  unsigned __int8 v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[8];
  id v11;

  v4 = (void (**)(id, void *))a3;
  v11 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("CloudConfiguration"), &v11);
  v6 = v11;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v8, "restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:", v4);

  }
  else if (v6)
  {
    v9 = _MCLogObjects[2];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Remote process doesn't have the right entitlment!", v10, 2u);
    }
    if (v4)
      v4[2](v4, v7);
  }

}

- (void)createActivationLockBypassCodeWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("ActivationLock"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "createActivationLockBypassCodeWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)storeActivationRecord:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("ActivationRecord"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "storeActivationRecord:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)setUserBookmarks:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v14 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("Safari"), &v14);
  v9 = v14;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
    v11 = objc_msgSend(v10, "processIdentifier");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    objc_msgSend(v12, "setUserBookmarks:senderPID:sender:completion:", v6, v11, v13, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:(id)a3 hostAppBundleID:(id)a4 accountIsManaged:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  _QWORD block[4];
  id v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v24 = 0u;
  v25 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "auditToken");
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }

  v15 = MCBundleIDFromAuditToken(&v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v17, "allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:messageSendingAppBundleID:hostAppBundleID:accountIsManaged:completion:", v10, v16, v11, v7, v12);
LABEL_10:

    goto LABEL_11;
  }
  v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process. Denying access to all keyboards.", buf, 2u);
  }
  if (v12)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100056B24;
    block[3] = &unk_1000E2DA8;
    v22 = v12;
    dispatch_async(v20, block);

    v17 = v22;
    goto LABEL_10;
  }
LABEL_11:

}

- (void)hasMailAccountsWithFilteringEnabled:(BOOL)a3 sourceAccountManagement:(int)a4 completion:(id)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _OWORD v13[2];
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = a5;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "auditToken");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100056C28;
  v14[3] = &unk_1000E3DC8;
  v15 = v8;
  v13[0] = v16;
  v13[1] = v17;
  v12 = v8;
  objc_msgSend(v11, "loadMailAccountsWithAuditToken:filteringEnabled:sourceAccountManagement:completion:", v13, v6, v5, v14);

}

- (void)setupAssistantDidFinishCompletion:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL8 v16;
  uint64_t v17;
  dispatch_time_t v18;
  dispatch_queue_global_t global_queue;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  NSObject *v29;
  void **v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  char v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  int v41;

  v3 = (void (**)(id, _QWORD))a3;
  v4 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setup Assistant finished.", buf, 2u);
  }
  v5 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("profiled-SetupAssistantFinished"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MDMClient sharedClient](MDMClient, "sharedClient"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v8 = objc_msgSend(v7, "isSupervised");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = MDMFilePath(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v11, 0);

  v13 = (unint64_t)objc_msgSend(v6, "accessRights") & 4;
  v14 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v37 = v12;
    v38 = 1024;
    v39 = v8;
    v40 = 1024;
    v41 = v13 >> 2;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Buddy completed. Enrolled in MDM: %u, supervised: %u, hasPasscodeRemovalRight: %u", buf, 0x14u);
  }
  v15 = _MCLogObjects[0];
  if (v12 && v13)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scheduling token update to inform the server about the new unlock token", buf, 2u);
    }
    objc_msgSend(v6, "scheduleTokenUpdate");
  }
  else
  {
    v16 = os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO);
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Deleting any unlock token created during Buddy", buf, 2u);
    }
    v17 = MCKeybagDeleteMDMEscrowData(v16);
    MCKeybagDeleteMDMEscrowSecret(v17);
  }
  v18 = dispatch_time(0, 10000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  v20 = objc_claimAutoreleasedReturnValue(global_queue);
  v30 = _NSConcreteStackBlock;
  v31 = 3221225472;
  v32 = sub_100057028;
  v33 = &unk_1000E3DF0;
  v35 = v12;
  v21 = v5;
  v34 = v21;
  dispatch_after(v18, v20, &v30);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration", v30, v31, v32, v33));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "MAIDUsername"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v25 = objc_msgSend(v24, "hasMAIDCredential");

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration"));
  v27 = objc_msgSend(v26, "alreadySignedIntoFaceTime");

  if (v23 && v25 && (v27 & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v28, "signIntoFaceTimeWithUsername:", v23);

  }
  else
  {
    v29 = _MCLogObjects[2];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "No FT credentials provided in the DEP", buf, 2u);
    }
  }
  if (v3)
    v3[2](v3, 0);

}

- (void)validateAppBundleIDs:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v12 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.provisioningprofiles"), CFSTR("Validation"), &v12);
  v9 = v12;
  if ((v8 & 1) != 0)
  {
    v10 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Validate app bundle IDs: %{public}@", buf, 0xCu);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v11, "validateAppBundleIDs:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)recomputeProfileRestrictionsWithCompletionBlock:(id)a3
{
  void (**v4)(id, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.migration"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "recomputeProfileRestrictionsWithCompletionBlock:", v4);

  }
  else if (v4)
  {
    v4[2](v4, v6);
  }

}

- (void)shutDownWithCompletion:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id *v9;
  dispatch_queue_global_t v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD block[4];
  NSObject *v15;
  id v16;
  id v17;

  v4 = a3;
  v17 = 0;
  v5 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.shutdown"), &v17);
  v6 = v17;
  if ((v5 & 1) != 0)
  {
    xpc_transaction_exit_clean();
    if (v4)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue(global_queue);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000573E4;
      v12[3] = &unk_1000E2DA8;
      v9 = &v13;
      v13 = v4;
      dispatch_async(v8, v12);
LABEL_6:

    }
  }
  else if (v4)
  {
    v10 = dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000573D4;
    block[3] = &unk_1000E2EC0;
    v9 = &v16;
    v16 = v4;
    v15 = v6;
    dispatch_async(v11, block);

    v8 = v15;
    goto LABEL_6;
  }

}

- (void)showFeaturePromptForSetting:(id)a3 configurationUUID:(id)a4 promptOptions:(id)a5 promptIdentifier:(id)a6 completion:(id)a7
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  _QWORD *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v10 = a5;
  v11 = a6;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100057678;
  v32[3] = &unk_1000E3E40;
  v12 = a7;
  v33 = v12;
  v13 = objc_retainBlock(v32);
  v31 = 0;
  LOBYTE(a7) = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("UserSettings"), &v31);
  v14 = v31;
  if ((a7 & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
    v25 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer prefixedFeaturePromptIdentifierForIdentifier:](self, "prefixedFeaturePromptIdentifierForIdentifier:", v11));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCFeaturePromptTitleKey));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCFeaturePromptMessageKey));
    v16 = MCLocalizedString(CFSTR("FEATURE_PROMPT_DENY_BUTTON_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = MCLocalizedString(CFSTR("FEATURE_PROMPT_ALLOW_BUTTON_TITLE"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", kMCFeaturePromptShowAlwaysAllowButtonKey));
    v21 = objc_msgSend(v20, "BOOLValue");
    if (v21)
    {
      v22 = MCLocalizedString(CFSTR("FEATURE_PROMPT_ALWAYS_ALLOW_BUTTON_TITLE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    }
    else
    {
      v23 = 0;
    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100057744;
    v29[3] = &unk_1000E3808;
    v30 = v13;
    BYTE2(v24) = 1;
    LOWORD(v24) = 1;
    objc_msgSend(v28, "displayUserNotificationWithIdentifier:title:message:defaultButtonText:alternateButtonText:otherButtonText:textfieldPlaceholder:displayOnLockScreen:dismissOnLock:displayInAppWhitelistModes:dismissAfterTimeInterval:assertion:completionBlock:", v27, v26, v15, v17, v19, v23, 0.0, 0, v24, 0, v29);
    if (v21)

    v11 = v25;
  }
  else
  {
    ((void (*)(_QWORD *, _QWORD, id))v13[2])(v13, 0, v14);
  }

}

- (void)cancelFeaturePromptWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100057A18;
  v18[3] = &unk_1000E3460;
  v6 = a4;
  v19 = v6;
  v7 = a3;
  v8 = objc_retainBlock(v18);
  if (!v7)
  {
    v9 = MCFeaturePromptErrorDomain;
    v10 = MCErrorArray(CFSTR("FEATURE_PROMPT_INVALID_IDENTIFIER"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v9, 50002, v11, MCErrorTypeFatal, 0));
    ((void (*)(_QWORD *, void *))v8[2])(v8, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer prefixedFeaturePromptIdentifierForIdentifier:](self, "prefixedFeaturePromptIdentifierForIdentifier:", v7));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100057AD8;
  v16[3] = &unk_1000E2DA8;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v13, "cancelNotificationsWithIdentifier:completionBlock:", v14, v16);

}

- (id)prefixedFeaturePromptIdentifierForIdentifier:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("feature-prompt:"), "stringByAppendingString:"));
  else
    return CFSTR("feature-prompt:");
}

- (void)mayShareToMessagesForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "auditToken");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }

  v12 = MCBundleIDFromAuditToken(&v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v8)
  {
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No originating app bundle id passed. Using caller's bundle id.", buf, 2u);
    }
    v8 = v13;
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "isEqualToString:", v13) & 1) != 0)
  {
LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v16, "mayShareToMessagesForOriginatingAppBundleID:originatingAccountIsManaged:completion:", v8, v6, v9);
    goto LABEL_12;
  }
  v18 = 0;
  v14 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.sharing-access-check-messages"), &v18);
  v15 = v18;
  v16 = v15;
  if ((v14 & 1) != 0)
  {

    goto LABEL_11;
  }
  if (v9)
    v9[2](v9, 0, v15);
LABEL_12:

}

- (void)mayShareToAirDropForOriginatingAppBundleID:(id)a3 originatingAccountIsManaged:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, id);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a5;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "auditToken");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }

  v12 = MCBundleIDFromAuditToken(&v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v8)
  {
    v17 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No originating app bundle id passed. Using caller's bundle id.", buf, 2u);
    }
    v8 = v13;
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "isEqualToString:", v13) & 1) != 0)
  {
LABEL_11:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v16, "mayShareToAirDropForOriginatingAppBundleID:originatingAccountIsManaged:completion:", v8, v6, v9);
    goto LABEL_12;
  }
  v18 = 0;
  v14 = -[MCProfileServicer remoteProcessHasBooleanEntitlement:error:](self, "remoteProcessHasBooleanEntitlement:error:", CFSTR("com.apple.managedconfiguration.profiled.sharing-access-check-air-drop"), &v18);
  v15 = v18;
  v16 = v15;
  if ((v14 & 1) != 0)
  {

    goto LABEL_11;
  }
  if (v9)
    v9[2](v9, 0, v15);
LABEL_12:

}

- (void)createMDMUnlockTokenIfNeededWithPasscode:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  unsigned __int8 v8;
  id v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v11 = 0;
  v8 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.set"), CFSTR("Passcode"), &v11);
  v9 = v11;
  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v10, "createMDMUnlockTokenIfNeededWithPasscode:completion:", v6, v7);

  }
  else if (v7)
  {
    v7[2](v7, v9);
  }

}

- (void)monitorEnrollmentStateWithPersonaID:(id)a3
{
  id v4;
  MCInteractionClient *v5;
  void *v6;
  void *v7;
  MCInteractionClient *v8;

  v4 = a3;
  v5 = [MCInteractionClient alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer xpcConnection](self, "xpcConnection"));
  v8 = -[MCInteractionClient initWithXPCClientConnection:](v5, "initWithXPCClientConnection:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v7, "monitorEnrollmentStateForClient:personaID:", v8, v4);

}

- (void)managingOrganizationInformationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;

  v4 = (void (**)(id, _QWORD, id))a3;
  v8 = 0;
  v5 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("MDMInfo"), &v8);
  v6 = v8;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v7, "managingOrganizationInformationWithCompletion:", v4);

  }
  else if (v4)
  {
    v4[2](v4, 0, v6);
  }

}

- (void)stageMDMEnrollmentInfoForPairingWatchWithProfileData:(id)a3 orServiceURL:(id)a4 anchorCertificates:(id)a5 supervised:(BOOL)a6 declarationKeys:(id)a7 declarationConfiguration:(id)a8 completion:(id)a9
{
  _BOOL8 v11;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  void *v20;
  void *v21;
  id v22;

  v11 = a6;
  v22 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(id, void *))a9;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v20)
  {
    if (v19)
      v19[2](v19, v20);
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v21, "stageMDMEnrollmentInfoForPairingWatchWithProfileData:orServiceURL:anchorCertificates:supervised:declarationKeys:declarationConfiguration:completion:", v22, v15, v16, v11, v17, v18, v19);

  }
}

- (void)unstageMDMEnrollmentInfoForPairingWatchWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v4)
  {
    if (v6)
      v6[2](v6, v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v5, "unstageMDMEnrollmentInfoForPairingWatchWithCompletion:", v6);

  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD, void *);

  v6 = (void (**)(id, _QWORD, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v4)
  {
    if (v6)
      v6[2](v6, 0, v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v5, "fetchStagedMDMEnrollmentDataForPairingWatchWithCompletion:", v6);

  }
}

- (void)fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v7)
  {
    if (v6)
      v6[2](v6, 0, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v8, "fetchStagedMDMEnrollmentDataForPairingWatchWithPairingToken:completion:", v9, v6);

  }
}

- (void)fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD, void *);

  v6 = (void (**)(id, _QWORD, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v4)
  {
    if (v6)
      v6[2](v6, 0, v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v5, "fetchStagedMDMEnrollmentDeclarationKeysForPairingWatchWithCompletion:", v6);

  }
}

- (void)applyPairingWatchMDMEnrollmentData:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v8)
  {
    if (v7)
      v7[2](v7, v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer remoteProcessBundleID](self, "remoteProcessBundleID"));
    if (!v9)
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not retrieve the bundle ID of the calling process. Not marking profile's installer.", v12, 2u);
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v11, "applyPairingWatchMDMEnrollmentData:source:completion:", v6, v9, v7);

  }
}

- (void)updateMDMEnrollmentInfoForPairingWatch:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileServicer _missingWatchMDMEnrollmentEntitlementError](self, "_missingWatchMDMEnrollmentEntitlementError"));
  if (v7)
  {
    if (v6)
      v6[2](v6, 0, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v8, "updateMDMEnrollmentInfoForPairingWatch:completion:", v9, v6);

  }
}

- (id)_missingWatchMDMEnrollmentEntitlementError
{
  unsigned __int8 v2;
  id v3;
  void *v4;
  id v5;
  id v7;

  v7 = 0;
  v2 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.configurationprofiles"), CFSTR("WatchMDMEnrollment"), &v7);
  v3 = v7;
  v4 = v3;
  v5 = 0;
  if ((v2 & 1) == 0)
    v5 = v3;

  return v5;
}

- (void)effectiveBoolValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  v17 = 0;
  v14 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("WatchSettings"), &v17);
  v15 = v17;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v16, "effectiveBoolValueForWatchSetting:pairingID:pairingDataStore:completion:", v10, v11, v12, v13);

  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }

}

- (void)effectiveValueForWatchSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  v17 = 0;
  v14 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("WatchSettings"), &v17);
  v15 = v17;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v16, "effectiveValueForWatchSetting:pairingID:pairingDataStore:completion:", v10, v11, v12, v13);

  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }

}

- (void)effectiveValuesForWatchIntersectionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  v17 = 0;
  v14 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("WatchSettings"), &v17);
  v15 = v17;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v16, "effectiveValuesForWatchIntersectionSetting:pairingID:pairingDataStore:completion:", v10, v11, v12, v13);

  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }

}

- (void)effectiveValuesForWatchUnionSetting:(id)a3 pairingID:(id)a4 pairingDataStore:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  unsigned __int8 v14;
  id v15;
  void *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, id))a6;
  v17 = 0;
  v14 = -[MCProfileServicer remoteProcessHasEntitlementArray:containingString:error:](self, "remoteProcessHasEntitlementArray:containingString:error:", CFSTR("com.apple.managedconfiguration.profiled.get"), CFSTR("WatchSettings"), &v17);
  v15 = v17;
  if ((v14 & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
    objc_msgSend(v16, "effectiveValuesForWatchUnionSetting:pairingID:pairingDataStore:completion:", v10, v11, v12, v13);

  }
  else if (v13)
  {
    v13[2](v13, 0, v15);
  }

}

- (void)debugRescheduleBackgroundActivity:(int64_t)a3 startDate:(id)a4 gracePeriod:(id)a5 repeatingInterval:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileServiceServer sharedServer](MCProfileServiceServer, "sharedServer"));
  objc_msgSend(v15, "debugRescheduleBackgroundActivity:startDate:gracePeriod:repeatingInterval:completion:", a3, v14, v13, v12, v11);

}

- (void)setXpcConnection:(id)a3
{
  objc_storeWeak((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end
