uint64_t start()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFString *v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFArray *v45;
  CFStringRef *v46;
  const void *v47;
  const void *v48;
  uint64_t PeerID;
  const void *v50;
  const void *v51;
  CFErrorDomain Domain;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const __CFDictionary *v70;
  const void *v71;
  const void *v72;
  const void *v73;
  const __CFDictionary *v74;
  const void *v75;
  const __CFDictionary *v76;
  const void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *i;
  id v84;
  void *v85;
  char IsInternalRelease;
  char v87;
  void *v88;
  CFTypeRef v89;
  id v90;
  void *v91;
  dispatch_semaphore_t v92;
  NSObject *v93;
  void *v94;
  NSObject *v95;
  dispatch_time_t v96;
  dispatch_queue_t v97;
  dispatch_group_t v98;
  NSObject *v99;
  NSObject *v100;
  dispatch_semaphore_t v101;
  dispatch_time_t v102;
  NSObject *v103;
  NSObject *v104;
  CFStringRef *v105;
  const void *v106;
  CFTypeID v107;
  uint64_t v108;
  NSObject *v109;
  uint64_t v110;
  const __CFDictionary *v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char v120;
  char v121;
  char v122;
  char v123;
  void *v124;
  const __CFDictionary *query;
  void *v126;
  CFTypeRef cf;
  CFStringRef context;
  uint64_t v129;
  CFBooleanRef v130;
  void *v131;
  __CFString *v132;
  NSObject *v133;
  __int128 *v134;
  __int128 v135;
  __int128 v136;
  unsigned __int128 v137;
  __int128 v138;
  _QWORD v139[6];
  __int128 result;
  CFStringRef v141;
  CFStringRef v142;
  void *v143;
  void *v144;
  CFRange v145;

  v124 = objc_autoreleasePoolPush();
  puts("sysdiagnose keychain");
  qword_10000C2D0 = (uint64_t)__stdoutp;
  *(_QWORD *)&result = 0;
  *(_QWORD *)&v135 = 0;
  *((_QWORD *)&v135 + 1) = &v135;
  *(_QWORD *)&v136 = 0x2020000000;
  DWORD2(v136) = 0;
  v0 = SOSCCThisDeviceIsInCircle(&result);
  if (v0 == -1)
  {
    if (CFErrorGetCode((CFErrorRef)result) == 1050)
    {
      v12 = qword_10000C2D0;
      v13 = CFSTR("SOS is not supported on this platform\n");
    }
    else
    {
      v51 = (const void *)sSecXPCErrorDomain;
      Domain = CFErrorGetDomain((CFErrorRef)result);
      v53 = CFEqual(v51, Domain);
      v12 = qword_10000C2D0;
      if (v53)
      {
        v13 = CFSTR("SOS status is kSOSCCError due to XPC error\n");
      }
      else
      {
        v120 = result;
        v13 = CFSTR("SOS status is kSOSCCError (%@)\n");
      }
    }
    sub_100006564(v12, 0, v13, v7, v8, v9, v10, v11, v120);
    sub_100006564(qword_10000C2D0, 0, CFSTR("\n"), v54, v55, v56, v57, v58, v123);
  }
  else
  {
    if (v0 > 3)
      v6 = "<unknown ccstatus>";
    else
      v6 = off_1000086D8[v0];
    sub_100006564(qword_10000C2D0, 0, CFSTR("ccstatus: %s (%d)\n"), v1, v2, v3, v4, v5, (char)v6);
    if ((_QWORD)result)
    {
      sub_100006564(qword_10000C2D0, 0, CFSTR("Error checking circle status: %@\n"), v14, v15, v16, v17, v18, result);
      v19 = (const void *)result;
      if ((_QWORD)result)
      {
        *(_QWORD *)&result = 0;
        CFRelease(v19);
      }
    }
    v25 = SOSCCGetLastDepartureReason(&result);
    if (v25 > 8)
      v26 = "Unknown";
    else
      v26 = off_1000086F8[v25];
    sub_100006564(qword_10000C2D0, 0, CFSTR("LastDepartureReason: %s (%d)\n"), v20, v21, v22, v23, v24, (char)v26);
    if ((_QWORD)result)
    {
      sub_100006564(qword_10000C2D0, 0, CFSTR("Error checking last departure reason error: %@\n"), v27, v28, v29, v30, v31, result);
      v32 = (const void *)result;
      if ((_QWORD)result)
      {
        *(_QWORD *)&result = 0;
        CFRelease(v32);
      }
    }
    if (SOSCCValidateUserPublic(&result))
    {
      v38 = CFSTR("Account user public is trusted\n");
    }
    else
    {
      v121 = result;
      v38 = CFSTR("Account user public is not trusted error:(%@)\n");
    }
    sub_100006564(qword_10000C2D0, 0, v38, v33, v34, v35, v36, v37, v121);
    v39 = (const void *)result;
    if ((_QWORD)result)
    {
      *(_QWORD *)&result = 0;
      CFRelease(v39);
    }
    v45 = (const __CFArray *)SOSCCCopyGenerationPeerInfo(&result);
    if (v45)
    {
      context = (CFStringRef)_NSConcreteStackBlock;
      v129 = 3221225472;
      v130 = (CFBooleanRef)sub_1000054F4;
      v131 = &unk_100008520;
      v132 = (__CFString *)&v135;
      v46 = &context;
      v145.length = CFArrayGetCount(v45);
      v145.location = 0;
      CFArrayApplyFunction(v45, v145, (CFArrayApplierFunction)sub_1000055C4, v46);

      CFRelease(v45);
    }
    else
    {
      sub_100006564(qword_10000C2D0, 0, CFSTR("No generation count: %@\n"), v40, v41, v42, v43, v44, result);
    }
    v47 = (const void *)result;
    if ((_QWORD)result)
    {
      *(_QWORD *)&result = 0;
      CFRelease(v47);
    }
    v48 = (const void *)SOSCCCopyMyPeerInfo(0);
    PeerID = SOSPeerInfoGetPeerID(v48);
    sub_1000055D8((uint64_t)"     Peers", PeerID, (uint64_t)&stru_100008560);
    sub_1000055D8((uint64_t)"   Invalid", PeerID, (uint64_t)&stru_100008580);
    sub_1000055D8((uint64_t)"   Retired", PeerID, (uint64_t)&stru_1000085A0);
    sub_1000055D8((uint64_t)"    Concur", PeerID, (uint64_t)&stru_1000085C0);
    sub_1000055D8((uint64_t)"Applicants", PeerID, (uint64_t)&stru_1000085E0);
    if (v48)
      CFRelease(v48);
    v50 = (const void *)result;
    if ((_QWORD)result)
    {
      *(_QWORD *)&result = 0;
      CFRelease(v50);
    }
  }
  _Block_object_dispose(&v135, 8);
  context = 0;
  sub_100006564(qword_10000C2D0, 0, CFSTR("Engine state:\n"), v59, v60, v61, v62, v63, v122);
  if ((SOSCCForEachEngineStateAsString(&context, &stru_100008620) & 1) == 0)
    sub_100006564(qword_10000C2D0, 0, CFSTR("No engine state, got error: %@\n"), v64, v65, v66, v67, v68, (char)context);
  objc_msgSend(CFSTR("HomeKit keychain state:\n"), "writeToStdOut");
  *(_QWORD *)&v135 = kSecClass;
  *((_QWORD *)&v135 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v129 = (uint64_t)CFSTR("com.apple.hap.pairing");
  *(_QWORD *)&v136 = kSecAttrSynchronizable;
  *((_QWORD *)&v136 + 1) = kSecMatchLimit;
  v130 = kCFBooleanTrue;
  v131 = (void *)kSecMatchLimitAll;
  v137 = __PAIR128__((unint64_t)kSecReturnData, (unint64_t)kSecReturnAttributes);
  v132 = (__CFString *)&__kCFBooleanTrue;
  v133 = &__kCFBooleanFalse;
  *(_QWORD *)&v138 = kSecUseDataProtectionKeychain;
  v134 = (__int128 *)&__kCFBooleanTrue;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &context, &v135, 7));
  v70 = (const __CFDictionary *)objc_msgSend(v69, "mutableCopy");

  *(_QWORD *)&result = 0;
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result))
    sub_100004E84(CFSTR("HomeKit"), (void *)result);
  v71 = (const void *)result;
  if ((_QWORD)result)
  {
    *(_QWORD *)&result = 0;
    CFRelease(v71);
  }
  -[__CFDictionary setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSecAttrSynchronizable);
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result))
    sub_100004E84(CFSTR("HomeKit"), (void *)result);
  v72 = (const void *)result;
  if ((_QWORD)result)
  {
    *(_QWORD *)&result = 0;
    CFRelease(v72);
  }
  -[__CFDictionary setObject:forKeyedSubscript:](v70, "setObject:forKeyedSubscript:", CFSTR("com.apple.hap.metadata"), kSecAttrAccessGroup);
  if (!SecItemCopyMatching(v70, (CFTypeRef *)&result))
    sub_100004E84(CFSTR("HomeKit"), (void *)result);
  v73 = (const void *)result;
  if ((_QWORD)result)
  {
    *(_QWORD *)&result = 0;
    CFRelease(v73);
  }

  objc_msgSend(CFSTR("AutoUnlock keychain state:\n"), "writeToStdOut");
  *(_QWORD *)&v135 = kSecClass;
  *((_QWORD *)&v135 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v129 = (uint64_t)CFSTR("com.apple.continuity.unlock");
  *(_QWORD *)&v136 = kSecAttrAccount;
  *((_QWORD *)&v136 + 1) = kSecAttrSynchronizable;
  v130 = (CFBooleanRef)CFSTR("com.apple.continuity.auto-unlock.sync");
  v131 = kCFBooleanTrue;
  *(_QWORD *)&v137 = kSecMatchLimit;
  *((_QWORD *)&v137 + 1) = kSecReturnAttributes;
  v132 = (__CFString *)kSecMatchLimitAll;
  v133 = &__kCFBooleanTrue;
  *(_QWORD *)&v138 = kSecReturnData;
  v134 = (__int128 *)&__kCFBooleanFalse;
  v74 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &context, &v135, 7));
  *(_QWORD *)&result = 0;
  if (!SecItemCopyMatching(v74, (CFTypeRef *)&result))
    sub_100004E84(CFSTR("AutoUnlock"), (void *)result);
  v75 = (const void *)result;
  if ((_QWORD)result)
  {
    *(_QWORD *)&result = 0;
    CFRelease(v75);
  }

  objc_msgSend(CFSTR("Rapport keychain state:\n"), "writeToStdOut");
  *(_QWORD *)&v135 = kSecClass;
  *((_QWORD *)&v135 + 1) = kSecAttrAccessGroup;
  context = kSecClassGenericPassword;
  v129 = (uint64_t)CFSTR("com.apple.rapport");
  *(_QWORD *)&v136 = kSecAttrSynchronizable;
  *((_QWORD *)&v136 + 1) = kSecMatchLimit;
  v130 = kCFBooleanTrue;
  v131 = (void *)kSecMatchLimitAll;
  v137 = __PAIR128__((unint64_t)kSecReturnData, (unint64_t)kSecReturnAttributes);
  v132 = (__CFString *)&__kCFBooleanTrue;
  v133 = &__kCFBooleanFalse;
  v76 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &context, &v135, 6));
  *(_QWORD *)&result = 0;
  if (!SecItemCopyMatching(v76, (CFTypeRef *)&result))
    sub_100004E84(CFSTR("rapport"), (void *)result);
  v77 = (const void *)result;
  if ((_QWORD)result)
  {
    *(_QWORD *)&result = 0;
    CFRelease(v77);
  }

  objc_msgSend(CFSTR("Notes keychain state:\n"), "writeToStdOut");
  v139[0] = kSecClass;
  v139[1] = kSecAttrAccessGroup;
  *(_QWORD *)&result = kSecClassGenericPassword;
  *((_QWORD *)&result + 1) = CFSTR("group.com.apple.notes");
  v139[2] = kSecAttrSynchronizable;
  v139[3] = kSecMatchLimit;
  v141 = kSecAttrSynchronizableAny;
  v142 = kSecMatchLimitAll;
  v139[4] = kSecReturnAttributes;
  v139[5] = kSecReturnData;
  v143 = &__kCFBooleanTrue;
  v144 = &__kCFBooleanFalse;
  query = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &result, v139, 6));
  cf = 0;
  if (!SecItemCopyMatching(query, &cf))
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v79 = (id)cf;
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v135, &context, 16);
    if (v80)
    {
      v81 = *(_QWORD *)v136;
      v82 = 1;
      do
      {
        for (i = 0; i != v80; i = (char *)i + 1)
        {
          if (*(_QWORD *)v136 != v81)
            objc_enumerationMutation(v79);
          v84 = objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)i), "mutableCopy");
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "objectForKeyedSubscript:", kSecAttrLabel));
          IsInternalRelease = SecIsInternalRelease();
          if (v85)
            v87 = IsInternalRelease;
          else
            v87 = 1;
          if ((v87 & 1) == 0 && (objc_msgSend(v85, "isEqual:", CFSTR("local")) & 1) == 0)
          {
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "objectForKeyedSubscript:", v85));
            if (!v88)
            {
              v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<REDACTED-LABL-%llu>"), v82));
              objc_msgSend(v126, "setObject:forKeyedSubscript:", v88, v85);
              ++v82;
            }
            objc_msgSend(v84, "setObject:forKeyedSubscript:", v88, kSecAttrLabel);

          }
          objc_msgSend(v78, "addObject:", v84);

        }
        v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v135, &context, 16);
      }
      while (v80);
    }

    sub_100004E84(CFSTR("notes"), v78);
  }
  v89 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v89);
  }

  v90 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.securityuploadd"), 0);
  if (v90)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___supdProtocol));
    objc_msgSend(v90, "setRemoteObjectInterface:", v91);

    objc_msgSend(v90, "resume");
    v92 = dispatch_semaphore_create(0);
    context = (CFStringRef)_NSConcreteStackBlock;
    v129 = 3221225472;
    v130 = (CFBooleanRef)sub_100005144;
    v131 = &unk_1000084A8;
    v93 = v92;
    v132 = (__CFString *)v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "remoteObjectProxyWithErrorHandler:", &context));
    *(_QWORD *)&v135 = _NSConcreteStackBlock;
    *((_QWORD *)&v135 + 1) = 3221225472;
    *(_QWORD *)&v136 = sub_100005194;
    *((_QWORD *)&v136 + 1) = &unk_1000084D0;
    v95 = v93;
    *(_QWORD *)&v137 = v95;
    objc_msgSend(v94, "getSysdiagnoseDumpWithReply:", &v135);

    v96 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v95, v96))
      objc_msgSend(CFSTR("\n\nError: timed out waiting for response\n"), "writeToStdErr");

  }
  else
  {
    objc_msgSend(CFSTR("failed to setup xpc connection for securityuploadd\n"), "writeToStdErr");
  }

  qword_10000C2D0 = (uint64_t)__stdoutp;
  v97 = dispatch_queue_create("general", 0);
  v98 = dispatch_group_create();
  v99 = v97;
  v100 = v98;
  *(_QWORD *)&v135 = 0;
  *((_QWORD *)&v135 + 1) = &v135;
  v136 = 0x2020000000uLL;
  v101 = dispatch_semaphore_create(0);
  v102 = dispatch_time(0, 30000000000);
  dispatch_group_enter(v100);
  context = (CFStringRef)_NSConcreteStackBlock;
  v129 = 3221225472;
  v130 = (CFBooleanRef)sub_100005C0C;
  v131 = &unk_100008668;
  v134 = &v135;
  v103 = v100;
  v132 = (__CFString *)v103;
  v104 = v101;
  v133 = v104;
  v105 = objc_retainBlock(&context);
  SOSCloudKeychainGetAllObjectsFromCloud(v99, v105);
  dispatch_semaphore_wait(v104, v102);
  v106 = *(const void **)(*((_QWORD *)&v135 + 1) + 24);
  if (v106)
  {
    v107 = CFGetTypeID(v106);
    if (v107 == CFNullGetTypeID())
    {
      CFRelease(*(CFTypeRef *)(*((_QWORD *)&v135 + 1) + 24));
      *(_QWORD *)(*((_QWORD *)&v135 + 1) + 24) = 0;
    }
  }
  v108 = secLogObjForScope("SecError");
  v109 = objc_claimAutoreleasedReturnValue(v108);
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v110 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 24);
    LODWORD(result) = 138412290;
    *(_QWORD *)((char *)&result + 4) = v110;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "returned: %@", (uint8_t *)&result, 0xCu);
  }

  v111 = *(const __CFDictionary **)(*((_QWORD *)&v135 + 1) + 24);
  _Block_object_dispose(&v135, 8);

  if (v111)
  {
    fwrite("\nAll values in decoded form...\n", 0x1FuLL, 1uLL, (FILE *)qword_10000C2D0);
    v112 = 0;
    *(_QWORD *)&v135 = 0;
    *((_QWORD *)&v135 + 1) = &v135;
    *(_QWORD *)&v136 = 0x2020000000;
    BYTE8(v136) = 0;
    do
    {
      context = (CFStringRef)_NSConcreteStackBlock;
      v129 = 3221225472;
      v130 = (CFBooleanRef)sub_100005DBC;
      v131 = &unk_100008690;
      LODWORD(v133) = v112;
      v132 = (__CFString *)&v135;
      CFDictionaryApplyFunction(v111, (CFDictionaryApplierFunction)sub_100006250, &context);
      v118 = *((_QWORD *)&v135 + 1);
      if (*(_BYTE *)(*((_QWORD *)&v135 + 1) + 24))
      {
        sub_100006564(qword_10000C2D0, 0, CFSTR("%@\n"), v113, v114, v115, v116, v117, (char)&stru_100008D50);
        v118 = *((_QWORD *)&v135 + 1);
      }
      *(_BYTE *)(v118 + 24) = 0;
      ++v112;
    }
    while (v112 != 11);
    _Block_object_dispose(&v135, 8);
  }
  fputc(10, (FILE *)qword_10000C2D0);

  objc_autoreleasePoolPop(v124);
  return 0;
}

