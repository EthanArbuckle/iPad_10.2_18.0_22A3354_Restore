@implementation PTTraceConfig

+ (id)configWithTemplate:(unint64_t)a3
{
  PTTraceConfig *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  _BYTE buffer[33];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(PTTraceConfig);
  -[PTTraceConfig setSymbolicate:](v4, "setSymbolicate:", 1);
  -[PTTraceConfig setCallstackSamplingRateMS:](v4, "setCallstackSamplingRateMS:", 1);
  -[PTTraceConfig setTraceType:](v4, "setTraceType:", 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTraceConfig setTraceDirectoryURL:](v4, "setTraceDirectoryURL:", v5);

  -[PTTraceConfig setTraceName:](v4, "setTraceName:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24D0ACC08, &unk_24D0ACC20, &unk_24D0ACC38, &unk_24D0ACC50, &unk_24D0ACC68, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTraceConfig setTraceGroups:](v4, "setTraceGroups:", v6);

  -[PTTraceConfig setCompressWhenFinished:](v4, "setCompressWhenFinished:", 1);
  -[PTTraceConfig setIncludeOSLogs:](v4, "setIncludeOSLogs:", 1);
  -[PTTraceConfig setIncludeOSSignposts:](v4, "setIncludeOSSignposts:", 1);
  -[PTTraceConfig setTraceTimeoutS:](v4, "setTraceTimeoutS:", 0);
  -[PTTraceConfig setUseTraceRecord:](v4, "setUseTraceRecord:", 0);
  -[PTTraceConfig setTraceDurationSecs:](v4, "setTraceDurationSecs:", 0);
  -[PTTraceConfig setSkipNotification:](v4, "setSkipNotification:", 0);
  -[PTTraceConfig setIncludeKernelStacks:](v4, "setIncludeKernelStacks:", 1);
  -[PTTraceConfig setEnableSwiftUITracing:](v4, "setEnableSwiftUITracing:", 0);
  -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", sysconf(57) << 6);
  if (-[PTTraceConfig kernelBufferSizeMB](v4, "kernelBufferSizeMB") <= 0x7F)
    -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", 128);
  if (-[PTTraceConfig kernelBufferSizeMB](v4, "kernelBufferSizeMB") >= 0x401)
    -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", 1024);
  -[PTTraceConfig setKernelBufferDrainQoS:](v4, "setKernelBufferDrainQoS:", 25);
  -[PTTraceConfig setKernelBufferDrainRateMS:](v4, "setKernelBufferDrainRateMS:", 500);
  if (a3 - 1 < 2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24D0ACC08, &unk_24D0ACC20, &unk_24D0ACC38, &unk_24D0ACC50, &unk_24D0ACC68, 0);
LABEL_9:
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setTraceGroups:](v4, "setTraceGroups:", v7);

    goto LABEL_12;
  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", &unk_24D0ACC80, &unk_24D0ACC20, &unk_24D0ACC68, 0, v20, v21);
    goto LABEL_9;
  }
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v8)
    +[PTTraceConfig configWithTemplate:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_12:
  -[PTTraceConfig setOwnerPID:](v4, "setOwnerPID:", getpid());
  proc_name(-[PTTraceConfig ownerPID](v4, "ownerPID"), buffer, 0x21u);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v16);

  -[PTTraceConfig ownerName](v4, "ownerName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v18);

  }
  -[PTTraceConfig setSource:](v4, "setSource:", 4);
  return v4;
}

