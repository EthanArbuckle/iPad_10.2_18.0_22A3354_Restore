DYGTMTLDeviceProfile *newProfileWithMTLDevice(void *a1)
{
  id v1;
  DYGTMTLDeviceProfile *v2;
  void *v3;
  void *v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  size_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  id v23;
  DYGTMTLDeviceProfile *v25;

  v1 = a1;
  v2 = objc_alloc_init(DYGTMTLDeviceProfile);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "name"));
  -[DYGTMTLDeviceProfile setName:](v2, "setName:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 17));
  for (i = 0; i != 17; ++i)
  {
    v6 = qword_100027900[i];
    if (objc_msgSend(v1, "supportsFeatureSet:", v6))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6));
      objc_msgSend(v4, "addObject:", v7);

    }
  }
  v8 = objc_msgSend(v4, "copy");
  v25 = v2;
  -[DYGTMTLDeviceProfile setSupportedFeatureSets:](v2, "setSupportedFeatureSets:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (objc_msgSend(v1, "areProgrammableSamplePositionsSupported")
    && objc_msgSend(v1, "maxCustomSamplePositions"))
  {
    v10 = 1;
    do
    {
      if (objc_msgSend(v1, "supportsTextureSampleCount:", v10))
      {
        v11 = (char *)malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
        objc_msgSend(v1, "getDefaultSamplePositions:count:", v11, v10);
        v12 = objc_alloc_init((Class)NSMutableArray);
        v13 = 0;
        do
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPoint:](NSValue, "valueWithPoint:", vcvtq_f64_f32(*(float32x2_t *)&v11[8 * v13])));
          objc_msgSend(v12, "addObject:", v14);

          ++v13;
        }
        while (v10 != v13);
        free(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v12));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v10));
        objc_msgSend(v9, "setObject:forKey:", v15, v16);

      }
    }
    while ((unint64_t)objc_msgSend(v1, "maxCustomSamplePositions") > v10++);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
  -[DYGTMTLDeviceProfile setDefaultSamplePositions:](v25, "setDefaultSamplePositions:", v18);

  if ((objc_opt_respondsToSelector(v1, "supportsFamily:") & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 12));
    for (j = 0; j != 12; ++j)
    {
      v21 = qword_100027988[j];
      if (objc_msgSend(v1, "supportsFamily:", v21))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21));
        objc_msgSend(v19, "addObject:", v22);

      }
    }
    v23 = objc_msgSend(v19, "copy");
    -[DYGTMTLDeviceProfile setSupportedGPUFamilies:](v25, "setSupportedGPUFamilies:", v23);

  }
  return v25;
}

id DaemonDeviceCapabilities(void *a1)
{
  id v1;
  id v2;
  DYGTMTLDeviceProfile *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  CFArrayRef v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  void *values[2];
  __int128 v17;
  const __CFString *v18;

  v1 = a1;
  v2 = MTLCreateSystemDefaultDevice();
  v3 = newProfileWithMTLDevice(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/Frameworks/Metal.framework")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v5));

  if (v6)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForInfoDictionaryKey:", kCFBundleVersionKey));

  }
  else
  {
    v7 = &stru_100031038;
  }

  *(_OWORD *)values = *(_OWORD *)off_100030850;
  v17 = *(_OWORD *)off_100030860;
  v18 = CFSTR("main-screen-scale");
  v8 = CFArrayCreate(0, (const void **)values, 5, &kCFTypeArrayCallBacks);
  v9 = (void *)MGCopyMultipleAnswers(v8, 0);
  CFRelease(v8);
  v13 = v4;
  v14[0] = CFSTR("gputools.contexts-info");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v15[0] = v10;
  v15[1] = v9;
  v14[1] = CFSTR("screen-dimensions");
  v14[2] = CFSTR("metal_version");
  v14[3] = CFSTR("nativePointerSize");
  v15[2] = v7;
  v15[3] = &off_1000334F8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));

  return v11;
}

_UNKNOWN **GPUToolsVersionQuery()
{
  return &off_100033570;
}

id modifyReplayerEnvironment(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "removeObjectsForKeys:", &off_100033598);
  objc_msgSend(v1, "removeObjectForKey:", CFSTR("METAL_DEVICE_WRAPPER_TYPE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dictionaryForKey:", CFSTR("GPUDebugger.ReplayerEnvironment")));

  if (v3)
    objc_msgSend(v1, "addEntriesFromDictionary:", v3);
  v4 = objc_msgSend(v1, "copy");

  return v4;
}

id DaemonCreateGuestAppTransport(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_29;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("environment")));
  if (v3)
  {
    v4 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    {
LABEL_28:

LABEL_29:
      v23 = 0;
      goto LABEL_30;
    }
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v52;
LABEL_6:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v9);
        v11 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
          goto LABEL_27;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        v13 = objc_opt_class(NSString);
        isKindOfClass = objc_opt_isKindOfClass(v12, v13);

        if ((isKindOfClass & 1) == 0)
          goto LABEL_27;
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          if (v7)
            goto LABEL_6;
          break;
        }
      }
    }

  }
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("platformPrefix")));
  if (v5)
  {
    v15 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v5, v15) & 1) == 0)
    {
LABEL_27:

      goto LABEL_28;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadCapture")));
  if (v16)
  {
    v17 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
    {
LABEL_26:

      goto LABEL_27;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadReplayer")));
  if (v18)
  {
    v19 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
    {
LABEL_25:

      goto LABEL_26;
    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadDiagnostics")));
  if (v20)
  {
    v21 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
    {

      goto LABEL_25;
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("environment")));
  v23 = v22;
  if (v22)
    v24 = objc_msgSend(v22, "mutableCopy");
  else
    v24 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 2);
  v26 = v24;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("DYLD_INSERT_LIBRARIES")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsSeparatedByString:", CFSTR(":")));
  v29 = v28;
  if (v28)
    v30 = objc_msgSend(v28, "mutableCopy");
  else
    v30 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v31 = v30;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("platformPrefix")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("GPUTOOLS_EXTRA_PLUGIN_PATHS")));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadReplayer")));
  if (!v34)
    goto LABEL_37;
  v35 = (void *)v34;
  v50 = v31;
  v36 = v29;
  v37 = v26;
  v38 = v27;
  v39 = v33;
  v40 = v32;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadCapture")));
  v42 = objc_msgSend(v41, "BOOLValue");

  v32 = v40;
  v33 = v39;
  v27 = v38;
  v26 = v37;
  v29 = v36;
  v31 = v50;

  if (v42)
  {
LABEL_37:
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/"), "stringByAppendingPathComponent:", CFSTR("GPUToolsCapture.framework/GPUToolsCapture")));
    if ((objc_msgSend(v31, "containsObject:", v43) & 1) == 0)
      objc_msgSend(v31, "addObject:", v43);
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v43, CFSTR("DYMTL_TOOLS_DYLIB_PATH"));

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("shouldLoadDiagnostics")));
  v45 = objc_msgSend(v44, "BOOLValue");

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/"), "stringByAppendingPathComponent:", CFSTR("GPUToolsDiagnostics.framework/GPUToolsDiagnostics")));
    if ((objc_msgSend(v31, "containsObject:", v46) & 1) == 0)
      objc_msgSend(v31, "addObject:", v46);

  }
  v47 = objc_msgSend(v29, "count");
  if (v47 != objc_msgSend(v31, "count"))
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", CFSTR(":")));
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v48, CFSTR("DYLD_INSERT_LIBRARIES"));

    v49 = objc_msgSend(v26, "copy");
    v23 = v49;
  }

LABEL_30:
  return v23;
}

__CFString *GTTransportArchiveDirectory()
{
  void *v0;
  unsigned __int8 v1;
  __CFString *v2;
  NSString *v3;
  void *v4;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v1 = objc_msgSend(v0, "isiOSAppOnMac");

  if ((v1 & 1) != 0)
  {
    v2 = CFSTR("/tmp/com.apple.GPUToolsAgent");
  }
  else
  {
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", getpwnam("mobile")->pw_dir);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Library/GPUTools")));

  }
  return v2;
}

void sub_100003038(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Malformed message: missing selector", v1, 2u);
}

uint64_t GTTransportEnvironment_init()
{
  uint64_t result;

  GT_TRANSPORT_ENV = sub_1000030DC("MTLTRANSPORT_REPLAY_MAX_RECORD_REQUEST", 64);
  qword_10003DCF0 = qword_10003DCF0 & 0xFFFFFFFFFFFFFFFELL | sub_1000030DC("MTLTRANSPORT_REPLAY_RECORD_REQUEST", 1) & 1;
  result = sub_1000030DC("MTLTRANSPORT_LAUNCH_TIMEOUT", 30);
  qword_10003DCE8 = result;
  return result;
}

uint64_t sub_1000030DC(const char *a1, uint64_t a2)
{
  char *v3;

  v3 = getenv(a1);
  if (v3)
    return strtol(v3, 0, 0);
  else
    return a2;
}

void DeleteAllArchives(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v1 = a1;
  v2 = objc_alloc_init((Class)NSMutableArray);
  v22 = v1;
  v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v21 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, &__NSArray0__struct, 0, 0));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pathExtension"));
        v13 = objc_msgSend(v12, "caseInsensitiveCompare:", CFSTR("gputrace"));

        if (!v13)
          objc_msgSend(v2, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v2;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v20, "removeItemAtURL:error:", v19, 0);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

}

void sub_1000076AC(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3)
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v3, a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_100007704(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "scheme"));
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("gtsandboxid"));

    if (v8)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", v5));
    }
    else
    {
      v11 = sub_100007800(v5);
      v9 = objc_claimAutoreleasedReturnValue(v11);
    }
    v12 = (void *)v9;
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v9, a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    v10 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10000EA24(v10, v6);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

id sub_100007800(void *a1)
{
  id v1;
  id v2;
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = objc_alloc((Class)NSURL);
  v3 = GTTransportArchiveDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v2, "initFileURLWithPath:isDirectory:", v4, 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "path"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v8, 1));

  return v9;
}

void sub_1000078D0(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = sub_100007800(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", v6, a1[5]);
    (*(void (**)(void))(a1[6] + 16))();

  }
  else
  {
    v7 = *(NSObject **)(a1[4] + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10000EAC4(v7, v8, v9, v10, v11, v12, v13, v14);
    (*(void (**)(void))(a1[6] + 16))();
  }

}

uint64_t sub_100007AF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100008298(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = allServicesForDeviceUDID(a1, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = filteredArrayByService(v7, (Protocol *)&OBJC_PROTOCOL___GTFileWriterService);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  }
  else
  {
    v11 = filteredArrayByPID(v9, (int)objc_msgSend(v5, "currentRemoteRelayPid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  }
  return v10;
}

uint64_t sub_100008354(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100008360(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void sub_100008708(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  void *v5;
  void *v6;
  id v7;
  const char *string;
  NSData *v9;
  void *v10;
  void (*v11)(void);
  xpc_object_t xdict;

  xdict = a2;
  if (xdict)
  {
    v3 = objc_opt_class(NSURL);
    nsobject = xpc_dictionary_get_nsobject(xdict, "url", v3);
    v5 = nsobject;
    if (nsobject
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(nsobject, "path")),
          v7 = objc_msgSend(v6, "length"),
          v6,
          v7))
    {
      string = xpc_dictionary_get_string(xdict, "sandboxExtension");
      if (string)
      {
        v9 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", string, strlen(string) + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        _CFURLAttachSecurityScopeToFileURL(v5, v10);

      }
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v11();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100008A88(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  id v5;

  v5 = a2;
  if (v5)
  {
    v3 = objc_opt_class(NSURL);
    nsobject = xpc_dictionary_get_nsobject(v5, "url", v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100008C24(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  void *nserror;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = objc_opt_class(NSURL);
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10000901C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;
  id v8;
  __int128 v9;
  const char *v10;
  char *v11;
  _OWORD v12[2];

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "startAccessingSecurityScopedResource");
    xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "url", (uint64_t)v4);
    v6 = APP_SANDBOX_READ;
    v7 = objc_retainAutorelease(v4);
    v8 = objc_msgSend(v7, "fileSystemRepresentation");
    v9 = *(_OWORD *)(a1 + 64);
    v12[0] = *(_OWORD *)(a1 + 48);
    v12[1] = v9;
    v10 = (const char *)sandbox_extension_issue_file_to_process(v6, v8, SANDBOX_EXTENSION_DEFAULT, v12);
    if (v10)
    {
      v11 = (char *)v10;
      xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), "sandboxExtension", v10);
      free(v11);
    }
    if (v5)
      objc_msgSend(v7, "stopAccessingSecurityScopedResource");
  }
  objc_msgSend(*(id *)(a1 + 32), "sendMessage:", *(_QWORD *)(a1 + 40));

}

id sub_1000093A0(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "url", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

id sub_1000095F0(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", v6);

  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

uint64_t sub_10000A7E4(compression_stream *a1, const uint8_t *a2, size_t a3, uint8_t *a4, size_t a5, uint64_t a6, void *a7)
{
  unsigned int (**v13)(id, uint8_t *, size_t, uint64_t);
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;

  v13 = a7;
  a1->src_ptr = a2;
  a1->src_size = a3;
  if (a3)
  {
    while (compression_stream_process(a1, 0) != COMPRESSION_STATUS_ERROR)
    {
      if (!a1->dst_size)
      {
        if (!v13[2](v13, a4, a5, a6))
          goto LABEL_10;
        a1->dst_ptr = a4;
        a1->dst_size = a5;
      }
      if (!a1->src_size)
        goto LABEL_7;
    }
    if (!a6)
      goto LABEL_11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Compression failed: %@"), CFSTR("Failed to process compression stream"), NSLocalizedDescriptionKey));
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    *(_QWORD *)a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.filestreamer"), 0, v15));

LABEL_10:
    a6 = 0;
  }
  else
  {
LABEL_7:
    a6 = 1;
  }
LABEL_11:

  return a6;
}

id sub_10000A958(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_writeUncompressedFileData:length:error:", a2, a3, a4);
}

uint64_t sub_10000AA68(compression_stream *a1, uint8_t *a2, size_t a3, uint64_t a4, void *a5)
{
  unsigned int (**v9)(id, uint8_t *, size_t, uint64_t);
  compression_status v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v9 = a5;
  while (1)
  {
    v10 = compression_stream_process(a1, 1);
    if (v10)
      break;
    if (!v9[2](v9, a2, a3, a4))
      goto LABEL_10;
    a1->dst_ptr = a2;
    a1->dst_size = a3;
  }
  if (v10 == COMPRESSION_STATUS_ERROR)
  {
    if (!a4)
      goto LABEL_11;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Compression failed: %@"), CFSTR("Failed to finalize compression stream"), NSLocalizedDescriptionKey));
    v15 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    *(_QWORD *)a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.filestreamer"), 0, v12));

  }
  else if (v9[2](v9, a2, a3 - a1->dst_size, a4))
  {
    a1->dst_ptr = a2;
    a1->dst_size = a3;
    a4 = 1;
    goto LABEL_11;
  }
LABEL_10:
  a4 = 0;
LABEL_11:

  return a4;
}

id sub_10000ABE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "_writeUncompressedFileData:length:error:", a2, a3, a4);
}

uint64_t GTFileWriterTransferFileEntries(void *a1, void *a2, void *a3, NSString **a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  compression_algorithm v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  int v25;
  int v26;
  NSString *v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  uint8_t *v32;
  uint8_t *v33;
  ssize_t v34;
  int v35;
  NSString *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  int v50;
  int v51;
  void *v52;
  unint64_t v53;
  size_t v54;
  uint8_t *v55;
  uint8_t *v56;
  ssize_t v57;
  id v58;
  char v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t (**v70)(id, uint8_t *, _QWORD, NSErrorUserInfoKey *);
  id v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  void *context;
  uint8_t *contexta;
  uint8_t *v88;
  uint64_t v89;
  void *v90;
  id v91;
  NSErrorUserInfoKey v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  _QWORD v96[16];
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  compression_stream stream;

  v8 = a1;
  v9 = a2;
  v10 = a3;
  v11 = a5;
  v88 = (uint8_t *)malloc_type_malloc((size_t)objc_msgSend(v10, "chunkSize"), 0x73AD97B3uLL);
  v75 = v9;
  v76 = v8;
  v74 = v10;
  v72 = v11;
  if (objc_msgSend(v10, "compressionAlgorithm"))
  {
    v12 = v8;
    v84 = v9;
    v13 = v10;
    v82 = v11;
    v73 = v12;
    if (objc_msgSend(v12, "count"))
    {
      memset(&stream, 0, sizeof(stream));
      v14 = (unint64_t)objc_msgSend(v13, "compressionAlgorithm") - 1;
      if (v14 > 4)
        v15 = 0;
      else
        v15 = dword_100027A40[v14];
      v90 = v13;
      if (compression_stream_init(&stream, COMPRESSION_STREAM_ENCODE, v15) == COMPRESSION_STATUS_OK)
      {
        contexta = (uint8_t *)malloc_type_malloc((size_t)objc_msgSend(v13, "chunkSize"), 0xB778C515uLL);
        stream.src_size = 0;
        stream.dst_ptr = v88;
        stream.dst_size = (size_t)objc_msgSend(v13, "chunkSize");
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v71 = v12;
        v81 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v97, v96, 16);
        if (v81)
        {
          v79 = *(_QWORD *)v98;
          while (2)
          {
            v43 = 0;
            do
            {
              if (*(_QWORD *)v98 != v79)
                objc_enumerationMutation(v71);
              v44 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)v43);
              v45 = objc_autoreleasePoolPush();
              v46 = objc_alloc((Class)NSURL);
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
              v48 = objc_msgSend(v46, "initFileURLWithPath:isDirectory:relativeToURL:", v47, 0, v84);

              v49 = objc_retainAutorelease(v48);
              v50 = open((const char *)objc_msgSend(v49, "fileSystemRepresentation"), 0);
              if (v50 < 0)
              {
                v66 = *__error();
                v94 = (const __CFString *)NSLocalizedDescriptionKey;
                v95 = CFSTR("Failed to open file for reading");
                v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
                v41 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v66, v67));

                objc_autoreleasePoolPop(v45);
                v9 = v75;
                v8 = v76;
                v10 = v74;
                if (!v41)
                  goto LABEL_77;
                goto LABEL_79;
              }
              v51 = v50;
              v52 = 0;
              v53 = 0;
              while (2)
              {
                if (v53 >= (unint64_t)objc_msgSend(v44, "fileSize"))
                {
                  v41 = v52;
                }
                else
                {
                  v54 = (size_t)objc_msgSend(v44, "fileSize") - v53;
                  if (v54 >= (unint64_t)objc_msgSend(v90, "chunkSize"))
                    v54 = (size_t)objc_msgSend(v90, "chunkSize");
                  v55 = contexta;
                  v56 = &contexta[v54];
                  while (v55 < v56)
                  {
                    v57 = read(v51, v55, v56 - v55);
                    v55 += v57;
                    if (v57 < 0)
                      goto LABEL_57;
                  }
                  if ((v54 & 0x8000000000000000) != 0)
                  {
LABEL_57:
                    v60 = *__error();
                    v92 = NSLocalizedDescriptionKey;
                    v93 = CFSTR("Failed to read from file");
                    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));
                    v41 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v60, v61));

                    break;
                  }
                  v53 += v54;
                  v58 = objc_msgSend(v90, "chunkSize");
                  v91 = v52;
                  v59 = sub_10000A7E4(&stream, contexta, v54, v88, (size_t)v58, (uint64_t)&v91, v82);
                  v41 = v91;

                  v52 = v41;
                  if ((v59 & 1) != 0)
                    continue;
                }
                break;
              }
              close(v51);

              objc_autoreleasePoolPop(v45);
              if (v41)
              {

                v9 = v75;
                v8 = v76;
                v10 = v74;
LABEL_79:
                if (a4)
                {
                  v41 = objc_retainAutorelease(v41);
                  v40 = 0;
                  *a4 = (NSString *)v41;
                }
                else
                {
                  v40 = 0;
                }
                goto LABEL_82;
              }
              v43 = (char *)v43 + 1;
              v9 = v75;
              v8 = v76;
              v10 = v74;
            }
            while (v43 != v81);
            v62 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v97, v96, 16);
            v81 = v62;
            if (v62)
              continue;
            break;
          }
        }

