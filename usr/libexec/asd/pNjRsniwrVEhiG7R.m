@implementation pNjRsniwrVEhiG7R

- (int64_t)getEnvironmentValue
{
  NSNumber *TvHUenoY6Ma3xE12;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;
  SEL v7;

  TvHUenoY6Ma3xE12 = self->TvHUenoY6Ma3xE12;
  if (!TvHUenoY6Ma3xE12)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("environment")));
    v6 = self->TvHUenoY6Ma3xE12;
    self->TvHUenoY6Ma3xE12 = v5;

    TvHUenoY6Ma3xE12 = self->TvHUenoY6Ma3xE12;
  }
  v7 = NSSelectorFromString(CFSTR("integerValue"));
  if ((objc_opt_respondsToSelector(TvHUenoY6Ma3xE12, v7) & 1) != 0)
    return -[NSNumber integerValue](self->TvHUenoY6Ma3xE12, "integerValue");
  else
    return 0;
}

+ (pNjRsniwrVEhiG7R)sharedInstance
{
  if (qword_1005115D0 != -1)
    dispatch_once(&qword_1005115D0, &stru_1004CECB8);
  return (pNjRsniwrVEhiG7R *)(id)qword_1005115C8;
}

+ (int)_ex9HyFJUdpLOOtaX:(id)a3 inS0qtOusqaPbbgj:(id *)a4
{
  id v5;
  const void *ApplePayModelSigning;
  id v7;
  int v8;
  int v9;

  v5 = a3;
  if (!a4)
  {
    v9 = -27002;
    goto LABEL_16;
  }
  ApplePayModelSigning = (const void *)SecPolicyCreateApplePayModelSigning(0);
  v7 = v5;
  v8 = SecCMSVerify();
  if (v8 > -51)
  {
    if (v8 == -50)
    {
      v9 = -27652;
      goto LABEL_13;
    }
    if (!v8)
    {

      v9 = 0;
      *a4 = 0;
      goto LABEL_14;
    }
LABEL_10:
    v9 = -27660;
    goto LABEL_13;
  }
  if (v8 == -26275)
  {
    v9 = -27650;
    goto LABEL_13;
  }
  if (v8 != -25293)
    goto LABEL_10;
  v9 = -27651;
LABEL_13:

LABEL_14:
  if (ApplePayModelSigning)
    CFRelease(ApplePayModelSigning);
LABEL_16:

  return v9;
}

- (pNjRsniwrVEhiG7R)init
{
  pNjRsniwrVEhiG7R *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dPb4ucaLxk7hgr3U;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)pNjRsniwrVEhiG7R;
  v2 = -[pNjRsniwrVEhiG7R init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.asd.rse", 0);
    dPb4ucaLxk7hgr3U = v2->dPb4ucaLxk7hgr3U;
    v2->dPb4ucaLxk7hgr3U = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (id)bfeta0KhydoCRvAc
{
  uint64_t v2;
  int v3;
  int v4;
  NSObject *v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = 0;
  if (-[pNjRsniwrVEhiG7R getEnvironmentValue](self, "getEnvironmentValue"))
    v2 = -3;
  else
    v2 = -2;
  sub_1003D3E48(v2, (uint64_t)&v10, (uint64_t)&v9, (uint64_t)&v11, (uint64_t)&v9 + 4);
  if (v3)
  {
    v4 = v3;
    v5 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D78B0(v4, v5);
    return 0;
  }
  else
  {
    v7 = objc_alloc((Class)NSData);
    v8 = objc_msgSend(v7, "initWithBytes:length:", v11, 16);
    sub_1003D3DF8(v10);
    sub_1003D3DF8(v11);
    return v8;
  }
}

- (id)Z0E7K4HXPkrVY9dm:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return (id)objc_opt_new(*(&off_1004CEE28)[a3]);
}

- (id)zdkFgT82CObMtwJn:(char *)a3 D2AyhLGEbXMCneo6:(unsigned int)a4
{
  int64_t v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  id v10;
  char *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v6 = -[pNjRsniwrVEhiG7R getEnvironmentValue](self, "getEnvironmentValue");
  if (v6 == 2)
  {
    LOBYTE(v18) = -13;
    v7 = &xmmword_100406F91;
  }
  else
  {
    if (v6 != 1)
    {
      v10 = objc_alloc((Class)NSData);
      v12 = a4;
      v11 = a3;
      return objc_msgSend(v10, "initWithBytes:length:", v11, v12, v14, v15, v16, v17, v18);
    }
    LOBYTE(v18) = 58;
    v7 = &xmmword_100406F50;
  }
  v8 = v7[1];
  v14 = *v7;
  v15 = v8;
  v9 = v7[3];
  v16 = v7[2];
  v17 = v9;
  v10 = objc_alloc((Class)NSData);
  v11 = (char *)&v14;
  v12 = 65;
  return objc_msgSend(v10, "initWithBytes:length:", v11, v12, v14, v15, v16, v17, v18);
}

