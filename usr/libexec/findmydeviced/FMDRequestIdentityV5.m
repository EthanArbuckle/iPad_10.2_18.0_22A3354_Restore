@implementation FMDRequestIdentityV5

- (FMDRequestIdentityV5)initWithProvider:(id)a3 identityInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FMDRequestIdentityV5 *v9;
  id v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestIdentityV5;
  v9 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v8);

  if (v9)
  {
    -[FMDRequestIdentityV5 setProvider:](v9, "setProvider:", v6);
    v10 = objc_msgSend(v7, "timeoutIntervalInSec");
    if ((uint64_t)v10 >= 0)
      v11 = (uint64_t)v10;
    else
      v11 = 60;
    -[FMDRequestIdentityV5 setBaaIdentityTimeoutIntervalInSec:](v9, "setBaaIdentityTimeoutIntervalInSec:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandID"));
    -[FMDRequestIdentityV5 setCommandID:](v9, "setCommandID:", v12);

  }
  return v9;
}

- (id)requestUrl
{
  void *v3;
  void *v4;
  RequestTemplateURL *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceUDID"));

  v5 = objc_alloc_init(RequestTemplateURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 provider](self, "provider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RequestTemplateURL urlFromTemplate:account:udid:](v5, "urlFromTemplate:account:udid:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/identityV5"), v7, v4));

  return v8;
}

- (id)requestHeaders
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FMDRequestIdentityV5;
  v3 = -[FMDRequest requestHeaders](&v15, "requestHeaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 signatureHeader](self, "signatureHeader"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Mme-Sign1"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 skAuthHeader](self, "skAuthHeader"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Mme-Sign2"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 baaAttestationHeader](self, "baaAttestationHeader"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Mme-Sign5"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 baaSignatureHeader](self, "baaSignatureHeader"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Mme-Sign6"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 activationLockRequestUUID](self, "activationLockRequestUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-AL-ID"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 signatureError](self, "signatureError"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-Sign1-Error"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 baaError](self, "baaError"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-Sign5-Error"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 baaErrorDescription](self, "baaErrorDescription"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-Sign5-Error-Desc"), v13);

  return v4;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  FMDActingRequestDecorator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)FMDRequestIdentityV5;
  v3 = -[FMDRequest requestBody](&v44, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 provider](self, "provider"));
  if (v5)
  {
    v6 = objc_alloc_init(FMDActingRequestDecorator);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](v6, "standardDeviceContext"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("dsid"), v9);

    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identityDeviceInfoForAccount:", v11));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceInfo"), v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 commandID](self, "commandID"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("cmdId"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "internationalMobileEquipmentIdentity"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("imei"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "internationalMobileEquipmentIdentityTwo"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("imei2"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mobileEquipmentIdentifier"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("meid"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serialNumber"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "escrowHash"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "hexString"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("escrowHash"), v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ecid"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), objc_msgSend(v26, "longLongValue")));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("ecid"), v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "chipId"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), objc_msgSend(v29, "longLongValue")));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("chipId"), v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "wifiMacAddress"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("wifiMac"), v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "btMacAddress"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("btMac"), v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
  v43 = 0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "inFieldCollectionReceipt:", &v43));
  v37 = v43;
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("ifcReceipt"), v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "fm_commaSeparatedString"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("collectionError"), v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  LODWORD(v36) = objc_msgSend(v39, "isInternalBuild");

  if ((_DWORD)v36)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "description"));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("collectionErrorDetail"), v40);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[FMDRequestIdentityV5 setActivationLockRequestUUID:](self, "setActivationLockRequestUUID:", v41);
  -[FMDRequestIdentityV5 _calculateSignatureForBody:](self, "_calculateSignatureForBody:", v4);

  return v4;
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
}

