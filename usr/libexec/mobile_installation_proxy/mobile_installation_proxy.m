uint64_t start()
{
  qword_1000107C0 = MOLogOpen("com.apple.mobile.installation_proxy", 5);
  if (!qword_1000107C0)
    syslog(3, "Failed to set up logging");
  if (lockdown_checkin_xpc("com.apple.mobile.installation_proxy", 0, 0, &stru_10000C428))
  {
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      MOLogWrite(qword_1000107C0);
    return 1;
  }
  else
  {
    CFRunLoopRun();
    return 0;
  }
}

void sub_1000041DC(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  void *v4;
  int v5;
  const void *v6;
  char v7;
  uint64_t v8;
  CFTypeID v9;
  CFTypeID TypeID;
  const void *v11;
  const void *v12;
  void *v13;
  _BOOL4 v14;
  const void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  const char *v20;
  size_t v21;
  void *v22;
  _BOOL4 v23;
  char *v24;
  NSMutableDictionary *v25;
  __CFDictionary *Mutable;
  __CFDictionary *v27;
  const void *v28;
  const void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  dispatch_semaphore_t v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  unsigned __int8 v42;
  __int128 *v43;
  uint64_t v44;
  __int128 *v45;
  int *v46;
  char *v47;
  const __CFDictionary *v48;
  const __CFDictionary *v49;
  const void *v50;
  const void *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  int v55;
  void *v56;
  dispatch_semaphore_t v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  dispatch_semaphore_t v62;
  NSObject *v63;
  void *v64;
  const void *v65;
  const void *v66;
  __CFDictionary *v67;
  const void *v68;
  CFURLRef v69;
  unint64_t v70;
  BOOL v71;
  int v72;
  __int128 *p_cf;
  char *v74;
  __int128 *v75;
  void *v76;
  unsigned int v77;
  uint64_t v78;
  _lockdown_connection *v79;
  char *Value;
  uint64_t v81;
  void **v82;
  uint64_t v83;
  void *v84;
  void *v85;
  NSObject *v86;
  id *v87;
  void **v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  _lockdown_connection **v92;
  id v93;
  id *v94;
  uint64_t v95;
  char v96;
  void **v97;
  uint64_t v98;
  void *v99;
  void *v100;
  _lockdown_connection **v101;
  __int128 cf;
  __int128 v103;
  id v104;
  id v105;
  void ***v106;
  _lockdown_connection **v107;

  v81 = 0;
  v79 = a2;
  Value = (char *)CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
  v4 = objc_autoreleasePoolPush();
  *(_QWORD *)&cf = 0;
  v5 = lockdown_receive_message(a2, &cf);
  v6 = (const void *)cf;
  v7 = 1;
  if (!v5 && (_QWORD)cf)
  {
    v8 = MCFeatureAppInstallationAllowed;
    v78 = MCFeatureAppRemovalAllowed;
    do
    {
      v9 = CFGetTypeID(v6);
      TypeID = CFDictionaryGetTypeID();
      v6 = (const void *)cf;
      if (v9 != TypeID)
        break;
      if (!(_QWORD)cf)
        goto LABEL_194;
      v11 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Command"));
      v12 = v11;
      if (!v11)
      {
        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          MOLogWrite(qword_1000107C0);
        sub_10000548C((uint64_t)&v79, CFSTR("MissingCommand"));
        goto LABEL_185;
      }
      LODWORD(v81) = 0;
      if (CFEqual(v11, CFSTR("Install")) || CFEqual(v12, CFSTR("Upgrade")))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection", p_cf, v74, v75));
        v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", v8) == 2;

        if (v14)
        {
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
          sub_10000548C((uint64_t)&v79, CFSTR("InstallProhibited"));
          goto LABEL_185;
        }
        v15 = CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("PackagePath"));
        if (!v15)
        {
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
          goto LABEL_32;
        }
        if (qword_1000107D0 != -1)
          dispatch_once(&qword_1000107D0, &stru_10000C4D8);
        v16 = (void *)qword_1000107C8;
        if (!qword_1000107C8)
        {
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
LABEL_32:
          sub_10000548C((uint64_t)&v79, CFSTR("MissingPackagePath"));
          goto LABEL_185;
        }
        v17 = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@/%@"), qword_1000107C8, v15);
        if (!v17)
        {
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
          sub_10000548C((uint64_t)&v79, CFSTR("PathCreationFailed"));
          goto LABEL_185;
        }
        v18 = v17;
        bzero(&cf, 0x400uLL);
        v19 = objc_retainAutorelease(v18);
        if (realpath_DARWIN_EXTSN((const char *)-[__CFString fileSystemRepresentation](v19, "fileSystemRepresentation"), (char *)&cf))
        {
          v20 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
          v21 = strlen(v20);
          if (v21 <= strlen((const char *)&cf) && !memcmp(&cf, v20, v21))
          {

            v93 = 0;
            v94 = &v93;
            v95 = 0x2020000000;
            v96 = 0;
            v48 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ClientOptions"));
            v49 = v48;
            if (v48)
            {
              v50 = CFDictionaryGetValue(v48, CFSTR("PackageType"));
              v51 = v50;
              if (v50)
              {
                if (CFEqual(v50, CFSTR("CarrierBundle")))
                {
                  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    MOLogWrite(qword_1000107C0);
                  if (!&__CTServerConnectionCreate)
                  {
                    v52 = qword_1000107C0;
                    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      goto LABEL_166;
                    goto LABEL_167;
                  }
                  v104 = 0;
                  cf = 0u;
                  v103 = 0u;
                  v68 = (const void *)_CTServerConnectionCreate(kCFAllocatorDefault, sub_1000059A8, &cf);
                  if (v68)
                  {
                    v69 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v19, kCFURLPOSIXPathStyle, 0);
                    if (v69)
                    {
                      v70 = _CTServerConnectionInstallCarrierBundle(v68, v69);
                      v71 = (_DWORD)v70 == 0;
                      if ((_DWORD)v70 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
                      {
                        p_cf = (__int128 *)v70;
                        v74 = (char *)HIDWORD(v70);
                        MOLogWrite(qword_1000107C0);
                      }
                      CFRelease(v69);
                    }
                    else
                    {
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        p_cf = (__int128 *)v19;
                        MOLogWrite(qword_1000107C0);
                      }
                      v71 = 0;
                    }
                    CFRelease(v68);
                  }
                  else
                  {
                    v52 = qword_1000107C0;
                    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
LABEL_166:
                      MOLogWrite(v52);
LABEL_167:
                    v71 = 0;
                  }
                  *((_BYTE *)v94 + 24) = v71;
LABEL_178:
                  if (*((_BYTE *)v94 + 24))
                  {
                    sub_100005658(&v79);
                  }
                  else
                  {
                    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    {
                      p_cf = 0;
                      MOLogWrite(qword_1000107C0);
                    }
                    sub_10000548C((uint64_t)&v79, CFSTR("APIInternalError"));
                  }
                  CFRelease(v19);
                  _Block_object_dispose(&v93, 8);
                  goto LABEL_185;
                }
                v55 = 0;
LABEL_124:
                if (((v55 | MGGetBoolAnswer(CFSTR("InternalBuild"))) & 1) != 0
                  || !CFEqual(v51, CFSTR("System")))
                {
                  v56 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
                  v77 = objc_msgSend(v56, "isMultiUser");

                  if (v77)
                  {
                    v57 = dispatch_semaphore_create(0);
                    v58 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
                    v97 = _NSConcreteStackBlock;
                    v98 = 3221225472;
                    v99 = sub_100005594;
                    v100 = &unk_10000C450;
                    v59 = v57;
                    v101 = (_lockdown_connection **)v59;
                    objc_msgSend(v58, "terminateSyncWithCompletionHandler:", &v97);

                    dispatch_semaphore_wait(v59, 0xFFFFFFFFFFFFFFFFLL);
                  }
                  v60 = -[__CFDictionary mutableCopy](v49, "mutableCopy");
                  objc_msgSend(v60, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("AllowInstallLocalProvisioned"));
                  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v19));
                  v61 = objc_msgSend(objc_alloc((Class)MIInstallOptions), "initWithLegacyOptionsDictionary:", v60);
                  v62 = dispatch_semaphore_create(0);
                  v89 = 3221225472;
                  v90 = (uint64_t)sub_10000559C;
                  v91 = &unk_10000C470;
                  v92 = &v79;
                  v82 = _NSConcreteStackBlock;
                  v83 = 3221225472;
                  v84 = sub_10000563C;
                  v85 = &unk_10000C498;
                  v87 = &v93;
                  v88 = _NSConcreteStackBlock;
                  v63 = v62;
                  v86 = v63;
                  +[IXAppInstallCoordinator installApplication:consumeSource:options:legacyProgressBlock:completion:](IXAppInstallCoordinator, "installApplication:consumeSource:options:legacyProgressBlock:completion:", v76, 1, v61, &v88, &v82);
                  dispatch_semaphore_wait(v63, 0xFFFFFFFFFFFFFFFFLL);
                  if (v77)
                  {
                    v64 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
                    objc_msgSend(v64, "resumeSync");

                  }
                }
                else
                {
                  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    MOLogWrite(qword_1000107C0);
                  sub_10000548C((uint64_t)&v79, CFSTR("InstallProhibited"));
                }
                goto LABEL_178;
              }
            }
            else
            {
              v51 = 0;
            }
            v55 = 1;
            goto LABEL_124;
          }
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          {
            p_cf = &cf;
            v74 = (char *)v20;
            MOLogWrite(qword_1000107C0);
          }
        }
        else
        {
          v44 = qword_1000107C0;
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          {
            v45 = (__int128 *)-[__CFString fileSystemRepresentation](objc_retainAutorelease(v19), "fileSystemRepresentation");
            v46 = __error();
            v74 = strerror(*v46);
            v75 = &cf;
            p_cf = v45;
            MOLogWrite(v44);
          }
        }

        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
        {
          p_cf = (__int128 *)v19;
          MOLogWrite(qword_1000107C0);
        }
        sub_10000548C((uint64_t)&v79, CFSTR("MissingPackagePath"));
        CFRelease(v19);
      }
      else if (CFEqual(v12, CFSTR("Uninstall")))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
        v23 = objc_msgSend(v22, "effectiveBoolValueForSetting:", v78) == 2;

        if (!v23)
        {
          v28 = CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ApplicationIdentifier"));
          if (!v28)
          {
            if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
              MOLogWrite(qword_1000107C0);
            sub_10000548C((uint64_t)&v79, CFSTR("MissingApplicationIdentifier"));
            goto LABEL_185;
          }
          v29 = CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ClientOptions"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
          v32 = objc_msgSend(v31, "isMultiUser");

          if (v32)
          {
            v33 = dispatch_semaphore_create(0);
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
            v82 = _NSConcreteStackBlock;
            v83 = 3221225472;
            v84 = sub_1000059DC;
            v85 = &unk_10000C450;
            v86 = v33;
            v35 = v33;
            objc_msgSend(v34, "terminateSyncWithCompletionHandler:", &v82);

            dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
          }
          if (v30)
          {
            v36 = v30;
            v88 = 0;
            v89 = (uint64_t)&v88;
            v90 = 0x2020000000;
            LOBYTE(v91) = 1;
            v37 = (void *)objc_opt_new(IXUninstallOptions);
            *(_QWORD *)&cf = _NSConcreteStackBlock;
            *((_QWORD *)&cf + 1) = 3221225472;
            *(_QWORD *)&v103 = sub_1000059F4;
            *((_QWORD *)&v103 + 1) = &unk_10000C500;
            v38 = v37;
            v104 = v38;
            v106 = &v88;
            v39 = v36;
            v105 = v39;
            v107 = &v79;
            objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", &cf);
            if (!*(_BYTE *)(v89 + 24))
            {

              v38 = 0;
            }
            v40 = v105;
            v41 = v38;

            _Block_object_dispose(&v88, 8);
            if (v41)
            {
LABEL_65:
              v93 = 0;
              v97 = _NSConcreteStackBlock;
              v98 = 3221225472;
              v99 = sub_1000059E4;
              v100 = &unk_10000C470;
              v101 = &v79;
              v42 = +[IXAppInstallCoordinator uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:](IXAppInstallCoordinator, "uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:", v28, v41, 0, &v93, &v97, p_cf);
              v43 = (__int128 *)v93;
              if (!v32)
                goto LABEL_101;
LABEL_100:
              v53 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager", p_cf));
              objc_msgSend(v53, "resumeSync");

LABEL_101:
              if ((v42 & 1) != 0)
              {
                sub_100005658(&v79);
              }
              else
              {
                if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                {
                  p_cf = v43;
                  v74 = Value;
                  MOLogWrite(qword_1000107C0);
                }
                sub_10000548C((uint64_t)&v79, CFSTR("APIInternalError"));
              }

              goto LABEL_185;
            }
          }
          else
          {
            v41 = (id)objc_opt_new(IXUninstallOptions);
            if (v41)
              goto LABEL_65;
          }
          v43 = 0;
          v42 = 0;
          if (v32)
            goto LABEL_100;
          goto LABEL_101;
        }
        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          MOLogWrite(qword_1000107C0);
        sub_10000548C((uint64_t)&v79, CFSTR("UninstallProhibited"));
      }
      else
      {
        if (CFEqual(v12, CFSTR("Lookup")))
        {
          v24 = (char *)CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ClientOptions"));
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          {
            p_cf = (__int128 *)Value;
            v74 = v24;
            MOLogWrite(qword_1000107C0);
          }
          v25 = sub_100006714(v24, Value);
          if (!v25)
          {
            if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
              MOLogWrite(qword_1000107C0);
            sub_10000548C((uint64_t)&v79, CFSTR("LookupFailed"));
            goto LABEL_185;
          }
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          v27 = Mutable;
          if (Mutable)
          {
            CFDictionarySetValue(Mutable, CFSTR("Status"), CFSTR("Complete"));
            CFDictionarySetValue(v27, CFSTR("LookupResult"), v25);
            if (lockdown_send_message(v79, v27, 200)
              && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
            {
              MOLogWrite(qword_1000107C0);
            }
            goto LABEL_57;
          }
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
          goto LABEL_111;
        }
        if (CFEqual(v12, CFSTR("Browse")))
        {
          v47 = (char *)CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ClientOptions"));
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          {
            p_cf = (__int128 *)Value;
            v74 = v47;
            MOLogWrite(qword_1000107C0);
          }
          if ((sub_1000067BC(v47, (void (*)(void *, uint64_t))sub_1000055AC, (uint64_t)&v79, Value) & 1) != 0)
          {
            sub_100005658(&v79);
            goto LABEL_185;
          }
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
        }
        else
        {
          if (CFEqual(v12, CFSTR("Restore")))
          {
            if (CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ApplicationIdentifier")))
            {
              if (!qword_1000107C0 || (v54 = CFSTR("APIInternalError"), *(int *)(qword_1000107C0 + 44) >= 3))
              {
                p_cf = (__int128 *)Value;
                MOLogWrite(qword_1000107C0);
                v54 = CFSTR("APIInternalError");
              }
            }
            else if (!qword_1000107C0
                   || (v54 = CFSTR("MissingApplicationIdentifier"), *(int *)(qword_1000107C0 + 44) >= 3))
            {
              MOLogWrite(qword_1000107C0);
              v54 = CFSTR("MissingApplicationIdentifier");
            }
            sub_10000548C((uint64_t)&v79, v54);
            goto LABEL_185;
          }
          if (!CFEqual(v12, CFSTR("CheckCapabilitiesMatch")))
          {
            if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
              MOLogWrite(qword_1000107C0);
            sub_10000548C((uint64_t)&v79, CFSTR("UnknownCommand"));
            goto LABEL_185;
          }
          v65 = CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("Capabilities"));
          if (!v65)
          {
            if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
              MOLogWrite(qword_1000107C0);
            sub_10000548C((uint64_t)&v79, CFSTR("MissingCapabilities"));
            goto LABEL_185;
          }
          v66 = CFDictionaryGetValue((CFDictionaryRef)v6, CFSTR("ClientOptions"));
          v25 = (NSMutableDictionary *)MobileInstallationCheckCapabilitiesMatch(v65, v66);
          if (v25)
          {
            v67 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            v27 = v67;
            if (v67)
            {
              CFDictionarySetValue(v67, CFSTR("Status"), CFSTR("Complete"));
              CFDictionarySetValue(v27, CFSTR("LookupResult"), v25);
              if (lockdown_send_message(v79, v27, 200)
                && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
              {
                MOLogWrite(qword_1000107C0);
              }
LABEL_57:
              CFRelease(v27);
LABEL_112:
              CFRelease(v25);
              goto LABEL_185;
            }
            if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
              MOLogWrite(qword_1000107C0);
LABEL_111:
            sub_10000548C((uint64_t)&v79, CFSTR("DictCreationFailed"));
            goto LABEL_112;
          }
          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
            MOLogWrite(qword_1000107C0);
        }
        sub_10000548C((uint64_t)&v79, CFSTR("APIInternalError"));
      }
LABEL_185:
      CFRelease(v6);
      objc_autoreleasePoolPop(v4);
      v4 = objc_autoreleasePoolPush();
      *(_QWORD *)&cf = 0;
      v72 = lockdown_receive_message(v79, &cf);
      v7 = 0;
      v6 = (const void *)cf;
    }
    while (!v72 && (_QWORD)cf);
  }
  if (v6)
    CFRelease(v6);
