@implementation MCExtensibleSingleSignOnPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload", a3, a4, a5));
  v9 = +[MCProfileHandler payloadsOfClass:installedBeforePayload:](MCProfileHandler, "payloadsOfClass:installedBeforePayload:", objc_opt_class(MCExtensibleSingleSignOnPayload), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "addObject:", v8);
  v17 = 0;
  objc_msgSend((id)objc_opt_class(self), "rebuildConfigurationIncludingPayloads:excludingPayloads:error:", v11, qword_1000FDA18, &v17);
  v12 = v17;

  if (v12)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v12);
  }
  else
  {
    v13 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "esso_extensionIdentifier"));
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Installed Extensible SSO extension for %{public}@", buf, 0xCu);

    }
  }

  return v12 == 0;
}

- (void)remove
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  os_log_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler profileHandler](self, "profileHandler"));
  v5 = objc_msgSend(v4, "isSetAside");

  if (!v5)
  {
    v6 = +[MCProfileHandler payloadsOfClass:removedBeforePayload:](MCProfileHandler, "payloadsOfClass:removedBeforePayload:", objc_opt_class(MCExtensibleSingleSignOnPayload), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "addObject:", v3);
    v18 = 0;
    LODWORD(v7) = objc_msgSend((id)objc_opt_class(self), "rebuildConfigurationIncludingPayloads:excludingPayloads:error:", 0, v8, &v18);
    v9 = v18;
    if ((_DWORD)v7)
    {
      v10 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        v13 = "Removed Extensible SSO payload for extension ID %{public}@";
LABEL_11:
        v15 = v11;
        v16 = OS_LOG_TYPE_DEFAULT;
        v17 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      v14 = _MCLogObjects[0];
      if (v9)
      {
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          v11 = v14;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
          *(_DWORD *)buf = 138543618;
          v20 = v12;
          v21 = 2114;
          v22 = v9;
          v13 = "Failed to remove Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@";
          v15 = v11;
          v16 = OS_LOG_TYPE_ERROR;
          v17 = 22;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v13, buf, v17);

        }
      }
      else if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v14;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        v13 = "Remove Extensible SSO payload: no extension found with extension ID %{public}@";
        goto LABEL_11;
      }
    }

    goto LABEL_14;
  }
  objc_msgSend((id)qword_1000FDA18, "removeObject:", v3);
LABEL_14:

}

- (void)setAside
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v4 = (void *)qword_1000FDA18;
  if (!qword_1000FDA18)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v6 = (void *)qword_1000FDA18;
    qword_1000FDA18 = v5;

    v4 = (void *)qword_1000FDA18;
  }
  objc_msgSend(v4, "addObject:", v3);
  v12 = 0;
  v7 = objc_msgSend((id)objc_opt_class(self), "rebuildConfigurationIncludingPayloads:excludingPayloads:error:", 0, qword_1000FDA18, &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
  {
    v9 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to set aside Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);

    }
  }

}

- (void)unsetAside
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  objc_msgSend((id)qword_1000FDA18, "removeObject:", v3);
  v9 = 0;
  v4 = objc_msgSend((id)objc_opt_class(self), "rebuildConfigurationIncludingPayloads:excludingPayloads:error:", 0, qword_1000FDA18, &v9);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "esso_extensionIdentifier"));
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to restore Extensible SSO payload with extension ID %{public}@. Ignoring. Error: %{public}@", buf, 0x16u);

    }
  }

}

+ (BOOL)rebuildConfigurationIncludingPayloads:(id)a3 excludingPayloads:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  id v19;
  id v20;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCManifest sharedManifest](MCManifest, "sharedManifest"));
  v11 = objc_msgSend(v10, "allInstalledPayloadsOfClass:", objc_opt_class(MCExtensibleSingleSignOnPayload));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "mutableCopy");

  v20 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_configurationForPayloads:includingPayloads:excludingPayloads:error:", v13, v9, v8, &v20));

  v15 = v20;
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v19 = 0;
    v17 = objc_msgSend(a1, "_writeConfiguration:withError:", v14, &v19);
    v16 = v19;
    if (!a5)
      goto LABEL_7;
  }
  if (v16)
    *a5 = objc_retainAutorelease(v16);