- (BOOL)canRequestBeRetriedNow
{
  objc_super v4;

  if ((id)-[FMDRequest httpResponseStatus](self, "httpResponseStatus") == (id)501)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)FMDRequestIdentityV5;
  return -[FMDRequest canRequestBeRetriedNow](&v4, "canRequestBeRetriedNow");
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v8 = objc_opt_class(self, v7);
    isKindOfClass = objc_opt_isKindOfClass(v4, v8);
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_calculateSignatureForBody:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  int64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  FMDALFailureAnalyticsManager *v41;
  id WeakRetained;
  FMDALFailureAnalyticsManager *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  uint64_t *v54;
  __int128 *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  int64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  unsigned __int8 md[32];

  v4 = a3;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 activationLockRequestUUID](self, "activationLockRequestUUID"));
  -[FMDRequestIdentityV5 setSignatureHeader:](self, "setSignatureHeader:", 0);
  -[FMDRequestIdentityV5 setSkAuthHeader:](self, "setSkAuthHeader:", 0);
  -[FMDRequestIdentityV5 setRequestBodyDataForSignature:](self, "setRequestBodyDataForSignature:", 0);
  -[FMDRequestIdentityV5 setBaaSignatureHeader:](self, "setBaaSignatureHeader:", 0);
  -[FMDRequestIdentityV5 setBaaAttestationHeader:](self, "setBaaAttestationHeader:", 0);
  if (v4)
  {
    v70 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 0, &v70));
    v6 = v70;
    -[FMDRequestIdentityV5 setRequestBodyDataForSignature:](self, "setRequestBodyDataForSignature:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 requestBodyDataForSignature](self, "requestBodyDataForSignature"));
    LODWORD(v5) = v7 == 0;

    if ((_DWORD)v5)
    {
      v8 = sub_1000031B8();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100228F70(self, v9);

    }
    if (v6)
    {
      v10 = sub_1000031B8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100228EEC(self);

      v12 = sub_100052EEC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100228E68(self);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 requestBodyDataForSignature](self, "requestBodyDataForSignature"));
  v15 = v14 == 0;

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authHeaderValue](self, "authHeaderValue"));
    if (objc_msgSend(v50, "length"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dataUsingEncoding:", 4));
      objc_msgSend(v16, "appendData:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestIdentityV5 requestBodyDataForSignature](self, "requestBodyDataForSignature"));
    objc_msgSend(v16, "appendData:", v18);

    v19 = objc_retainAutorelease(v16);
    CC_SHA256(objc_msgSend(v19, "bytes"), (CC_LONG)objc_msgSend(v19, "length"), md);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 32));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMDAbsintheV3SigningInterface sharedInterface](FMDAbsintheV3SigningInterface, "sharedInterface"));
    v69 = 0;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "signatureForData:requestUUID:mode:error:", v20, v51, 0, &v69));
    v22 = v69;

    if (v22)
    {
      v23 = objc_msgSend(v22, "code");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "userInfo"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("kFMDUnderlyingErrorCodeKey")));
      v26 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld,%ld"), v23, objc_msgSend(v25, "integerValue")));
      -[FMDRequestIdentityV5 setSignatureError:](self, "setSignatureError:", v26);
    }
    else
    {
      if (objc_msgSend(v49, "count") != (id)2)
        goto LABEL_19;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "base64EncodedString"));

      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectAtIndexedSubscript:", 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "base64EncodedString"));

      -[FMDRequestIdentityV5 setSignatureHeader:](self, "setSignatureHeader:", v24);
      v46 = sub_1000031B8();
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v73) = 138412290;
        *(_QWORD *)((char *)&v73 + 4) = v24;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Signature header: %@", (uint8_t *)&v73, 0xCu);
      }

      -[FMDRequestIdentityV5 setSkAuthHeader:](self, "setSkAuthHeader:", v25);
      v48 = sub_1000031B8();
      v26 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v73) = 138412290;
        *(_QWORD *)((char *)&v73 + 4) = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SkAuth header: %@", (uint8_t *)&v73, 0xCu);
      }
    }

