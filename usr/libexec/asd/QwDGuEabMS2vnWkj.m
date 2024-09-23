@implementation QwDGuEabMS2vnWkj

- (QwDGuEabMS2vnWkj)initWithsk6s81V5EsZL9icr:(unsigned __int8)a3
{
  QwDGuEabMS2vnWkj *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QwDGuEabMS2vnWkj;
  result = -[QwDGuEabMS2vnWkj init](&v5, "init");
  if (result)
    result->yUeYlMhe6tbatNIz = a3;
  return result;
}

- (void)k0p7Rchr49btq6wB:(id)a3 HY6FXG20397zwmVg:(id)a4
{
  id v5;
  id v6;
  git3vZFAfTws6rT8 *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  uint8_t buf[4];
  git3vZFAfTws6rT8 *v17;

  v5 = a4;
  v6 = a3;
  v7 = -[git3vZFAfTws6rT8 initWithDictionary:]([git3vZFAfTws6rT8 alloc], "initWithDictionary:", v6);

  if (v7)
  {
    if (+[YeQHj6zXMU2P8KDh sensitiveLoggingEnabled](YeQHj6zXMU2P8KDh, "sensitiveLoggingEnabled"))
    {
      v8 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "with %@", buf, 0xCu);
      }
    }
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[git3vZFAfTws6rT8 endpointIdentifier](v7, "endpointIdentifier")));
    objc_msgSend(v9, "UTF8String");

    buf[0] = 0;
    v13 = 0;
    sub_10027ADA4();
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170, &v13));
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("Unknown endpoint identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, -801, v11));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[QwDGuEabMS2vnWkj wrongXPCParameterError](QwDGuEabMS2vnWkj, "wrongXPCParameterError"));
  }
  (*((void (**)(id, _QWORD, _QWORD, void *))v5 + 2))(v5, 0, 0, v12);

}

- (void)VE7BAlWGDSKrO5xc:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 HY6FXG20397zwmVg:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[pNjRsniwrVEhiG7R sharedInstance](pNjRsniwrVEhiG7R, "sharedInstance"));
  objc_msgSend(v19, "QeMnG23X94qgz7jT:hostChallenge:challengeResponse:seid:nonce:completion:", v18, v17, v16, v15, v14, v13);

}

- (void)f9MGfLOgnHPuKTrU:(id)a3 HY6FXG20397zwmVg:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[pNjRsniwrVEhiG7R sharedInstance](pNjRsniwrVEhiG7R, "sharedInstance"));
  objc_msgSend(v7, "ZfE6lVphNUVrZcKx:completion:", v6, v5);

}

- (void)xs00laTiKIpDUzDP:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[pNjRsniwrVEhiG7R sharedInstance](pNjRsniwrVEhiG7R, "sharedInstance"));
  objc_msgSend(v4, "vffg4lwI2HftPvpO:", v3);

}

- (void)SOUWv5VjPwXYslMm:(id)a3 noUfOiGjp1iQmKZX:(id)a4 pPGyXmlDbN3mzzHm:(id)a5 iSOZt67ioKsVcqQZ:(id)a6 hjCrdFOLMJN0Cc5Q:(id)a7 lE40aye8U2u533Ka:(id)a8 JRuZv6Feh9qwrGmN:(unint64_t)a9 Wn0aIR2B54NCtGQc:(unint64_t)a10 B3l3lS18BITy5E4L:(id)a11 UywAszL6AB8Y6LTJ:(id)a12 uNao9X8A82jVmQkK:(id)a13 completion:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  ASReleasableBuffer *v28;
  ASReleasableBuffer *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint8_t buf[16];
  NSErrorUserInfoKey v42;
  const __CFString *v43;

  v40 = a3;
  v38 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  v39 = v23;
  if (a9 <= 4 && v40 && v19 && v20 && v22)
  {
    if ((a9 & 1) != 0)
    {
      v27 = qword_1005185D0;
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "GO C", buf, 2u);
      }
    }
    v37 = v21;
    v28 = -[ASReleasableBuffer initWithData:]([ASReleasableBuffer alloc], "initWithData:", v40);
    if (v28)
    {
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[pNjRsniwrVEhiG7R sharedInstance](pNjRsniwrVEhiG7R, "sharedInstance"));
      v36 = v23;
      v31 = v38;
      objc_msgSend(v30, "zGi22DPZsVGfawap:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:", v29, v38, v19, v20, v37, v22, a9, a10, v36, v24, v25, v26);

      v21 = v37;
    }
    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
      v42 = NSLocalizedDescriptionKey;
      v43 = CFSTR("Error creating buffer");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, -27002, v34));

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, void *))v26 + 2))(v26, 0, 0, 0, 0xFFFFFFFFLL, v35);
      v21 = v37;
      v31 = v38;
    }
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[QwDGuEabMS2vnWkj wrongXPCParameterError](QwDGuEabMS2vnWkj, "wrongXPCParameterError"));
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, void *))v26 + 2))(v26, 0, 0, 0, 0xFFFFFFFFLL, v32);

    v31 = v38;
  }

}

