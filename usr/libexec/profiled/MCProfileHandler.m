@implementation MCProfileHandler

- (id)payloadHandlerWithUUID:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_payloadHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "payload", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUID"));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (MCProfileHandler)initWithProfile:(id)a3
{
  id v5;
  MCProfileHandler *v6;
  id *p_isa;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  MCProfileHandler *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];

  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MCProfileHandler;
  v6 = -[MCProfileHandler init](&v31, "init");
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v8 = objc_alloc((Class)NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloads"));
    v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));
    v11 = p_isa[2];
    p_isa[2] = v10;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payloads", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "handlerWithProfileHandler:", p_isa));
          if (!v18)
          {
            v21 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
            {
              v22 = v21;
              v23 = (void *)objc_opt_class(p_isa);
              v24 = v23;
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "friendlyName"));
              *(_DWORD *)buf = 138543618;
              v33 = v23;
              v34 = 2114;
              v35 = v25;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}@ Cannot instantiate a payload handler for payload “%{public}@”.", buf, 0x16u);

            }
            v20 = 0;
            goto LABEL_15;
          }
          v19 = (void *)v18;
          objc_msgSend(p_isa[2], "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v14)
          continue;
        break;
      }
    }

  }
  v20 = p_isa;
LABEL_15:

  return v20;
}

+ (id)userCancelledError
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = MCInstallationErrorDomain;
  v3 = MCErrorArray(CFSTR("ERROR_PROFILE_USER_CANCELLED"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4004, v4, MCErrorTypeFatal, 0));

  return v5;
}

- (id)userCancelledError
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = MCInstallationErrorDomain;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "friendlyName"));
  v5 = MCErrorArray(CFSTR("ERROR_PROFILE_USER_CANCELLED_P_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v2, 4004, v6, MCErrorTypeFatal, v4, 0));

  return v7;
}

- (id)_profileInstallationErrorWithUnderlyingError:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = MCProfileErrorDomain;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "friendlyName"));
  v8 = MCErrorArray(CFSTR("ERROR_PROFILE_INSTALLATION_FAIL_P_ID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v4, 1009, v9, v5, MCErrorTypeFatal, v7, 0));

  return v10;
}

- (BOOL)stageForInstallationWithInstaller:(id)a3 interactionClient:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  id *v30;
  unsigned int v31;
  NSMutableArray *v32;
  id v33;
  uint64_t v34;
  unsigned int v35;
  void *v36;
  void *v37;
  NSMutableArray *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  os_log_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *k;
  os_log_t v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  id v64;
  id *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  MCProfileHandler *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];

  v8 = a3;
  v9 = a4;
  v66 = v9;
  v67 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_payloadHandlers, "count"));
  v73 = self;
  v65 = a5;
  if (v9)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableArray count](self->_payloadHandlers, "count")));
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v10 = self->_payloadHandlers;
    v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v70)
    {
      v64 = v8;
      v11 = 0;
      v69 = *(_QWORD *)v89;
      v12 = kMCIDFinePrintKey;
      v13 = kMCIDFlagsKey;
      v14 = v68;
      do
      {
        for (i = 0; i != v70; i = (char *)i + 1)
        {
          if (*(_QWORD *)v89 != v69)
            objc_enumerationMutation(v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i), "userInputFields"));
          if (objc_msgSend(v16, "count"))
          {
            v71 = v16;
            v72 = i;
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v85;
              do
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v85 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)j);
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v12));

                  if (!v23)
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", v13));
                    v25 = objc_msgSend(v24, "intValue");

                    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfile friendlyName](v73->_profile, "friendlyName"));
                    if ((v25 & 5) != 0)
                      v27 = CFSTR("REQUESTED_BY_PROFILE_P_ID");
                    else
                      v27 = CFSTR("REQUIRED_BY_PROFILE_P_ID");
                    v28 = MCLocalizedFormat(v27);
                    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

                    objc_msgSend(v22, "setObject:forKey:", v29, v12, v26);
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
              }
              while (v19);
            }

            v11 = 1;
            v14 = v68;
            v16 = v71;
            i = v72;
          }
          objc_msgSend(v14, "addObject:", v16);

        }
        v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v70);

      v8 = v64;
      v30 = v65;
      v9 = v66;
      self = v73;
      if ((v11 & 1) == 0)
        goto LABEL_30;
      v83 = 0;
      v31 = objc_msgSend(v66, "requestUserInput:delegate:outResult:", v68, v73, &v83);
      v32 = (NSMutableArray *)v83;
      v10 = v32;
      if (!v31 || (v33 = -[NSMutableArray count](v32, "count"), v33 != objc_msgSend(v68, "count")))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler userCancelledError](v73, "userCancelledError"));

        v42 = v68;