LABEL_77:
        v40 = sub_10000AA68(&stream, v88, (size_t)objc_msgSend(v90, "chunkSize"), (uint64_t)a4, v82);
        v41 = 0;
LABEL_82:
        free(contexta);
        compression_stream_destroy(&stream);
        goto LABEL_83;
      }
      if (a4)
      {
        *(_QWORD *)&v97 = NSLocalizedDescriptionKey;
        v41 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Compression failed: %@"), CFSTR("Failed to initialize compression stream")));
        v96[0] = v41;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v96, &v97, 1));
        *a4 = (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.filestreamer"), 0, v42));

        v40 = 0;
LABEL_83:

        v13 = v90;
        goto LABEL_84;
      }
      v40 = 0;
    }
    else
    {
      v40 = 1;
    }
LABEL_84:

    v65 = v73;
    goto LABEL_85;
  }
  v16 = v11;
  v17 = v8;
  v83 = v9;
  v85 = v10;
  v70 = v16;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v17;
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v96, 16);
  if (v80)
  {
    v89 = 0;
    v78 = *(_QWORD *)v98;
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v98 != v78)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v18);
      v20 = objc_autoreleasePoolPush();
      v21 = objc_alloc((Class)NSURL);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "path"));
      v23 = objc_msgSend(v21, "initFileURLWithPath:isDirectory:relativeToURL:", v22, 0, v83);

      v24 = objc_retainAutorelease(v23);
      v25 = open((const char *)objc_msgSend(v24, "fileSystemRepresentation"), 0);
      if (v25 < 0)
      {
        v63 = *__error();
        v95 = (const __CFString *)NSLocalizedDescriptionKey;
        stream.dst_ptr = (uint8_t *)CFSTR("Failed to open file for reading");
        v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &stream, &v95, 1));
        v36 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v63, v64));

        objc_autoreleasePoolPop(v20);
        v9 = v75;
        v8 = v76;
        v10 = v74;
        if (!v36)
          goto LABEL_67;
        goto LABEL_70;
      }
      v26 = v25;
      context = v20;
      if (!objc_msgSend(v19, "fileSize"))
      {
        v36 = 0;
        goto LABEL_29;
      }
      v27 = 0;
      v28 = 0;
      while (2)
      {
        v29 = (char *)objc_msgSend(v19, "fileSize") - v28;
        v30 = (char *)objc_msgSend(v85, "chunkSize");
        if (v29 >= &v30[-v89])
          v31 = (unint64_t)&v30[-v89];
        else
          v31 = (unint64_t)v29;
        v32 = &v88[v89];
        v33 = &v88[v89 + v31];
        while (v32 < v33)
        {
          v34 = read(v26, v32, v33 - v32);
          v32 += v34;
          if (v34 < 0)
            goto LABEL_27;
        }
        if ((v31 & 0x8000000000000000) != 0)
        {
LABEL_27:
          v37 = *__error();
          v93 = (const __CFString *)NSLocalizedDescriptionKey;
          v94 = CFSTR("Failed to read from file");
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
          v36 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v37, v38));

          break;
        }
        if ((id)(v31 + v89) == objc_msgSend(v85, "chunkSize"))
        {
          v92 = v27;
          v35 = v70[2](v70, v88, v31 + v89, &v92);
          v36 = v92;

          if (!v35)
          {
            v89 += v31;
            break;
          }
          v89 = 0;
          v27 = v36;
        }
        else
        {
          v89 += v31;
          v36 = v27;
        }
        v28 += v31;
        if (v28 < (unint64_t)objc_msgSend(v19, "fileSize"))
          continue;
        break;
      }
LABEL_29:
      close(v26);

      objc_autoreleasePoolPop(context);
      if (v36)
      {

        v9 = v75;
        v8 = v76;
        v10 = v74;
LABEL_70:
        if (a4)
        {
          v36 = objc_retainAutorelease(v36);
          v40 = 0;
          *a4 = v36;
        }
        else
        {
          v40 = 0;
        }
        goto LABEL_75;
      }
      if ((id)++v18 == v80)
      {
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v96, 16);
        v9 = v75;
        v8 = v76;
        v10 = v74;
        v80 = v39;
        if (v39)
          goto LABEL_7;
        goto LABEL_65;
      }
    }
  }
  v89 = 0;
LABEL_65:

LABEL_67:
  if (v89)
  {
    v40 = v70[2](v70, v88, v89, a4);
    v36 = 0;
  }
  else
  {
    v36 = 0;
    v40 = 1;
  }
LABEL_75:

  v65 = obj;
LABEL_85:

  free(v88);
  return v40;
}

void sub_10000BEA8(_QWORD *a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 56), "makeURL:", a1[5]));
    (*(void (**)(void))(a1[6] + 16))();

  }
}

BOOL sub_10000C44C(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = v1;
  v3 = v1 && objc_msgSend(v1, "chunkSize") && (unint64_t)objc_msgSend(v2, "compressionAlgorithm") < 6;

  return v3;
}

void sub_10000C49C(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  id v17;

  v3 = a2;
  v4 = a1[6];
  v5 = (void *)a1[4];
  v17 = 0;
  v6 = objc_msgSend(v5, "_finishSession:error:", v4, &v17);
  v7 = v17;
  v8 = *(NSObject **)(a1[4] + 8);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v9)
      sub_10000ED50((uint64_t)(a1 + 6), v8, v3);
    v16 = *(void (**)(void))(a1[5] + 16);
  }
  else if ((v6 & 1) != 0)
  {
    if (v9)
      sub_10000ECE8((uint64_t)(a1 + 6), v8, v10, v11, v12, v13, v14, v15);
    v16 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (v9)
      sub_10000ED50((uint64_t)(a1 + 6), v8, v7);
    v16 = *(void (**)(void))(a1[5] + 16);
  }
  v16();

}

void sub_10000CA5C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSString *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  void **v13;
  uint64_t v14;
  BOOL (*v15)(_QWORD *, uint64_t, uint64_t, _QWORD *);
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  NSErrorUserInfoKey v28;
  void *v29;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10000CCC8;
  v26 = sub_10000CCD8;
  v27 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v21 = 0;
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10000CCE0;
  v16 = &unk_100030A90;
  v4 = *(void **)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 88);
  v19 = &v22;
  v20 = v6;
  v18 = v5;
  LOBYTE(v3) = GTFileWriterTransferFileEntries(v2, v3, v4, &v21, &v13);
  v7 = v21;
  if ((v3 & 1) == 0)
    goto LABEL_4;
  v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 56) + 64), v8))
  {
    if (!v23[5])
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 56) + 64));
      objc_msgSend(*(id *)(a1 + 72), "stopAccessingSecurityScopedResource");
      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
      goto LABEL_5;
    }
LABEL_4:
    objc_msgSend(*(id *)(a1 + 72), "stopAccessingSecurityScopedResource");
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_5:
    v12();
    goto LABEL_6;
  }
  v28 = NSLocalizedDescriptionKey;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ hit a timeout: %@"), CFSTR("GTFileWriterService"), CFSTR("beginTransferSessionWithFileEntires timed out waiting for final write to complete"), v13, v14, v15, v16, v17));
  v29 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 6, v10));

  objc_msgSend(*(id *)(a1 + 72), "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

LABEL_6:
  _Block_object_dispose(&v22, 8);

}

uint64_t sub_10000CCC8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000CCD8(uint64_t a1)
{

}

BOOL sub_10000CCE0(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  dispatch_time_t v7;
  intptr_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];
  NSErrorUserInfoKey v17;
  void *v18;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0));
  v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  v8 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 64), v7);
  if (v8)
  {
    if (a4)
    {
      v17 = NSLocalizedDescriptionKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ hit a timeout: %@"), CFSTR("GTFileWriterService"), CFSTR("beginTransferSessionWithFileEntires timed out waiting for transfer to complete")));
      v18 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 6, v10));

    }
  }
  else
  {
    v11 = objc_autoreleasePoolPush();
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000CEA0;
    v16[3] = &unk_100030A68;
    v13 = a1[6];
    v12 = a1[7];
    v14 = (void *)a1[5];
    v16[4] = a1[4];
    v16[5] = v13;
    objc_msgSend(v14, "writeFileData:sessionID:completionHandler:", v6, v12, v16);
    objc_autoreleasePoolPop(v11);
  }

  return v8 == 0;
}

void sub_10000CEA0(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (!v6)
    objc_storeStrong(v5, a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 64));

}

void sub_10000D3D0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t nserror;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    nserror = xpc_dictionary_get_nserror(a2, "error");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = (void *)nserror;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v7;
  }

}

void sub_10000D5D0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *nsobject;
  void *nserror;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = objc_opt_class(NSURL);
    nsobject = xpc_dictionary_get_nsobject(v6, "url", v3);
    nserror = (void *)xpc_dictionary_get_nserror(v6, "error");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10000D81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id nserror;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
}

void sub_10000D988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id nserror;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
}

id sub_10000DE04(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

id sub_10000E178(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", v6);

  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

id sub_10000E534(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

id sub_10000E664(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

BOOL sub_10000E6AC(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

id sub_10000E6B4(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  id v11;

  v11 = 0;
  v3 = a2;
  objc_msgSend(a1, "getResourceValue:forKey:error:", &v11, NSURLCanonicalPathKey, 0);
  v4 = v11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathComponents"));
  v10 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v10, NSURLCanonicalPathKey, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pathComponents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subarrayWithRange:", objc_msgSend(v6, "count"), (_BYTE *)objc_msgSend(v5, "count") - (_BYTE *)objc_msgSend(v6, "count")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v7));
  return v8;
}

void sub_10000E7B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000E7D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000E7EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000E7FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id sub_10000E838(uint64_t a1, void *a2)
{
  return a2;
}

void sub_10000E844(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E7EC((void *)&_mh_execute_header, a1, a3, "Invalid sandbox ID", a5, a6, a7, a8, 0);
  sub_10000E830();
}

void sub_10000E874()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7D0((void *)&_mh_execute_header, v0, v1, "Missing remote connection for %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000E8D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E7EC((void *)&_mh_execute_header, a1, a3, "Failed to find URL access provider", a5, a6, a7, a8, 0);
  sub_10000E830();
}

void sub_10000E904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7B8((void *)&_mh_execute_header, v0, v1, "File found locally %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000E964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7D0((void *)&_mh_execute_header, v0, v1, "File should exist locally at %@ but can't be found on disk", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000E9C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7B8((void *)&_mh_execute_header, v0, v1, "securityScopedURLFromSandboxID %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000EA24(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_10000E7E0();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to transfer archive, %@", v5, 0xCu);

}

void sub_10000EAC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E7EC((void *)&_mh_execute_header, a1, a3, "Failed to transfer archive", a5, a6, a7, a8, 0);
  sub_10000E830();
}

void sub_10000EAF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7D0((void *)&_mh_execute_header, v0, v1, "No remote connection for device %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000EB54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7D0((void *)&_mh_execute_header, v0, v1, "Failed to find remote file writer service for device %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000EBB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7B8((void *)&_mh_execute_header, v0, v1, "Failed to consume sandbox extension for URL %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000EC14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000E7E0();
  sub_10000E7B8((void *)&_mh_execute_header, v0, v1, "currentURL %@", v2, v3, v4, v5, v6);
  sub_10000E7C8();
}

void sub_10000EC74()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000E7E0();
  v3 = 2112;
  v4 = v0;
  sub_10000E7FC((void *)&_mh_execute_header, v1, (uint64_t)v1, "transferIdentifier %@ to device %@", v2);
  sub_10000E7C8();
}

void sub_10000ECE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000E7B8((void *)&_mh_execute_header, a2, a3, "Transfer session %llu completed successfully", a5, a6, a7, a8, 0);
  sub_10000E7C8();
}

void sub_10000ED50(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = sub_10000E838(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedDescription"));
  sub_10000E818();
  sub_10000E7FC((void *)&_mh_execute_header, v4, v6, "Transfer session %llu failed with error \"%@\"", v7);

  sub_10000E808();
}

void sub_10000F3D0(uint64_t a1, void *a2)
{
  id nsdata;

  if (a2)
  {
    nsdata = xpc_dictionary_get_nsdata(a2, "signature");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void sub_10000F514(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *nserror;
  xpc_object_t dictionary;
  void *v7;
  GTProcessState *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v3, "error");
    if (nserror)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      dictionary = xpc_dictionary_get_dictionary(v4, "processState");
      v7 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
      if (v7)
      {
        v8 = objc_alloc_init(GTProcessState);
        -[GTProcessState setIsSuspended:](v8, "setIsSuspended:", xpc_dictionary_get_BOOL(v7, "isSuspended"));
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Deserialization failed for %@"), CFSTR("processState"), NSLocalizedDescriptionKey));
        v12 = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
        v8 = (GTProcessState *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 10, v10));

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

BOOL IsServicePort(unint64_t a1)
{
  return a1 >> 30 == 0;
}

void MessagePathPush(void *a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = a1;
  v4 = xpc_uint64_create(a2);
  xpc_dictionary_array_push(v3, "_pathHistory", v4);

}

uint64_t MessagePathPop(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t value;

  v1 = xpc_dictionary_array_pop(a1, "_replyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2)
    value = xpc_uint64_get_value(v2);
  else
    value = 0;

  return value;
}

uint64_t MessagePathEndsWith(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  size_t count;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  size_t v10;
  size_t v11;
  uint64_t uint64;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4 || !xpc_array_get_count(v4))
  {
LABEL_12:
    v7 = 1;
    goto LABEL_13;
  }
  if (v3)
  {
    count = xpc_array_get_count(v5);
    if (count <= xpc_array_get_count(v3))
    {
      if (xpc_array_get_count(v3))
      {
        v8 = 0;
        v9 = -1;
        while (v8 < xpc_array_get_count(v5))
        {
          v10 = xpc_array_get_count(v3) + v9;
          v11 = xpc_array_get_count(v5) + v9;
          uint64 = xpc_array_get_uint64(v3, v10);
          if (uint64 != xpc_array_get_uint64(v5, v11))
            goto LABEL_5;
          ++v8;
          --v9;
          v7 = 1;
          if (v8 >= xpc_array_get_count(v3))
            goto LABEL_13;
        }
      }
      goto LABEL_12;
    }
  }
LABEL_5:
  v7 = 0;
LABEL_13:

  return v7;
}

BOOL MessageIsStreamReply(void *a1)
{
  xpc_object_t value;
  void *v2;
  _BOOL8 v3;

  value = xpc_dictionary_get_value(a1, "_replyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue(value);
  v3 = v2 != 0;

  return v3;
}

BOOL MessageHasReply(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = (xpc_dictionary_get_flag(v1, "_flags", 0) & 1) != 0 || xpc_dictionary_get_BOOL(v1, "_reply");

  return v2;
}

void MessageSetHasReply(void *a1)
{
  xpc_object_t xdict;

  xdict = a1;
  xpc_dictionary_set_flag(xdict, "_flags", 0);
  xpc_dictionary_set_BOOL(xdict, "_reply", 1);

}

BOOL MessageRecordsPathHistory(void *a1)
{
  id v1;
  _BOOL8 v2;
  xpc_object_t value;
  void *v4;

  v1 = a1;
  if ((xpc_dictionary_get_flag(v1, "_flags", 2) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    value = xpc_dictionary_get_value(v1, "_replyStreamId");
    v4 = (void *)objc_claimAutoreleasedReturnValue(value);
    v2 = v4 != 0;

  }
  return v2;
}

BOOL MessageIsValid(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void **v6;
  NSErrorUserInfoKey *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *nserror;
  void *v16;
  uint64_t v17;
  void *v18;
  NSErrorUserInfoKey v19;
  void *v20;
  NSErrorUserInfoKey v21;
  void *v22;

  v3 = a1;
  v4 = v3;
  if (!v3)
  {
    if (a2)
    {
      v21 = NSLocalizedDescriptionKey;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Encountered an XPC error: %@"), CFSTR("Message is nil")));
      v22 = v5;
      v6 = &v22;
      v7 = &v21;
      goto LABEL_8;
    }
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (a2)
    {
      v19 = NSLocalizedDescriptionKey;
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_error_string(v4));
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Encountered an XPC error: %@"), v10));
      v20 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      *a2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 7, v12));

    }
    goto LABEL_11;
  }
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (a2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Encountered an XPC error: %@"), CFSTR("Unexpected XPC object type"), NSLocalizedDescriptionKey));
      v18 = v5;
      v6 = &v18;
      v7 = (NSErrorUserInfoKey *)&v17;
LABEL_8:
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v7, 1));
      *a2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 7, v8));

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  nserror = (void *)xpc_dictionary_get_nserror(v4, "_error");
  v16 = nserror;
  v13 = nserror == 0;
  if (a2 && nserror)
    *a2 = objc_retainAutorelease(nserror);

LABEL_12:
  return v13;
}

BOOL MessageVisit(void *a1, const char *a2)
{
  id v3;
  _BOOL4 v4;
  xpc_object_t v5;

  v3 = a1;
  v4 = xpc_dictionary_string_array_contains(v3, "_visited", (uint64_t)a2);
  if (!v4)
  {
    v5 = xpc_string_create(a2);
    xpc_dictionary_array_push(v3, "_visited", v5);

  }
  return !v4;
}

uint64_t sub_1000107C8(_QWORD *a1)
{
  unint64_t v2;

  if (a1[7])
  {
    v2 = 0;
    do
    {
      (*(void (**)(void))(a1[5] + 16))();
      ++v2;
    }
    while (v2 < a1[7]);
  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void sub_100010CBC(uint64_t a1, void *a2)
{
  id nsdictionary_any;

  if (a2)
  {
    nsdictionary_any = xpc_dictionary_get_nsdictionary_any(a2, "data");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void sub_100010F8C(uint64_t a1, void *a2)
{
  id nsdictionary_any;

  if (a2)
  {
    nsdictionary_any = xpc_dictionary_get_nsdictionary_any(a2, "result");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deregisterDispatcher:", objc_msgSend(*(id *)(a1 + 40), "dispatcherId"));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id sub_100011278(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "data", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

void sub_1000113F8(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *(_QWORD *)(a1 + 64))
    xpc_dictionary_set_BOOL(xdict, "_endOfStream", 1);
  objc_msgSend(*(id *)(a1 + 40), "sendMessage:", xdict);

}

void sub_10001163C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_nsobject(xdict, "data", (uint64_t)v3);

  MessageSetHasReply(xdict);
  v4 = objc_msgSend(*(id *)(a1 + 40), "sendMessageWithReplySync:error:", xdict, 0);

}

id sub_1000116D0(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  xpc_dictionary_set_BOOL(v3, "_endOfStream", 1);
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "result", (uint64_t)v4);

  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

uint64_t sub_100011F7C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100011F8C(uint64_t a1)
{

}

void sub_100011F94(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id sub_1000122F8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyServiceListChanged:", *(_QWORD *)(a1 + 32));
}

void sub_1000129C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id nserror;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    nserror = (id)xpc_dictionary_get_nserror(a2, "error");
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, nserror);

  }
  else
  {
    (*(void (**)(_QWORD, uint64_t))(v3 + 16))(*(_QWORD *)(a1 + 32), a3);
  }
}

id sub_1000134B0(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

id sub_1000135E4(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

void sub_100013888(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid remote properties - unable to locate remote service", v1, 2u);
}

id allServicesForDeviceUDID(void *a1, void *a2)
{
  id v3;
  id v4;
  xpc_object_t empty;
  void *v6;
  uint64_t v7;
  void *nsarray;
  uint64_t v10;

  v3 = a1;
  v4 = a2;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "_cmd", "allServices");
  if (v4)
    xpc_dictionary_set_string(empty, "_device_dest", (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
  MessageSetHasReply(empty);
  v10 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sendMessageWithReplySync:error:", empty, &v10));
  if (v6)
  {
    v7 = objc_opt_class(GTProcessService);
    nsarray = (void *)xpc_dictionary_get_nsarray(v6, "returnValue", v7);
  }
  else
  {
    objc_msgSend(v3, "setError:", 0);
    nsarray = 0;
  }

  return nsarray;
}

id filteredArrayByService(void *a1, Protocol *a2)
{
  id v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a1;
  v4 = NSStringFromProtocol(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc_init((Class)NSMutableArray);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serviceProperties", (_QWORD)v18));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "protocolName"));
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if (v15)
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v16 = objc_msgSend(v6, "copy");
  return v16;
}

id filteredArrayByPID(void *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a1;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "processInfo", (_QWORD)v14));
        if (objc_msgSend(v11, "processIdentifier") == a2)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "copy");
  return v12;
}

id filteredArrayByPort(void *a1, id a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a1;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "serviceProperties", (_QWORD)v14));
        if (objc_msgSend(v11, "servicePort") == a2)
          objc_msgSend(v4, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v4, "copy");
  return v12;
}

id newSetWithArrayMinusArray(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v4);

  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v3);
  objc_msgSend(v5, "minusSet:", v6);

  v7 = objc_msgSend(v5, "copy");
  return v7;
}

