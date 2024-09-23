@implementation CRPearlController

- (id)decompressPearlFrames
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;

  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CRPearlController decompressPearlFrames]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/var/hardware/Pearl"));

  if (v6)
  {
    v7 = handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("/var/hardware/Pearl");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v30 = 0;
    v10 = objc_msgSend(v9, "removeItemAtPath:error:", CFSTR("/var/hardware/Pearl"), &v30);
    v11 = v30;

    if (!v10 || v11)
    {
      v23 = handleForCategory(0);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_100036C50((uint64_t)v11, v24);

      v25 = sub_100001990((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Failed to delete existing Pearl Data"), v11);
      v22 = (id)objc_claimAutoreleasedReturnValue(v25);
      goto LABEL_16;
    }
  }
  v29 = 0;
  v11 = -[CRPearlController _copyCombinedFDRData:withError:](self, "_copyCombinedFDRData:withError:", CFSTR("prf1"), &v29);
  v12 = v29;
  v13 = v12;
  if (!v11 || v12)
  {
    v20 = sub_100001990((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Found no prf1 data"), v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v22 = v21;
LABEL_16:
    v19 = v22;
    goto LABEL_17;
  }
  v11 = objc_retainAutorelease(v11);
  v14 = decompressReferenceFrames(objc_msgSend(v11, "bytes"), (size_t)objc_msgSend(v11, "length"), (uint64_t)objc_msgSend(CFSTR("/private/var/hardware/Pearl"), "cStringUsingEncoding:", 4));
  if ((_DWORD)v14)
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BiometricError"), (int)v14, 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to decompress Pearl frames, error: 0x%x"), v15));
    v18 = sub_100001990((void *)0xFFFFFFFFFFFFFFF7, v17, v16);
    v19 = (id)objc_claimAutoreleasedReturnValue(v18);

  }
  else
  {
    v27 = handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Decompress Pearl frames successfully", buf, 2u);
    }

    v19 = 0;
  }
LABEL_17:

  return v19;
}

- (id)_copyCombinedFDRData:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];
  _BYTE buf[24];

  v5 = a3;
  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CRPearlController _copyCombinedFDRData:withError:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  v11[0] = CFSTR("GetCombined");
  v11[1] = CFSTR("StripImg4");
  v12[0] = &__kCFBooleanTrue;
  v12[1] = &__kCFBooleanFalse;
  v11[2] = CFSTR("VerifyData");
  v12[2] = &__kCFBooleanFalse;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
  v9 = (void *)AMFDRSealingManifestCopyLocalDataForClass(v5, v8, buf);

  if (a4 && *(_QWORD *)buf)
    *a4 = *(id *)buf;

  return v9;
}

