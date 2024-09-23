uint64_t start()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.streamingzip", "conduit");
  v1 = (void *)qword_10000C108;
  qword_10000C108 = (uint64_t)v0;

  lockdown_checkin_xpc("com.apple.streaming_zip_conduit", 0, 0, &stru_100008378);
  CFRunLoopRun();
  return 0;
}

void sub_1000044F8(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  _QWORD *v5;
  CFTypeRef v6;
  int v7;
  int v8;
  void *v9;
  CFTypeID v10;
  CFTypeID TypeID;
  NSString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  const void *Value;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned int v41;
  NSObject *v42;
  int v43;
  int v44;
  id v45;
  int v46;
  unsigned int socket;
  dispatch_semaphore_t v48;
  void *v49;
  NSObject *v50;
  intptr_t v51;
  int v52;
  int v53;
  int v54;
  int v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  const __CFString *v61;
  NSObject *v62;
  const __CFString *v63;
  NSObject *v64;
  NSObject *v65;
  const __CFString *v66;
  NSObject *v67;
  dispatch_queue_global_t global_queue;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  const char *v74;
  void *v75;
  NSObject *v76;
  char *v77;
  int *v78;
  char *v79;
  char *v80;
  const void *v81;
  NSObject *v82;
  int *v83;
  char *v84;
  id v85;
  NSObject *v86;
  id v87;
  int *v88;
  char *v89;
  NSObject *v90;
  void *v91;
  dispatch_semaphore_t v92;
  id v93;
  id v94;
  void *v95;
  int v96;
  int v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  id v104;
  void *context;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  _QWORD v111[4];
  NSObject *v112;
  uint64_t *v113;
  uint64_t *v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[4];
  _QWORD v126[5];
  id v127;
  uint64_t v128;
  void *v129;
  uint8_t handler[8];
  uint64_t v131;
  void (*v132)(uint64_t);
  void *v133;
  NSObject *v134;
  id v135;
  NSObject *v136;
  _QWORD *v137;
  _QWORD *v138;
  _QWORD *v139;
  void *v140;
  uint64_t v141;
  int v142;
  _BYTE buf[32];
  id v144;
  NSObject *v145;
  id v146;
  _QWORD *v147;
  _QWORD *v148;
  uint64_t v149;
  _QWORD *v150;
  void *v151;
  int v152;

  context = objc_autoreleasePoolPush();
  v121 = 0;
  v122 = &v121;
  v123 = 0x2020000000;
  v124 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = sub_100005724;
  v119 = sub_100005734;
  v120 = 0;
  v5 = malloc_type_calloc(1uLL, 0x38uLL, 0x1060040262EED4CuLL);
  *v5 = a2;
  v6 = CFRetain(a3);
  v5[2] = 0;
  v5[1] = v6;
  *((_BYTE *)v5 + 48) = 0;
  v5[5] = 0;
  v5[3] = 0;
  v103 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v7 = lockdown_receive_message(*v5, buf);
  v8 = v7;
  v9 = *(void **)buf;
  if (v7 || !*(_QWORD *)buf)
  {
    if (v7)
    {
      v21 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)handler = 67109120;
        *(_DWORD *)&handler[4] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "lockdown_receive_message returned error %x", handler, 8u);
        v9 = *(void **)buf;
        if (!*(_QWORD *)buf)
          goto LABEL_23;
        goto LABEL_22;
      }
    }
LABEL_21:
    if (!v9)
      goto LABEL_23;
LABEL_22:
    CFRelease(v9);
    goto LABEL_23;
  }
  v10 = CFGetTypeID(*(CFTypeRef *)buf);
  TypeID = CFDictionaryGetTypeID();
  v9 = *(void **)buf;
  if (v10 != TypeID)
    goto LABEL_21;
  if (!*(_QWORD *)buf)
  {
LABEL_23:
    v22 = (id)qword_10000C108;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      Value = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = Value;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to receive initial message from client %@", buf, 0xCu);
    }

    sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("NoInitialMessage"));
    v9 = 0;
    goto LABEL_26;
  }
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)buf, "objectForKeyedSubscript:", CFSTR("MediaSubdir")));
  if (!v110)
  {
    v27 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to get destination directory from client message", buf, 2u);
    }
    sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("MalformedSetupMessage"));
LABEL_26:
    v23 = 0;
    v24 = 0;
    v20 = 0;
    v25 = 0;
    v106 = 0;
    v107 = 0;
    v26 = 0;
    v15 = 0;
    v108 = 0;
    v109 = 0;
    v110 = 0;