void xpc_dictionary_set_nsobject(void *a1, const char *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;

  if (a3)
  {
    v7 = 0;
    v5 = a1;
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v7)));
    xpc_dictionary_set_data(v5, a2, objc_msgSend(v6, "bytes"), (size_t)objc_msgSend(v6, "length"));

  }
}

void xpc_dictionary_set_nsdata(void *a1, const char *a2, id a3)
{
  id v5;
  id v6;
  id v7;
  xpc_object_t xdict;

  if (a3)
  {
    v5 = objc_retainAutorelease(a3);
    xdict = a1;
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v5, "length");

    xpc_dictionary_set_data(xdict, a2, v6, (size_t)v7);
  }
}

id xpc_dictionary_get_nsdata(void *a1, const char *a2)
{
  id result;
  id v3;
  id v4;
  size_t length;

  length = 0;
  result = (id)xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc((Class)NSData);
    return objc_msgSend(v4, "initWithBytes:length:", v3, length);
  }
  return result;
}

id xpc_dictionary_get_nsdata_nocopy(void *a1, const char *a2)
{
  id result;
  id v3;
  id v4;
  size_t length;

  length = 0;
  result = (id)xpc_dictionary_get_data(a1, a2, &length);
  if (result)
  {
    v3 = result;
    v4 = objc_alloc((Class)NSData);
    return objc_msgSend(v4, "initWithBytesNoCopy:length:freeWhenDone:", v3, length, 0);
  }
  return result;
}

void *xpc_dictionary_get_nsobject(void *a1, const char *a2, uint64_t a3)
{
  id nsdata_nocopy;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (!nsdata_nocopy)
    goto LABEL_5;
  v8 = 0;
  v5 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", a3, nsdata_nocopy, &v8));
  v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a3) & 1) == 0)
  {

LABEL_5:
    v6 = 0;
  }

  return v6;
}

uint64_t sub_100015238(void *a1, const char *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t nsobject_classes;

  v2 = a1;
  v3 = objc_alloc((Class)NSSet);
  v4 = objc_opt_class(NSArray);
  v5 = objc_opt_class(NSData);
  v6 = objc_opt_class(NSDictionary);
  v7 = objc_opt_class(NSError);
  v8 = objc_opt_class(NSNull);
  v9 = objc_opt_class(NSNumber);
  v10 = objc_opt_class(NSSet);
  v11 = objc_opt_class(NSString);
  v12 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(NSUUID), 0);
  nsobject_classes = xpc_dictionary_get_nsobject_classes(v2, a2, v12);

  return nsobject_classes;
}

uint64_t xpc_dictionary_get_nsarray(void *a1, const char *a2, uint64_t a3)
{
  id nsdata_nocopy;
  uint64_t v5;
  uint64_t v7;

  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v7 = 0;
    v5 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedArrayOfObjectsOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedArrayOfObjectsOfClass:fromData:error:", a3, nsdata_nocopy, &v7));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t xpc_dictionary_get_nsdictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", a3, a4, nsdata_nocopy, &v9));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t xpc_dictionary_get_nsobject_classes(void *a1, const char *a2, void *a3)
{
  id v5;
  id nsdata_nocopy;
  uint64_t v7;
  uint64_t v9;

  v5 = a3;
  nsdata_nocopy = xpc_dictionary_get_nsdata_nocopy(a1, a2);
  if (nsdata_nocopy)
  {
    v9 = 0;
    v7 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v5, nsdata_nocopy, &v9));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id xpc_dictionary_get_nsdictionary_any(void *a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)sub_100015238(a1, a2);
  v3 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

const char *xpc_error_string(void *a1)
{
  const char *result;

  result = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  if (!result)
    return "Unknown";
  return result;
}

void xpc_dictionary_set_flag(void *a1, const char *a2, char a3)
{
  uint64_t uint64;
  xpc_object_t xdict;

  xdict = a1;
  uint64 = xpc_dictionary_get_uint64(xdict, a2);
  xpc_dictionary_set_uint64(xdict, a2, uint64 | (1 << a3));

}

uint64_t xpc_dictionary_get_flag(void *a1, const char *a2, char a3)
{
  return (xpc_dictionary_get_uint64(a1, a2) >> a3) & 1;
}

id xpc_array_pop(void *a1)
{
  id v1;
  size_t count;
  size_t v3;
  xpc_object_t value;
  void *v5;
  xpc_object_t v6;

  v1 = a1;
  count = xpc_array_get_count(v1);
  if (count)
  {
    v3 = count - 1;
    while (1)
    {
      value = xpc_array_get_value(v1, v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue(value);
      if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_null)
        break;

      if (--v3 == -1)
        goto LABEL_5;
    }
    v6 = xpc_null_create();
    xpc_array_set_value(v1, v3, v6);

  }
  else
  {
LABEL_5:
    v5 = 0;
  }

  return v5;
}

void xpc_dictionary_array_push(void *a1, const char *a2, void *a3)
{
  id v5;
  xpc_object_t array;
  xpc_object_t empty;
  xpc_object_t value;

  value = a3;
  v5 = a1;
  array = xpc_dictionary_get_array(v5, a2);
  empty = (xpc_object_t)objc_claimAutoreleasedReturnValue(array);
  if (!empty)
    empty = xpc_array_create_empty();
  xpc_array_append_value(empty, value);
  xpc_dictionary_set_value(v5, a2, empty);

}

id xpc_dictionary_array_pop(void *a1, const char *a2)
{
  id v3;
  xpc_object_t array;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  array = xpc_dictionary_get_array(v3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(array);
  v6 = v5;
  if (v5)
  {
    v7 = xpc_array_pop(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    xpc_dictionary_set_value(v3, a2, v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL xpc_dictionary_string_array_contains(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t array;
  void *v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  array = xpc_dictionary_get_array(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(array);
  v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_array)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015818;
    v9[3] = &unk_100030CC0;
    v9[4] = &v10;
    v9[5] = a3;
    xpc_array_apply(v6, v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t sub_100015818(uint64_t a1, int a2, xpc_object_t xstring)
{
  const char *string_ptr;
  int v5;
  uint64_t result;

  string_ptr = xpc_string_get_string_ptr(xstring);
  if (!string_ptr)
    return 1;
  v5 = strcmp(*(const char **)(a1 + 40), string_ptr);
  result = 1;
  if (!v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

xpc_object_t gt_xpc_dictionary_create_reply(void *a1)
{
  return xpc_dictionary_create_reply(a1);
}

void sub_100015A80(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    v2 = a1[5];
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]));
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, v3);

  }
}

void sub_100015B90(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1[4] + 32);
  if (v1)
  {
    v2 = a1[5];
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]));
    objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, v3);

  }
}

void sub_100015C54(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v1)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v1, "removeObjectForKey:", v2);

  }
}

void sub_100015D64(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t uint64;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (xpc_dictionary_get_flag(*(void **)(a1 + 32), "_flags", 1))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 40) + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (IsServicePort((unint64_t)objc_msgSend(v7, "unsignedLongLongValue")))
          {
            v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v7));
            objc_msgSend(v8, "dispatchMessage:replyConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

          }
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }

  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "_port");
    v10 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", uint64));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));

    objc_msgSend(v12, "dispatchMessage:replyConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
}

void sub_100015FF8(uint64_t a1, void *a2)
{
  id v3;
  BOOL IsValid;
  id v5;
  id v6;

  v3 = a2;
  v6 = 0;
  IsValid = MessageIsValid(v3, &v6);
  v5 = v6;
  if (!IsValid)
  {

    v3 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10001617C(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001626C(id *a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject **v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[3];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001633C;
    v7[3] = &unk_100030DB0;
    v8 = v3;
    v9 = v5;
    v10 = a1[4];
    v11 = a1[5];
    dispatch_async(v6, v7);

  }
}

_QWORD *sub_10001633C(uint64_t a1)
{
  _QWORD *v2;

  if (xpc_get_type(*(xpc_object_t *)(a1 + 32)) == (xpc_type_t)&_xpc_type_error)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 32));
    v2 = (_QWORD *)(a1 + 48);
  }
  else
  {
    v2 = (_QWORD *)(a1 + 56);
  }
  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v2 + 16))(v2);
}

void sub_1000163FC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

uint64_t start()
{
  void *v0;
  GTServiceDaemon *v1;
  int v3;
  const char *v4;
  uint32_t v5;
  size_t v6;
  uint64_t v7;
  uint8_t buf[4];
  int v9;

  v6 = 8;
  v7 = 0;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v7, &v6, 0, 0))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v3 = *__error();
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    v4 = "Failed to read developer mode status: %{darwin.errno}d";
    v5 = 8;
    goto LABEL_8;
  }
  if (v7 != 1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v4 = "Service prohibited from running (developer mode not enabled)";
    v5 = 2;
LABEL_8:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v4, buf, v5);
LABEL_9:
    exit(1);
  }
  MTLSetReportFailureBlock(&stru_100030E38);
  v0 = objc_autoreleasePoolPush();
  GTTransportEnvironment_init();
  v1 = objc_alloc_init(GTServiceDaemon);
  -[GTServiceDaemon enterRunLoop](v1, "enterRunLoop");

  objc_autoreleasePoolPop(v0);
  return 0;
}

void sub_100017DB8(id a1, unint64_t a2, const char *a3, unsigned int a4, NSString *a5)
{
  int v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  const char *v15;

  v8 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109890;
    v9[1] = v8;
    v10 = 2080;
    v11 = a3;
    v12 = 1024;
    v13 = a4;
    v14 = 2080;
    v15 = -[NSString UTF8String](objc_retainAutorelease(a5), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Metal Validation Error found: ! %d, %s, %d, %s", (uint8_t *)v9, 0x22u);
  }
}

id sub_100019E6C(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD applier[4];
  id v7;

  if (a2)
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100019F00;
    applier[3] = &unk_100030EB0;
    v7 = *(id *)(a1 + 32);
    xpc_dictionary_apply(a2, applier);

  }
  else
  {
    xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "_error", a3);
  }
  return objc_msgSend(*(id *)(a1 + 40), "updateAndRelayMessage:fromConnection:toConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t sub_100019F00(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

char *sub_100019F1C(void *a1)
{
  char *string;

  string = (char *)xpc_dictionary_get_string(a1, "_device_dest");
  if (string)
    string = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  return string;
}

void sub_100019F50(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(*(id *)(a1 + 32), "handleMessage:fromConnection:", v4, WeakRetained);

}

void sub_100019FA4(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "handleDisconnection:", WeakRetained);
    WeakRetained = v3;
  }

}

void sub_100019FEC(uint64_t a1, void *a2)
{
  char *v3;
  NSObject *v4;
  xpc_object_t object;
  uint8_t buf[4];
  char *v7;

  object = a2;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    objc_msgSend(*(id *)(a1 + 32), "handleConnection:", object);

  }
  else
  {
    v3 = xpc_copy_description(object);

    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Listener: received object:%s", buf, 0xCu);
    }
    free(v3);
  }
}

uint64_t sub_10001BAAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001BAB8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001BAC8(uint64_t a1)
{

}

