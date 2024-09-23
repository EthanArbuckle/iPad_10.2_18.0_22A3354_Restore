@implementation MIIPAPatcherManifest

- (MIIPAPatcherManifest)initWithCommandLineArgs:(id)a3 targets:(id)a4 toolVersion:(id)a5 toolArch:(id)a6 toolBuiltWithSDKVersion:(id)a7 toolBuiltWithXcodeVersion:(id)a8 hostVersion:(id)a9
{
  id v16;
  id v17;
  MIIPAPatcherManifest *v18;
  uint64_t v19;
  MIIPAPatcherWriteable *fmWrite;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v23 = a6;
  v22 = a7;
  v16 = a8;
  v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MIIPAPatcherManifest;
  v18 = -[MIIPAPatcherManifest init](&v27, "init");
  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(+[MIIPAPatcherFileManager defaultManager](MIIPAPatcherFileManager, "defaultManager"));
    fmWrite = v18->_fmWrite;
    v18->_fmWrite = (MIIPAPatcherWriteable *)v19;

    objc_storeStrong((id *)&v18->_manifestVersion, (id)qword_10009DF00);
    objc_storeStrong((id *)&v18->_commandLineArgs, a3);
    objc_storeStrong((id *)&v18->_targets, a4);
    objc_storeStrong((id *)&v18->_toolVersion, a5);
    objc_storeStrong((id *)&v18->_toolArch, a6);
    objc_storeStrong((id *)&v18->_toolBuiltWithSDKVersion, a7);
    objc_storeStrong((id *)&v18->_toolBuiltWithXcodeVersion, a8);
    objc_storeStrong((id *)&v18->_hostVersion, a9);
  }

  return v18;
}

+ (id)manifestFromPlistRepresentation:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[3];
  _QWORD v21[3];

  v6 = a3;
  objc_opt_class(NSDictionary);
  v7 = v6;
  if ((objc_opt_isKindOfClass(v7) & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    v19 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestFromPlistRepresentationV1:withError:", v7, &v19));
    v10 = v19;
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    v20[0] = NSLocalizedDescriptionKey;
    v11 = objc_alloc((Class)NSString);
    v12 = (objc_class *)objc_opt_class(v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v11, "initWithFormat:", CFSTR("Invalid manifest, expected NSDictionary, got [%@]"), v14);
    v21[0] = v15;
    v21[1] = &off_10008ED60;
    v20[1] = CFSTR("line");
    v20[2] = CFSTR("function");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MIIPAPatcherManifest manifestFromPlistRepresentation:withError:]"));
    v21[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 3));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MIIPAPatcher"), 7, v17));

    v9 = 0;
    if (!a4)
      goto LABEL_10;
  }
  if (!v9)
    *a4 = objc_retainAutorelease(v10);
LABEL_10:

  return v9;
}

+ (id)manifestFromFileURL:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIIPAPatcherFileManager defaultManager](MIIPAPatcherFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "manifestFromFileURL:fmRead:withError:", v6, v7, a4));

  return v8;
}

+ (id)manifestFromFileURL:(id)a3 fmRead:(id)a4 withError:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v11;
  id v12;

  v12 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "plistRepresentationFromFileURL:withError:", a3, &v12));
  v7 = v12;
  if (v6)
  {
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIIPAPatcherManifest manifestFromPlistRepresentation:withError:](MIIPAPatcherManifest, "manifestFromPlistRepresentation:withError:", v6, &v11));
    v9 = v11;

    v7 = v9;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v8)
    *a5 = objc_retainAutorelease(v7);
LABEL_7:

  return v8;
}

- (id)plistRepresentation
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[8];
  _QWORD v27[8];
  _BYTE v28[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest targets](self, "targets"));
  v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest targets](self, "targets", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v10), "plistRepresentation"));
        objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }

  v26[0] = CFSTR("version");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest manifestVersion](self, "manifestVersion"));
  v27[0] = v12;
  v26[1] = CFSTR("commandLineArgs");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest commandLineArgs](self, "commandLineArgs"));
  v27[1] = v13;
  v26[2] = CFSTR("targets");
  v14 = objc_msgSend(v5, "copy");
  v27[2] = v14;
  v26[3] = CFSTR("toolVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolVersion](self, "toolVersion"));
  v27[3] = v15;
  v26[4] = CFSTR("toolArch");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolArch](self, "toolArch"));
  v27[4] = v16;
  v26[5] = CFSTR("toolBuiltWithSDKVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolBuiltWithSDKVersion](self, "toolBuiltWithSDKVersion"));
  v27[5] = v17;
  v26[6] = CFSTR("toolBuiltWithXcodeVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest toolBuiltWithXcodeVersion](self, "toolBuiltWithXcodeVersion"));
  v27[6] = v18;
  v26[7] = CFSTR("hostVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest hostVersion](self, "hostVersion"));
  v27[7] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 8));

  return v20;
}