LABEL_27:
    sub_1000062B0(v5);
    goto LABEL_28;
  }
  v12 = NSHomeDirectory();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Media")));

  v14 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v110, v14) & 1) == 0)
  {
    v29 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Destination directory in client message was not a string", buf, 2u);
    }
    sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("MalformedSetupMessage"));
    v23 = 0;
    v24 = 0;
    v20 = 0;
    v25 = 0;
    v106 = 0;
    v107 = 0;
    v26 = 0;
    v15 = 0;
    v108 = 0;
    goto LABEL_27;
  }
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "stringByAppendingPathComponent:", v110));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "stringByResolvingSymlinksInPath"));
  if ((objc_msgSend(v15, "hasPrefix:", v109) & 1) == 0)
  {
    v30 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Dest path specified resolved to unpermitted path: %@", buf, 0xCu);
    }
    sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("InvalidPath"));
    v23 = 0;
    v24 = 0;
    v20 = 0;
    v25 = 0;
    v106 = 0;
    v107 = 0;
    goto LABEL_63;
  }
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InstallTransferredDirectory")));
  if (v106)
  {
    v16 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v106, v16) & 1) != 0)
    {
      if (objc_msgSend(v106, "BOOLValue"))
        v5[2] = v15;
    }
  }
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("UserInitiatedTransfer")));
  if (v107)
  {
    v17 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v107, v17) & 1) != 0)
    {
      if (objc_msgSend(v107, "BOOLValue"))
        *((_BYTE *)v5 + 49) = 1;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SpringBoardIconLayoutData")));
  if (!v18)
    goto LABEL_43;
  v19 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    v31 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "SpringBoard icon layout value was not data; ignoring",
        buf,
        2u);
    }

LABEL_43:
    v20 = 0;
    goto LABEL_44;
  }
  v20 = v18;
  v5[3] = v20;
LABEL_44:
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InstallOptionsDictionary")));
  if (v24)
  {
    v32 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v24, v32) & 1) != 0)
    {
      v33 = v24;
      v5[4] = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("IsUserInitiated")));
      if (v34)
      {
        v35 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
        {
          if (objc_msgSend(v34, "BOOLValue"))
            *((_BYTE *)v5 + 49) = 1;
        }
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PackageType")));
      if ((MGGetBoolAnswer(CFSTR("InternalBuild")) & 1) == 0
        && objc_msgSend(v36, "isEqualToString:", CFSTR("System")))
      {
        v99 = v34;
        v37 = qword_10000C108;
        if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Installing system apps from the host is prohibited.", buf, 2u);
        }
        sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("InstallationProhibited"));

        v23 = 0;
        v25 = 0;
        goto LABEL_96;
      }

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PassThroughFileWithLength")));
  if (v25)
  {
    v38 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v25, v38) & 1) != 0)
      v5[5] = objc_msgSend(v25, "longLongValue");
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v39, "removeItemAtPath:error:", v15, 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v41 = objc_msgSend(v40, "fileExistsAtPath:", v15);

  if (v41)
  {
    v42 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Item exists at destination path %@", buf, 0xCu);
    }
    sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("DestinationExists"));
    v23 = 0;
LABEL_63:
    v26 = 0;
    goto LABEL_27;
  }
  if (v25)
  {
    v99 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByDeletingLastPathComponent")));
    v43 = mkpath_np((const char *)objc_msgSend(v99, "fileSystemRepresentation"), 0x1EDu);
    v44 = v43;
    if (v43 && v43 != 17)
    {
      v62 = (id)qword_10000C108;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v77 = strerror(v44);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v99;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = v77;
        _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to make parent directory of %@ at %@: %s", buf, 0x20u);
      }

      if (v44 == 28)
        v63 = CFSTR("NoSpace");
      else
        v63 = CFSTR("SetupFailed");
      sub_10000573C((uint64_t)v5, (uint64_t)v63);
    }
    else
    {
      v45 = objc_retainAutorelease(v15);
      v46 = open_dprotected_np((const char *)objc_msgSend(v45, "fileSystemRepresentation"), 2818, 4, 0, 420);
      if ((v46 & 0x80000000) == 0)
      {
        v97 = v46;
        v23 = 0;
        v26 = 0;

        goto LABEL_69;
      }
      v64 = (id)qword_10000C108;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v78 = __error();
        v79 = strerror(*v78);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v79;
        _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failed to open pass through file at %@ : %s", buf, 0x16u);
      }

      sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("SetupFailed"));
    }
    v23 = 0;