LABEL_7:

  return v17;
}

+ (id)_configurationForPayloads:(id)a3 includingPayloads:(id)a4 excludingPayloads:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  os_log_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *m;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  id obj;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _QWORD v106[4];
  id v107;
  id v108;
  const __CFString *v109;
  void *v110;
  _BYTE v111[128];
  const __CFString *v112;
  void *v113;
  _QWORD v114[2];
  _QWORD v115[2];
  _BYTE v116[128];
  uint8_t v117[128];
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  void *v121;
  _BYTE v122[128];
  _BYTE v123[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472;
    v106[2] = sub_100090F44;
    v106[3] = &unk_1000E4560;
    v107 = v9;
    v108 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexesOfObjectsPassingTest:", v106));
    objc_msgSend(v8, "removeObjectsAtIndexes:", v11);

  }
  v73 = v10;
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v8;
  v84 = v12;
  v85 = v13;
  v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
  if (v79)
  {
    v77 = *(_QWORD *)v103;
    v75 = MCExtensibleSingleSignOnErrorDomain;
    v74 = MCErrorTypeFatal;
LABEL_8:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v103 != v77)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_type"));
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Credential"));

      if (v17)
      {
        v100 = 0uLL;
        v101 = 0uLL;
        v98 = 0uLL;
        v99 = 0uLL;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_hosts"));
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
        if (v19)
        {
          v20 = v19;
          v81 = v14;
          v21 = *(_QWORD *)v99;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v99 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)i);
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lowercaseString"));
              if ((objc_msgSend(v12, "containsObject:", v24) & 1) != 0)
              {
                if ((objc_msgSend(v9, "containsObject:", v15) & 1) != 0)
                {
                  v71 = v23;
                  v38 = MCErrorArray(CFSTR("EXTENSIBLE_SSO_INTER_HOST_CONFLICT_P_HOST"));
                  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v75, 54007, v39, 0, v74, v71, 0));
                  goto LABEL_41;
                }
                v25 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v26 = v25;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_extensionIdentifier"));
                  *(_DWORD *)buf = 138543618;
                  v119 = v27;
                  v120 = 2114;
                  v121 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Found pre-existing conflicting hosts while rebuilding configuration for Extensible SSO payload with extension ID %{public}@: %{public}@", buf, 0x16u);

                  v12 = v84;
                }
              }
              else
              {
                objc_msgSend(v12, "addObject:", v24);
              }

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
            if (v20)
              continue;
            break;
          }
LABEL_37:
          v37 = 0;
LABEL_42:
          v13 = v85;
          v14 = v81;
          goto LABEL_43;
        }
      }
      else
      {
        v96 = 0uLL;
        v97 = 0uLL;
        v94 = 0uLL;
        v95 = 0uLL;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_URLs"));
        v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v117, 16);
        if (v28)
        {
          v29 = v28;
          v81 = v14;
          v30 = *(_QWORD *)v95;
          while (2)
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(_QWORD *)v95 != v30)
                objc_enumerationMutation(v18);
              v32 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "normalizedURL"));
              if ((objc_msgSend(v85, "containsObject:", v24) & 1) != 0)
              {
                if ((objc_msgSend(v9, "containsObject:", v15) & 1) != 0)
                {
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "absoluteString"));
                  v40 = MCErrorArray(CFSTR("EXTENSIBLE_SSO_INTER_URL_CONFLICT_P_URL"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
                  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v75, 54005, v41, 0, v74, v39, 0));

                  v12 = v84;
LABEL_41:

                  goto LABEL_42;
                }
                v33 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  v34 = v33;
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "esso_extensionIdentifier"));
                  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "absoluteString"));
                  *(_DWORD *)buf = 138543618;
                  v119 = v35;
                  v120 = 2114;
                  v121 = v36;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Found pre-existing conflicting URLs while rebuilding configuration for Extensible SSO payload with extension ID %{public}@: %{public}@", buf, 0x16u);

                  v12 = v84;
                }
              }
              else
              {
                objc_msgSend(v85, "addObject:", v24);
              }

            }
            v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v117, 16);
            if (v29)
              continue;
            goto LABEL_37;
          }
        }
      }
      v37 = 0;