void sub_100004E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_100004E84(void *a1, void *a2)
{
  CFTypeID v3;
  CFTypeID TypeID;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v23 = a1;
  if (a2)
  {
    v3 = CFGetTypeID(a2);
    TypeID = CFArrayGetTypeID();
    v5 = a2;
    v6 = v5;
    if (v3 == TypeID)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v6 = v6;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = *(_QWORD *)v29;
        do
        {
          v12 = 0;
          v13 = v10;
          do
          {
            if (*(_QWORD *)v29 != v11)
              objc_enumerationMutation(v6);
            v10 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v12);

            if ((objc_opt_respondsToSelector(v10, "asOneLineString") & 1) != 0)
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asOneLineString"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@\n"), v23, v14));
              objc_msgSend(v7, "addObject:", v15);

            }
            v12 = (char *)v12 + 1;
            v13 = v10;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v9);

      }
      objc_msgSend(v7, "sortUsingSelector:", "compare:");
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = v7;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "writeToStdOut");
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v18);
      }

    }
    else if ((objc_opt_respondsToSelector(v5, "asOneLineString") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asOneLineString"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@\n"), v23, v21));
      objc_msgSend(v22, "writeToStdOut");

    }
  }

}

intptr_t sub_100005144(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error talking with daemon: %@\n"), a2));
  objc_msgSend(v3, "writeToStdErr");

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100005194(uint64_t a1, uint64_t a2)
{
  void *v3;

  if (a2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nAnalytics sysdiagnose:\n\n%@\n"), a2));
    objc_msgSend(v3, "writeToStdOut");

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

const __CFData *sub_1000051E8(CFDataRef theData)
{
  const __CFData *v1;
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v4;
  uint64_t v5;
  uint64_t v6;
  const UInt8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  const UInt8 *v16;
  _QWORD *v17;
  const __CFData *v18;
  _QWORD *v19;
  _QWORD *v20;
  CFIndex v21;
  __CFString *Mutable;
  const UInt8 *v23;
  CFIndex v24;
  unsigned int v25;
  _QWORD v27[2];
  CFStringRef (*v28)(_QWORD *, uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const UInt8 *v40;
  uint64_t v41;

  v1 = theData;
  if (theData)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(v1);
    v4 = &BytePtr[Length];
    v40 = 0;
    v5 = ccder_decode_constructed_tl(0x2000000000000010, &v40, BytePtr, &BytePtr[Length]);
    if (v40 == v4)
      v6 = v5;
    else
      v6 = 0;
    v39 = 0;
    v7 = (const UInt8 *)ccder_decode_tl(4, &v39, v6);
    v37 = 0;
    v38 = 0;
    v8 = ccder_decode_uint64(&v38, &v7[v39], v40);
    if (HIDWORD(v38))
      v9 = 0;
    else
      v9 = v8;
    v10 = ccder_decode_uint64(&v37, v9, v40);
    if (HIDWORD(v37))
      v11 = 0;
    else
      v11 = v10;
    v41 = 0;
    v12 = (char *)ccder_decode_tl(6, &v41, v11);
    if (CSSMOID_PKCS5_HMAC_SHA1.Length == v41
      && (v13 = v12, !memcmp(CSSMOID_PKCS5_HMAC_SHA1.Data, v12, CSSMOID_PKCS5_HMAC_SHA1.Length))
      && v13)
    {
      v16 = (const UInt8 *)&v13[CSSMOID_PKCS5_HMAC_SHA1.Length];
      v15 = v37;
      v14 = v38;
    }
    else
    {
      v7 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }
    if (v16 == v4)
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v28 = sub_10000549C;
      v29 = &unk_1000084F8;
      v30 = &v33;
      v31 = v14;
      v32 = v15;
      v17 = v27;
      v18 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v7, 4, kCFAllocatorNull);
      v19 = v17;
      v20 = v19;
      if (v18)
      {
        v21 = CFDataGetLength(v18);
        Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * v21);
        v23 = CFDataGetBytePtr(v18);
        v24 = CFDataGetLength(v18);
        if (v24 >= 1)
        {
          do
          {
            v25 = *v23++;
            CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v25);
            --v24;
          }
          while (v24);
        }
        v28(v20, (uint64_t)Mutable);
        CFRelease(Mutable);

        CFRelease(v18);
      }
      else
      {
        v28(v19, (uint64_t)CFSTR("(null)"));
        CFRelease(CFSTR("(null)"));

      }
      v1 = (const __CFData *)v34[3];
    }
    else
    {
      v1 = 0;
    }
    _Block_object_dispose(&v33, 8);
  }
  return v1;
}

