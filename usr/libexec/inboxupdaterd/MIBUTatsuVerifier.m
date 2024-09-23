@implementation MIBUTatsuVerifier

+ (id)apNonce
{
  uint64_t v2;
  void *v3;

  v2 = MGCopyAnswer(CFSTR("ApNonce"), 0);
  v3 = (void *)qword_100068898;
  qword_100068898 = v2;

  return (id)qword_100068898;
}

+ (id)sepNonce
{
  uint64_t v2;
  void *v3;

  v2 = objc_claimAutoreleasedReturnValue(+[NSData generateRandomBytesOfSize:](NSData, "generateRandomBytesOfSize:", 20));
  v3 = (void *)qword_1000688A0;
  qword_1000688A0 = v2;

  return (id)qword_1000688A0;
}

+ (id)sikaFuse
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen")));
  v4 = objc_msgSend(a1, "_copyDeviceTreeInt:key:defaultValue:", v3, CFSTR("esdm-fuses"), 0);

  return v4;
}

+ (BOOL)verifyTatsuEntitlement:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  NSObject *v8;
  id v9;
  uint64_t inited;
  uint64_t v11;
  BOOL v12;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[16];
  __int128 v37;
  uint64_t v38;
  unsigned int v39;
  _OWORD v40[28];
  uint64_t v41;

  v5 = a3;
  v41 = 0;
  memset(v40, 0, sizeof(v40));
  v39 = 0;
  v37 = off_1000558A8;
  v38 = 0;
  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v7 = objc_msgSend(v6, "useLiveTatsu");

    if ((v7 & 1) == 0)
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_1000558C0);
      v14 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Faking Tatsu entitlement verification, return success", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_1000558E0);
  v8 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Verifying Tatsu entitlement...", buf, 2u);
  }
  v9 = objc_retainAutorelease(v5);
  inited = Img4DecodeInitManifest(objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), v40);
  if ((_DWORD)inited)
  {
    v15 = inited;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055900);
    v16 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003B37C(v15, v16, v17, v18, v19, v20, v21, v22);
    sub_10000D680(a4, 100663297, 0, CFSTR("Failed to parse tatsu ticket as Img4 manifest; status: %d"),
      v19,
      v20,
      v21,
      v22,
      v15);
    goto LABEL_32;
  }
  v11 = Img4DecodePerformManifestTrustEvaluationWithCallbacks(v40, &v37, &kImg4DecodeSecureBootRsa4kSha384, &v39);
  if ((_DWORD)v11)
  {
    v23 = v11;
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055920);
    v24 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003B318(v23, v24, v25, v26, v27, v28, v29, v30);
    v31 = CFSTR("Failed to verify tatsu ticket");
    goto LABEL_31;
  }
  if (v39 != 511)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055940);
    v32 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003B2B0((uint64_t)&v39, v32, v33, v34, v27, v28, v29, v30);
    v35 = v39;
    v31 = CFSTR("Tatsu ticket failed verification, verify flags are 0x%x");
LABEL_31:
    sub_10000D680(a4, 100663297, 0, v31, v27, v28, v29, v30, v35);
LABEL_32:
    v12 = 0;
    goto LABEL_11;
  }
LABEL_10:
  v12 = 1;
LABEL_11:

  return v12;
}

+ (id)_copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  CFTypeRef CFProperty;
  io_registry_entry_t v8;
  io_object_t v9;
  NSObject *v10;
  uint8_t v12[16];

  v5 = (__CFString *)a4;
  v6 = v5;
  CFProperty = 0;
  if (a3 && v5)
  {
    v8 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"));
    if (v8)
    {
      v9 = v8;
      CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055960);
      v10 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "entry == MACH_PORT_NULL", v12, 2u);
      }
      CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

+ (id)_copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  unsigned int v14;

  v8 = a5;
  v9 = v8;
  v10 = 0;
  v14 = 0;
  if (!a3)
    goto LABEL_6;
  v11 = v8;
  if (a4)
  {
    v10 = objc_msgSend(a1, "_copyDeviceTreeProperty:key:", a3, a4);
    v12 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0 && objc_msgSend(v10, "length") == (id)4)
    {
      objc_msgSend(v10, "getBytes:length:", &v14, 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));

      goto LABEL_7;
    }
LABEL_6:
    v11 = v9;
  }
LABEL_7:

  return v11;
}

@end
