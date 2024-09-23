@implementation AppleTypeCRetimerFirmwareCopierOS

- (AppleTypeCRetimerFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  AppleTypeCRetimerFirmwareCopierOS *v9;
  AppleTypeCRetimerFirmwareCopierOS *v10;
  AppleTypeCRetimerFirmwareCopierOS *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppleTypeCRetimerFirmwareCopierOS;
  v9 = -[AppleTypeCRetimerRestoreInfoHelperOS initWithOptions:logFunction:logContext:](&v13, sel_initWithOptions_logFunction_logContext_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    if (!-[AppleTypeCRetimerFirmwareCopierOS parseOptions:](v9, "parseOptions:", v8))
    {
      v11 = 0;
      goto LABEL_6;
    }
    -[AppleTypeCRetimerRestoreInfoHelperOS verboseLog:](v10, "verboseLog:", CFSTR("%@"), v10);
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
  NSString *v12;
  NSString *firmwarePathSuffix;
  NSData *v14;
  NSData *firmwareOverrideData;
  id v16;
  NSData *v17;
  NSData *firmwareInBundleDataDict;
  id v19;
  void *v20;
  NSURL *v21;
  NSURL *firmwareBundleURL;
  NSURL *v23;
  NSURL *destBundlePathURL;
  BOOL v25;
  const __CFString *v26;
  id v28;

  v4 = a3;
  v5 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BuildIdentity"));
  if (v5)
  {
    v6 = -[AppleTypeCRetimerFirmwareCopierOS rtKitKeyFromBuildIdentityDict:](self, "rtKitKeyFromBuildIdentityDict:", v5);
    if (!v6)
    {
      -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find RTKitOS key in build identity dictionary"));
      v25 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = (id)objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = (id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Info"));
    v9 = v8;
    if (!v8)
    {
      -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find RTKitOS info dictionary"));
      v25 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v10 = (id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Path"));
    v11 = v10;
    if (v10)
    {
      v12 = (NSString *)objc_msgSend(v10, "copy");
      firmwarePathSuffix = self->_firmwarePathSuffix;
      self->_firmwarePathSuffix = v12;

      v14 = (NSData *)(id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
      firmwareOverrideData = self->_firmwareOverrideData;
      self->_firmwareOverrideData = v14;

      if (self->_firmwareOverrideData)
        goto LABEL_12;
      v16 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleDataDict"));
      if (v16)
      {
        v28 = v16;
        v17 = (NSData *)(id)objc_msgSend(v16, "objectForKeyedSubscript:", v6);
        firmwareInBundleDataDict = self->_firmwareInBundleDataDict;
        self->_firmwareInBundleDataDict = v17;

        -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Attempt to use '%@' firmware from BundleDataDict: %@"), v6, self->_firmwareInBundleDataDict);
        v16 = v28;
      }

      if (self->_firmwareOverrideData || self->_firmwareInBundleDataDict)
        goto LABEL_12;
      v19 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundlePath"));
      if (v19)
      {
        v20 = v19;
        v21 = (NSURL *)(id)objc_msgSend(v19, "URLByAppendingPathComponent:", self->_firmwarePathSuffix);
        firmwareBundleURL = self->_firmwareBundleURL;
        self->_firmwareBundleURL = v21;

LABEL_12:
        v23 = (NSURL *)(id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DestBundlePath"));
        destBundlePathURL = self->_destBundlePathURL;
        self->_destBundlePathURL = v23;

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
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", v26);
    v25 = 0;
    goto LABEL_18;
  }
  -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find build identity dictionary"));
  v25 = 0;
LABEL_21:

  return v25;
}

- (id)rtKitKeyFromBuildIdentityDict:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
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
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;

  v6 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", a3);
  v7 = (id)objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v8 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (id)objc_msgSend(v7, "path");
  v10 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);

  if ((v10 & 1) == 0)
  {
    v11 = (id)objc_msgSend(v7, "path");
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to create destination bundle firmware directory at '%@' (%@)"), v11, *a4);

  }
  return v10;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  NSURL *destBundlePathURL;
  void *v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  int v16;
  char v17;
  id v18;
  id v19;
  NSData *firmwareOverrideData;
  BOOL v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSURL *firmwareBundleURL;
  char v27;
  NSString *v28;
  id v29;
  id v32;
  id v33;
  id v34;

  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = -[NSURL path](destBundlePathURL, "path");
    v7 = (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@/%@"), v6, self->_firmwarePathSuffix);

    v8 = (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
    v9 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (id)objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v11 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (id)objc_msgSend(v10, "path");
    v34 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v34);
    v14 = v34;

    if ((v13 & 1) == 0 && (objc_msgSend(v14, "isFileExistsError") & 1) == 0)
    {
      v24 = (id)objc_msgSend(v10, "path");
      -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to create directory at '%@' (%@)"), v24, v14);

      if (!a3)
      {
LABEL_21:
        v21 = 0;
        goto LABEL_22;
      }
      v21 = 0;
      *a3 = objc_retainAutorelease(v14);
      goto LABEL_22;
    }
    v15 = (id)objc_msgSend(v8, "path");
    v16 = objc_msgSend(v9, "fileExistsAtPath:", v15);

    if (v16)
    {
      v33 = 0;
      v17 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v33);
      v18 = v33;
      v19 = v18;
      if ((v17 & 1) == 0)
      {
        v28 = (NSString *)(id)objc_msgSend(v8, "path");
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to remove file at '%@' (%@)"), v28, v19);
        goto LABEL_17;
      }

    }
    firmwareOverrideData = self->_firmwareOverrideData;
    if (firmwareOverrideData)
    {
      v21 = 1;
      if (!-[NSData writeToURL:atomically:](firmwareOverrideData, "writeToURL:atomically:", v8, 1))
      {
        v22 = (id)objc_msgSend(v8, "path");
        -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to write firmware file data to '%@'"), v22);
        v23 = v22;
LABEL_20:

        goto LABEL_21;
      }
LABEL_22:

      return v21;
    }
    v25 = (id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    firmwareBundleURL = self->_firmwareBundleURL;
    v32 = 0;
    v27 = objc_msgSend(v25, "copyItemAtURL:toURL:error:", firmwareBundleURL, v8, &v32);
    v19 = v32;

    if ((v27 & 1) != 0)
    {

      v21 = 1;
      goto LABEL_22;
    }
    v28 = -[NSURL path](self->_firmwareBundleURL, "path");
    v29 = (id)objc_msgSend(v8, "path");
    -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to copy firmware from '%@' to '%@' (%@)"), v28, v29, v19);

LABEL_17:
    if (a3)
      *a3 = objc_retainAutorelease(v19);
    v23 = v19;
    goto LABEL_20;
  }
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  NSData *firmwareOverrideData;
  NSData *v5;
  NSURL *firmwareBundleURL;
  id v9;
  NSString *v10;
  id v11;

  firmwareOverrideData = self->_firmwareOverrideData;
  if (firmwareOverrideData || (firmwareOverrideData = self->_firmwareInBundleDataDict) != 0)
  {
    v5 = firmwareOverrideData;
  }
  else
  {
    firmwareBundleURL = self->_firmwareBundleURL;
    v11 = 0;
    v5 = (NSData *)(id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", firmwareBundleURL, 0, &v11);
    v9 = v11;
    if (!v5)
    {
      v10 = -[NSURL path](self->_firmwareBundleURL, "path");
      -[AppleTypeCRetimerRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to read firmware file at '%@' (%@)"), v10, v9);

      if (a3)
        *a3 = objc_retainAutorelease(v9);
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  NSString *v7;
  NSURL *destBundlePathURL;
  NSString *v9;
  id v10;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:\n"), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR("\tFirmware path suffix: %@\n"), self->_firmwarePathSuffix);
  v7 = -[NSURL path](self->_firmwareBundleURL, "path");
  objc_msgSend(v6, "appendFormat:", CFSTR("\tFirmware bundle path: %@\n"), v7);

  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL)
  {
    v9 = -[NSURL path](destBundlePathURL, "path");
    objc_msgSend(v6, "appendFormat:", CFSTR("\tDestination Bundle Path: %@\n"), v9);

  }
  v10 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInBundleDataDict, 0);
  objc_storeStrong((id *)&self->_firmwareOverrideData, 0);
  objc_storeStrong((id *)&self->_destBundlePathURL, 0);
  objc_storeStrong((id *)&self->_firmwareBundleURL, 0);
  objc_storeStrong((id *)&self->_firmwarePathSuffix, 0);
}

@end