void sub_10000547C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef sub_10000549C(_QWORD *a1, uint64_t a2)
{
  CFStringRef result;

  result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("<Params: iter: %zd, size: %zd, salt: %@>"), a1[5], a1[6], a2);
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

void sub_1000054F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) & 1) != 0
    || (sub_100006564(qword_10000C2D0, 0, CFSTR("Circle name: %@, "), a4, a5, a6, a7, a8, a2),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) & 1) != 0))
  {
    v15 = (const void *)SOSGenerationCountCopyDescription(a2);
    sub_100006564(qword_10000C2D0, 0, CFSTR("Generation Count: %@"), v16, v17, v18, v19, v20, (char)v15);
    if (v15)
      CFRelease(v15);
  }
  sub_100006564(qword_10000C2D0, 0, CFSTR("%s\n"), v10, v11, v12, v13, v14, (char)"");
}

uint64_t sub_1000055C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_1000055D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  _QWORD context[6];
  const void *v20;
  CFRange v21;

  v20 = 0;
  v5 = (const __CFArray *)(*(uint64_t (**)(uint64_t, const void **))(a3 + 16))(a3, &v20);
  v11 = qword_10000C2D0;
  if (v5)
  {
    v12 = v5;
    CFArrayGetCount(v5);
    sub_100006564(v11, 0, CFSTR("%s count: %ld\n"), v13, v14, v15, v16, v17, a1);
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472;
    context[2] = sub_1000056F4;
    context[3] = &unk_100008640;
    context[4] = a2;
    context[5] = a1;
    v21.length = CFArrayGetCount(v12);
    v21.location = 0;
    CFArrayApplyFunction(v12, v21, (CFArrayApplierFunction)sub_1000055C4, context);
    CFRelease(v12);
  }
  else
  {
    sub_100006564(qword_10000C2D0, 0, CFSTR("No %s, error: %@\n"), v6, v7, v8, v9, v10, a1);
  }
  v18 = v20;
  if (v20)
  {
    v20 = 0;
    CFRelease(v18);
  }
}

