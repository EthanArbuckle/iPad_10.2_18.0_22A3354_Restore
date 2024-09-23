@implementation MCNewRestrictionsPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *i;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  os_log_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  MCNewRestrictionsPayloadHandler *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  void *v81;
  _BYTE v82[128];

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kMCInstallProfileOptionIsInstalledByMDM));
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "restrictions"));
  if ((v11 & 1) == 0
    && (+[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", MCFeatureManagedWriteUnmanagedContactsAllowed, v12) == 1|| +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", MCFeatureUnmanagedReadManagedContactsAllowed, v12) == 1))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[MCInstaller notInstalledByMDMError](MCInstaller, "notInstalledByMDMError"));
  }
  else
  {
    v14 = MCEffectiveSingleAppModeBundleID();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v15)
    {
      v73 = a6;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager intersectedValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "intersectedValuesForFeature:withRestrictionsDictionary:", MCFeatureAppLockBundleIDs, v12));
      v17 = v16;
      if (v16 && (objc_msgSend(v16, "containsObject:", v15) & 1) == 0)
      {
        v33 = MCRestrictionsErrorDomain;
        v34 = MCErrorArray(CFSTR("RESTRICTION_ERROR_ALLOW_LIST_CONFLICTS_WITH_APPLOCK"));
        v35 = v17;
        v36 = v8;
        v37 = (void *)objc_claimAutoreleasedReturnValue(v34);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v33, 3002, v37, MCErrorTypeFatal, v15, 0));
        v13 = objc_msgSend(v38, "MCCopyAsPrimaryError");

        v8 = v36;
        v17 = v35;
        a6 = v73;
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureBlacklistedAppBundleIDs, v12));
        if (objc_msgSend(v18, "containsObject:", v15))
        {
          v70 = v18;
          v19 = MCRestrictionsErrorDomain;
          v20 = MCErrorArray(CFSTR("RESTRICTION_ERROR_DNEY_LIST_CONFLICTS_WITH_APPLOCK"));
          v21 = v17;
          v22 = v8;
          v23 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v19, 3003, v23, MCErrorTypeFatal, v15, 0));
          v13 = objc_msgSend(v24, "MCCopyAsPrimaryError");

          v18 = v70;
          v8 = v22;
          v17 = v21;
          a6 = v73;
        }
        else
        {
          v69 = v8;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager unionValuesForFeature:withRestrictionsDictionary:](MCRestrictionManager, "unionValuesForFeature:withRestrictionsDictionary:", MCFeatureBlockedAppBundleIDs, v12));
          if (objc_msgSend(v25, "containsObject:", v15))
          {
            v26 = v18;
            v27 = v25;
            v28 = MCRestrictionsErrorDomain;
            v29 = MCErrorArray(CFSTR("RESTRICTION_ERROR_DNEY_LIST_CONFLICTS_WITH_APPLOCK"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            v31 = v28;
            v25 = v27;
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v31, 3003, v30, MCErrorTypeFatal, v15, 0));
            v13 = objc_msgSend(v32, "MCCopyAsPrimaryError");

            v18 = v26;
            a6 = v73;
          }
          else
          {
            v74 = 0u;
            v75 = 0u;
            v76 = 0u;
            v77 = 0u;
            v39 = (id)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager explicitlyRestrictedAppsBySetting](MCRestrictionManager, "explicitlyRestrictedAppsBySetting"));
            v13 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
            if (v13)
            {
              v66 = self;
              v67 = v25;
              v71 = v18;
              v65 = v17;
              v40 = *(_QWORD *)v75;
              while (2)
              {
                for (i = 0; i != v13; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v75 != v40)
                    objc_enumerationMutation(v39);
                  v42 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i);
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v42));
                  if (objc_msgSend(v43, "containsObject:", v15)
                    && +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", v42, v12) == 2)
                  {
                    v44 = MCRestrictionsErrorDomain;
                    v45 = MCErrorArray(CFSTR("RESTRICTION_ERROR_RESTRICTION_CONFLICTS_WITH_APPLOCK"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
                    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v44, 3004, v46, MCErrorTypeFatal, v15, 0));
                    v13 = objc_msgSend(v47, "MCCopyAsPrimaryError");

                    goto LABEL_25;
                  }

                }
                v13 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
                if (v13)
                  continue;
                break;
              }