LABEL_45:

        if (v48)
        {
          v49 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v50 = v49;
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](v73, "profile"));
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "identifier"));
            *(_DWORD *)buf = 138543362;
            v93 = v52;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Rolling back staging of profile “%{public}@”...", buf, 0xCu);

          }
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          v53 = v67;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v75;
            do
            {
              for (k = 0; k != v55; k = (char *)k + 1)
              {
                if (*(_QWORD *)v75 != v56)
                  objc_enumerationMutation(v53);
                objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)k), "unstageFromInstallationWithInstaller:", v8);
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
            }
            while (v55);
          }

          v58 = _MCLogObjects[0];
          if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
          {
            v59 = v58;
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](v73, "profile"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifier"));
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "MCVerboseDescription"));
            *(_DWORD *)buf = 138543618;
            v93 = v61;
            v94 = 2114;
            v95 = v62;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Installation of profile “%{public}@” failed with error: %{public}@", buf, 0x16u);

          }
          if (v30)
            *v30 = objc_retainAutorelease(v48);
        }
        goto LABEL_59;
      }
      if (-[NSMutableArray count](v73->_payloadHandlers, "count"))
      {
        v34 = 0;
        v35 = 1;
        do
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v73->_payloadHandlers, "objectAtIndex:", v34));
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v10, "objectAtIndex:", v34));
          objc_msgSend(v36, "setUserInputResponses:", v37);

          v34 = v35;
        }
        while ((unint64_t)-[NSMutableArray count](v73->_payloadHandlers, "count") > v35++);
      }
    }

LABEL_30:
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v39 = self->_payloadHandlers;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
  if (!v40)
  {
    v42 = 0;
LABEL_43:

    v48 = 0;
LABEL_44:
    v30 = v65;
    goto LABEL_45;
  }
  v41 = v40;
  v42 = 0;
  v43 = *(_QWORD *)v80;
LABEL_33:
  v44 = 0;
  v45 = v42;
  while (1)
  {
    if (*(_QWORD *)v80 != v43)
      objc_enumerationMutation(v39);
    v46 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)v44);
    v78 = v45;
    v47 = objc_msgSend(v46, "stageForInstallationWithInstaller:interactionClient:outError:", v8, v9, &v78);
    v42 = v78;

    if (!v47)
      break;
    objc_msgSend(v67, "insertObject:atIndex:", v46, 0);
    v44 = (char *)v44 + 1;
    v45 = v42;
    if (v41 == v44)
    {
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v79, v97, 16);
      if (v41)
        goto LABEL_33;
      goto LABEL_43;
    }
  }

  if (v42)
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler _profileInstallationErrorWithUnderlyingError:](v73, "_profileInstallationErrorWithUnderlyingError:", v42));
    goto LABEL_44;
  }
  v48 = 0;
LABEL_59:

  return v48 == 0;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *UUIDToPersistentIDMap;
  NSMutableArray *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  NSMutableDictionary *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSMutableDictionary *v36;
  os_log_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *j;
  os_log_t v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id *v57;
  MCProfileHandler *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v10 = a3;
  v11 = a4;
  v60 = a5;
  v62 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_payloadHandlers, "count"));
  v61 = -[NSMutableArray mutableCopy](self->_payloadHandlers, "mutableCopy");
  v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  UUIDToPersistentIDMap = self->_UUIDToPersistentIDMap;
  self->_UUIDToPersistentIDMap = v12;

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v14 = self->_payloadHandlers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  v59 = v11;
  if (v15)
  {
    v16 = v15;
    v58 = self;
    v57 = a6;
    v17 = 0;
    v18 = *(_QWORD *)v74;
LABEL_3:
    v19 = 0;
    v20 = v17;
    while (1)
    {
      if (*(_QWORD *)v74 != v18)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v19);
      v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v78 = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Installing payload handler: %{public}@", buf, 0xCu);
      }
      v72 = v20;
      v23 = objc_msgSend(v21, "installWithInstaller:options:interactionClient:outError:", v10, v11, v60, &v72);
      v17 = v72;

      if (!v23)
        break;
      objc_msgSend(v62, "insertObject:atIndex:", v21, 0);
      objc_msgSend(v61, "removeObject:", v21);
      v24 = objc_opt_class(MCNewCertificatePayloadHandler);
      if ((objc_opt_isKindOfClass(v21, v24) & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "payload"));
        v26 = v58->_UUIDToPersistentIDMap;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "certificatePersistentID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "UUID"));
        -[NSMutableDictionary setObject:forKey:](v26, "setObject:forKey:", v27, v28);

        v11 = v59;
      }
      v19 = (char *)v19 + 1;
      v20 = v17;
      if (v16 == v19)
      {
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
        if (v16)
          goto LABEL_3;
        break;
      }
    }

    a6 = v57;
    self = v58;
    if (v17)
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileHandler _profileInstallationErrorWithUnderlyingError:](v58, "_profileInstallationErrorWithUnderlyingError:", v17));
      goto LABEL_20;
    }
  }
  else
  {

  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  if (objc_msgSend(v17, "isLocked")
    && (v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "removalPasscode")), v30, v30))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "removalPasscode"));
    v32 = kMCProfileRemovalPasscodeService;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "UUID"));
    v34 = objc_msgSend(v17, "isInstalledForSystem");
    v71 = 0;
    v35 = v32;
    v11 = v59;
    +[MCKeychain setString:forService:account:label:description:useSystemKeychain:outError:](MCKeychain, "setString:forService:account:label:description:useSystemKeychain:outError:", v31, v35, v33, 0, 0, v34, &v71);
    v29 = v71;

  }
  else
  {
    v29 = 0;
  }