LABEL_194:
  if ((v7 & 1) != 0 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
    MOLogWrite(qword_1000107C0);
  objc_autoreleasePoolPop(v4);
  lockdown_disconnect(a2);
}

void sub_100005448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_10000548C(uint64_t a1, const void *a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;

  if (!*(_DWORD *)(a1 + 16))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v5 = Mutable;
      if (a2)
        CFDictionarySetValue(Mutable, CFSTR("Error"), a2);
      if (lockdown_send_message(*(_QWORD *)a1, v5, 200)
        && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
      {
        MOLogWrite(qword_1000107C0);
      }
      CFRelease(v5);
    }
    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      MOLogWrite(qword_1000107C0);
    }
  }
}

intptr_t sub_100005594(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000559C(uint64_t a1, const __CFDictionary *a2)
{
  return sub_1000055AC(a2, *(_QWORD *)(a1 + 32));
}

uint64_t sub_1000055AC(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t result;

  if (a1)
  {
    if (CFDictionaryContainsKey(a1, CFSTR("Error")))
    {
      *(_DWORD *)(a2 + 16) = 1;
      goto LABEL_5;
    }
    if (a2)
    {
LABEL_5:
      result = lockdown_send_message(*(_QWORD *)a2, a1, 200);
      if (!(_DWORD)result)
        return result;
    }
  }
  result = qword_1000107C0;
  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    return MOLogWrite(qword_1000107C0);
  return result;
}

intptr_t sub_10000563C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005658(_QWORD *a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("Status"), CFSTR("Complete"));
    if ((!a1 || lockdown_send_message(*a1, v3, 200))
      && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
    {
      MOLogWrite(qword_1000107C0);
    }
    CFRelease(v3);
  }
  else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
  {
    MOLogWrite(qword_1000107C0);
  }
}