LABEL_96:
    v26 = 0;

    goto LABEL_27;
  }
  v101 = objc_retainAutorelease(v15);
  v52 = mkpath_np((const char *)objc_msgSend(v101, "fileSystemRepresentation"), 0x1EDu);
  v53 = v52;
  if (v52 != 17)
  {
    if (v52)
    {
      v65 = (id)qword_10000C108;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v80 = strerror(v53);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v101;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v80;
        _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to create dest path %@ : %s", buf, 0x16u);
      }

      if (v53 == 28)
        v66 = CFSTR("NoSpace");
      else
        v66 = CFSTR("InvalidPath");
      goto LABEL_114;
    }
    v98 = objc_retainAutorelease(v101);
    v54 = open((const char *)objc_msgSend(v98, "fileSystemRepresentation"), 1048832);
    v55 = v54;
    if (v54 < 0)
    {
      v75 = (void *)qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        v85 = objc_retainAutorelease(v98);
        v86 = v75;
        v87 = objc_msgSend(v85, "fileSystemRepresentation");
        v88 = __error();
        v89 = strerror(*v88);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v87;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v89;
        _os_log_error_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);

      }
    }
    else
    {
      v96 = fcntl(v54, 64, 4);
      if (v96)
      {
        v56 = (void *)qword_10000C108;
        if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
        {
          v93 = objc_retainAutorelease(v98);
          v82 = v56;
          v94 = objc_msgSend(v93, "fileSystemRepresentation");
          v83 = __error();
          v84 = strerror(*v83);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v94;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 4;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = v84;
          _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "Failed to set protection class on %s to %d: %s", buf, 0x1Cu);

        }
      }
      close(v55);

      if (!v96)
        goto LABEL_81;
    }
    v73 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v74 = "Failed to set protection class";
      goto LABEL_122;
    }
LABEL_113:
    v66 = CFSTR("SetupFailed");
LABEL_114:
    sub_10000573C((uint64_t)v5, (uint64_t)v66);
    v23 = 0;
    v25 = 0;
    v26 = 0;
    v15 = v101;
    goto LABEL_27;
  }
LABEL_81:
  v57 = objc_alloc((Class)SZExtractor);
  v128 = SZExtractorOptionsDenyInvalidSymlinks;
  v129 = &__kCFBooleanTrue;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1));
  v26 = objc_msgSend(v57, "initWithPath:options:", v101, v58);

  if (!v26)
  {
    v73 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v74 = "Failed to set up extractor";
LABEL_122:
      _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, v74, buf, 2u);
      goto LABEL_113;
    }
    goto LABEL_113;
  }
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_100005824;
  v111[3] = &unk_1000083A0;
  v113 = &v115;
  v114 = &v121;
  v23 = dispatch_semaphore_create(0);
  v112 = v23;
  objc_msgSend(v26, "prepareForExtraction:", v111);
  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  if (v116[5])
  {
    v59 = v116[5];
    v60 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v59;
      _os_log_error_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "-prepareForExtraction returned error %@", buf, 0xCu);
    }
    v61 = CFSTR("SetupFailed");
LABEL_119:
    sub_10000573C((uint64_t)v5, (uint64_t)v61);
    v25 = 0;

    goto LABEL_27;
  }
  if (v122[3])
  {
    v76 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v101;
      _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "Item exists at destination path %@", buf, 0xCu);
    }
    v61 = CFSTR("DestinationExists");
    goto LABEL_119;
  }
  v97 = -1;