void sub_10001BAD0(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10001BB2C(_QWORD *a1, char a2, void *a3)
{
  id v6;

  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  if ((a2 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

void sub_10001BBA0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  NSObject *v10;
  id v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v6)
    {
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description")));
        v12 = 136315138;
        v13 = objc_msgSend(v11, "UTF8String");
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Cannot bring app to foreground: error = %s", (uint8_t *)&v12, 0xCu);

      }
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void sub_10001BCC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedDescription"));
      v11 = 138412290;
      v12 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Error Launching Replayer: %@", (uint8_t *)&v11, 0xCu);

    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void sub_10001BDDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id Signature;

  v2 = CSSymbolicatorCreateWithPid(*(unsigned int *)(a1 + 40));
  v4 = v3;
  if ((CSIsNull() & 1) != 0)
  {
    Signature = 0;
  }
  else
  {
    Signature = (id)CSSymbolicatorCreateSignature(v2, v4, 0);
    CSRelease(v2, v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10001C318(uint64_t a1, void *a2, void *a3)
{
  id v5;
  xpc_object_t empty;
  unsigned __int8 v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = a2;
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "processState", empty);
    v7 = objc_msgSend(v5, "isSuspended");

    xpc_dictionary_set_BOOL(empty, "isSuspended", v7);
  }
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", v8);
  objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));

}

id sub_10001C3C0(uint64_t a1, id a2)
{
  xpc_dictionary_set_nsdata(*(void **)(a1 + 32), "signature", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

id sub_10001C7EC(const uint8_t *a1)
{
  uint8_t *v2;
  size_t v3;
  id v4;
  id v5;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = 2049;
  v9 = 49680;
  v2 = (uint8_t *)malloc_type_calloc(1uLL, 0xC210uLL, 0x2CC67910uLL);
  v3 = compression_encode_buffer(v2, 0xC210uLL, a1, 0xC210uLL, 0, COMPRESSION_LZFSE);
  v7 = 1;
  v8 = 1;
  v4 = objc_alloc_init((Class)NSMutableData);
  objc_msgSend(v4, "appendBytes:length:", &v8, 4);
  objc_msgSend(v4, "appendBytes:length:", &v7, 4);
  objc_msgSend(v4, "appendBytes:length:", &v10, 8);
  objc_msgSend(v4, "appendBytes:length:", &v9, 8);
  objc_msgSend(v4, "appendBytes:length:", v2, v3);
  free(v2);
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

uint8_t *sub_10001C8DC(const uint8_t *a1, size_t a2, uint64_t a3, size_t a4, size_t a5, uint64_t a6)
{
  unint64_t v10;
  uint8_t *result;
  uint8_t *v12;
  size_t v13;

  if (a4 <= a5)
    v10 = a5;
  else
    v10 = a4;
  result = (uint8_t *)sub_10001EFCC(a6, v10);
  if (result)
  {
    v12 = result;
    bzero(result, v10);
    if (a3)
    {
      v13 = compression_decode_buffer(v12, a4, a1, a2, 0, (compression_algorithm)a3);
      result = 0;
      if (v13 != a4)
        return result;
    }
    else
    {
      if (a2 < a4)
        return 0;
      memcpy(v12, a1, a4);
    }
    return v12;
  }
  return result;
}

uint64_t sub_10001C990(void *a1, uint64_t a2, _BYTE *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD v14[2];

  v14[0] = 0;
  v14[1] = 0;
  if (a3)
    *a3 = 0;
  v5 = a1;
  v6 = (unint64_t)objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "bytes");

  if (v6 <= 3
    || (v9 = *(_DWORD *)v8, *(_DWORD *)v8 >= 2u)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || (v6 & 0xFFFFFFFFFFFFFFF0) == 0x10)
  {
LABEL_8:
    if (a3)
    {
      result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  v11 = *((_QWORD *)v8 + 2);
  if (v11)
  {
    v12 = *((_QWORD *)v8 + 3);
    v13 = (char *)sub_10001C8DC((const uint8_t *)v8 + 32, v6 - 32, *((_QWORD *)v8 + 1), v12 * v11, v12 * v11, a2);
    if (v13)
    {
      sub_10001CAAC(v13, (uint64_t)v14, v12, v11, v9, a3, a2);
      return v14[0];
    }
    goto LABEL_8;
  }
  return 0;
}

char *sub_10001CAAC(char *result, uint64_t a2, unint64_t a3, uint64_t a4, int a5, _BYTE *a6, uint64_t a7)
{
  char *v11;
  size_t v12;
  char *v13;
  size_t v14;
  char *v15;
  uint64_t v16;

  if (a5 == 1 && (v11 = result, v12 = 24 * a4, (result = (char *)sub_10001EFCC(a7, 24 * a4)) != 0))
  {
    v13 = result;
    bzero(result, v12);
    if (a3 >= 0x18)
      v14 = 24;
    else
      v14 = a3;
    v15 = v13;
    v16 = a4;
    do
    {
      result = (char *)memcpy(v15, v11, v14);
      v15 += 24;
      v11 += a3;
      --v16;
    }
    while (v16);
    *(_QWORD *)a2 = v13;
    *(_DWORD *)(a2 + 8) = a4;
  }
  else if (a6)
  {
    *a6 = 1;
  }
  return result;
}

uint64_t sub_10001CB68(void *a1, uint64_t a2, _BYTE *a3)
{
  id v5;
  unint64_t v6;
  id v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD v15[2];

  v15[0] = 0;
  v15[1] = 0;
  if (a3)
    *a3 = 0;
  v5 = a1;
  v6 = (unint64_t)objc_msgSend(v5, "length");
  v7 = objc_retainAutorelease(v5);
  v8 = (unsigned int *)objc_msgSend(v7, "bytes");

  if (v6 <= 3
    || (v9 = *v8, v9 >= 2)
    || (v6 & 0xFFFFFFFFFFFFFFFCLL) == 4
    || (v6 & 0xFFFFFFFFFFFFFFF8) == 8
    || v6 - 16 <= 0x17)
  {
LABEL_8:
    if (a3)
    {
      result = 0;
      *a3 = 1;
      return result;
    }
    return 0;
  }
  v11 = *((_QWORD *)v8 + 2);
  if (v11)
  {
    v12 = *((_QWORD *)v8 + 3);
    v13 = *((_QWORD *)v8 + 4);
    v14 = (char *)sub_10001C8DC((const uint8_t *)v8 + 40, v6 - 40, *((_QWORD *)v8 + 1), (v13 + v12) * v11, (v13 + v12) * v11, a2);
    if (v14)
    {
      sub_10001CC8C(v14, (uint64_t)v15, v12, v13, v11, v9, a3, a2);
      return v15[0];
    }
    goto LABEL_8;
  }
  return 0;
}

void sub_10001CC8C(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  size_t v14;
  _QWORD *v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  char *v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  _BYTE *v39;
  char *v40;
  _OWORD v42[14];
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  if (a6 != 1 || (v14 = 24 * a5, (v15 = (_QWORD *)sub_10001EFCC(a8, 24 * a5)) == 0))
  {
    v21 = 0;
    if (!a7)
      return;
    goto LABEL_35;
  }
  v16 = v15;
  v38 = a2;
  v39 = a7;
  bzero(v15, v14);
  if (a3 >= 0x10)
    v17 = 16;
  else
    v17 = a3;
  v18 = 1;
  v19 = a1;
  v20 = a5;
  do
  {
    memcpy(&v16[v18], v19, v17);
    v18 += 3;
    v19 += a3;
    --v20;
  }
  while (v20);
  v21 = 0;
  v22 = 0;
  v40 = &a1[a5 * a3];
  while (1)
  {
    v23 = 0;
    v24 = 0;
    v56 = 0;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v43 = 0;
    v45 = 0u;
    memset(v42, 0, sizeof(v42));
    v44 = 56;
    do
    {
      v24 += (*(_QWORD *)((char *)v42 + v23) + 7) & 0xFFFFFFFFFFFFFFF8;
      v23 += 8;
    }
    while (v23 != 424);
    v25 = (char *)sub_10001EFCC(a8, v24);
    if (!v25)
      break;
    v26 = v25;
    v27 = &v40[v22 * a4];
    bzero(v25, v24);
    v28 = 0;
    v29 = v26;
    do
    {
      if (((*(_QWORD *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8) != 0)
        v30 = v29;
      else
        v30 = 0;
      v29 += (*(_QWORD *)((char *)v42 + v28) + 7) & 0xFFFFFFFFFFFFFFF8;
      *(_QWORD *)((char *)v42 + v28) = v30;
      v28 += 8;
    }
    while (v28 != 424);
    v31 = v44;
    v44 += 56;
    *(_QWORD *)(v31 + 48) = 512;
    *(_OWORD *)v31 = xmmword_100027AF0;
    *(_OWORD *)(v31 + 16) = unk_100027B00;
    *(_OWORD *)(v31 + 32) = xmmword_100027B10;
    v32 = *(_DWORD *)v27;
    *(_BYTE *)(v31 + 49) = *((_QWORD *)v27 + 1);
    *(_WORD *)(v31 + 34) = *((_QWORD *)v27 + 2);
    *(_DWORD *)(v31 + 24) = *((_QWORD *)v27 + 3);
    *(_WORD *)(v31 + 32) = *((_QWORD *)v27 + 4);
    *(_WORD *)(v31 + 30) = *((_QWORD *)v27 + 5);
    *(_BYTE *)(v31 + 45) = *((_QWORD *)v27 + 6);
    *(_BYTE *)(v31 + 47) = *((_QWORD *)v27 + 7);
    *(_WORD *)(v31 + 28) = *((_QWORD *)v27 + 8);
    v33 = 72;
    if (v32 < 3)
      v33 = 80;
    v34 = &v27[v33];
    *(_BYTE *)(v31 + 43) = *(_QWORD *)v34;
    *(_BYTE *)(v31 + 44) = *((_QWORD *)v34 + 1);
    if (v32)
    {
      *(_DWORD *)(v31 + 20) = *((_QWORD *)v34 + 2);
      if (v32 <= 3)
      {
        if (v32 == 3)
          *(_WORD *)(v31 + 36) = *((_WORD *)v34 + 16) | (16 * *((_WORD *)v34 + 12));
      }
      else
      {
        v35 = v34[24];
        *(_BYTE *)(v31 + 46) = v35;
        v36 = *((_DWORD *)v34 + 10);
        v37 = v36 | (16 * *((_DWORD *)v34 + 8));
        *(_WORD *)(v31 + 36) = v36 | (16 * *((_WORD *)v34 + 16));
        if (v32 >= 0x15)
        {
          *(_BYTE *)(v31 + 38) = *((_QWORD *)v34 + 6);
          *(_BYTE *)(v31 + 40) = *((_QWORD *)v34 + 7);
          if (v32 != 21)
          {
            *(_QWORD *)(v31 + 8) = *((_QWORD *)v34 + 8);
            *(_BYTE *)(v31 + 42) = *((_QWORD *)v34 + 9);
            if (v32 >= 0x23)
            {
              *(_DWORD *)(v31 + 16) = v34[80] | (unsigned __int16)(*((_DWORD *)v34 + 22) << 8) | (*((_DWORD *)v34 + 24) << 16) | (*((_DWORD *)v34 + 26) << 24);
              if (v32 >= 0x27)
              {
                *(_DWORD *)(v31 + 16) = *((_QWORD *)v34 + 14);
                if (v32 >= 0x2A)
                {
                  *(_WORD *)(v31 + 36) = v37 | (*((_WORD *)v34 + 60) << 8);
                  *(_QWORD *)v31 = *((_QWORD *)v34 + 16);
                  *(_BYTE *)(v31 + 48) = *((_QWORD *)v34 + 17);
                  *(_BYTE *)(v31 + 50) = *((_QWORD *)v34 + 18);
                  if (v32 >= 0x31)
                  {
                    *(_BYTE *)(v31 + 41) = *((_QWORD *)v34 + 19);
                    *(_BYTE *)(v31 + 39) = *((_QWORD *)v34 + 20);
                  }
                }
              }
            }
          }
        }
        if (v35 == 255)
          *(_BYTE *)(v31 + 46) = 0;
      }
    }
    v16[3 * v22++] = v26;
    v21 = v22 >= a5;
    if (v22 == a5)
    {
      *(_QWORD *)v38 = v16;
      *(_DWORD *)(v38 + 8) = a5;
      return;
    }
  }
  a7 = v39;
  if (v39)
  {
LABEL_35:
    if (!v21)
      *a7 = 1;
  }
}

char *sub_10001D000(void *a1, uint64_t a2)
{
  id v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const __CFDictionary *v11;
  io_service_t MatchingService;
  kern_return_t v13;
  BOOL v14;
  kern_return_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 v52;
  unsigned __int8 v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 v60;
  unsigned __int8 v61;
  unsigned __int8 v62;
  unsigned __int8 v63;
  unsigned __int8 v64;
  unsigned __int8 v65;
  unsigned __int8 v66;
  unsigned __int8 v67;
  unsigned __int8 v68;
  unsigned __int8 v69;
  unsigned __int8 v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  unsigned __int8 v73;
  unsigned __int8 v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  unsigned __int8 v88;
  unsigned __int8 v89;
  unsigned __int8 v90;
  unsigned __int8 v91;
  unsigned __int8 v92;
  unsigned __int8 v93;
  unsigned __int8 v94;
  unsigned __int8 v95;
  unsigned __int8 v96;
  unsigned __int8 v97;
  unsigned __int8 v98;
  unsigned __int8 v99;
  unsigned __int8 v100;
  unsigned __int8 v101;
  unsigned __int8 v102;
  unsigned __int8 v103;
  unsigned __int8 v104;
  unsigned __int8 v105;
  unsigned __int8 v106;
  unsigned __int8 v107;
  unsigned __int8 v108;
  unsigned __int8 v109;
  unsigned __int8 v110;
  unsigned __int8 v111;
  unsigned __int8 v112;
  unsigned __int8 v113;
  unsigned __int8 v114;
  unsigned __int8 v115;
  unsigned __int8 v116;
  unsigned __int8 v117;
  uint64_t v118;
  uint64_t v119;
  __int16 v120;
  char *v121;
  char *v122;
  __int128 outputStruct;
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  size_t outputStructCnt;
  io_connect_t connect;

  v3 = a1;
  v4 = (char *)sub_10001EFCC(a2, 0xC210uLL);
  v5 = v4;
  v6 = v4 + 49408;
  if (v4)
    bzero(v4, 0xC210uLL);
  v7 = v3;
  v8 = v7;
  if (v7)
  {
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name")));
    snprintf(v5 + 49152, 0x100uLL, "%s", (const char *)objc_msgSend(v9, "UTF8String"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "targetDeviceArchitecture"));
    *(_DWORD *)v6 = objc_msgSend(v10, "cpuType");
    *((_DWORD *)v6 + 1) = objc_msgSend(v10, "subType");
    *((_WORD *)v6 + 4) = (unsigned __int16)objc_msgSend(v10, "version");
    v6[10] = objc_msgSend(v10, "version") >> 16;
    v6[11] = objc_msgSend(v10, "version") >> 24;
    *((_DWORD *)v6 + 3) = objc_msgSend(v10, "versionCombined");
    *((_QWORD *)v6 + 2) = objc_msgSend(v10, "driverVersion");

    if (*(_DWORD *)v6 == 16777235)
    {
      *((_OWORD *)v5 + 3090) = 0u;
      v11 = IOServiceMatching("AGXAccelerator");
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
      if (MatchingService)
      {
        connect = 0;
        v13 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
        v14 = 0;
        if (!v13)
        {
          outputStruct = 0uLL;
          outputStructCnt = 16;
          v15 = IOConnectCallStructMethod(connect, 0x10Au, 0, 0, &outputStruct, &outputStructCnt);
          v14 = v15 == 0;
          if (!v15)
            *((_OWORD *)v5 + 3090) = outputStruct;
        }
      }
      else
      {
        v14 = 0;
      }
      v6[268] = v14;
    }
    if ((objc_opt_respondsToSelector(v8, "supportsFamily:") & 1) != 0)
    {
      for (i = 0; i != 9; ++i)
        v5[i + 49497] = objc_msgSend(v8, "supportsFamily:", i + 1001);
      v6[98] = objc_msgSend(v8, "supportsFamily:", 2002);
      v17 = 0;
      v6[99] = objc_msgSend(v8, "supportsFamily:", 2003);
      do
      {
        v5[v17 + 49508] = objc_msgSend(v8, "supportsFamily:", v17 + 3001);
        ++v17;
      }
      while (v17 != 3);
      v6[103] = objc_msgSend(v8, "supportsFamily:", 5001);
    }
    *((_QWORD *)v6 + 3) = -1;
    if ((objc_opt_respondsToSelector(v8, "maxThreadgroupMemoryLength") & 1) != 0)
      *((_QWORD *)v6 + 6) = objc_msgSend(v8, "maxThreadgroupMemoryLength");
    if ((objc_opt_respondsToSelector(v8, "maxThreadsPerThreadgroup") & 1) != 0)
    {
      outputStruct = 0uLL;
      *(_QWORD *)&v125 = 0;
      objc_msgSend(v8, "maxThreadsPerThreadgroup");
      v18 = v125;
      *(_OWORD *)(v6 + 56) = outputStruct;
      *((_QWORD *)v6 + 9) = v18;
    }
    if ((objc_opt_respondsToSelector(v8, "maxBufferLength") & 1) != 0)
      *((_QWORD *)v6 + 10) = objc_msgSend(v8, "maxBufferLength");
    if ((objc_opt_respondsToSelector(v8, "supportsLateEvalEvent") & 1) != 0)
      v19 = objc_msgSend(v8, "supportsLateEvalEvent");
    else
      v19 = 0;
    v6[213] = v19;
    if ((objc_opt_respondsToSelector(v8, "supportsRaytracing") & 1) != 0)
      v20 = objc_msgSend(v8, "supportsRaytracing");
    else
      v20 = 0;
    v6[215] = v20;
    if ((objc_opt_respondsToSelector(v8, "supportsTileShaders") & 1) != 0)
      v21 = objc_msgSend(v8, "supportsTileShaders");
    else
      v21 = 0;
    v6[214] = v21;
    if ((objc_opt_respondsToSelector(v8, "supportsMeshShaders") & 1) != 0)
      v22 = objc_msgSend(v8, "supportsMeshShaders");
    else
      v22 = 0;
    v6[216] = v22;
    if ((objc_opt_respondsToSelector(v8, "isMsaa32bSupported") & 1) != 0)
      v23 = objc_msgSend(v8, "isMsaa32bSupported");
    else
      v23 = 0;
    v6[142] = v23;
    if ((objc_opt_respondsToSelector(v8, "supportsBufferWithIOSurface") & 1) != 0)
      v24 = objc_msgSend(v8, "supportsBufferWithIOSurface");
    else
      v24 = 0;
    v6[219] = v24;
    if ((objc_opt_respondsToSelector(v8, "supportsBGR10A2") & 1) != 0)
      v25 = objc_msgSend(v8, "supportsBGR10A2");
    else
      v25 = 0;
    v6[155] = v25;
    if ((objc_opt_respondsToSelector(v8, "supportsSparseHeaps") & 1) != 0)
      v26 = objc_msgSend(v8, "supportsSparseHeaps");
    else
      v26 = 0;
    v6[223] = v26;
    if ((objc_opt_respondsToSelector(v8, "supportsSparseTextures") & 1) != 0)
      v27 = objc_msgSend(v8, "supportsSparseTextures");
    else
      v27 = 0;
    v6[224] = v27;
    if ((objc_opt_respondsToSelector(v8, "supportsPlacementHeaps") & 1) != 0)
      v28 = objc_msgSend(v8, "supportsPlacementHeaps");
    else
      v28 = 0;
    v6[222] = v28;
    if ((objc_opt_respondsToSelector(v8, "supportsComputeMemoryBarrier") & 1) != 0)
      v29 = objc_msgSend(v8, "supportsComputeMemoryBarrier");
    else
      v29 = 0;
    v6[206] = v29;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderMemoryBarrier") & 1) != 0)
      v30 = objc_msgSend(v8, "supportsRenderMemoryBarrier");
    else
      v30 = 0;
    v6[207] = v30;
    if ((objc_opt_respondsToSelector(v8, "supportsPartialRenderMemoryBarrier") & 1) != 0)
      v31 = objc_msgSend(v8, "supportsPartialRenderMemoryBarrier");
    else
      v31 = 0;
    v6[208] = v31;
    if ((objc_opt_respondsToSelector(v8, "supportsVertexAmplificationCount:") & 1) != 0)
    {
      for (j = 0; j != 16; ++j)
        v5[j + 49593] = objc_msgSend(v8, "supportsVertexAmplificationCount:", j);
    }
    if ((objc_opt_respondsToSelector(v8, "supportsTextureSampleCount:") & 1) != 0)
    {
      for (k = 0; k != 32; ++k)
        v5[k + 49512] = objc_msgSend(v8, "supportsTextureSampleCount:", k);
    }
    if ((objc_opt_respondsToSelector(v8, "supportsRasterizationRateMapWithLayerCount:") & 1) != 0)
    {
      for (m = 0; m != 16; ++m)
        v5[m + 49577] = objc_msgSend(v8, "supportsRasterizationRateMapWithLayerCount:", m);
    }
    if ((objc_opt_respondsToSelector(v8, "supportsProgrammableSamplePositions") & 1) != 0)
      v35 = objc_msgSend(v8, "supportsProgrammableSamplePositions");
    else
      v35 = 0;
    v6[168] = v35;
    if ((objc_opt_respondsToSelector(v8, "supportsGFXIndirectCommandBuffers") & 1) != 0)
      v36 = objc_msgSend(v8, "supportsGFXIndirectCommandBuffers");
    else
      v36 = 0;
    v6[209] = v36;
    if ((objc_opt_respondsToSelector(v8, "supportsCMPIndirectCommandBuffers") & 1) != 0)
      v37 = objc_msgSend(v8, "supportsCMPIndirectCommandBuffers");
    else
      v37 = 0;
    v6[210] = v37;
    if ((objc_opt_respondsToSelector(v8, "supportsIndirectDrawAndDispatch") & 1) != 0)
      v38 = objc_msgSend(v8, "supportsIndirectDrawAndDispatch");
    else
      v38 = 0;
    v6[212] = v38;
    if ((objc_opt_respondsToSelector(v8, "supportsMeshShadersInICB") & 1) != 0)
      v39 = objc_msgSend(v8, "supportsMeshShadersInICB");
    else
      v39 = 0;
    v6[211] = v39;
    if ((objc_opt_respondsToSelector(v8, "supportsMemorylessRenderTargets") & 1) != 0)
      v40 = objc_msgSend(v8, "supportsMemorylessRenderTargets");
    else
      v40 = 0;
    v6[137] = v40;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderTargetTextureRotation") & 1) != 0)
      v41 = objc_msgSend(v8, "supportsRenderTargetTextureRotation");
    else
      v41 = 0;
    v6[140] = v41;
    if ((objc_opt_respondsToSelector(v8, "supportsNonUniformThreadgroupSize") & 1) != 0)
      v42 = objc_msgSend(v8, "supportsNonUniformThreadgroupSize");
    else
      v42 = 0;
    v6[217] = v42;
    if ((objc_opt_respondsToSelector(v8, "supportsArgumentBuffersTier2") & 1) != 0)
      v43 = objc_msgSend(v8, "supportsArgumentBuffersTier2");
    else
      v43 = 0;
    v6[136] = v43;
    if ((objc_opt_respondsToSelector(v8, "supportsConcurrentComputeDispatch") & 1) != 0)
      v44 = objc_msgSend(v8, "supportsConcurrentComputeDispatch");
    else
      v44 = 0;
    v6[218] = v44;
    if ((objc_opt_respondsToSelector(v8, "supportsSharedStorageHeapResources") & 1) != 0)
      v45 = objc_msgSend(v8, "supportsSharedStorageHeapResources");
    else
      v45 = 0;
    v6[221] = v45;
    if ((objc_opt_respondsToSelector(v8, "supportsSharedStorageTextures") & 1) != 0)
      v46 = objc_msgSend(v8, "supportsSharedStorageTextures");
    else
      v46 = 0;
    v6[138] = v46;
    if ((objc_opt_respondsToSelector(v8, "supportsSharedTextureHandles") & 1) != 0)
      v47 = objc_msgSend(v8, "supportsSharedTextureHandles");
    else
      v47 = 0;
    v6[139] = v47;
    if ((objc_opt_respondsToSelector(v8, "supportsDynamicAttributeStride") & 1) != 0)
      v48 = objc_msgSend(v8, "supportsDynamicAttributeStride");
    else
      v48 = 0;
    v6[227] = v48;
    if ((objc_opt_respondsToSelector(v8, "supportsNonSquareTileShaders") & 1) != 0)
      v49 = objc_msgSend(v8, "supportsNonSquareTileShaders");
    else
      v49 = 0;
    v6[228] = v49;
    if ((objc_opt_respondsToSelector(v8, "supportsLayeredRendering") & 1) != 0)
      v50 = objc_msgSend(v8, "supportsLayeredRendering");
    else
      v50 = 0;
    v6[229] = v50;
    if ((objc_opt_respondsToSelector(v8, "supportsViewportAndScissorArray") & 1) != 0)
      v51 = objc_msgSend(v8, "supportsViewportAndScissorArray");
    else
      v51 = 0;
    v6[230] = v51;
    if ((objc_opt_respondsToSelector(v8, "supportsLinearTextureFromSharedBuffer") & 1) != 0)
      v52 = objc_msgSend(v8, "supportsLinearTextureFromSharedBuffer");
    else
      v52 = 0;
    v6[143] = v52;
    if ((objc_opt_respondsToSelector(v8, "supportsNonPrivateDepthStencilTextures") & 1) != 0)
      v53 = objc_msgSend(v8, "supportsNonPrivateDepthStencilTextures");
    else
      v53 = 0;
    v6[144] = v53;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderToLinearTextures") & 1) != 0)
      v54 = objc_msgSend(v8, "supportsRenderToLinearTextures");
    else
      v54 = 0;
    v6[145] = v54;
    if ((objc_opt_respondsToSelector(v8, "supportsSeparateDepthStencil") & 1) != 0)
      v55 = objc_msgSend(v8, "supportsSeparateDepthStencil");
    else
      v55 = 0;
    v6[147] = v55;
    if ((objc_opt_respondsToSelector(v8, "supportsRelaxedTextureViewRequirements") & 1) != 0)
      v56 = objc_msgSend(v8, "supportsRelaxedTextureViewRequirements");
    else
      v56 = 0;
    v6[148] = v56;
    if ((objc_opt_respondsToSelector(v8, "supportsVariableRateRasterization") & 1) != 0)
      v57 = objc_msgSend(v8, "supportsVariableRateRasterization");
    else
      v57 = 0;
    v6[238] = v57;
    if ((objc_opt_respondsToSelector(v8, "supportsExtendedVertexFormats") & 1) != 0)
      v58 = objc_msgSend(v8, "supportsExtendedVertexFormats");
    else
      v58 = 0;
    v6[231] = v58;
    if ((objc_opt_respondsToSelector(v8, "supportsFunctionPointers") & 1) != 0)
      v59 = objc_msgSend(v8, "supportsFunctionPointers");
    else
      v59 = 0;
    v6[203] = v59;
    if ((objc_opt_respondsToSelector(v8, "supportsFunctionPointersFromRender") & 1) != 0)
      v60 = objc_msgSend(v8, "supportsFunctionPointersFromRender");
    else
      v60 = 0;
    v6[204] = v60;
    if ((objc_opt_respondsToSelector(v8, "supportsFunctionPointersFromMesh") & 1) != 0)
      v61 = objc_msgSend(v8, "supportsFunctionPointersFromMesh");
    else
      v61 = 0;
    v6[205] = v61;
    if ((objc_opt_respondsToSelector(v8, "supportsDynamicLibraries") & 1) != 0)
      v62 = objc_msgSend(v8, "supportsDynamicLibraries");
    else
      v62 = 0;
    v6[201] = v62;
    if ((objc_opt_respondsToSelector(v8, "supportsRenderDynamicLibraries") & 1) != 0)
      v63 = objc_msgSend(v8, "supportsRenderDynamicLibraries");
    else
      v63 = 0;
    v6[202] = v63;
    if ((objc_opt_respondsToSelector(v8, "supportsDepthClipMode") & 1) != 0)
      v64 = objc_msgSend(v8, "supportsDepthClipMode");
    else
      v64 = 0;
    v6[239] = v64;
    if ((objc_opt_respondsToSelector(v8, "supportsDepthClipModeClampExtended") & 1) != 0)
      v65 = objc_msgSend(v8, "supportsDepthClipModeClampExtended");
    else
      v65 = 0;
    v6[240] = v65;
    if ((objc_opt_respondsToSelector(v8, "supportsSparseDepthAttachments") & 1) != 0)
      v66 = objc_msgSend(v8, "supportsSparseDepthAttachments");
    else
      v66 = 0;
    v6[225] = v66;
    if ((objc_opt_respondsToSelector(v8, "supportsLossyCompression") & 1) != 0)
      v67 = objc_msgSend(v8, "supportsLossyCompression");
    else
      v67 = 0;
    v6[146] = v67;
    if ((objc_opt_respondsToSelector(v8, "supportsTextureSwizzle") & 1) != 0)
      v68 = objc_msgSend(v8, "supportsTextureSwizzle");
    else
      v68 = 0;
    v6[149] = v68;
    if ((objc_opt_respondsToSelector(v8, "supportsTextureCubeArray") & 1) != 0)
      v69 = objc_msgSend(v8, "supportsTextureCubeArray");
    else
      v69 = 0;
    v6[150] = v69;
    if ((objc_opt_respondsToSelector(v8, "supportsTexture2DMultisampleArray") & 1) != 0)
      v70 = objc_msgSend(v8, "supportsTexture2DMultisampleArray");
    else
      v70 = 0;
    v6[151] = v70;
    if ((objc_opt_respondsToSelector(v8, "supportsLinearTexture2DArray") & 1) != 0)
      v71 = objc_msgSend(v8, "supportsLinearTexture2DArray");
    else
      v71 = 0;
    v6[152] = v71;
    if ((objc_opt_respondsToSelector(v8, "supports2DLinearTexArraySPI") & 1) != 0)
      v72 = objc_msgSend(v8, "supports2DLinearTexArraySPI");
    else
      v72 = 0;
    v6[153] = v72;
    if ((objc_opt_respondsToSelector(v8, "supportsRGBA10A2Gamma") & 1) != 0)
      v73 = objc_msgSend(v8, "supportsRGBA10A2Gamma");
    else
      v73 = 0;
    v6[154] = v73;
    if ((objc_opt_respondsToSelector(v8, "supportsBGR10A2") & 1) != 0)
      v74 = objc_msgSend(v8, "supportsBGR10A2");
    else
      v74 = 0;
    v6[155] = v74;
    if ((objc_opt_respondsToSelector(v8, "supportsSRGBwrites") & 1) != 0)
      v75 = objc_msgSend(v8, "supportsSRGBwrites");
    else
      v75 = 0;
    v6[156] = v75;
    if ((objc_opt_respondsToSelector(v8, "supportsBfloat16Format") & 1) != 0)
      v76 = objc_msgSend(v8, "supportsBfloat16Format");
    else
      v76 = 0;
    v6[157] = v76;
    if ((objc_opt_respondsToSelector(v8, "supportsSamplerAddressModeClampToHalfBorder") & 1) != 0)
      v77 = objc_msgSend(v8, "supportsSamplerAddressModeClampToHalfBorder");
    else
      v77 = 0;
    v6[233] = v77;
    if ((objc_opt_respondsToSelector(v8, "supportsCustomBorderColor") & 1) != 0)
      v78 = objc_msgSend(v8, "supportsCustomBorderColor");
    else
      v78 = 0;
    v6[234] = v78;
    if ((objc_opt_respondsToSelector(v8, "supportsSamplerCompareFunction") & 1) != 0)
      v79 = objc_msgSend(v8, "supportsSamplerCompareFunction");
    else
      v79 = 0;
    v6[235] = v79;
    if ((objc_opt_respondsToSelector(v8, "supportsBlackOrWhiteSamplerBorderColors") & 1) != 0)
      v80 = objc_msgSend(v8, "supportsBlackOrWhiteSamplerBorderColors");
    else
      v80 = 0;
    v6[236] = v80;
    if ((objc_opt_respondsToSelector(v8, "supportsMirrorClampToEdgeSamplerMode") & 1) != 0)
      v81 = objc_msgSend(v8, "supportsMirrorClampToEdgeSamplerMode");
    else
      v81 = 0;
    v6[237] = v81;
    if ((objc_opt_respondsToSelector(v8, "supportsPrimitiveMotionBlur") & 1) != 0)
      v82 = objc_msgSend(v8, "supportsPrimitiveMotionBlur");
    else
      v82 = 0;
    v6[158] = v82;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingICBs") & 1) != 0)
      v83 = objc_msgSend(v8, "supportsRayTracingICBs");
    else
      v83 = 0;
    v6[159] = v83;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingExtendedVertexFormats") & 1) != 0)
      v84 = objc_msgSend(v8, "supportsRayTracingExtendedVertexFormats");
    else
      v84 = 0;
    v6[160] = v84;
    if ((objc_opt_respondsToSelector(v8, "supportsHeapAccelerationStructureAllocation") & 1) != 0)
      v85 = objc_msgSend(v8, "supportsHeapAccelerationStructureAllocation");
    else
      v85 = 0;
    v6[226] = v85;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingPerPrimitiveData") & 1) != 0)
      v86 = objc_msgSend(v8, "supportsRayTracingPerPrimitiveData");
    else
      v86 = 0;
    v6[161] = v86;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingBuffersFromTables") & 1) != 0)
      v87 = objc_msgSend(v8, "supportsRayTracingBuffersFromTables");
    else
      v87 = 0;
    v6[162] = v87;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingAccelerationStructureCPUDeserialization") & 1) != 0)
      v88 = objc_msgSend(v8, "supportsRayTracingAccelerationStructureCPUDeserialization");
    else
      v88 = 0;
    v6[163] = v88;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingMultiLevelInstancing") & 1) != 0)
      v89 = objc_msgSend(v8, "supportsRayTracingMultiLevelInstancing");
    else
      v89 = 0;
    v6[164] = v89;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingIndirectInstanceAccelerationStructureBuild") & 1) != 0)
      v90 = objc_msgSend(v8, "supportsRayTracingIndirectInstanceAccelerationStructureBuild");
    else
      v90 = 0;
    v6[165] = v90;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingGPUTableUpdateBuffers") & 1) != 0)
      v91 = objc_msgSend(v8, "supportsRayTracingGPUTableUpdateBuffers");
    else
      v91 = 0;
    v6[166] = v91;
    if ((objc_opt_respondsToSelector(v8, "supportsRayTracingCurves") & 1) != 0)
      v92 = objc_msgSend(v8, "supportsRayTracingCurves");
    else
      v92 = 0;
    v6[167] = v92;
    if ((objc_opt_respondsToSelector(v8, "supportsBCTextureCompression") & 1) != 0)
      v93 = objc_msgSend(v8, "supportsBCTextureCompression");
    else
      v93 = 0;
    v6[241] = v93;
    if ((objc_opt_respondsToSelector(v8, "supports3DBCTextures") & 1) != 0)
      v94 = objc_msgSend(v8, "supports3DBCTextures");
    else
      v94 = 0;
    v6[242] = v94;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAADepthResolve") & 1) != 0)
      v95 = objc_msgSend(v8, "supportsMSAADepthResolve");
    else
      v95 = 0;
    v6[243] = v95;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAAStencilResolve") & 1) != 0)
      v96 = objc_msgSend(v8, "supportsMSAAStencilResolve");
    else
      v96 = 0;
    v6[244] = v96;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAADepthResolveFilter") & 1) != 0)
      v97 = objc_msgSend(v8, "supportsMSAADepthResolveFilter");
    else
      v97 = 0;
    v6[245] = v97;
    if ((objc_opt_respondsToSelector(v8, "supports32bpcMSAATextures") & 1) != 0)
      v98 = objc_msgSend(v8, "supports32bpcMSAATextures");
    else
      v98 = 0;
    v6[246] = v98;
    if ((objc_opt_respondsToSelector(v8, "supports32BitMSAA") & 1) != 0)
      v99 = objc_msgSend(v8, "supports32BitMSAA");
    else
      v99 = 0;
    v6[247] = v99;
    if ((objc_opt_respondsToSelector(v8, "supportsNonPrivateMSAATextures") & 1) != 0)
      v100 = objc_msgSend(v8, "supportsNonPrivateMSAATextures");
    else
      v100 = 0;
    v6[248] = v100;
    if ((objc_opt_respondsToSelector(v8, "supportsCombinedMSAAStoreAndResolveAction") & 1) != 0)
      v101 = objc_msgSend(v8, "supportsCombinedMSAAStoreAndResolveAction");
    else
      v101 = 0;
    v6[249] = v101;
    if ((objc_opt_respondsToSelector(v8, "supportsMSAAStencilResolveFilter") & 1) != 0)
      v102 = objc_msgSend(v8, "supportsMSAAStencilResolveFilter");
    else
      v102 = 0;
    v6[250] = v102;
    if ((objc_opt_respondsToSelector(v8, "supportsASTCTextureCompression") & 1) != 0)
      v103 = objc_msgSend(v8, "supportsASTCTextureCompression");
    else
      v103 = 0;
    v6[251] = v103;
    if ((objc_opt_respondsToSelector(v8, "supports3DASTCTextures") & 1) != 0)
      v104 = objc_msgSend(v8, "supports3DASTCTextures");
    else
      v104 = 0;
    v6[252] = v104;
    if ((objc_opt_respondsToSelector(v8, "supportsASTCHDRTextureCompression") & 1) != 0)
      v105 = objc_msgSend(v8, "supportsASTCHDRTextureCompression");
    else
      v105 = 0;
    v6[253] = v105;
    if ((objc_opt_respondsToSelector(v8, "supportsLimitedYUVFormats") & 1) != 0)
      v106 = objc_msgSend(v8, "supportsLimitedYUVFormats");
    else
      v106 = 0;
    v6[254] = v106;
    if ((objc_opt_respondsToSelector(v8, "supportsExtendedYUVFormats") & 1) != 0)
      v107 = objc_msgSend(v8, "supportsExtendedYUVFormats");
    else
      v107 = 0;
    v6[255] = v107;
    if ((objc_opt_respondsToSelector(v8, "supportsAlphaYUVFormats") & 1) != 0)
      v108 = objc_msgSend(v8, "supportsAlphaYUVFormats");
    else
      v108 = 0;
    v6[256] = v108;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormats") & 1) != 0)
      v109 = objc_msgSend(v8, "supportsYCBCRFormats");
    else
      v109 = 0;
    v6[257] = v109;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormatsPQ") & 1) != 0)
      v110 = objc_msgSend(v8, "supportsYCBCRFormatsPQ");
    else
      v110 = 0;
    v6[258] = v110;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormats12") & 1) != 0)
      v111 = objc_msgSend(v8, "supportsYCBCRFormats12");
    else
      v111 = 0;
    v6[259] = v111;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRFormatsXR") & 1) != 0)
      v112 = objc_msgSend(v8, "supportsYCBCRFormatsXR");
    else
      v112 = 0;
    v6[260] = v112;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRPackedFormatsPQ") & 1) != 0)
      v113 = objc_msgSend(v8, "supportsYCBCRPackedFormatsPQ");
    else
      v113 = 0;
    v6[261] = v113;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRPackedFormats12") & 1) != 0)
      v114 = objc_msgSend(v8, "supportsYCBCRPackedFormats12");
    else
      v114 = 0;
    v6[262] = v114;
    if ((objc_opt_respondsToSelector(v8, "supportsYCBCRPackedFormatsXR") & 1) != 0)
      v115 = objc_msgSend(v8, "supportsYCBCRPackedFormatsXR");
    else
      v115 = 0;
    v6[263] = v115;
    if ((objc_opt_respondsToSelector(v8, "supportsPublicXR10Formats") & 1) != 0)
      v116 = objc_msgSend(v8, "supportsPublicXR10Formats");
    else
      v116 = 0;
    v6[264] = v116;
    if ((objc_opt_respondsToSelector(v8, "supportsExtendedXR10Formats") & 1) != 0)
      v117 = objc_msgSend(v8, "supportsExtendedXR10Formats");
    else
      v117 = 0;
    v118 = 0;
    v6[265] = v117;
    do
    {
      v119 = (unsigned __int16)word_100027B28[v118];
      v127 = 0;
      v125 = 0u;
      v126 = 0u;
      outputStruct = 0u;
      MTLPixelFormatGetInfoForDevice(&outputStruct, v8, v119);
      v120 = WORD4(outputStruct);
      v121 = &v5[12 * v119];
      *(_DWORD *)v121 = DWORD2(outputStruct);
      *((_WORD *)v121 + 2) = v119;
      if ((v120 & 0x400) == 0)
        *(_WORD *)&v5[12 * v119 + 6] = BYTE1(v126);
      if ((v120 & 0x461) == 1)
      {
        v122 = &v5[12 * v119];
        *((_WORD *)v122 + 4) = (unsigned __int16)objc_msgSend(v8, "minimumLinearTextureAlignmentForPixelFormat:", v119);
        *((_WORD *)v122 + 5) = (unsigned __int16)objc_msgSend(v8, "minimumTextureBufferAlignmentForPixelFormat:", v119);
      }
      ++v118;
    }
    while (v118 != 275);
    v6[267] = +[MTLFXSpatialScalerDescriptor supportsDevice:](MTLFXSpatialScalerDescriptor, "supportsDevice:", v8);
    v6[266] = +[MTLFXTemporalScalerDescriptor supportsDevice:](MTLFXTemporalScalerDescriptor, "supportsDevice:", v8);
  }
  else
  {
    v6[88] = 1;
  }

  return v5;
}

uint64_t sub_10001E378(uint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v20;
  id v22;

  v22 = a3;
  v5 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = *a1;
      v10 = *(_QWORD *)(*a1 + v6);
      if ((*(_BYTE *)(a2 + 12 * *(unsigned __int16 *)(v10 + 34)) & 1) != 0)
      {
        v11 = v22;
        v12 = objc_alloc_init((Class)MTLTextureDescriptor);
        objc_msgSend(v12, "setTextureType:", *(unsigned __int8 *)(v10 + 49));
        objc_msgSend(v12, "setPixelFormat:", *(unsigned __int16 *)(v10 + 34));
        objc_msgSend(v12, "setWidth:", *(unsigned int *)(v10 + 24));
        objc_msgSend(v12, "setHeight:", *(unsigned __int16 *)(v10 + 32));
        objc_msgSend(v12, "setDepth:", *(unsigned __int16 *)(v10 + 30));
        objc_msgSend(v12, "setMipmapLevelCount:", *(unsigned __int8 *)(v10 + 45));
        objc_msgSend(v12, "setSampleCount:", *(unsigned __int8 *)(v10 + 47));
        objc_msgSend(v12, "setArrayLength:", *(unsigned __int16 *)(v10 + 28));
        objc_msgSend(v12, "setUsage:", *(unsigned int *)(v10 + 20));
        objc_msgSend(v12, "setResourceOptions:", *(unsigned __int16 *)(v10 + 36));
        if ((objc_opt_respondsToSelector(v12, "swizzleKey") & 1) != 0)
          objc_msgSend(v12, "setSwizzleKey:", *(unsigned int *)(v10 + 16));
        if ((objc_opt_respondsToSelector(v12, "rotation") & 1) != 0)
          objc_msgSend(v12, "setRotation:", *(unsigned __int8 *)(v10 + 46));
        if ((objc_opt_respondsToSelector(v12, "allowGPUOptimizedContents") & 1) != 0)
          objc_msgSend(v12, "setAllowGPUOptimizedContents:", *(_BYTE *)(v10 + 38) != 0);
        if ((objc_opt_respondsToSelector(v12, "sparseSurfaceDefaultValue") & 1) != 0)
          objc_msgSend(v12, "setSparseSurfaceDefaultValue:", *(unsigned __int8 *)(v10 + 48));
        if ((objc_opt_respondsToSelector(v12, "writeSwizzleEnabled") & 1) != 0)
          objc_msgSend(v12, "setWriteSwizzleEnabled:", *(_BYTE *)(v10 + 50) != 0);
        if ((objc_opt_respondsToSelector(v12, "compressionType") & 1) != 0)
        {
          objc_msgSend(v12, "setCompressionType:", *(unsigned __int8 *)(v10 + 41));
        }
        else if ((objc_opt_respondsToSelector(v12, "lossyCompressionMode") & 1) != 0)
        {
          objc_msgSend(v12, "setLossyCompressionMode:", *(unsigned __int8 *)(v10 + 41));
        }
        if ((objc_opt_respondsToSelector(v12, "compressionFootprint") & 1) != 0)
          objc_msgSend(v12, "setCompressionFootprint:", *(unsigned __int8 *)(v10 + 39));
        if ((objc_opt_respondsToSelector(v12, "compressionMode") & 1) != 0)
          objc_msgSend(v12, "setCompressionMode:", *(unsigned __int8 *)(v10 + 40));
        objc_msgSend(v12, "setAllowGPUOptimizedContents:", *(_BYTE *)(v10 + 38) != 0);
        objc_msgSend(v12, "setFramebufferOnly:", *(_BYTE *)(v10 + 43) != 0);
        objc_msgSend(v12, "setIsDrawable:", *(_BYTE *)(v10 + 44) != 0);
        v13 = objc_msgSend(v11, "heapTextureSizeAndAlignWithDescriptor:", v12);
        v15 = v14;

        v16 = v9 + v6;
        v17 = *(_QWORD *)(v9 + v6 + 8);
        v18 = *(_QWORD *)(v16 + 16);

        v20 = v17 >= v15 && v18 <= (unint64_t)v13;
        v8 &= v20;
        v5 = *((unsigned int *)a1 + 2);
      }
      ++v7;
      v6 += 24;
    }
    while (v7 < v5);
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

uint64_t sub_10001E698(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  _QWORD *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;

  v5 = a3;
  if (*(_BYTE *)(a2 + 49623) && *(_DWORD *)(a1 + 8))
  {
    v6 = 0;
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = (_QWORD *)(*(_QWORD *)a1 + v6);
      if (v9[2] > (unint64_t)objc_msgSend(v5, "heapAccelerationStructureSizeAndAlignWithSize:", *v9))
        v11 = 0;
      else
        v11 = v8;
      if (v9[1] >= v10)
        v8 = v11;
      else
        v8 = 0;
      ++v7;
      v6 += 24;
    }
    while (v7 < *(unsigned int *)(a1 + 8));
    v12 = v8 & 1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

vm_address_t sub_10001E748(memory_object_size_t a1)
{
  kern_return_t memory_entry_64;
  mach_error_t v3;
  char *v4;
  const char *v5;
  kern_return_t v6;
  mach_error_t v7;
  char *v9;
  memory_object_size_t size;
  mach_port_t object_handle;
  vm_address_t address;
  uint8_t buf[4];
  mach_error_t v14;
  __int16 v15;
  char *v16;

  address = 0;
  object_handle = 0;
  size = a1;
  memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, 0, 139267, &object_handle, 0);
  if (memory_entry_64)
  {
    v3 = memory_entry_64;
    sub_10001F460();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v4 = mach_error_string(v3);
      *(_DWORD *)buf = 67109378;
      v14 = v3;
      v15 = 2080;
      v16 = v4;
      v5 = "warning: failed to create memory entry error 0x%x (%s)";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v5, buf, 0x12u);
    }
  }
  else
  {
    v6 = vm_map(mach_task_self_, &address, a1, 0, 1, object_handle, 0, 0, 3, 3, 1u);
    if (!v6)
    {
      mach_port_deallocate(mach_task_self_, object_handle);
      return address;
    }
    v7 = v6;
    sub_10001F460();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v9 = mach_error_string(v7);
      *(_DWORD *)buf = 67109378;
      v14 = v7;
      v15 = 2080;
      v16 = v9;
      v5 = "warning: failed to map memory error 0x%x (%s)";
      goto LABEL_10;
    }
  }
  return 0;
}

uint64_t sub_10001E8F0(uint64_t a1)
{
  if (qword_10003DD00 == a1)
    qword_10003DD00 = 0;
  return 0;
}

void apr_pool_destroy(apr_pool_t *p)
{
  uint64_t i;
  apr_pool_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  vm_address_t v17;
  vm_address_t v18;
  uint64_t v19;
  vm_address_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  vm_address_t v24;
  unint64_t v25;
  vm_address_t v26;
  uint64_t v27;
  BOOL v29;
  uint64_t v30;
  vm_address_t v31;
  __int128 v32;

  for (i = *((_QWORD *)p + 14); i; i = *((_QWORD *)p + 14))
  {
    *((_QWORD *)p + 14) = *(_QWORD *)i;
    (*(void (**)(_QWORD))(i + 16))(*(_QWORD *)(i + 8));
  }
  *((_QWORD *)p + 14) = 0;
  while (1)
  {
    v3 = (apr_pool_t *)*((_QWORD *)p + 1);
    if (!v3)
      break;
    apr_pool_destroy(v3);
  }
  while (1)
  {
    v4 = *((_QWORD *)p + 4);
    if (!v4)
      break;
    *((_QWORD *)p + 4) = *(_QWORD *)v4;
    (*(void (**)(_QWORD))(v4 + 16))(*(_QWORD *)(v4 + 8));
  }
  v5 = *((_QWORD *)p + 7);
  if (!v5)
    goto LABEL_42;
  v6 = *((_QWORD *)p + 7);
  do
  {
    if (sub_10001F160(*(pid_t **)v6, 1) != 70006)
      *(_DWORD *)(v6 + 8) = 0;
    v6 = *(_QWORD *)(v6 + 16);
  }
  while (v6);
  v7 = v5;
  do
  {
    v8 = *(_DWORD *)(v7 + 8);
    if (v8 == 1)
    {
      sub_10001F3AC(**(_DWORD **)v7, 9);
    }
    else
    {
      v9 = v8 == 4 || v8 == 2;
      if (v9 && !sub_10001F3AC(**(_DWORD **)v7, 15))
        LODWORD(v6) = 1;
    }
    v7 = *(_QWORD *)(v7 + 16);
  }
  while (v7);
  v10 = v5;
  if (!(_DWORD)v6)
    goto LABEL_36;
  v32 = xmmword_100027A90;
  select(0, 0, 0, 0, (timeval *)&v32);
  v11 = 46875;
  while (2)
  {
    v12 = 0;
    v13 = v5;
    do
    {
      v14 = v12;
      if (*(_DWORD *)(v13 + 8) == 2)
      {
        v12 = 1;
        if (sub_10001F160(*(pid_t **)v13, 1) == 70006)
          goto LABEL_31;
        *(_DWORD *)(v13 + 8) = 0;
      }
      v12 = v14;
LABEL_31:
      v13 = *(_QWORD *)(v13 + 16);
    }
    while (v13);
    if ((_DWORD)v12 && v11 <= 0x2DC6BF)
    {
      *(_QWORD *)&v32 = v11 / 0xF4240;
      *((_QWORD *)&v32 + 1) = v11 % 0xF4240;
      select(0, 0, 0, 0, (timeval *)&v32);
      v11 *= 2;
      continue;
    }
    break;
  }
  v10 = v5;
  do
  {
LABEL_36:
    if (*(_DWORD *)(v10 + 8) == 2)
      sub_10001F3AC(**(_DWORD **)v10, 9);
    v10 = *(_QWORD *)(v10 + 16);
  }
  while (v10);
  do
  {
    if (*(_DWORD *)(v5 + 8))
      sub_10001F160(*(pid_t **)v5, 0);
    v5 = *(_QWORD *)(v5 + 16);
  }
  while (v5);
LABEL_42:
  if (*(_QWORD *)p)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)p + 48) + 24);
    if (v15)
      pthread_mutex_lock((pthread_mutex_t *)(v15 + 8));
    v16 = *((_QWORD *)p + 2);
    **((_QWORD **)p + 3) = v16;
    if (v16)
      *(_QWORD *)(*((_QWORD *)p + 2) + 24) = *((_QWORD *)p + 3);
    if (v15)
      pthread_mutex_unlock((pthread_mutex_t *)(v15 + 8));
  }
  v17 = *((_QWORD *)p + 6);
  v18 = *((_QWORD *)p + 12);
  **(_QWORD **)(v18 + 8) = 0;
  if (*(apr_pool_t **)(v17 + 32) == p)
  {
    *(_QWORD *)(v17 + 24) = 0;
  }
  else
  {
    v19 = *(_QWORD *)(v17 + 24);
    if (v19)
      pthread_mutex_lock((pthread_mutex_t *)(v19 + 8));
  }
  v20 = 0;
  v21 = *(_QWORD *)v17;
  v22 = *(_QWORD *)(v17 + 8);
  v23 = *(_QWORD *)(v17 + 16);
  do
  {
    while (1)
    {
      while (1)
      {
        v24 = v18;
        v18 = *(_QWORD *)v18;
        v25 = *(unsigned int *)(v24 + 16);
        if (!v22 || v23 > v25)
          break;
        *(_QWORD *)v24 = v20;
        v20 = v24;
        if (!v18)
          goto LABEL_72;
      }
      if (v25 > 0x13)
        break;
      v26 = v17 + 8 * v25;
      v27 = *(_QWORD *)(v26 + 40);
      *(_QWORD *)v24 = v27;
      if (v21 < v25 && v27 == 0)
        v21 = v25;
      *(_QWORD *)(v26 + 40) = v24;
      if (v23 <= v25)
      {
        v23 = 0;
        if (!v18)
          goto LABEL_72;
      }
      else
      {
        v23 += ~v25;
        if (!v18)
          goto LABEL_72;
      }
    }
    *(_QWORD *)v24 = *(_QWORD *)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v24;
    v29 = v23 > v25;
    v23 += ~v25;
    if (!v29)
      v23 = 0;
  }
  while (v18);
LABEL_72:
  *(_QWORD *)v17 = v21;
  *(_QWORD *)(v17 + 16) = v23;
  v30 = *(_QWORD *)(v17 + 24);
  if (v30)
    pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
  if (v20)
  {
    do
    {
      v31 = *(_QWORD *)v20;
      vm_deallocate(mach_task_self_, v20, ((*(_DWORD *)(v20 + 16) << 12) + 4096));
      v20 = v31;
    }
    while (v31);
  }
  if (*(apr_pool_t **)(v17 + 32) == p)
    sub_10001EC9C(v17);
}