- (BOOL)writeToFileURL:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest plistRepresentation](self, "plistRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIIPAPatcherManifest fmWrite](self, "fmWrite"));
  LOBYTE(a4) = objc_msgSend(v8, "writePlistRepresentation:toFileURL:mode:withError:", v7, v6, 384, a4);

  return (char)a4;
}

+ (id)_manifestErrorForKey:(id)a3 sub:(id)a4 index:(int64_t)a5 expected:(id)a6 value:(id)a7
{
  __CFString *v11;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];

  v26 = a3;
  v11 = (__CFString *)a4;
  v12 = a6;
  v13 = a7;
  v14 = &stru_100086E88;
  if (v11)
    v15 = v11;
  else
    v15 = &stru_100086E88;
  v16 = v15;
  if ((a5 & 0x8000000000000000) == 0)
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" at index %lu"), a5));
  v27[0] = NSLocalizedDescriptionKey;
  v17 = objc_alloc((Class)NSString);
  v18 = (objc_class *)objc_opt_class(v13);
  v19 = NSStringFromClass(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = objc_msgSend(v17, "initWithFormat:", CFSTR("Invalid manifest %@key [%@]%@. Expected [%@], got [%@]."), v16, v26, v14, v12, v20);
  v28[0] = v21;
  v28[1] = &off_10008ED78;
  v27[1] = CFSTR("line");
  v27[2] = CFSTR("function");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MIIPAPatcherManifest _manifestErrorForKey:sub:index:expected:value:]"));
  v28[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MIIPAPatcher"), 5, v23));

  return v24;
}

+ (id)_arrayFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", v12));
  objc_opt_class(NSArray);
  v15 = v14;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (a7 && !v16)
    *a7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:", v12, v13, a6, CFSTR("NSArray"), v15));

  return v16;
}

+ (id)_stringFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", v12));
  objc_opt_class(NSString);
  v15 = v14;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (a7 && !v16)
    *a7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:", v12, v13, a6, CFSTR("NSString"), v15));

  return v16;
}

+ (id)_numberFromPlistRepresentation:(id)a3 key:(id)a4 sub:(id)a5 index:(unint64_t)a6 withError:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v12 = a4;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", v12));
  objc_opt_class(NSNumber);
  v15 = v14;
  if ((objc_opt_isKindOfClass(v15) & 1) != 0)
    v16 = v15;
  else
    v16 = 0;

  if (a7 && !v16)
    *a7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:", v12, v13, a6, CFSTR("NSNumber"), v15));

  return v16;
}

