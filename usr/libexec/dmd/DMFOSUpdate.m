@implementation DMFOSUpdate

+ (id)productKeyFromBuild:(id)a3
{
  const __CFString *v3;

  v3 = &stru_1000BC2E0;
  if (a3)
    v3 = (const __CFString *)a3;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("iOSUpdate"), v3);
}

- (id)initWithDescriptor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  __CFString *v13;
  unsigned int v14;
  __CFString *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  DMFOSUpdate *v20;
  uint64_t v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productBuildVersion"));

  if (v5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productBuildVersion"));
    v6 = objc_msgSend((id)objc_opt_class(self), "productKeyFromBuild:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = objc_msgSend(CFSTR("iOSUpdate"), "copy");
  }
  v8 = v7;
  v9 = objc_msgSend(v4, "updateType");
  v10 = objc_msgSend(v4, "isSplatOnly");
  v11 = objc_msgSend(v5, "copy");
  v12 = v4;
  v23 = v8;
  if ((objc_opt_respondsToSelector(v12, "productVersionExtra") & 1) != 0)
  {
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "productVersionExtra"));

  }
  else
  {
    v14 = objc_msgSend(v12, "isSplatOnly");

    v15 = CFSTR("(?)");
    if (!v14)
      v15 = 0;
    v13 = v15;
  }
  v16 = v9 == 3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "humanReadableUpdateName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "productSystemName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "productVersion"));
  BYTE3(v22) = v10;
  *(_WORD *)((char *)&v22 + 1) = 1;
  LOBYTE(v22) = v16;
  v20 = -[DMFOSUpdate initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:](self, "initWithProductKey:humanReadableName:productName:version:build:downloadSize:installSize:isCritical:restartRequired:allowsInstallLater:isSplat:supplementalBuild:supplementalVersionExtra:", v23, v17, v18, v19, v5, objc_msgSend(v12, "downloadSize"), objc_msgSend(v12, "installationSize"), v22, v11, v13);

  return v20;
}

@end