uint64_t sub_10001EC9C(vm_address_t address)
{
  uint64_t i;
  vm_address_t v3;
  vm_address_t v4;
  vm_address_t *v5;
  vm_address_t v6;

  for (i = 0; i != 20; ++i)
  {
    v3 = address + 8 * i;
    v6 = *(_QWORD *)(v3 + 40);
    v5 = (vm_address_t *)(v3 + 40);
    v4 = v6;
    if (v6)
    {
      do
      {
        *v5 = *(_QWORD *)v4;
        vm_deallocate(mach_task_self_, v4, ((*(_DWORD *)(v4 + 16) << 12) + 4096));
        v4 = *v5;
      }
      while (*v5);
    }
  }
  return vm_deallocate(mach_task_self_, address, 0xC8uLL);
}

_QWORD *sub_10001ED14(unint64_t *a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  memory_object_size_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  _QWORD *v21;
  BOOL v22;
  unint64_t v23;
  vm_address_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v28;
  unint64_t v29;
  unint64_t v30;

  v2 = 0;
  v3 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  v4 = 0x2000;
  if (v3 > 0x2000)
    v4 = (a2 + 4135) & 0xFFFFFFFFFFFFF000;
  if (v3 >= a2)
    v5 = v4;
  else
    v5 = 0;
  if (v3 >= a2)
  {
    v6 = v4 >> 12;
    v7 = (v4 >> 12) - 1;
    if (HIDWORD(v7))
      return 0;
    v9 = *a1;
    if (v7 <= *a1)
    {
      v14 = a1[3];
      if (v14)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v14 + 8));
        v9 = *a1;
      }
      v15 = &a1[v7];
      v17 = (_QWORD *)v15[5];
      v16 = v15 + 5;
      v2 = v17;
      v18 = v17 == 0;
      v19 = v7 < v9;
      if (v17)
        v20 = 1;
      else
        v20 = v7 >= v9;
      if (!v20)
      {
        do
        {
          v21 = (_QWORD *)v16[1];
          ++v16;
          v2 = v21;
          v18 = v21 == 0;
          v19 = v6 < v9;
          if (v21)
            v22 = 1;
          else
            v22 = v6 >= v9;
          ++v6;
        }
        while (!v22);
      }
      if (!v18)
      {
        v25 = *v2;
        *v16 = *v2;
        if (v25)
          v19 = 1;
        if (!v19)
        {
          v26 = v16 - 1;
          do
          {
            if (*v26--)
              v28 = 1;
            else
              v28 = v9 == 1;
            --v9;
          }
          while (!v28);
          *a1 = v9;
        }
        v13 = (*((_DWORD *)v2 + 4) + 1);
LABEL_43:
        v29 = a1[2] + v13;
        if (v29 >= a1[1])
          v29 = a1[1];
        a1[2] = v29;
        v30 = a1[3];
        if (v30)
          pthread_mutex_unlock((pthread_mutex_t *)(v30 + 8));
        goto LABEL_47;
      }
    }
    else
    {
      v2 = a1 + 5;
      if (!a1[5])
      {
LABEL_30:
        v24 = sub_10001E748(v5);
        v2 = (_QWORD *)v24;
        if (!v24)
          return v2;
        *(_DWORD *)(v24 + 16) = v7;
        *(_QWORD *)(v24 + 32) = v24 + v5;
LABEL_47:
        *v2 = 0;
        v2[3] = v2 + 5;
        return v2;
      }
      v10 = a1[3];
      if (v10)
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      while (1)
      {
        v11 = v2;
        v2 = (_QWORD *)*v2;
        if (!v2)
          break;
        v12 = *((unsigned int *)v2 + 4);
        if (v7 <= v12)
        {
          *v11 = *v2;
          v13 = (v12 + 1);
          goto LABEL_43;
        }
      }
    }
    v23 = a1[3];
    if (v23)
      pthread_mutex_unlock((pthread_mutex_t *)(v23 + 8));
    goto LABEL_30;
  }
  return v2;
}