void sub_100005744(id a1)
{
  qword_1000107C8 = (uint64_t)sub_100005760();
}

CFStringRef sub_100005760()
{
  uint64_t v0;
  size_t v1;
  char *v2;
  int v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  passwd *v11;
  passwd v12;
  char v13[1024];

  v0 = sysconf(71);
  if (v0 == -1)
  {
    v6 = *__error();
    v7 = qword_1000107C0;
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      strerror(v6);
      MOLogWrite(v7);
    }
    return 0;
  }
  else
  {
    v1 = v0;
    v2 = (char *)&v10 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, 0x400uLL);
    memset(&v12, 0, sizeof(v12));
    v11 = 0;
    v3 = getpwnam_r("mobile", &v12, v2, v1, &v11);
    if (v3)
    {
      v4 = qword_1000107C0;
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      {
        strerror(v3);
        MOLogWrite(v4);
      }
      return 0;
    }
    if (!v11)
    {
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
        MOLogWrite(qword_1000107C0);
      return 0;
    }
    if (!realpath_DARWIN_EXTSN(v12.pw_dir, v13))
    {
      v8 = qword_1000107C0;
      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      {
        v9 = __error();
        strerror(*v9);
        MOLogWrite(v8);
      }
      return 0;
    }
    return CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s/Media"), v13);
  }
}

uint64_t sub_1000059A8()
{
  uint64_t result;

  result = qword_1000107C0;
  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    return MOLogWrite(qword_1000107C0);
  return result;
}

intptr_t sub_1000059DC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000059E4(uint64_t a1, const __CFDictionary *a2)
{
  return sub_1000055AC(a2, *(_QWORD *)(a1 + 32));
}

void sub_1000059F4(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v7 = a2;
  v8 = a3;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("WaitForStorageDeletion")))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100008A60((uint64_t)v7, a1);
    goto LABEL_10;
  }
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_1000089D8((uint64_t)v7, (uint64_t)v8);
LABEL_10:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_11;
  }
  v10 = v8;
  if (objc_msgSend(v10, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "setWaitForDeletion:", 1);

LABEL_11:
}