- (id)updateSavageDATFirmware
{
  uint64_t v2;
  NSObject *v3;
  const char *CStringPtr;
  __CFDictionary *Mutable;
  void *v6;
  id v7;
  void *v8;
  CFURLRef v9;
  CFURLRef v10;
  BOOL v11;
  __CFString *v12;
  id v13;
  CFMutableDictionaryRef v14;
  __CFDictionary *v15;
  uint64_t v16;
  __CFString *v17;
  int v18;
  const void *v19;
  void *v20;
  int v21;
  const void *v22;
  uint64_t v23;
  NSObject *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  id *v28;
  unsigned int v29;
  unsigned int v30;
  id v31;
  __CFString *v32;
  const void *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  const __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  unsigned __int8 v48;
  id v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  unsigned int v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  unsigned __int8 v63;
  id v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  __CFString *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  __CFString *v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  CFURLRef cf;
  void *v90;
  __CFDictionary *v91;
  const void *v92;
  const void *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  void *value;
  id v100;
  uint64_t v101;
  const void *v102;
  void *v103;
  uint8_t buf[4];
  const char *v105;

  v2 = handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v105 = "-[CRPearlController updateSavageDATFirmware]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v102 = 0;
  v103 = 0;
  v101 = 0;
  CStringPtr = CFStringGetCStringPtr(CFSTR("Savage"), 0x8000100u);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v100 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", CFSTR("/private/preboot/active"), 1, &v100));
  v7 = v100;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@/"), "/private/preboot/", v6));
  v9 = CFURLCreateWithFileSystemPath(0, CFSTR("/tmp/"), kCFURLPOSIXPathStyle, 1u);
  v90 = v8;
  v91 = Mutable;
  cf = v9;
  if (!CStringPtr || (v10 = v9) == 0 || (Mutable ? (v11 = v8 == 0) : (v11 = 1), v11))
  {
    v79 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("Failed to allocate resources"), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v79);
    v12 = 0;
LABEL_83:
    v31 = 0;
    v13 = 0;
    goto LABEL_50;
  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Faild to read OS Boot hash from %@, error: %@"), CFSTR("/private/preboot/active"), v7));
  if (!v6)
  {
    v80 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, v12, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v80);
    goto LABEL_83;
  }
  v13 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
  if (!v13)
  {
    v81 = CFSTR("Failed to get default AMAuthInstallRef");
LABEL_88:
    v85 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, v81, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v85);
    v31 = 0;
    goto LABEL_50;
  }
  if (+[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault")&& +[CRPersonalizationManager enableSSO:](CRPersonalizationManager, "enableSSO:", v13))
  {
    v81 = CFSTR("Failed to enable SSO");
    goto LABEL_88;
  }
  v94 = v13;
  v88 = v6;
  v87 = objc_autoreleasePoolPush();
  v14 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v14)
  {
    v82 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("Failed to allocate updater options"), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v82);
    v31 = 0;
    v17 = v12;
    goto LABEL_49;
  }
  v15 = v14;
  CFDictionarySetValue(Mutable, CFSTR("RestoreSystemPartition"), v8);
  CFDictionarySetValue(Mutable, CFSTR("PostFDRSealing"), kCFBooleanFalse);
  CFDictionarySetValue(Mutable, CFSTR("PreflightContext"), CFSTR("Limited"));
  CFDictionaryAddValue(v15, CFSTR("Options"), Mutable);
  CFDictionarySetValue(v15, CFSTR("BundlePath"), v10);
  v16 = SavageUpdaterCreate(v15, sub_100005B70, CStringPtr, &v103);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to create SavageUpdater: %s, error: %@"), CStringPtr, 0));

  if (!v16 || v103)
  {
    AMSupportSafeRelease(v15);
    v83 = v103;
    v84 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, v17, v103);
    v42 = (void *)objc_claimAutoreleasedReturnValue(v84);

    v31 = 0;
    goto LABEL_49;
  }
  v86 = v7;
  if (SavageUpdaterIsDone(v16, &v103))
  {
LABEL_45:
    v40 = handleForCategory(0);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Savage Updater done", buf, 2u);
    }

    AMSupportSafeRelease(v16);
    AMSupportSafeRelease(v15);
    v31 = 0;
    v42 = 0;
    goto LABEL_48;
  }
  v18 = 3;
  v19 = (const void *)kSavageOptionReceiptManifest;
  v92 = (const void *)kSavageTagResponseTicket;
  v93 = (const void *)kYonkersTagResponseTicket;
  while (1)
  {
    value = 0;
    v20 = v103;
    if (v103)
    {
      v75 = CFSTR("SavageUpdaterIsDone failed");
      goto LABEL_75;
    }
    if (!--v18)
    {
      v77 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("updater not done after 2 iterations"), 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v77);
      goto LABEL_76;
    }
    v21 = SavageUpdaterExecCommand(v16, CFSTR("queryInfo"), 0, &v102, &v103);
    v20 = v103;
    if (!v21 || v103 || !v102)
    {
      v75 = CFSTR("Failed to run SavageUpdaterExecCommand");
LABEL_75:
      v76 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, v75, v20);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v76);