+ (id)_manifestFromPlistRepresentationV1:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id *v20;
  void *v21;
  id obj;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v6 = a3;
  v31 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_numberFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("version"), 0, -1, &v31));
  v8 = v31;
  v9 = v8;
  obj = v7;
  if (!v7)
  {
    v10 = 0;
    v21 = 0;
    v12 = 0;
    v14 = 0;
    v15 = 0;
    v13 = 0;
    if (a4)
    {
LABEL_24:
      v9 = objc_retainAutorelease(v9);
      v16 = 0;
      v18 = a4;
      a4 = 0;
      *v18 = v9;
      goto LABEL_25;
    }
LABEL_13:
    v16 = 0;
    goto LABEL_25;
  }
  v20 = a4;
  v30 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_arrayFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("commandLineArgs"), 0, -1, &v30));
  v11 = v30;

  if (!v10)
  {
    v21 = 0;
    v12 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  objc_opt_class(NSString);
  if ((sub_100011190(v10) & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("commandLineArgs")));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:", CFSTR("commandLineArgs"), 0, -1, CFSTR("NSArray<NSString>"), v17));

    v21 = 0;
    v12 = 0;
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  v29 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_arrayFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("targets"), 0, -1, &v29));
  v9 = v29;

  if (!v12)
  {
    v21 = 0;
    goto LABEL_20;
  }
  v28 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_targetsFromPlistRepresentationV1:withError:", v12, &v28));
  v11 = v28;

  if (!v13)
  {
    v21 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_16;
  }
  v27 = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("toolVersion"), 0, -1, &v27));
  v9 = v27;

  v21 = v13;
  if (!v14)
  {
LABEL_21:
    v15 = 0;
    v13 = 0;
    goto LABEL_22;
  }
  v26 = v9;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("toolArch"), 0, -1, &v26));
  v11 = v26;

  if (!v15)
  {
LABEL_15:
    v13 = 0;
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  v25 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("toolBuiltWithSDKVersion"), 0, -1, &v25));
  v9 = v25;

  if (!v13)
  {
LABEL_22:
    v7 = 0;
LABEL_23:
    a4 = v20;
    if (v20)
      goto LABEL_24;
    goto LABEL_13;
  }
  v24 = v9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("toolBuiltWithXcodeVersion"), 0, -1, &v24));
  v11 = v24;

  if (!v7)
  {
LABEL_17:
    v9 = v11;
    goto LABEL_23;
  }
  v23 = v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v6, CFSTR("hostVersion"), 0, -1, &v23));
  v9 = v23;

  if (!v16)
    goto LABEL_23;
  a4 = -[MIIPAPatcherManifest initWithCommandLineArgs:targets:toolVersion:toolArch:toolBuiltWithSDKVersion:toolBuiltWithXcodeVersion:hostVersion:]([MIIPAPatcherManifest alloc], "initWithCommandLineArgs:targets:toolVersion:toolArch:toolBuiltWithSDKVersion:toolBuiltWithXcodeVersion:hostVersion:", v10, v21, v14, v15, v13, v7, v16);
  objc_storeStrong(a4 + 2, obj);
LABEL_25:

  return a4;
}

+ (id)_targetsFromPlistRepresentationV1:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  MIIPAPatcherManifestTarget *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  int v35;
  id obj;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v6;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  v8 = 0;
  if (!v38)
  {
LABEL_32:

    v13 = objc_msgSend(v7, "copy");
    if (a4)
      goto LABEL_37;
    goto LABEL_39;
  }
  v39 = *(_QWORD *)v48;
  v40 = 0;
  v33 = _kCFBundleShortVersionStringKey;
  v31 = v7;
  v37 = a1;
  v29 = a4;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v48 != v39)
      objc_enumerationMutation(obj);
    v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v9);
    objc_opt_class(NSDictionary);
    v11 = v10;
    if ((objc_opt_isKindOfClass(v11) & 1) == 0)
    {

      v12 = v40;
LABEL_35:
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:", CFSTR("targets"), CFSTR("target "), v12, CFSTR("NSDictionary"), v11, v29));

      v13 = 0;
      v8 = (id)v27;
      goto LABEL_36;
    }
    v12 = v40;
    if (!v11)
      goto LABEL_35;
    v46 = v8;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v11, kCFBundleVersionKey, CFSTR("target "), v40, &v46));
    v14 = v46;

    if (!v13)
    {
      v20 = 0;
      v15 = 0;
      v19 = 0;
      v21 = 0;
      v22 = 0;
      v35 = 1;
      v8 = v14;
      v23 = 0;
      goto LABEL_29;
    }
    v45 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v11, v33, CFSTR("target "), v40, &v45));
    v8 = v45;

    if (!v15)
    {
      v20 = 0;
      v23 = 0;
      v19 = 0;
      v21 = 0;
      v22 = 0;
      v35 = 1;
      goto LABEL_29;
    }
    v34 = v13;
    v44 = v8;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v11, kCFBundleIdentifierKey, CFSTR("target "), v40, &v44));
    v17 = v44;

    v32 = (void *)v16;
    if (!v16)
    {
      v20 = 0;
      v19 = 0;
      v21 = 0;
      v22 = 0;
      v35 = 1;
      v8 = v17;
      v23 = 0;
LABEL_23:
      v13 = v34;
      goto LABEL_29;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UISupportedDevices")));

    if (!v18)
    {
      v19 = 0;
      v13 = v34;
      goto LABEL_19;
    }
    v43 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_arrayFromPlistRepresentation:key:sub:index:withError:", v11, CFSTR("UISupportedDevices"), 0, v40, &v43));
    v8 = v43;

    if (!v19)
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v35 = 1;
      v23 = (void *)v16;
      goto LABEL_23;
    }
    objc_opt_class(NSString);
    v13 = v34;
    if ((sub_100011190(v19) & 1) == 0)
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("UISupportedDevices")));
      v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestErrorForKey:sub:index:expected:value:", CFSTR("UISupportedDevices"), CFSTR("target "), v40, CFSTR("NSArray<NSString>"), v26));

      v25 = (void *)v26;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v35 = 1;
      v23 = v32;
      goto LABEL_26;
    }
    v17 = v8;