__CFArray *__cdecl sub_1000056D4(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyApplicantPeerInfo(a2);
}

__CFArray *__cdecl sub_1000056DC(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyConcurringPeerPeerInfo(a2);
}

__CFArray *__cdecl sub_1000056E4(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyRetirementPeerInfo(a2);
}

__CFArray *__cdecl sub_1000056EC(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyNotValidPeerPeerInfo(a2);
}

void sub_1000056F4(uint64_t a1, uint64_t a2)
{
  const __CFString *PeerName;
  const __CFString *PeerDeviceType;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFString *v8;
  const __CFDictionary *v9;
  const __CFString *Value;
  const __CFString *v11;
  __int128 v12;
  CFIndex Length;
  CFIndex v14;
  char *v15;
  CFIndex v16;
  CFIndex v17;
  char *v18;
  CFIndex v19;
  CFIndex v20;
  char *v21;
  CFIndex v22;
  CFIndex v23;
  char *v24;
  CFIndex v25;
  CFIndex v26;
  char *v27;
  CFTypeRef v28;
  _BOOL4 v29;
  const char *v30;
  CFStringRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CFTypeRef cf2;
  char __str[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  if (!a2)
    return;
  PeerName = (const __CFString *)SOSPeerInfoGetPeerName(a2);
  PeerDeviceType = (const __CFString *)SOSPeerInfoGetPeerDeviceType(a2);
  cf2 = (CFTypeRef)SOSPeerInfoGetPeerID(a2);
  v6 = (const __CFDictionary *)SOSPeerInfoCopyPeerGestalt(a2);
  v7 = v6;
  if (v6)
    CFDictionaryGetValue(v6, CFSTR("OSVersion"));
  v8 = &stru_100008D50;
  if (SOSPeerInfoVersionHasV2Data(a2))
  {
    v9 = *(const __CFDictionary **)(a2 + 80);
    if (v9)
    {
      Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 80), CFSTR("TransportType"));
      v8 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("DeviceID"));
      v11 = (const __CFString *)CFDictionaryGetValue(v9, CFSTR("MachineIDKey"));
    }
    else
    {
      Value = CFSTR("KVS");
      v11 = &stru_100008D50;
      v8 = &stru_100008D50;
    }
  }
  else
  {
    Value = CFSTR("KVS");
    v11 = &stru_100008D50;
  }
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46 = v12;
  v47 = v12;
  v44 = v12;
  v45 = v12;
  v42 = v12;
  v43 = v12;
  v40 = v12;
  v41 = v12;
  *(_OWORD *)__str = v12;
  v39 = v12;
  if (!PeerName)
  {
    v15 = strdup("");
    if (PeerDeviceType)
      goto LABEL_13;
LABEL_26:
    v18 = strdup("");
    if (Value)
      goto LABEL_16;
LABEL_27:
    v21 = strdup("");
    if (v8)
      goto LABEL_19;
    goto LABEL_28;
  }
  CFRetain(PeerName);
  Length = CFStringGetLength(PeerName);
  v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v15 = (char *)malloc_type_malloc(v14, 0x5ECC0363uLL);
  if (!CFStringGetCString(PeerName, v15, v14, 0x8000100u))
    *v15 = 0;
  CFRelease(PeerName);
  if (!PeerDeviceType)
    goto LABEL_26;