LABEL_19:
    v27 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    *(_QWORD *)&v73 = 0;
    *((_QWORD *)&v73 + 1) = &v73;
    v74 = 0x3032000000;
    v75 = sub_10004F154;
    v76 = sub_10004F164;
    v77 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = sub_10004F154;
    v67 = sub_10004F164;
    v68 = 0;
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = sub_10004F154;
    v61 = sub_10004F164;
    v62 = 0;
    v28 = objc_msgSend(objc_alloc((Class)FMDIdentitySigningRequest), "initWithData:", v20);
    v29 = sub_1000031B8();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = -[FMDRequestIdentityV5 baaIdentityTimeoutIntervalInSec](self, "baaIdentityTimeoutIntervalInSec");
      *(_DWORD *)buf = 134217984;
      v72 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Sign Using BAA with timeout: %lu seconds", buf, 0xCu);
    }

    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10004F16C;
    v52[3] = &unk_1002C2F20;
    v54 = &v57;
    v55 = &v73;
    v56 = &v63;
    v32 = objc_msgSend(objc_alloc((Class)FMSynchronizer), "initWithDescription:andTimeout:", CFSTR("FMDRequestIdentityV5.BAASigning"), (double)-[FMDRequestIdentityV5 baaIdentityTimeoutIntervalInSec](self, "baaIdentityTimeoutIntervalInSec"));
    v53 = v32;
    objc_msgSend(v27, "baaIdentityAttestationForSigningRequest:completion:", v28, v52);
    objc_msgSend(v32, "wait");
    if (objc_msgSend(v32, "timeoutOccurred"))
    {
      v33 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kFMDErrorDomain, 4, 0));
      v34 = (void *)v58[5];
      v58[5] = v33;

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 40), "base64EncodedString"));
    -[FMDRequestIdentityV5 setBaaSignatureHeader:](self, "setBaaSignatureHeader:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v64[5], "base64EncodedString"));
    -[FMDRequestIdentityV5 setBaaAttestationHeader:](self, "setBaaAttestationHeader:", v36);

    v37 = (void *)v58[5];
    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "domain"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%ld"), v38, objc_msgSend((id)v58[5], "code")));
      -[FMDRequestIdentityV5 setBaaError:](self, "setBaaError:", v39);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v58[5], "description"));
      -[FMDRequestIdentityV5 setBaaErrorDescription:](self, "setBaaErrorDescription:", v40);

      v41 = [FMDALFailureAnalyticsManager alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
      v43 = -[FMDALFailureAnalyticsManager initWithProvider:context:](v41, "initWithProvider:context:", WeakRetained, CFSTR("IdentityV5"));

      -[FMDALFailureAnalyticsManager performAnalytics:](v43, "performAnalytics:", v58[5]);
    }
    else
    {
      -[FMDRequestIdentityV5 setBaaError:](self, "setBaaError:", 0);
      -[FMDRequestIdentityV5 setBaaErrorDescription:](self, "setBaaErrorDescription:", 0);
    }

    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(&v63, 8);

    _Block_object_dispose(&v73, 8);
  }

}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSString)signatureHeader
{
  return self->_signatureHeader;
}

- (void)setSignatureHeader:(id)a3
{
  objc_storeStrong((id *)&self->_signatureHeader, a3);
}

- (NSString)skAuthHeader
{
  return self->_skAuthHeader;
}

- (void)setSkAuthHeader:(id)a3
{
  objc_storeStrong((id *)&self->_skAuthHeader, a3);
}

- (NSString)baaAttestationHeader
{
  return self->_baaAttestationHeader;
}

- (void)setBaaAttestationHeader:(id)a3
{
  objc_storeStrong((id *)&self->_baaAttestationHeader, a3);
}

- (NSString)baaSignatureHeader
{
  return self->_baaSignatureHeader;
}

- (void)setBaaSignatureHeader:(id)a3
{
  objc_storeStrong((id *)&self->_baaSignatureHeader, a3);
}

- (NSData)requestBodyDataForSignature
{
  return self->_requestBodyDataForSignature;
}

- (void)setRequestBodyDataForSignature:(id)a3
{
  objc_storeStrong((id *)&self->_requestBodyDataForSignature, a3);
}

- (NSUUID)activationLockRequestUUID
{
  return self->_activationLockRequestUUID;
}

- (void)setActivationLockRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_activationLockRequestUUID, a3);
}

- (int64_t)baaIdentityTimeoutIntervalInSec
{
  return self->_baaIdentityTimeoutIntervalInSec;
}

- (void)setBaaIdentityTimeoutIntervalInSec:(int64_t)a3
{
  self->_baaIdentityTimeoutIntervalInSec = a3;
}

- (NSString)commandID
{
  return self->_commandID;
}

- (void)setCommandID:(id)a3
{
  objc_storeStrong((id *)&self->_commandID, a3);
}

- (NSString)signatureError
{
  return self->_signatureError;
}

- (void)setSignatureError:(id)a3
{
  objc_storeStrong((id *)&self->_signatureError, a3);
}

- (NSString)baaError
{
  return self->_baaError;
}

- (void)setBaaError:(id)a3
{
  objc_storeStrong((id *)&self->_baaError, a3);
}

- (NSString)baaErrorDescription
{
  return self->_baaErrorDescription;
}

- (void)setBaaErrorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_baaErrorDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baaErrorDescription, 0);
  objc_storeStrong((id *)&self->_baaError, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_activationLockRequestUUID, 0);
  objc_storeStrong((id *)&self->_requestBodyDataForSignature, 0);
  objc_storeStrong((id *)&self->_baaSignatureHeader, 0);
  objc_storeStrong((id *)&self->_baaAttestationHeader, 0);
  objc_storeStrong((id *)&self->_skAuthHeader, 0);
  objc_storeStrong((id *)&self->_signatureHeader, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
