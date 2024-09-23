@implementation Ace3SoCRestoreInfoFirmwareCopierBackDeploy

- (Ace3SoCRestoreInfoFirmwareCopierBackDeploy)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8;
  Ace3SoCRestoreInfoFirmwareCopierBackDeploy *v9;
  Ace3SoCRestoreInfoFirmwareCopierBackDeploy *v10;
  Ace3SoCRestoreInfoFirmwareCopierBackDeploy *v11;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)Ace3SoCRestoreInfoFirmwareCopierBackDeploy;
  v9 = -[Ace3SoCRestoreInfoHelperBackDeploy initWithOptions:logFunction:logContext:](&v13, "initWithOptions:logFunction:logContext:", v8, a4, a5);
  v10 = v9;
  if (v9
    && (-[Ace3SoCRestoreInfoHelperBackDeploy verboseLog:](v9, "verboseLog:", CFSTR("%s: input options: %@"), "-[Ace3SoCRestoreInfoFirmwareCopierBackDeploy initWithOptions:logFunction:logContext:]", v8), !-[Ace3SoCRestoreInfoFirmwareCopierBackDeploy parseOptions:](v10, "parseOptions:", v8)))
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
  NSURL *v14;
  void *v15;
  BOOL v16;
  NSURL *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSData *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  const __CFString *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BuildIdentity")));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DeviceInfo")));
    if (!v6)
      -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Warning: Could not find device info dictionary"));
    if (objc_msgSend(v5, "count"))
    {
      v7 = objc_claimAutoreleasedReturnValue(-[Ace3SoCRestoreInfoFirmwareCopierBackDeploy firmwareKeyFromBuildIdentityDict:deviceInfo:](self, "firmwareKeyFromBuildIdentityDict:deviceInfo:", v5, v6));
      if (!v7)
      {
        -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find firmware key in build identity dictionary"));
LABEL_26:
        v16 = 0;
        goto LABEL_27;
      }
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Info")));
      if (v10)
      {
        v11 = v10;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Path")));
        v13 = v12;
        if (v12)
        {
          v14 = (NSURL *)objc_msgSend(v12, "copy");
          v15 = *(NSURL **)((char *)&self->_destBundlePathURL + 1);
          *(NSURL **)((char *)&self->_destBundlePathURL + 1) = v14;

LABEL_11:
          v17 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FirmwareData")));
          v18 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
          *(NSURL **)((char *)&self->_firmwareBundleURL + 1) = v17;

          v19 = *(uint64_t *)((char *)&self->_firmwareBundleURL + 1);
          if (v19)
          {
            -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Detected firmware override"));
            v19 = *(uint64_t *)((char *)&self->_firmwareBundleURL + 1);
          }
          if (!v19 && v8)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleDataDict")));
            v21 = v20;
            if (v20)
            {
              v22 = (NSData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v8));
              v23 = *(NSData **)((char *)&self->_firmwareOverrideData + 1);
              *(NSData **)((char *)&self->_firmwareOverrideData + 1) = v22;

              -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Attempt to use '%@' firmware from BundleDataDict: %@"), v8, *(NSData **)((char *)&self->_firmwareOverrideData + 1));
            }

            v19 = *(uint64_t *)((char *)&self->_firmwareBundleURL + 1);
          }
          if (v19 || *(NSData **)((char *)&self->_firmwareOverrideData + 1))
            goto LABEL_20;
          if (*(NSURL **)((char *)&self->_destBundlePathURL + 1))
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundlePath")));
            if (v27)
            {
              v28 = v27;
              v29 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URLByAppendingPathComponent:", *(NSURL **)((char *)&self->_destBundlePathURL + 1)));
              v30 = *(NSString **)((char *)&self->_firmwarePathSuffix + 1);
              *(NSString **)((char *)&self->_firmwarePathSuffix + 1) = v29;

LABEL_20:
              v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DestBundlePath")));
              v25 = *(void **)(&self->super._verbose + 1);
              *(_QWORD *)(&self->super._verbose + 1) = v24;

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
          -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", v31);
          goto LABEL_25;
        }
        -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find firmware path"));

      }
      else
      {
        -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find firmware info dictionary"));
      }

LABEL_25:
      goto LABEL_26;
    }
    -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Detected empty build identity dictionary"));
    v8 = 0;
    goto LABEL_11;
  }
  -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Could not find build identity dictionary"));
  v16 = 0;
LABEL_28:

  return v16;
}

- (BOOL)copyFirmwareToDestinationBundleWithError:(id *)a3
{
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  void *v15;
  unsigned int v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  id v32;

  v4 = *(void **)(&self->super._verbose + 1);
  if (v4 && *(NSURL **)((char *)&self->_destBundlePathURL + 1))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v6, *(NSURL **)((char *)&self->_destBundlePathURL + 1)));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByDeletingLastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v32 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v32);
    v14 = v32;

    if ((v13 & 1) == 0 && (objc_msgSend(v14, "isFileExistsError") & 1) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
      -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to create directory at '%@' (%@)"), v23, v14);

      if (a3)
      {
        v21 = 0;
        *a3 = objc_retainAutorelease(v14);
LABEL_22:

        return v21;
      }
LABEL_21:
      v21 = 0;
      goto LABEL_22;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v16 = objc_msgSend(v9, "fileExistsAtPath:", v15);

    if (v16)
    {
      v31 = 0;
      v17 = objc_msgSend(v9, "removeItemAtURL:error:", v8, &v31);
      v18 = v31;
      v19 = v18;
      if ((v17 & 1) == 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
        -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to remove file at '%@' (%@)"), v27, v19);
LABEL_18:

        if (a3)
          *a3 = objc_retainAutorelease(v19);

        goto LABEL_21;
      }

    }
    v20 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
    if (v20)
    {
      v21 = 1;
      if ((objc_msgSend(v20, "writeToURL:atomically:", v8, 1) & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
        -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to write firmware file data to '%@'"), v22);

        v21 = 0;
      }
      goto LABEL_22;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v25 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    v30 = 0;
    v26 = objc_msgSend(v24, "copyItemAtURL:toURL:error:", v25, v8, &v30);
    v19 = v30;

    if ((v26 & 1) != 0)
    {

      v21 = 1;
      goto LABEL_22;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_firmwarePathSuffix + 1), "path"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to copy firmware from '%@' to '%@' (%@)"), v27, v28, v19);

    goto LABEL_18;
  }
  -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Not copying firmware to destination bundle"));
  return 1;
}

- (id)readFirmwareFileDataWithError:(id *)a3
{
  void *v3;
  id v5;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v3 = *(NSURL **)((char *)&self->_firmwareBundleURL + 1);
  if (v3 || (v3 = *(NSData **)((char *)&self->_firmwareOverrideData + 1)) != 0)
  {
    v5 = v3;
  }
  else
  {
    v8 = *(uint64_t *)((char *)&self->_firmwarePathSuffix + 1);
    v11 = 0;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v8, 0, &v11));
    v9 = v11;
    if (!v5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_firmwarePathSuffix + 1), "path"));
      -[Ace3SoCRestoreInfoHelperBackDeploy log:](self, "log:", CFSTR("Failed to read firmware file at '%@' (%@)"), v10, v9);

      if (a3)
        *a3 = objc_retainAutorelease(v9);
    }

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firmwareOverrideData + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwareBundleURL + 1), 0);
  objc_storeStrong((id *)((char *)&self->_firmwarePathSuffix + 1), 0);
  objc_storeStrong((id *)((char *)&self->_destBundlePathURL + 1), 0);
  objc_storeStrong((id *)(&self->super._verbose + 1), 0);
}

@end