LABEL_76:
      v31 = 0;
      goto LABEL_77;
    }
    CFDictionarySetValue(v15, CFSTR("DeviceInfo"), v102);
    CFDictionarySetValue(v15, v19, v102);
    v22 = CFDictionaryGetValue((CFDictionaryRef)v102, CFSTR("YonkersDeviceInfo"));
    v23 = handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = CFSTR("Savage");
      if (v22)
        v25 = CFSTR("Yonkers");
      *(_DWORD *)buf = 138412290;
      v105 = (const char *)v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Patch type: %@", buf, 0xCu);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v94));
    v27 = v26;
    if (v22)
    {
      v98 = 0;
      v28 = (id *)&v98;
      v29 = objc_msgSend(v26, "getYonkersTicketForZenithYonkersFWUpdateWithOptions:YonkersTicket:error:", v15, &value, &v98);
    }
    else
    {
      v97 = 0;
      v28 = (id *)&v97;
      v29 = objc_msgSend(v26, "getSavageTicketForZenithSavageFWUpdateWithOptions:SavageTicket:error:", v15, &value, &v97);
    }
    v30 = v29;
    v31 = *v28;

    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to personalize Savage FW, status: %d, error: %@"), v30, v31));
    if (v31 || !v30 || !value)
      break;
    if (v22)
      v33 = v93;
    else
      v33 = v92;
    CFDictionaryAddValue(v15, v33, value);
    v34 = handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v105 = (const char *)v15;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Perform next stage, updaterOptions: %@", buf, 0xCu);
    }

    v36 = SavageUpdaterExecCommand(v16, CFSTR("performNextStage"), v15, &v101, &v103);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to exec SavageUpdater command, result: %@"), v101));

    v20 = v103;
    if (!v36 || v103)
    {
      v75 = v17;
      goto LABEL_75;
    }
    v37 = handleForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = CFSTR("Savage");
      if (v22)
        v39 = CFSTR("Yonkers");
      *(_DWORD *)buf = 138412290;
      v105 = (const char *)v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Update %@ FW Successfully", buf, 0xCu);
    }

    AMSupportSafeRelease(v102);
    AMSupportSafeRelease(v101);
    v101 = 0;
    v102 = 0;

    if (SavageUpdaterIsDone(v16, &v103))
      goto LABEL_45;
  }
  v78 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, v32, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v78);
  v17 = v32;
LABEL_77:

LABEL_48:
  v7 = v86;
LABEL_49:
  v6 = v88;
  v13 = v94;
  objc_autoreleasePoolPop(v87);
  v12 = v17;
LABEL_50:
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v44 = objc_msgSend(v43, "fileExistsAtPath:", CFSTR("/tmp/Savage.fw"));

  if (v44)
  {
    v45 = handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Find Savage.fw, deleting...", buf, 2u);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v96 = 0;
    v48 = objc_msgSend(v47, "removeItemAtPath:error:", CFSTR("/tmp/Savage.fw"), &v96);
    v49 = v96;

    if ((v48 & 1) == 0)
    {
      v50 = handleForCategory(0);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_100036D38((uint64_t)v49, v51, v52, v53, v54, v55, v56, v57);

    }
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v59 = objc_msgSend(v58, "fileExistsAtPath:", CFSTR("/tmp/Yonkers.fw"));

  if (v59)
  {
    v60 = handleForCategory(0);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Find Yonkers.fw, deleting...", buf, 2u);
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v95 = 0;
    v63 = objc_msgSend(v62, "removeItemAtPath:error:", CFSTR("/tmp/Yonkers.fw"), &v95);
    v64 = v95;

    if ((v63 & 1) == 0)
    {
      v65 = handleForCategory(0);
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        sub_100036CD4((uint64_t)v64, v66, v67, v68, v69, v70, v71, v72);

    }
  }
  if (cf)
    CFRelease(cf);
  if (v91)
    CFRelease(v91);
  if (v13)
    CFRelease(v13);
  v73 = v42;

  return v73;
}

