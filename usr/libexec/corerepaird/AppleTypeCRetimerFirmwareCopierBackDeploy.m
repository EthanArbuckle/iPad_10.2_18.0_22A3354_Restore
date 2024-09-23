@implementation AppleTypeCRetimerFirmwareCopierBackDeploy

- (AppleTypeCRetimerFirmwareCopierBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerFirmwareCopierBackDeploy *v9;
  AppleTypeCRetimerFirmwareCopierBackDeploy *v10;
  AppleTypeCRetimerFirmwareCopierBackDeploy *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareCopierBackDeploy;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperBackDeploy initWithOptions:logFunction:logContext:](&v13, "initWithOptions:logFunction:logContext:", v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    if (!-[AppleTypeCRetimerFirmwareCopierBackDeploy parseOptions:](v9, "parseOptions:", v8))
    {
      v11 = 0;
      goto LABEL_6;
    }
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy verboseLog:](v10, "verboseLog:", CFSTR("%@"), v10);
  }
  v11 = v10;
LABEL_6:

  return v11;
}

- (BOOL)parseOptions:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSURL *v14;
  void *v15;
  id v16;
  NSData *v17;
  void *v18;
  id v19;
  void *v20;
  NSString *v21;
  void *v22;
  NSURL *v23;
  void *v24;
  BOOL v25;
  const __CFString *v26;
  id v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BuildIdentity"));
  if (v5)
  {
    v6 = -[AppleTypeCRetimerFirmwareCopierBackDeploy rtKitKeyFromBuildIdentityDict:](self, "rtKitKeyFromBuildIdentityDict:", v5);
    if (!v6)
    {
      -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find RTKitOS key in build identity dictionary"));
      v25 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Info"));
    v9 = v8;
    if (!v8)
    {
      -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find RTKitOS info dictionary"));
      v25 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v10 = objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Path"));
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "copy");
      v13 = *(void **)(&self->super._verbose + 1);
      *(_QWORD *)(&self->super._verbose + 1) = v12;

      v14 = (NSURL *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
      v15 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
      *(NSURL **)((char *)&self->_destBundlePathURL + 1) = v14;

      if (*(NSURL **)((char *)&self->_destBundlePathURL + 1))
        goto LABEL_12;
      v16 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleDataDict"));
      if (v16)
      {
        v28 = v16;
        v17 = (NSData *)objc_msgSend(v16, "objectForKeyedSubscript:", v6);
        v18 = *(NSData **)((char *)&self->_firmwareOverrideData + 1);
        *(NSData **)((char *)&self->_firmwareOverrideData + 1) = v17;

        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Attempt to use '%@' firmware from BundleDataDict: %@"), v6, *(NSData **)((char *)&self->_firmwareOverrideData + 1));
        v16 = v28;
      }

      if (*(NSURL **)((char *)&self->_destBundlePathURL + 1) || *(NSData **)((char *)&self->_firmwareOverrideData + 1))
        goto LABEL_12;
      v19 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundlePath"));
      if (v19)
      {
        v20 = v19;
        v21 = (NSString *)objc_msgSend(v19, "URLByAppendingPathComponent:", *(_QWORD *)(&self->super._verbose + 1));
        v22 = *(NSString **)((char *)&self->_firmwarePathSuffix + 1);
        *(NSString **)((char *)&self->_firmwarePathSuffix + 1) = v21;

LABEL_12:
        v23 = (NSURL *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DestBundlePath"));
        v24 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
        *(NSURL **)((char *)&self->_firmwareBundleURL + 1) = v23;

        v25 = 1;
LABEL_18:

        goto LABEL_19;
      }
      v26 = CFSTR("Could not find bundle path");
    }
    else
    {
      v26 = CFSTR("Could not find RTKitOS path");
    }
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", v26);
    v25 = 0;
    goto LABEL_18;
  }
  -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find build identity dictionary"));
  v25 = 0;
LABEL_21:

  return v25;
}

- (id)rtKitKeyFromBuildIdentityDict:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "hasPrefix:", CFSTR("Timer,RTKitOS"), (_QWORD)v11) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)createDestinationBundleFirmwareDirectoryFor:(id)a3 error:(id *)a4
{
  NSURL *v6;
  NSURL *v7;
  NSFileManager *v8;
  NSString *v9;
  unsigned __int8 v10;
  NSString *v11;

  v6 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a3);
  v7 = -[NSURL URLByDeletingLastPathComponent](v6, "URLByDeletingLastPathComponent");
  v8 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  v9 = -[NSURL path](v7, "path");
  v10 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);

  if ((v10 & 1) == 0)
  {
    v11 = -[NSURL path](v7, "path");
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to create destination bundle firmware directory at '%@' (%@)"), v11, *a4);

  }
  return v10;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  void *v4;
  id v5;
  NSString *v6;
  NSURL *v7;
  NSFileManager *v8;
  NSURL *v9;
  NSFileManager *v10;
  NSString *v11;
  unsigned __int8 v12;
  id v13;
  NSString *v14;
  unsigned int v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  void *v19;
  BOOL v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSFileManager *v24;
  uint64_t v25;
  unsigned __int8 v26;
  NSString *v27;
  NSString *v28;
  id v31;
  id v32;
  id v33;

  v4 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
  if (v4)
  {
    v5 = objc_msgSend(v4, "path");
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v5, *(_QWORD *)(&self->super._verbose + 1));

    v7 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6);
    v8 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v9 = -[NSURL URLByDeletingLastPathComponent](v7, "URLByDeletingLastPathComponent");
    v10 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v11 = -[NSURL path](v9, "path");
    v33 = 0;
    v12 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v33);
    v13 = v33;

    if ((v12 & 1) == 0 && (objc_msgSend(v13, "isFileExistsError") & 1) == 0)
    {
      v23 = -[NSURL path](v9, "path");
      -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to create directory at '%@' (%@)"), v23, v13);

      if (!a3)
      {
LABEL_21:
        v20 = 0;
        goto LABEL_22;
      }
      v20 = 0;
      *a3 = objc_retainAutorelease(v13);
      goto LABEL_22;
    }
    v14 = -[NSURL path](v7, "path");
    v15 = -[NSFileManager fileExistsAtPath:](v8, "fileExistsAtPath:", v14);

    if (v15)
    {
      v32 = 0;
      v16 = -[NSFileManager removeItemAtURL:error:](v8, "removeItemAtURL:error:", v7, &v32);
      v17 = v32;
      v18 = v17;
      if ((v16 & 1) == 0)
      {
        v27 = -[NSURL path](v7, "path");
        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to remove file at '%@' (%@)"), v27, v18);
        goto LABEL_17;
      }

    }
    v19 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
    if (v19)
    {
      v20 = 1;
      if ((objc_msgSend(v19, "writeToURL:atomically:", v7, 1) & 1) == 0)
      {
        v21 = -[NSURL path](v7, "path");
        -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to write firmware file data to '%@'"), v21);
        v22 = v21;
LABEL_20:

        goto LABEL_21;
      }
LABEL_22:

      return v20;
    }
    v24 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
    v25 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    v31 = 0;
    v26 = -[NSFileManager copyItemAtURL:toURL:error:](v24, "copyItemAtURL:toURL:error:", v25, v7, &v31);
    v18 = v31;

    if ((v26 & 1) != 0)
    {

      v20 = 1;
      goto LABEL_22;
    }
    v27 = (NSString *)objc_msgSend(*(id *)((char *)&self->_firmwarePathSuffix + 1), "path");
    v28 = -[NSURL path](v7, "path");
    -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to copy firmware from '%@' to '%@' (%@)"), v27, v28, v18);