apr_status_t apr_pool_create_ex(apr_pool_t **newpool, apr_pool_t *parent, apr_abortfunc_t abort_fn, apr_allocator_t *allocator)
{
  unint64_t *v4;
  apr_abortfunc_t v5;
  apr_pool_t *v7;
  apr_pool_t *v8;
  apr_pool_t **v9;
  uint64_t v10;
  apr_pool_t *v11;
  apr_pool_t ***v12;
  apr_pool_t *v13;
  apr_status_t v14;

  v4 = (unint64_t *)allocator;
  v5 = abort_fn;
  *newpool = 0;
  if (parent)
    v7 = parent;
  else
    v7 = (apr_pool_t *)qword_10003DD18;
  if (!abort_fn && v7)
    v5 = (apr_abortfunc_t)*((_QWORD *)v7 + 8);
  if (!allocator)
    v4 = (unint64_t *)*((_QWORD *)v7 + 6);
  v8 = (apr_pool_t *)sub_10001ED14(v4, 0x1FD8uLL);
  if (v8)
  {
    *(_QWORD *)v8 = v8;
    *((_QWORD *)v8 + 1) = v8;
    v9 = (apr_pool_t **)*((_QWORD *)v8 + 3);
    *((_QWORD *)v8 + 3) = v9 + 15;
    v9[12] = v8;
    v9[13] = (apr_pool_t *)(v9 + 15);
    v9[14] = 0;
    v9[6] = (apr_pool_t *)v4;
    v9[7] = 0;
    v9[4] = 0;
    v9[5] = 0;
    v9[10] = 0;
    v9[11] = v8;
    v9[8] = (apr_pool_t *)v5;
    v9[9] = 0;
    *v9 = v7;
    v9[1] = 0;
    if (v7)
    {
      v10 = *(_QWORD *)(*((_QWORD *)v7 + 6) + 24);
      if (v10)
        pthread_mutex_lock((pthread_mutex_t *)(v10 + 8));
      v13 = (apr_pool_t *)*((_QWORD *)v7 + 1);
      v12 = (apr_pool_t ***)((char *)v7 + 8);
      v11 = v13;
      v9[2] = v13;
      if (v13)
        *((_QWORD *)v11 + 3) = v9 + 2;
      *v12 = v9;
      v9[3] = (apr_pool_t *)v12;
      if (v10)
        pthread_mutex_unlock((pthread_mutex_t *)(v10 + 8));
    }
    else
    {
      v9[2] = 0;
      v9[3] = 0;
    }
    v14 = 0;
    *newpool = (apr_pool_t *)v9;
  }
  else
  {
    v14 = 12;
    if (v5)
      ((void (*)(uint64_t))v5)(12);
  }
  return v14;
}