void sub_100005AE8(void *a1, void *a2, void *a3)
{
  void (**v5)(id, const __CFString *, NSDictionary *);
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  int v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unsigned int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  int v46;
  int v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *i;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  void *j;
  uint64_t v69;
  unsigned int v70;
  unsigned int v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unsigned int v81;
  void *v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  id v87;
  int v88;
  _BOOL4 v89;
  uint64_t v90;
  void (**v91)(id, const __CFString *, NSDictionary *);
  void *v92;
  int v93;
  id v94;
  void *v95;
  void *v96;
  void (**v97)(id, const __CFString *, NSDictionary *);
  _BOOL4 v98;
  void *v99;
  _BOOL4 v100;
  id v101;
  _BOOL4 v102;
  void *v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[3];
  _QWORD v115[3];
  _BYTE v116[128];
  _BYTE v117[128];

  v5 = a3;
  v6 = a1;
  v7 = v6;
  if (v6)
  {
    v96 = a2;
    if (objc_msgSend(v6, "count") == (id)1
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("com.apple.mobile_installation.metadata"))),
          v9 = objc_msgSend(v8, "BOOLValue"),
          v8,
          (v9 & 1) != 0))
    {
      v10 = 0;
      v11 = 0;
      v98 = 0;
      v100 = 0;
      v102 = 0;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ShowPlaceholders")));

      v102 = v12 != 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ShowLaunchProhibitedApps")));

      v100 = v13 != 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ShowAppClips")));

      v98 = v14 != 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ShowSwiftPlaygroundsApps")));

      v11 = v15 != 0;
      v10 = 1;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Attribute")));
    v17 = sub_1000064F0(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v93 = v11;
    if (v18)
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));
    else
      v19 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BundleIDs")));
    v23 = sub_1000064F0(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (v24)
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v24));
    else
      v21 = 0;
    v25 = v7;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ReturnAttributes")));
    v27 = sub_1000064F0(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (v28)
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v28));
    else
      v20 = 0;

    if (!v10)
    {
      v48 = v25;
      v49 = v19;
LABEL_92:
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("com.apple.mobile_installation.metadata"), v86));
      v81 = objc_msgSend(v80, "BOOLValue");

      if (v81)
      {
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v104 = 0;
        v105 = 0;
        objc_msgSend(v82, "getKnowledgeUUID:andSequenceNumber:", &v105, &v104);
        v83 = v105;
        v84 = v104;

        v115[0] = CFSTR("com.apple.mobile_installation.metadata");
        v114[0] = kCFBundleIdentifierKey;
        v114[1] = CFSTR("CacheGUID");
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "UUIDString"));
        v114[2] = CFSTR("SequenceNumber");
        v115[1] = v85;
        v115[2] = v84;
        v5[2](v5, CFSTR("com.apple.mobile_installation.metadata"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 3));

      }
      goto LABEL_94;
    }
    v89 = v102;
    LOBYTE(v90) = v100;
    HIDWORD(v90) = v98;
    v7 = v25;
    a2 = v96;
  }
  else
  {
    v89 = 0;
    v90 = 0;
    v93 = 0;
    v20 = 0;
    v21 = 0;
    v19 = 0;
  }
  v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ApplicationType")));
  v101 = v21;
  v30 = v19;
  v31 = v20;
  v32 = a2;
  v97 = v5;
  if (qword_1000107E0 != -1)
    dispatch_once(&qword_1000107E0, &stru_10000C570);
  v33 = (id)qword_1000107D8;
  if (qword_100010808 != -1)
    dispatch_once(&qword_100010808, &stru_10000C6A8);
  v99 = v29;
  v95 = v7;
  v91 = v5;
  v34 = (id)qword_100010800;
  if (v31)
  {
    v35 = v31;
    v36 = objc_msgSend(v35, "containsObject:", CFSTR("SharedDirSize"));
    if (objc_msgSend(v35, "containsObject:", CFSTR("StaticDiskUsage")))
      v37 = 4;
    else
      v37 = 0;
    v38 = v37 | v36;
    if (objc_msgSend(v35, "containsObject:", CFSTR("DynamicDiskUsage")))
      v39 = 2;
    else
      v39 = 0;
    if (objc_msgSend(v35, "containsObject:", CFSTR("ApplicationSINF")))
      v40 = 8;
    else
      v40 = 0;
    v41 = v38 | v39 | v40;
    if (objc_msgSend(v35, "containsObject:", CFSTR("iTunesMetadata")))
      v42 = 16;
    else
      v42 = 0;
    if (objc_msgSend(v35, "containsObject:", CFSTR("iTunesArtwork")))
      v43 = 32;
    else
      v43 = 0;
    v44 = v42 | v43;
    v45 = objc_msgSend(v35, "containsObject:", CFSTR("GeoJSON"));

    if (v45)
      v46 = 64;
    else
      v46 = 0;
    v47 = v41 | v44 | v46;
  }
  else
  {
    v47 = 0;
  }
  v88 = v47;
  v50 = v33;
  v51 = v34;
  v49 = v30;
  v52 = v31;
  v103 = v52;
  v94 = v32;
  if (v31)
  {
    v53 = v52;
    v92 = v49;
    v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 0));
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v55 = v53;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(_QWORD *)v111 != v58)
            objc_enumerationMutation(v55);
          v60 = *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)i);
          v61 = objc_msgSend(v50, "containsObject:", v60);
          v62 = objc_msgSend(v51, "containsObject:", v60);
          if ((v61 & 1) != 0 || (v63 = v31, v62))
          {
            v63 = v54;
            if (((v61 ^ 1 | v62) & 1) != 0)
              continue;
          }
          objc_msgSend(v63, "addObject:", v60);
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
      }
      while (v57);
    }

    v49 = v92;
    if (v92)
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v64 = v92;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v107;
        do
        {
          for (j = 0; j != v66; j = (char *)j + 1)
          {
            if (*(_QWORD *)v107 != v67)
              objc_enumerationMutation(v64);
            v69 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)j);
            v70 = objc_msgSend(v50, "containsObject:", v69);
            v71 = objc_msgSend(v51, "containsObject:", v69);
            if ((v70 & 1) != 0 || (v72 = v31, v71))
            {
              v72 = v54;
              if (((v70 ^ 1 | v71) & 1) != 0)
                continue;
            }
            objc_msgSend(v72, "addObject:", v69);
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
        }
        while (v66);
      }

      v49 = v92;
    }
    v32 = v94;
  }
  else
  {
    v54 = 0;
  }
  v73 = objc_retainAutorelease(v54);
  v74 = objc_retainAutorelease(v31);

  v75 = v73;
  v76 = v74;
  v48 = v95;
  if ((objc_msgSend(v32, "isEqualToString:", CFSTR("iTunes")) & 1) != 0
    || objc_msgSend(v32, "isEqualToString:", CFSTR("AMPDevicesAgent")))
  {
    objc_msgSend(v76, "removeObject:", CFSTR("CFBundleBuild"));
  }
  objc_msgSend(v76, "removeObject:", CFSTR("UINewsstandApp"));
  v77 = v99;
  if (v76 && objc_msgSend(v76, "count"))
  {
    if ((MGGetBoolAnswer(CFSTR("InternalBuild")) & 1) != 0)
    {
      if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 5)
        goto LABEL_83;
LABEL_82:
      v86 = v32;
      v87 = v76;
      MOLogWrite(qword_1000107C0);
      goto LABEL_83;
    }
    if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) > 6)
      goto LABEL_82;
  }
LABEL_83:
  if (!v99
    || (objc_msgSend(v99, "isEqualToString:", CFSTR("Any")) & 1) != 0
    || (objc_msgSend(v99, "isEqualToString:", CFSTR("System")) & 1) != 0
    || (objc_msgSend(v99, "isEqualToString:", CFSTR("Internal")) & 1) != 0
    || (objc_msgSend(v99, "isEqualToString:", CFSTR("User")) & 1) != 0)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 0, v86, v87));
    sub_100006AA4(v78, v49, v101, v97, v99, v76, SHIDWORD(v90), v93, v90, v75, v50, v103, v51, v88);
    if (v89)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationRecord enumeratorWithOptions:](LSApplicationRecord, "enumeratorWithOptions:", 64));
      sub_100006AA4(v79, v49, v101, v97, v99, v76, SHIDWORD(v90), v93, v90, v75, v50, v103, v51, v88);

    }
    v77 = v99;
    v32 = v94;
    v48 = v95;
  }
  else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
  {
    v86 = v99;
    MOLogWrite(qword_1000107C0);
  }

  v20 = v103;
  v21 = v101;

  v5 = v91;
  if (v48)
    goto LABEL_92;
LABEL_94:

}

