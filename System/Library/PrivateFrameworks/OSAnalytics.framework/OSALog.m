@implementation OSALog

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[OSALog markDescriptor:forKey:withObj:](OSALog, "markDescriptor:forKey:withObj:", *(unsigned int *)(a1 + 32), v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldFilePath, 0);
  objc_storeStrong((id *)&self->_bugType, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
}

+ (id)createForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7
{
  id v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  OSALog *v35;
  NSObject *v36;
  const __CFString *v37;
  _xpc_connection_s *mach_service;
  uint64_t v39;
  _xpc_connection_s *v40;
  xpc_endpoint_t v41;
  xpc_object_t v42;
  const char *v43;
  pid_t v44;
  const char *v45;
  id v46;
  void *v47;
  void *v48;
  xpc_object_t v49;
  const char *string;
  OSALog *v51;
  void *v52;
  const char *v53;
  __CFString *v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  xpc_object_t v76;
  _BOOL8 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  const char *v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  __CFString *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  void *v97;
  OSALog *v98;
  void *v100;
  uint64_t uint64;
  const char *v102;
  xpc_endpoint_t v103;
  xpc_object_t v104;
  void *v105;
  void *context;
  xpc_object_t xdict;
  _xpc_connection_s *connection;
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD handler[5];
  _QWORD v114[4];
  id v115;
  id obj;
  uint64_t v117;
  const __CFString *v118;
  uint64_t v119;
  const __CFString *v120;
  uint64_t v121;
  const __CFString *v122;
  uint64_t v123;
  __CFString *v124;
  uint64_t v125;
  const __CFString *v126;
  uint8_t buf[4];
  const char *v128;
  uint8_t v129[32];
  _BYTE v130[24];
  uint64_t (*v131)(uint64_t, uint64_t);
  _BYTE v132[20];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (uint64_t (*)(uint64_t, uint64_t))a5;
  v110 = a7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v72 = (void *)MEMORY[0x1A85A8184](v110);
    NSUserName();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v130 = 138413314;
    *(_QWORD *)&v130[4] = v10;
    *(_WORD *)&v130[12] = 2112;
    *(_QWORD *)&v130[14] = v11;
    *(_WORD *)&v130[22] = 2112;
    v131 = v12;
    *(_WORD *)v132 = 2048;
    *(_QWORD *)&v132[2] = v72;
    *(_WORD *)&v132[10] = 2112;
    *(_QWORD *)&v132[12] = v73;
    _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "createForSubmission: %@ metadata: %@ options: %@ block: %p (by %@)", v130, 0x34u);

  }
  if (v12)
    v13 = objc_msgSend(v12, "mutableCopy");
  else
    v13 = objc_opt_new();
  v14 = (void *)v13;
  if (v11)
    v15 = objc_msgSend(v11, "mutableCopy");
  else
    v15 = objc_opt_new();
  v16 = (void *)v15;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("capture-time"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("capture-time"));

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("incident_id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUIDString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("incident_id"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LogType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length") == 0;

  if (v25)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("LogType"));
  v26 = geteuid();
  if (v26 >= 0x1F4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v27, CFSTR("file-owner-uid"));

  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("observer_info"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v10, CFSTR("bug_type"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v30, CFSTR("observer_info"));
  }
  else
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("observer_info"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v10, CFSTR("bug_type"));
  }

  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "usesLegacySubmission:", v10);

  if (v32)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("alt-metadata"));
  if (+[OSALog isDataVaultEnabled](OSALog, "isDataVaultEnabled")
    && _os_feature_enabled_impl()
    && objc_msgSend(v10, "isEqualToString:", CFSTR("309")))
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("datavault-filePath"));
  }
  *(_QWORD *)v130 = 0;
  *(_QWORD *)&v130[8] = v130;
  *(_QWORD *)&v130[16] = 0x3032000000;
  v131 = __Block_byref_object_copy__4;
  *(_QWORD *)v132 = __Block_byref_object_dispose__4;
  *(_QWORD *)&v132[8] = 0;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("override-filePath"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    context = (void *)MEMORY[0x1A85A7FC8]();
    mach_service = xpc_connection_create_mach_service("com.apple.osanalytics.osanalyticshelper", 0, 2uLL);
    connection = mach_service;
    if (!mach_service)
    {
      v55 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v55)
        +[OSALog createForSubmission:metadata:options:error:writing:].cold.1(v55, v56, v57, v58, v59, v60, v61, v62);
      v63 = (void *)MEMORY[0x1E0CB35C8];
      v117 = *MEMORY[0x1E0CB2D50];
      v118 = CFSTR("Couldn't get XPC connection");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 17, v64);
      v65 = objc_claimAutoreleasedReturnValue();
      v105 = (void *)v64;
      v35 = 0;
      v66 = *(NSObject **)(*(_QWORD *)&v130[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v130[8] + 40) = v65;
      goto LABEL_102;
    }
    v39 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_183;
    handler[3] = &unk_1E4DEDB30;
    handler[4] = v130;
    xpc_connection_set_event_handler(mach_service, handler);
    v40 = xpc_connection_create(0, 0);
    v105 = v40;
    if (!v40)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v129 = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Couldn't config private XPC connection", v129, 2u);
      }
      v68 = (void *)MEMORY[0x1E0CB35C8];
      v119 = *MEMORY[0x1E0CB2D50];
      v120 = CFSTR("Couldn't config private XPC connection");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 16, v69);
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = *(void **)(*(_QWORD *)&v130[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v130[8] + 40) = v70;

      v35 = 0;
      goto LABEL_94;
    }
    v111[0] = v39;
    v111[1] = 3221225472;
    v111[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_187;
    v111[3] = &unk_1E4DEE020;
    v112 = v110;
    xpc_connection_set_event_handler(v40, v111);
    v41 = xpc_endpoint_create(v40);
    xpc_connection_resume(v40);
    xpc_connection_resume(connection);
    v42 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v42, "datawriter_endpoint", v41);
    xdict = v42;
    v103 = v41;
    memset(v129, 0, sizeof(v129));
    v43 = getprogname();
    if (!v43)
    {
      v44 = getpid();
      v43 = (const char *)v129;
      __sprintf_chk((char *)v129, 0, 0x20uLL, "%d", v44);
    }
    xpc_dictionary_set_string(v42, "caller", v43);
    xpc_dictionary_set_uint64(v42, "operation", 6uLL);
    v45 = (const char *)objc_msgSend(CFSTR("bug_type"), "UTF8String");
    v46 = objc_retainAutorelease(v10);
    xpc_dictionary_set_string(v42, v45, (const char *)objc_msgSend(v46, "UTF8String"));
    if (objc_msgSend(v16, "count"))
    {
      ns2xpc(v16);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(xdict, "additionalHeaders", v47);

    }
    if (objc_msgSend(v14, "count"))
    {
      ns2xpc(v14);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(xdict, "options", v48);

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v128 = (const char *)v46;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "C1. request '%@' report service via XPC/osanalyticshelper", buf, 0xCu);
    }
    v49 = xpc_connection_send_message_with_reply_sync(connection, xdict);
    v104 = v49;
    if (v49)
    {
      if (xpc_dictionary_get_BOOL(v49, "result"))
      {
        string = xpc_dictionary_get_string(v104, "filePath");
        if (string)
        {
          v51 = [OSALog alloc];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[OSALog initWithFilepath:type:](v51, "initWithFilepath:type:", v52, v46);

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v128 = string;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "C6. report request completed: %s", buf, 0xCu);
          }
          v53 = xpc_dictionary_get_string(v104, "oldFilePath");
          if (!v53)
            goto LABEL_93;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v53);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[OSALog setOldFilePath:](v35, "setOldFilePath:", v54);
          goto LABEL_92;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          +[OSALog createForSubmission:metadata:options:error:writing:].cold.2();
        if (!*(_QWORD *)(*(_QWORD *)&v130[8] + 40))
        {
          v89 = (void *)MEMORY[0x1E0CB35C8];
          v125 = *MEMORY[0x1E0CB2D50];
          v126 = CFSTR("Incomplete XPC result -- no filename");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
          v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 7, v54);
          v75 = objc_claimAutoreleasedReturnValue();
          goto LABEL_77;
        }
      }
      else
      {
        v76 = v104;
        if (v104 == (xpc_object_t)MEMORY[0x1E0C81260])
        {
          v77 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
          if (v77)
          {
            +[OSALog createForSubmission:metadata:options:error:writing:].cold.3(v77, v78, v79, v80, v81, v82, v83, v84);
            v76 = v104;
          }
        }
        v85 = (char *)MEMORY[0x1A85A8568](v76);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v128 = v85;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "XPC Response: '%s'", buf, 0xCu);
        }
        if (v85)
          free(v85);
        v86 = xpc_dictionary_get_string(v104, "error_desc");
        if (!v86)
        {
          v87 = *(void **)(*(_QWORD *)&v130[8] + 40);
          if (v87)
          {
            objc_msgSend(v87, "localizedDescription");
            v88 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v86 = (const char *)objc_msgSend(v88, "UTF8String");

          }
          else
          {
            v86 = 0;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v128 = v86;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "C6. report request failed: %s", buf, 0xCu);
        }
        if (!*(_QWORD *)(*(_QWORD *)&v130[8] + 40))
        {
          v102 = xpc_dictionary_get_string(v104, "error_domain");
          uint64 = xpc_dictionary_get_uint64(v104, "error_code");
          v100 = (void *)MEMORY[0x1E0CB35C8];
          if (v102)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
            v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = CFSTR("OSALog");
          }
          v123 = *MEMORY[0x1E0CB2D50];
          if (v86)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v86);
            v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v91 = CFSTR("<unknown>");
          }
          v124 = v91;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "errorWithDomain:code:userInfo:", v54, uint64, v92);
          v93 = objc_claimAutoreleasedReturnValue();
          v94 = *(void **)(*(_QWORD *)&v130[8] + 40);
          *(_QWORD *)(*(_QWORD *)&v130[8] + 40) = v93;

          if (v86)
          v35 = 0;
          if (!v102)
            goto LABEL_93;
          goto LABEL_92;
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid XPC response", buf, 2u);
      }
      if (!*(_QWORD *)(*(_QWORD *)&v130[8] + 40))
      {
        v74 = (void *)MEMORY[0x1E0CB35C8];
        v121 = *MEMORY[0x1E0CB2D50];
        v122 = CFSTR("Invalid XPC response");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
        v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 15, v54);
        v75 = objc_claimAutoreleasedReturnValue();