- (id)QRKmlh1jb9SsY8of:(id)a3
{
  id v3;
  unsigned __int8 v4;
  kfUqziMZX9groclW *v5;
  void *v6;
  kfUqziMZX9groclW *v7;
  void *v8;
  void *v9;
  kfUqziMZX9groclW *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[2];

  v3 = a3;
  v4 = objc_msgSend(v3, "endpointID");
  v5 = objc_opt_new(kfUqziMZX9groclW);
  -[kfUqziMZX9groclW setEngineType:](v5, "setEngineType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phone"));
  -[kfUqziMZX9groclW setValue:](v5, "setValue:", v6);

  v7 = objc_opt_new(kfUqziMZX9groclW);
  -[kfUqziMZX9groclW setEngineType:](v7, "setEngineType:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "email"));
  -[kfUqziMZX9groclW setValue:](v7, "setValue:", v8);

  if (v4)
  {
    if (v4 == 2)
    {
      v14[0] = v5;
      v14[1] = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    }
    else
    {
      v9 = &__NSArray0__struct;
    }
  }
  else
  {
    v10 = objc_opt_new(kfUqziMZX9groclW);
    -[kfUqziMZX9groclW setEngineType:](v10, "setEngineType:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    -[kfUqziMZX9groclW setValue:](v10, "setValue:", v11);

    v13[0] = v5;
    v13[1] = v10;
    v13[2] = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));

  }
  return v9;
}

