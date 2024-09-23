@implementation MIInstallableBundlePatch

- (MIInstallableBundlePatch)initWithBundle:(id)a3 inStagingRoot:(id)a4 packageFormat:(unsigned __int8)a5 identity:(id)a6 domain:(unint64_t)a7 installOptions:(id)a8 manifestURL:(id)a9 existingBundleContainer:(id)a10 patchType:(unsigned __int8)a11 operationType:(unint64_t)a12 error:(id *)a13
{
  uint64_t v16;
  MIInstallableBundlePatch *v20;
  uint64_t v21;
  MIInstallableBundlePatch *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  NSString *updatedBundleVersion;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSString *updatedBundleShortVersion;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSString *existingBundleVersion;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  NSString *existingBundleShortVersion;
  MIInstallableBundlePatch *v51;
  id v52;
  void *v53;
  __CFString *v54;
  uint64_t v55;
  id v56;
  id v58;
  objc_super v59;

  v16 = a5;
  v58 = a9;
  v59.receiver = self;
  v59.super_class = (Class)MIInstallableBundlePatch;
  v20 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:](&v59, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:", a3, a4, v16, a6, a7, a8);
  v22 = v20;
  if (!v20)
    goto LABEL_6;
  if (!a10)
  {
    if (a13)
    {
      v52 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:]", 48, MIInstallerErrorDomain, 4, 0, 0, CFSTR("No installed app container supplied for patch update."), v21, (uint64_t)a10);
      v51 = 0;
      *a13 = (id)objc_claimAutoreleasedReturnValue(v52);
    }
    else
    {
      v51 = 0;
    }
    goto LABEL_15;
  }
  v23 = v58;
  if (v58)
  {
    if (a11)
    {
      objc_storeStrong((id *)&v20->_manifestURL, a9);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](v22, "bundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "infoPlistSubset"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", kCFBundleVersionKey));
      v27 = sub_10001152C(v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      updatedBundleVersion = v22->_updatedBundleVersion;
      v22->_updatedBundleVersion = (NSString *)v28;

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](v22, "bundle"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "infoPlistSubset"));
      v32 = _kCFBundleShortVersionStringKey;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", _kCFBundleShortVersionStringKey));
      v34 = sub_10001152C(v33);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      updatedBundleShortVersion = v22->_updatedBundleShortVersion;
      v22->_updatedBundleShortVersion = (NSString *)v35;

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](v22, "existingBundleContainer"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundle"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "infoPlistSubset"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", kCFBundleVersionKey));
      v41 = sub_10001152C(v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      existingBundleVersion = v22->_existingBundleVersion;
      v22->_existingBundleVersion = (NSString *)v42;

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](v22, "existingBundleContainer"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bundle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "infoPlistSubset"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v32));
      v48 = sub_10001152C(v47);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      existingBundleShortVersion = v22->_existingBundleShortVersion;
      v22->_existingBundleShortVersion = (NSString *)v49;

      v22->_patchType = a11;
LABEL_6:
      v51 = v22;
LABEL_15:
      v23 = v58;
      goto LABEL_16;
    }
    if (a13)
    {
      v53 = (void *)MIInstallerErrorDomain;
      v54 = CFSTR("No patch type supplied for patch update.");
      v55 = 58;
      goto LABEL_13;
    }
LABEL_17:
    v51 = 0;
    goto LABEL_16;
  }
  if (!a13)
    goto LABEL_17;
  v53 = (void *)MIInstallerErrorDomain;
  v54 = CFSTR("No manifest supplied for patch update.");
  v55 = 53;
LABEL_13:
  v56 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:]", v55, v53, 4, 0, 0, v54, v21, (uint64_t)a10);
  v51 = 0;
  *a13 = (id)objc_claimAutoreleasedReturnValue(v56);
LABEL_16:

  return v51;
}

- (NSString)patchTypeName
{
  unsigned int v2;

  v2 = -[MIInstallableBundlePatch patchType](self, "patchType") - 1;
  if (v2 > 2)
    return (NSString *)CFSTR("Invalid");
  else
    return &off_100085740[(char)v2]->isa;
}

- (BOOL)_applyDeltaPatchWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  const __CFArray *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  id v19;
  const char *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  const char *v26;
  BOOL v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v41;
  void *v42;
  id *v43;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  char *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  CFErrorRef v55;
  void *v56;
  void *v57;
  const __CFArray *v58;
  CFErrorRef v59;
  id v60;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("Info.plist"), 0));

  v60 = 0;
  v9 = MICreateSHA256Digest(v8, &v60);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = v60;
  if (!v10)
  {
    v28 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]", 91, MIInstallerErrorDomain, 8, v12, &off_10008F820, CFSTR("Failed to get Info.plist hash for %@"), v11, (uint64_t)v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v15 = 0;
    if (a3)
      goto LABEL_8;
