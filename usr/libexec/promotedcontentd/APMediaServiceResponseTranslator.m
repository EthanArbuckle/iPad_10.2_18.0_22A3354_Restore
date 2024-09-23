@implementation APMediaServiceResponseTranslator

+ (BOOL)checkForNonWKDiscardOverrides:(BOOL)a3 forAdamID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  _QWORD v19[2];

  v5 = a4;
  v6 = objc_alloc((Class)NSUserDefaults);
  v7 = objc_msgSend(v6, "initWithSuiteName:", APDefaultsBundleID);
  if (objc_msgSend(v7, "BOOLForKey:", CFSTR("enableNonWKOverrides")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForKey:", CFSTR("nonWKAppsPromotedContent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(",")));
    v10 = (objc_msgSend(v9, "containsObject:", v5) & 1) != 0 || objc_msgSend(v9, "count") == 0;
    v11 = objc_msgSend(v7, "BOOLForKey:", CFSTR("enableDMAEligible"));
    v12 = APLogForCategory(27);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v18 = 67109376;
      LODWORD(v19[0]) = v10;
      WORD2(v19[0]) = 1024;
      *(_DWORD *)((char *)v19 + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "App discard state after overrides check: isEntitledApp: %d isDMAEligible: %d", (uint8_t *)&v18, 0xEu);
    }

    v14 = !v10 | v11;
    if ((v14 & 1) == 0)
    {
      v15 = APLogForCategory(27);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19[0] = v5;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Discarding ad with adamid: %@ based off overrides.", (uint8_t *)&v18, 0xCu);
      }

    }
    a3 = v14 ^ 1;

  }
  return a3;
}

+ (id)_translateMediaApiResponseToAds:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  v6 = objc_opt_class(NSDictionary);
  if (_checkClassType(v5, v6, CFSTR("Response dictionary"), (uint64_t)a4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("results")));
    v8 = objc_opt_class(NSDictionary);
    if (_checkClassType(v7, v8, CFSTR("Results dictionary"), (uint64_t)a4))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ads")));
      v10 = objc_opt_class(NSArray);
      if (_checkClassType(v9, v10, CFSTR("Ads array"), (uint64_t)a4))
        v11 = v9;
      else
        v11 = 0;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)translateResponse:(id)a3 requestParams:(id)a4 responseReceivedTimestamp:(double)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id obj;
  uint64_t v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];

  v10 = a3;
  v11 = a4;
  v66 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_translateMediaApiResponseToAds:error:", v10, &v66));
  v13 = v66;
  v14 = v13;
  if (!v12 || v13)
  {
    v47 = 0;
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithCode:internalError:](NSError, "errorWithCode:internalError:", 3007, v13));
  }
  else
  {
    v49 = a6;
    v51 = v10;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = objc_alloc_init((Class)NSMutableArray);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "current"));
    v56 = objc_msgSend(v17, "placement");

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v50 = v12;
    obj = v12;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v57)
    {
      v55 = *(_QWORD *)v63;
      v52 = v15;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v55)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          v20 = objc_autoreleasePoolPush();
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "context"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "idAccount"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "iAdID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceResponseTranslator _translateAd:contextID:iAdID:placement:](APMediaServiceResponseTranslator, "_translateAd:contextID:iAdID:placement:", v19, v22, v24, v56));

          if (!v25)
          {
            v33 = APLogForCategory(27);
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v69 = v19;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Translated content for ad:\n%{public}@\ncannot be nil", buf, 0xCu);
            }

            v32 = 0;
            goto LABEL_17;
          }
          objc_msgSend(v25, "setServerResponseReceivedTimestamp:", a5);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "error"));

          if (v26)
          {
            v27 = APLogForCategory(27);
            v28 = objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "error"));
              *(_DWORD *)buf = 138412546;
              v69 = v29;
              v70 = 2114;
              v71 = v19;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error %@ parsing response for ad:\n%{public}@", buf, 0x16u);

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "error"));
            v31 = objc_msgSend(v30, "code");

            if (v31 != (id)2203)
            {
              v32 = v25;
LABEL_17:
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "error"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithCode:internalError:](NSError, "errorWithCode:internalError:", 3008, v35));
              objc_msgSend(v15, "addObject:", v36);

            }
          }
          else
          {
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "representations"));
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v59;
              do
              {
                for (j = 0; j != v39; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v59 != v40)
                    objc_enumerationMutation(v37);
                  v42 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeFront"));
                  objc_msgSend(v42, "setStoreFront:", v43);

                  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storeFrontLocale"));
                  objc_msgSend(v42, "setStoreFrontLocale:", v44);

                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
              }
              while (v39);
            }

            objc_msgSend(v53, "addObject:", v25);
            v15 = v52;
          }

          objc_autoreleasePoolPop(v20);
        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v57);
    }

    v45 = objc_msgSend(v15, "count");
    if (v49 && v45)
    {
      v46 = objc_msgSend(v15, "copy");
      *v49 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithBatchParseErrors:](NSError, "errorWithBatchParseErrors:", v46));

    }
    v47 = objc_msgSend(v53, "copy");

    v12 = v50;
    v10 = v51;
    v14 = 0;
  }

  return v47;
}