LABEL_69:
  socket = lockdown_get_socket(a2);
  if ((socket & 0x80000000) != 0)
  {
    v67 = (id)qword_10000C108;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v81 = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Failed to get socket for connection from client %@", buf, 0xCu);
    }

    sub_10000573C((uint64_t)v5, (uint64_t)CFSTR("NoSocket"));
    goto LABEL_27;
  }
  v100 = v26;
  v48 = dispatch_semaphore_create(0);
  v49 = malloc_type_valloc(0x100000uLL, 0xF4337BF3uLL);
  v126[0] = 0;
  v126[1] = v126;
  v126[2] = 0x3032000000;
  v126[3] = sub_100005724;
  v126[4] = sub_100005734;
  v127 = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2020000000;
  v125[3] = 0;
  v91 = (void *)os_transaction_create("com.apple.streaming_zip_conduit.client_socket");
  v92 = v48;
  v95 = v49;
  if (*((_BYTE *)v5 + 49))
  {
    v50 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Receiving transfer as QOS_CLASS_USER_INITIATED", buf, 2u);
    }
    v51 = 25;
  }
  else
  {
    v51 = 9;
  }
  global_queue = dispatch_get_global_queue(v51, 0);
  v90 = objc_claimAutoreleasedReturnValue(global_queue);
  v69 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0, v90);
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_100005890;
  *(_QWORD *)&buf[24] = &unk_100008488;
  v149 = v103;
  v147 = v125;
  v152 = v97;
  v104 = v100;
  v144 = v104;
  v148 = v126;
  v70 = v92;
  v150 = v5;
  v151 = v95;
  v145 = v70;
  v146 = v91;
  v102 = v91;
  dispatch_source_set_cancel_handler(v69, buf);
  *(_QWORD *)handler = _NSConcreteStackBlock;
  v131 = 3221225472;
  v132 = sub_100005E78;
  v133 = &unk_100008488;
  v140 = v95;
  v141 = 0x100000;
  v142 = v97;
  v134 = v69;
  v135 = v104;
  v136 = v70;
  v138 = v126;
  v139 = v5;
  v137 = v125;
  v71 = v69;
  v26 = v104;
  v72 = v70;
  dispatch_source_set_event_handler(v71, handler);
  dispatch_resume(v71);

  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v126, 8);

LABEL_28:
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  objc_autoreleasePoolPop(context);
}

void sub_1000056A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005724(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005734(uint64_t a1)
{

}

void sub_10000573C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  const __CFString *v6;
  uint64_t v7;

  if (!*(_BYTE *)(a1 + 48))
  {
    v2 = a1;
    *(_BYTE *)(a1 + 48) = 1;
    v6 = CFSTR("Error");
    v7 = a2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
    LOBYTE(v2) = sub_1000068B4(v2, v3);

    if ((v2 & 1) == 0)
    {
      v4 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Could not send error response to host", v5, 2u);
      }
    }
  }
}