LABEL_77:
        v90 = *(void **)(*(_QWORD *)&v130[8] + 40);
        *(_QWORD *)(*(_QWORD *)&v130[8] + 40) = v75;

        v35 = 0;
LABEL_92:

        goto LABEL_93;
      }
    }
    v35 = 0;
LABEL_93:

    v69 = v112;
LABEL_94:

    +[OSALog logObjForBugType:](OSALog, "logObjForBugType:", v10);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      if (v35)
        v95 = CFSTR("success");
      else
        v95 = CFSTR("FAILED");
      if (*(_QWORD *)(*(_QWORD *)&v130[8] + 40))
        objc_msgSend(*(id *)(*(_QWORD *)&v130[8] + 40), "localizedDescription");
      else
        -[OSALog filepath](v35, "filepath");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v129 = 138543874;
      *(_QWORD *)&v129[4] = v10;
      *(_WORD *)&v129[12] = 2112;
      *(_QWORD *)&v129[14] = v95;
      *(_WORD *)&v129[22] = 2114;
      *(_QWORD *)&v129[24] = v96;
      _os_log_impl(&dword_1A4D21000, v66, OS_LOG_TYPE_DEFAULT, "client log create type %{public}@ result %@: %{public}@", v129, 0x20u);

    }
LABEL_102:

    objc_autoreleasePoolPop(context);
    goto LABEL_103;
  }
  v34 = *(_QWORD *)&v130[8];
  obj = *(id *)(*(_QWORD *)&v130[8] + 40);
  v114[0] = MEMORY[0x1E0C809B0];
  v114[1] = 3221225472;
  v114[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke;
  v114[3] = &unk_1E4DEDFD0;
  v115 = v110;
  +[OSALog locallyCreateForSubmission:metadata:options:error:writing:](OSALog, "locallyCreateForSubmission:metadata:options:error:writing:", v10, v16, v14, &obj, v114);
  v35 = (OSALog *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v34 + 40), obj);
  +[OSALog logObjForBugType:](OSALog, "logObjForBugType:", v10);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    if (v35)
      v37 = CFSTR("success");
    else
      v37 = CFSTR("FAILED");
    if (*(_QWORD *)(*(_QWORD *)&v130[8] + 40))
      objc_msgSend(*(id *)(*(_QWORD *)&v130[8] + 40), "localizedDescription");
    else
      -[OSALog filepath](v35, "filepath");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v129 = 138543874;
    *(_QWORD *)&v129[4] = v10;
    *(_WORD *)&v129[12] = 2112;
    *(_QWORD *)&v129[14] = v37;
    *(_WORD *)&v129[22] = 2114;
    *(_QWORD *)&v129[24] = v67;
    _os_log_impl(&dword_1A4D21000, v36, OS_LOG_TYPE_DEFAULT, "local log create type %{public}@ result %@: %{public}@", v129, 0x20u);

  }
LABEL_103:
  if (a6)
  {
    v97 = *(void **)(*(_QWORD *)&v130[8] + 40);
    if (v97)
      *a6 = objc_retainAutorelease(v97);
  }
  v98 = v35;
  _Block_object_dispose(v130, 8);

  return v98;
}

- (NSString)filepath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

+ (BOOL)isDataVaultEnabled
{
  return os_variant_is_darwinos() ^ 1;
}

+ (id)logObjForBugType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (v3 && (objc_msgSend(&unk_1E4DFEED0, "containsObject:", v3) & 1) != 0)
  {
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "logDomain");

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
  }

  return v5;
}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)markDescriptor_withPairs_andOptions__option_xattr_whitelist, "containsObject:", v6))
  {
    +[OSALog markDescriptor:forKey:withObj:](OSALog, "markDescriptor:forKey:withObj:", *(unsigned int *)(a1 + 32), v6, v5);
  }

}

- (OSALog)initWithFilepath:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  OSALog *v9;
  OSALog *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSALog;
  v9 = -[OSALog init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bugType, a4);
    objc_storeStrong((id *)&v10->_filepath, a3);
  }

  return v10;
}

+ (void)markDescriptor:(int)a3 forKey:(id)a4 withObj:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  const char *v10;
  id v11;
  size_t v12;
  id v13;
  size_t v14;
  id v15;
  int v16;
  int *v17;
  char *v18;
  int v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    v10 = v9;
LABEL_7:
    v12 = strlen(v9);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_13;
    objc_msgSend(v8, "stringValue");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v13, "UTF8String");

    v9 = v10;
    goto LABEL_7;
  }
  v11 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v11, "bytes");
  v12 = objc_msgSend(v11, "length");
LABEL_8:
  v14 = v12;
  if (v10 && v12)
  {
    v15 = objc_retainAutorelease(v7);
    if (fsetxattr(a3, (const char *)objc_msgSend(v15, "UTF8String"), v10, v14, 0, 0)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      v19 = 138412802;
      v20 = v15;
      v21 = 1024;
      v22 = v16;
      v23 = 2080;
      v24 = v18;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to set xattr '%@', errno=%d: %s", (uint8_t *)&v19, 0x1Cu);
    }
    goto LABEL_15;
  }
LABEL_13:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[OSALog markDescriptor:forKey:withObj:].cold.1();
LABEL_15:

}

- (NSString)oldFilePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

+ (id)locallyCreateForSubmission:(id)a3 metadata:(id)a4 options:(id)a5 error:(id *)a6 writing:(id)a7
{
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id *v18;
  int v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  id v81;
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  id v87;
  __CFString *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t *v95;
  uint64_t *v96;
  double v97;
  uint64_t v98;
  BOOL v99;
  id obj;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  __CFString *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  _QWORD v124[3];
  _QWORD v125[3];
  uint64_t v126;
  uint64_t v127;
  uint8_t buf[4];
  __CFString *v129;
  __int16 v130;
  void *v131;
  __int16 v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD v135[4];

  v135[1] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v83 = a7;
  v118 = 0;
  v119 = &v118;
  v120 = 0x3032000000;
  v121 = __Block_byref_object_copy__4;
  v122 = __Block_byref_object_dispose__4;
  v123 = 0;
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__4;
  v116 = __Block_byref_object_dispose__4;
  v117 = 0;
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = __Block_byref_object_copy__4;
  v110 = __Block_byref_object_dispose__4;
  v111 = CFSTR("Undescribed error");
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("LogType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "length"))
  {
    v14 = v10;

    v13 = v14;
  }
  v104 = 0;
  v105 = 0;
  v101 = 0;
  v102 = &v101;
  v103 = 0x2020000000;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("override-filePath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  if (v16)
    goto LABEL_7;
  +[OSALogTrackerObject sharedTrackers](OSALogTrackerObject, "sharedTrackers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id *)(v107 + 5);
  obj = (id)v107[5];
  v19 = objc_msgSend(v17, "osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:", v10, v13, v102 + 3, &v105, v12, &obj);
  objc_storeStrong(v18, obj);
  if (v19)
  {

LABEL_7:
    v21 = v11;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("roots_installed"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22 == 0;

    if (v23)
    {
      +[OSALog additionalRootsInstalled](OSALog, "additionalRootsInstalled");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v24 = (void *)objc_msgSend(v21, "mutableCopy");
        objc_msgSend(v24, "addEntriesFromDictionary:", v25);

      }
      else
      {
        v24 = v21;
      }

    }
    else
    {
      v24 = v21;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("capture-time"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "logPathForType:at:options:", v10, v12, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("move-file"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke;
      v85[3] = &unk_1E4DEDFA8;
      v32 = v31;
      v86 = v32;
      v87 = v30;
      v93 = &v118;
      v88 = v10;
      v89 = v24;
      v90 = v12;
      v97 = v28;
      v92 = v83;
      v94 = &v106;
      v99 = v16;
      v95 = &v112;
      v96 = &v101;
      v91 = v13;
      v98 = v105;
      __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke((uint64_t)v85);

      v33 = v86;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v129 = v10;
        v130 = 2112;
        v131 = v13;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Report of type '%{public}@(%@)' not saved because the destination is unavailable", buf, 0x16u);
      }
      v34 = (void *)v107[5];
      v107[5] = (uint64_t)CFSTR("Destination unavailable");

      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = v107[5];
      v134 = *MEMORY[0x1E0CB2D50];
      v135[0] = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, &v134, 1);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 5, v32);
      v37 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v113[5];
      v113[5] = v37;
    }

    goto LABEL_19;
  }
  v20 = +[OSALog randomlySelectForRetention:](OSALog, "randomlySelectForRetention:", v10);

  if (v20)
    goto LABEL_7;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v129 = v10;
    v130 = 2112;
    v131 = v13;
    v132 = 2048;
    v133 = v105;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Report of type '%{public}@(%@)' not saved because the limit of %lu logs has been reached", buf, 0x20u);
  }
  v67 = (void *)MEMORY[0x1E0CB35C8];
  v68 = v107[5];
  v126 = *MEMORY[0x1E0CB2D50];
  v127 = v68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 4, v24);
  v69 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v113[5];
  v113[5] = v69;
LABEL_19:

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v10, CFSTR("bug_type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v107[5] == 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("saved"));

  v40 = (void *)v113[5];
  if (v40)
  {
    objc_msgSend(v40, "userInfo");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("errno"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "intValue");

    v44 = (void *)MEMORY[0x1E0CB3940];
    v45 = v107[5];
    objc_msgSend((id)v113[5], "domain");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("%@ (%@:%ld:%d)"), v45, v46, objc_msgSend((id)v113[5], "code"), v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v47, CFSTR("error"));

    if ((_DWORD)v43)
    {
      objc_msgSend((id)v113[5], "userInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("errno"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v49, CFSTR("errno"));

    }
  }
  else
  {
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v107[5], CFSTR("error"));
  }
  AnalyticsSendEvent();
  if (-[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("211")))
  {
    +[OSAStateMonitor recordEvent:](OSAStateMonitor, "recordEvent:", CFSTR("ca-log-written"));
    if (v107[5])
    {
      v124[0] = CFSTR("crk");
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "crashReporterKey");
      v51 = objc_claimAutoreleasedReturnValue();
      v52 = (void *)v51;
      if (v10)
        v53 = v10;
      else
        v53 = CFSTR("<unknown>");
      v125[0] = v51;
      v125[1] = v53;
      v124[1] = CFSTR("bug_type");
      v124[2] = CFSTR("error");
      objc_msgSend(v38, "objectForKeyedSubscript:");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v54;
      if (v54)
        v56 = (const __CFString *)v54;
      else
        v56 = CFSTR("<unknown>");
      v125[2] = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      rtcsc_send(2003, 2003, v57);

    }
  }
  if (+[OSALog isDataVaultEnabled](OSALog, "isDataVaultEnabled"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("datavault-filePath"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v58, "BOOLValue") || v107[5])
    {
LABEL_44:

      goto LABEL_45;
    }
    objc_msgSend((id)v119[5], "filepath");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59 == 0;

    if (!v60)
    {
      objc_msgSend((id)v119[5], "filepath");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "lastPathComponent");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "pathSubmission");
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v63, "stringByAppendingPathComponent:", v58);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v119[5], "filepath");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = 0;
      LOBYTE(v63) = objc_msgSend(v65, "copyItemAtPath:toPath:error:", v66, v64, &v84);
      v81 = v84;

      if ((v63 & 1) != 0)
      {
        +[OSALog markFile:withKey:value:](OSALog, "markFile:withKey:value:", v64, "DoNotSubmit", "1");
        objc_msgSend((id)v119[5], "setOldFilePath:", v64);
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        +[OSALog locallyCreateForSubmission:metadata:options:error:writing:].cold.1((uint64_t)v81, v70, v71, v72, v73, v74, v75, v76);
      }
      objc_msgSend((id)v119[5], "filepath");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[OSALog markPurgeableLevel:path:](OSALog, "markPurgeableLevel:path:", 98308, v77);

      goto LABEL_44;
    }
  }
