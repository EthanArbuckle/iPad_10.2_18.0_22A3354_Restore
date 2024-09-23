@implementation APSponsorshipAdTransformer

- (BOOL)copyContentDataId:(id)a3 toNewContentDataId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t v22[16];
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContentData findById:](APManagedContentData, "findById:", a3));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentData"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contextIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v11));
    if (!v12)
    {
      v19 = APLogForCategory(9);
      v13 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find context in the cache", v24, 2u);
      }
      v15 = 0;
      goto LABEL_18;
    }
    v13 = objc_claimAutoreleasedReturnValue(-[APSponsorshipAdTransformer _createContentDataInternalFrom:newContentDataId:](self, "_createContentDataInternalFrom:newContentDataId:", v8, v6));
    if (v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addContentData:", v13));
      v15 = v14 != 0;
      if (v14)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v16 = APLogForCategory(9);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to attach new content data to the context", v22, 2u);
      }

    }
    else
    {
      v20 = APLogForCategory(9);
      v14 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to copy content data", v23, 2u);
      }
    }
    v15 = 0;
    goto LABEL_17;
  }
  v18 = APLogForCategory(9);
  v11 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to find content data in the cache", buf, 2u);
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (id)_createContentDataInternalFrom:(id)a3 newContentDataId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  APContentDataInternal *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[16];
  _BYTE v52[128];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "lockObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentDataPrivate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "impressionIdentifier"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = objc_autoreleasePoolPush();
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentData"));
    v12 = objc_opt_class(APContentData);
    v13 = cloneSecureCodingObject((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentDataPrivate"));
    v16 = objc_opt_class(APContentDataPrivate);
    v17 = cloneSecureCodingObject((uint64_t)v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentDataTransient"));
    v20 = objc_opt_class(APContentDataTransient);
    v21 = cloneSecureCodingObject((uint64_t)v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

    objc_autoreleasePoolPop(v10);
    objc_msgSend(v5, "unlockObject");
    if (v14)
    {
      v46 = v22;
      -[NSObject setIdentifier:](v14, "setIdentifier:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));
      -[NSObject setUniqueIdentifier:](v14, "setUniqueIdentifier:", v24);

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject representations](v14, "representations"));
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v48;
        do
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v48 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v14, "identifier"));
            objc_msgSend(v30, "setContentDataIdentifier:", v31);

            v29 = (char *)v29 + 1;
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v27);
      }

      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[NSObject impressionIdentifier](v18, "impressionIdentifier")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v32, "bytes")));

      if (v33)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
        v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stringByAppendingFormat:", CFSTR("_%@"), v35));

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dataUsingEncoding:](v36, "dataUsingEncoding:", 4));
        v38 = objc_msgSend(v37, "copy");
        -[NSObject setImpressionIdentifier:](v18, "setImpressionIdentifier:", v38);

        v39 = v46;
        v40 = -[APContentDataInternal initWithContent:privateContent:andTransientContent:]([APContentDataInternal alloc], "initWithContent:privateContent:andTransientContent:", v14, v18, v46);
      }
      else
      {
        v44 = APLogForCategory(9);
        v36 = objc_claimAutoreleasedReturnValue(v44);
        v39 = v46;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Can't parse impressionIdentifier.", buf, 2u);
        }
        v40 = 0;
      }

    }
    else
    {
      v42 = APLogForCategory(9);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to clone content data.", buf, 2u);
      }

      v40 = 0;
      v14 = v18;
    }
  }
  else
  {
    objc_msgSend(v5, "unlockObject");
    v41 = APLogForCategory(9);
    v14 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "impressionIdentifier is not set.", buf, 2u);
    }
    v40 = 0;
  }

  return v40;
}

- (BOOL)createContentDataForContextId:(id)a3 contentId:(id)a4 withServerUnfilledReason:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  APContentDataInternal *v14;
  id v15;
  APContentDataInternal *v16;
  NSObject *v17;
  BOOL v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v23;
  int v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v8));
  if (v10)
    goto LABEL_6;
  v11 = objc_claimAutoreleasedReturnValue(-[APSponsorshipAdTransformer _createManagedContextWithId:](self, "_createManagedContextWithId:", v8));
  if (v11)
  {
    v10 = v11;
    v12 = APLogForCategory(34);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v24 = 138543362;
      v25 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created new context ctx:[%{public}@] for Legacy Interface Sponsorship Ad metric", (uint8_t *)&v24, 0xCu);
    }

    a5 = 1010;
LABEL_6:
    v14 = [APContentDataInternal alloc];
    v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v8);
    v16 = -[APContentDataInternal initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:](v14, "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:", a5, 0, v9, v15, 7, 0, 0.0, 0.0);

    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(-[NSObject addContentData:](v10, "addContentData:", v16));
      v18 = v17 != 0;
      if (v17)
      {
LABEL_14:

        goto LABEL_15;
      }
      v19 = APLogForCategory(9);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to attach new content data to the context", (uint8_t *)&v24, 2u);
      }

    }
    else
    {
      v21 = APLogForCategory(9);
      v17 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to create content data with server unfilled reason.", (uint8_t *)&v24, 2u);
      }
    }
    v18 = 0;
    goto LABEL_14;
  }
  v23 = APLogForCategory(9);
  v10 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v24 = 138543362;
    v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create new managed context ctx:[%{public}@] for Legacy Interface metric.", (uint8_t *)&v24, 0xCu);
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (id)_createManagedContextWithId:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc((Class)APContext);
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v3);

  v6 = objc_msgSend(v4, "initWithIdentifier:maxSize:requestedAdIdentifier:currentContent:adjacentContent:supplementalContext:", v5, 0, 0, 0, 0, 0.0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext createManagedContextWithContext:idAccount:](APManagedContext, "createManagedContextWithContext:idAccount:", v6, v7));

  return v8;
}

@end