- (id)updateBrunorDATFirmware
{
  const char *CStringPtr;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v8;
  CFMutableDictionaryRef v9;
  __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  const void *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  const void *v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  void *v35;
  unsigned int v36;
  void *v37;
  __CFDictionary *v38;
  const void *v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __CFDictionary *v62;
  void *v63;
  void *key;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *value;
  void *v70;
  uint64_t v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  int v75;

  CStringPtr = CFStringGetCStringPtr(CFSTR("Savage"), 0x8000100u);
  v71 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", CFSTR("/private/preboot/active"), 1, 0));
  if (!v3)
  {
    v48 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100036D9C();
    goto LABEL_60;
  }
  v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%@/"), "/private/preboot/", v3));
  if (!v4)
  {
    v49 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100036DC8();
LABEL_60:
    v6 = 0;
    v20 = 0;
    v8 = 0;
    v10 = 0;
    v12 = 0;
    v5 = 0;
    goto LABEL_55;
  }
  v5 = (void *)v4;
  v6 = +[CRPersonalizationManager getDefaultAMAuthInstallRef](CRPersonalizationManager, "getDefaultAMAuthInstallRef");
  if (!v6)
  {
    v50 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v50);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
      v8 = 0;
      v10 = 0;
      v12 = 0;
      goto LABEL_55;
    }
    sub_100036DF4();
    v6 = 0;
    goto LABEL_79;
  }
  if (+[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault")&& +[CRPersonalizationManager enableSSO:](CRPersonalizationManager, "enableSSO:", v6))
  {
    v61 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_100037054();
      goto LABEL_79;
    }
LABEL_74:
    v20 = 0;
    v8 = 0;
    goto LABEL_75;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    v51 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      sub_100036E20();
LABEL_79:
      v20 = 0;
      v8 = 0;
      goto LABEL_80;
    }
    goto LABEL_74;
  }
  v8 = Mutable;
  v9 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v9)
  {
    v52 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v52);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = 0;
LABEL_75:
      v10 = 0;
      v12 = 0;
      goto LABEL_55;
    }
    sub_100036E4C();
    v20 = 0;
