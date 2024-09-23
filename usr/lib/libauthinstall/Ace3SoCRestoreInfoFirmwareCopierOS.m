@implementation Ace3SoCRestoreInfoFirmwareCopierOS

- (Ace3SoCRestoreInfoFirmwareCopierOS)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  Ace3SoCRestoreInfoFirmwareCopierOS *v9;
  Ace3SoCRestoreInfoFirmwareCopierOS *v10;
  Ace3SoCRestoreInfoFirmwareCopierOS *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)Ace3SoCRestoreInfoFirmwareCopierOS;
  v9 = -[Ace3SoCRestoreInfoHelperOS initWithOptions:logFunction:logContext:](&v13, sel_initWithOptions_logFunction_logContext_, v8, a4, a5);
  v10 = v9;
  if (v9
    && (-[Ace3SoCRestoreInfoHelperOS verboseLog:](v9, "verboseLog:", CFSTR("%s: input options: %@"), "-[Ace3SoCRestoreInfoFirmwareCopierOS initWithOptions:logFunction:logContext:]", v8), !-[Ace3SoCRestoreInfoFirmwareCopierOS parseOptions:](v10, "parseOptions:", v8)))
  {
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  return v11;
}

- (id)firmwareKeyFromBuildIdentityDict:(id)a3 deviceInfo:(id)a4
{
  return 0;
}

- (BOOL)parseOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *firmwarePathSuffix;
  BOOL v16;
  NSData *v17;
  NSData *firmwareOverrideData;
  NSData *v19;
  void *v20;
  void *v21;
  NSData *v22;
  NSData *firmwareInBundleDataDict;
  NSURL *v24;
  NSURL *destBundlePathURL;
  void *v27;
  void *v28;
  NSURL *v29;
  NSURL *firmwareBundleURL;
  const __CFString *v31;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BuildIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Warning: Could not find device info dictionary"));
    if (objc_msgSend(v5, "count"))
    {
      -[Ace3SoCRestoreInfoFirmwareCopierOS firmwareKeyFromBuildIdentityDict:deviceInfo:](self, "firmwareKeyFromBuildIdentityDict:deviceInfo:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find firmware key in build identity dictionary"));
LABEL_26:
        v16 = 0;
        goto LABEL_27;
      }
      v8 = (void *)v7;
      objc_msgSend(v5, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Info"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Path"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = (NSString *)objc_msgSend(v12, "copy");
          firmwarePathSuffix = self->_firmwarePathSuffix;
          self->_firmwarePathSuffix = v14;

LABEL_11:
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData"));
          v17 = (NSData *)objc_claimAutoreleasedReturnValue();
          firmwareOverrideData = self->_firmwareOverrideData;
          self->_firmwareOverrideData = v17;

          v19 = self->_firmwareOverrideData;
          if (v19)
          {
            -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Detected firmware override"));
            v19 = self->_firmwareOverrideData;
          }
          if (!v19 && v8)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleDataDict"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", v8);
              v22 = (NSData *)objc_claimAutoreleasedReturnValue();
              firmwareInBundleDataDict = self->_firmwareInBundleDataDict;
              self->_firmwareInBundleDataDict = v22;

              -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Attempt to use '%@' firmware from BundleDataDict: %@"), v8, self->_firmwareInBundleDataDict);
            }

            v19 = self->_firmwareOverrideData;
          }
          if (v19 || self->_firmwareInBundleDataDict)
            goto LABEL_20;
          if (self->_firmwarePathSuffix)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundlePath"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = v27;
              objc_msgSend(v27, "URLByAppendingPathComponent:", self->_firmwarePathSuffix);
              v29 = (NSURL *)objc_claimAutoreleasedReturnValue();
              firmwareBundleURL = self->_firmwareBundleURL;
              self->_firmwareBundleURL = v29;