uint64_t sub_10001EFCC(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  void (*v4)(uint64_t);
  uint64_t result;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;

  v3 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (v3 < a2)
  {
LABEL_2:
    v4 = *(void (**)(uint64_t))(a1 + 64);
    if (v4)
      v4(12);
    return 0;
  }
  v6 = *(_QWORD **)(a1 + 88);
  result = v6[3];
  if (v3 <= v6[4] - result)
  {
    v6[3] = result + v3;
    return result;
  }
  v7 = (_QWORD *)*v6;
  if (v3 <= *(_QWORD *)(*v6 + 32) - *(_QWORD *)(*v6 + 24))
  {
    *(_QWORD *)v7[1] = *v7;
    *(_QWORD *)(*v7 + 8) = v7[1];
  }
  else
  {
    v7 = sub_10001ED14(*(unint64_t **)(a1 + 48), (a2 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (!v7)
      goto LABEL_2;
  }
  *((_DWORD *)v7 + 5) = 0;
  result = v7[3];
  v7[3] = result + v3;
  v8 = (_QWORD *)v6[1];
  v7[1] = v8;
  *v8 = v7;
  *v7 = v6;
  v6[1] = v7;
  *(_QWORD *)(a1 + 88) = v7;
  v9 = (uint64_t)(v6[4] - v6[3]) >> 12;
  *((_DWORD *)v6 + 5) = v9;
  if (v9 < *(unsigned int *)(*v6 + 20))
  {
    v10 = (uint64_t *)*v6;
    do
      v10 = (uint64_t *)*v10;
    while (*((_DWORD *)v10 + 5) > v9);
    *v7 = *v6;
    *(_QWORD *)(*v6 + 8) = v6[1];
    v11 = (_QWORD *)v10[1];
    v6[1] = v11;
    *v11 = v6;
    *v6 = v10;
    v10[1] = (uint64_t)v6;
  }
  return result;
}

_QWORD *sub_10001F0F0(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = (uint64_t)result;
    result = (_QWORD *)result[5];
    if (result)
      *(_QWORD *)(v5 + 40) = *result;
    else
      result = (_QWORD *)sub_10001EFCC(v5, 0x20uLL);
    result[2] = a3;
    result[3] = sub_10001F158;
    *result = *(_QWORD *)(v5 + 32);
    result[1] = a2;
    *(_QWORD *)(v5 + 32) = result;
  }
  return result;
}

uint64_t sub_10001F158()
{
  return 0;
}

uint64_t sub_10001F160(pid_t *a1, int a2)
{
  int v3;
  pid_t v4;
  int v6;

  v6 = 0;
  if (a2)
    v3 = 3;
  else
    v3 = 2;
  while (1)
  {
    v4 = waitpid(*a1, &v6, v3);
    if ((v4 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
      return *__error();
  }
  if (!v4)
    return 70006;
  *a1 = v4;
  if ((~v6 & 0x7F) != 0)
    return 70005;
  else
    return 20014;
}

apr_status_t apr_initialize(void)
{
  apr_status_t v1;
  vm_address_t v4;
  apr_status_t v5;
  _QWORD *v6;
  uint64_t v7;
  apr_status_t v8;
  uint64_t v9;
  uint64_t v10;
  apr_pool_t *newpool;

  if (dword_10003DD20++)
    return 0;
  if (!byte_10003DD08++)
  {
    qword_10003DD10 = 0;
    v4 = sub_10001E748(0xC8uLL);
    if (!v4)
    {
      byte_10003DD08 = 0;
      return 12;
    }
    *(_OWORD *)v4 = 0u;
    *(_OWORD *)(v4 + 16) = 0u;
    *(_QWORD *)(v4 + 192) = 0;
    *(_OWORD *)(v4 + 160) = 0u;
    *(_OWORD *)(v4 + 176) = 0u;
    *(_OWORD *)(v4 + 128) = 0u;
    *(_OWORD *)(v4 + 144) = 0u;
    *(_OWORD *)(v4 + 96) = 0u;
    *(_OWORD *)(v4 + 112) = 0u;
    *(_OWORD *)(v4 + 64) = 0u;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_OWORD *)(v4 + 32) = 0u;
    *(_OWORD *)(v4 + 48) = 0u;
    qword_10003DD10 = v4;
    *(int64x2_t *)(v4 + 8) = vdupq_n_s64(0x8000uLL);
    v5 = apr_pool_create_ex((apr_pool_t **)&qword_10003DD18, 0, 0, (apr_allocator_t *)v4);
    if (v5)
    {
      v1 = v5;
      sub_10001EC9C(qword_10003DD10);
      qword_10003DD10 = 0;
      byte_10003DD08 = 0;
      return v1;
    }
    v6 = (_QWORD *)qword_10003DD18;
    *(_QWORD *)(qword_10003DD18 + 80) = "apr_global_pool";
    if (qword_10003DD00)
    {
LABEL_17:
      newpool = 0;
      v8 = sub_10001F3D8(&newpool, (uint64_t)v6);
      if (!v8)
      {
        v9 = qword_10003DD10;
        v10 = qword_10003DD18;
        *(_QWORD *)(qword_10003DD10 + 24) = newpool;
        *(_QWORD *)(v9 + 32) = v10;
        goto LABEL_5;
      }
    }
    else
    {
      qword_10003DD00 = sub_10001EFCC((uint64_t)v6, 0x38uLL);
      sub_10001F0F0(v6, qword_10003DD00, (uint64_t)sub_10001E8F0);
      v7 = 0;
      while (1)
      {
        v8 = sub_10001F3D8((_QWORD *)(qword_10003DD00 + v7), (uint64_t)v6);
        if (v8)
          break;
        v7 += 8;
        if (v7 == 56)
        {
          v6 = (_QWORD *)qword_10003DD18;
          goto LABEL_17;
        }
      }
    }
    return v8;
  }
LABEL_5:
  newpool = 0;
  if (apr_pool_create_ex(&newpool, 0, 0, 0))
    return 20002;
  v1 = 0;
  *((_QWORD *)newpool + 10) = "apr_initialize";
  return v1;
}

uint64_t sub_10001F3AC(pid_t a1, int a2)
{
  if (kill(a1, a2) == -1)
    return *__error();
  else
    return 0;
}

uint64_t sub_10001F3D8(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD **v5;
  uint64_t result;

  v4 = sub_10001EFCC(a2, 0x48uLL);
  v5 = (_QWORD **)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 56) = 0u;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_OWORD *)(v4 + 8) = 0u;
  }
  *(_QWORD *)v4 = a2;
  result = pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0);
  if (!(_DWORD)result)
  {
    sub_10001F0F0(*v5, (uint64_t)v5, (uint64_t)sub_10001F458);
    result = 0;
    *a1 = v5;
  }
  return result;
}

uint64_t sub_10001F458(uint64_t a1)
{
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
}

void *sub_10001F460()
{
  if (qword_10003DD28 != -1)
    dispatch_once(&qword_10003DD28, &stru_100031010);
  return &_os_log_default;
}

void sub_10001F4A0(id a1)
{
  uint8_t v1[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "GPUTOOLS(warning): Log uninitialized, please call GTCoreLogInit(), logging to OS_LOG_DEFAULT instead", v1, 2u);
  }
}

uint64_t GTCorePlatformGet()
{
  return 1;
}

id PrettifyFenumString(void *a1, int a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;

  v5 = a1;
  if (v5)
  {
    v6 = v5;
    if (objc_msgSend(v5, "hasPrefix:", CFSTR("kDYFE")))
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", 5));

      v6 = (void *)v7;
    }
    v8 = objc_msgSend(v6, "rangeOfString:", CFSTR("_"));
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR(" "), 0, v8, v9));

      v6 = (void *)v10;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(":")));

    v12 = CFSTR("-");
    if (a2)
      v12 = CFSTR("+");
    v13 = &stru_100031038;
    if (a3)
      v13 = CFSTR(":");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@%@]"), v12, v11, v13));

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByResolvingSymlinksInPath");
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLPathAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__closeCurrentFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeCurrentFileDescriptor:");
}

id objc_msgSend__connectionForServicePort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionForServicePort:");
}

id objc_msgSend__finalizeCompressedFileData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finalizeCompressedFileData:");
}

id objc_msgSend__finishSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finishSession:error:");
}

id objc_msgSend__getCurrentFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCurrentFileDescriptor:");
}

id objc_msgSend__openNextFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openNextFile:");
}

id objc_msgSend__registerService_forProcess_forPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerService:forProcess:forPort:");
}

id objc_msgSend__setRoutingPropertiesForMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRoutingPropertiesForMessage:");
}

id objc_msgSend__setRoutingPropertiesForMessage_withReplyStreamId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setRoutingPropertiesForMessage:withReplyStreamId:");
}

id objc_msgSend__sharesFileSystemWith_remoteConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sharesFileSystemWith:remoteConnection:");
}

id objc_msgSend__writeCompressedFileData_length_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeCompressedFileData:length:error:");
}

id objc_msgSend__writeUncompressedFileData_length_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeUncompressedFileData:length:error:");
}

id objc_msgSend_activateWithMessageHandler_andErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithMessageHandler:andErrorHandler:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addLocalService_forPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLocalService:forPort:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allServices");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_archiveURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveURL");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areProgrammableSamplePositionsSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areProgrammableSamplePositionsSupported");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bringGuestAppToForeground_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringGuestAppToForeground:completionHandler:");
}

id objc_msgSend_broadcastDisconnection_connectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "broadcastDisconnection:connectionId:");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_chunkSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chunkSize");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_compressionAlgorithm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compressionAlgorithm");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionForDeviceUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionForDeviceUDID:");
}

id objc_msgSend_connectionForServicePort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionForServicePort:");
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connections");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyIdentifier_toDevice_allowLocalURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIdentifier:toDevice:allowLocalURL:completionHandler:");
}

id objc_msgSend_copyIdentifier_toDevice_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyIdentifier:toDevice:completionHandler:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuType");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSymbolicLinkAtPath:withDestinationPath:error:");
}

id objc_msgSend_currentRemoteRelayPid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRemoteRelayPid");
}

id objc_msgSend_daemonDeviceCapabilities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonDeviceCapabilities");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decodeRectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeRectForKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deregisterDispatcher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterDispatcher:");
}

id objc_msgSend_deregisterObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterObserver:");
}

id objc_msgSend_deregisterObserversForConnection_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterObserversForConnection:path:");
}

id objc_msgSend_deregisterService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterService:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destination");
}

id objc_msgSend_deviceCompatibilityCapabilitiesWithHeapDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceCompatibilityCapabilitiesWithHeapDescriptors:");
}

id objc_msgSend_deviceIsHandledLocally_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIsHandledLocally:");
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUDID");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disconnectServicePorts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectServicePorts:");
}

id objc_msgSend_dispatchMessage_replyConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchMessage:replyConnection:");
}

id objc_msgSend_dispatcherId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatcherId");
}

id objc_msgSend_driverVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "driverVersion");
}

id objc_msgSend_echo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "echo:");
}

id objc_msgSend_echo_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "echo:completionHandler:");
}

id objc_msgSend_echo_repeat_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "echo:repeat:callback:");
}

id objc_msgSend_echo_repeat_callback_complete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "echo:repeat:callback:complete:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeRect_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeRect:forKey:");
}

id objc_msgSend_enterRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterRunLoop");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environment");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_finish_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finish:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_foregroundService_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "foregroundService:error:");
}

id objc_msgSend_getDefaultSamplePositions_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultSamplePositions:count:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSimulatorDeviceBrowserService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSimulatorDeviceBrowserService:");
}

id objc_msgSend_gpuToolsVersionQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gpuToolsVersionQuery");
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConnection:");
}

id objc_msgSend_handleDisconnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDisconnection:");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_handleMessage_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMessage:fromConnection:");
}

id objc_msgSend_handleMessageBroadcast_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMessageBroadcast:fromConnection:");
}

id objc_msgSend_handleMessageDaemon_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMessageDaemon:fromConnection:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_heapAccelerationStructureSizeAndAlignWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heapAccelerationStructureSizeAndAlignWithSize:");
}

id objc_msgSend_heapTextureSizeAndAlignWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heapTextureSizeAndAlignWithDescriptor:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_inferiorEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inferiorEnvironment:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:isDirectory:");
}

id objc_msgSend_initFileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:copyItems:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCallback:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConnection_device_port_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:device:port:");
}

id objc_msgSend_initWithConnection_relayPort_relayPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:relayPort:relayPid:");
}

id objc_msgSend_initWithConnection_remoteProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:remoteProperties:");
}

id objc_msgSend_initWithConnectionProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnectionProvider:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithFileEntries_relativeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileEntries:relativeToURL:options:error:");
}

id objc_msgSend_initWithLink_destination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLink:destination:");
}

id objc_msgSend_initWithMessage_notifyConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessage:notifyConnection:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObserver:");
}