+ (id)_translateAd:(id)a3 contextID:(id)a4 iAdID:(id)a5 placement:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  void *v42;
  NSObject *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v66;
  id v67;
  void *v68;
  unsigned int v69;
  void *v70;
  void *v71;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  const __CFString *v83;
  void *v84;
  uint64_t buf;
  __int16 v86;
  unsigned int v87;
  _QWORD v88[2];
  const __CFString *v89;
  const __CFString *v90;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(NSDictionary);
  v82 = 0;
  LODWORD(a5) = _checkClassType(v8, v11, CFSTR("ad"), (uint64_t)&v82);
  v12 = v82;
  v13 = v12;
  if (!(_DWORD)a5)
  {
    v23 = 0;
    v18 = v12;
    v24 = 0;
    v74 = 0;
    goto LABEL_35;
  }
  v14 = v8;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("id")));
  v16 = objc_opt_class(NSString);
  v81 = v13;
  v17 = _checkClassType(v15, v16, CFSTR("adamId (id) is missing."), (uint64_t)&v81);
  v18 = v81;

  if ((v17 & 1) == 0)
  {

    v74 = 0;
    v24 = 0;
    v23 = 0;
    goto LABEL_35;
  }
  v70 = v15;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("attributes")));
  if (v19)
  {
    v80 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v19, 0, &v80));
    if (v80)
    {
      v21 = APLogForCategory(27);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "ERROR: Failed to serialize app attributes data", (uint8_t *)&buf, 2u);
      }
      v69 = 0;
    }
    else
    {
      v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v20, 4);
      if ((-[NSObject containsString:](v22, "containsString:", CFSTR("uses-non-webkit-browser-engine")) & 1) != 0)
        v69 = 1;
      else
        v69 = -[NSObject containsString:](v22, "containsString:", CFSTR("is-custom-browser-engine-app"));
    }

  }
  else
  {
    v69 = 0;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("meta")));
  v26 = objc_opt_class(NSDictionary);
  v79 = v18;
  v27 = _checkClassType(v25, v26, CFSTR("meta dictionary in ad"), (uint64_t)&v79);
  v28 = v79;

  v68 = v25;
  if (v27)
  {
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", CFSTR("adResult")));
    v30 = v25;
    v31 = (void *)v29;
    v67 = objc_msgSend(v30, "mutableCopy");
    objc_msgSend(v67, "removeObjectForKey:", CFSTR("adResult"));
    v32 = objc_opt_class(NSString);
    v78 = v28;
    v33 = _checkClassType(v31, v32, CFSTR("adResult"), (uint64_t)&v78);
    v34 = v78;

    v74 = v31;
    if (!v33)
    {
      v42 = v67;
LABEL_29:
      v23 = objc_msgSend(v42, "copy");

      v28 = v34;
      goto LABEL_30;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "dataUsingEncoding:", 4));
    if (v35)
    {
      v77 = v34;
      v36 = (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v35, 0, &v77));
      v37 = v77;

      if (v37
        || (v38 = objc_opt_class(NSDictionary),
            v76 = 0,
            v39 = _checkClassType(v36, v38, CFSTR("ad JSON object"), (uint64_t)&v76),
            v37 = v76,
            !v39))
      {
        v42 = v67;
LABEL_28:

        v34 = v37;
        goto LABEL_29;
      }
      v36 = v36;

      v34 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectForKey:", CFSTR("passthroughAdInfo")));
      if (v34)
      {
        v40 = objc_opt_class(NSDictionary);
        v75 = v37;
        v41 = _checkClassType(v34, v40, CFSTR("passthroughAdInfo"), (uint64_t)&v75);
        v66 = v75;

        if (v41)
        {
          v42 = v67;
          objc_msgSend(v67, "setValue:forKey:", v34, CFSTR("passthroughAdInfo"));
          v74 = v36;
        }
        else
        {
          v74 = v36;
          v42 = v67;
        }
        v37 = v66;
      }
      else
      {
        v74 = v36;
        v42 = v67;
      }
    }
    else
    {
      v89 = CFSTR("reason");
      v90 = CFSTR("Cannot convert adResult string to NSData.");
      v36 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
      v37 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), 2201, v36));
      v42 = v67;
    }

    goto LABEL_28;
  }
  v23 = 0;
  v74 = 0;