LABEL_20:

  v36 = self->_UUIDToPersistentIDMap;
  self->_UUIDToPersistentIDMap = 0;

  if (v29)
  {
    v37 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v38 = v37;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identifier"));
      *(_DWORD *)buf = 138543362;
      v78 = v40;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Rolling back installation of profile “%{public}@”...", buf, 0xCu);

    }
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v41 = v62;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v68 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i), "remove");
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
      }
      while (v43);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v46 = v61;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v48; j = (char *)j + 1)
        {
          if (*(_QWORD *)v64 != v49)
            objc_enumerationMutation(v46);
          objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)j), "unstageFromInstallationWithInstaller:", v10);
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      }
      while (v48);
    }

    v51 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      v52 = v51;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "MCVerboseDescription"));
      *(_DWORD *)buf = 138543618;
      v78 = v54;
      v79 = 2114;
      v80 = v55;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Installation of profile “%{public}@” failed with error: %{public}@", buf, 0x16u);

    }
    v11 = v59;
    if (a6)
      *a6 = objc_retainAutorelease(v29);
  }

  return v29 == 0;
}

- (void)unstageFromInstallationWithInstaller:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unstaging profile “%{public}@”...", buf, 0xCu);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_payloadHandlers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "unstageFromInstallationWithInstaller:", v4, (_QWORD)v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)didInstallOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "setInstallDate:", v9);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_payloadHandlers;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "didInstallOldGlobalRestrictions:newGlobalRestrictions:", v6, v7, (_QWORD)v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)didRemoveOldGlobalRestrictions:(id)a3 newGlobalRestrictions:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_payloadHandlers;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "didRemoveOldGlobalRestrictions:newGlobalRestrictions:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (BOOL)isInstalled
{
  NSMutableArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = self->_payloadHandlers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = objc_autoreleasePoolPush();
        v6 &= objc_msgSend(v8, "isInstalled", (_QWORD)v11);
        objc_autoreleasePoolPop(v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)setAsideWithInstaller:(id)a3
{
  id v4;
  os_log_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138543362;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Profile “%{public}@” being set aside.", buf, 0xCu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_payloadHandlers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13);
        v15 = objc_autoreleasePoolPush();
        objc_msgSend(v14, "setAsideWithInstaller:", v4, (_QWORD)v16);
        objc_autoreleasePoolPop(v15);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  self->_isSetAside = 1;
}

- (void)unsetAside
{
  os_log_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v11 = 138543362;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Profile “%{public}@” being unset aside.", (uint8_t *)&v11, 0xCu);

  }
  v7 = -[NSMutableArray count](self->_payloadHandlers, "count");
  if (v7 >= 1)
  {
    v8 = v7 + 1;
    do
    {
      v9 = objc_autoreleasePoolPush();
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", (v8 - 2)));
      objc_msgSend(v10, "unsetAside");

      objc_autoreleasePoolPop(v9);
      --v8;
    }
    while (v8 > 1);
  }
}

- (void)removeWithInstaller:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v20 = 138543362;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Profile “%{public}@” being removed.", (uint8_t *)&v20, 0xCu);

  }
  v12 = -[NSMutableArray count](self->_payloadHandlers, "count");
  if (v12 >= 1)
  {
    v13 = v12 + 1;
    do
    {
      v14 = objc_autoreleasePoolPush();
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", (v13 - 2)));
      objc_msgSend(v15, "removeWithInstaller:options:", v6, v7);

      objc_autoreleasePoolPop(v14);
      --v13;
    }
    while (v13 > 1);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
  if ((objc_msgSend(v16, "isLocked") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "removalPasscode"));

    if (v17)
    {
      v18 = kMCProfileRemovalPasscodeService;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "UUID"));
      +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:](MCKeychain, "removeItemForService:account:label:description:useSystemKeychain:group:", v18, v19, 0, 0, objc_msgSend(v16, "isInstalledForSystem"), 0);

    }
  }

}