id sub_1000064F0(void *a1)
{
  id v1;
  uint64_t v2;
  char isKindOfClass;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  void *i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v1 = a1;
  if (!v1)
    goto LABEL_23;
  v2 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  v4 = objc_opt_class(NSString);
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v1;
    v6 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (!v8)
      {

LABEL_25:
        v13 = v7;
        goto LABEL_26;
      }
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v11 &= objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), v4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);

      if ((v11 & 1) != 0)
        goto LABEL_25;
    }
    else
    {

    }
    v14 = qword_1000107C0;
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      goto LABEL_22;
  }
  else
  {
    if ((objc_opt_isKindOfClass(v1, v4) & 1) != 0)
    {
      v22 = v1;
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
LABEL_26:
      v16 = v13;
      goto LABEL_27;
    }
    v15 = qword_1000107C0;
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      objc_opt_class(v1);
      v14 = v15;
LABEL_22:
      MOLogWrite(v14);
    }
  }
LABEL_23:
  v16 = 0;
LABEL_27:

  return v16;
}

NSMutableDictionary *sub_100006714(void *a1, void *a2)
{
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  _QWORD v7[4];
  NSMutableDictionary *v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000067B0;
  v7[3] = &unk_10000C528;
  v4 = objc_opt_new(NSMutableDictionary);
  v8 = v4;
  sub_100005AE8(a1, a2, v7);
  v5 = v4;

  return v5;
}

id sub_1000067B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

uint64_t sub_1000067BC(void *a1, void (*a2)(void *, uint64_t), uint64_t a3, void *a4)
{
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD *v13;
  void (*v14)(void *, uint64_t);
  uint64_t v15;
  _QWORD v16[4];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006900;
  v10[3] = &unk_10000C550;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 10));
  v11 = v8;
  v12 = &v17;
  v13 = v16;
  v14 = a2;
  v15 = a3;
  sub_100005AE8(a1, a4, v10);
  if (objc_msgSend(v8, "count"))
    sub_100006984(a2, a3, v8, v18[3]);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);

  return 1;
}

void sub_1000068DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_100006900(uint64_t a1)
{
  id result;

  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result == (id)10)
  {
    sub_100006984(*(void (**)(void *, uint64_t))(a1 + 56), *(_QWORD *)(a1 + 64), *(void **)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    result = objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  }
  else if (result == (id)1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  return result;
}

void sub_100006984(void (*a1)(void *, uint64_t), uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[4];

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count")));
  v11[0] = CFSTR("Status");
  v11[1] = CFSTR("CurrentIndex");
  v12[0] = CFSTR("BrowsingApplications");
  v12[1] = v8;
  v11[2] = CFSTR("CurrentAmount");
  v11[3] = CFSTR("CurrentList");
  v12[2] = v9;
  v12[3] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 4));

  a1(v10, a2);
}

void sub_100006AA4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7, int a8, unsigned __int8 a9, void *a10, void *a11, void *a12, void *a13, int a14)
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  int v35;
  unsigned int v36;
  BOOL v37;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char *v44;
  char *v45;
  void *v46;
  void *v47;
  char *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  __CFString *v56;
  id v57;
  _UNKNOWN **v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  __CFBundle *Unique;
  __CFBundle *v63;
  id v64;
  uint64_t FilteredInfoPlist;
  const __CFDictionary *v66;
  CFTypeID TypeID;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *InfoDictionary;
  CFMutableDictionaryRef v70;
  CFTypeID v71;
  CFStringRef v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  void *i;
  void *v82;
  void *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *j;
  uint64_t v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  id v115;
  void *v116;
  uint64_t v117;
  objc_class *v118;
  NSString *v119;
  uint64_t v120;
  void *v121;
  id v122;
  __CFString *v123;
  __CFBundle *v124;
  void *v125;
  id v126;
  void *v127;
  __CFString *v128;
  id v129;
  void (**v130)(id, id, id);
  uint64_t v131;
  id v132;
  id v133;
  id v134;
  id v135;
  char *v136;
  id v137;
  id v138;
  void *context;
  void *contexta;
  id v141;
  void *v142;
  id v143;
  void *v144;
  id v145;
  id obj;
  void *v147;
  void *v150;
  id v151;
  id v152;
  char *v153;
  void *v154;
  __CFBundle *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
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
  id v172;
  id v173;
  uint64_t v174;
  id v175;
  _BYTE v176[128];
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[128];

  v19 = a1;
  v137 = a2;
  v20 = a3;
  v130 = a4;
  v21 = a5;
  v156 = a6;
  v136 = a10;
  v135 = a11;
  v145 = a12;
  v134 = a13;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  obj = v19;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v161;
    v132 = v21;
    v133 = v20;
    v131 = *(_QWORD *)v161;
    do
    {
      v25 = 0;
      v138 = v23;
      do
      {
        if (*(_QWORD *)v161 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)v25);
        v27 = objc_autoreleasePoolPush();
        v159 = v26;
        if (!v20
          || (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleIdentifier")),
              v29 = objc_msgSend(v20, "containsObject:", v28),
              v28,
              v26 = v159,
              v29))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "compatibilityObject", v123));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bundleType"));
          v32 = v31;
          if (!v21
            || (objc_msgSend(v31, "isEqualToString:", v21) & 1) != 0
            || objc_msgSend(v21, "isEqualToString:", CFSTR("Any"))
            && ((objc_msgSend(v32, "isEqualToString:", CFSTR("System")) & 1) != 0
             || (objc_msgSend(v32, "isEqualToString:", CFSTR("Internal")) & 1) != 0
             || objc_msgSend(v32, "isEqualToString:", CFSTR("User"))))
          {
            v158 = v27;
            v33 = objc_msgSend(v159, "isLaunchProhibited") ^ 1 | a9;
            v157 = v32;
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "appClipMetadata"));

            v35 = v34 ? a7 : 1;
            v36 = objc_msgSend(v159, "isSwiftPlaygroundsApp") ^ 1 | a8;
            v37 = v33 != 1 || v35 == 0;
            v32 = v157;
            v27 = v158;
            if (!v37 && v36 != 0)
            {
              v147 = v25;
              v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
              v150 = v30;
              v40 = v30;
              v41 = v39;
              v42 = v135;
              v43 = v134;
              v151 = v156;
              v44 = v136;
              v45 = v136;
              v46 = objc_autoreleasePoolPush();
              v47 = v46;
              v153 = v45;
              if (v136)
              {
                context = v46;
                v141 = v43;
                v143 = v42;
                v179 = 0u;
                v180 = 0u;
                v177 = 0u;
                v178 = 0u;
                v48 = v45;
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v177, v181, 16);
                if (v49)
                {
                  v50 = v49;
                  v51 = *(_QWORD *)v178;
                  do
                  {
                    v52 = 0;
                    do
                    {
                      if (*(_QWORD *)v178 != v51)
                        objc_enumerationMutation(v48);
                      v53 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * (_QWORD)v52);
                      v54 = v40;
                      v55 = v41;
                      v56 = v53;
                      if (qword_100010818 != -1)
                        dispatch_once(&qword_100010818, &stru_10000C6F0);
                      v57 = objc_msgSend((id)qword_100010810, "indexForKey:", v56, v123);
                      if (v57 == (id)0x7FFFFFFFFFFFFFFFLL)
                      {
                        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                        {
                          v123 = v56;
                          MOLogWrite(qword_1000107C0);
                        }

                      }
                      else
                      {
                        v58 = &off_1000102E0 + 4 * (_QWORD)v57;

                        sub_100008548((uint64_t)v58, v54, v55);
                      }

                      v52 = (char *)v52 + 1;
                    }
                    while (v50 != v52);
                    v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v177, v181, 16);
                  }
                  while (v50);
                }

                v43 = v141;
                v42 = v143;
                v45 = v153;
                v47 = context;
              }
              else
              {
                do
                {
                  sub_100008548((uint64_t)&off_1000102E0 + (_QWORD)v44, v40, v41);
                  v44 += 32;
                }
                while (v44 != (char *)1184);
              }
              objc_autoreleasePoolPop(v47);
              v59 = v151;
              if (!v156 || objc_msgSend(v151, "count"))
              {
                v60 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bundleURL", v123));
                v61 = (__CFString *)v151;
                pthread_mutex_lock(&stru_100010780);
                Unique = (__CFBundle *)_CFBundleCreateUnique(0, v60);
                if (Unique)
                {
                  v63 = Unique;
                  if (v156)
                  {
                    v64 = v43;
                    FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist(Unique, v61, 1);
                    if (FilteredInfoPlist)
                    {
                      v66 = (const __CFDictionary *)FilteredInfoPlist;
                      TypeID = CFDictionaryGetTypeID();
                      if (TypeID == CFGetTypeID(v66))
                      {
                        MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v66);
                        CFRelease(v66);
                        goto LABEL_67;
                      }
                      v71 = CFGetTypeID(v66);
                      v72 = CFCopyTypeIDDescription(v71);
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v123 = (__CFString *)v72;
                        MOLogWrite(qword_1000107C0);
                      }
                      if (v72)
                        CFRelease(v72);
                      CFRelease(v66);
                    }
                    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                    {
                      v123 = v61;
                      v124 = v63;
                      MOLogWrite(qword_1000107C0);
                    }
                    MutableCopy = 0;
LABEL_67:
                    v43 = v64;
                    v59 = v151;
                  }
                  else
                  {
                    InfoDictionary = CFBundleGetInfoDictionary(Unique);
                    if (InfoDictionary)
                    {
                      v70 = CFDictionaryCreateMutableCopy(0, 0, InfoDictionary);
                      MutableCopy = v70;
                      if (v70)
                        -[__CFDictionary removeObjectForKey:](v70, "removeObjectForKey:", CFSTR("CFBundleInfoPlistURL"));
                    }
                    else
                    {
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v123 = v60;
                        MOLogWrite(qword_1000107C0);
                      }
                      MutableCopy = 0;
                    }
                  }
                  CFRelease(v63);
                }
                else
                {
                  if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                  {
                    v123 = v60;
                    MOLogWrite(qword_1000107C0);
                  }
                  MutableCopy = 0;
                }
                pthread_mutex_unlock(&stru_100010780);

                if (MutableCopy)
                {
                  *(_QWORD *)&v168 = _NSConcreteStackBlock;
                  *((_QWORD *)&v168 + 1) = 3221225472;
                  *(_QWORD *)&v169 = sub_10000879C;
                  *((_QWORD *)&v169 + 1) = &unk_10000C6D0;
                  *(_QWORD *)&v170 = v42;
                  *((_QWORD *)&v170 + 1) = v43;
                  *(_QWORD *)&v171 = v41;
                  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](MutableCopy, "enumerateKeysAndObjectsUsingBlock:", &v168);

                }
                v45 = v153;
              }

              v73 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "bundleIdentifier"));
              v74 = v41;
              v75 = v137;
              v76 = v145;
              v168 = 0u;
              v169 = 0u;
              v170 = 0u;
              v171 = 0u;
              v77 = v75;
              v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v168, v181, 16);
              if (v78)
              {
                v79 = v78;
                v80 = *(_QWORD *)v169;
                while (2)
                {
                  for (i = 0; i != v79; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v169 != v80)
                      objc_enumerationMutation(v77);
                    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)i), v123));

                    if (!v82)
                    {

                      v21 = v132;
                      v20 = v133;
                      v23 = v138;
                      v27 = v158;
                      v30 = v150;
                      goto LABEL_108;
                    }
                  }
                  v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v168, v181, 16);
                  if (v79)
                    continue;
                  break;
                }
              }

              if (!v145)
                goto LABEL_106;
              v166 = 0u;
              v167 = 0u;
              v164 = 0u;
              v165 = 0u;
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "allKeys"));
              v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v164, &v177, 16);
              if (v84)
              {
                v85 = v84;
                v86 = *(_QWORD *)v165;
                do
                {
                  for (j = 0; j != v85; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v165 != v86)
                      objc_enumerationMutation(v83);
                    v88 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)j);
                    if ((objc_msgSend(v76, "containsObject:", v88, v123) & 1) == 0)
                      objc_msgSend(v74, "removeObjectForKey:", v88);
                  }
                  v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v164, &v177, 16);
                }
                while (v85);
              }

              if (a14)
              {
                v89 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v73));
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bundleContainerURL"));
                v30 = v150;
                if (objc_msgSend(v89, "isContainerized") && v90)
                {
                  v91 = a14;
                  if ((a14 & 1) != 0 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
                    MOLogWrite(qword_1000107C0);
                  if ((a14 & 4) != 0)
                  {
                    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "diskUsage"));
                    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "staticUsage"));

                    if (v94)
                    {
                      objc_msgSend(v74, "setObject:forKey:", v94, CFSTR("StaticDiskUsage"));
                    }
                    else
                    {
                      v95 = qword_1000107C0;
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v123 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bundleIdentifier", v123));
                        MOLogWrite(v95);

                      }
                    }

                    v30 = v150;
                    if ((a14 & 2) != 0)
                      goto LABEL_122;