LABEL_12:
    v27 = 0;
    v12 = v29;
    goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundle"));
  v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "supportedDevices"));

  objc_opt_class(NSString);
  if ((sub_100011190(v15) & 1) == 0)
  {
    v30 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]", 97, MIInstallerErrorDomain, 87, 0, &off_10008F848, CFSTR("Existing app's SupportedDevices Info.plist key does not contain only string values."), v16, v41);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v30);

    if (a3)
      goto LABEL_8;
    goto LABEL_12;
  }
  v43 = a3;
  v45 = v8;
  MIAssertHighResourceUsage();
  v59 = 0;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bundle"));
  v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bundleURL")));
  v48 = (char *)objc_msgSend(v52, "fileSystemRepresentation");
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "bundleURL")));
  v47 = (const char *)objc_msgSend(v50, "fileSystemRepresentation");
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL")));
  v46 = (const char *)objc_msgSend(v49, "fileSystemRepresentation");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleVersion](self, "existingBundleVersion")));
  v18 = (const char *)objc_msgSend(v17, "UTF8String");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleShortVersion](self, "existingBundleShortVersion")));
  v58 = v15;
  v20 = (const char *)objc_msgSend(v19, "UTF8String");
  v44 = v10;
  v21 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundle"));
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "executableURL")));
  v25 = (const char *)objc_msgSend(v24, "fileSystemRepresentation");
  v26 = v20;
  v15 = v58;
  LOBYTE(v21) = sub_100005F08(v48, v47, v46, v18, v26, v21, v25, v58, 0, &v59);

  MIClearResourceAssertion();
  if ((v21 & 1) == 0)
  {
    v53 = (void *)MIInstallerErrorDomain;
    v55 = v59;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "bundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bundleURL"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "path"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bundleURL"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "path"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));
    v39 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch _applyDeltaPatchWithError:]", 116, v53, 8, v55, &off_10008F870, CFSTR("Could not hardlink copy %@ to %@ with manifest %@"), v38, (uint64_t)v33);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v39);

    if (v59)
    {
      CFRelease(v59);
      v59 = 0;
    }
    v10 = v44;
    v8 = v45;
    a3 = v43;
    v15 = v58;
    if (!v43)
      goto LABEL_12;
LABEL_8:
    v12 = objc_retainAutorelease(v29);
    v27 = 0;
    *a3 = v12;
    goto LABEL_13;
  }
  v27 = 1;
  v10 = v44;
  v8 = v45;
LABEL_13:

  return v27;
}

- (BOOL)_applyParallelPatchProcessingArchiveSection:(BOOL)a3 withError:(id *)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  uint64_t v39;
  void *v40;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  unsigned int v49;
  int v50;
  unsigned int v51;
  void *v52;
  id v53;
  _QWORD v54[3];
  int v55;
  char v56;
  __int16 v57;
  char v58;
  unsigned int v59;
  unsigned int v60;
  __int128 v61;
  void **v62;
  uint64_t v63;
  void *v64;

  v4 = a3;
  v64 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v51 = objc_msgSend(v6, "uid");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v49 = objc_msgSend(v7, "gid");

  if (v4)
    v8 = 256;
  else
    v8 = 258;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundle"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleURL")));
  v47 = objc_msgSend(v11, "fileSystemRepresentation");
  v54[0] = v47;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleURL")));
  v14 = objc_msgSend(v13, "fileSystemRepresentation");
  v54[1] = v14;
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL")));
  v16 = objc_msgSend(v15, "fileSystemRepresentation");
  v54[2] = v16;
  v55 = v8;
  v56 = 15;
  v57 = 0;
  v58 = 0;
  v59 = v51;
  v60 = v49;
  v61 = xmmword_10005E6F0;
  v62 = &v64;
  v63 = 0;

  v19 = qword_10009E048;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v44 = v14;
    v45 = v16;
    v42 = v47;
    v19 = MOLogWrite(qword_10009E048, 7, "-[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:]", CFSTR("Calling DirectoryPatch with inDir '%s', outDir '%s', patchFilename '%s'"));
  }
  MIAssertHighResourceUsage(v19, v17, v18);
  v20 = DirectoryPatch(v54);
  v21 = v20;
  MIClearResourceAssertion(v20, v22, v23);
  if (v21)
  {
    v50 = v21;
    v24 = (void *)MIInstallerErrorDomain;
    v25 = v64;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bundleURL"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "path"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bundleURL"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "path"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "path"));
    v34 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:]", 182, v24, 8, v25, &off_10008F898, CFSTR("DirectoryPatch failed for %@ to %@ with manifest %@"), v33, (uint64_t)v28);
    v35 = (id)objc_claimAutoreleasedReturnValue(v34);

    if (v25)
    if (a4)
    {
      v35 = objc_retainAutorelease(v35);
      *a4 = v35;
    }
    v21 = v50;
  }
  else
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));
    v53 = 0;
    v38 = objc_msgSend(v36, "removeItemAtURL:error:", v37, &v53);
    v35 = v53;

    if ((v38 & 1) == 0)
    {
      v39 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL", v42, v44, v45));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
        MOLogWrite(v39, 3, "-[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:]", CFSTR("Failed to remove the parallel patch file %@: %@"));

      }
    }
  }

  return v21 == 0;
}