LABEL_30:
  v24 = v70;

  if (v69)
  {
    v88[0] = CFSTR("uses-non-webkit-browser-engine");
    v88[1] = CFSTR("is-custom-browser-engine-app");
    v43 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 2));
    v44 = +[ASDAppCapabilities isCapableOfAction:capabilities:](ASDAppCapabilities, "isCapableOfAction:capabilities:", 4, v43);
    v45 = v44 ^ 1;
    v46 = APLogForCategory(27);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      buf = 0x104000200;
      v86 = 1024;
      v87 = v44;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "App discard state: isEntitledApp: %d isDMAEligible: %d", (uint8_t *)&buf, 0xEu);
    }

    v24 = v70;
    goto LABEL_38;
  }
  v18 = v28;
LABEL_35:
  v48 = APLogForCategory(27);
  v43 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    buf = 67109120;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "App discard state: isEntitledApp: %d", (uint8_t *)&buf, 8u);
  }
  v45 = 0;
  v28 = v18;
LABEL_38:

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))LODWORD(v45) = objc_msgSend(a1, "checkForNonWKDiscardOverrides:forAdamID:", v45, v24);
  if (v28 || !v24)
  {
    v59 = _contentDataWithContextIDAndError(v9, v28);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v59);
  }
  else if ((_DWORD)v45)
  {
    v83 = CFSTR("reason");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Discarding App with AdamID: %@ due to failing eligibility"), v24));
    v84 = v49;
    v71 = v24;
    v50 = v9;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), 2203, v51));

    v53 = 1;
    if (a6 != 7005)
      v53 = -1;
    if (a6 - 7006 >= 3)
      v54 = v53;
    else
      v54 = a6 - 7004;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v55, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("wasServed"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v54));
    objc_msgSend(v55, "setValue:forKey:", v56, CFSTR("placement"));

    v9 = v50;
    v24 = v71;
    AnalyticsSendEvent(CFSTR("com.apple.adplatforms.nonWebKitAdverts"), v55);
    v57 = _contentDataWithContextIDAndError(v9, v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);

  }
  else
  {
    v60 = v9;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_translateAdResult:contextID:iAdID:", v74, v9, v10));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "representations"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "anyObject"));

    objc_msgSend(v62, "setAdamID:", v24);
    if (v23)
    {
      v63 = objc_msgSend(v8, "mutableCopy");
      objc_msgSend(v63, "setObject:forKeyedSubscript:", v23, CFSTR("meta"));
      v64 = objc_msgSend(v63, "copy");
      objc_msgSend(v62, "setAppMetadata:", v64);

    }
    v9 = v60;
  }

  return v58;
}