LABEL_99:
                    if ((a14 & 8) == 0)
                      goto LABEL_100;
LABEL_128:
                    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bundleURL", v123));
                    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bundleExecutable"));
                    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SC_Info/%@.sinf"), v99));
                    v101 = v90;
                    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "URLByAppendingPathComponent:", v100));
                    sub_1000088A4(v102, v74, CFSTR("ApplicationSINF"));

                    v90 = v101;
                    v91 = a14;

                    v30 = v150;
                    if ((a14 & 0x10) != 0)
                      goto LABEL_129;
LABEL_101:
                    if ((v91 & 0x20) != 0)
                      goto LABEL_156;
                  }
                  else
                  {
                    if ((a14 & 2) == 0)
                      goto LABEL_99;
LABEL_122:
                    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "diskUsage", v123));
                    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "dynamicUsage"));

                    if (v97)
                    {
                      objc_msgSend(v74, "setObject:forKey:", v97, CFSTR("DynamicDiskUsage"));
                    }
                    else
                    {
                      v98 = qword_1000107C0;
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v123 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bundleIdentifier"));
                        MOLogWrite(v98);

                      }
                    }

                    v30 = v150;
                    if ((a14 & 8) != 0)
                      goto LABEL_128;
LABEL_100:
                    if ((a14 & 0x10) == 0)
                      goto LABEL_101;