LABEL_19:
    v42 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v11, CFSTR("infoPlistHash"), CFSTR("target "), v40, &v42, v29));
    v8 = v42;

    if (!v21)
    {
      v20 = 0;
      v22 = 0;
      v35 = 1;
      v23 = v32;
      goto LABEL_29;
    }
    v41 = v8;
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_stringFromPlistRepresentation:key:sub:index:withError:", v11, CFSTR("infoPlistHashAlgorithm"), CFSTR("target "), v40, &v41));
    v30 = v41;

    v25 = (void *)v24;
    v23 = v32;
    if (!v25)
    {
      v20 = 0;
      v22 = 0;
      v35 = 1;
      goto LABEL_28;
    }
    v20 = -[MIIPAPatcherManifestTarget initWithCFBundleVersion:cfBundleShortVersion:bundleIdentifier:uiSupportedDevices:infoPlistHash:infoPlistHashAlgorithm:]([MIIPAPatcherManifestTarget alloc], "initWithCFBundleVersion:cfBundleShortVersion:bundleIdentifier:uiSupportedDevices:infoPlistHash:infoPlistHashAlgorithm:", v13, v15, v32, v19, v21, v25);
    objc_msgSend(v31, "addObject:", v20);
    v35 = 0;
    ++v40;
    v22 = 1;
LABEL_26:

LABEL_28:
    v8 = v30;
LABEL_29:

    if (!v22)
      break;
    v9 = (char *)v9 + 1;
    a1 = v37;
    if (v38 == v9)
    {
      a4 = v29;
      v7 = v31;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v38)
        goto LABEL_3;
      goto LABEL_32;
    }
  }

  if (!v35)
  {
    v7 = v31;
    goto LABEL_39;
  }
  v13 = 0;
LABEL_36:
  a4 = v29;
  v7 = v31;
  if (!v29)
    goto LABEL_39;
LABEL_37:
  if (!v13)
  {
    v8 = objc_retainAutorelease(v8);
    *a4 = v8;
  }
LABEL_39:

  return v13;
}

- (MIIPAPatcherWriteable)fmWrite
{
  return self->_fmWrite;
}

- (void)setFmWrite:(id)a3
{
  objc_storeStrong((id *)&self->_fmWrite, a3);
}

- (NSNumber)manifestVersion
{
  return self->_manifestVersion;
}

- (NSArray)commandLineArgs
{
  return self->_commandLineArgs;
}

- (NSArray)targets
{
  return self->_targets;
}

- (NSString)toolVersion
{
  return self->_toolVersion;
}

- (NSString)toolArch
{
  return self->_toolArch;
}

- (NSString)toolBuiltWithSDKVersion
{
  return self->_toolBuiltWithSDKVersion;
}

- (NSString)toolBuiltWithXcodeVersion
{
  return self->_toolBuiltWithXcodeVersion;
}

- (NSString)hostVersion
{
  return self->_hostVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostVersion, 0);
  objc_storeStrong((id *)&self->_toolBuiltWithXcodeVersion, 0);
  objc_storeStrong((id *)&self->_toolBuiltWithSDKVersion, 0);
  objc_storeStrong((id *)&self->_toolArch, 0);
  objc_storeStrong((id *)&self->_toolVersion, 0);
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_commandLineArgs, 0);
  objc_storeStrong((id *)&self->_manifestVersion, 0);
  objc_storeStrong((id *)&self->_fmWrite, 0);
}

@end