- (void)convertPayloadWithUUIDToUnknownPayload:(id)a3
{
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v16;

  v16 = a3;
  if (-[NSMutableArray count](self->_payloadHandlers, "count"))
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUID"));
      v9 = objc_msgSend(v8, "isEqualToString:", v16);

      if (v9)
      {
        v10 = objc_autoreleasePoolPush();
        v11 = objc_alloc((Class)MCUnknownPayload);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "payload"));
        v13 = objc_msgSend(v11, "initWithContentsOfPayload:profile:", v12, self->_profile);

        -[MCProfile replacePayloadWithUUID:withPayload:](self->_profile, "replacePayloadWithUUID:withPayload:", v16, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "handlerWithProfileHandler:", self));
        -[NSMutableArray setObject:atIndexedSubscript:](self->_payloadHandlers, "setObject:atIndexedSubscript:", v14, v4);

        objc_msgSend(v6, "remove");
        objc_autoreleasePoolPop(v10);
      }

      v4 = v5;
    }
    while ((unint64_t)-[NSMutableArray count](self->_payloadHandlers, "count") > v5++);
  }

}

+ (id)payloadsOfClass:(Class)a3 installedBeforePayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloads"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if (v13 == v5)
        break;
      if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a3) & 1) != 0)
        objc_msgSend(v6, "addObject:", v13);
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  return v6;
}

+ (id)payloadsOfClass:(Class)a3 removedBeforePayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloads"));
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 1)
  {
    v10 = v9 + 1;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloads"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", (v10 - 2)));

      if (v13 == v5)
        break;
      if ((objc_opt_isKindOfClass(v13, a3) & 1) != 0)
        objc_msgSend(v6, "addObject:", v13);

      if ((unint64_t)--v10 <= 1)
        goto LABEL_9;
    }

  }
LABEL_9:

  return v6;
}

+ (id)payloadsOfClass:(Class)a3 setAsideBeforePayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloads"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v11)
        objc_enumerationMutation(v8);
      v13 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v12);
      if (v13 == v5)
        break;
      if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a3) & 1) != 0)
        objc_msgSend(v6, "addObject:", v13);
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  return v6;
}

+ (id)payloadsOfClass:(Class)a3 unsetAsideBeforePayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "payloads"));
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 1)
  {
    v10 = v9 + 1;
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profile"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "payloads"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", (v10 - 2)));

      if (v13 == v5)
        break;
      if ((objc_opt_isKindOfClass(v13, a3) & 1) != 0)
        objc_msgSend(v6, "addObject:", v13);

      if ((unint64_t)--v10 <= 1)
        goto LABEL_9;
    }

  }
LABEL_9:

  return v6;
}

- (id)userInputArray
{
  return 0;
}

- (BOOL)preflightUserInputResponses:(id)a3 forPayloadIndex:(unint64_t)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  unsigned __int8 v10;
  NSObject *v11;
  uint8_t v13[16];

  v8 = a3;
  if ((unint64_t)-[NSMutableArray count](self->_payloadHandlers, "count") <= a4)
  {
    v11 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Received preflight request with out-of-bounds payload index.", v13, 2u);
    }
    v10 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_payloadHandlers, "objectAtIndex:", a4));
    v10 = objc_msgSend(v9, "preflightUserInputResponses:outError:", v8, a5);

  }
  return v10;
}

- (id)persistentIDForCertificateUUID:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_UUIDToPersistentIDMap, "objectForKey:"));
  else
    return 0;
}

- (BOOL)interactionClient:(id)a3 didRequestPreflightUserInputResponses:(id)a4 forPayloadIndex:(unint64_t)a5 outError:(id *)a6
{
  return -[MCProfileHandler preflightUserInputResponses:forPayloadIndex:outError:](self, "preflightUserInputResponses:forPayloadIndex:outError:", a4, a5, a6);
}

- (MCProfile)profile
{
  return self->_profile;
}

- (BOOL)isSetAside
{
  return self->_isSetAside;
}

- (NSArray)payloadHandlers
{
  return &self->_payloadHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDToPersistentIDMap, 0);
  objc_storeStrong((id *)&self->_payloadHandlers, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