LABEL_129:
                    v142 = v90;
                    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "URLByAppendingPathComponent:", CFSTR("iTunesMetadata.plist"), v123));
                    v104 = v89;
                    v105 = v103;
                    v152 = v74;
                    v144 = v104;
                    v155 = (__CFBundle *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "bundleIdentifier"));
                    v175 = 0;
                    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v105, 3, &v175));
                    v107 = v175;
                    v108 = v107;
                    if (v106)
                    {
                      contexta = v105;
                      v173 = 0;
                      v174 = 100;
                      v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v106, 1, &v174, &v173));
                      v129 = v173;

                      if (v109)
                      {
                        v110 = objc_opt_class(NSMutableDictionary);
                        if ((objc_opt_isKindOfClass(v109, v110) & 1) == 0)
                        {
                          v116 = v109;
                          v117 = qword_1000107C0;
                          if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3)
                          {
                            v109 = v116;
                          }
                          else
                          {
                            v128 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(contexta, "path"));
                            v118 = (objc_class *)objc_opt_class(v116);
                            v119 = NSStringFromClass(v118);
                            v124 = v155;
                            v125 = (void *)objc_claimAutoreleasedReturnValue(v119);
                            v123 = v128;
                            v120 = v117;
                            v109 = v116;
                            MOLogWrite(v120);

                          }
                          goto LABEL_153;
                        }
                        v127 = v109;
                        v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "objectForKeyedSubscript:", CFSTR("title")));

                        if (v111)
                          goto LABEL_137;
                        v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "localizedShortName"));
                        if (!v112)
                          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "localizedName"));
                        objc_msgSend(v127, "setObject:forKeyedSubscript:", v112, CFSTR("title"));
                        v172 = 0;
                        v113 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v127, v174, 0, &v172));
                        v126 = v172;

                        if (v113)
                        {

                          v106 = (void *)v113;
                          v129 = v126;
LABEL_137:
                          objc_msgSend(v152, "setObject:forKey:", v106, CFSTR("iTunesMetadata"));
                          v109 = v127;
LABEL_153:
                          v108 = v129;
                        }
                        else
                        {
                          if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                          {
                            v123 = (__CFString *)v155;
                            v124 = (__CFBundle *)v126;
                            MOLogWrite(qword_1000107C0);
                          }

                          v106 = 0;
                          v108 = v126;
                          v109 = v127;
                        }
                      }
                      else
                      {
                        if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3)
                          goto LABEL_153;
                        v108 = v129;
                        v123 = (__CFString *)v155;
                        v124 = (__CFBundle *)v129;
                        MOLogWrite(qword_1000107C0);
                      }

                      v105 = contexta;
                    }
                    else
                    {
                      if (v107)
                      {
                        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "domain"));
                        if ((objc_msgSend(v114, "isEqualToString:", NSCocoaErrorDomain) & 1) != 0)
                        {
                          v115 = objc_msgSend(v108, "code");

                          if (v115 == (id)260)
                            goto LABEL_155;
                        }
                        else
                        {

                        }
                      }
                      if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
                      {
                        v124 = (__CFBundle *)v105;
                        v125 = v108;
                        v123 = (__CFString *)v155;
                        MOLogWrite(qword_1000107C0);
                      }
                    }
LABEL_155:

                    v30 = v150;
                    v90 = v142;
                    if ((v91 & 0x20) != 0)
                    {
LABEL_156:
                      v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "URLByAppendingPathComponent:", CFSTR("iTunesArtwork"), v123, v124, v125));
                      sub_1000088A4(v121, v74, CFSTR("iTunesArtwork"));

                      v30 = v150;
                      if ((v91 & 0x40) == 0)
                        goto LABEL_104;
LABEL_103:
                      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "URLByAppendingPathComponent:", CFSTR("GeoJSON"), v123));
                      sub_1000088A4(v92, v74, CFSTR("GeoJSON"));

                      v30 = v150;
                      goto LABEL_104;
                    }
                  }
                  if ((v91 & 0x40) == 0)
                    goto LABEL_104;
                  goto LABEL_103;
                }
LABEL_104:

              }
              else
              {
LABEL_106:

                v30 = v150;
              }

              v73 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "bundleIdentifier"));
              v130[2](v130, v73, v74);
              v21 = v132;
              v20 = v133;
              v23 = v138;
              v27 = v158;
LABEL_108:
              v32 = v157;

              v24 = v131;
              v25 = v147;
            }
          }

        }
        objc_autoreleasePoolPop(v27);
        v25 = (char *)v25 + 1;
      }
      while (v25 != v23);
      v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v176, 16);
      v23 = v122;
    }
    while (v122);
  }

}

void sub_100007B24(id a1)
{
  uint64_t i;
  id v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 37));
  for (i = 0; i != 1184; i += 32)
    objc_msgSend(v4, "addObject:", **(_QWORD **)((char *)&off_1000102E0 + i));
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)qword_1000107D8;
  qword_1000107D8 = (uint64_t)v2;

}

void *sub_100007BA0()
{
  return &__kCFBooleanTrue;
}

id sub_100007BAC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = objc_msgSend(*a1, "count");
  if (v2)
    v2 = v1;
  return v2;
}

id sub_100007BD8(_BYTE *a1)
{
  void *v1;

  if (*a1)
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  else
    v1 = 0;
  return v1;
}

id sub_100007C0C(id *a1)
{
  return objc_msgSend(*a1, "path");
}

id sub_100007C14(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = objc_msgSend(*a1, "count");
  if (v2)
    v2 = v1;
  return v2;
}

void *sub_100007C40(void *a1)
{
  id v1;
  id v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "entitlementValueForKey:ofClass:", CFSTR("com.apple.private.mobileinstall.upgrade-enabled"), objc_opt_class(NSNumber));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleType"));

  v6 = &__kCFBooleanTrue;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("User")) & 1) == 0
    && !(objc_msgSend(v5, "isEqualToString:", CFSTR("VPNPlugin")) | v4))
  {
    v6 = &__kCFBooleanFalse;
  }

  return v6;
}

id sub_100007CFC(id *a1)
{
  id v1;

  v1 = objc_msgSend(*a1, "longLongValue");
  if (v1)
    v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v1));
  return v1;
}

id sub_100007D2C(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v1 = *a1;
  v2 = objc_msgSend(*a1, "count");
  if (v2)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v1, "count")));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v1;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v5)
      goto LABEL_22;
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9, v17));
        v11 = objc_opt_class(NSURL);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v12 = v10;
          goto LABEL_11;
        }
        v13 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0)
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
LABEL_11:
          v14 = v12;
          if (objc_msgSend(v12, "isFileURL"))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, v9);

          }
          else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          {
            v17 = v14;
            MOLogWrite(qword_1000107C0);
          }
          goto LABEL_20;
        }
        if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
          MOLogWrite(qword_1000107C0);
        v14 = 0;
LABEL_20:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v6)
      {
LABEL_22:

        v2 = v3;
        return v2;
      }
    }
  }
  return v2;
}

NSNumber *sub_100007F6C(_QWORD *a1)
{
  return +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *a1);
}

id sub_100007F7C(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = objc_opt_class(NSArray);
  v3 = objc_msgSend(v1, "objectForInfoDictionaryKey:ofClass:valuesOfClass:", CFSTR("SBMatchingApplicationGenres"), v2, objc_opt_class(NSString));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

id sub_100007FE4(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "objectForInfoDictionaryKey:ofClass:", CFSTR("LSApplicationCategoryType"), objc_opt_class(NSString));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  return v3;
}

void *sub_100008038(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "appState"));
  if (!objc_msgSend(v2, "isPlaceholder"))
  {

    goto LABEL_7;
  }
  if (objc_msgSend(v1, "installType") != (id)7)
  {
    v3 = objc_msgSend(v1, "installType");

    if (v3 == (id)8)
      goto LABEL_6;
LABEL_7:
    v4 = &__kCFBooleanFalse;
    goto LABEL_8;
  }

LABEL_6:
  v4 = &__kCFBooleanTrue;
LABEL_8:

  return v4;
}

void *sub_1000080C8(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  id v11;

  v1 = a1;
  v2 = objc_alloc((Class)LSApplicationRecord);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleIdentifier"));
  v11 = 0;
  v4 = objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v11);
  v5 = v11;

  if (!v4)
  {
    v8 = qword_1000107C0;
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleIdentifier"));
      MOLogWrite(v8);

    }
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appClipMetadata"));

  if (!v6)
  {
LABEL_7:
    v7 = &__kCFBooleanFalse;
    goto LABEL_8;
  }
  v7 = &__kCFBooleanTrue;
LABEL_8:

  return v7;
}