- (id)ygKhjfpV8v6SMJkN:(id)a3
{
  id v4;
  id v5;
  dispatch_semaphore_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  unsigned __int8 md[32];

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10001D148;
  v19 = sub_10001D158;
  v20 = 0;
  v4 = objc_retainAutorelease(a3);
  CC_SHA256(objc_msgSend(v4, "bytes"), (CC_LONG)objc_msgSend(v4, "length"), md);
  v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", md, 32);
  v6 = dispatch_semaphore_create(0);
  v7 = objc_msgSend(objc_alloc((Class)IDSPhoneCertificateVendor), "initWithQueue:", self->dPb4ucaLxk7hgr3U);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001D160;
  v12[3] = &unk_1004CED08;
  v14 = &v15;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v7, "generatePhoneAuthenticationSignatureOverData:withCompletion:", v5, v12);
  v9 = dispatch_time(0, 400000000);
  if (dispatch_semaphore_wait(v8, v9))
    sub_10002D26C(-32007);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  GMWrcan7O3y8iiV3 *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  os_signpost_id_t spid;
  id v42;
  void *v43;
  uint8_t v44[16];
  uint64_t v45;
  _QWORD v46[4];
  int v47;
  unsigned __int8 v48;
  BOOL v49;
  unsigned int v50;
  void *v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  NSErrorUserInfoKey v62;
  const __CFString *v63;
  _BYTE v64[16];
  uint8_t v65[128];
  uint8_t buf[16];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _BYTE v76[128];

  v6 = a3;
  v42 = a4;
  v43 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[pNjRsniwrVEhiG7R QRKmlh1jb9SsY8of:](self, "QRKmlh1jb9SsY8of:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = os_signpost_id_generate((os_log_t)qword_1005185D8);
  v10 = (id)qword_1005185D8;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "pub_1", "enableTelemetry=YES", buf, 2u);
  }
  spid = v9;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[pNjRsniwrVEhiG7R Z0E7K4HXPkrVY9dm:](self, "Z0E7K4HXPkrVY9dm:", objc_msgSend(v18, "engineType")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "WnJ3gJFPRgsreXQi:", v18));
        objc_msgSend(v8, "addEntriesFromDictionary:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v76, 16);
    }
    while (v15);
  }

  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  *(_OWORD *)buf = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v55;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v55 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v26));
        objc_msgSend(v27, "floatValue");
        *(_DWORD *)&buf[4 * (int)objc_msgSend(v26, "intValue")] = v28;

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v23);
  }

  v52 = 0uLL;
  v53 = 0;
  *(_DWORD *)v44 = 0;
  sub_10027ADA4();
  v51 = 0;
  v50 = 0;
  v49 = objc_msgSend(v43, "settingsType", v44) == (id)1;
  v48 = objc_msgSend(v43, "endpointID");
  *(_DWORD *)v44 = 0;
  sub_10027ADA4();
  v29 = *(_DWORD *)v44;
  if (*(_DWORD *)v44)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170, v44, spid));
    v62 = NSLocalizedDescriptionKey;
    v63 = CFSTR("Error during computation");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v30, v29, v31));
    v33 = v42;
    (*((void (**)(id, _QWORD, _QWORD, void *))v42 + 2))(v42, 0, 0, v32);

    if (v51)
      free(v51);
    *(_DWORD *)v44 = 0;
    sub_10027ADA4();
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_10001D9E4;
    v46[3] = &unk_1004CED28;
    v47 = v29;
    AnalyticsSendEventLazy(CFSTR("com.apple.asd.error"), v46);
  }
  else
  {
    v34 = objc_opt_new(GMWrcan7O3y8iiV3);
    *(_OWORD *)v44 = v52;
    v45 = v53;
    -[GMWrcan7O3y8iiV3 YdwGDxa5y8ubHXip:](v34, "YdwGDxa5y8ubHXip:", v44, v44);
    v33 = v42;
    if (v48)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[pNjRsniwrVEhiG7R zdkFgT82CObMtwJn:D2AyhLGEbXMCneo6:](self, "zdkFgT82CObMtwJn:D2AyhLGEbXMCneo6:", v51, v50));
      -[GMWrcan7O3y8iiV3 setPpszCwt7GD641hHj:](v34, "setPpszCwt7GD641hHj:", v35);

    }
    free(v51);
    -[GMWrcan7O3y8iiV3 setRUC18JCl8oMcmXim:](v34, "setRUC18JCl8oMcmXim:", v48);
    v36 = (id)qword_1005185D8;
    v37 = v36;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)v44 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, spid, "pub_1", ", v44, 2u);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[RXs9KixbxmL4RM2Z sharedInstance](RXs9KixbxmL4RM2Z, "sharedInstance"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "KvXBZ2Y159GbeEgH:", v34));

    v40 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v64, 16);
    (*((void (**)(id, void *, id, _QWORD))v42 + 2))(v42, v39, v40, 0);

  }
}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, id);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  PpfPBg3wyAI0Wjzf *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  unsigned __int8 *v36;
  uint64_t i;
  int v38;
  unsigned int v39;
  unsigned int v40;
  char v41;
  char v42;
  int v43;
  unsigned int v44;
  unsigned int v45;
  char v46;
  char v47;
  unsigned int v48;
  int v49;
  void *v50;
  id v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  unint64_t v58;
  _QWORD v60[4];
  int v61;
  _QWORD v62[7];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t v69[8];
  uint8_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint8_t buf[8];
  uint8_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  unsigned int v81;
  void *v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  unsigned int v87;
  __int128 v88;
  uint64_t v89;
  int v90;
  id v91;
  unsigned int v92;
  id v93;
  int v94;
  id v95;
  int v96;
  char v97;
  id v98;
  unsigned int v99;
  int v100;
  id v101;
  unsigned __int8 v102;
  id v103;
  int v104;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD, id))a8;
  v103 = 0;
  v82 = 0;
  v81 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RXs9KixbxmL4RM2Z sharedInstance](RXs9KixbxmL4RM2Z, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "xkNh5bfoCwq3gGYr:", v13));

  if (v20)
  {
    if (v17)
    {
      if (objc_msgSend(v17, "length") == (id)8 && !objc_msgSend(v20, "rUC18JCl8oMcmXim"))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v17));
        objc_msgSend(v21, "appendData:", v17);

        v17 = v21;
      }
    }
    else
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(-[pNjRsniwrVEhiG7R bfeta0KhydoCRvAc](self, "bfeta0KhydoCRvAc"));
    }
    v24 = os_signpost_id_generate((os_log_t)qword_1005185D8);
    v25 = (id)qword_1005185D8;
    v26 = v25;
    v58 = v24 - 1;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "pub_2", "enableTelemetry=YES", buf, 2u);
    }
    spid = v24;

    if (!v14 || !v15 || !v16)
    {
      v27 = objc_opt_new(PpfPBg3wyAI0Wjzf);
      *(_QWORD *)buf = 0;
      v76 = buf;
      v77 = 0x3032000000;
      v78 = sub_10001D148;
      v79 = sub_10001D158;
      v80 = 0;
      *(_QWORD *)v69 = 0;
      v70 = v69;
      v71 = 0x3032000000;
      v72 = sub_10001D148;
      v73 = sub_10001D158;
      v74 = 0;
      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = sub_10001D148;
      v67 = sub_10001D158;
      v68 = 0;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_10001E288;
      v62[3] = &unk_1004CED50;
      v62[4] = buf;
      v62[5] = v69;
      v62[6] = &v63;
      -[PpfPBg3wyAI0Wjzf ILEFYKTi2wz6Hf5l:](v27, "ILEFYKTi2wz6Hf5l:", v62);
      v28 = *((id *)v70 + 5);

      v29 = (id)v64[5];
      v30 = *((id *)v76 + 5);

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(v69, 8);

      _Block_object_dispose(buf, 8);
      v16 = v30;
      v15 = v29;
      v14 = v28;
    }
    *(_QWORD *)buf = 0;
    v76 = 0;
    v77 = 0;
    objc_msgSend(v20, "Xj38ZYkbLwtCgBTH");
    v83 = buf;
    v84 = 0;
    v85 = 1;
    v17 = objc_retainAutorelease(v17);
    v86 = objc_msgSend(v17, "bytes");
    v87 = objc_msgSend(v17, "length");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", 0, 8)));
    v93 = objc_msgSend(v31, "bytes");

    v94 = 8;
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", 8, 8)));
    v95 = objc_msgSend(v32, "bytes");

    v96 = 8;
    v90 = 24;
    v14 = objc_retainAutorelease(v14);
    v91 = objc_msgSend(v14, "bytes");
    v92 = objc_msgSend(v14, "length");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "PpszCwt7GD641hHj")));
    v98 = objc_msgSend(v33, "bytes");

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "PpszCwt7GD641hHj"));
    v99 = objc_msgSend(v34, "length");

    v101 = 0;
    v100 = 1;
    v102 = objc_msgSend(v20, "rUC18JCl8oMcmXim");
    v104 = 0;
    if (v16)
    {
      v97 = 0;
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dataUsingEncoding:", 4)));
      v36 = (unsigned __int8 *)objc_msgSend(v35, "bytes");

      for (i = 0; i != 24; ++i)
      {
        v38 = *v36;
        v39 = v38 - 48;
        v40 = v38 - 97;
        if ((v38 - 65) >= 6)
          v41 = -1;
        else
          v41 = v38 - 55;
        v42 = v38 - 87;
        if (v40 > 5)
          v42 = v41;
        if (v39 < 0xA)
          v42 = v39;
        v43 = v36[1];
        v44 = v43 - 48;
        v45 = v43 - 97;
        if ((v43 - 65) >= 6)
          v46 = -1;
        else
          v46 = v43 - 55;
        v47 = v43 - 87;
        if (v45 > 5)
          v47 = v46;
        if (v44 < 0xA)
          v47 = v44;
        *((_BYTE *)&v88 + i) = v47 | (16 * v42);
        v36 += 2;
      }
    }
    else
    {
      v97 = 1;
      v90 = 24;
      v88 = xmmword_100406FD2;
      v89 = 0x605040302010605;
    }
    v48 = objc_msgSend(v20, "rUC18JCl8oMcmXim");
    if (v48 == 10 || v48 == 2)
    {
      v104 |= 3u;
    }
    else if (!v48)
    {
      v101 = (id)objc_claimAutoreleasedReturnValue(-[pNjRsniwrVEhiG7R ygKhjfpV8v6SMJkN:](self, "ygKhjfpV8v6SMJkN:", v17));
    }
    *(_DWORD *)v69 = 0;
    sub_10027ADA4();
    v49 = *(_DWORD *)v69;
    if (*(_DWORD *)v69)
    {
      if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
        sub_1003D79F0();
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10001E330;
      v60[3] = &unk_1004CED28;
      v61 = v49;
      AnalyticsSendEventLazy(CFSTR("com.apple.asd.error"), v60);
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170, v69, spid));
      v51 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v50, v49, 0));

      v18[2](v18, 0, v51);
    }
    else
    {
      v52 = objc_alloc((Class)NSData);
      v51 = objc_msgSend(v52, "initWithBytes:length:", v82, v81, v69, spid);
      ((void (**)(id, id, id))v18)[2](v18, v51, 0);
    }

    v53 = (id)qword_1005185D8;
    v54 = v53;
    if (v58 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v53))
    {
      *(_WORD *)v69 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_INTERVAL_END, spida, "pub_2", ", v69, 2u);
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[RXs9KixbxmL4RM2Z sharedInstance](RXs9KixbxmL4RM2Z, "sharedInstance"));
    objc_msgSend(v55, "f5FVXJrOBjzaLi8u:", v13);

    free(v82);
    if (v101)

  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, -17, 0));

    v18[2](v18, 0, v23);
  }

}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v35;

  v35 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v26 = a14;
  if (a3)
  {
    v33 = v24;
    v27 = v23;
    v28 = v22;
    v29 = v21;
    v30 = v20;
    v31 = v19;
    v32 = a3;
    a3 = -[ASReleasableBuffer initWithData:]([ASReleasableBuffer alloc], "initWithData:", v32);

    v19 = v31;
    v20 = v30;
    v21 = v29;
    v22 = v28;
    v23 = v27;
    v24 = v33;
  }
  -[pNjRsniwrVEhiG7R zGi22DPZsVGfawap:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:](self, "zGi22DPZsVGfawap:xz5EHXEN4FjlhJbi:uhVTXyAfCFn7u0Ue:EQUjQp7JcQbqcPcD:A5wDLa5TFdFZlz3A:TJKMyOe6zn5PdGIr:eCqgGM0WcnHOslnr:eCszfxdv3kUXvhgV:uWp4aZpP2vLhc04Q:QZYtNpvp0hKd248p:oCwPYmtRv8s31KUH:completion:", a3, v35, v19, v20, v21, v22, a9, a10, v23, v24, v25, v26);

}