- (BOOL)applyPatchWithError:(id *)a3
{
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch manifestURL](self, "manifestURL"));

  if (!v5)
    goto LABEL_18;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v6)[2](v6, CFSTR("PatchingApplication"), 35);

  v7 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch patchTypeName](self, "patchTypeName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleVersion](self, "existingBundleVersion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch existingBundleShortVersion](self, "existingBundleShortVersion"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch updatedBundleVersion](self, "updatedBundleVersion"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundlePatch updatedBundleShortVersion](self, "updatedBundleShortVersion"));
    v31 = v11;
    v32 = v12;
    v28 = v8;
    v30 = v10;
    MOLogWrite(v7, 5, "-[MIInstallableBundlePatch applyPatchWithError:]", CFSTR("Attempting %@ patch update of %@ from %@ (%@) to %@ (%@)"));

  }
  v13 = -[MIInstallableBundlePatch patchType](self, "patchType", v28, v30, v31, v32, v33, v34);
  if (v13 == 1)
  {
    v36 = 0;
    v15 = -[MIInstallableBundlePatch _applyDeltaPatchWithError:](self, "_applyDeltaPatchWithError:", &v36);
    v5 = v36;
    if (v15)
      goto LABEL_13;
    goto LABEL_20;
  }
  if (v13 != 2)
  {
    if (v13 == 3)
    {
      v14 = 1;
      goto LABEL_12;
    }
    v5 = 0;
LABEL_20:
    if (!a3)
      goto LABEL_24;
    goto LABEL_21;
  }
  v14 = 0;
LABEL_12:
  v35 = 0;
  v16 = -[MIInstallableBundlePatch _applyParallelPatchProcessingArchiveSection:withError:](self, "_applyParallelPatchProcessingArchiveSection:withError:", v14, &v35);
  v5 = v35;
  if ((v16 & 1) == 0)
    goto LABEL_20;
LABEL_13:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  if ((objc_msgSend(v17, "allowPatchWithoutSinf") & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable installOptions](self, "installOptions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sinfData"));
    if (v19)
    {

      goto LABEL_16;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v23 = objc_msgSend(v22, "needsSinf");

    if (!v23)
      goto LABEL_17;
    v25 = sub_100010E50((uint64_t)"-[MIInstallableBundlePatch applyPatchWithError:]", 245, MIInstallerErrorDomain, 60, 0, &off_10008F8C0, CFSTR("Client requesting patch installation did not supply a new SINF for an app that requires one to function"), v24, v29);
    v26 = objc_claimAutoreleasedReturnValue(v25);

    v5 = (id)v26;
    if (!a3)
    {
LABEL_24:
      v21 = 0;
      goto LABEL_25;
    }
LABEL_21:
    v5 = objc_retainAutorelease(v5);
    v21 = 0;
    *a3 = v5;
    goto LABEL_25;
  }
LABEL_16:

LABEL_17:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  objc_msgSend(v20, "removeSinf");

LABEL_18:
  v21 = 1;
LABEL_25:

  return v21;
}

- (NSString)existingBundleVersion
{
  return self->_existingBundleVersion;
}

- (NSString)existingBundleShortVersion
{
  return self->_existingBundleShortVersion;
}

- (NSString)updatedBundleVersion
{
  return self->_updatedBundleVersion;
}

- (NSString)updatedBundleShortVersion
{
  return self->_updatedBundleShortVersion;
}

- (NSURL)manifestURL
{
  return self->_manifestURL;
}

- (unsigned)patchType
{
  return self->_patchType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_updatedBundleShortVersion, 0);
  objc_storeStrong((id *)&self->_updatedBundleVersion, 0);
  objc_storeStrong((id *)&self->_existingBundleShortVersion, 0);
  objc_storeStrong((id *)&self->_existingBundleVersion, 0);
}

@end