id objc_msgSend_initWithPath_fileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:fileSize:");
}

id objc_msgSend_initWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtocol:");
}

id objc_msgSend_initWithService_processInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:processInfo:");
}

id objc_msgSend_initWithService_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:properties:");
}

id objc_msgSend_initWithServiceProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceProvider:");
}

id objc_msgSend_initWithServiceProvider_connectionProvider_serviceVendor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceProvider:connectionProvider:serviceVendor:");
}

id objc_msgSend_initWithTransactionScopedXPCConnection_messageQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTransactionScopedXPCConnection:messageQueue:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initiateTransfer_basePath_fromDevice_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiateTransfer:basePath:fromDevice:options:completionHandler:");
}

id objc_msgSend_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:");
}

id objc_msgSend_insert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insert:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMsaa32bSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMsaa32bSupported");
}

id objc_msgSend_isSimulatorDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSimulatorDevice:");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSuspended");
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrusted");
}

id objc_msgSend_isiOSAppOnMac(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiOSAppOnMac");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchReplayService_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchReplayService:error:");
}

id objc_msgSend_launchReplayerLocallyWithConfiguration_competionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchReplayerLocallyWithConfiguration:competionHandler:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_makeURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeURL:");
}

id objc_msgSend_maxBufferLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxBufferLength");
}

id objc_msgSend_maxCustomSamplePositions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxCustomSamplePositions");
}

id objc_msgSend_maxThreadgroupMemoryLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxThreadgroupMemoryLength");
}

id objc_msgSend_maxThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxThreadsPerThreadgroup");
}

id objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumLinearTextureAlignmentForPixelFormat:");
}

id objc_msgSend_minimumTextureBufferAlignmentForPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumTextureBufferAlignmentForPixelFormat:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_notifyAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyAll:");
}

id objc_msgSend_notifyServiceListChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyServiceListChanged:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_patchMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patchMessage:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_performSelector_withObject_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:withObject:");
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingIdentifier:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_processStateForService_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processStateForService:completionHandler:");
}

id objc_msgSend_protocolMethods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolMethods");
}

id objc_msgSend_protocolMethods_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolMethods:");
}

id objc_msgSend_protocolName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protocolName");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_registerDefaultServiceProvider_forProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaultServiceProvider:forProcess:");
}

id objc_msgSend_registerDispatcher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDispatcher:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_registerService_forProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerService:forProcess:");
}

id objc_msgSend_registerServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerServices");
}

id objc_msgSend_relayMessage_fromConnection_toConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relayMessage:fromConnection:toConnection:");
}

id objc_msgSend_remove_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remove:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_replyPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyPath");
}

id objc_msgSend_replyStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyStream");
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestID");
}

id objc_msgSend_resumeService_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeService:error:");
}

id objc_msgSend_resumeTaskForPid_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeTaskForPid:error:");
}

id objc_msgSend_retrieveConnection_forId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveConnection:forId:");
}

id objc_msgSend_retrieveId_forConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveId:forConnection:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_securityScopedURLFromSandboxID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "securityScopedURLFromSandboxID:completionHandler:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_sendMessage_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:replyHandler:");
}

id objc_msgSend_sendMessage_withReplyStreamId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:withReplyStreamId:");
}

id objc_msgSend_sendMessage_withReplyStreamId_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:withReplyStreamId:replyHandler:");
}

id objc_msgSend_sendMessageAndWaitForDelivery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessageAndWaitForDelivery:");
}

id objc_msgSend_sendMessageWithReplySync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessageWithReplySync:");
}

id objc_msgSend_sendMessageWithReplySync_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessageWithReplySync:error:");
}

id objc_msgSend_sendMessageWithReplySync_replyStreamId_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessageWithReplySync:replyStreamId:error:");
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicePort");
}

id objc_msgSend_serviceProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceProperties");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionUUID");
}

id objc_msgSend_sessionWithFileEntries_relativeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithFileEntries:relativeToURL:options:error:");
}

id objc_msgSend_setAllowGPUOptimizedContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowGPUOptimizedContents:");
}

id objc_msgSend_setAppleInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppleInternal:");
}

id objc_msgSend_setArchiveURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArchiveURL:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setArrayLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArrayLength:");
}

id objc_msgSend_setBuildVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuildVersion:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setChunkSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChunkSize:");
}

id objc_msgSend_setCompressionAlgorithm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompressionAlgorithm:");
}

id objc_msgSend_setCompressionFootprint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompressionFootprint:");
}

id objc_msgSend_setCompressionMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompressionMode:");
}

id objc_msgSend_setCompressionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompressionType:");
}

id objc_msgSend_setConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnections:");
}

id objc_msgSend_setCpuArchitecture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCpuArchitecture:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDefaultSamplePositions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultSamplePositions:");
}

id objc_msgSend_setDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDepth:");
}

id objc_msgSend_setDeviceClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceClass:");
}

id objc_msgSend_setDeviceSupportsLockdown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceSupportsLockdown:");
}

id objc_msgSend_setDeviceUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceUDID:");
}

id objc_msgSend_setDispatcherId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatcherId:");
}

id objc_msgSend_setEffectiveProductionStatusAp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEffectiveProductionStatusAp:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setFramebufferOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFramebufferOnly:");
}

id objc_msgSend_setHardwareModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHardwareModel:");
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeight:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setIsDrawable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDrawable:");
}

id objc_msgSend_setIsSuspended_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSuspended:");
}

id objc_msgSend_setIsUIBuild_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUIBuild:");
}

id objc_msgSend_setLossyCompressionMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLossyCompressionMode:");
}

id objc_msgSend_setMipmapLevelCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMipmapLevelCount:");
}

id objc_msgSend_setMobileDeviceMinimumVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMobileDeviceMinimumVersion:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOsInstallEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOsInstallEnvironment:");
}

id objc_msgSend_setOsVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOsVersion:");
}

id objc_msgSend_setPixelFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPixelFormat:");
}

id objc_msgSend_setPlatform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatform:");
}

id objc_msgSend_setProcessIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessIdentifier:");
}

id objc_msgSend_setProcessInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessInfo:");
}

id objc_msgSend_setProcessName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessName:");
}

id objc_msgSend_setProductName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductName:");
}

id objc_msgSend_setProductType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProductType:");
}

id objc_msgSend_setProtocolMethods_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocolMethods:");
}

id objc_msgSend_setProtocolName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtocolName:");
}

id objc_msgSend_setReleaseType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReleaseType:");
}

id objc_msgSend_setResourceOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResourceOptions:");
}

id objc_msgSend_setRotation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRotation:");
}

id objc_msgSend_setSampleCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSampleCount:");
}

id objc_msgSend_setServicePort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServicePort:");
}

id objc_msgSend_setServiceProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceProperties:");
}

id objc_msgSend_setSparseSurfaceDefaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSparseSurfaceDefaultValue:");
}

id objc_msgSend_setSupportedFeatureSets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedFeatureSets:");
}

id objc_msgSend_setSupportedGPUFamilies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportedGPUFamilies:");
}

id objc_msgSend_setSwizzleKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwizzleKey:");
}

id objc_msgSend_setTextureType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextureType:");
}

id objc_msgSend_setUniqueDeviceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueDeviceID:");
}

id objc_msgSend_setUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsage:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWriteSwizzleEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWriteSwizzleEnabled:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAccessingSecurityScopedResource");
}

id objc_msgSend_startTransfer_basePath_fromDevice_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTransfer:basePath:fromDevice:options:completionHandler:");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccessingSecurityScopedResource");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subType");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_supports2DLinearTexArraySPI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supports2DLinearTexArraySPI");
}

id objc_msgSend_supports32BitMSAA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supports32BitMSAA");
}

id objc_msgSend_supports32bpcMSAATextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supports32bpcMSAATextures");
}

id objc_msgSend_supports3DASTCTextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supports3DASTCTextures");
}

id objc_msgSend_supports3DBCTextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supports3DBCTextures");
}

id objc_msgSend_supportsASTCHDRTextureCompression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsASTCHDRTextureCompression");
}

id objc_msgSend_supportsASTCTextureCompression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsASTCTextureCompression");
}

id objc_msgSend_supportsAlphaYUVFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsAlphaYUVFormats");
}

id objc_msgSend_supportsArgumentBuffersTier2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsArgumentBuffersTier2");
}

id objc_msgSend_supportsBCTextureCompression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBCTextureCompression");
}

id objc_msgSend_supportsBGR10A2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBGR10A2");
}

id objc_msgSend_supportsBfloat16Format(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBfloat16Format");
}

id objc_msgSend_supportsBlackOrWhiteSamplerBorderColors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBlackOrWhiteSamplerBorderColors");
}

id objc_msgSend_supportsBufferWithIOSurface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsBufferWithIOSurface");
}

id objc_msgSend_supportsCMPIndirectCommandBuffers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCMPIndirectCommandBuffers");
}

id objc_msgSend_supportsCombinedMSAAStoreAndResolveAction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCombinedMSAAStoreAndResolveAction");
}

id objc_msgSend_supportsComputeMemoryBarrier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsComputeMemoryBarrier");
}

id objc_msgSend_supportsConcurrentComputeDispatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsConcurrentComputeDispatch");
}

id objc_msgSend_supportsCustomBorderColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCustomBorderColor");
}

id objc_msgSend_supportsDepthClipMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDepthClipMode");
}

id objc_msgSend_supportsDepthClipModeClampExtended(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDepthClipModeClampExtended");
}

id objc_msgSend_supportsDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDevice:");
}

id objc_msgSend_supportsDynamicAttributeStride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDynamicAttributeStride");
}

id objc_msgSend_supportsDynamicLibraries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDynamicLibraries");
}

id objc_msgSend_supportsExtendedVertexFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsExtendedVertexFormats");
}

id objc_msgSend_supportsExtendedXR10Formats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsExtendedXR10Formats");
}

id objc_msgSend_supportsExtendedYUVFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsExtendedYUVFormats");
}

id objc_msgSend_supportsFamily_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFamily:");
}

id objc_msgSend_supportsFeatureSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFeatureSet:");
}

id objc_msgSend_supportsFunctionPointers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFunctionPointers");
}

id objc_msgSend_supportsFunctionPointersFromMesh(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFunctionPointersFromMesh");
}

id objc_msgSend_supportsFunctionPointersFromRender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsFunctionPointersFromRender");
}

id objc_msgSend_supportsGFXIndirectCommandBuffers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsGFXIndirectCommandBuffers");
}

id objc_msgSend_supportsHeapAccelerationStructureAllocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsHeapAccelerationStructureAllocation");
}

id objc_msgSend_supportsIndirectDrawAndDispatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsIndirectDrawAndDispatch");
}

id objc_msgSend_supportsLateEvalEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLateEvalEvent");
}

id objc_msgSend_supportsLayeredRendering(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLayeredRendering");
}

id objc_msgSend_supportsLimitedYUVFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLimitedYUVFormats");
}

id objc_msgSend_supportsLinearTexture2DArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLinearTexture2DArray");
}

id objc_msgSend_supportsLinearTextureFromSharedBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLinearTextureFromSharedBuffer");
}

id objc_msgSend_supportsLossyCompression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsLossyCompression");
}

id objc_msgSend_supportsMSAADepthResolve(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMSAADepthResolve");
}

id objc_msgSend_supportsMSAADepthResolveFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMSAADepthResolveFilter");
}

id objc_msgSend_supportsMSAAStencilResolve(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMSAAStencilResolve");
}

id objc_msgSend_supportsMSAAStencilResolveFilter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMSAAStencilResolveFilter");
}

id objc_msgSend_supportsMemorylessRenderTargets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMemorylessRenderTargets");
}

id objc_msgSend_supportsMeshShaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMeshShaders");
}

id objc_msgSend_supportsMeshShadersInICB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMeshShadersInICB");
}

id objc_msgSend_supportsMirrorClampToEdgeSamplerMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsMirrorClampToEdgeSamplerMode");
}

id objc_msgSend_supportsNonPrivateDepthStencilTextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsNonPrivateDepthStencilTextures");
}

id objc_msgSend_supportsNonPrivateMSAATextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsNonPrivateMSAATextures");
}

id objc_msgSend_supportsNonSquareTileShaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsNonSquareTileShaders");
}

id objc_msgSend_supportsNonUniformThreadgroupSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsNonUniformThreadgroupSize");
}

id objc_msgSend_supportsPartialRenderMemoryBarrier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPartialRenderMemoryBarrier");
}

id objc_msgSend_supportsPlacementHeaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPlacementHeaps");
}

id objc_msgSend_supportsPrimitiveMotionBlur(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPrimitiveMotionBlur");
}

id objc_msgSend_supportsProgrammableSamplePositions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsProgrammableSamplePositions");
}

id objc_msgSend_supportsPublicXR10Formats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPublicXR10Formats");
}

id objc_msgSend_supportsRGBA10A2Gamma(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRGBA10A2Gamma");
}

id objc_msgSend_supportsRasterizationRateMapWithLayerCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRasterizationRateMapWithLayerCount:");
}

id objc_msgSend_supportsRayTracingAccelerationStructureCPUDeserialization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingAccelerationStructureCPUDeserialization");
}

id objc_msgSend_supportsRayTracingBuffersFromTables(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingBuffersFromTables");
}

id objc_msgSend_supportsRayTracingCurves(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingCurves");
}

id objc_msgSend_supportsRayTracingExtendedVertexFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingExtendedVertexFormats");
}

id objc_msgSend_supportsRayTracingGPUTableUpdateBuffers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingGPUTableUpdateBuffers");
}

id objc_msgSend_supportsRayTracingICBs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingICBs");
}

id objc_msgSend_supportsRayTracingIndirectInstanceAccelerationStructureBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingIndirectInstanceAccelerationStructureBuild");
}

id objc_msgSend_supportsRayTracingMultiLevelInstancing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingMultiLevelInstancing");
}

id objc_msgSend_supportsRayTracingPerPrimitiveData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRayTracingPerPrimitiveData");
}

id objc_msgSend_supportsRaytracing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRaytracing");
}

id objc_msgSend_supportsRelaxedTextureViewRequirements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRelaxedTextureViewRequirements");
}

id objc_msgSend_supportsRenderDynamicLibraries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRenderDynamicLibraries");
}

id objc_msgSend_supportsRenderMemoryBarrier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRenderMemoryBarrier");
}

id objc_msgSend_supportsRenderTargetTextureRotation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRenderTargetTextureRotation");
}

id objc_msgSend_supportsRenderToLinearTextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsRenderToLinearTextures");
}

id objc_msgSend_supportsSRGBwrites(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSRGBwrites");
}

id objc_msgSend_supportsSamplerAddressModeClampToHalfBorder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSamplerAddressModeClampToHalfBorder");
}

id objc_msgSend_supportsSamplerCompareFunction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSamplerCompareFunction");
}

id objc_msgSend_supportsSeparateDepthStencil(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSeparateDepthStencil");
}

id objc_msgSend_supportsSharedStorageHeapResources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSharedStorageHeapResources");
}

id objc_msgSend_supportsSharedStorageTextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSharedStorageTextures");
}

id objc_msgSend_supportsSharedTextureHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSharedTextureHandles");
}

id objc_msgSend_supportsSparseDepthAttachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSparseDepthAttachments");
}

id objc_msgSend_supportsSparseHeaps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSparseHeaps");
}

id objc_msgSend_supportsSparseTextures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSparseTextures");
}

id objc_msgSend_supportsTexture2DMultisampleArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTexture2DMultisampleArray");
}

id objc_msgSend_supportsTextureCubeArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTextureCubeArray");
}

id objc_msgSend_supportsTextureSampleCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTextureSampleCount:");
}

id objc_msgSend_supportsTextureSwizzle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTextureSwizzle");
}

id objc_msgSend_supportsTileShaders(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsTileShaders");
}

id objc_msgSend_supportsVariableRateRasterization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsVariableRateRasterization");
}

id objc_msgSend_supportsVertexAmplificationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsVertexAmplificationCount:");
}

id objc_msgSend_supportsViewportAndScissorArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsViewportAndScissorArray");
}

id objc_msgSend_supportsYCBCRFormats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRFormats");
}

id objc_msgSend_supportsYCBCRFormats12(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRFormats12");
}

id objc_msgSend_supportsYCBCRFormatsPQ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRFormatsPQ");
}

id objc_msgSend_supportsYCBCRFormatsXR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRFormatsXR");
}

id objc_msgSend_supportsYCBCRPackedFormats12(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRPackedFormats12");
}

id objc_msgSend_supportsYCBCRPackedFormatsPQ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRPackedFormatsPQ");
}

id objc_msgSend_supportsYCBCRPackedFormatsXR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsYCBCRPackedFormatsXR");
}

id objc_msgSend_symbolicatorForService_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "symbolicatorForService:completionHandler:");
}

id objc_msgSend_symbolicatorSignatureForPid_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "symbolicatorSignatureForPid:completionHandler:");
}

id objc_msgSend_targetDeviceArchitecture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetDeviceArchitecture");
}

id objc_msgSend_transferIdentifier_toDevice_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferIdentifier:toDevice:completionHandler:");
}

id objc_msgSend_unarchivedArrayOfObjectsOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedArrayOfObjectsOfClass:fromData:error:");
}

id objc_msgSend_unarchivedDictionaryWithKeysOfClass_objectsOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueDeviceID");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateAndRelayMessage_fromConnection_toConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAndRelayMessage:fromConnection:toConnection:");
}

id objc_msgSend_updateMessage_sourceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMessage:sourceConnection:");
}

id objc_msgSend_updateMessagePath_sourceConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMessagePath:sourceConnection:");
}

id objc_msgSend_urlForPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlForPath:");
}

id objc_msgSend_valueWithPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPoint:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_versionCombined(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "versionCombined");
}

id objc_msgSend_waitForService_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForService:completionHandler:");
}

id objc_msgSend_writeFileData_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFileData:completionHandler:");
}

id objc_msgSend_writeFileData_sessionID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFileData:sessionID:completionHandler:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
