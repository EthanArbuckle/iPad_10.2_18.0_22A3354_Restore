@implementation SAVolumeSizer

+ (BOOL)isInternalVolume:(id)a3
{
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  BOOL v12;
  io_registry_entry_t v14;
  io_object_t v15;
  const __CFDictionary *v16;
  CFTypeID TypeID;
  const __CFString *Value;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  io_iterator_t existing;
  statfs v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  existing = 0;
  bzero(&v23, 0x878uLL);
  v4 = objc_retainAutorelease(v3);
  if (!statfs((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v23))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), v23.f_mntfromname);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("/dev/"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = *MEMORY[0x24BDD8B18];
    v6 = objc_retainAutorelease(v9);
    v10 = IOBSDNameMatching((mach_port_t)v8, 0, (const char *)-[NSObject UTF8String](v6, "UTF8String"));
    if (IOServiceGetMatchingServices((mach_port_t)v8, v10, &existing))
    {
      SALog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[SAVolumeSizer isInternalVolume:].cold.3();

      goto LABEL_8;
    }
    v14 = IOIteratorNext(existing);
    if (!v14)
    {
      SALog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[SAVolumeSizer isInternalVolume:].cold.1();

      v12 = 0;
      goto LABEL_25;
    }
    v15 = v14;
    v16 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v14, "IOService", CFSTR("Protocol Characteristics"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
    if (v16 && (TypeID = CFDictionaryGetTypeID(), TypeID == CFGetTypeID(v16)))
    {
      Value = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("Physical Interconnect Location"));
      if (Value)
        v19 = CFStringCompare(Value, CFSTR("Internal"), 0) == kCFCompareEqualTo;
      else
        v19 = 0;
    }
    else
    {
      SALog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[SAVolumeSizer isInternalVolume:].cold.2();

      v19 = 0;
      v12 = 0;
      if (!v16)
        goto LABEL_24;
    }
    CFRelease(v16);
    v12 = v19;
LABEL_24:
    IOObjectRelease(v15);
LABEL_25:
    IOObjectRelease(existing);
    goto LABEL_9;
  }
  v5 = *__error();
  SALog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    +[SAVolumeSizer isInternalVolume:].cold.4(v4, v5, v6);
LABEL_8:
  v12 = 0;
LABEL_9:

  return v12;
}

+ (void)computeSizeOfVolumeAtURL:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t, uint64_t);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  dispatch_time_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, uint64_t))a5;
  if (+[SAVolumeSizer isInternalVolume:](SAVolumeSizer, "isInternalVolume:", v7))
  {
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 1;
    v9 = (void *)objc_opt_new();
    v62 = 0;
    v63 = &v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy_;
    v66 = __Block_byref_object_dispose_;
    v67 = 0;
    v10 = MEMORY[0x24BDAC760];
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke;
    v59[3] = &unk_2518F3618;
    v61 = &v62;
    v11 = v9;
    v60 = v11;
    v12 = +[SADaemonXPC newWithInvalidationHandler:](SADaemonXPC, "newWithInvalidationHandler:", v59);
    v13 = (void *)v63[5];
    v63[5] = (uint64_t)v12;

    v14 = (void *)v63[5];
    v56[0] = v10;
    v56[1] = 3221225472;
    v56[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_42;
    v56[3] = &unk_2518F3618;
    v58 = &v62;
    v15 = v11;
    v57 = v15;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v56);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 0;
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    objc_msgSend(v15, "enter");
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_43;
    v35[3] = &unk_2518F3640;
    v37 = &v52;
    v38 = &v48;
    v39 = &v42;
    v40 = &v68;
    v17 = v15;
    v36 = v17;
    objc_msgSend(v16, "computeSizeOfVolumeAtURL:options:completionHandler:", v7, a4, v35);
    objc_msgSend(v17, "wait:", dispatch_time(0, 60000000000));
    if ((a4 & 3) != 0)
    {
      *((_BYTE *)v69 + 24) = 1;
      objc_msgSend(v17, "enter");
      v26 = MEMORY[0x24BDAC760];
      v27 = 3221225472;
      v28 = __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2;
      v29 = &unk_2518F3668;
      v31 = v41;
      v32 = &v52;
      v33 = &v42;
      v34 = &v68;
      v18 = v17;
      v30 = v18;
      objc_msgSend(v16, "getPurgeableInfo:options:reply:", v7, a4, &v26);
      v19 = dispatch_time(0, 60000000000);
      objc_msgSend(v18, "wait:", v19, v26, v27, v28, v29);

    }
    if (*((_BYTE *)v69 + 24))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 60, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v43[5];
      v43[5] = v20;

    }
    objc_msgSend((id)v63[5], "invalidate");
    v8[2](v8, v53[3], v49[3], v43[5]);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v68, 8);
  }
  else
  {
    SALog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[SAVolumeSizer computeSizeOfVolumeAtURL:options:completionHandler:].cold.1(v7);

    v23 = (void *)MEMORY[0x24BDD1540];
    v72 = *MEMORY[0x24BDD0FD8];
    v73[0] = CFSTR("Non internal URL");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, 0, (uint64_t)v25);

  }
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_cold_1(v3);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "leave");

}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  SALog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_42_cold_1(v3);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "leave");

}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "rawUsed");
  v7 = objc_msgSend(v6, "capacity");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "leave");

}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  NSObject *v15;
  NSObject *v16;

  v6 = a3;
  v7 = v6;
  if (!a2 || v6)
  {
    SALog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_3(v7);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    v8 = 0;
  }
  else
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SALog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_2((uint64_t)v8, v9);

    if (objc_msgSend(v8, "unsignedLongLongValue"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "longLongValue");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(_QWORD *)(v10 + 24);
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v13 = v11 >= v12;
      v14 = v11 - v12;
      if (v13)
      {
        *(_QWORD *)(v10 + 24) = v14;
      }
      else
      {
        SALog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_1(a1 + 40, a1 + 48, v15);

      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "leave");

}

+ (void)computeSizeOfVolumeAtURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    SALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:].cold.1(v8, v9, v10);
    goto LABEL_8;
  }
  if (!v6)
  {
    SALog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:].cold.2(v8, v11, v12);
LABEL_8:

    goto LABEL_9;
  }
  +[SAVolumeSizer computeSizeOfVolumeAtURL:options:completionHandler:](SAVolumeSizer, "computeSizeOfVolumeAtURL:options:completionHandler:", v5, 1, v6);
LABEL_9:

}

+ (void)isInternalVolume:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v1, "%s: Empty iterator, couldn't decide if device (%@) is internal or not", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)isInternalVolume:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v1, "%s: No 'Protocol Characteristics' found, couldn't decide if device (%@) is internal or not", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)isInternalVolume:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_2478E3000, v0, v1, "%s: Can't find BSD name (%@) on ioreg", (uint8_t *)v2);
  OUTLINED_FUNCTION_3();
}

+ (void)isInternalVolume:(NSObject *)a3 .cold.4(void *a1, int a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 136315650;
  v6 = "+[SAVolumeSizer isInternalVolume:]";
  v7 = 2080;
  v8 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v9 = 1024;
  v10 = a2;
  _os_log_error_impl(&dword_2478E3000, a3, OS_LOG_TYPE_ERROR, "%s: Can't get f_mntfromname field on volume of %s, statfs returned %d", (uint8_t *)&v5, 0x1Cu);
}

+ (void)computeSizeOfVolumeAtURL:(void *)a1 options:completionHandler:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2478E3000, v2, v3, "Can't compute size of volume, given volume URL (%@) isn't internal.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2478E3000, v2, v3, "SADaemonXPC connection invalidated, purgeable size is set to 0: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_42_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2478E3000, v2, v3, "Failed to get proxy object %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 24);
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  OUTLINED_FUNCTION_4(&dword_2478E3000, a3, (uint64_t)a3, "Purgeable size %llu is larger than used size %llu, ignoring", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3();
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 136315650;
  v3 = "+[SAVolumeSizer computeSizeOfVolumeAtURL:options:completionHandler:]_block_invoke_2";
  v4 = 2112;
  v5 = CFSTR("/private/var");
  v6 = 2112;
  v7 = a1;
  _os_log_debug_impl(&dword_2478E3000, a2, OS_LOG_TYPE_DEBUG, "%s: Volume %@, CACHE_DELETE_TOTAL_AVAILABLE %@", (uint8_t *)&v2, 0x20u);
}

void __68__SAVolumeSizer_computeSizeOfVolumeAtURL_options_completionHandler___block_invoke_2_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2478E3000, v2, v3, "Unable to get CACHE_DELETE_TOTAL_AVAILABLE, purgeable size is set to 0: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

+ (void)computeSizeOfVolumeAtURL:(uint64_t)a3 completionHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "+[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:]";
  OUTLINED_FUNCTION_1(&dword_2478E3000, a1, a3, "%s: url is nil", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

+ (void)computeSizeOfVolumeAtURL:(uint64_t)a3 completionHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "+[SAVolumeSizer computeSizeOfVolumeAtURL:completionHandler:]";
  OUTLINED_FUNCTION_1(&dword_2478E3000, a1, a3, "%s: completionHandler is nil", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

@end
