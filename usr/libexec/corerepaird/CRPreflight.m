@implementation CRPreflight

- (void)queryRepairDeltaWithReply:(id)a3
{
  void (**v3)(id, uint64_t, NSMutableArray *, void *);
  NSMutableArray *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void (**v40)(id, uint64_t, NSMutableArray *, void *);
  uint64_t v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[3];
  _QWORD v57[3];
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];

  v3 = (void (**)(id, uint64_t, NSMutableArray *, void *))a3;
  v4 = objc_opt_new(NSMutableArray);
  v53 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRFDRUtils findUnsealedDataWithError:](CRFDRUtils, "findUnsealedDataWithError:", &v53));
  v6 = v53;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v5, "count"))
    {
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v28 = v5;
      v43 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
      if (v43)
      {
        v37 = v9;
        v38 = v7;
        v39 = v5;
        v40 = v3;
        v41 = *(_QWORD *)v50;
        v42 = v28;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v50 != v41)
              objc_enumerationMutation(v28);
            v44 = v10;
            v11 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v11));
            v13 = (void *)AMFDRSealingMapCopyAssemblyIdentifierForClass(v11, 0);
            v14 = handleForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v60 = "-[CRPreflight queryRepairDeltaWithReply:]";
              v61 = 2112;
              v62 = v11;
              v63 = 2112;
              v64 = v13;
              _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s: key: %@, asid: %@", buf, 0x20u);
            }

            v47 = 0u;
            v48 = 0u;
            v45 = 0u;
            v46 = 0u;
            v16 = v12;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v46 != v19)
                    objc_enumerationMutation(v16);
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "dataUsingEncoding:", 4));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "base64EncodedStringWithOptions:", 0));

                  if (v13)
                  {
                    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(",")));
                    v24 = (void *)v23;
                    if (v23)
                    {
                      v56[0] = CFSTR("key");
                      v56[1] = CFSTR("identifier");
                      v57[0] = v11;
                      v57[1] = v22;
                      v56[2] = CFSTR("asid");
                      v57[2] = v23;
                      v25 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 3));
                      -[NSMutableArray addObject:](v4, "addObject:", v25);
                    }
                    else
                    {
                      v26 = handleForCategory(0);
                      v25 = objc_claimAutoreleasedReturnValue(v26);
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v60 = (const char *)v13;
                        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to change asid format: %@", buf, 0xCu);
                      }
                    }

                  }
                  else
                  {
                    v54[0] = CFSTR("key");
                    v54[1] = CFSTR("identifier");
                    v55[0] = v11;
                    v55[1] = v22;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 2));
                    -[NSMutableArray addObject:](v4, "addObject:", v24);
                  }

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
              }
              while (v18);
            }

            v10 = v44 + 1;
            v28 = v42;
          }
          while ((id)(v44 + 1) != v43);
          v43 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
        }
        while (v43);
        v5 = v39;
        v3 = v40;
        v7 = v38;
        v9 = v37;
      }
    }
    else
    {
      v36 = handleForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
      }
    }
  }
  else
  {
    v27 = handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_10003698C((uint64_t)v7, v28, v30, v31, v32, v33, v34, v35);
  }

  if (v3)
    v3[2](v3, v9, v4, v7);

}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *, void *, void *);
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  CRRIK *v41;
  CRRIK *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  NSErrorUserInfoKey v56;
  const __CFString *v57;
  NSErrorUserInfoKey v58;
  const __CFString *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  NSErrorUserInfoKey v62;
  void *v63;
  NSErrorUserInfoKey v64;
  const __CFString *v65;
  NSErrorUserInfoKey v66;
  id v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  id v71;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, void *, void *))a4;
  v55 = 0;
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v69 = "-[CRPreflight issueRepairCert:withReply:]";
    v70 = 2112;
    v71 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s parameters: %@", buf, 0x16u);
  }

  if (!v6)
  {
    v23 = 0;
    v22 = 0;
    goto LABEL_19;
  }
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("miniPreflight")));
  if (v10
    && (v11 = (void *)v10,
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("miniPreflight"))),
        v13 = objc_opt_class(NSNumber),
        isKindOfClass = objc_opt_isKindOfClass(v12, v13),
        v12,
        v11,
        (isKindOfClass & 1) != 0))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("miniPreflight")));
    v16 = objc_msgSend(v15, "BOOLValue");

  }
  else
  {
    v16 = 0;
  }
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socksHost")));
  if (v17
    && (v18 = (void *)v17,
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socksHost"))),
        v20 = objc_opt_class(NSString),
        v21 = objc_opt_isKindOfClass(v19, v20),
        v19,
        v18,
        (v21 & 1) != 0))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socksHost")));
  }
  else
  {
    v22 = 0;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socksPort")));
  if (!v23)
    goto LABEL_18;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socksPort")));
  v25 = objc_opt_class(NSNumber);
  v26 = objc_opt_isKindOfClass(v24, v25);

  if ((v26 & 1) == 0)
  {
    v23 = 0;
LABEL_18:
    v27 = 0;
    v28 = 0;
    if ((v16 & 1) != 0)
      goto LABEL_31;
    goto LABEL_19;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("socksPort")));
  if ((v16 & 1) != 0)
  {
    v27 = 0;
    goto LABEL_28;
  }