LABEL_25:
              v17 = v65;
              self = v66;
              v18 = v71;
              v25 = v67;
            }

            if (objc_msgSend(v15, "isEqualToString:", MCFindMyBundleIdentifier)
              && +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", MCFeatureFindMyDeviceAllowed, v12) == 2&& +[MCRestrictionManager restrictedBoolForFeature:withRestrictionsDictionary:](MCRestrictionManager, "restrictedBoolForFeature:withRestrictionsDictionary:", MCFeatureFindMyFriendsAllowed, v12) == 2)
            {
              v68 = v25;
              v48 = MCRestrictionsErrorDomain;
              v49 = MCErrorArray(CFSTR("RESTRICTION_ERROR_RESTRICTION_CONFLICTS_WITH_APPLOCK"));
              v50 = v18;
              v51 = (void *)objc_claimAutoreleasedReturnValue(v49);
              v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v48, 3004, v51, MCErrorTypeFatal, v15, 0));
              v72 = objc_msgSend(v52, "MCCopyAsPrimaryError");

              v25 = v68;
              v18 = v50;
              v13 = v72;
            }
            a6 = v73;

          }
          v8 = v69;
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  if (v13)
  {
    v53 = MCInstallationErrorDomain;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "friendlyName"));
    v56 = MCErrorArray(CFSTR("ERROR_PAYLOAD_FAILED_P_ID"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v53, 4001, v57, v13, MCErrorTypeFatal, v55, 0));

    if (a6)
      *a6 = objc_retainAutorelease(v58);
    v59 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v60 = v59;
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "friendlyName"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543618;
      v79 = v62;
      v80 = 2114;
      v81 = v63;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "Cannot install restrictions payload “%{public}@”. Error: %{public}@", buf, 0x16u);

    }
  }

  return v13 == 0;
}

- (BOOL)isInstalled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char v8;

  v8 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "restrictions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](MCRestrictionManagerWriter, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRestrictions"));
  v6 = +[MCRestrictionManagerWriter restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManagerWriter, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v3, v5, &v8, 0);

  return v8 == 0;
}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MCNewRestrictionsPayloadHandler;
  v5 = a4;
  v6 = a3;
  -[MCNewPayloadHandler didInstallOldGlobalRestrictions:newGlobalRestrictions:](&v18, "didInstallOldGlobalRestrictions:newGlobalRestrictions:", v6, v5);
  v7 = MCRestrictedBoolKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCRestrictedBoolKey, v18.receiver, v18.super_class));

  v9 = MCFeaturePredictiveKeyboardAllowed;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCFeaturePredictiveKeyboardAllowed));

  v11 = MCRestrictedBoolValueKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", MCRestrictedBoolValueKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v9));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11));
  v16 = (void *)v15;
  if (!v12)
  {
    if (!v15)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (objc_msgSend(v12, "BOOLValue"))
    v17 = v16 == 0;
  else
    v17 = 1;
  if (!v17)
  {
LABEL_9:
    if ((objc_msgSend(v16, "BOOLValue") & 1) == 0)
      MCSendKeyboardSettingsChangedNotification();
  }
LABEL_11:

}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MCNewRestrictionsPayloadHandler;
  v5 = a4;
  v6 = a3;
  -[MCNewPayloadHandler didRemoveOldGlobalRestrictions:newGlobalRestrictions:](&v16, "didRemoveOldGlobalRestrictions:newGlobalRestrictions:", v6, v5);
  v7 = MCRestrictedBoolKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", MCRestrictedBoolKey, v16.receiver, v16.super_class));

  v9 = MCFeaturePredictiveKeyboardAllowed;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", MCFeaturePredictiveKeyboardAllowed));

  v11 = MCRestrictedBoolValueKey;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", MCRestrictedBoolValueKey));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v11));
  if (v12
    && (objc_msgSend(v12, "BOOLValue") & 1) == 0
    && (!v15 || objc_msgSend(v15, "BOOLValue")))
  {
    MCSendKeyboardSettingsChangedNotification();
  }

}

@end