LABEL_45:
  if (a6)
  {
    v78 = (void *)v113[5];
    if (v78)
      *a6 = objc_retainAutorelease(v78);
  }
  v79 = (id)v119[5];

  _Block_object_dispose(&v101, 8);
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(&v112, 8);
  _Block_object_dispose(&v118, 8);

  return v79;
}

void __68__OSALog_locallyCreateForSubmission_metadata_options_error_writing___block_invoke(uint64_t a1)
{
  void *v2;
  FILE *v3;
  FILE *v4;
  OSALog *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  OSALog *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  const __CFString *v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  _QWORD v87[2];

  v87[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v75 = v2;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Moving source file '%{public}@' into submission directory", buf, 0xCu);
    }
    v3 = fopen((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), "r");
    if (v3)
    {
      v4 = v3;
      +[OSASystemConfiguration ensureConformanceOfFile:options:](OSASystemConfiguration, "ensureConformanceOfFile:options:", fileno(v3), *(_QWORD *)(a1 + 64));
      +[OSALog markDescriptor:withPairs:andOptions:](OSALog, "markDescriptor:withPairs:andOptions:", fileno(v4), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
      fclose(v4);
      v5 = -[OSALog initWithFilepath:type:]([OSALog alloc], "initWithFilepath:type:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
        goto LABEL_18;
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = CFSTR("Unable to access log from existing file");

      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
      v86 = *MEMORY[0x1E0CB2D50];
      v87[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 6, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v15 = *(id *)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
    }
    else
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *__error();
      v35 = __error();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Unable to open file '%@': [%d] %s"), v33, v34, strerror(*v35));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v75 = v12;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v37 = *(void **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = CFSTR("Unable to open file");

      v38 = (void *)MEMORY[0x1E0CB35C8];
      v84 = *MEMORY[0x1E0CB2D50];
      v85 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 3, v15);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v41 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = v39;

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "stringByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("."), "stringByAppendingString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = [OSALog alloc];
    v20 = *(_QWORD *)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 64);
    v23 = *(double *)(a1 + 120);
    v71 = 0;
    v24 = -[OSALog initWithType:filepath:metadata:options:at:error:](v19, "initWithType:filepath:metadata:options:at:error:", v20, v12, v21, v22, &v71, v23);
    v25 = v71;
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v24;

    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    if (v28)
    {
      v29 = *(_QWORD *)(a1 + 80);
      v30 = fileno((FILE *)objc_msgSend(v28, "stream"));
      v70 = v25;
      v31 = (*(uint64_t (**)(uint64_t, uint64_t, id *))(v29 + 16))(v29, v30, &v70);
      v15 = v70;

      if (v31)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "closeFileStream");
      }
      else
      {
        unlink((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v43 = *(void **)(v42 + 40);
        *(_QWORD *)(v42 + 40) = 0;

      }
    }
    else
    {
      v15 = v25;
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    {
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v45 = *(void **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = CFSTR("Unable to create a new log file");

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), v15);
    }
  }

LABEL_18:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "filepath");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *(_QWORD *)(a1 + 40);
    v69 = 0;
    v49 = objc_msgSend(v46, "moveItemAtPath:toPath:error:", v47, v48, &v69);
    v50 = v69;

    if (v49)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "rename:", *(_QWORD *)(a1 + 40));
      if (!*(_BYTE *)(a1 + 136))
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        +[OSALogTrackerObject sharedTrackers](OSALogTrackerObject, "sharedTrackers");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = *(_QWORD *)(a1 + 72);
        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("Signature"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "osa_logTracker_incrementForSubtype:signature:filepath:", v52, v53, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"));

      }
      +[OSABridgeLinkProxy transfer:key:](OSABridgeLinkProxy, "transfer:key:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v54 = *(void **)(a1 + 72);
        v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24);
        v56 = *(_QWORD *)(a1 + 128);
        v58 = *(_QWORD *)(a1 + 40);
        v57 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138544386;
        v75 = v57;
        v76 = 2112;
        v77 = v54;
        v78 = 2048;
        v79 = v55;
        v80 = 2048;
        v81 = v56;
        v82 = 2114;
        v83 = v58;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Saved type '%{public}@(%@)' report (%lu of max %lu) at %{public}@", buf, 0x34u);
      }
      v59 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v60 = *(void **)(v59 + 40);
      *(_QWORD *)(v59 + 40) = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "filepath");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v65;
        v76 = 2114;
        v77 = v50;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to move tmp file '%{public}@': %{public}@", buf, 0x16u);

      }
      v66 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v67 = *(void **)(v66 + 40);
      *(_QWORD *)(v66 + 40) = CFSTR("Unable to move tmp file");

      v68 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v50 = v50;
      v60 = *(void **)(v68 + 40);
      *(_QWORD *)(v68 + 40) = v50;
    }
    goto LABEL_32;
  }
  v61 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
  if (!*(_QWORD *)(v61 + 40))
  {
    *(_QWORD *)(v61 + 40) = CFSTR("Failed to create log");

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
  {
    v62 = (void *)MEMORY[0x1E0CB35C8];
    v72 = *MEMORY[0x1E0CB2D50];
    v73 = CFSTR("datawriter returned with negative response");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 14, v50);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v60 = *(void **)(v64 + 40);
    *(_QWORD *)(v64 + 40) = v63;
LABEL_32:

  }
}

- (void)dealloc
{
  objc_super v3;

  -[OSALog closeFileStream](self, "closeFileStream");
  v3.receiver = self;
  v3.super_class = (Class)OSALog;
  -[OSALog dealloc](&v3, sel_dealloc);
}

- (void)closeFileStream
{
  FILE *stream;
  void *v4;
  int v5;
  int *v6;
  char *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  stream = self->_stream;
  if (stream)
  {
    if (fclose(stream))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[NSString lastPathComponent](self->_filepath, "lastPathComponent");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *__error();
        v6 = __error();
        v7 = strerror(*v6);
        v8 = 138412802;
        v9 = v4;
        v10 = 1024;
        v11 = v5;
        v12 = 2080;
        v13 = v7;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "WARNING: Failed to close %@. Please do NOT call -[NSFileHandle closeFile] errno=%d: %s", (uint8_t *)&v8, 0x1Cu);

      }
    }
    self->_stream = 0;
  }
}

- (__sFILE)stream
{
  return self->_stream;
}