LABEL_19:
  v29 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
  v27 = v29;
  if (!v29)
  {
    v53 = v23;
    v35 = v22;
    v46 = CRErrorDomain;
    v66 = NSLocalizedDescriptionKey;
    v37 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get auth ref")));
    v67 = v37;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v46, -85, v47));
LABEL_38:

    goto LABEL_39;
  }
  if (v22 && v23)
    AMAuthInstallSetSOCKSProxyInformation((uint64_t)v29, v22, v23, v30, v31, v32, v33, v34);
  if (+[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault")&& +[CRPersonalizationManager enableSSO:](CRPersonalizationManager, "enableSSO:", v27))
  {
    v53 = v23;
    v35 = v22;
    v36 = CRErrorDomain;
    v64 = NSLocalizedDescriptionKey;
    v65 = CFSTR("Failed to enable SSO");
    v37 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v36, -85, v37));
LABEL_39:
    v42 = 0;
    v28 = 0;
    goto LABEL_40;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v27));
  v54 = 0;
  v40 = objc_msgSend(v39, "getRepairTicket:error:", &v55, &v54);
  v37 = v54;

  if (!v40 || v37)
  {
    v53 = v23;
    v35 = v22;
    v49 = CRErrorDomain;
    v62 = NSLocalizedDescriptionKey;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to get repair ticket: %@"), v37));
    v63 = v47;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v49, -85, v50));

    goto LABEL_38;
  }
LABEL_28:
  v28 = 0;
  if (v22 && v23)
  {
    v60[0] = CFSTR("socksHost");
    v60[1] = CFSTR("socksPort");
    v61[0] = v22;
    v61[1] = v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));
  }
LABEL_31:
  v53 = v23;
  v41 = objc_alloc_init(CRRIK);
  if (v41)
  {
    v42 = v41;
    v35 = v22;
    v43 = objc_claimAutoreleasedReturnValue(-[CRPreflight requestBAACertificates:apticket:proxySettings:](self, "requestBAACertificates:apticket:proxySettings:", v41, v55, v28));
    if (v43)
    {
      v44 = (void *)v43;
      v38 = 0;
      v45 = 1;
      if (!v7)
        goto LABEL_42;
      goto LABEL_41;
    }
    v52 = CRErrorDomain;
    v56 = NSLocalizedDescriptionKey;
    v57 = CFSTR("Request BAA failed");
    v37 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v52, -76, v37));
  }
  else
  {
    v35 = v22;
    v48 = CRErrorDomain;
    v58 = NSLocalizedDescriptionKey;
    v59 = CFSTR("Create RIK failed");
    v37 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v48, -75, v37));
    v42 = 0;
  }
LABEL_40:

  v44 = 0;
  v45 = 0;
  if (v7)
  {
LABEL_41:
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRRIK keyBlob](v42, "keyBlob"));
    v7[2](v7, v45, v51, v44, v38);

  }
LABEL_42:
  AMSupportSafeRelease(v27);

}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, NSMutableArray *, void *);
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  int v23;
  CFDataRef v24;
  uint64_t v25;
  NSObject *v26;
  CFDataRef v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  char v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void (**v40)(id, uint64_t, NSMutableArray *, void *);
  id v41;
  NSMutableArray *v43;
  void *v44;
  id obj;
  uint8_t buf;
  char v47[11];
  int v48;
  const __CFData *v49;
  const __CFData *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[3];
  _QWORD v58[3];
  NSErrorUserInfoKey v59;
  void *v60;
  __int128 bytes;
  int v62;
  _BYTE v63[128];

  v5 = a3;
  v6 = (void (**)(id, uint64_t, NSMutableArray *, void *))a4;
  v7 = objc_opt_new(NSMutableArray);
  v44 = (void *)objc_opt_new(CRComponentSigning);
  if (!v5)
    goto LABEL_5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("challenges")));
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("challenges")));
    v11 = objc_opt_class(NSArray);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("challenges")));
      goto LABEL_6;
    }