void *sub_1000081DC(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v12;

  v1 = a1;
  if (qword_1000107F8 != -1)
    dispatch_once(&qword_1000107F8, &stru_10000C688);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "managedPersonas"));
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "count"))
  {
LABEL_13:
    v12 = 0;
    v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v2, 1, &v12);
    v7 = v12;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appClipMetadata"));

      if (v8
        || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managementDomain")),
            v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("swift-playgrounds")),
            v9,
            (v10 & 1) != 0))
      {
        v5 = &__kCFBooleanFalse;
LABEL_21:

        goto LABEL_22;
      }
    }
    else if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
    {
      MOLogWrite(qword_1000107C0);
    }
    v5 = &__kCFBooleanTrue;
    goto LABEL_21;
  }
  if (!qword_1000107E8 || !qword_1000107F0)
  {
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      MOLogWrite(qword_1000107C0);
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "containsObject:") & 1) != 0
    || (objc_msgSend(v4, "containsObject:", qword_1000107F0) & 1) != 0)
  {
    goto LABEL_13;
  }
  v5 = &__kCFBooleanFalse;
LABEL_22:

  return v5;
}

void sub_1000083C4(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersonaAttributes personaAttributesForPersonaType:](UMUserPersonaAttributes, "personaAttributesForPersonaType:", 0));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userPersonaUniqueString"));
  v3 = (void *)qword_1000107E8;
  qword_1000107E8 = v2;

  if (!qword_1000107E8 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
    MOLogWrite(qword_1000107C0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserPersonaAttributes personaAttributesForPersonaType:](UMUserPersonaAttributes, "personaAttributesForPersonaType:", 3));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaUniqueString"));
  v6 = (void *)qword_1000107F0;
  qword_1000107F0 = v5;

  if (!qword_1000107F0 && (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3))
    MOLogWrite(qword_1000107C0);
}

void sub_1000084CC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("SharedDirSize"), CFSTR("DynamicDiskUsage"), CFSTR("StaticDiskUsage"), CFSTR("ApplicationSINF"), CFSTR("iTunesArtwork"), CFSTR("GeoJSON"), CFSTR("iTunesMetadata"), 0));
  v2 = (void *)qword_100010800;
  qword_100010800 = v1;

}

void sub_100008548(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (*v6)(id);
  uint64_t v7;
  id v8;
  id *v9;
  NSString *v10;
  SEL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t (*v15)(id *);
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;

  v20 = a2;
  v5 = a3;
  v6 = *(uint64_t (**)(id))(a1 + 24);
  if (!v6)
  {
    v10 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 8)));
    v11 = NSSelectorFromString(v10);

    if ((objc_opt_respondsToSelector(v20, v11) & 1) != 0)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "methodSignatureForSelector:", v11));
      if (v12)
      {
        v13 = (void *)v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v12));
        objc_msgSend(v14, "setSelector:", v11);
        objc_msgSend(v14, "invokeWithTarget:", v20);
        v9 = (id *)malloc_type_malloc((size_t)objc_msgSend(v13, "methodReturnLength"), 0x50130DACuLL);
        objc_msgSend(v14, "getReturnValue:", v9);
        v15 = *(uint64_t (**)(id *))(a1 + 16);
        if (v15)
        {
          v16 = v15(v9);
          v17 = (id)objc_claimAutoreleasedReturnValue(v16);
        }
        else
        {
          v19 = objc_retainAutorelease(v13);
          if (strcmp("@", (const char *)objc_msgSend(v19, "methodReturnType")))
          {
            if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
              MOLogWrite(qword_1000107C0);

            goto LABEL_17;
          }
          v17 = objc_retainAutorelease(*v9);
        }
        v8 = v17;

        if (!v8)
          goto LABEL_17;
        goto LABEL_3;
      }
      v18 = qword_1000107C0;
      if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3)
      {
LABEL_16:
        v9 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v18 = qword_1000107C0;
      if (qword_1000107C0 && *(int *)(qword_1000107C0 + 44) < 3)
        goto LABEL_16;
    }
    MOLogWrite(v18);
    goto LABEL_16;
  }
  v7 = v6(v20);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  v9 = 0;
  if (v8)
LABEL_3:
    objc_msgSend(v5, "setObject:forKey:", v8, **(_QWORD **)a1);
LABEL_17:
  free(v9);

}

void sub_10000879C(id *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;

  v8 = a2;
  v7 = a3;
  if ((objc_msgSend(a1[4], "containsObject:", v8) & 1) == 0
    && (objc_msgSend(a1[5], "containsObject:", v8) & 1) == 0)
  {
    objc_msgSend(a1[6], "setValue:forKey:", v7, v8);
  }
  *a4 = 0;

}

void sub_10000881C(id a1)
{
  uint64_t i;
  id v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 37));
  for (i = 0; i != 1184; i += 32)
    objc_msgSend(v4, "addObject:", **(_QWORD **)((char *)&off_1000102E0 + i));
  v2 = objc_msgSend(objc_alloc((Class)NSKnownKeysMappingStrategy), "initForKeys:", v4);
  v3 = (void *)qword_100010810;
  qword_100010810 = (uint64_t)v2;

}

void sub_1000088A4(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v5, 2, &v13));
  v9 = v13;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v6, "setObject:forKey:", v8, v7);
  }
  else
  {
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if ((objc_msgSend(v11, "isEqualToString:", NSCocoaErrorDomain) & 1) != 0)
      {
        v12 = objc_msgSend(v10, "code");

        if (v12 == (id)260)
          goto LABEL_11;
      }
      else
      {

      }
    }
    if (!qword_1000107C0 || *(int *)(qword_1000107C0 + 44) >= 3)
      MOLogWrite(qword_1000107C0);
  }
LABEL_11:

}

void sub_1000089D8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unsupported value for %@ : %@", (uint8_t *)&v2, 0x16u);
}

void sub_100008A60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a2 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8);
  v4 = 138412802;
  v5 = a1;
  v6 = 2112;
  v7 = v2;
  v8 = 2112;
  v9 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Unsupported uninstall option %@ in %@ (client: %@)", (uint8_t *)&v4, 0x20u);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appClipMetadata");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appState");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleContainerURL");
}

id objc_msgSend_bundleExecutable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleExecutable");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleType");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compatibilityObject");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_diskUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diskUsage");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_dynamicUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicUsage");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_entitlementValueForKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlementValueForKey:ofClass:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_getKnowledgeUUID_andSequenceNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getKnowledgeUUID:andSequenceNumber:");
}

id objc_msgSend_getReturnValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReturnValue:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_indexForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexForKey:");
}

id objc_msgSend_initForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForKeys:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithLegacyOptionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLegacyOptionsDictionary:");
}

id objc_msgSend_installApplication_consumeSource_options_legacyProgressBlock_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installApplication:consumeSource:options:legacyProgressBlock:completion:");
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installType");
}

id objc_msgSend_invocationWithMethodSignature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invocationWithMethodSignature:");
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isContainerized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isContainerized");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLaunchProhibited");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isSwiftPlaygroundsApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSwiftPlaygroundsApp");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedShortName");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_managedPersonas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedPersonas");
}

id objc_msgSend_managementDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managementDomain");
}

id objc_msgSend_methodReturnLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodReturnLength");
}

id objc_msgSend_methodReturnType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodReturnType");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForInfoDictionaryKey_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:ofClass:");
}

id objc_msgSend_objectForInfoDictionaryKey_ofClass_valuesOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:ofClass:valuesOfClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_personaAttributesForPersonaType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaAttributesForPersonaType:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSync");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelector:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWaitForDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitForDeletion:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_staticUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "staticUsage");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_terminateSyncWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateSyncWithCompletionHandler:");
}

id objc_msgSend_uninstallAppWithBundleID_options_disposition_error_legacyProgressBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uninstallAppWithBundleID:options:disposition:error:legacyProgressBlock:");
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonaUniqueString");
}