- (void)rename:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_filepath, a3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[OSALog rename:].cold.1((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (OSALog)initWithType:(id)a3 filepath:(id)a4 metadata:(id)a5 options:(id)a6 at:(double)a7 error:(id *)a8
{
  char *v13;
  char *v14;
  id v15;
  OSALog *v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *metaData;
  NSDictionary *v23;
  void *v24;
  void *v25;
  NSDictionary *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  int *v32;
  char *v33;
  id v34;
  void *v35;
  void *v36;
  OSALog *v37;
  OSALog *v38;
  void *v40;
  id v41;
  mode_t v42;
  id v44;
  id v45;
  objc_super v46;
  _QWORD v47[2];
  _QWORD v48[4];
  const __CFString *v49;
  uint8_t buf[4];
  char *v51;
  __int16 v52;
  char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v13 = (char *)a3;
  v14 = (char *)a4;
  v44 = a5;
  v15 = a6;
  v46.receiver = self;
  v46.super_class = (Class)OSALog;
  v16 = -[OSALog init](&v46, sel_init);
  if (!v16)
    goto LABEL_22;
  v42 = umask(0);
  objc_storeStrong((id *)&v16->_filepath, a4);
  +[OSALog logObjForBugType:](OSALog, "logObjForBugType:", v13);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v13;
    v52 = 2114;
    v53 = v14;
    _os_log_impl(&dword_1A4D21000, v17, OS_LOG_TYPE_DEFAULT, "creating type %{public}@ as %{public}@", buf, 0x16u);
  }

  v18 = objc_retainAutorelease(v14);
  v19 = open_dprotected_np((const char *)objc_msgSend(v18, "UTF8String"), 2561, 4, 0, 432);
  if ((v19 & 0x80000000) == 0)
  {
    +[OSASystemConfiguration ensureConformanceOfFile:options:](OSASystemConfiguration, "ensureConformanceOfFile:options:", v19, v15);
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createReportMetadata:with:at:usingOptions:", v13, v44, v15, a7);
    v21 = objc_claimAutoreleasedReturnValue();
    metaData = v16->_metaData;
    v16->_metaData = (NSDictionary *)v21;

    v23 = v16->_metaData;
    v49 = CFSTR("bug_type");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary dictionaryWithValuesForKeys:](v23, "dictionaryWithValuesForKeys:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v16->_metaData;
    v45 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v26, 0, &v45);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v45;
    if (v27)
    {
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v19, 0);
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("alt-metadata"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28 == 0;

      if (v29)
      {
        objc_msgSend(v40, "writeData:", v27);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", "\n", 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "writeData:", v30);

      }
      if ((v19 & 0x80000000) == 0)
      {
        +[OSALog markDescriptor:withPairs:andOptions:](OSALog, "markDescriptor:withPairs:andOptions:", v19, v25, v15);
        v16->_stream = fdopen(v19, "w");
        goto LABEL_20;
      }
    }
    else
    {
      if (a8)
        *a8 = objc_retainAutorelease(v41);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v51 = 0;
        v52 = 2114;
        v53 = (char *)v41;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error while serializing ips metadata %{public}@. Error: %{public}@", buf, 0x16u);
      }
      close(v19);

    }
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
    goto LABEL_20;
  }
  v31 = *__error();
  v32 = __error();
  v33 = strerror(*v32);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v51 = v18;
    v52 = 2082;
    v53 = v33;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error creating file %{public}@, %{public}s", buf, 0x16u);
  }
  if (!a8)
    goto LABEL_21;
  v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v47[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = CFSTR("errno");
  v48[0] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  *a8 = (id)objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("OSALog"), 13, v36);

LABEL_20:
LABEL_21:
  umask(v42);
LABEL_22:
  if (v16->_stream)
    v37 = v16;
  else
    v37 = 0;
  v38 = v37;

  return v38;
}

+ (id)additionalRootsInstalled
{
  void *v2;
  void *v3;
  size_t v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = 8;
  v6 = 0;
  v2 = 0;
  if (!sysctlbyname("kern.roots_installed", &v6, &v5, 0, 0))
  {
    v7 = CFSTR("roots_installed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

+ (void)markDescriptor:(int)a3 withPairs:(id)a4 andOptions:(id)a5
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  int v12;
  _QWORD v13[4];
  int v14;

  v7 = markDescriptor_withPairs_andOptions__onceToken;
  v10 = a5;
  v8 = a4;
  if (v7 != -1)
    dispatch_once(&markDescriptor_withPairs_andOptions__onceToken, &__block_literal_global_215);
  v9 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_2;
  v13[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
  v14 = a3;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

  v11[0] = v9;
  v11[1] = 3221225472;
  v11[2] = __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke_3;
  v11[3] = &__block_descriptor_36_e15_v32__0_8_16_B24l;
  v12 = a3;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

}

+ (id)commonFieldsForBody:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("bug_type");
  v10[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog additionalRootsInstalled](OSALog, "additionalRootsInstalled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);

    v5 = v7;
  }

  return v5;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 usingConfig:(id)a5 options:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  OSALog *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id *p_filepath;
  int *v23;
  int v24;
  id v25;
  int v26;
  id *v27;
  int v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSString *bugType;
  void *v41;
  void *v42;
  unsigned int v43;
  BOOL v44;
  void *v46;
  uint64_t v47;
  NSDictionary *v48;
  char isKindOfClass;
  NSDictionary *v50;
  uint64_t v51;
  NSString *v52;
  NSString *filepath;
  off_t v54;
  void *v55;
  NSDictionary *v56;
  const char *v57;
  id v58;
  void *v59;
  NSDictionary *metaData;
  id v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSString *v67;
  int v68;
  ssize_t v69;
  ssize_t v70;
  uint8_t *v71;
  ssize_t v72;
  void *v73;
  void *v74;
  NSDictionary *v75;
  id v76;
  char v77;
  NSDictionary *v78;
  void *v79;
  NSDictionary *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  id v90;
  NSString *v91;
  void *v92;
  id v93;
  NSDictionary *v94;
  void *v95;
  id *v96;
  id v97;
  id v98;
  timeval v99;
  stat v100;
  const char *v101;
  objc_super v102;
  uint64_t v103;
  const __CFString *v104;
  _QWORD v105[2];
  _QWORD v106[2];
  _BYTE __ptr[33];
  uint8_t buf[4];
  id v109;
  __int16 v110;
  off_t st_size;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[OSALog initWithPath:forRouting:usingConfig:options:error:].cold.1();
  v102.receiver = self;
  v102.super_class = (Class)OSALog;
  v17 = -[OSALog init](&v102, sel_init);
  if (!v17)
    goto LABEL_92;
  v96 = a7;
  v101 = "rejected";
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("<cleanup>"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17->_deleteOnRetire = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("<preserve>"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17->_preserveFiles = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("<exempt>"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  p_filepath = (id *)&v17->_filepath;
  objc_storeStrong((id *)&v17->_filepath, a3);
  v17->_stream = fopen(-[NSString fileSystemRepresentation](v17->_filepath, "fileSystemRepresentation"), "r");
  v23 = __error();
  v97 = v13;
  if (v17->_stream)
  {
    memset(&v100, 0, sizeof(v100));
    v24 = fileno(v17->_stream);
    if (fstat(v24, &v100))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v25 = *p_filepath;
        v26 = *__error();
        *(_DWORD *)buf = 138412546;
        v109 = v25;
        v110 = 1024;
        LODWORD(st_size) = v26;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' fstat errno %d", buf, 0x12u);
      }
      v101 = "rejected-fstat";
      fclose(v17->_stream);
      v17->_stream = 0;
      v27 = a7;
      goto LABEL_77;
    }
    objc_msgSend(*p_filepath, "pathExtension");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("synced"));
    v36 = *p_filepath;
    if ((v35 & 1) != 0)
    {
      objc_msgSend(v36, "stringByDeletingPathExtension");
      v37 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = v36;
    }
    v38 = v37;

    objc_msgSend(v38, "pathExtension");
    v39 = objc_claimAutoreleasedReturnValue();
    bugType = v17->_bugType;
    v17->_bugType = (NSString *)v39;

    v99.tv_sec = 0;
    *(_QWORD *)&v99.tv_usec = 0;
    gettimeofday(&v99, 0);
    if ((v21 & 1) == 0 && v99.tv_sec - v100.st_mtimespec.tv_sec > 2591999)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v58 = *p_filepath;
        *(_DWORD *)buf = 138412290;
        v109 = v58;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' is too old for submission", buf, 0xCu);
      }
      fclose(v17->_stream);
      v17->_stream = 0;
      v101 = "rejected-age";
      v27 = a7;
      goto LABEL_76;
    }
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("<metadata>"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v41;
    if (v41 && !objc_msgSend(v41, "BOOLValue"))
    {
      if ((v21 & 1) != 0
        || -[OSALog isReasonableSize:forRouting:](v17, "isReasonableSize:forRouting:", v100.st_size, v14))
      {
        v59 = v95;
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("anon")) & 1) == 0
          && (objc_msgSend(v95, "BOOLValue") & 1) != 0)
        {
          metaData = v17->_metaData;
          v17->_metaData = (NSDictionary *)MEMORY[0x1E0C9AA70];

          v27 = v96;
LABEL_75:

LABEL_76:
LABEL_77:
          if (v17->_stream)
            goto LABEL_78;
          v57 = v101;
          goto LABEL_84;
        }
        v94 = (NSDictionary *)objc_opt_new();
        if (objc_msgSend(v14, "isEqualToString:", CFSTR("anon")))
        {
          objc_msgSend(v38, "stringByDeletingPathExtension");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "pathExtension");
          v64 = v38;
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSDictionary setObject:forKeyedSubscript:](v94, "setObject:forKeyedSubscript:", v65, CFSTR("subrouting"));
          objc_msgSend(v65, "stringByAppendingPathExtension:", v17->_bugType);
          v66 = objc_claimAutoreleasedReturnValue();
          v67 = v17->_bugType;
          v17->_bugType = (NSString *)v66;

          v38 = v64;
        }
        v92 = v38;
        if (initWithPath_forRouting_usingConfig_options_error__onceToken != -1)
          dispatch_once(&initWithPath_forRouting_usingConfig_options_error__onceToken, &__block_literal_global_4);
        v68 = fileno(v17->_stream);
        v69 = flistxattr(v68, (char *)buf, 0x1FFuLL, 0);
        if (v69 >= 1)
        {
          v70 = v69;
          buf[v69] = 0;
          v71 = buf;
          do
          {
            v72 = fgetxattr(v68, (const char *)v71, __ptr, 0x20uLL, 0, 0);
            if (v72 >= 1)
            {
              __ptr[v72] = 0;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v71);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend((id)initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist, "containsObject:", v73) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", __ptr);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary setObject:forKeyedSubscript:](v94, "setObject:forKeyedSubscript:", v74, v73);

              }
            }
            v71 += strlen((const char *)v71) + 1;
          }
          while (v71 - buf < v70);
        }
        v75 = v17->_metaData;
        v17->_metaData = v94;

        v38 = v92;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v90 = *p_filepath;
          *(_DWORD *)buf = 138412546;
          v109 = v90;
          v110 = 2048;
          st_size = v100.st_size;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' is too large (%lld) for submission", buf, 0x16u);
        }
        v101 = "rejected-rawsize";
        fclose(v17->_stream);
        v17->_stream = 0;
      }