LABEL_5:
    v8 = 0;
  }
LABEL_6:
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (!v13)
  {
    v35 = 0;
    v36 = 1;
    goto LABEL_55;
  }
  v14 = v13;
  v43 = v7;
  v40 = v6;
  v41 = v5;
  v15 = *(_QWORD *)v52;
LABEL_8:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v52 != v15)
      objc_enumerationMutation(obj);
    v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v16);
    v49 = 0;
    v50 = 0;
    v48 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("key")));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("nonce")));
    v20 = (void *)v19;
    if (v18)
      v21 = v19 == 0;
    else
      v21 = 1;
    if (v21)
      goto LABEL_44;
    if (objc_msgSend(v18, "isEqual:", CFSTR("vcrt")))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRPreflight sha256Data:](self, "sha256Data:", v20));
      objc_msgSend(v44, "vcrtSign:outSignature:outDeviceNonce:outError:", v22, &v50, &v49, &v48);

LABEL_17:
      v23 = 1;
      goto LABEL_23;
    }
    if (objc_msgSend(v18, "isEqual:", CFSTR("bcrt")))
    {
      objc_msgSend(v44, "bcrtSign:outSignature:outDeviceNonce:outError:", v20, &v50, 0, &v48);
    }
    else
    {
      if (!objc_msgSend(v18, "isEqual:", CFSTR("tcrt")))
      {
        if (!objc_msgSend(v18, "isEqual:", CFSTR("prpc")))
        {
          v33 = handleForCategory(0);
          v32 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            sub_1000369F4(&buf, v47, v32);
          goto LABEL_43;
        }
        objc_msgSend(v44, "prpcSign:outSignature:outDeviceNonce:outError:", v20, &v50, &v49, &v48);
        goto LABEL_17;
      }
      objc_msgSend(v44, "tcrtSign:outSignature:outDeviceNonce:outError:", v20, &v50, 0, &v48);
    }
    v23 = 0;
LABEL_23:
    v24 = v50;
    if (!v50)
    {
      v25 = handleForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(_QWORD *)((char *)&bytes + 4) = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to get strong component signature: %@", (uint8_t *)&bytes, 0xCu);
      }

      bytes = 0uLL;
      v62 = 0;
      v24 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      v50 = v24;
    }
    v27 = v49;
    if (v49)
      v28 = 0;
    else
      v28 = v23;
    if (v28 == 1)
    {
      v29 = handleForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(_QWORD *)((char *)&bytes + 4) = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to get strong component nonce: %@", (uint8_t *)&bytes, 0xCu);
      }

      bytes = 0uLL;
      v62 = 0;
      v27 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      v49 = v27;
      v24 = v50;
    }
    v31 = v27 ? 0 : v23;
    if (!v24 || (v31 & 1) != 0)
      break;
    if (v23)
    {
      v57[0] = CFSTR("key");
      v57[1] = CFSTR("signature");
      v58[0] = v18;
      v58[1] = v24;
      v57[2] = CFSTR("deviceNonce");
      v58[2] = v27;
      v32 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 3));

    }
    else
    {
      v55[0] = CFSTR("key");
      v55[1] = CFSTR("signature");
      v56[0] = v18;
      v56[1] = v24;
      v32 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v56, v55, 2));
    }

    -[NSMutableArray addObject:](v7, "addObject:", v32);
LABEL_43:

LABEL_44:
    if (v14 == (id)++v16)
    {
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      v14 = v34;
      if (!v34)
      {
        v35 = 0;
        v36 = 1;
        goto LABEL_53;
      }
      goto LABEL_8;
    }
  }
  v37 = CRErrorDomain;
  v59 = NSLocalizedDescriptionKey;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to challenge strong component: %@"), v18));
  v60 = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v37, -42, v39));

  v36 = 0;
LABEL_53:
  v6 = v40;
  v5 = v41;
  v7 = v43;
LABEL_55:

  if (v6)
    v6[2](v6, v36, v7, v35);

}