+ (id)configWithDictionary:(id)a3
{
  id v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  char v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  char v108;
  void *v109;
  void *v110;
  void *v111;
  char v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t i;
  void *v120;
  void *v121;
  id v122;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("traceConfigurationDictionary is not a valid dictionary."));
  objc_msgSend(v3, "valueForKey:", CFSTR("traceTemplate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = 1;
    goto LABEL_10;
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceTemplate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("traceTemplate is not a string."));
  objc_msgSend(v3, "valueForKey:", CFSTR("traceTemplate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = traceConfigTemplateForString(v8);

  if (v9)
  {
    v10 = v9;
LABEL_10:
    +[PTTraceConfig configWithTemplate:](PTTraceConfig, "configWithTemplate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v12 = (void *)MEMORY[0x24BDBCE88];
  v13 = *v4;
  objc_msgSend(v3, "valueForKey:", CFSTR("traceTemplate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "raise:format:", v13, CFSTR("%@ is not a valid trace template."), v14);

  v11 = 0;
LABEL_12:
  objc_msgSend(v3, "valueForKey:", CFSTR("symbolicate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("symbolicate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("symbolicate"));
    objc_msgSend(v3, "valueForKey:", CFSTR("symbolicate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("symbolicate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedLongValue");

      if (v20 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("symbolicate"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("symbolicate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSymbolicate:", objc_msgSend(v21, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("callstackSamplingRateMS"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("callstackSamplingRateMS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v24 = objc_opt_isKindOfClass();

    if ((v24 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not an unsigned long type."), CFSTR("callstackSamplingRateMS"));
    objc_msgSend(v3, "valueForKey:", CFSTR("callstackSamplingRateMS"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCallstackSamplingRateMS:", objc_msgSend(v25, "unsignedLongValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceName"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("traceName"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a string type."), CFSTR("traceName"));
    objc_msgSend(v3, "valueForKey:", CFSTR("traceName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v11, "setTraceName:", v30);

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("compressWhenFinished"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("compressWhenFinished"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v33 = objc_opt_isKindOfClass();

    if ((v33 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("compressWhenFinished"));
    objc_msgSend(v3, "valueForKey:", CFSTR("compressWhenFinished"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("compressWhenFinished"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedLongValue");

      if (v36 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("compressWhenFinished"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("compressWhenFinished"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCompressWhenFinished:", objc_msgSend(v37, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("includeOSLogs"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("includeOSLogs"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = objc_opt_isKindOfClass();

    if ((v40 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("includeOSLogs"));
    objc_msgSend(v3, "valueForKey:", CFSTR("includeOSLogs"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("includeOSLogs"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "unsignedLongValue");

      if (v43 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("includeOSLogs"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("includeOSLogs"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIncludeOSLogs:", objc_msgSend(v44, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("includeOSSignposts"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("includeOSSignposts"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v47 = objc_opt_isKindOfClass();

    if ((v47 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("includeOSSignposts"));
    objc_msgSend(v3, "valueForKey:", CFSTR("includeOSSignposts"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("includeOSSignposts"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "unsignedLongValue");

      if (v50 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("includeOSSignposts"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("includeOSSignposts"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIncludeOSSignposts:", objc_msgSend(v51, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceTimeoutS"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("traceTimeoutS"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v54 = objc_opt_isKindOfClass();

    if ((v54 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not an unsigned long type."), CFSTR("traceTimeoutS"));
    objc_msgSend(v3, "valueForKey:", CFSTR("traceTimeoutS"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTraceTimeoutS:", objc_msgSend(v55, "unsignedLongValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("useTraceRecord"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("useTraceRecord"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v58 = objc_opt_isKindOfClass();

    if ((v58 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("useTraceRecord"));
    objc_msgSend(v3, "valueForKey:", CFSTR("useTraceRecord"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v59, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("useTraceRecord"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "unsignedLongValue");

      if (v61 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("useTraceRecord"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("useTraceRecord"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUseTraceRecord:", objc_msgSend(v62, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceDurationSecs"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("traceDurationSecs"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v65 = objc_opt_isKindOfClass();

    if ((v65 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not an unsigned long type."), CFSTR("traceDurationSecs"));
    objc_msgSend(v3, "valueForKey:", CFSTR("traceDurationSecs"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTraceDurationSecs:", objc_msgSend(v66, "unsignedLongValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("skipNotification"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("skipNotification"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v69 = objc_opt_isKindOfClass();

    if ((v69 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("skipNotification"));
    objc_msgSend(v3, "valueForKey:", CFSTR("skipNotification"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("skipNotification"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "unsignedLongValue");

      if (v72 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("skipNotification"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("skipNotification"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSkipNotification:", objc_msgSend(v73, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("includeKernelStacks"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("includeKernelStacks"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = objc_opt_isKindOfClass();

    if ((v76 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("includeKernelStacks"));
    objc_msgSend(v3, "valueForKey:", CFSTR("includeKernelStacks"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v77, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("includeKernelStacks"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "unsignedLongValue");

      if (v79 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("includeKernelStacks"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("includeKernelStacks"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIncludeKernelStacks:", objc_msgSend(v80, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferSizeMB"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  if (v81)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferSizeMB"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = objc_opt_isKindOfClass();

    if ((v83 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not an unsigned long type."), CFSTR("kernelBufferSizeMB"));
    objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferSizeMB"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKernelBufferSizeMB:", objc_msgSend(v84, "unsignedLongValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferDrainRateMS"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferDrainRateMS"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = objc_opt_isKindOfClass();

    if ((v87 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not an unsigned long type."), CFSTR("kernelBufferDrainRateMS"));
    objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferDrainRateMS"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKernelBufferDrainRateMS:", objc_msgSend(v88, "unsignedLongValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferDrainQoS"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferDrainQoS"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = objc_opt_isKindOfClass();

    if ((v91 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not an unsigned integer type."), CFSTR("kernelBufferDrainQoS"));
    objc_msgSend(v3, "valueForKey:", CFSTR("kernelBufferDrainQoS"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKernelBufferDrainQoS:", objc_msgSend(v92, "unsignedIntValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("enableSwiftUITracing"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (v93)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("enableSwiftUITracing"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v95 = objc_opt_isKindOfClass();

    if ((v95 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("enableSwiftUITracing"));
    objc_msgSend(v3, "valueForKey:", CFSTR("enableSwiftUITracing"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v96, "unsignedLongValue"))
    {
      objc_msgSend(v3, "valueForKey:", CFSTR("enableSwiftUITracing"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "unsignedLongValue");

      if (v98 != 1)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("%@ is not a BOOLean type."), CFSTR("enableSwiftUITracing"));
    }
    else
    {

    }
    objc_msgSend(v3, "valueForKey:", CFSTR("enableSwiftUITracing"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnableSwiftUITracing:", objc_msgSend(v99, "BOOLValue"));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceDirectoryURL"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("traceDirectoryURL"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v102 = objc_opt_isKindOfClass();

    if ((v102 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("traceDirectoryURL is not a string type."));
    v103 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "valueForKey:", CFSTR("traceDirectoryURL"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "fileURLWithPath:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTraceDirectoryURL:", v105);

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceType"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("traceType"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v108 = objc_opt_isKindOfClass();

    if ((v108 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("traceType is not a string type."));
    objc_msgSend(v3, "valueForKey:", CFSTR("traceType"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTraceType:", traceTypeForString(v109));

  }
  objc_msgSend(v3, "valueForKey:", CFSTR("traceGroups"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (v110)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("traceGroups"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v112 = objc_opt_isKindOfClass();

    if ((v112 & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *v4, CFSTR("traceGroups is not an NSArray type."));
    objc_msgSend(v3, "valueForKey:", CFSTR("traceGroups"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v115 = v113;
    v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v124, v128, 16);
    if (v116)
    {
      v117 = v116;
      v118 = *(_QWORD *)v125;
      do
      {
        for (i = 0; i != v117; ++i)
        {
          if (*(_QWORD *)v125 != v118)
            objc_enumerationMutation(v115);
          v120 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
          if (v120 && traceGroupForString(*(void **)(*((_QWORD *)&v124 + 1) + 8 * i)))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", traceGroupForString(v120));
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "addObject:", v121);

          }
        }
        v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v124, v128, 16);
      }
      while (v117);
    }

    if (objc_msgSend(v114, "count"))
      objc_msgSend(v11, "setTraceGroups:", v114);

  }
  objc_msgSend(v11, "setSource:", 4);
  v122 = v11;

  return v122;
}

+ (id)_defaultTraceRecordConfig
{
  PTTraceConfig *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE buffer[33];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(PTTraceConfig);
  -[PTTraceConfig setUseTraceRecord:](v2, "setUseTraceRecord:", 1);
  -[PTTraceConfig setTraceType:](v2, "setTraceType:", 1);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTraceConfig setTraceDirectoryURL:](v2, "setTraceDirectoryURL:", v3);

  -[PTTraceConfig setTraceName:](v2, "setTraceName:", 0);
  -[PTTraceConfig setSkipNotification:](v2, "setSkipNotification:", 0);
  -[PTTraceConfig setCompressWhenFinished:](v2, "setCompressWhenFinished:", 1);
  -[PTTraceConfig setKernelBufferSizeMB:](v2, "setKernelBufferSizeMB:", 0);
  -[PTTraceConfig setOverrideIncludeOSSignposts:](v2, "setOverrideIncludeOSSignposts:", 0);
  -[PTTraceConfig setOverrideIncludeOSLogs:](v2, "setOverrideIncludeOSLogs:", 0);
  -[PTTraceConfig setOverrideSymbolicate:](v2, "setOverrideSymbolicate:", 0);
  -[PTTraceConfig setOwnerPID:](v2, "setOwnerPID:", getpid());
  proc_name(-[PTTraceConfig ownerPID](v2, "ownerPID"), buffer, 0x21u);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTraceConfig setOwnerName:](v2, "setOwnerName:", v4);

  -[PTTraceConfig ownerName](v2, "ownerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setOwnerName:](v2, "setOwnerName:", v6);

  }
  return v2;
}

+ (id)configWithTracePlanName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  +[PTTraceConfig _defaultTraceRecordConfig](PTTraceConfig, "_defaultTraceRecordConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlanNameOrPath:", v3);

  return v4;
}

+ (id)configWithTracePlanURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PTTraceConfig _defaultTraceRecordConfig](PTTraceConfig, "_defaultTraceRecordConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPlanNameOrPath:", v5);
  return v4;
}

+ (id)getCurrentConfig
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  PTTraceConfig *v13;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Getting Current Config", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = objc_alloc_init(PTTraceConfig);
  objc_msgSend(*((id *)v9 + 5), "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*((id *)v9 + 5), "_initConnection");
  objc_msgSend(*((id *)v9 + 5), "_getRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__PTTraceConfig_getCurrentConfig__block_invoke;
  v7[3] = &unk_24D0AB240;
  v7[4] = buf;
  v7[5] = a1;
  objc_msgSend(v4, "getCurrentStoredConfig:", v7);

  objc_msgSend(*((id *)v9 + 5), "_invalidateSession");
  v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

void __33__PTTraceConfig_getCurrentConfig__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      __33__PTTraceConfig_getCurrentConfig__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    objc_msgSend(*(id *)(a1 + 40), "configWithTemplate:", 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  else
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setSource:", objc_msgSend(v7, "source"));
  }

}

+ (BOOL)resetConfig
{
  PTTraceConfig *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[8];
  uint8_t *v8;
  uint64_t v9;
  char v10;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Resetting config", buf, 2u);
  }
  v2 = objc_alloc_init(PTTraceConfig);
  -[PTTraceConfig connection](v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PTTraceConfig _initConnection](v2, "_initConnection");
  *(_QWORD *)buf = 0;
  v8 = buf;
  v9 = 0x2020000000;
  v10 = 0;
  -[PTTraceConfig _getRemoteObjectProxy](v2, "_getRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__PTTraceConfig_resetConfig__block_invoke;
  v6[3] = &unk_24D0AB268;
  v6[4] = buf;
  objc_msgSend(v4, "resetConfig:", v6);

  -[PTTraceConfig _invalidateSession](v2, "_invalidateSession");
  LOBYTE(v4) = v8[24];
  _Block_object_dispose(buf, 8);

  return (char)v4;
}

void __28__PTTraceConfig_resetConfig__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  if (v3)
  {
    v4 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v4)
      __28__PTTraceConfig_resetConfig__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Successfully reset config.", v12, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (BOOL)storeConfig
{
  void *v3;
  void *v4;
  uint8_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  char v11;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Storing config", buf, 2u);
  }
  -[PTTraceConfig connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PTTraceConfig _initConnection](self, "_initConnection");
  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x2020000000;
  v11 = 0;
  -[PTTraceConfig _getRemoteObjectProxy](self, "_getRemoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__PTTraceConfig_storeConfig__block_invoke;
  v7[3] = &unk_24D0AB268;
  v7[4] = buf;
  objc_msgSend(v4, "applyConfig:withError:", self, v7);

  -[PTTraceConfig _invalidateSession](self, "_invalidateSession");
  v5 = v9[24];
  _Block_object_dispose(buf, 8);
  return v5;
}

void __28__PTTraceConfig_storeConfig__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __28__PTTraceConfig_storeConfig__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

- (BOOL)validateConfig
{
  -[PTTraceConfig _invalidateSession](self, "_invalidateSession");
  return 1;
}

- (void)_initConnection
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.PerformanceTrace.PerformanceTraceService"));
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D18968);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v3);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_117);
  -[PTTraceConfig setConnection:](self, "setConnection:", v5);
  -[PTTraceConfig connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

}

void __32__PTTraceConfig__initConnection__block_invoke()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_213A76000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "XPC connection invalidated.", v0, 2u);
  }
}

void __32__PTTraceConfig__initConnection__block_invoke_116()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v0)
    __32__PTTraceConfig__initConnection__block_invoke_116_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

- (id)_getRemoteObjectProxy
{
  void *v2;
  void *v3;

  -[PTTraceConfig connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_118);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __38__PTTraceConfig__getRemoteObjectProxy__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __38__PTTraceConfig__getRemoteObjectProxy__block_invoke_cold_1(a2, v3, v4, v5, v6, v7, v8, v9);
}

- (void)_invalidateSession
{
  void *v3;
  id v4;

  -[PTTraceConfig connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PTTraceConfig connection](self, "connection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PTTraceConfig)initWithCoder:(id)a3
{
  id v4;
  PTTraceConfig *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = -[PTTraceConfig init](self, "init");
  if (v5)
  {
    -[PTTraceConfig setSymbolicate:](v5, "setSymbolicate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("symbolicate")));
    -[PTTraceConfig setCallstackSamplingRateMS:](v5, "setCallstackSamplingRateMS:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("callstackSamplingRateMS")));
    v6 = (void *)MEMORY[0x24BDBCEB8];
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("traceGroups"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setTraceGroups:](v5, "setTraceGroups:", v11);

    -[PTTraceConfig setTraceType:](v5, "setTraceType:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("traceType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traceDirectoryURL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setTraceDirectoryURL:](v5, "setTraceDirectoryURL:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traceName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setTraceName:](v5, "setTraceName:", v13);

    -[PTTraceConfig setCompressWhenFinished:](v5, "setCompressWhenFinished:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("compressWhenFinished")));
    -[PTTraceConfig setIncludeOSLogs:](v5, "setIncludeOSLogs:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeOSLogs")));
    -[PTTraceConfig setIncludeOSSignposts:](v5, "setIncludeOSSignposts:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeOSSignposts")));
    -[PTTraceConfig setTraceTimeoutS:](v5, "setTraceTimeoutS:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("traceTimeoutS")));
    -[PTTraceConfig setSkipNotification:](v5, "setSkipNotification:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipNotification")));
    -[PTTraceConfig setIncludeKernelStacks:](v5, "setIncludeKernelStacks:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeKernelStacks")));
    -[PTTraceConfig setKernelBufferSizeMB:](v5, "setKernelBufferSizeMB:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("kernelBufferSizeMB")));
    -[PTTraceConfig setKernelBufferDrainQoS:](v5, "setKernelBufferDrainQoS:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("kernelBufferDrainQoS")));
    -[PTTraceConfig setKernelBufferDrainRateMS:](v5, "setKernelBufferDrainRateMS:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("kernelBufferDrainRateMS")));
    -[PTTraceConfig setOwnerPID:](v5, "setOwnerPID:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("ownerPID")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setOwnerName:](v5, "setOwnerName:", v14);

    -[PTTraceConfig setSource:](v5, "setSource:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("source")));
    -[PTTraceConfig setTraceDurationSecs:](v5, "setTraceDurationSecs:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("traceDurationSecs")));
    -[PTTraceConfig setUseTraceRecord:](v5, "setUseTraceRecord:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useTraceRecord")));
    -[PTTraceConfig setEnableSwiftUITracing:](v5, "setEnableSwiftUITracing:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableSwiftUITracing")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planNameOrPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setPlanNameOrPath:](v5, "setPlanNameOrPath:", v15);

    -[PTTraceConfig setOverrideSymbolicate:](v5, "setOverrideSymbolicate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideSymbolicate")));
    -[PTTraceConfig setOverrideIncludeOSSignposts:](v5, "setOverrideIncludeOSSignposts:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideIncludeOSSignposts")));
    -[PTTraceConfig setOverrideIncludeOSLogs:](v5, "setOverrideIncludeOSLogs:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overrideIncludeOSLogs")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig symbolicate](self, "symbolicate"), CFSTR("symbolicate"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig callstackSamplingRateMS](self, "callstackSamplingRateMS"), CFSTR("callstackSamplingRateMS"));
  -[PTTraceConfig traceGroups](self, "traceGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("traceGroups"));

  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceType](self, "traceType"), CFSTR("traceType"));
  -[PTTraceConfig traceDirectoryURL](self, "traceDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("traceDirectoryURL"));

  -[PTTraceConfig traceName](self, "traceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("traceName"));

  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig compressWhenFinished](self, "compressWhenFinished"), CFSTR("compressWhenFinished"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeOSLogs](self, "includeOSLogs"), CFSTR("includeOSLogs"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeOSSignposts](self, "includeOSSignposts"), CFSTR("includeOSSignposts"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceTimeoutS](self, "traceTimeoutS"), CFSTR("traceTimeoutS"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig skipNotification](self, "skipNotification"), CFSTR("skipNotification"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeKernelStacks](self, "includeKernelStacks"), CFSTR("includeKernelStacks"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig kernelBufferSizeMB](self, "kernelBufferSizeMB"), CFSTR("kernelBufferSizeMB"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig kernelBufferDrainQoS](self, "kernelBufferDrainQoS"), CFSTR("kernelBufferDrainQoS"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig kernelBufferDrainRateMS](self, "kernelBufferDrainRateMS"), CFSTR("kernelBufferDrainRateMS"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig ownerPID](self, "ownerPID"), CFSTR("ownerPID"));
  -[PTTraceConfig ownerName](self, "ownerName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("ownerName"));

  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig source](self, "source"), CFSTR("source"));
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceDurationSecs](self, "traceDurationSecs"), CFSTR("traceDurationSecs"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig useTraceRecord](self, "useTraceRecord"), CFSTR("useTraceRecord"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig enableSwiftUITracing](self, "enableSwiftUITracing"), CFSTR("enableSwiftUITracing"));
  -[PTTraceConfig planNameOrPath](self, "planNameOrPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("planNameOrPath"));

  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig overrideSymbolicate](self, "overrideSymbolicate"), CFSTR("overrideSymbolicate"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig overrideIncludeOSSignposts](self, "overrideIncludeOSSignposts"), CFSTR("overrideIncludeOSSignposts"));
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig overrideIncludeOSLogs](self, "overrideIncludeOSLogs"), CFSTR("overrideIncludeOSLogs"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PTTraceConfig *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE buffer[33];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(PTTraceConfig);
  -[PTTraceConfig setSymbolicate:](v4, "setSymbolicate:", -[PTTraceConfig symbolicate](self, "symbolicate"));
  -[PTTraceConfig setCallstackSamplingRateMS:](v4, "setCallstackSamplingRateMS:", -[PTTraceConfig callstackSamplingRateMS](self, "callstackSamplingRateMS"));
  -[PTTraceConfig traceGroups](self, "traceGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[PTTraceConfig setTraceGroups:](v4, "setTraceGroups:", v6);

  -[PTTraceConfig setTraceType:](v4, "setTraceType:", -[PTTraceConfig traceType](self, "traceType"));
  -[PTTraceConfig traceDirectoryURL](self, "traceDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[PTTraceConfig setTraceDirectoryURL:](v4, "setTraceDirectoryURL:", v8);

  -[PTTraceConfig traceName](self, "traceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[PTTraceConfig setTraceName:](v4, "setTraceName:", v10);

  -[PTTraceConfig setCompressWhenFinished:](v4, "setCompressWhenFinished:", -[PTTraceConfig compressWhenFinished](self, "compressWhenFinished"));
  -[PTTraceConfig setIncludeOSLogs:](v4, "setIncludeOSLogs:", -[PTTraceConfig includeOSLogs](self, "includeOSLogs"));
  -[PTTraceConfig setIncludeOSSignposts:](v4, "setIncludeOSSignposts:", -[PTTraceConfig includeOSSignposts](self, "includeOSSignposts"));
  -[PTTraceConfig setTraceTimeoutS:](v4, "setTraceTimeoutS:", -[PTTraceConfig traceTimeoutS](self, "traceTimeoutS"));
  -[PTTraceConfig setSkipNotification:](v4, "setSkipNotification:", -[PTTraceConfig skipNotification](self, "skipNotification"));
  -[PTTraceConfig setIncludeKernelStacks:](v4, "setIncludeKernelStacks:", -[PTTraceConfig includeKernelStacks](self, "includeKernelStacks"));
  -[PTTraceConfig setKernelBufferSizeMB:](v4, "setKernelBufferSizeMB:", -[PTTraceConfig kernelBufferSizeMB](self, "kernelBufferSizeMB"));
  -[PTTraceConfig setKernelBufferDrainQoS:](v4, "setKernelBufferDrainQoS:", -[PTTraceConfig kernelBufferDrainQoS](self, "kernelBufferDrainQoS"));
  -[PTTraceConfig setKernelBufferDrainRateMS:](v4, "setKernelBufferDrainRateMS:", -[PTTraceConfig kernelBufferDrainRateMS](self, "kernelBufferDrainRateMS"));
  -[PTTraceConfig setUseTraceRecord:](v4, "setUseTraceRecord:", -[PTTraceConfig useTraceRecord](self, "useTraceRecord"));
  -[PTTraceConfig setEnableSwiftUITracing:](v4, "setEnableSwiftUITracing:", -[PTTraceConfig enableSwiftUITracing](self, "enableSwiftUITracing"));
  -[PTTraceConfig setOwnerPID:](v4, "setOwnerPID:", getpid());
  proc_name(-[PTTraceConfig ownerPID](v4, "ownerPID"), buffer, 0x21u);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v11);

  -[PTTraceConfig ownerName](v4, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", buffer, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTraceConfig setOwnerName:](v4, "setOwnerName:", v13);

  }
  -[PTTraceConfig setSource:](v4, "setSource:", 4);
  return v4;
}

- (void)setIncludeOSSignposts:(BOOL)a3
{
  self->_includeOSSignposts = a3;
  self->_overrideIncludeOSSignposts = 1;
}

- (void)setIncludeOSLogs:(BOOL)a3
{
  self->_includeOSLogs = a3;
  self->_overrideIncludeOSLogs = 1;
}

- (void)setSymbolicate:(BOOL)a3
{
  self->_symbolicate = a3;
  self->_overrideSymbolicate = 1;
}

- (BOOL)symbolicate
{
  return self->_symbolicate;
}

- (unint64_t)callstackSamplingRateMS
{
  return self->_callstackSamplingRateMS;
}

- (void)setCallstackSamplingRateMS:(unint64_t)a3
{
  self->_callstackSamplingRateMS = a3;
}

- (NSMutableArray)traceGroups
{
  return self->_traceGroups;
}

- (void)setTraceGroups:(id)a3
{
  objc_storeStrong((id *)&self->_traceGroups, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)traceType
{
  return self->_traceType;
}

- (void)setTraceType:(unint64_t)a3
{
  self->_traceType = a3;
}

- (NSURL)traceDirectoryURL
{
  return self->_traceDirectoryURL;
}

- (void)setTraceDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_traceDirectoryURL, a3);
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
  objc_storeStrong((id *)&self->_traceName, a3);
}

- (int)ownerPID
{
  return self->_ownerPID;
}

- (void)setOwnerPID:(int)a3
{
  self->_ownerPID = a3;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
  objc_storeStrong((id *)&self->_ownerName, a3);
}

- (BOOL)compressWhenFinished
{
  return self->_compressWhenFinished;
}

- (void)setCompressWhenFinished:(BOOL)a3
{
  self->_compressWhenFinished = a3;
}

- (BOOL)includeOSLogs
{
  return self->_includeOSLogs;
}

- (BOOL)includeOSSignposts
{
  return self->_includeOSSignposts;
}

- (unint64_t)traceTimeoutS
{
  return self->_traceTimeoutS;
}

- (void)setTraceTimeoutS:(unint64_t)a3
{
  self->_traceTimeoutS = a3;
}

- (unint64_t)traceDurationSecs
{
  return self->_traceDurationSecs;
}

- (void)setTraceDurationSecs:(unint64_t)a3
{
  self->_traceDurationSecs = a3;
}

- (BOOL)skipNotification
{
  return self->_skipNotification;
}

- (void)setSkipNotification:(BOOL)a3
{
  self->_skipNotification = a3;
}

- (BOOL)useTraceRecord
{
  return self->_useTraceRecord;
}

- (void)setUseTraceRecord:(BOOL)a3
{
  self->_useTraceRecord = a3;
}

- (BOOL)includeKernelStacks
{
  return self->_includeKernelStacks;
}

- (void)setIncludeKernelStacks:(BOOL)a3
{
  self->_includeKernelStacks = a3;
}

- (unint64_t)kernelBufferSizeMB
{
  return self->_kernelBufferSizeMB;
}

- (void)setKernelBufferSizeMB:(unint64_t)a3
{
  self->_kernelBufferSizeMB = a3;
}

- (unsigned)kernelBufferDrainQoS
{
  return self->_kernelBufferDrainQoS;
}

- (void)setKernelBufferDrainQoS:(unsigned int)a3
{
  self->_kernelBufferDrainQoS = a3;
}

- (unint64_t)kernelBufferDrainRateMS
{
  return self->_kernelBufferDrainRateMS;
}

- (void)setKernelBufferDrainRateMS:(unint64_t)a3
{
  self->_kernelBufferDrainRateMS = a3;
}

- (BOOL)enableSwiftUITracing
{
  return self->_enableSwiftUITracing;
}

- (void)setEnableSwiftUITracing:(BOOL)a3
{
  self->_enableSwiftUITracing = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSString)planNameOrPath
{
  return self->_planNameOrPath;
}

- (void)setPlanNameOrPath:(id)a3
{
  objc_storeStrong((id *)&self->_planNameOrPath, a3);
}

- (BOOL)overrideIncludeOSSignposts
{
  return self->_overrideIncludeOSSignposts;
}

- (void)setOverrideIncludeOSSignposts:(BOOL)a3
{
  self->_overrideIncludeOSSignposts = a3;
}

- (BOOL)overrideIncludeOSLogs
{
  return self->_overrideIncludeOSLogs;
}

- (void)setOverrideIncludeOSLogs:(BOOL)a3
{
  self->_overrideIncludeOSLogs = a3;
}

- (BOOL)overrideSymbolicate
{
  return self->_overrideSymbolicate;
}

- (void)setOverrideSymbolicate:(BOOL)a3
{
  self->_overrideSymbolicate = a3;
}

- (OS_os_transaction)tracingActiveTransaction
{
  return self->_tracingActiveTransaction;
}

- (void)setTracingActiveTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_tracingActiveTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracingActiveTransaction, 0);
  objc_storeStrong((id *)&self->_planNameOrPath, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_traceDirectoryURL, 0);
  objc_storeStrong((id *)&self->_traceGroups, 0);
}

+ (void)configWithTemplate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213A76000, MEMORY[0x24BDACB70], a3, "Unknown Trace Template Type.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __33__PTTraceConfig_getCurrentConfig__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213A76000, MEMORY[0x24BDACB70], a3, "Unable to get current configuration. Returning default.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __28__PTTraceConfig_resetConfig__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213A76000, MEMORY[0x24BDACB70], a3, "An error occurred resetting config.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __28__PTTraceConfig_storeConfig__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_213A76000, MEMORY[0x24BDACB70], a3, "An error occurred storing config: %{public}@", a5, a6, a7, a8, 2u);
}

void __32__PTTraceConfig__initConnection__block_invoke_116_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213A76000, MEMORY[0x24BDACB70], a3, "XPC connection interrupted.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __38__PTTraceConfig__getRemoteObjectProxy__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_213A76000, MEMORY[0x24BDACB70], a3, "Failed to connect to the service protocol: %{public}@", a5, a6, a7, a8, 2u);
}

@end