LABEL_20:
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DestBundlePath"));
              v24 = (NSURL *)objc_claimAutoreleasedReturnValue();
              destBundlePathURL = self->_destBundlePathURL;
              self->_destBundlePathURL = v24;

              v16 = 1;
LABEL_27:

              goto LABEL_28;
            }
            v31 = CFSTR("Could not find bundle path");
          }
          else
          {
            v31 = CFSTR("Firmware override must be specified if build identity dictionary is empty");
          }
          -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", v31);
          goto LABEL_25;
        }
        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find firmware path"));

      }
      else
      {
        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find firmware info dictionary"));
      }

LABEL_25:
      goto LABEL_26;
    }
    -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Detected empty build identity dictionary"));
    v8 = 0;
    goto LABEL_11;
  }
  -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Could not find build identity dictionary"));
  v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  NSURL *destBundlePathURL;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  int v17;
  char v18;
  id v19;
  id v20;
  NSData *firmwareOverrideData;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  NSURL *firmwareBundleURL;
  char v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  id v33;

  destBundlePathURL = self->_destBundlePathURL;
  if (destBundlePathURL && self->_firmwarePathSuffix)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[NSURL path](destBundlePathURL, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v7, self->_firmwarePathSuffix);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v14 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v33);
    v15 = v33;

    if ((v14 & 1) == 0 && (objc_msgSend(v15, "isFileExistsError") & 1) == 0)
    {
      objc_msgSend(v11, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to create directory at '%@' (%@)"), v24, v15);

      if (a3)
      {
        v22 = 0;
        *a3 = objc_retainAutorelease(v15);
LABEL_22:

        return v22;
      }
LABEL_21:
      v22 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v9, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "fileExistsAtPath:", v16);

    if (v17)
    {
      v32 = 0;
      v18 = objc_msgSend(v10, "removeItemAtURL:error:", v9, &v32);
      v19 = v32;
      v20 = v19;
      if ((v18 & 1) == 0)
      {
        objc_msgSend(v9, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to remove file at '%@' (%@)"), v28, v20);
LABEL_18:

        if (a3)
          *a3 = objc_retainAutorelease(v20);

        goto LABEL_21;
      }

    }
    firmwareOverrideData = self->_firmwareOverrideData;
    if (firmwareOverrideData)
    {
      v22 = 1;
      if (!-[NSData writeToURL:atomically:](firmwareOverrideData, "writeToURL:atomically:", v9, 1))
      {
        objc_msgSend(v9, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to write firmware file data to '%@'"), v23);

        v22 = 0;
      }
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    firmwareBundleURL = self->_firmwareBundleURL;
    v31 = 0;
    v27 = objc_msgSend(v25, "copyItemAtURL:toURL:error:", firmwareBundleURL, v9, &v31);
    v20 = v31;

    if ((v27 & 1) != 0)
    {

      v22 = 1;
      goto LABEL_22;
    }
    -[NSURL path](self->_firmwareBundleURL, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to copy firmware from '%@' to '%@' (%@)"), v28, v29, v20);

    goto LABEL_18;
  }
  -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Not copying firmware to destination bundle"));
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  NSData *firmwareOverrideData;
  NSData *v5;
  NSURL *firmwareBundleURL;
  id v9;
  void *v10;
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
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", firmwareBundleURL, 0, &v11);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (!v5)
    {
      -[NSURL path](self->_firmwareBundleURL, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[Ace3SoCRestoreInfoHelperOS log:](self, "log:", CFSTR("Failed to read firmware file at '%@' (%@)"), v10, v9);

      if (a3)
        *a3 = objc_retainAutorelease(v9);
    }

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareInBundleDataDict, 0);
  objc_storeStrong((id *)&self->_firmwareOverrideData, 0);
  objc_storeStrong((id *)&self->_firmwareBundleURL, 0);
  objc_storeStrong((id *)&self->_firmwarePathSuffix, 0);
  objc_storeStrong((id *)&self->_destBundlePathURL, 0);
}

@end
