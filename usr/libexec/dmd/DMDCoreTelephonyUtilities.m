@implementation DMDCoreTelephonyUtilities

+ (id)formattedIMEIStringFromString:(id)a3
{
  void *v3;
  id v4;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:"));
    if ((unint64_t)objc_msgSend(v3, "length") >= 3)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 2);
    if ((unint64_t)objc_msgSend(v3, "length") >= 0xA)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 9);
    if ((unint64_t)objc_msgSend(v3, "length") >= 0x11)
      objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 16);
    v4 = objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)formattedICCIDStringFromString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  unint64_t v6;
  id v7;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v3));
    if ((unint64_t)objc_msgSend(v3, "length") >= 4 && (unint64_t)objc_msgSend(v3, "length") >= 5)
    {
      v5 = 0;
      v6 = 4;
      do
      {
        if ((unint64_t)objc_msgSend(v3, "length") > v6)
        {
          objc_msgSend(v4, "insertString:atIndex:", CFSTR(" "), (v5 + v6));
          ++v5;
        }
        v6 = (v6 + 4);
      }
      while ((unint64_t)objc_msgSend(v3, "length") > v6);
    }
    v7 = objc_msgSend(v4, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (NSString)IMEI
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = sub_100032EF8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "IMEI"));

  if (objc_msgSend(v5, "length"))
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formattedIMEIStringFromString:", v5));
  else
    v6 = 0;

  return (NSString *)v6;
}

+ (NSString)MEID
{
  if (qword_1000EB858 != -1)
    dispatch_once(&qword_1000EB858, &stru_1000BAC98);
  return (NSString *)(id)qword_1000EB850;
}