- (void)zGi22DPZsVGfawap:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  char v30;
  PpfPBg3wyAI0Wjzf *v31;
  id v32;
  id v33;
  id v34;
  dispatch_semaphore_t v35;
  void *v36;
  dispatch_queue_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  unsigned int v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t *v48;
  id v49;
  id v50;
  unsigned int v51;
  uint64_t *v52;
  id v53;
  unsigned __int8 *v54;
  uint64_t *v55;
  uint64_t i;
  int v57;
  unsigned int v58;
  unsigned int v59;
  char v60;
  char v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  char v65;
  char v66;
  id v67;
  uint64_t *v68;
  unint64_t v69;
  int v70;
  unint64_t v71;
  id v72;
  id v73;
  void *v74;
  unsigned int v75;
  signed int v76;
  id v77;
  id v78;
  void *v79;
  unsigned int v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  uint64_t *v89;
  unsigned int v90;
  _BYTE *v91;
  const void *v92;
  void *v93;
  uint64_t *v94;
  NSObject *v95;
  NSObject *v96;
  dispatch_queue_global_t global_queue;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  uint8_t *v102;
  os_signpost_id_t spid;
  unint64_t v104;
  id v105;
  unsigned int v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  signed int v113;
  _QWORD block[4];
  id v115;
  id v116;
  _QWORD v117[5];
  _QWORD v118[7];
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t);
  void (*v123)(uint64_t);
  id v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, uint64_t);
  void (*v129)(uint64_t);
  id v130;
  unsigned int v131;
  void *v132;
  unsigned int v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint8_t buf[8];
  _BYTE v143[24];
  void (*v144)(uint64_t);
  id v145;
  uint64_t v146;
  int v147;
  _QWORD v148[3];
  __int128 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t v153;
  __n128 (*v154)(uint64_t, uint64_t);
  void (*v155)(uint64_t);
  const char *v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint64_t v172;

  v109 = a3;
  v19 = a4;
  v110 = a5;
  v20 = a6;
  v107 = a7;
  v105 = a8;
  v21 = a11;
  v22 = a12;
  v111 = a13;
  v108 = a14;
  v151 = 0;
  v152 = &v151;
  v154 = sub_10001F1F8;
  v155 = sub_10001F258;
  v153 = 0x12812000000;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v170 = 0u;
  v171 = 0u;
  v156 = "/*0";
  v172 = 0;
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v135 = 0u;
  v149 = xmmword_100406FD2;
  v150 = 0x605040302010605;
  v134 = 0;
  v133 = 0;
  v132 = 0;
  v131 = 0;
  v106 = objc_msgSend(v109, "originalDataLength");
  memset(v148, 0, sizeof(v148));
  v147 = 0;
  v146 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared"));
  objc_msgSend(v23, "pausePrecomputationsWithCompletionHandler:", &stru_1004CED70);

  v24 = v19;
  v25 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v106;
    *(_WORD *)v143 = 2048;
    *(_QWORD *)&v143[2] = a9;
    *(_WORD *)&v143[10] = 2048;
    *(_QWORD *)&v143[12] = a10;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Len = %d, o = %ld, c = %ld", buf, 0x1Cu);
  }
  v26 = os_signpost_id_generate((os_log_t)qword_1005185D8);
  v27 = (id)qword_1005185D8;
  v28 = v27;
  spid = v26;
  v104 = v26 - 1;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "pub_3", "enableTelemetry=YES", buf, 2u);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[YeQHj6zXMU2P8KDh sharedInstance](YeQHj6zXMU2P8KDh, "sharedInstance"));
  objc_msgSend(v29, "cGauGmZFPJJkT1d3:", v110);

  if (v21 && v22 && v111)
  {
    v30 = 0;
  }
  else
  {
    v31 = objc_opt_new(PpfPBg3wyAI0Wjzf);
    *(_QWORD *)buf = 0;
    *(_QWORD *)v143 = buf;
    *(_QWORD *)&v143[8] = 0x3032000000;
    *(_QWORD *)&v143[16] = sub_10001D148;
    v144 = sub_10001D158;
    v145 = 0;
    v125 = 0;
    v126 = &v125;
    v127 = 0x3032000000;
    v128 = sub_10001D148;
    v129 = sub_10001D158;
    v130 = 0;
    v119 = 0;
    v120 = &v119;
    v121 = 0x3032000000;
    v122 = sub_10001D148;
    v123 = sub_10001D158;
    v124 = 0;
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_10001F264;
    v118[3] = &unk_1004CED50;
    v118[4] = buf;
    v118[5] = &v125;
    v118[6] = &v119;
    -[PpfPBg3wyAI0Wjzf ILEFYKTi2wz6Hf5l:](v31, "ILEFYKTi2wz6Hf5l:", v118);
    v32 = (id)v126[5];

    v33 = (id)v120[5];
    v34 = *(id *)(*(_QWORD *)v143 + 40);

    _Block_object_dispose(&v119, 8);
    _Block_object_dispose(&v125, 8);

    _Block_object_dispose(buf, 8);
    if (v34)
    {
      v30 = 0;
      v21 = v32;
      v22 = v33;
      v111 = v34;
    }
    else
    {
      v35 = dispatch_semaphore_create(0);
      v36 = (void *)v152[33];
      v152[33] = (uint64_t)v35;

      v37 = sub_10002A0D8();
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      v117[0] = _NSConcreteStackBlock;
      v117[1] = 3221225472;
      v117[2] = sub_10001F30C;
      v117[3] = &unk_1004CED98;
      v117[4] = &v151;
      sub_10002B3F8(v38, 0, v117);
      v39 = (void *)MGCopyAnswer(CFSTR("UniqueChipID"), 0);
      v40 = objc_msgSend(v39, "longValue");
      *(uint64_t *)((char *)v152 + 249) = bswap64((unint64_t)v40);

      v111 = 0;
      v30 = 1;
      v21 = v32;
      v22 = v33;
    }
  }
  *((_DWORD *)v152 + 43) = 3;
  v41 = objc_retainAutorelease(v105);
  v42 = objc_msgSend(v41, "bytes");
  v152[9] = (uint64_t)v42;
  v43 = objc_msgSend(v41, "length");
  *((_DWORD *)v152 + 20) = v43;
  v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subdataWithRange:", 0, 8)));
  v45 = objc_msgSend(v44, "bytes");
  v152[16] = (uint64_t)v45;

  *((_DWORD *)v152 + 34) = 8;
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "subdataWithRange:", 8, 8)));
  v47 = objc_msgSend(v46, "bytes");
  v152[18] = (uint64_t)v47;

  v48 = v152;
  *((_DWORD *)v152 + 38) = 8;
  *((_DWORD *)v48 + 27) = 24;
  v49 = objc_retainAutorelease(v21);
  v50 = objc_msgSend(v49, "bytes");
  v152[14] = (uint64_t)v50;
  v51 = objc_msgSend(v49, "length");
  v52 = v152;
  *((_DWORD *)v152 + 30) = v51;
  v52[26] = 0;
  *((_BYTE *)v52 + 156) = 0;
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "dataUsingEncoding:", 4)));
  v54 = (unsigned __int8 *)objc_msgSend(v53, "bytes");

  if ((v30 & 1) != 0)
  {
    v55 = v152;
    *((_BYTE *)v152 + 156) = 1;
    *((_DWORD *)v55 + 27) = 24;
    *(_OWORD *)((char *)v55 + 84) = v149;
    *(uint64_t *)((char *)v55 + 100) = v150;
    v55[16] = (uint64_t)&v149;
    v55[18] = (uint64_t)&v149;
    v55[14] = (uint64_t)&v149;
    *((_DWORD *)v55 + 30) = 8;
  }
  else
  {
    for (i = 84; i != 108; ++i)
    {
      v57 = *v54;
      v58 = v57 - 48;
      v59 = v57 - 97;
      if ((v57 - 65) >= 6)
        v60 = -1;
      else
        v60 = v57 - 55;
      v61 = v57 - 87;
      if (v59 > 5)
        v61 = v60;
      if (v58 < 0xA)
        v61 = v58;
      v62 = v54[1];
      v63 = v62 - 48;
      v64 = v62 - 97;
      if ((v62 - 65) >= 6)
        v65 = -1;
      else
        v65 = v62 - 55;
      v66 = v62 - 87;
      if (v64 > 5)
        v66 = v65;
      if (v63 < 0xA)
        v66 = v63;
      *((_BYTE *)v152 + i) = v66 | (16 * v61);
      v54 += 2;
    }
  }
  if (v20)
  {
    v67 = objc_msgSend(v20, "count");
    v68 = v152;
    if (v67)
    {
      v152[34] = (uint64_t)v148;
      v68[35] = (uint64_t)&v146;
      v69 = (unint64_t)objc_msgSend(v20, "count");
      v70 = v69 >= 3 ? 3 : v69;
      v68 = v152;
      *((_DWORD *)v152 + 72) = v70;
      if (v70)
      {
        v71 = 0;
        do
        {
          v72 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v71)));
          v73 = objc_msgSend(v72, "bytes");
          *(_QWORD *)(v152[34] + 8 * v71) = v73;

          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v71));
          v75 = objc_msgSend(v74, "length");
          *(_DWORD *)(v152[35] + 4 * v71) = v75;

          ++v71;
          v68 = v152;
        }
        while (v71 < *((unsigned int *)v152 + 72));
      }
    }
  }
  else
  {
    v68 = v152;
  }
  *((_DWORD *)v68 + 73) = 1;
  if (v24)
  {
    v116 = 0;
    v76 = +[pNjRsniwrVEhiG7R _ex9HyFJUdpLOOtaX:inS0qtOusqaPbbgj:](pNjRsniwrVEhiG7R, "_ex9HyFJUdpLOOtaX:inS0qtOusqaPbbgj:", v24, &v116);
    v77 = v116;
    v78 = v77;
    if (v76)
    {
      v79 = 0;
      goto LABEL_56;
    }
    v80 = objc_msgSend(v77, "length");
    if (!v80)
    {
      v79 = 0;
      v76 = -27600;
      goto LABEL_56;
    }
  }
  else
  {
    v80 = 0;
    v78 = 0;
  }
  if (v106 && (v81 = objc_msgSend(v109, "takeDataAndOwnership")) != 0)
  {
    *((_QWORD *)&v135 + 1) = v81;
    LODWORD(v136) = v106;
    v78 = objc_retainAutorelease(v78);
    v82 = objc_msgSend(v78, "bytes");
    LODWORD(v137) = v80;
    *((_QWORD *)&v136 + 1) = v82;
    *(_QWORD *)&v135 = v152 + 6;
    *((_QWORD *)&v137 + 1) = &v134;
    *(_QWORD *)&v138 = &v133;
    *((_QWORD *)&v138 + 1) = &v132;
    *(_QWORD *)&v139 = &v131;
    *((_QWORD *)&v139 + 1) = v110;
    LODWORD(v140) = a9;
    if (v107 && (a9 & 2) != 0)
    {
      DWORD2(v140) = 2;
      v83 = objc_retainAutorelease(v107);
      *(_QWORD *)&v141 = objc_msgSend(v83, "bytes");
      DWORD2(v141) = objc_msgSend(v83, "length");
    }
    else
    {
      DWORD2(v140) = 1;
    }
    DWORD1(v140) = a10;
    v79 = (void *)os_transaction_create("com.apple.asd.o");
    *(_DWORD *)buf = 0;
    v102 = buf;
    sub_10027ADA4();
    v76 = *(_DWORD *)buf;
    if (!*(_DWORD *)buf)
    {
      v84 = objc_alloc((Class)NSData);
      v85 = objc_msgSend(v84, "initWithBytes:length:", v134, v133, buf);
      v86 = objc_alloc((Class)NSData);
      v87 = objc_msgSend(v86, "initWithBytes:length:", v132, v131);
      (*((void (**)(id, id, id, _QWORD, uint64_t, _QWORD))v108 + 2))(v108, v87, v85, 0, 2, 0);

      v76 = 0;
    }
  }
  else
  {
    v79 = 0;
    v76 = -27823;
  }