LABEL_13:
  CFRetain(PeerDeviceType);
  v16 = CFStringGetLength(PeerDeviceType);
  v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u) + 1;
  v18 = (char *)malloc_type_malloc(v17, 0x5ECC0363uLL);
  if (!CFStringGetCString(PeerDeviceType, v18, v17, 0x8000100u))
    *v18 = 0;
  CFRelease(PeerDeviceType);
  if (!Value)
    goto LABEL_27;
LABEL_16:
  CFRetain(Value);
  v19 = CFStringGetLength(Value);
  v20 = CFStringGetMaximumSizeForEncoding(v19, 0x8000100u) + 1;
  v21 = (char *)malloc_type_malloc(v20, 0x5ECC0363uLL);
  if (!CFStringGetCString(Value, v21, v20, 0x8000100u))
    *v21 = 0;
  CFRelease(Value);
  if (v8)
  {
LABEL_19:
    CFRetain(v8);
    v22 = CFStringGetLength(v8);
    v23 = CFStringGetMaximumSizeForEncoding(v22, 0x8000100u) + 1;
    v24 = (char *)malloc_type_malloc(v23, 0x5ECC0363uLL);
    if (!CFStringGetCString(v8, v24, v23, 0x8000100u))
      *v24 = 0;
    CFRelease(v8);
    if (v11)
      goto LABEL_22;
    goto LABEL_29;
  }