- (void)k4eQYhyzyebbQqys:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[RavioliManagerObjC shared](_TtC3asd18RavioliManagerObjC, "shared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RavioliConstants ravioliUUID](_TtC3asd16RavioliConstants, "ravioliUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DefinedRavioliNotificationIds xpc](_TtC3asd29DefinedRavioliNotificationIds, "xpc"));
  objc_msgSend(v6, "triggerImmediateRavioliFetchWithBagID:notificationId:completion:", v4, v5, v3);

}

- (void)updateGeoCodingsXPC:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, id);
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void (**v34)(id, id);
  id v35;
  void *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v5 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = objc_opt_self(NSDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v47 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ASDGeoCodingKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](ASDGeoCodingKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v8, v5, &v47));
  v10 = v47;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("addresses")));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("locations")));
  v13 = (void *)v12;
  if (v10)
    goto LABEL_2;
  if (!v11)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[QwDGuEabMS2vnWkj wrongXPCParameterError](QwDGuEabMS2vnWkj, "wrongXPCParameterError"));
LABEL_2:
    v6[2](v6, v10);
    goto LABEL_28;
  }
  v36 = v11;
  v37 = (void *)v12;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v44;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v44 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v18);
        v20 = objc_opt_self(CNPostalAddress);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LOBYTE(v19) = objc_opt_isKindOfClass(v19, v21);

        if ((v19 & 1) == 0)
        {
          v10 = (id)objc_claimAutoreleasedReturnValue(+[QwDGuEabMS2vnWkj wrongXPCParameterError](QwDGuEabMS2vnWkj, "wrongXPCParameterError"));
          v6[2](v6, v10);

          goto LABEL_27;
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      if (v16)
        continue;
      break;
    }
  }
  v34 = v6;
  v35 = v5;

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = v37;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    while (2)
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v26);
        v28 = objc_opt_self(CLLocation);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        if ((objc_opt_isKindOfClass(v27, v29) & 1) != 0)
        {

        }
        else
        {
          v30 = objc_opt_self(NSNull);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          isKindOfClass = objc_opt_isKindOfClass(v27, v31);

          if ((isKindOfClass & 1) == 0)
          {
            v10 = (id)objc_claimAutoreleasedReturnValue(+[QwDGuEabMS2vnWkj wrongXPCParameterError](QwDGuEabMS2vnWkj, "wrongXPCParameterError"));
            v6 = v34;
            v34[2](v34, v10);

            goto LABEL_26;
          }
        }
        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v24)
        continue;
      break;
    }
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
  v38 = 0;
  objc_msgSend(v33, "updateGeoCodeForAddresses:locations:error:", v14, v22, &v38);
  v10 = v38;

  v6 = v34;
  v34[2](v34, v10);
LABEL_26:
  v5 = v35;
LABEL_27:
  v11 = v36;
  v13 = v37;
LABEL_28:

}

- (void)fetchGeoCodingsForAddressesXPC:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, id);
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];

  v5 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  v7 = objc_opt_self(NSArray);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v27 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ASDGeoCodingKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](ASDGeoCodingKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", v8, v5, &v27));
  v10 = v27;

  if (v9)
    v11 = v10 == 0;
  else
    v11 = 0;
  if (v11)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v16);
          v18 = objc_opt_self(CNPostalAddress);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          LOBYTE(v17) = objc_opt_isKindOfClass(v17, v19);

          if ((v17 & 1) == 0)
          {
            v10 = (id)objc_claimAutoreleasedReturnValue(+[QwDGuEabMS2vnWkj wrongXPCParameterError](QwDGuEabMS2vnWkj, "wrongXPCParameterError"));
            v6[2](v6, 0, v10);
            goto LABEL_16;
          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v14)
          continue;
        break;
      }
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fetchGeoCodingsForAddresses:", v12));

    v22 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v22));
    v10 = v22;
    ((void (**)(id, void *, id))v6)[2](v6, v21, v10);