LABEL_56:
  if (*((_QWORD *)&v135 + 1))
  {
    free(*((void **)&v135 + 1));
    *((_QWORD *)&v135 + 1) = 0;
  }
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[PrecomputationManager shared](_TtC3asd21PrecomputationManager, "shared", v102));
  objc_msgSend(v88, "resumePrecomputationsWithCompletionHandler:", &stru_1004CEDB8);

  if (v134)
    free(v134);
  if (v132)
    free(v132);
  v89 = v152;
  v90 = *((_DWORD *)v152 + 60);
  if (v90)
  {
    v91 = (_BYTE *)v152[29];
    if (v91)
    {
      sub_10002A0F8(v91, v90);
      v89 = v152;
    }
  }
  v92 = (const void *)v89[28];
  if (v92)
  {
    CFRelease(v92);
    v89 = v152;
    v152[28] = 0;
  }
  v93 = (void *)v89[29];
  if (v93 && *((_DWORD *)v89 + 60))
  {
    free(v93);
    v94 = v152;
    v152[29] = 0;
    *((_DWORD *)v94 + 60) = 0;
  }
  v95 = (id)qword_1005185D8;
  v96 = v95;
  if (v104 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v96, OS_SIGNPOST_INTERVAL_END, spid, "pub_3", ", buf, 2u);
  }

  if ((a10 & 8) != 0)
  {
    v99 = qword_1005185D0;
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_INFO, "Skipping bindings due to bindingsCaptureDisabled flag", buf, 2u);
    }
  }
  else
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v98 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F51C;
    block[3] = &unk_1004CEDE0;
    v115 = v110;
    dispatch_async(v98, block);

  }
  if (v76)
  {
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_10001F560;
    v112[3] = &unk_1004CED28;
    v113 = v76;
    AnalyticsSendEventLazy(CFSTR("com.apple.asd.error"), v112);
    if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
      sub_1003D7A50();
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v100, v76, 0));

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, void *))v108 + 2))(v108, 0, 0, 0, 0xFFFFFFFFLL, v101);
  }

  _Block_object_dispose(&v151, 8);
}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, _QWORD, id);
  id v6;
  void *v7;
  id v8;
  id v9;
  Vr3QrKl7Yn9l4CTz *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v5 = (void (**)(id, id, _QWORD, id))a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PJXBDBF1h0EU80dy sharedInstance](PJXBDBF1h0EU80dy, "sharedInstance"));
  v12 = 0;
  v8 = objc_msgSend(v7, "nYOW3DfIUVSEf2Hm:rTZQrPNUbDSIifrh:", v6, &v12);

  v9 = v12;
  v10 = -[Vr3QrKl7Yn9l4CTz initWithfOZWnqN9bY6jwOMf:]([Vr3QrKl7Yn9l4CTz alloc], "initWithfOZWnqN9bY6jwOMf:", v7);
  -[Vr3QrKl7Yn9l4CTz ppirDXSrO0poQaQJ](v10, "ppirDXSrO0poQaQJ");

  sub_10002A074();
  v11 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Maintenance triggered, purged %ld records", buf, 0xCu);
  }
  v5[2](v5, v8, 0, v9);

}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  dispatch_queue_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;
  id v12;

  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  v5 = sub_10002A0D8();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001F824;
  v10[3] = &unk_1004CEE08;
  v11 = v4;
  v12 = v3;
  v7 = v4;
  v8 = v3;
  sub_10002AA60(v6, v10);
  v9 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v7, v9);

}