LABEL_28:
  v24 = strdup("");
  if (v11)
  {
LABEL_22:
    CFRetain(v11);
    v25 = CFStringGetLength(v11);
    v26 = CFStringGetMaximumSizeForEncoding(v25, 0x8000100u) + 1;
    v27 = (char *)malloc_type_malloc(v26, 0x5ECC0363uLL);
    if (!CFStringGetCString(v11, v27, v26, 0x8000100u))
      *v27 = 0;
    CFRelease(v11);
    goto LABEL_30;
  }
LABEL_29:
  v27 = strdup("");
LABEL_30:
  v28 = *(CFTypeRef *)(a1 + 32);
  if (cf2 && v28)
    v29 = CFEqual(v28, cf2) != 0;
  else
    v29 = v28 == cf2;
  if (v29)
    v30 = "me>";
  else
    v30 = "   ";
  snprintf(__str, 0xA0uLL, "%s %s: %-16s dev:%-16s trn:%-16s devid:%-36s mid: %-36s", v30, *(const char **)(a1 + 40), v15, v18, v21, v24, v27);
  free(v15);
  free(v18);
  free(v21);
  free(v24);
  free(v27);
  v31 = CFStringCreateWithCString(0, __str, 0x8000100u);
  SOSPeerInfoGetPeerID(a2);
  SOSPeerInfoGetVersion(a2);
  SOSPeerInfoSupportsCKKSForAll(a2);
  sub_100006564(qword_10000C2D0, 0, CFSTR("%@ pid:%@ V%d %@ OS:%@\n"), v32, v33, v34, v35, v36, (char)v31);
  CFRelease(v31);
  if (v7)
    CFRelease(v7);
}

__CFArray *__cdecl sub_100005BD0(id a1, __CFError **a2)
{
  return (__CFArray *)SOSCCCopyValidPeerPeerInfo(a2);
}

void sub_100005BD8(id a1, __CFString *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100006564(qword_10000C2D0, 0, CFSTR("%@\n"), v2, v3, v4, v5, v6, (char)a2);
}