LABEL_74:
      v27 = v96;
      v59 = v95;
      goto LABEL_75;
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 1024);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    __ptr[0] = 0;
    if (fread(__ptr, 1uLL, 1uLL, v17->_stream) && __ptr[0] != 10)
    {
      v43 = 0;
      do
      {
        objc_msgSend(v42, "appendBytes:length:", __ptr, 1);
        if (fread(__ptr, 1uLL, 1uLL, v17->_stream))
          v44 = __ptr[0] == 10;
        else
          v44 = 1;
        if (v44)
          break;
      }
      while (v43++ < 0x3FF);
    }
    if (!objc_msgSend(v42, "length"))
    {
      if ((v21 & 1) != 0)
      {
LABEL_73:

        goto LABEL_74;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v61 = *p_filepath;
        v62 = *__error();
        *(_DWORD *)buf = 138412546;
        v109 = v61;
        v110 = 1024;
        LODWORD(st_size) = v62;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' rejected for submission: missing metadata (or fread errno %d)", buf, 0x12u);
      }
      v101 = "rejected-header";
LABEL_68:
      if (v17->_metaData)
        v77 = 1;
      else
        v77 = v21;
      if ((v77 & 1) == 0)
      {
        fclose(v17->_stream);
        v17->_stream = 0;
      }
      goto LABEL_73;
    }
    v46 = v38;
    v98 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v42, 0, &v98);
    v47 = objc_claimAutoreleasedReturnValue();
    v93 = v98;
    v48 = v17->_metaData;
    v17->_metaData = (NSDictionary *)v47;

    if (v17->_metaData)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v50 = v17->_metaData;
      if ((isKindOfClass & 1) != 0)
      {
        -[NSDictionary objectForKey:](v50, "objectForKey:", CFSTR("bug_type"));
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = v17->_bugType;
        v17->_bugType = (NSString *)v51;

        if ((v21 & 1) == 0)
        {
          filepath = v17->_filepath;
          v91 = v17->_bugType;
          v54 = v100.st_size;
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("<whitelist>"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v54) = objc_msgSend(v15, "isFile:validForSubmission:reasonableSize:to:internalTypes:result:", filepath, v91, v54, v14, v55, &v101);

          if ((v54 & 1) == 0)
          {
            v56 = v17->_metaData;
            v17->_metaData = 0;

          }
        }
LABEL_67:

        v38 = v46;
        goto LABEL_68;
      }
    }
    else
    {
      v50 = 0;
    }
    v17->_metaData = 0;

    if ((v21 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v76 = *p_filepath;
        *(_DWORD *)buf = 138412546;
        v109 = v76;
        v110 = 2112;
        st_size = (off_t)v93;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' rejected for submission: bad metadata (or json error %@)", buf, 0x16u);
      }
      v101 = "rejected-metadata";
    }
    goto LABEL_67;
  }
  v28 = *v23;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v29 = v15;
    v30 = *p_filepath;
    v31 = *__error();
    *(_DWORD *)buf = 138412546;
    v109 = v30;
    v15 = v29;
    v110 = 1024;
    LODWORD(st_size) = v31;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Logfile '%@' failed to open (errno %d)", buf, 0x12u);
  }
  v101 = "rejected-fopen";
  v27 = a7;
  if (!v17->_stream)
  {
    if (v28 == 2)
    {
      v13 = v97;
      if (a7)
      {
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v103 = *MEMORY[0x1E0CB2D50];
        v104 = CFSTR("File doesn't exist");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 1, v33);
        *v96 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_89;
    }
    v57 = "rejected-fopen";
LABEL_84:
    if (v27)
    {
      v85 = (void *)MEMORY[0x1E0CB35C8];
      v105[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v57);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v105[1] = CFSTR("bug_type");
      v106[0] = v86;
      v87 = (const __CFString *)v17->_bugType;
      if (!v87)
        v87 = CFSTR("<unknown>");
      v106[1] = v87;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 2, v88);
      *v27 = (id)objc_claimAutoreleasedReturnValue();

      v57 = v101;
    }
    v13 = v97;
    -[OSALog retire:](v17, "retire:", v57);
LABEL_89:
    v84 = v17;
    v17 = 0;
LABEL_90:

    goto LABEL_92;
  }
LABEL_78:
  v78 = v17->_metaData;
  if (!v78)
  {
    v13 = v97;
    goto LABEL_92;
  }
  -[NSDictionary objectForKeyedSubscript:](v78, "objectForKeyedSubscript:", CFSTR("incident_id"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v97;
  if (!v79)
  {
    v80 = (NSDictionary *)-[NSDictionary mutableCopy](v17->_metaData, "mutableCopy");
    -[NSDictionary objectForKeyedSubscript:](v17->_metaData, "objectForKeyedSubscript:", CFSTR("incident_id"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v81)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "UUIDString");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v80, "setObject:forKeyedSubscript:", v83, CFSTR("incident_id"));

    }
    v84 = v17->_metaData;
    v17->_metaData = v80;
    goto LABEL_90;
  }
LABEL_92:

  return v17;
}

void __60__OSALog_initWithPath_forRouting_usingConfig_options_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("SubmissionPolicy");
  v2[1] = CFSTR("routing");
  v2[2] = CFSTR("urgent");
  v2[3] = CFSTR("Signature");
  v2[4] = CFSTR("LogType");
  v2[5] = CFSTR("dialog_displayed");
  v2[6] = CFSTR("ReopenPath");
  v2[7] = CFSTR("displayName");
  v2[8] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist;
  initWithPath_forRouting_usingConfig_options_error__option_xattr_whitelist = v0;

}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  OSALog *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[OSALog initWithPath:forRouting:usingConfig:options:error:](self, "initWithPath:forRouting:usingConfig:options:error:", v12, v11, v13, v10, a6);

  return v14;
}

- (OSALog)initWithPath:(id)a3 forRouting:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  OSALog *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[OSALog initWithPath:forRouting:usingConfig:options:error:](self, "initWithPath:forRouting:usingConfig:options:error:", v10, v9, v11, v8, 0);

  return v12;
}

- (OSALog)initWithPath:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  OSALog *v10;

  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("<exempt>"));
  v10 = -[OSALog initWithPath:forRouting:options:error:](self, "initWithPath:forRouting:options:error:", v8, &stru_1E4DEECB8, v9, a5);

  return v10;
}

- (id)description
{
  return self->_filepath;
}

+ (void)markPurgeableLevel:(unint64_t)a3 path:(id)a4
{
  id v4;
  int v5;
  int v6;
  unint64_t v7;

  v7 = a3;
  v4 = objc_retainAutorelease(a4);
  v5 = fsctl((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0xC0084A44uLL, &v7, 0);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[OSALog markPurgeableLevel:path:].cold.1(v4, (uint64_t *)&v7, v6);
  }

}

+ (BOOL)randomlySelectForRetention:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  if (randomlySelectForRetention__onceToken != -1)
    dispatch_once(&randomlySelectForRetention__onceToken, &__block_literal_global_130);
  v4 = randomlySelectForRetention__logRetentionCountQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__OSALog_randomlySelectForRetention___block_invoke_2;
  v7[3] = &unk_1E4DEDF80;
  v8 = v3;
  v9 = &v10;
  v5 = v3;
  dispatch_sync(v4, v7);
  LOBYTE(v4) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __37__OSALog_randomlySelectForRetention___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.osanalytics.logRetentionCount", 0);
  v1 = (void *)randomlySelectForRetention__logRetentionCountQueue;
  randomlySelectForRetention__logRetentionCountQueue = (uint64_t)v0;

}

void __37__OSALog_randomlySelectForRetention___block_invoke_2(uint64_t a1)
{
  OSADateCounter *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = -[OSADateCounter initWithIdentifier:]([OSADateCounter alloc], "initWithIdentifier:", CFSTR("logLimit_309"));
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("309")))
  {
    if (-[OSADateCounter count](v2, "count") <= 0x31 && OSARandomSelection(0x1F4uLL, CFSTR("logLimitRate_309")))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      -[OSADateCounter increment](v2, "increment");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v3 = *(_QWORD *)(a1 + 32);
        v4 = 138543362;
        v5 = v3;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Retaining additional log with bug type %{public}@", (uint8_t *)&v4, 0xCu);
      }
    }
  }

}