+ (id)_translateAdResult:(id)a3 contextID:(id)a4 iAdID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  id v27;
  id v28;
  APPBTransparencyDetails *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  char v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  char v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  char v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  char v52;
  id v53;
  void *v54;
  uint64_t v55;
  char v56;
  void *v57;
  uint64_t v58;
  char v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  char v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  char v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  char v79;
  id v80;
  id v81;
  id v83;
  uint64_t v84;
  char v85;
  id v86;
  void *v87;
  uint64_t v88;
  char v89;
  char *v90;
  char *v91;
  uint64_t v92;
  NSObject *v93;
  id v94;
  id v95;
  uint64_t v96;
  char v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  int v104;
  id v105;
  id v106;
  uint64_t v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id obj;
  uint64_t v114;
  APPBTransparencyDetails *v115;
  void *v116;
  id v117;
  id v118;
  id v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  _BYTE v141[128];
  const __CFString *v142;
  void *v143;
  uint8_t buf[4];
  char *v145;

  v7 = a3;
  v8 = a5;
  v9 = _contentDataWithContextID(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "setReceivedReferenceTime:", v11);

  v12 = objc_alloc_init((Class)APRepresentationData);
  objc_msgSend(v12, "setPlacementType:", 5);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  objc_msgSend(v12, "setContentDataIdentifier:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("impressionId")));
  v15 = objc_opt_class(NSString);
  v140 = 0;
  LOBYTE(v13) = _checkClassType(v14, v15, CFSTR("impressionId"), (uint64_t)&v140);
  v16 = v140;
  if ((v13 & 1) != 0)
  {
    v17 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v14);
    objc_msgSend(v12, "setImpressionID:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "impressionID"));
    v19 = objc_opt_class(NSUUID);
    v139 = v16;
    v20 = _checkClassType(v18, v19, CFSTR("impressionId type"), (uint64_t)&v139);
    v21 = v139;

    if ((v20 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("metadata")));

      v23 = objc_opt_class(NSString);
      v138 = v21;
      v24 = _checkClassType(v22, v23, CFSTR("metadata"), (uint64_t)&v138);
      v16 = v138;

      if ((v24 & 1) != 0)
      {
        v118 = v8;
        objc_msgSend(v12, "setMetadata:", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("privacy")));

        v25 = objc_opt_class(NSString);
        v137 = v16;
        v26 = _checkClassType(v14, v25, CFSTR("privacy"), (uint64_t)&v137);
        v27 = v137;

        if ((v26 & 1) != 0)
        {
          v28 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v14, 0);
          v29 = -[APPBTransparencyDetails initWithData:]([APPBTransparencyDetails alloc], "initWithData:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTransparencyDetails transparencyRendererPayload](v29, "transparencyRendererPayload"));
          objc_msgSend(v10, "setDisclosureRendererPayload:", v30);

          if (-[APPBTransparencyDetails hasTransparencyRendererURL](v29, "hasTransparencyRendererURL"))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTransparencyDetails transparencyRendererURL](v29, "transparencyRendererURL"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v31));
            objc_msgSend(v10, "setDisclosureURL:", v32);

          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("targetingExpressionId")));

          if (v33)
          {
            v34 = objc_opt_class(NSString);
            v136 = v27;
            v35 = _checkClassType(v33, v34, CFSTR("targetingExpressionId"), (uint64_t)&v136);
            v16 = v136;

            if ((v35 & 1) == 0)
            {
              objc_msgSend(v10, "setError:", v16);
              v62 = v10;
              v8 = v118;
LABEL_46:

              v14 = v33;
              goto LABEL_47;
            }
            v117 = v28;
            objc_msgSend(v10, "setTargetingExpressionId:", v33);
          }
          else
          {
            v117 = v28;
            v16 = v27;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("journeyRelay")));
          v41 = objc_opt_class(NSDictionary);
          v135 = v16;
          v42 = _checkClassType(v40, v41, CFSTR("journeyRelay"), (uint64_t)&v135);
          v43 = v135;

          if ((v42 & 1) == 0)
          {
            objc_msgSend(v10, "setError:", v43);
            v61 = v10;
LABEL_45:

            v16 = v43;
            v28 = v117;
            v8 = v118;
            goto LABEL_46;
          }
          v115 = v29;
          v116 = v40;
          v44 = v40;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("adGroupId")));

          v46 = objc_opt_class(NSNumber);
          v134 = v43;
          v47 = _checkClassType(v45, v46, CFSTR("adGroupId"), (uint64_t)&v134);
          v48 = v134;

          if ((v47 & 1) == 0)
            goto LABEL_41;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringValue"));
          objc_msgSend(v12, "setJourneyRelayAdGroupId:", v49);

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKey:", CFSTR("campaignId")));
          v51 = objc_opt_class(NSNumber);
          v133 = v48;
          v52 = _checkClassType(v50, v51, CFSTR("campaignId"), (uint64_t)&v133);
          v53 = v133;

          if ((v52 & 1) != 0)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "stringValue"));
            objc_msgSend(v12, "setJourneyRelayCampaignId:", v54);

            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("clientRequestId")));
            v55 = objc_opt_class(NSString);
            v132 = v53;
            v56 = _checkClassType(v45, v55, CFSTR("clientRequestId"), (uint64_t)&v132);
            v48 = v132;

            if ((v56 & 1) == 0)
              goto LABEL_41;
            objc_msgSend(v12, "setClientRequestID:", v45);
            v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("parentAppCheckEnabled")));

            if (v57)
            {
              v58 = objc_opt_class(NSNumber);
              v131 = v48;
              v59 = _checkClassType(v57, v58, CFSTR("parentAppCheckEnabled"), (uint64_t)&v131);
              v60 = v131;

              if ((v59 & 1) == 0)
              {
                v63 = v44;
                objc_msgSend(v10, "setError:", v60);
                v70 = v10;
                v45 = v57;
LABEL_34:
                v48 = v60;
                goto LABEL_44;
              }
              objc_msgSend(v12, "setParentAppCheckEnabled:", objc_msgSend(v57, "BOOLValue"));
            }
            else
            {
              v60 = v48;
            }
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("installAttribution")));

            v65 = objc_opt_class(NSDictionary);
            v130 = v60;
            v66 = _checkClassType(v45, v65, CFSTR("installAttribution"), (uint64_t)&v130);
            v48 = v130;

            if ((v66 & 1) == 0)
            {
LABEL_41:
              v63 = v44;
              goto LABEL_42;
            }
            objc_msgSend(v12, "setInstallAttribution:", v45);
            if ((+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall") & 1) != 0)
            {
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[APMediaServiceSettings settings](APMediaServiceSettings, "settings"));
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "responseTTL"));

              if (v68)
              {
                v69 = objc_opt_class(NSNumber);
                if ((objc_opt_isKindOfClass(v68, v69) & 1) != 0 && (int)objc_msgSend(v68, "intValue") > 0)
                {
                  v45 = v68;
                  v53 = v48;
                  goto LABEL_37;
                }
              }
            }
            else
            {

              v68 = 0;
            }
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ttl")));

            v71 = objc_opt_class(NSNumber);
            v129 = v48;
            v72 = _checkClassType(v45, v71, CFSTR("ttl"), (uint64_t)&v129);
            v53 = v129;

            if ((v72 & 1) != 0)
            {
LABEL_37:
              v73 = v45;
              v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
              v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "dateByAddingTimeInterval:", (double)(int)objc_msgSend(v73, "intValue")));
              objc_msgSend(v10, "setExpirationDate:", v75);

              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("rank")));
              v76 = objc_opt_class(NSNumber);
              v128 = v53;
              LOBYTE(v75) = _checkClassType(v45, v76, CFSTR("rank"), (uint64_t)&v128);
              v48 = v128;

              if ((v75 & 1) != 0)
              {
                objc_msgSend(v12, "setRank:", (int)objc_msgSend(v45, "intValue"));
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("timeToDisplay")));

                if (v77)
                {
                  v78 = objc_opt_class(NSNumber);
                  v127 = v48;
                  v79 = _checkClassType(v77, v78, CFSTR("timeToDisplay"), (uint64_t)&v127);
                  v80 = v127;

                  if ((v79 & 1) == 0)
                  {
                    v63 = v44;
                    objc_msgSend(v10, "setError:", v80);
                    v94 = v10;
                    v45 = v77;
                    v48 = v80;
                    goto LABEL_44;
                  }
                  objc_msgSend(v12, "setTimeToDisplay:", (int)objc_msgSend(v77, "intValue"));
                }
                else
                {
                  v80 = v48;
                }
                v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("positionInfo")));

                v63 = v44;
                if (!v45)
                  goto LABEL_64;
                v84 = objc_opt_class(NSDictionary);
                v126 = v80;
                v85 = _checkClassType(v45, v84, CFSTR("positionInfo"), (uint64_t)&v126);
                v60 = v126;

                if ((v85 & 1) != 0)
                {
                  v86 = v45;
                  if (objc_msgSend(v86, "count"))
                  {
                    objc_msgSend(v12, "setPositionInformation:", v86);
                    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "positionInformation"));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKey:", CFSTR("slot")));

                    v88 = objc_opt_class(NSNumber);
                    v125 = v60;
                    v89 = _checkClassType(v45, v88, CFSTR("slot"), (uint64_t)&v125);
                    v48 = v125;

                    if ((v89 & 1) != 0)
                    {
                      v90 = (char *)objc_msgSend(v45, "integerValue");
                      v91 = v90;
                      if ((unint64_t)(v90 - 1) < 0xA)
                      {
                        if ((unint64_t)v90 >= 3)
                        {
                          v92 = APLogForCategory(27);
                          v93 = objc_claimAutoreleasedReturnValue(v92);
                          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 134217984;
                            v145 = v91;
                            _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "Slot number: %ld", buf, 0xCu);
                          }

                        }
                        objc_msgSend(v12, "setSlotNumber:", v91);
                        goto LABEL_63;
                      }
                      v107 = APLogForCategory(27);
                      v108 = objc_claimAutoreleasedReturnValue(v107);
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 134217984;
                        v145 = v91;
                        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "Unexpected slot: %ld", buf, 0xCu);
                      }

                      v142 = CFSTR("reason");
                      v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unexpected slot: %ld"), v91));
                      v143 = v109;
                      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1));
                      v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.MediaServiceRequest"), 2201, v110));

                      objc_msgSend(v10, "setError:", v111);
                      v112 = v10;

                    }
                    else
                    {
                      objc_msgSend(v10, "setError:", v48);
                      v106 = v10;
                    }

                    goto LABEL_44;
                  }
                  v45 = v86;
                  v48 = v60;