- (id)sign:(id)a3 keyBlob:(id)a4
{
  id v6;
  id v7;
  CRRIK *v8;
  NSObject *p_super;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v13 = handleForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_100036A30();
    goto LABEL_15;
  }
  if (!v6)
  {
    v14 = handleForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_100036A5C();
    goto LABEL_15;
  }
  v8 = -[CRRIK initWithKeyBlob:]([CRRIK alloc], "initWithKeyBlob:", v7);
  if (!v8)
  {
    v15 = handleForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_100036A88();
    goto LABEL_15;
  }
  p_super = &v8->super;
  v10 = objc_claimAutoreleasedReturnValue(-[CRPreflight sha256Data:](self, "sha256Data:", v6));
  if (!v10)
  {
    v16 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100036AB4();

LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sign:](p_super, "sign:", v10));

LABEL_16:
  return v12;
}

- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRRIK *v11;
  NSObject *p_super;
  uint64_t v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v16 = handleForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_100036A30();
    goto LABEL_12;
  }
  v11 = -[CRRIK initWithKeyBlob:]([CRRIK alloc], "initWithKeyBlob:", v10);
  if (!v11)
  {
    v17 = handleForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      sub_100036A88();
    goto LABEL_12;
  }
  p_super = &v11->super;
  v13 = objc_claimAutoreleasedReturnValue(-[CRPreflight sha256Data:](self, "sha256Data:", v8));
  if (!v13)
  {
    v18 = handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100036AB4();

LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v14 = (void *)v13;
  v15 = -[NSObject verify:signature:](p_super, "verify:signature:", v13, v9);

LABEL_13:
  return v15;
}

- (id)sha256Data:(id)a3
{
  id v3;
  char *v4;
  void *v5;
  __int128 v7;

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "length", 0, 0, 0, 0);
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFD)
  {
    v5 = 0;
  }
  else
  {
    CC_SHA256(objc_msgSend(objc_retainAutorelease(v3), "bytes"), (CC_LONG)v4, (unsigned __int8 *)&v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 32));
  }

  return v5;
}

- (id)requestBAACertificates:(id)a3 apticket:(id)a4 proxySettings:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  dispatch_queue_global_t global_queue;
  void *v21;
  NSObject *v22;
  dispatch_time_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint64_t v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  dispatch_semaphore_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[5];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = sub_100003D14;
  v44 = sub_100003D24;
  v45 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = sub_100003D14;
  v38 = sub_100003D24;
  v39 = dispatch_semaphore_create(0);
  if (v7)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attestationBlob"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pubKeyBlob"));
      if (v12)
      {
        if (v8)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, kMAOptionsBAALiveImage4Manifest);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, kMAOptionsBAAClientAttestationData);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kMAOptionsBAAClientAttestationPublicKey);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMAOptionsBAASCRTAttestation);
        v46[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
        v46[1] = kMAOptionsBAAOIDDeviceIdentifiers;
        v46[2] = kMAOptionsBAAOIDHardwareProperties;
        v46[3] = kMAOptionsBAAOIDKeyUsageProperties;
        v46[4] = kMAOptionsBAAOIDDeviceOSInformation;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 5));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, kMAOptionsBAAOIDSToInclude);

        if (v9)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("socksHost")));
          v15 = v14 == 0;

          if (!v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("socksHost")));
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, kMAOptionsSOCKSProxyHost);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("socksPort")));
          v18 = v17 == 0;

          if (!v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("socksPort")));
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, kMAOptionsSOCKSProxyPort);

          }
        }
        global_queue = dispatch_get_global_queue(0, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100003D2C;
        v33[3] = &unk_100050BB0;
        v33[4] = &v40;
        v33[5] = &v34;
        DeviceIdentityIssueClientCertificateWithCompletion(v21, v10, v33);

        v22 = v35[5];
        v23 = dispatch_time(0, 90000000000);
        if (dispatch_semaphore_wait(v22, v23))
        {
          v24 = handleForCategory(0);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            sub_100036B90();
        }
        else
        {
          if (objc_msgSend((id)v41[5], "count"))
          {
            v30 = (id)v41[5];

            goto LABEL_23;
          }
          v32 = handleForCategory(0);
          v25 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            sub_100036B64();
        }

      }
      else
      {
        v28 = handleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_100036B38();

      }
    }
    else
    {
      v27 = handleForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100036B0C();
    }
  }
  else
  {
    v26 = handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100036AE0();
  }
  v30 = 0;
LABEL_23:

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v30;
}

@end