intptr_t sub_100005C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  const void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v6 = secLogObjForScope("sync");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = a2;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "SOSCloudKeychainGetObjectsFromCloud returned: %@", (uint8_t *)&v15, 0xCu);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  v8 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v8)
    CFRetain(v8);
  if (a3)
  {
    v9 = secLogObjForScope("SecError");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SOSCloudKeychainGetObjectsFromCloud returned error: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v11 = secLogObjForScope("sync");
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v15 = 138412290;
    v16 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "SOSCloudKeychainGetObjectsFromCloud block exit: %@", (uint8_t *)&v15, 0xCu);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005DBC(uint64_t a1, uint64_t a2, const void *a3)
{
  char v4;
  int KeyType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeID v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFTypeID v19;
  const __CFData *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  const __CFDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  CFTypeID v36;
  const __CFData *v37;
  uint64_t v38;
  const __CFData *v39;
  CFTypeID v40;
  const UInt8 *BytePtr;
  const __CFData *v42;
  CFIndex v43;
  const UInt8 *v44;
  const __CFData *v45;
  CFStringRef v46;
  const void *v47;
  CFNumberRef v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  const __CFDictionary *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  CFTypeID v62;
  const UInt8 *v63;
  CFIndex v64;
  const UInt8 *v65;
  const __CFData *v66;
  CFStringRef v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t valuePtr;
  const __CFData *v86;

  v4 = a2;
  KeyType = SOSKVSKeyGetKeyType(a2);
  if (KeyType != *(_DWORD *)(a1 + 40))
    return;
  switch(KeyType)
  {
    case 0:
      v86 = 0;
      if (!a3)
        goto LABEL_27;
      v19 = CFGetTypeID(a3);
      if (v19 != CFDataGetTypeID())
        goto LABEL_25;
      valuePtr = 5;
      v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
      v28 = sub_100006268(kCFAllocatorDefault, v21, v22, v23, v24, v25, v26, v27, (uint64_t)CFSTR("SyncD"), (uint64_t)CFSTR("SyncD"));
      v29 = SOSCircleCreateFromData(0, a3, &v86);
      sub_100006564(qword_10000C2D0, v28, CFSTR("%@: %@\n"), v30, v31, v32, v33, v34, v4);
      if (!v29)
        goto LABEL_48;
      v35 = (const void *)v29;
      goto LABEL_47;
    case 1:
    case 4:
      if (!a3)
        goto LABEL_27;
      v12 = CFGetTypeID(a3);
      if (v12 != CFDataGetTypeID())
        goto LABEL_25;
      SecOTRPacketTypeString(a3);
      v13 = qword_10000C2D0;
      CFDataGetLength((CFDataRef)a3);
      sub_100006564(v13, 0, CFSTR("%@: %s: %ld\n"), v14, v15, v16, v17, v18, v4);
      goto LABEL_29;
    case 2:
      if (!a3)
        goto LABEL_27;
      v36 = CFGetTypeID(a3);
      if (v36 != CFDataGetTypeID())
        goto LABEL_25;
      v37 = sub_1000051E8((CFDataRef)a3);
      v38 = qword_10000C2D0;
      if (!v37)
        goto LABEL_28;
      sub_100006564(qword_10000C2D0, 0, CFSTR("%@: %@\n"), v7, v8, v9, v10, v11, v4);
      v39 = v37;
      goto LABEL_52;
    case 8:
      if (!a3)
        goto LABEL_27;
      v40 = CFGetTypeID(a3);
      if (v40 != CFDataGetTypeID())
        goto LABEL_25;
      v86 = 0;
      BytePtr = CFDataGetBytePtr((CFDataRef)a3);
      v42 = CFDataCreate(kCFAllocatorDefault, BytePtr, 18);
      v43 = CFDataGetLength((CFDataRef)a3) - 18;
      v44 = CFDataGetBytePtr((CFDataRef)a3);
      v45 = CFDataCreate(kCFAllocatorDefault, v44 + 18, v43);
      v46 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v42, 0x8000100u);
      v47 = (const void *)SOSCircleCreateFromData(0, v45, &v86);
      if (v47)
      {
        valuePtr = 5;
        v48 = CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, &valuePtr);
        v56 = sub_100006268(kCFAllocatorDefault, v49, v50, v51, v52, v53, v54, v55, (uint64_t)CFSTR("SyncD"), (uint64_t)CFSTR("SyncD"));
        sub_100006564(qword_10000C2D0, v56, CFSTR("%@: %@: %@\n"), v57, v58, v59, v60, v61, v4);
        if (v48)
          CFRelease(v48);
        if (v56)
          CFRelease(v56);
      }
      else
      {
        v74 = qword_10000C2D0;
        sub_100006358(v45);
        sub_100006564(v74, 0, CFSTR("%@: %@\n"), v75, v76, v77, v78, v79, v4);
      }
      if (v46)
        CFRelease(v46);
      if (v45)
        CFRelease(v45);
      if (v47)
        CFRelease(v47);
      if (v42)
        CFRelease(v42);
      v39 = v86;
      if (!v86)
        goto LABEL_29;
      v86 = 0;
      goto LABEL_52;
    case 9:
      if (!a3)
      {
LABEL_27:
        v38 = qword_10000C2D0;
LABEL_28:
        sub_100006564(v38, 0, CFSTR("%@: %@\n"), v7, v8, v9, v10, v11, v4);
        goto LABEL_29;
      }
      v62 = CFGetTypeID(a3);
      if (v62 != CFDataGetTypeID())
      {
LABEL_25:
        v38 = qword_10000C2D0;
        goto LABEL_28;
      }
      v63 = CFDataGetBytePtr((CFDataRef)a3);
      v20 = CFDataCreate(kCFAllocatorDefault, v63, 18);
      v64 = CFDataGetLength((CFDataRef)a3) - 18;
      v65 = CFDataGetBytePtr((CFDataRef)a3);
      v66 = CFDataCreate(kCFAllocatorDefault, v65 + 18, v64);
      v67 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v20, 0x8000100u);
      v28 = sub_1000051E8(v66);
      v73 = qword_10000C2D0;
      if (v28)
      {
        sub_100006564(qword_10000C2D0, 0, CFSTR("%@: %@: %@\n"), v68, v69, v70, v71, v72, v4);
      }
      else
      {
        sub_100006358((const __CFData *)a3);
        sub_100006564(v73, 0, CFSTR("%@: %@\n"), v80, v81, v82, v83, v84, v4);
      }
      if (v67)
        CFRelease(v67);
      if (v66)
      {
        v35 = v66;
LABEL_47:
        CFRelease(v35);
      }