LABEL_17:
    if (a3)
      *a3 = objc_retainAutorelease(v18);
    v22 = (NSString *)v18;
    goto LABEL_20;
  }
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  void *v4;
  NSData *v5;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v4 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
  if (v4 || (v4 = *(NSData **)((char *)&self->_firmwareOverrideData + 1)) != 0)
  {
    v5 = v4;
  }
  else
  {
    v8 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    v11 = 0;
    v5 = +[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v8, 0, &v11);
    v9 = v11;
    if (!v5)
    {
      v10 = objc_msgSend(*(id *)((char *)&self->_firmwarePathSuffix + 1), "path");
      -[AppleTypeCRetimerRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to read firmware file at '%@' (%@)"), v10, v9);

      if (a3)
        *a3 = objc_retainAutorelease(v9);
    }

  }
  return v5;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  NSMutableString *v5;
  id v6;
  void *v7;
  id v8;
  NSString *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@:\n"), v4);

  -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("\tFirmware path suffix: %@\n"), *(_QWORD *)(&self->super._verbose + 1));
  v6 = objc_msgSend(*(id *)((char *)&self->_firmwarePathSuffix + 1), "path");
  -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("\tFirmware bundle path: %@\n"), v6);

  v7 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
  if (v7)
  {
    v8 = objc_msgSend(v7, "path");
    -[NSMutableString appendFormat:](v5, "appendFormat:", CFSTR("\tDestination Bundle Path: %@\n"), v8);

  }
  v9 = +[NSString stringWithString:](NSString, "stringWithString:", v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firmwareOverrideData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_destBundlePathURL + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwareBundleURL + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwarePathSuffix + 1), 0);
  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