uint64_t __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:", a2);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
  return 1;
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_183(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *string;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 != (id)MEMORY[0x1E0C81258] && MEMORY[0x1A85A8658](v3) == MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "com.apple.osanalytics.osanalyticshelper";
      v16 = 2080;
      v17 = string;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Got xpc error message from %s: %s\n", buf, 0x16u);
    }
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC Error: %s"), string);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("OSALog"), 8, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_187(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[16];

  v3 = a2;
  if (MEMORY[0x1A85A8658]() == MEMORY[0x1E0C812E0])
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "C3. private back-channel connection established", buf, 2u);
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_188;
    v5[3] = &unk_1E4DEDFF8;
    v7 = *(id *)(a1 + 32);
    v4 = v3;
    v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, v5);
    xpc_connection_resume((xpc_connection_t)v4);

  }
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_188(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1A85A8658]() == MEMORY[0x1E0C812F8])
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      v5 = xpc_dictionary_dup_fd(v3, "fileDesc");
      if ((_DWORD)v5)
      {
        v6 = v5;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v10 = 67109120;
          v11 = v6;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "C4. write payload using file descriptor (%d)", (uint8_t *)&v10, 8u);
        }
        v7 = *(_QWORD *)(a1 + 40);
        if (v7)
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:", v6);
          (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

        }
        v9 = 1;
        close(v6);
      }
      else
      {
        v9 = 0;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 67109120;
          v11 = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "C4. ERROR no file descriptor (%d)", (uint8_t *)&v10, 8u);
          v9 = 0;
        }
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v10 = 67109120;
        v11 = v9;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "C5. payload writing complete, return status %d", (uint8_t *)&v10, 8u);
      }
      xpc_dictionary_set_BOOL(reply, "result", v9);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "C4. ERROR Unable to reply", (uint8_t *)&v10, 2u);
    }

  }
}

- (BOOL)isReasonableSize:(int64_t)a3 forRouting:(id)a4
{
  void *v6;
  BOOL v7;
  unint64_t v8;

  -[NSString lastPathComponent](self->_filepath, "lastPathComponent", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasSuffix:", CFSTR(".pll.anon")) & 1) != 0)
  {

  }
  else
  {
    v7 = -[NSString hasSuffix:](self->_filepath, "hasSuffix:", CFSTR(".mss.anon"));

    if (!v7)
    {
      v8 = 0x100000;
      return v8 >= a3;
    }
  }
  v8 = 104857600;
  return v8 >= a3;
}

- (void)markWithKey:(const char *)a3 value:(const char *)a4
{
  const char *v6;
  size_t v7;

  v6 = -[NSString UTF8String](self->_filepath, "UTF8String");
  v7 = strlen(a4);
  if (setxattr(v6, a3, a4, v7 + 1, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[OSALog markWithKey:value:].cold.1();
  }
}

+ (void)markFile:(id)a3 withKey:(const char *)a4 value:(const char *)a5
{
  id v7;
  const char *v8;
  size_t v9;

  v7 = objc_retainAutorelease(a3);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = strlen(a5);
  if (setxattr(v8, a4, a5, v9 + 1, 0, 0) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    +[OSALog markFile:withKey:value:].cold.1();

}

void __46__OSALog_markDescriptor_withPairs_andOptions___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];

  v2[9] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("SubmissionPolicy");
  v2[1] = CFSTR("routing");
  v2[2] = CFSTR("urgent");
  v2[3] = CFSTR("Signature");
  v2[4] = CFSTR("LogType");
  v2[5] = CFSTR("dialog_displayed");
  v2[6] = CFSTR("ReopenPath");
  v2[7] = CFSTR("displayName");
  v2[8] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)markDescriptor_withPairs_andOptions__option_xattr_whitelist;
  markDescriptor_withPairs_andOptions__option_xattr_whitelist = v0;

}

- (BOOL)retire:(const char *)a3
{
  NSString *filepath;
  NSString **p_filepath;
  void *v7;
  NSString *v8;
  id v9;
  uint64_t v10;
  NSString *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  const char *v23;
  NSObject *v24;
  __CFString *v25;
  const __CFString *bugType;
  const char *v27;
  NSString *v28;
  const __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  BOOL v48;
  NSString *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[6];
  _QWORD v62[6];
  _QWORD v63[4];
  _QWORD v64[4];
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  NSString *v70;
  __int16 v71;
  const char *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  p_filepath = &self->_filepath;
  filepath = self->_filepath;
  if (!filepath)
    return 1;
  v7 = (void *)-[NSString copy](filepath, "copy");
  -[OSALog closeFileStream](self, "closeFileStream");
  if (!self->_preserveFiles)
  {
    v54 = v7;
    if (self->_deleteOnRetire)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_filepath;
        *(_DWORD *)buf = 136315394;
        v66 = a3;
        v67 = 2114;
        v68 = (const char *)v12;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Cleanup %s '%{public}@'", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *p_filepath);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      v14 = OSASafeRemoveFileAtURL(v13, &v58);
      v9 = v58;

      if ((v14 & 1) != 0)
      {
LABEL_11:
        v10 = 1;
LABEL_27:
        +[OSALog logObjForBugType:](OSALog, "logObjForBugType:", self->_bugType);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = CFSTR("<unknown>");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          bugType = (const __CFString *)self->_bugType;
          if (!bugType)
            bugType = CFSTR("<unknown>");
          v27 = "success";
          v28 = self->_filepath;
          *(_DWORD *)buf = 138544130;
          if (!(_DWORD)v10)
            v27 = "failed";
          v66 = (const char *)bugType;
          v67 = 2082;
          v68 = a3;
          v69 = 2114;
          v70 = v28;
          v71 = 2080;
          v72 = v27;
          _os_log_impl(&dword_1A4D21000, v24, OS_LOG_TYPE_DEFAULT, "Retiring (%{public}@) %{public}s '%{public}@': %s", buf, 0x2Au);
        }

        v29 = (const __CFString *)self->_bugType;
        if (!v29)
          v29 = CFSTR("<unknown>");
        v64[0] = v29;
        v63[0] = CFSTR("bug_type");
        v63[1] = CFSTR("reason");
        if (a3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = CFSTR("<unknown>");
        }
        v64[1] = v30;
        v63[2] = CFSTR("proxied");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[NSString containsString:](*p_filepath, "containsString:", CFSTR("ProxiedDevice-")));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v64[2] = v31;
        v63[3] = CFSTR("success");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v64[3] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEvent();

        if (a3)
        if (-[NSString isEqualToString:](self->_bugType, "isEqualToString:", CFSTR("211"))
          && !-[NSString containsString:](*p_filepath, "containsString:", CFSTR("ProxiedDevice-"))
          && (-[NSString containsString:](*p_filepath, "containsString:", CFSTR("Analytics-Never"))
           || -[NSString containsString:](*p_filepath, "containsString:", CFSTR("Analytics-2"))))
        {
          v61[0] = CFSTR("crk");
          +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "crashReporterKey");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v34;
          v36 = (const __CFString *)self->_bugType;
          if (!v36)
            v36 = CFSTR("<unknown>");
          v62[0] = v34;
          v62[1] = v36;
          v61[1] = CFSTR("bug_type");
          v61[2] = CFSTR("incident_id");
          -[NSDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:");
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v37;
          if (v37)
            v39 = (const __CFString *)v37;
          else
            v39 = CFSTR("<unknown>");
          v62[2] = v39;
          v61[3] = CFSTR("timestamp");
          -[NSDictionary objectForKeyedSubscript:](self->_metaData, "objectForKeyedSubscript:");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v40;
          if (v40)
            v42 = (const __CFString *)v40;
          else
            v42 = CFSTR("<unknown>");
          v62[3] = v42;
          v61[4] = CFSTR("reason");
          if (a3)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
            v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v62[4] = v25;
          v61[5] = CFSTR("optInStatus");
          v43 = (void *)MEMORY[0x1E0CB37E8];
          +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "numberWithBool:", objc_msgSend(v44, "optInApple"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v62[5] = v45;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 6);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          rtcsc_send(2001, 2001, v46);

          if (a3)
          v60[0] = v54;
          v59[0] = CFSTR("logPath");
          v59[1] = CFSTR("retiredReason");
          if (a3)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
            v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v47 = CFSTR("<unknown>");
          }
          v60[1] = v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          +[OSAStateMonitor recordEvent:with:](OSAStateMonitor, "recordEvent:with:", CFSTR("ca-log-retired"), v52);

          if (a3)
        }
        v7 = v54;
        goto LABEL_68;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[OSALog retire:].cold.1();