LABEL_16:
  }
  else
  {
    v6[2](v6, 0, v10);
  }

}

- (void)fetchConfigWithCompletionXPC:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[ASDConfigurationManager shared](_TtC3asd23ASDConfigurationManager, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configDictionaryForCoreODI"));
  (*((void (**)(id, void *))a3 + 2))(v4, v5);

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id *v16;
  _QWORD v17[4];
  _QWORD *v18;
  _QWORD v19[4];
  _QWORD *v20;
  _QWORD v21[4];
  _QWORD *v22;
  _QWORD v23[4];
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000D578;
  v25[3] = &unk_1004CE870;
  v13 = a7;
  v25[4] = self;
  v26 = v13;
  v14 = objc_retainBlock(v25);
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000D5C0;
    v23[3] = &unk_1004CE8D8;
    v16 = (id *)&v24;
    v24 = v14;
    objc_msgSend(v15, "triggerDuePrecomputationsWithDataProtectionClass:shouldDefer:completionHandler:", 4, &stru_1004CE8B0, v23);
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000D5D0;
    v21[3] = &unk_1004CE900;
    v16 = (id *)&v22;
    v22 = v14;
    objc_msgSend(v15, "triggerAllPrecomputationsWithCompletionHandler:", v21);
    goto LABEL_11;
  }
  if (v12 && !v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000D5E0;
    v19[3] = &unk_1004CE928;
    v16 = (id *)&v20;
    v20 = v14;
    objc_msgSend(v15, "triggerPrecomputationWithWorkflowID:completionHandler:", v12, v19);
    goto LABEL_11;
  }
  if (v12 && v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000D5F0;
    v17[3] = &unk_1004CE928;
    v16 = (id *)&v18;
    v18 = v14;
    objc_msgSend(v15, "triggerPregenerationWithWorkflowID:completionHandler:", v12, v17);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)djoNSwl5j57W5mfl:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
  objc_msgSend(v7, "dKsJLlNX54lzKt5n:eqF2XJh3hHBJQf2K:", v6, v5);

}

- (void)rGvculjlqIwBJaoX:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = (void (**)(id, _QWORD, id))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
  v10 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "evrtH713YbFfEOzk:error:", v6, &v10));

  v9 = v10;
  if (v9)
    v5[2](v5, 0, v9);
  ((void (**)(id, void *, id))v5)[2](v5, v8, 0);

}

- (void)registerICloudLoginWithCompletionXPC:(id)a3
{
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PushCoordinator shared](_TtC3asd15PushCoordinator, "shared"));
  objc_msgSend(v3, "registerICloud");

  v4[2](v4, 0);
}

- (void)unregisterICloudLoginWithCompletionXPC:(id)a3
{
  void *v3;
  Vr3QrKl7Yn9l4CTz *v4;
  void (**v5)(id, _QWORD);

  v5 = (void (**)(id, _QWORD))a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PushCoordinator shared](_TtC3asd15PushCoordinator, "shared"));
  objc_msgSend(v3, "unregister");

  v4 = objc_alloc_init(Vr3QrKl7Yn9l4CTz);
  -[Vr3QrKl7Yn9l4CTz sFFfMcUAtN14Bjc5](v4, "sFFfMcUAtN14Bjc5");

  v5[2](v5, 0);
}

- (void)pRo6qBDnfEL0sBNs:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AssessmentPayloadStore shared](_TtC3asd22AssessmentPayloadStore, "shared"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D8C0;
  v12[3] = &unk_1004CE950;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "fetchFor:withBindings:completionHandler:", v9, v8, v12);

}

+ (id)wrongXPCParameterError
{
  void *v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
  v6 = NSLocalizedDescriptionKey;
  v7 = CFSTR("Error decoding XPC args");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v2, -802, v3));

  return v4;
}

@end