+ (NSString)modemFirmwareVersion
{
  id v2;

  if (+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
  {
    if (qword_1000EB868 != -1)
      dispatch_once(&qword_1000EB868, &stru_1000BACB8);
    v2 = (id)qword_1000EB860;
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

+ (NSString)ICCID
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
  {
    v3 = sub_100032EF8();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ICCID"));

    if (objc_msgSend(v5, "length"))
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formattedICCIDStringFromString:", v5));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

+ (NSString)currentNetworkName
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  if (!+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
    return (NSString *)0;
  v2 = sub_1000334C4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100033504(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v10 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getLocalizedOperatorName:error:", v5, &v10));
    v7 = v10;
    if (v6)
    {
      if (objc_msgSend(v6, "length"))
      {
        v8 = v6;
LABEL_11:

        goto LABEL_12;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100074D0C();
    }
    v8 = 0;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return (NSString *)v8;
}

+ (NSString)carrierName
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10;

  v2 = sub_1000334C4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100033504(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  v10 = 0;
  v7 = objc_msgSend(v3, "copyCarrierBundleValue:key:bundleType:error:", v5, CFSTR("CarrierName"), v6, &v10);
  v8 = v10;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100074DA8();

  return (NSString *)v7;
}

+ (NSString)carrierBundleVersion
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10;

  v2 = sub_1000334C4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100033504(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v10 = 0;
    v6 = objc_msgSend(v3, "copyCarrierBundleVersion:error:", v5, &v10);
    v7 = v10;
    if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100074E10();
    v8 = v6;

  }
  else
  {
    v8 = 0;
  }

  return (NSString *)v8;
}

+ (NSString)currentMobileCountryCode
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  if (!+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
    goto LABEL_11;
  v2 = sub_1000334C4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100033504(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
LABEL_10:

LABEL_11:
    v7 = 0;
    return (NSString *)v7;
  }
  v6 = (void *)v5;
  v10 = 0;
  v7 = objc_msgSend(v3, "copyMobileCountryCode:error:", v5, &v10);
  v8 = v10;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100074E78();

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "length"))
  {

    v7 = 0;
  }

  return (NSString *)v7;
}

+ (NSString)currentMobileNetworkCode
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v10;

  if (!+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
    goto LABEL_11;
  v2 = sub_1000334C4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100033504(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
LABEL_10:

LABEL_11:
    v7 = 0;
    return (NSString *)v7;
  }
  v6 = (void *)v5;
  v10 = 0;
  v7 = objc_msgSend(v3, "copyMobileNetworkCode:error:", v5, &v10);
  v8 = v10;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100074EE0();

    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "length"))
  {

    v7 = 0;
  }

  return (NSString *)v7;
}

+ (BOOL)dataRoamingEnabled
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100033AE8;
    v5[3] = &unk_1000BACE0;
    v5[4] = &v6;
    objc_msgSend((id)objc_opt_class(a1), "withCurrentDataServiceDescriptorDo:", v5);
  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (void)setDataRoamingEnabled:(BOOL)a3
{
  _QWORD v5[4];
  BOOL v6;

  if (+[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100033C4C;
    v5[3] = &unk_1000BAD00;
    v6 = a3;
    objc_msgSend((id)objc_opt_class(a1), "withCurrentDataServiceDescriptorDo:", v5);
  }
}

+ (void)withCurrentDataServiceDescriptorDo:(id)a3
{
  void (**v5)(id, void *, id);
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = (void (**)(id, void *, id))a3;
  if (!v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMDCoreTelephonyUtilities+iphoneOS-tvOS.m"), 451, CFSTR("block parameter to withCurrentDataServiceDescriptionDo: was nil"));

  }
  v6 = sub_1000334C4();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getCurrentDataServiceDescriptorSync:", &v11));
  v9 = v11;
  v5[2](v5, v8, v9);

}

+ (BOOL)isSubscriptionRoaming:(id)a3 client:(id)a4
{
  id v4;
  id v5;
  unsigned __int8 v6;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(a4, "copyRegistrationStatus:error:", a3, &v8);
  v5 = v8;
  if (v4)
  {
    v6 = objc_msgSend(v4, "isEqualToString:", kCTRegistrationStatusRegisteredRoaming);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000750E8((uint64_t)v5);
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isRoaming
{
  _BOOL4 v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v3 = +[DMDMobileGestalt hasCellularDataCapability](DMDMobileGestalt, "hasCellularDataCapability");
  if (v3)
  {
    v4 = sub_1000334C4();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = sub_100033504(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend((id)objc_opt_class(a1), "isSubscriptionRoaming:client:", v7, v5);

    LOBYTE(v3) = v8;
  }
  return v3;
}

+ (BOOL)voiceRoamingEnabled
{
  uint64_t v2;
  const void *v3;
  BOOL v4;
  BOOL v5;
  char v7;
  _OWORD v8[2];
  uint64_t v9;

  if (!objc_msgSend(a1, "_supportsVoiceRoaming"))
    return 0;
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v2 = _CTServerConnectionCreate(kCFAllocatorDefault, sub_1000332A8, v8);
  if (!v2)
    return 0;
  v3 = (const void *)v2;
  v7 = 0;
  if ((unint64_t)_CTServerConnectionGetEnableOnlyHomeNetwork(v2, &v7) >> 32)
    v4 = 0;
  else
    v4 = v7 == 0;
  v5 = v4;
  CFRelease(v3);
  return v5;
}

+ (void)setVoiceRoamingEnabled:(BOOL)a3
{
  int v3;
  uint64_t v5;
  const void *v6;
  _OWORD v7[2];
  uint64_t v8;

  v3 = a3;
  if (objc_msgSend(a1, "_supportsVoiceRoaming"))
  {
    if (objc_msgSend(a1, "voiceRoamingEnabled") == v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100075174(v3);
    }
    else
    {
      v8 = 0;
      memset(v7, 0, sizeof(v7));
      v5 = _CTServerConnectionCreate(kCFAllocatorDefault, sub_1000332A8, v7);
      if (v5)
      {
        v6 = (const void *)v5;
        _CTServerConnectionSetEnableOnlyHomeNetwork(v5, v3 ^ 1u);
        CFRelease(v6);
      }
    }
  }
}

+ (BOOL)hasGSM
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "IMEI"));
  v3 = v2 != 0;

  return v3;
}

+ (BOOL)hasCDMA
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "MEID"));
  v3 = v2 != 0;

  return v3;
}

+ (BOOL)_supportsVoiceRoaming
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  const __CFString *v12;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;

  if (!+[DMDMobileGestalt hasTelephonyCapability](DMDMobileGestalt, "hasTelephonyCapability"))
  {
    v10 = 0;
    goto LABEL_12;
  }
  v2 = sub_1000334C4();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = sub_100033504(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(objc_alloc((Class)CTBundle), "initWithBundleType:", 1);
  v14 = 0;
  v7 = objc_msgSend(v3, "copyCarrierBundleValue:key:bundleType:error:", v5, CFSTR("ShowVoiceRoamingSwitch"), v6, &v14);
  v8 = v14;
  if (v7)
  {
    v9 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = objc_msgSend(v7, "BOOLValue");
      v11 = 1;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100075254();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000751EC();
  }
  v11 = 0;
  v10 = 0;
LABEL_11:

  if (!v11)
  {
    LOBYTE(v10) = 0;
    return v10;
  }
LABEL_12:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("NO");
    if (v10)
      v12 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "device supports voice roaming: %{public}@", buf, 0xCu);
  }
  return v10;
}

@end