LABEL_17:
      v10 = 0;
      goto LABEL_27;
    }
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "appleInternal"))
    {
      if (-[NSString hasSuffix:](*p_filepath, "hasSuffix:", CFSTR("pll.anon")))
      {

LABEL_59:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v49 = *p_filepath;
          *(_DWORD *)buf = 138543362;
          v66 = (const char *)v49;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Auto deletion of '%{public}@'", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *p_filepath);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        v51 = OSASafeRemoveFileAtURL(v50, &v57);
        v9 = v57;

        if ((v51 & 1) != 0)
          goto LABEL_11;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[OSALog retire:].cold.1();
        goto LABEL_17;
      }
      v48 = -[NSString hasSuffix:](*p_filepath, "hasSuffix:", CFSTR("mss.anon"));

      if (v48)
        goto LABEL_59;
    }
    else
    {

    }
    -[NSString stringByDeletingLastPathComponent](*p_filepath, "stringByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", CFSTR("Retired"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString lastPathComponent](*p_filepath, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *p_filepath);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    v22 = OSASafeMoveItemAtURL(v20, v21, &v56);
    v9 = v56;

    if ((v22 & 1) != 0)
    {
      objc_storeStrong((id *)p_filepath, v19);
      -[OSALog markWithKey:value:](self, "markWithKey:value:", "retired-reason", a3);
      v10 = 1;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[OSALog retire:].cold.2();
      v10 = 0;
    }
    if (-[NSString isEqualToString:](self->_bugType, "isEqualToString:", CFSTR("211")))
    {
      v23 = -[NSString fileSystemRepresentation](self->_filepath, "fileSystemRepresentation");
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __17__OSALog_retire___block_invoke;
      v55[3] = &unk_1E4DEE088;
      v55[4] = self;
      OSASafeOpenReadOnly((uint64_t)v23, v55);
    }

    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *p_filepath;
    *(_DWORD *)buf = 136315394;
    v66 = a3;
    v67 = 2114;
    v68 = (const char *)v8;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Sparing %s '%{public}@'", buf, 0x16u);
  }
  v9 = 0;
  LODWORD(v10) = 1;
LABEL_68:

  return (_DWORD)v10 != 0;
}

void __17__OSALog_retire___block_invoke(int a1, int a2)
{
  if (fcntl(a2, 64, 2) == -1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __17__OSALog_retire___block_invoke_cold_1();
}

+ (void)cleanupRetired:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Cleaning up retired logs (in %{public}@)", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Retired"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25__OSALog_cleanupRetired___block_invoke;
  v9[3] = &unk_1E4DEE0B0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  osa_scanDir(v6, 129, v9, 0);

}

void __25__OSALog_cleanupRetired___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v4;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Failed to get attrs for retired log '%{public}@': %{public}@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  objc_msgSend(v6, "fileModificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = fabs(v9);

  if (v10 <= 604800.0)
  {
LABEL_10:
    v13 = v7;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removing old retired log '%{public}@'", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v12 = OSASafeRemoveFileAtURL(v11, &v14);
  v13 = v14;

  if ((v12 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v13;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to remove retired log '%{public}@': %{public}@", buf, 0x16u);
  }
LABEL_11:

}

+ (void)cleanupForUser:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", &stru_1E4DEECB8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addObject:", v3);
  v13 = v3;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = MEMORY[0x1E0C9AAB0];
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("include-proxies"));
        if (+[OSALog isDataVaultEnabled](OSALog, "isDataVaultEnabled"))
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("datavault-filePath"));
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("file-owner"));
        +[OSALog iterateLogsWithOptions:usingBlock:](OSALog, "iterateLogsWithOptions:usingBlock:", v12, &__block_literal_global_247);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

void __25__OSALog_cleanupForUser___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  id v15;
  void *v16;
  OSALog *v17;
  void *v18;
  OSALog *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("proxy"));

  if ((v4 & 1) == 0)
  {
    v23 = 0;
    v5 = *MEMORY[0x1E0C998E8];
    v22 = 0;
    v6 = objc_msgSend(v2, "getResourceValue:forKey:error:", &v23, v5, &v22);
    v7 = v23;
    v8 = v22;
    if (v6)
    {
      objc_msgSend(v7, "timeIntervalSinceNow");
      if (fabs(v9) > 2592000.0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v2, "path");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v10;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removing old log '%{public}@'", buf, 0xCu);

        }
        objc_msgSend(v2, "URLByDeletingLastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Retired"));

        if ((v13 & 1) != 0)
        {
          v20 = v8;
          v14 = OSASafeRemoveFileAtURL(v2, &v20);
          v15 = v20;

          if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v2, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v25 = v16;
            v26 = 2114;
            v27 = v15;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to remove old log '%{public}@': %{public}@", buf, 0x16u);

          }
        }
        else
        {
          v17 = [OSALog alloc];
          objc_msgSend(v2, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v8;
          v19 = -[OSALog initWithPath:options:error:](v17, "initWithPath:options:error:", v18, &unk_1E4DFEDA0, &v21);
          v15 = v21;

          -[OSALog retire:](v19, "retire:", "expired");
        }
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __25__OSALog_cleanupForUser___block_invoke_cold_1(v2);
    }
    v15 = v8;
LABEL_13:

  }
}

+ (id)scanProxies:(id)a3
{
  id v3;
  void *v4;
  id v5;
  DIR *v6;
  DIR *v7;
  dirent *i;
  void *v9;
  void *v10;

  v3 = a3;
  +[OSALog createRetiredDirectory:](OSALog, "createRetiredDirectory:", v3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  v6 = opendir((const char *)objc_msgSend(v5, "fileSystemRepresentation"));
  if (v6)
  {
    v7 = v6;
    for (i = readdir(v6); i; i = readdir(v7))
    {
      if (i->d_type == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", i->d_name);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("ProxiedDevice-")))
        {
          objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);
          +[OSALog createRetiredDirectory:](OSALog, "createRetiredDirectory:", v10);

        }
      }
    }
    closedir(v7);
  }

  return v4;
}

+ (unsigned)scanLogs:(id)a3 from:(id)a4 options:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _BOOL8 v40;
  const char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  id obj;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t m;
  void *v63;
  uint8_t buf[8];
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  uint64_t *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  int v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v52 = a4;
  v51 = a5;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
  if (v9)
  {
    v57 = *(_QWORD *)v94;
    do
    {
      v10 = 0;
      v59 = v9;
      do
      {
        if (*(_QWORD *)v94 != v57)
          objc_enumerationMutation(obj);
        v61 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v10);
        objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("<inactive>"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 == 0;

        if (v12)
        {
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("logs"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = 0u;
          v92 = 0u;
          v89 = 0u;
          v90 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
          if (v16)
          {
            v17 = *(_QWORD *)v90;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v90 != v17)
                  objc_enumerationMutation(v15);
                v19 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i));
                if (getxattr((const char *)objc_msgSend(v19, "UTF8String"), "DoNotSubmit", 0, 0, 0, 0) >= 1)
                  objc_msgSend(v14, "addObject:", v19);
              }
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v89, v105, 16);
            }
            while (v16);
          }

          objc_msgSend(v15, "removeObjectsInArray:", v14);
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v20 = objc_msgSend(v15, "count");
            *((_DWORD *)v98 + 6) += v20;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v21 = (void *)objc_msgSend(v15, "mutableCopy");
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v21, CFSTR("logs"));

            }
          }
          else
          {
            v22 = objc_opt_new();

            objc_msgSend(v61, "setObject:forKeyedSubscript:", v22, CFSTR("logs"));
            v15 = (id)v22;
          }
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("extensions"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = 0u;
          v88 = 0u;
          v85 = 0u;
          v86 = 0u;
          v24 = v23;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v86;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v86 != v26)
                  objc_enumerationMutation(v24);
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * j));
              }
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v85, v104, 16);
            }
            while (v25);
          }

          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("<descend>"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "BOOLValue");

          if (v29)
          {
            v83 = 0u;
            v84 = 0u;
            v81 = 0u;
            v82 = 0u;
            v30 = v24;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
            if (v31)
            {
              v32 = *(_QWORD *)v82;
              do
              {
                for (k = 0; k != v31; ++k)
                {
                  if (*(_QWORD *)v82 != v32)
                    objc_enumerationMutation(v30);
                  objc_msgSend(v63, "setObject:forKeyedSubscript:", v15, *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * k));
                }
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v103, 16);
              }
              while (v31);
            }

          }
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("routing"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v15, v34);

        }
        ++v10;
      }
      while (v10 != v59);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v106, 16);
    }
    while (v9);
  }

  objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("only-urgent"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");

  v37 = 324;
  v79 = 0u;
  v80 = 0u;
  if (v36)
    v37 = 836;
  v54 = v37;
  v77 = 0uLL;
  v78 = 0uLL;
  v53 = v52;
  v60 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
  if (v60)
  {
    v58 = *(_QWORD *)v78;
    do
    {
      for (m = 0; m != v60; ++m)
      {
        if (*(_QWORD *)v78 != v58)
          objc_enumerationMutation(v53);
        v38 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * m);
        v39 = objc_msgSend(v38, "length");
        v40 = objc_msgSend(v63, "count") == 0;
        if ((objc_msgSend(v8, "count") || objc_msgSend(v56, "count")) && objc_msgSend(v38, "length"))
        {
          v41 = (const char *)objc_msgSend(objc_retainAutorelease(v38), "fileSystemRepresentation");
          v71[0] = MEMORY[0x1E0C809B0];
          v71[1] = 3221225472;
          v71[2] = __32__OSALog_scanLogs_from_options___block_invoke;
          v71[3] = &unk_1E4DEE118;
          v72 = v56;
          v76 = v39;
          v73 = v8;
          v74 = v63;
          v75 = &v97;
          osa_scanDir(v41, v54 | v40, v71, &__block_literal_global_267);
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v42 = obj;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v101, 16);
          if (v43)
          {
            v44 = *(_QWORD *)v68;
            do
            {
              for (n = 0; n != v43; ++n)
              {
                if (*(_QWORD *)v68 != v44)
                  objc_enumerationMutation(v42);
                v46 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * n);
                objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("<sort>"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v47, "length"))
                {
                  objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("logs"));
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v65[0] = MEMORY[0x1E0C809B0];
                  v65[1] = 3221225472;
                  v65[2] = __32__OSALog_scanLogs_from_options___block_invoke_2;
                  v65[3] = &unk_1E4DEE180;
                  v66 = v47;
                  objc_msgSend(v48, "sortUsingComparator:", v65);

                }
              }
              v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v67, v101, 16);
            }
            while (v43);
          }

        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "no reason to scan", buf, 2u);
        }
      }
      v60 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v77, v102, 16);
    }
    while (v60);
  }

  v49 = *((_DWORD *)v98 + 6);
  _Block_object_dispose(&v97, 8);

  return v49;
}