void sub_100005824(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100005890(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  const __CFData *v17;
  void *v18;
  uint64_t v19;
  const UInt8 *BytePtr;
  CFIndex v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  unsigned int v29;
  dispatch_semaphore_t v30;
  void *v31;
  NSObject *v32;
  dispatch_semaphore_t v33;
  id v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  unint64_t v40;
  double v41;
  NSObject *v42;
  CFIndex Length;
  void **v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *, void *);
  void *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  _QWORD v51[5];
  _QWORD v52[4];
  dispatch_semaphore_t v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  mach_timebase_info info;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  CFIndex v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;

  v2 = mach_absolute_time();
  info = 0;
  mach_timebase_info(&info);
  v3 = qword_10000C108;
  if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
  {
    v40 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    LODWORD(v4) = info.numer;
    LODWORD(v5) = info.denom;
    v41 = (double)v4 / (double)v5 * (double)(v2 - *(_QWORD *)(a1 + 72)) / 1000000000.0;
    *(_DWORD *)buf = 134218496;
    v61 = v40;
    v62 = 2048;
    v63 = v41;
    v64 = 2048;
    v65 = (double)(v40 >> 20) / v41;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Transferred %llu archived bytes in %.3f seconds (%.3f MB/sec)", buf, 0x20u);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 0x80000000) == 0)
    close(v6);
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100006464;
    v54[3] = &unk_1000083C8;
    v56 = *(_QWORD *)(a1 + 64);
    v55 = *(id *)(a1 + 40);
    objc_msgSend(v7, "finishStreamWithCompletionBlock:", v54);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);

  }
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    if (objc_msgSend(v9, "isEqualToString:", NSPOSIXErrorDomain))
    {
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "code");

      if (v10 == (id)28)
      {
        v11 = CFSTR("NoSpace");
LABEL_16:
        v15 = *(_QWORD *)(a1 + 80);
        goto LABEL_17;
      }
    }
    else
    {

    }
    v11 = CFSTR("ExtractionFailed");
    goto LABEL_16;
  }
  v12 = *(_QWORD *)(a1 + 80);
  if (!*(_QWORD *)(v12 + 16))
  {
    sub_1000067CC(v12);
    goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v14 = objc_msgSend(v13, "effectiveBoolValueForSetting:", MCFeatureAppInstallationAllowed);

  v15 = *(_QWORD *)(a1 + 80);
  if (v14 == 2)
  {
    v11 = CFSTR("InstallationProhibited");
LABEL_17:
    sub_10000573C(v15, (uint64_t)v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v16, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16), 0);

    goto LABEL_18;
  }
  v17 = *(const __CFData **)(v15 + 24);
  if (v17)
  {
    v18 = (void *)qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
    {
      v42 = v18;
      Length = CFDataGetLength(v17);
      *(_DWORD *)buf = 134217984;
      v61 = Length;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Sending icon state with length %ld", buf, 0xCu);

    }
    v19 = SBSSpringBoardBlockableServerPort();
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*(_QWORD *)(a1 + 80) + 24));
    v21 = CFDataGetLength(*(CFDataRef *)(*(_QWORD *)(a1 + 80) + 24));
    v22 = SBSetIconState(v19, BytePtr, v21);
    if (v22)
    {
      v23 = v22;
      v24 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v61) = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "SBSetIconState returned 0x%x", buf, 8u);
      }
    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16)));
  v26 = *(id *)(*(_QWORD *)(a1 + 80) + 32);
  if (!v26)
  {
    v58 = LSPackageTypeKey;
    v59 = LSPackageTypeCustomer;
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1));
  }
  v27 = objc_msgSend(v26, "mutableCopy");
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("AllowInstallLocalProvisioned"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v29 = objc_msgSend(v28, "isMultiUser");

  if (v29)
  {
    v30 = dispatch_semaphore_create(0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_10000653C;
    v52[3] = &unk_1000083F0;
    v53 = v30;
    v32 = v30;
    objc_msgSend(v31, "terminateSyncWithCompletionHandler:", v52);

    dispatch_semaphore_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
  }
  v33 = dispatch_semaphore_create(0);
  v34 = objc_msgSend(objc_alloc((Class)MIInstallOptions), "initWithLegacyOptionsDictionary:", v27);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_100006544;
  v51[3] = &unk_100008410;
  v51[4] = *(_QWORD *)(a1 + 80);
  v35 = objc_retainBlock(v51);
  v44 = _NSConcreteStackBlock;
  v45 = 3221225472;
  v46 = sub_100006634;
  v47 = &unk_100008438;
  v36 = v25;
  v37 = *(_QWORD *)(a1 + 80);
  v48 = v36;
  v50 = v37;
  v38 = v33;
  v49 = v38;
  +[IXAppInstallCoordinator installApplication:consumeSource:options:legacyProgressBlock:completion:](IXAppInstallCoordinator, "installApplication:consumeSource:options:legacyProgressBlock:completion:", v36, 1, v34, v35, &v44);
  dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
  if (v29)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager", v44, v45, v46, v47, v48));
    objc_msgSend(v39, "resumeSync");

  }
LABEL_18:
  sub_1000062B0(*(uint64_t **)(a1 + 80));
  free(*(void **)(a1 + 88));
}

void sub_100005E78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int *v11;
  char *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  ssize_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  char *v30;
  _QWORD v31[4];
  id v32;
  _BYTE *v33;
  uint64_t v34;
  _BYTE buf[24];
  char *v36;

  v2 = lockdown_recv(**(_QWORD **)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
  v3 = v2;
  if (v2 < 0)
  {
    v9 = (void *)qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "lockdown_recv returned %zd and error %s", buf, 0x16u);

    }
    goto LABEL_14;
  }
  if (!v2)
  {
    v13 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "lockdown_recv returned 0; canceling",
        buf,
        2u);
    }
    goto LABEL_14;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v2;
  v4 = qword_10000C108;
  if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "lockdown_recv returned %zd", buf, 0xCu);
  }
  v5 = *(_DWORD *)(a1 + 96);
  if (v5 < 0 || *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", *(_QWORD *)(a1 + 80), v3, 0));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100006370;
    v31[3] = &unk_100008460;
    v7 = *(_QWORD *)(a1 + 64);
    v33 = buf;
    v34 = v7;
    v8 = *(void **)(a1 + 40);
    v32 = *(id *)(a1 + 48);
    objc_msgSend(v8, "supplyBytes:withCompletionBlock:", v6, v31);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));

    _Block_object_dispose(buf, 8);
    return;
  }
  v14 = *(_QWORD *)(a1 + 72);
  v15 = *(_QWORD *)(v14 + 40);
  v16 = v15 - v3;
  if (v15 < v3)
  {
    v17 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Received %ld bytes but only %lld bytes remain!", buf, 0x16u);
    }
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 5, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