LABEL_63:

                  v80 = v48;
LABEL_64:
                  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("cppIds")));
                  if (!v45)
                  {
                    v48 = v80;
LABEL_76:
                    objc_msgSend(v12, "setIAdID:", v118);
                    objc_msgSend(v10, "addRepresentation:", v12);
                    goto LABEL_43;
                  }
                  v96 = objc_opt_class(NSArray);
                  v124 = v80;
                  v97 = _checkClassType(v45, v96, CFSTR("cppIds"), (uint64_t)&v124);
                  v48 = v124;

                  if ((v97 & 1) != 0)
                  {
                    v120 = 0u;
                    v121 = 0u;
                    v122 = 0u;
                    v123 = 0u;
                    obj = v45;
                    v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v141, 16);
                    if (v98)
                    {
                      v99 = v98;
                      v114 = *(_QWORD *)v121;
                      while (2)
                      {
                        v100 = 0;
                        v101 = v48;
                        do
                        {
                          if (*(_QWORD *)v121 != v114)
                            objc_enumerationMutation(obj);
                          v102 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)v100);
                          v103 = objc_opt_class(NSString);
                          v119 = v101;
                          v104 = _checkClassType(v102, v103, CFSTR("CPP_ID"), (uint64_t)&v119);
                          v48 = v119;

                          if (!v104)
                          {
                            objc_msgSend(v10, "setError:", v48);
                            v105 = v10;
                            v45 = obj;

                            goto LABEL_44;
                          }
                          v100 = (char *)v100 + 1;
                          v101 = v48;
                        }
                        while (v99 != v100);
                        v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v141, 16);
                        if (v99)
                          continue;
                        break;
                      }
                    }

                    objc_msgSend(v12, "setCppIds:", obj);
                    goto LABEL_76;
                  }
LABEL_42:
                  objc_msgSend(v10, "setError:", v48);
LABEL_43:
                  v81 = v10;
                  goto LABEL_44;
                }
                objc_msgSend(v10, "setError:", v60);
                v95 = v10;
                goto LABEL_34;
              }
              goto LABEL_41;
            }
            v63 = v44;
            objc_msgSend(v10, "setError:", v53);
            v83 = v10;
          }
          else
          {
            v63 = v44;
            objc_msgSend(v10, "setError:", v53);
            v64 = v10;
            v45 = v50;
          }
          v48 = v53;
LABEL_44:
          v29 = v115;
          v40 = v116;

          v33 = v45;
          v43 = v48;
          goto LABEL_45;
        }
        objc_msgSend(v10, "setError:", v27);
        v39 = v10;
        v16 = v27;
        v8 = v118;
      }
      else
      {
        objc_msgSend(v10, "setError:", v16);
        v38 = v10;
        v14 = v22;
      }
    }
    else
    {
      objc_msgSend(v10, "setError:", v21);
      v37 = v10;
      v16 = v21;
    }
  }
  else
  {
    objc_msgSend(v10, "setError:", v16);
    v36 = v10;
  }
LABEL_47:

  return v10;
}

@end