LABEL_80:
    v10 = 0;
    v12 = 0;
    goto LABEL_55;
  }
  v10 = v9;
  CFDictionarySetValue(v8, CFSTR("RestoreSystemPartition"), v5);
  CFDictionarySetValue(v8, CFSTR("PostFDRSealing"), kCFBooleanFalse);
  CFDictionarySetValue(v8, CFSTR("PreflightContext"), CFSTR("Limited"));
  CFDictionaryAddValue(v10, CFSTR("Options"), v8);
  v11 = SavageUpdaterCreate(v10, sub_100005B70, CStringPtr, &v71);
  v12 = v11;
  if (!v11 || v71)
  {
    v53 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100036E78();
    goto LABEL_54;
  }
  v62 = v8;
  v63 = v3;
  v13 = 0;
  if (!SavageUpdaterIsDone(v11, &v71))
  {
    v23 = (const void *)kYonkersTagResponseTicket;
    key = (void *)kBrunorTagResponseTicket;
    while (1)
    {
      value = 0;
      v70 = 0;
      v68 = 0;
      v24 = handleForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v73 = v10;
        v74 = 1024;
        v75 = v13 + 1;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "updaterOptions: %@ updaterLoopCount: %d", buf, 0x12u);
      }

      v26 = SavageUpdaterExecCommand(v12, CFSTR("queryInfo"), 0, &value, &v71);
      v27 = v71;
      v28 = handleForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      v30 = v29;
      if (!v26 || v27)
        break;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v73 = value;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "deviceInfoDict: %@", buf, 0xCu);
      }

      CFDictionarySetValue(v10, CFSTR("DeviceInfo"), value);
      v31 = CFDictionaryGetValue((CFDictionaryRef)value, CFSTR("YonkersDeviceInfo"));
      v32 = handleForCategory(0);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
      if (v31)
      {
        if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Updating Yonkers ...", buf, 2u);
        }

        v35 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v6));
        v67 = 0;
        v36 = objc_msgSend(v35, "getYonkersTicketForZenithYonkersFWUpdateWithOptions:YonkersTicket:error:", v10, &v70, &v67);
        v17 = v67;

        if (!v36 || (v37 = v70) == 0 || v17)
        {
          v45 = handleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_100037028();
          goto LABEL_53;
        }
        v38 = v10;
        v39 = v23;
      }
      else
      {
        if (v34)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Updating Brunor ...", buf, 2u);
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[CRPersonalizationManager initWithAuthInstallObj:](CRPersonalizationManager, "initWithAuthInstallObj:", v6));
        v66 = 0;
        v41 = objc_msgSend(v40, "getBrunorTicketForBrunorFWUpdateWithOptions:BrunorTicket:auth:error:", v10, &v70, 0, &v66);
        v17 = v66;

        if (!v41 || (v37 = v70) == 0 || v17)
        {
          v46 = handleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            sub_100036F38();
LABEL_53:
          v3 = v63;
          v8 = v62;

LABEL_54:
          v20 = 0;
LABEL_55:

          v47 = sub_100001990((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("Update streaming DAT file failed"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v47);
          goto LABEL_17;
        }
        v38 = v10;
        v39 = key;
      }
      CFDictionaryAddValue(v38, v39, v37);
      v42 = handleForCategory(0);
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v73 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "perform next stage: %@", buf, 0xCu);
      }

      if (!SavageUpdaterExecCommand(v12, CFSTR("performNextStage"), v10, &v68, &v71) || v71)
      {
        v44 = handleForCategory(0);
        v30 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_47;
        goto LABEL_48;
      }
      AMSupportSafeRelease(value);
      AMSupportSafeRelease(v68);

      ++v13;
      if (SavageUpdaterIsDone(v12, &v71))
        goto LABEL_11;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
LABEL_47:
      sub_100036ED8();
LABEL_48:
    v17 = 0;
    goto LABEL_53;
  }
LABEL_11:
  v14 = v71;
  v15 = handleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    v3 = v63;
    v8 = v62;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100036FC8();
    goto LABEL_54;
  }
  v3 = v63;
  v8 = v62;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v73) = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SavageUpdater work done. LoopCounter = %d.", buf, 8u);
  }

  v65 = 0;
  v18 = +[CRUtils powerCycleSensor:](CRUtils, "powerCycleSensor:", &v65);
  v19 = v65;
  v20 = v19;
  if (!v18 || v19)
  {
    v54 = handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100036F64((uint64_t)v20, v17, v55, v56, v57, v58, v59, v60);
    goto LABEL_55;
  }
  v21 = 0;
LABEL_17:
  AMSupportSafeRelease(v71);
  AMSupportSafeRelease(v6);
  AMSupportSafeRelease(v12);
  AMSupportSafeRelease(v10);
  AMSupportSafeRelease(v8);

  return v21;
}

- (id)verifyPSD3
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  NSObject *v13;
  id v15;
  uint8_t v16[16];
  uint64_t v17;
  const __CFString *v18;
  void *v19;

  v17 = 0;
  v18 = CFSTR("VerifyData");
  v19 = &__kCFBooleanTrue;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v3 = (void *)AMFDRSealingManifestCopyLocalDataForClass(CFSTR("psd3"), v2, &v17);
  v4 = v3;
  if (v3)
    v5 = v17 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v12 = handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100037080();
LABEL_15:

    v15 = sub_100001990((void *)0xFFFFFFFFFFFFFFF5, CFSTR("Verify PSD3 failed"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v3);
  v7 = verifyFDRData((const char *)objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length"));
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v13 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000370E0(v7, v13);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Verify psd3 successfully", v16, 2u);
  }

  v10 = 0;
LABEL_10:
  AMSupportSafeRelease(v17);

  return v10;
}

@end