- (void)fetchGeoCodingsForAddresses:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a4;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7B48();
  v4[2](v4, 0);

}

- (void)updateGeoCodingsForAddresses:(id)a3 locations:(id)a4
{
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7B74();
}

- (void)updateRavioliWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;

  v3 = (void (**)(id, void *))a3;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7BA0();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v4, 141, 0));
  v3[2](v3, v5);

}

- (void)fetchConfigWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD);

  v3 = (void (**)(id, _QWORD))a3;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7BCC();
  v3[2](v3, 0);

}

- (void)fetchConfigThrowingWithCompletion:(id)a3
{
  id v3;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7BF8();
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);

}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7C24(v7, v8, v9, v10, v11, v12, v13, v14);
}

- (void)dKsJLlNX54lzKt5n:(id)a3 fields:(id)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7C94(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a4;
  v5 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7D04(v5, v6, v7, v8, v9, v10, v11, v12);
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);

}

- (void)dKsJLlNX54lzKt5n:(id)a3 eqF2XJh3hHBJQf2K:(id)a4
{
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
    sub_1003D7D74();
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  void *v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v5 = (void (**)(id, _QWORD, void *))a5;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
    sub_1003D7D74();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
  v9 = NSLocalizedDescriptionKey;
  v10 = CFSTR("Not implemented");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v6, -27006, v7));
  v5[2](v5, 0, v8);

}