void __32__OSALog_scanLogs_from_options___block_invoke(_QWORD *a1, const char *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  size_t v15;
  uint64_t v16;
  id v17;
  int v18;
  id v19;
  _OWORD value[4];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  memset(value, 0, sizeof(value));
  v7 = objc_retainAutorelease(v6);
  if (getxattr((const char *)objc_msgSend(v7, "fileSystemRepresentation"), (const char *)objc_msgSend(CFSTR("routing"), "UTF8String"), value, 0x40uLL, 0, 0) >= 1)
  {
    v8 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", value);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_12;
  }
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR(".synced")) & 1) != 0)
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v4;
  }
  v12 = v11;
  objc_msgSend(v11, "pathExtension");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

    v10 = 0;
    goto LABEL_17;
  }
  v14 = (void *)v13;
  v15 = strlen(a2);
  v16 = 6;
  if (v15 == a1[8])
    v16 = 5;
  v17 = (id)a1[v16];
  objc_msgSend(v17, "objectForKeyedSubscript:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("<*>"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v10)
  {
LABEL_12:
    if ((unint64_t)objc_msgSend(v10, "count") <= 0x3E7)
    {
      objc_msgSend(v10, "addObject:", v7);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "scan: including '%@'", (uint8_t *)&v18, 0xCu);
      }
      ++*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    }
  }
LABEL_17:

}

uint64_t __32__OSALog_scanLogs_from_options___block_invoke_265()
{
  return 1;
}

uint64_t __32__OSALog_scanLogs_from_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;

  v5 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v5, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hasPrefix:", *(_QWORD *)(a1 + 32));
  if (v7)
    return v9 - 1;
  else
    return v9;
}

+ (unsigned)scanLogs:(id)a3 from:(id)a4
{
  return +[OSALog scanLogs:from:options:](OSALog, "scanLogs:from:options:", a3, a4, 0);
}

+ (void)purgeLogs:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __20__OSALog_purgeLogs___block_invoke;
    v6[3] = &unk_1E4DEE1A8;
    v7 = v4;
    osa_scanDir(v5, 65, v6, 0);

  }
}

void __20__OSALog_purgeLogs___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  char v6;
  OSALog *v7;
  void *v8;
  OSALog *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("proxy"));

  if ((v6 & 1) == 0)
  {
    v7 = [OSALog alloc];
    objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v9 = -[OSALog initWithPath:options:error:](v7, "initWithPath:options:error:", v8, 0, &v24);
    v10 = v24;

    if (v9)
    {
      if (-[OSALog retire:](v9, "retire:", "opt-changed"))
      {
        v11 = v10;
LABEL_12:

        goto LABEL_13;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __20__OSALog_purgeLogs___block_invoke_cold_3(a2, v12, v13, v14, v15, v16, v17, v18);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __20__OSALog_purgeLogs___block_invoke_cold_2();
    }
    v19 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fileURLWithPath:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    v22 = OSASafeRemoveFileAtURL(v21, &v23);
    v11 = v23;

    if ((v22 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __20__OSALog_purgeLogs___block_invoke_cold_1();
    goto LABEL_12;
  }
LABEL_13:

}

+ (void)iterateLogsWithOptions:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  const char *v32;
  void *v33;
  id v34;
  id obj;
  char v36;
  id v37;
  _QWORD v38[5];
  char v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v37 = a4;
  v6 = (void *)MEMORY[0x1A85A7FC8]();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("override-filePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v9, "isWhitelisted:forDomain:", v8, CFSTR("transfer_paths"));

    if (v11)
    {
      objc_msgSend(v7, "addObject:", v8);
    }
    else
    {
      v36 = 0;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 138412290;
      v48 = v8;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "path is not whitelisted for listing: %@", buf, 0xCu);
    }
    v36 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("file-owner"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathSubmissionForOwner:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v7, "addObject:", v13);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("datavault-filePath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pathSubmissionDataVault");
      v17 = objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v7, "addObject:", v17);
        v13 = (void *)v17;
      }
      else
      {
        v13 = 0;
      }
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("include-proxies"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v18, "BOOLValue");

  }
LABEL_14:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exclude-retired"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "BOOLValue");

    if ((v20 & 1) != 0)
    {
      v21 = 68;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("only-retired"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      if (v23)
        v21 = 132;
      else
        v21 = 4;
    }
    v34 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("only-urgent"), v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    v45 = 0u;
    v43 = 0u;
    v44 = 0u;
    if (v25)
      v26 = v21 | 0x200;
    else
      v26 = v21;
    v42 = 0uLL;
    obj = v7;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v43;
      v30 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(obj);
          v32 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i)), "fileSystemRepresentation");
          v40[0] = v30;
          v40[1] = 3221225472;
          v40[2] = __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke;
          v40[3] = &unk_1E4DEE1D0;
          v41 = v37;
          v38[0] = v30;
          v38[1] = 3221225472;
          v38[2] = __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke_2;
          v38[3] = &__block_descriptor_41_e13_B24__0r_8r_16l;
          v38[4] = v26;
          v39 = v36;
          osa_scanDir(v32, v26, v40, v38);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v28);
    }

    v5 = v34;
    v8 = v33;
  }

  objc_autoreleasePoolPop(v6);
}

void __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPathComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v9);

}

uint64_t __44__OSALog_iterateLogsWithOptions_usingBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((*(_BYTE *)(a1 + 32) & 0x40) != 0 || (objc_msgSend(v2, "isEqualToString:", CFSTR("Retired")) & 1) == 0)
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("ProxiedDevice-"));
    else
      v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (void)createRetiredDirectory:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Creating Retired directory in %@", buf, 0xCu);
  }
  v4 = objc_retainAutorelease(v3);
  v5 = objc_msgSend(v4, "fileSystemRepresentation");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__OSALog_createRetiredDirectory___block_invoke;
  v7[3] = &unk_1E4DEE088;
  v8 = v4;
  v6 = v4;
  OSASafeOpenReadOnly(v5, v7);

}

void __33__OSALog_createRetiredDirectory___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  stat v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  memset(&v13, 0, sizeof(v13));
  if (fstat(a2, &v13))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __33__OSALog_createRetiredDirectory___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    v10 = 0;
  }
  else
  {
    v14 = CFSTR("file-owner-uid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13.st_uid);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[OSASystemConfiguration ensureUsablePath:component:options:](OSASystemConfiguration, "ensureUsablePath:component:options:", *(_QWORD *)(a1 + 32), CFSTR("Retired"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog markPurgeableLevel:path:](OSALog, "markPurgeableLevel:path:", 75780, v12);

}

- (NSDictionary)metaData
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)deleteOnRetire
{
  return self->_deleteOnRetire;
}

- (void)setDeleteOnRetire:(BOOL)a3
{
  self->_deleteOnRetire = a3;
}

- (NSString)bugType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOldFilePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)initWithPath:forRouting:usingConfig:options:error:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  uint8_t v2[22];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  v3 = v0;
  v4 = v1;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Log::initWithPath:'%@' forRouting:'%@' options:%@", v2, 0x20u);
  OUTLINED_FUNCTION_10_0();
}

- (void)rename:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Skipping rename of %{public}@ because the updated path is nil.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)markPurgeableLevel:(int)a3 path:.cold.1(void *a1, uint64_t *a2, int a3)
{
  uint64_t v5;
  int *v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v6 = __error();
  v7 = OUTLINED_FUNCTION_11(v6);
  v8 = *a2;
  v9 = 136315906;
  v10 = v5;
  v11 = 1024;
  v12 = a3;
  v13 = 2080;
  v14 = v7;
  v15 = 2048;
  v16 = v8;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable %d (%s) (flags 0x%11llx)", (uint8_t *)&v9, 0x26u);
}

+ (void)locallyCreateForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "locallyCreateForSubmission: Failed to create copy of data vaulted crash report with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)createForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Couldn't get XPC connection to %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)createForSubmission:metadata:options:error:writing:.cold.2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "(C6. report request completed successfully, but no filename returned!)", v0, 2u);
}

+ (void)createForSubmission:(uint64_t)a3 metadata:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 writing:(uint64_t)a7 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Invalid connection to %s. Caller may need sandbox exception.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__OSALog_createForSubmission_metadata_options_error_writing___block_invoke_cold_1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error while writing file: %{public}@", buf, 0xCu);

}

- (void)markWithKey:value:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "marking failed for %@, [%d] %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

+ (void)markFile:withKey:value:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  v0 = __error();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "marking failed for %@, [%d] %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

+ (void)markDescriptor:forKey:withObj:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "Unsupported ips/xattr type %@ for '%@'", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_10_0();
}

- (void)retire:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "Failed to remove retiring log '%{public}@': %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)retire:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "Error retiring '%{public}@': %{public}@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __17__OSALog_retire___block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  OUTLINED_FUNCTION_11(v0);
  __error();
  OUTLINED_FUNCTION_5(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "Error setting protection class after retiring %{public}@: %{public}s (%{public}i)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_15();
}

void __25__OSALog_cleanupForUser___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v2, "Failed to retrieve creation date from %{public}@: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_10_0();
}

void __20__OSALog_purgeLogs___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "Error deleting non-retirable log at %s while purging: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __20__OSALog_purgeLogs___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "Error creating log at %s while purging: %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __20__OSALog_purgeLogs___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Error retiring %s while purging logs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __33__OSALog_createRetiredDirectory___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Failed to stat %@ while creating Retired directory", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