LABEL_48:
      if (v20)
        CFRelease(v20);
      if (v28)
      {
        v39 = v28;
LABEL_52:
        CFRelease(v39);
      }
LABEL_29:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      return;
    default:
      goto LABEL_25;
  }
}

uint64_t sub_100006250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFDictionaryRef sub_100006268(CFAllocatorRef allocator, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v15;
  const void **v16;
  const void *v17;
  const __CFNull *v18;
  CFNullRef v19;
  CFDictionaryRef Copy;
  uint64_t *v22;
  const void **v23;

  v22 = &a10;
  v11 = 0;
  if (a9)
  {
    do
    {
      v11 += 2;
      v12 = v22;
      v22 += 2;
    }
    while (v12[1]);
  }
  v13 = v11 >> 1;
  v23 = (const void **)&a9;
  Mutable = CFDictionaryCreateMutable(allocator, v11 >> 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
    return 0;
  v15 = Mutable;
  if (v11)
  {
    do
    {
      v16 = v23;
      v17 = *v23;
      v23 += 2;
      v18 = (const __CFNull *)v16[1];
      if (v18)
        v19 = v18;
      else
        v19 = kCFNull;
      CFDictionarySetValue(v15, v17, v19);
      --v13;
    }
    while (v13);
  }
  Copy = CFDictionaryCreateCopy(allocator, v15);
  CFRelease(v15);
  return Copy;
}

uint64_t sub_100006358(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  _QWORD *v4;
  const __CFData *v5;
  _QWORD *v6;
  void *v7;
  CFIndex v8;
  __CFString *Mutable;
  const UInt8 *v10;
  CFIndex v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD v15[2];
  CFStringRef (*v16)(uint64_t, uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_100006514;
  v17 = &unk_1000086B8;
  v18 = &v19;
  v4 = v15;
  v5 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, BytePtr, Length, kCFAllocatorNull);
  v6 = v4;
  v7 = v6;
  if (v5)
  {
    v8 = CFDataGetLength(v5);
    Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * v8);
    v10 = CFDataGetBytePtr(v5);
    v11 = CFDataGetLength(v5);
    if (v11 >= 1)
    {
      do
      {
        v12 = *v10++;
        CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), v12);
        --v11;
      }
      while (v11);
    }
    v16((uint64_t)v7, (uint64_t)Mutable);
    CFRelease(Mutable);

    CFRelease(v5);
  }
  else
  {
    v16((uint64_t)v6, (uint64_t)CFSTR("(null)"));
    CFRelease(CFSTR("(null)"));

  }
  v13 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v13;
}

void sub_1000064F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFStringRef sub_100006514(uint64_t a1, uint64_t a2)
{
  CFStringRef result;

  result = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@"), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100006564(uint64_t a1, const __CFDictionary *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFString *v10;
  const char *CStringPtr;
  CFIndex Length;
  _QWORD v13[6];
  _QWORD v14[5];
  _QWORD v15[9];
  CFIndex usedBufLen;
  CFRange v17;

  v13[5] = &a9;
  v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, a2, a3, &a9);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  v13[2] = sub_1000066BC;
  v13[3] = &unk_100008740;
  v13[4] = a1;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = sub_100006740;
  v14[3] = &unk_100008790;
  v14[4] = v13;
  CStringPtr = CFStringGetCStringPtr(v10, 0x8000100u);
  if (CStringPtr)
  {
    strlen(CStringPtr);
    sub_100006740((uint64_t)v14);
  }
  else
  {
    usedBufLen = 0;
    Length = CFStringGetLength(v10);
    v17.location = 0;
    v17.length = Length;
    CFStringGetBytes(v10, v17, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 0x40000000;
    v15[2] = sub_1000066CC;
    v15[3] = &unk_100008768;
    v15[6] = 0;
    v15[7] = Length;
    v15[8] = usedBufLen;
    v15[4] = v14;
    v15[5] = v10;
    sub_10000674C(usedBufLen + 1, (uint64_t)v15);
  }
  CFRelease(v10);
}

uint64_t sub_1000066BC(uint64_t a1, char *a2)
{
  return fputs(a2, *(FILE **)(a1 + 32));
}

uint64_t sub_1000066CC(uint64_t result, int a2, UInt8 *buffer)
{
  uint64_t v4;
  const __CFString *v5;
  CFIndex v6;
  CFIndex usedBufLen;
  CFRange v8;

  if (buffer)
  {
    v4 = result;
    v5 = *(const __CFString **)(result + 40);
    v8 = *(CFRange *)(v4 + 48);
    v6 = *(_QWORD *)(v4 + 64);
    usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 32) + 16))();
  }
  return result;
}

uint64_t sub_100006740(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000674C(size_t size, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  if (size)
  {
    if (size > 0x800)
    {
      v4 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v4);
      if (v4)
        free(v4);
    }
    else
    {
      __chkstk_darwin();
      memset((char *)&v5 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)&v5 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  }
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_asOneLineString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asOneLineString");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_getSysdiagnoseDumpWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSysdiagnoseDumpWithReply:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_writeToStdErr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToStdErr");
}

id objc_msgSend_writeToStdOut(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToStdOut");
}