- (void)registerICloudLoginWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  NSErrorUserInfoKey v7;
  const __CFString *v8;

  v3 = (void (**)(id, void *))a3;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
    sub_1003D7D74();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
  v7 = NSLocalizedDescriptionKey;
  v8 = CFSTR("Not implemented");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v4, -27006, v5));
  v3[2](v3, v6);

}

- (void)unregisterICloudLoginWithCompletion:(id)a3
{
  void (**v3)(id, void *);
  void *v4;
  void *v5;
  void *v6;
  NSErrorUserInfoKey v7;
  const __CFString *v8;

  v3 = (void (**)(id, void *))a3;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_FAULT))
    sub_1003D7D74();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_100503170));
  v7 = NSLocalizedDescriptionKey;
  v8 = CFSTR("Not implemented");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v4, -27006, v5));
  v3[2](v3, v6);

}

- (void)pRo6qBDnfEL0sBNs:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a5;
  v6 = qword_1005185D0;
  if (os_log_type_enabled((os_log_t)qword_1005185D0, OS_LOG_TYPE_ERROR))
    sub_1003D7DA0(v6, v7, v8, v9, v10, v11, v12, v13);
  (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dPb4ucaLxk7hgr3U, 0);
  objc_storeStrong((id *)&self->TvHUenoY6Ma3xE12, 0);
}

@end