LABEL_14:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    return;
  }
  v21 = 0;
  *(_QWORD *)(v14 + 40) = v16;
  v22 = *(_QWORD *)(a1 + 80);
  while (v3 != v21)
  {
    v23 = write(v5, (const void *)(v22 + v21), v3 - v21);
    v21 += v23;
    if (v23 < 0)
    {
      if (v3 != -1)
      {
        v24 = *__error();
        v25 = (void *)qword_10000C108;
        if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
        {
          v29 = v25;
          v30 = strerror(v24);
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = v3;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = -1;
          *(_WORD *)&buf[22] = 2080;
          v36 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to write %ld bytes to passthrough file: write returned %ld : %s", buf, 0x20u);

        }
        v26 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v24, 0));
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      }
      break;
    }
  }
  if (*(uint64_t *)(*(_QWORD *)(a1 + 72) + 40) <= 0)
    goto LABEL_14;
}

void sub_100006290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000062B0(uint64_t *a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  _QWORD block[5];

  v2 = *a1;
  if (*a1)
  {
    v3 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006368;
    block[3] = &unk_1000084A8;
    block[4] = v2;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  v4 = (const void *)a1[1];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[2];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[3];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[4];
  if (v7)
    CFRelease(v7);
  free(a1);
}

uint64_t sub_100006368(uint64_t a1)
{
  return lockdown_disconnect(*(_QWORD *)(a1 + 32));
}

void sub_100006370(uint64_t a1, void *a2, int a3)
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;

  v6 = a2;
  v7 = v6;
  if (v6 || a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    if (v6)
    {
      v8 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        v9 = 138412290;
        v10 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Stream extractor got error: %@", (uint8_t *)&v9, 0xCu);
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100006464(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a2;
  if (v4)
  {
    v5 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to finish extraction: %@", (uint8_t *)&v6, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

intptr_t sub_10000653C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006544(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[8];
  const __CFString *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v8 = CFSTR("InstallProgressDict");
  v9 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  LOBYTE(v4) = sub_1000068B4(v4, v5);

  if ((v4 & 1) == 0)
  {
    v6 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to send install progress", v7, 2u);
    }
  }

}

void sub_100006634(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      v15 = 138412546;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to install application at %@ : %@", (uint8_t *)&v15, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain"));
    if (objc_msgSend(v8, "isEqualToString:", IXUserPresentableErrorDomain))
    {
      v9 = objc_msgSend(v6, "code");

      if (v9 == (id)11)
      {
        v10 = CFSTR("NoSpace");
LABEL_10:
        sub_10000573C(*(_QWORD *)(a1 + 48), (uint64_t)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v11, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16), 0);

        goto LABEL_11;
      }
    }
    else
    {

    }
    v10 = CFSTR("InstallationFailed");
    goto LABEL_10;
  }
  sub_1000067CC(*(_QWORD *)(a1 + 48));
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000067CC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[8];
  const __CFString *v5;
  const __CFString *v6;

  if (!*(_BYTE *)(a1 + 48))
  {
    v1 = a1;
    v5 = CFSTR("Status");
    v6 = CFSTR("DataComplete");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
    LOBYTE(v1) = sub_1000068B4(v1, v2);

    if ((v1 & 1) == 0)
    {
      v3 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v4 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not send error response to host", v4, 2u);
      }
    }
  }
}

uint64_t sub_1000068B4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];

  v3 = a2;
  if (a1)
  {
    v4 = lockdown_send_message(*(_QWORD *)a1, v3, 200);
    if (v4)
    {
      v5 = v4;
      v6 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Got error %x from lockdown_send_message", (uint8_t *)v8, 8u);
      }
      a1 = 0;
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_finishStreamWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishStreamWithCompletionBlock:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initWithLegacyOptionsDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLegacyOptionsDictionary:");
}

id objc_msgSend_initWithPath_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:options:");
}

id objc_msgSend_installApplication_consumeSource_options_legacyProgressBlock_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installApplication:consumeSource:options:legacyProgressBlock:completion:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_prepareForExtraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForExtraction:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeSync");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByResolvingSymlinksInPath");
}

id objc_msgSend_supplyBytes_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplyBytes:withCompletionBlock:");
}

id objc_msgSend_terminateSyncWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminateSyncWithCompletionHandler:");
}