LABEL_43:

      if (v37)
      {

        if (a6)
        {
          v37 = objc_retainAutorelease(v37);
          v69 = 0;
          *a6 = v37;
        }
        else
        {
          v69 = 0;
        }
        goto LABEL_78;
      }
      if ((id)++v14 == v79)
      {
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v123, 16);
        if (v79)
          goto LABEL_8;
        break;
      }
    }
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v80 = obj;
  v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v90, v116, 16);
  if (v83)
  {
    v82 = *(_QWORD *)v91;
    v78 = v42;
    do
    {
      for (k = 0; k != v83; k = (char *)k + 1)
      {
        if (*(_QWORD *)v91 != v82)
          objc_enumerationMutation(v80);
        v44 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)k);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_type"));
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("Type"));

        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_realm"));
        if (v47)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_realm"));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v48, CFSTR("Realm"));

        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_teamIdentifier"));
        if (v49)
        {
          v114[0] = CFSTR("BundleIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionIdentifier"));
          v115[0] = v50;
          v114[1] = CFSTR("TeamIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_teamIdentifier"));
          v115[1] = v51;
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 2));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v52, CFSTR("Extension"));

        }
        else
        {
          v112 = CFSTR("BundleIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionIdentifier"));
          v113 = v50;
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v51, CFSTR("Extension"));
        }

        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionData"));
        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_extensionData"));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v54, CFSTR("ExtensionData"));

        }
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_type"));
        v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("Credential"));

        if (v56)
        {
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_hosts"));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v57, CFSTR("Hosts"));
        }
        else
        {
          v58 = v9;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_URLs"));
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v86, v111, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v87;
            do
            {
              for (m = 0; m != v61; m = (char *)m + 1)
              {
                if (*(_QWORD *)v87 != v62)
                  objc_enumerationMutation(v59);
                v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1)
                                                                                   + 8 * (_QWORD)m), "absoluteString"));
                objc_msgSend(v57, "addObject:", v64);

              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v86, v111, 16);
            }
            while (v61);
          }

          objc_msgSend(v45, "setObject:forKeyedSubscript:", v57, CFSTR("URLPrefix"));
          v9 = v58;
          v12 = v84;
          v42 = v78;
        }

        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_screenLockedBehavior"));
        if (v65)
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_screenLockedBehavior"));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v66, CFSTR("ScreenLockedBehavior"));

        }
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_deniedBundleIdentifiers"));

        if (v67)
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "esso_deniedBundleIdentifiers"));
          objc_msgSend(v45, "setObject:forKeyedSubscript:", v68, CFSTR("DeniedBundleIdentifiers"));

        }
        objc_msgSend(v42, "addObject:", v45);

      }
      v83 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v90, v116, 16);
    }
    while (v83);
  }

  v109 = CFSTR("Profiles");
  v110 = v42;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1));

  v37 = 0;
  v13 = v85;
LABEL_78:

  return v69;
}

+ (BOOL)_writeConfiguration:(id)a3 withError:(id *)a4
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  BOOL v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, char, id);
  void *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v5 = a3;
  v6 = dispatch_semaphore_create(0);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10009135C;
  v26 = sub_10009136C;
  v27 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SOConfigurationManager defaultManager](SOConfigurationManager, "defaultManager"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100091374;
  v18 = &unk_1000E35E8;
  v20 = &v28;
  v21 = &v22;
  v8 = v6;
  v19 = v8;
  objc_msgSend(v7, "saveConfigurationData:completion:", v5, &v15);

  v9 = dispatch_time(0, 30000000000);
  if (!dispatch_semaphore_wait(v8, v9))
  {
    v13 = *((_BYTE *)v29 + 24) != 0;
    v12 = (id)v23[5];
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = MCErrorArray(CFSTR("EXTENSIBLE_SSO_CANNOT_WRITE_CONFIGURATION"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", MCExtensibleSingleSignOnErrorDomain, 54002, v11, 0, MCErrorTypeFatal, 0, v15, v16, v17, v18));

  v13 = 0;
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v12);
LABEL_4:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

@end
