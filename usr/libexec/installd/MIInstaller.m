@implementation MIInstaller

- (MIInstaller)init
{
  abort();
}

- (MIInstaller)initWithURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  MIInstaller *v18;
  MIInstaller *v19;
  unint64_t v20;
  objc_super v23;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MIInstaller;
  v18 = -[MIInstaller init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_installURL, a3);
    objc_storeStrong((id *)&v19->_identity, a4);
    v20 = 2;
    if (a5 != 1)
      v20 = a5;
    v19->_installationDomain = v20;
    objc_storeStrong((id *)&v19->_options, a6);
    objc_storeStrong((id *)&v19->_client, a8);
    v19->_installOperationType = a7;
  }

  return v19;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
    sub_10004E89C(v4);

    -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0);
  }
  v5 = objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[MIInstaller terminationAssertionReleased](self, "terminationAssertionReleased");

    if ((v7 & 1) == 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
      objc_msgSend(v8, "releaseTerminationAssertion");

      -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)MIInstaller;
  -[MIInstaller dealloc](&v9, "dealloc");
}

+ (id)installerForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 forClient:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v14 = a8;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  v18 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithURL:identity:domain:options:operationType:forClient:", v17, v16, a5, v15, a7, v14);

  return v18;
}

- (void)_fireCallbackWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  objc_msgSend(v7, "sendProgressWithStatus:percentComplete:", v6, v4);

}

- (void)_fireCallbackWithStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  objc_msgSend(v5, "sendProgressWithStatus:", v4);

}

- (BOOL)_takeOwnershipOfInstallableContainingSymlink:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v21;
  BOOL v22;

  v22 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stageItemAtURL:options:containedSymlink:error:", v8, v9, &v22, &v21));
  v11 = v21;

  if (v10)
  {
    if (a3)
      *a3 = v22;
    -[MIInstaller setInstallURL:](self, "setInstallURL:", v10);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
    v13 = (void *)MIInstallerErrorDomain;
    v14 = objc_msgSend(v12, "isEqualToString:", MIInstallerErrorDomain);

    if ((v14 & 1) != 0)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "-[MIInstaller _takeOwnershipOfInstallableContainingSymlink:error:]", CFSTR("Helper returned error %@"));
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
      v18 = sub_100010E50((uint64_t)"-[MIInstaller _takeOwnershipOfInstallableContainingSymlink:error:]", 191, v13, 103, v11, 0, CFSTR("Failed to transfer ownership of path %@ to installd"), v17, (uint64_t)v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);

      v11 = (id)v19;
    }
    if (a4)
    {
      v11 = objc_retainAutorelease(v11);
      *a4 = v11;
    }
  }

  return v10 != 0;
}

- (BOOL)_setupPackageStateWithError:(id *)a3
{
  id v5;
  int v6;
  void *v7;
  NSError *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ssize_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  BOOL v29;
  uint64_t v31;
  char *v32;
  int *v33;
  int v34;
  id v35;
  id v36;
  int v37;
  int v38;
  ssize_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  unsigned int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  int *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  int *v62;
  const __CFString *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  id v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  stat v85;
  int value;
  uint64_t v87;
  void *v88;
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  uint64_t v93;
  void *v94;

  memset(&v85, 0, sizeof(v85));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL")));
  v6 = lstat((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v85);

  if (v6)
  {
    v7 = (void *)MIInstallerErrorDomain;
    v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v93 = MIPathArgumentErrorKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v94 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL")));
    v14 = objc_msgSend(v13, "fileSystemRepresentation");
    v15 = __error();
    strerror(*v15);
    v17 = sub_100010E50((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 223, v7, 3, v9, v12, CFSTR("Can't stat %s: %s"), v16, (uint64_t)v14);
    v18 = (id)objc_claimAutoreleasedReturnValue(v17);

LABEL_3:
LABEL_8:

    v28 = 0;
    goto LABEL_9;
  }
  v19 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  LOBYTE(value) = 110;
  v20 = objc_retainAutorelease(v19);
  v21 = getxattr((const char *)objc_msgSend(v20, "fileSystemRepresentation"), "com.apple.streamingzip.incomplete_extraction", &value, 1uLL, 0, 1);
  if (v21 == -1)
  {
    if (*__error() == 93)
      goto LABEL_18;
    if (*__error() == 34)
      goto LABEL_6;
  }
  else if ((v21 & 0x8000000000000000) == 0)
  {
LABEL_6:

    v22 = (void *)MIInstallerErrorDomain;
    v91[0] = MIPathArgumentErrorKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    v91[1] = CFSTR("LegacyErrorString");
    v92[0] = v23;
    v92[1] = CFSTR("PackageInspectionFailed");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v92, v91, 2));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL")));
    v75 = objc_msgSend(v25, "fileSystemRepresentation");
    v27 = sub_100010E50((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 230, v22, 3, 0, v24, CFSTR("Archive we've been requested to install at %s is an incomplete download."), v26, (uint64_t)v75);
LABEL_7:
    v18 = (id)objc_claimAutoreleasedReturnValue(v27);

    goto LABEL_8;
  }
  v31 = qword_10009E048;
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
  {
    v32 = (char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation");
    v33 = __error();
    v78 = v32;
    v79 = strerror(*v33);
    v74 = (uint64_t)"com.apple.streamingzip.incomplete_extraction";
    MOLogWrite(v31, 3, "_HasIncompleteDownloadAttribute", CFSTR("Got unknown error from getxattr when checking for %s on %s : %s"));
  }
LABEL_18:

  v34 = v85.st_mode & 0xF000;
  if (v34 != 0x4000)
  {
    if (v34 != 0x8000)
    {
      v49 = (void *)MIInstallerErrorDomain;
      v87 = MIPathArgumentErrorKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v88 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1));
      v51 = sub_100010E50((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 277, v49, 3, 0, v11, CFSTR("Unrecognized package file type 0%o"), v50, v85.st_mode);
      v18 = (id)objc_claimAutoreleasedReturnValue(v51);
      goto LABEL_3;
    }
    if (!v85.st_size)
    {
      v54 = (void *)MIInstallerErrorDomain;
      v89[0] = MIPathArgumentErrorKey;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v89[1] = CFSTR("LegacyErrorString");
      v90[0] = v23;
      v90[1] = CFSTR("PackageExtractionFailed");
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 2));
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL")));
      v77 = objc_msgSend(v25, "fileSystemRepresentation");
      v27 = sub_100010E50((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 243, v54, 3, 0, v24, CFSTR("Archive we've been requested to install at %s is 0 bytes. That can't be a valid ipa."), v55, (uint64_t)v77);
      goto LABEL_7;
    }
    v35 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    value = 0;
    v36 = objc_retainAutorelease(v35);
    v37 = open((const char *)objc_msgSend(v36, "fileSystemRepresentation"), 256);
    if (v37 < 0)
    {
      v56 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v57 = objc_msgSend(objc_retainAutorelease(v36), "fileSystemRepresentation");
        v58 = __error();
        v74 = (uint64_t)v57;
        v78 = strerror(*v58);
        MOLogWrite(v56, 3, "_IsValidZipArchiveAccordingToBom", CFSTR("Failed to open %s : %s"));
      }
      goto LABEL_45;
    }
    v38 = v37;
    v39 = read(v37, &value, 4uLL);
    if (v39 == 4)
    {
      if (value == 67324752)
      {
        close(v38);

        goto LABEL_48;
      }
      v64 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_44;
      v83 = 3;
      v84 = 4;
      v81 = 80;
      v82 = 75;
      v63 = CFSTR("File starts with 0x%02hhx%02hhx%02hhx%02hhx; expected 0x%02hhx%02hhx%02hhx%02hhx");
      v79 = (char *)(value << 8 >> 24);
      v80 = (char *)(value >> 24);
      v74 = (char)value;
      v78 = (char *)((__int16)value >> 8);
    }
    else
    {
      v59 = (char *)v39;
      v60 = qword_10009E048;
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
        goto LABEL_44;
      v61 = (char *)objc_msgSend(objc_retainAutorelease(v36), "fileSystemRepresentation");
      v62 = __error();
      v79 = v61;
      v80 = strerror(*v62);
      v74 = 4;
      v78 = v59;
      v63 = CFSTR("Failed to read %lu bytes (got %ld) from start of %s : %s");
      v64 = v60;
    }
    MOLogWrite(v64, 3, "_IsValidZipArchiveAccordingToBom", v63);
LABEL_44:
    close(v38);
LABEL_45:

    v65 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_49;
    v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL", v74, v78, v79, v80, v81, v82, v83, v84)));
    v74 = (uint64_t)objc_msgSend(v36, "fileSystemRepresentation");
    MOLogWrite(v65, 3, "-[MIInstaller _setupPackageStateWithError:]", CFSTR("Archive at %s doesn't appear to be a zip archive"));
LABEL_48:

LABEL_49:
    -[MIInstaller setPackageFormat:](self, "setPackageFormat:", 1, v74);
    goto LABEL_50;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "URLByAppendingPathComponent:isDirectory:", CFSTR("Payload"), 1));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "URLByAppendingPathComponent:isDirectory:", CFSTR("AssetData"), 1));

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v45 = objc_msgSend(v44, "isSystemAppInstall");

  if (v45
    && (v46 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager")),
        v47 = objc_msgSend(v46, "itemExistsAtURL:", v43),
        v46,
        (v47 & 1) != 0))
  {
    v48 = 4;
  }
  else
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager", v74, v78, v79));
    v53 = objc_msgSend(v52, "itemExistsAtURL:", v41);

    if (v53)
      v48 = 3;
    else
      v48 = 2;
  }
  -[MIInstaller setPackageFormat:](self, "setPackageFormat:", v48, v74);

LABEL_50:
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "stagingRootForSystemContent"));

  if (v28)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "URLByDeletingLastPathComponent"));
    -[MIInstaller setStagingRoot:](self, "setStagingRoot:", v69);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
    if (v70)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
      v29 = 1;
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "URLByAppendingPathComponent:isDirectory:", CFSTR("extracted"), 1));
      -[MIInstaller setStagingURL:](self, "setStagingURL:", v72);

      v18 = 0;
      goto LABEL_12;
    }
    v18 = 0;
  }
  else
  {
    v73 = sub_100010E50((uint64_t)"-[MIInstaller _setupPackageStateWithError:]", 285, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to get staging root path"), v67, v76);
    v18 = (id)objc_claimAutoreleasedReturnValue(v73);
  }
LABEL_9:
  if (a3)
  {
    v18 = objc_retainAutorelease(v18);
    v29 = 0;
    *a3 = v18;
  }
  else
  {
    v29 = 0;
  }
LABEL_12:

  return v29;
}

- (BOOL)_extractPackageContainedSymlink:(BOOL *)a3 withError:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  if (-[MIInstaller packageFormat](self, "packageFormat") != 1)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
    if (-[MIInstaller packageFormat](self, "packageFormat") == 2)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "pathExtension"));

      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("app"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
      v28 = v27;
      if ((v25 & 1) == 0)
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR(".app")));

        v28 = (void *)v29;
      }

      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v28, 1));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
      v53 = 0;
      v32 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v31, 0, 493, &v53);
      v33 = v53;

      if ((v32 & 1) == 0)
      {
        v34 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
          v49 = v33;
          MOLogWrite(v34, 3, "-[MIInstaller _extractPackageContainedSymlink:withError:]", CFSTR("Failed to make app parent directory %@ : %@"));

        }
      }

      v14 = (id)v30;
    }
    else
    {
      v33 = 0;
    }
    v38 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "path"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
      MOLogWrite(v38, 7, "-[MIInstaller _extractPackageContainedSymlink:withError:]", CFSTR("Moving %@ to %@"));

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL", v48, v49));
    v52 = v33;
    v41 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v40, v14, &v52);
    v11 = v52;

    if ((v41 & 1) != 0)
    {
      v21 = 1;
      goto LABEL_31;
    }
    v42 = (void *)MIInstallerErrorDomain;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "path"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
    v46 = sub_100010E50((uint64_t)"-[MIInstaller _extractPackageContainedSymlink:withError:]", 349, v42, 5, v11, &off_10008F708, CFSTR("Failed to move %@ to %@"), v45, (uint64_t)v44);
    v22 = (id)objc_claimAutoreleasedReturnValue(v46);

    goto LABEL_29;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
  v56 = 0;
  v10 = +[MIBOMWrapper extractZipArchiveAtURL:toURL:withError:](MIBOMWrapper, "extractZipArchiveAtURL:toURL:withError:", v8, v9, &v56);
  v11 = v56;

  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v55 = 0;
    v13 = objc_msgSend(v7, "removeItemAtURL:error:", v12, &v55);
    v14 = v55;

    if ((v13 & 1) == 0)
    {
      v15 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));
        v49 = v14;
        MOLogWrite(v15, 3, "-[MIInstaller _extractPackageContainedSymlink:withError:]", CFSTR("Failed to remove input archive %@ : %@"));

      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL", v48, v49));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v19 = objc_msgSend(v18, "uid");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
    v54 = v11;
    v21 = 1;
    LOBYTE(v19) = objc_msgSend(v7, "standardizeOwnershipAtURL:toUID:GID:removeACLs:setProtectionClass:foundSymlink:error:", v17, v19, objc_msgSend(v20, "gid"), 1, 1, a3, &v54);
    v22 = v54;

    if ((v19 & 1) != 0)
      goto LABEL_30;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstaller _extractPackageContainedSymlink:withError:]", CFSTR("Failed to standardize permissions on extracted archive: %@"));
LABEL_29:
    v21 = 0;
LABEL_30:
    v11 = v22;
    goto LABEL_31;
  }
  v35 = qword_10009E048;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
  {
    v21 = 0;
    if (!a4)
      goto LABEL_33;
    goto LABEL_32;
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "path"));
  MOLogWrite(v35, 3, "-[MIInstaller _extractPackageContainedSymlink:withError:]", CFSTR("Failed to extract archive at %@ to %@ : %@"));

  v21 = 0;
LABEL_31:

  if (a4)
LABEL_32:
    *a4 = objc_retainAutorelease(v11);
LABEL_33:

  return v21;
}

- (id)_manifestPathForBase:(id)a3 withIdentifier:(id)a4 patchType:(unsigned __int8 *)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  unsigned int v22;
  id v23;
  void *v24;
  id *v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v39;
  id v40;
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.deltainstallcommands."), "stringByAppendingString:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v10, 0));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.parallelpatchinfo."), "stringByAppendingString:", v9));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v12, 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.parallelpatcharchive."), "stringByAppendingString:", v9));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v14, 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v42 = 0;
  LODWORD(v14) = objc_msgSend(v16, "itemIsFileAtURL:error:", v15, &v42);
  v17 = v42;
  v39 = v11;
  if ((_DWORD)v14)
  {
    *a5 = 3;
    v18 = v15;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    {
      v19 = (void *)v13;
      MOLogWrite(qword_10009E048, 7, "-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]", CFSTR("Found parallel patch with archives file at %@"));
    }
    else
    {
      v19 = (void *)v13;
    }
    v21 = 0;
    goto LABEL_17;
  }
  v41 = 0;
  v20 = objc_msgSend(v16, "itemIsFileAtURL:error:", v11, &v41);
  v21 = v41;
  if (v20)
  {
    *a5 = 1;
    v18 = v11;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
    {
      v19 = (void *)v13;
      MOLogWrite(qword_10009E048, 7, "-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]", CFSTR("Found manifest for delta patch at %@"));
    }
    else
    {
      v19 = (void *)v13;
    }
LABEL_17:
    v24 = 0;
    v23 = v17;
    goto LABEL_18;
  }
  v40 = v17;
  v19 = (void *)v13;
  v22 = objc_msgSend(v16, "itemIsFileAtURL:error:", v13, &v40);
  v23 = v40;

  if (v22)
  {
    *a5 = 2;
    v18 = v19;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
      MOLogWrite(qword_10009E048, 7, "-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]", CFSTR("Found parallel patch file at %@"));
    goto LABEL_15;
  }
  *a5 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
  if (!objc_msgSend(v27, "isEqualToString:", NSPOSIXErrorDomain) || objc_msgSend(v21, "code") != (id)2)
    goto LABEL_32;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "domain"));
  if ((objc_msgSend(v28, "isEqualToString:", NSPOSIXErrorDomain) & 1) == 0)
  {

LABEL_32:
    goto LABEL_33;
  }
  v37 = objc_msgSend(v23, "code");

  if (v37 != (id)2)
  {
LABEL_33:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "domain"));
    if (objc_msgSend(v29, "isEqualToString:", NSPOSIXErrorDomain))
    {
      v30 = objc_msgSend(v21, "code");

      if (v30 == (id)2)
        v31 = v23;
      else
        v31 = v21;
      if (v30 == (id)2)
        v32 = v19;
      else
        v32 = v39;
    }
    else
    {

      v31 = v21;
      v32 = v39;
    }
    v33 = v31;
    v34 = v32;
    v36 = sub_100010E50((uint64_t)"-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]", 400, MIInstallerErrorDomain, 8, v33, &off_10008F730, CFSTR("Failed to determine if patch URL %@ for application %@ exists. Failing."), v35, (uint64_t)v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v18 = 0;
LABEL_18:
    v25 = a6;
    if (!a6)
      goto LABEL_21;
    goto LABEL_19;
  }
  if (!qword_10009E048)
  {
    v18 = 0;
LABEL_15:
    v24 = 0;
    goto LABEL_18;
  }
  v25 = a6;
  if (*(int *)(qword_10009E048 + 44) >= 7)
    MOLogWrite(qword_10009E048, 7, "-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:]", CFSTR("No manifest file for application %@ found in %@"));
  v18 = 0;
  v24 = 0;
  if (a6)
  {
LABEL_19:
    if (!v18)
      *v25 = objc_retainAutorelease(v24);
  }
LABEL_21:

  return v18;
}

- (id)_bundleInDirectory:(id)a3 withBundleID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSMutableSet *v9;
  void *v10;
  id v11;
  id v12;
  NSMutableSet *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  NSMutableSet *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v7 = a3;
  v8 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_100021264;
  v39 = sub_100021274;
  v40 = 0;
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = sub_100021264;
  v33 = sub_100021274;
  v34 = 0;
  v9 = objc_opt_new(NSMutableSet);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002127C;
  v23[3] = &unk_100085458;
  v27 = &v29;
  v11 = v8;
  v24 = v11;
  v28 = &v35;
  v12 = v7;
  v25 = v12;
  v13 = v9;
  v26 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v12, 1, v23));

  if (v30[5])
  {
LABEL_4:
    v15 = 0;
    if (!a5)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (v14)
  {
    objc_storeStrong(v30 + 5, v14);
    goto LABEL_4;
  }
  if (!v36[5])
  {
    if (-[NSMutableSet count](v13, "count"))
      v19 = sub_100010E50((uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]", 469, MIInstallerErrorDomain, 180, 0, 0, CFSTR("The item being installed did not contain an app with bundle ID \"%@\", but it did contain app(s) with bundle ID(s): %@"), v18, (uint64_t)v11);
    else
      v19 = sub_100010E50((uint64_t)"-[MIInstaller _bundleInDirectory:withBundleID:error:]", 471, MIInstallerErrorDomain, 6, 0, &off_10008F780, CFSTR("The item being installed did not contain any installable apps."), v18, v22);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v30[5];
    v30[5] = (id)v20;

  }
  v15 = (id)v36[5];
  if (a5)
  {
LABEL_5:
    if (!v15)
      *a5 = objc_retainAutorelease(v30[5]);
  }
LABEL_7:
  v16 = v15;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v16;
}

- (id)_identifiersToLockBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v7, "addObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "linkedParentBundleID"));

  if (v9)
    -[NSMutableArray addObject:](v7, "addObject:", v9);
  sub_10004E778(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainerLinkManager sharedInstanceForDomain:](MIContainerLinkManager, "sharedInstanceForDomain:", -[MIInstaller installationDomain](self, "installationDomain")));
  v19 = 0;
  v20 = 0;
  v11 = objc_msgSend(v10, "getLinkedParent:forChild:error:", &v20, v6, &v19);
  v12 = v20;
  v13 = v19;
  sub_10004E89C(v6);
  if (v11)
  {
    if (v12)
      -[NSMutableArray addObject:](v7, "addObject:", v12);
  }
  else
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v17 = v6;
      v18 = v13;
      MOLogWrite(qword_10009E048, 3, "-[MIInstaller _identifiersToLockBundleIdentifier:error:]", CFSTR("Failed to get parent identifier for %@: %@; continuing without locking it"));
    }

    v13 = 0;
  }
  v14 = -[NSMutableArray copy](v7, "copy", v17, v18);
  v15 = v14;
  if (a4 && !v14)
    *a4 = objc_retainAutorelease(v13);

  return v15;
}

- (void)_writeLockIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  -[MIInstaller _fireCallbackWithStatus:](self, "_fireCallbackWithStatus:", CFSTR("TakingInstallLock"));
  -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", v4);
  v5 = mach_absolute_time();
  sub_10004E780(v4);

  v6 = (mach_absolute_time() - v5) * qword_10009E050 / HIDWORD(qword_10009E050);
  -[MIInstaller setWaitingTime:](self, "setWaitingTime:", v6);
}

- (BOOL)_writeLockBundle:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller _identifiersToLockBundleIdentifier:error:](self, "_identifiersToLockBundleIdentifier:error:", v6, &v10));
  v8 = v10;

  if (v7)
  {
    -[MIInstaller _writeLockIdentifiers:](self, "_writeLockIdentifiers:", v7);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v8);
  }

  return v7 != 0;
}

- (BOOL)removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  BOOL v17;
  void *v18;
  NSMutableDictionary *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  id v39;
  void *v40;
  NSMutableDictionary *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  unsigned int v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
  id *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  NSMutableArray *v61;
  uint64_t v62;
  id obj;
  char v64;
  void *v65;
  NSMutableDictionary *v66;
  NSMutableDictionary *v67;
  char v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  NSMutableDictionary *v73;
  id v74;
  _BYTE v75[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v8 = objc_msgSend(v7, "deviceHasPersonas");

  if (!v8)
  {
    v17 = 1;
    goto LABEL_56;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleID"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaUniqueString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIUserManagement sharedInstance](MIUserManagement, "sharedInstance"));
  v12 = objc_opt_new(NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIUserManagement sharedInstance](MIUserManagement, "sharedInstance"));
  v74 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "multiPersonaSADAppBundleIDsWithError:", &v74));
  v15 = (NSMutableDictionary *)v74;

  if (!v14)
  {
    obj = 0;
    v16 = 0;
    if (!a4)
      goto LABEL_54;
    goto LABEL_7;
  }
  if ((objc_msgSend(v14, "containsObject:", v10) & 1) != 0)
  {
    obj = 0;
    v16 = 0;
    v17 = 1;
    goto LABEL_55;
  }
  v60 = v14;
  v73 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainer allContainersForAllPersonasForIdentifier:options:error:](MIContainer, "allContainersForAllPersonasForIdentifier:options:error:", v10, 2, &v73));
  v19 = v73;

  if (!v18)
  {
    v39 = sub_100010E50((uint64_t)"-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", 597, MIInstallerErrorDomain, 4, v19, 0, CFSTR("Failed to query containers for %@"), v20, (uint64_t)v10);
    v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v39);
    obj = 0;
    v16 = 0;
    goto LABEL_53;
  }
  v61 = v12;
  v62 = (uint64_t)v10;
  v56 = a4;
  v57 = v11;
  v58 = v9;
  v59 = v6;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v18;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (!v21)
  {
    v64 = 0;
    goto LABEL_42;
  }
  v22 = v21;
  v64 = 0;
  v23 = *(_QWORD *)v70;
  do
  {
    v24 = 0;
    v25 = v19;
    do
    {
      if (*(_QWORD *)v70 != v23)
        objc_enumerationMutation(obj);
      v26 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "personaUniqueString", v53, v54, v55));
      if (v27 && (objc_msgSend(v65, "isEqualToString:", v27) & 1) != 0)
      {
        v19 = v25;
        goto LABEL_37;
      }
      v68 = 0;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "containerURL"));
      v30 = objc_msgSend(v26, "containerClass");
      v67 = v25;
      v31 = objc_msgSend(v28, "dataContainer:ofContainerType:isEmpty:error:", v29, v30, &v68, &v67);
      v19 = v67;

      if ((v31 & 1) == 0)
      {
        v35 = qword_10009E048;
        if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
          goto LABEL_36;
        v54 = v62;
        v55 = (const __CFString *)v19;
        v53 = v26;
        v37 = CFSTR("Failed to check if abandoned container %@ associated with %@ has user data: %@ ");
        goto LABEL_28;
      }
      v64 |= v68 == 0;
      if (v27
        || (v32 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance")), v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "primaryPersonaString")), v34 = objc_msgSend(v65, "isEqualToString:", v33), v33, v32, !v34))
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        {
          if (v68)
            v38 = CFSTR("without");
          else
            v38 = CFSTR("with");
          v54 = v62;
          v55 = v38;
          v53 = v26;
          MOLogWrite(qword_10009E048, 5, "-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", CFSTR("Removing abandoned container %@ associated with %@ %@ user data"));
        }
        -[NSMutableArray addObject:](v61, "addObject:", v26, v53);
        goto LABEL_36;
      }
      v35 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v36 = CFSTR("without");
        if (!v68)
          v36 = CFSTR("with");
        v53 = v26;
        v54 = (uint64_t)v36;
        v37 = CFSTR("Found possibly abandoned container %@ %@ user data. Skipping deletion");
LABEL_28:
        MOLogWrite(v35, 3, "-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", v37);
      }
LABEL_36:
      v25 = v19;
LABEL_37:

      v24 = (char *)v24 + 1;
    }
    while (v22 != v24);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  }
  while (v22);
LABEL_42:

  v12 = v61;
  if (-[NSMutableArray count](v61, "count"))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v61, "objectAtIndexedSubscript:", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "personaUniqueString"));

    v6 = v59;
    v10 = (void *)v62;
    v11 = v57;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100051C7C(v62, (uint64_t)v16, (uint64_t)v65);
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", CFSTR("App %@ already has a data container with persona %@ but this installation request came for a different persona, %@. Apps may not be installed for multiple personas simultaneously. Deleting abandoned containers."));
    v41 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v62, CFSTR("bundleID"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v59 == 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v42, CFSTR("isFreshInstall"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v57, "personaTypeForPersonaUniqueString:", v65)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v43, CFSTR("requestedPersonaType"));

    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v57, "personaTypeForPersonaUniqueString:", v16)));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v44, CFSTR("erroneousPersonaType"));

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v64 & 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v45, CFSTR("hasAbandonedUserData"));

    v46 = (void *)MIInstallerErrorDomain;
    v47 = -[NSMutableDictionary copy](v41, "copy");
    sub_10000B800(v46, CFSTR("InvalidPersonaError"), CFSTR("AbandonedErroneousContainers"), CFSTR("Concurrent app install container cleanup"), v47);

    v66 = v19;
    v48 = +[MIContainer removeContainers:waitForDeletion:error:](MIContainer, "removeContainers:waitForDeletion:error:", v61, 0, &v66);
    v15 = v66;

    if (v48)
    {

      v17 = 1;
      v9 = v58;
      goto LABEL_51;
    }
    v50 = sub_100010E50((uint64_t)"-[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:]", 646, v46, 4, v15, 0, CFSTR("Failed to delete erroneous containers associated with persona %@ for %@"), v49, (uint64_t)v16);
    v51 = objc_claimAutoreleasedReturnValue(v50);

    v19 = v41;
    v15 = (NSMutableDictionary *)v51;
    v9 = v58;
    a4 = v56;
LABEL_53:

    v14 = v60;
    if (!a4)
    {
LABEL_54:
      v17 = 0;
      goto LABEL_55;
    }
LABEL_7:
    v15 = objc_retainAutorelease(v15);
    v17 = 0;
    *a4 = v15;
    goto LABEL_55;
  }
  v16 = 0;
  v17 = 1;
  v15 = v19;
  v9 = v58;
  v6 = v59;
  v10 = (void *)v62;
  v11 = v57;
LABEL_51:
  v14 = v60;
LABEL_55:

LABEL_56:
  return v17;
}

- (id)_discoverInstallableWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  unsigned int v22;
  id v23;
  void *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  void *v29;
  id *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  unsigned __int8 v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  MIInstallableBundlePatch *v43;
  unsigned int v44;
  void *v45;
  unsigned __int8 v46;
  unint64_t v47;
  void *v48;
  MIInstallableParallelPlaceholder *v49;
  MIInstallableBundlePatch *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  unsigned __int8 v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  void *v64;
  unsigned int v65;
  const __CFString *v66;
  void *v67;
  unint64_t v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  id v72;
  void *v73;
  unsigned int v74;
  const __CFString *v75;
  unsigned int v76;
  const __CFString *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  unsigned int v92;
  void *v93;
  void *v94;
  MIInstallableBundlePatch *v95;
  unsigned int v96;
  unsigned int v97;
  void *v98;
  void *v99;
  void *v100;
  MIInstallableBundle *v101;
  void *v102;
  uint64_t v103;
  MIInstallableParallelPlaceholder *v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  unsigned __int8 v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));

  if (v6)
  {
    switch(-[MIInstaller packageFormat](self, "packageFormat"))
    {
      case 1u:
      case 3u:
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
        v9 = v8;
        v10 = CFSTR("Payload");
        goto LABEL_10;
      case 2u:
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
        goto LABEL_11;
      case 4u:
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
        v9 = v8;
        v10 = CFSTR("AssetData");
LABEL_10:
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v10, 1));

LABEL_11:
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
        v20 = (unint64_t)objc_msgSend(v19, "installTargetType");

        v117[0] = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller _bundleInDirectory:withBundleID:error:](self, "_bundleInDirectory:withBundleID:error:", v17, v6, v117));
        v21 = v117[0];
        v16 = v21;
        if (!v18)
          goto LABEL_28;
        v116 = v21;
        v22 = -[MIInstaller _writeLockBundle:error:](self, "_writeLockBundle:error:", v18, &v116);
        v23 = v116;

        if (!v22)
          goto LABEL_27;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
        v115 = v23;
        v25 = objc_msgSend(v24, "resolvePersonaWithError:", &v115);
        v16 = v115;

        if (!v25)
          goto LABEL_28;
        v26 = objc_msgSend(v18, "bundleType");
        v27 = v26;
        if (v26 <= 4 && ((1 << v26) & 0x16) != 0)
        {
          v28 = -[MIInstaller installationDomain](self, "installationDomain");
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
          if (v28 == 3)
          {
            v114 = v16;
            v30 = &v114;
            v31 = objc_claimAutoreleasedReturnValue(+[MIBundleContainer privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:", v29, 0, 0, &v114));
          }
          else
          {
            v113 = v16;
            v30 = &v113;
            v31 = objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerWithIdentifier:createIfNeeded:created:error:](MIBundleContainer, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v29, 0, 0, &v113));
          }
          v32 = (void *)v31;
          v33 = *v30;

          if (v32)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundle"));

            if (!v34)
            {
              v35 = qword_10009E048;
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
                MOLogWrite(v35, 3, "-[MIInstaller _discoverInstallableWithError:]", CFSTR("Found existing bundle container for %@ but it didn't contain a bundle. That's odd, but we'll remove it to allow a fresh install."));

              }
              v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", v87));
              v112 = v33;
              v36 = objc_msgSend(v32, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v112);
              v37 = v112;

              if ((v36 & 1) != 0)
              {
                v38 = (void *)v103;
              }
              else
              {
                v38 = (void *)v103;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                {
                  v87 = v103;
                  v88 = v37;
                  MOLogWrite(qword_10009E048, 3, "-[MIInstaller _discoverInstallableWithError:]", CFSTR("Failed to destroy zombie bundle container for %@ : %@"));
                }

                v37 = 0;
              }

              v32 = 0;
              v33 = v37;
            }
          }
          if (_os_feature_enabled_impl("containermanagerd", "multipersona_reconciliation_on_delete"))
          {
            v111 = v33;
            v44 = -[MIInstaller removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:](self, "removeAndReportAbandonedContainersWithIncorrectPersonaForBundleContainer:withError:", v32, &v111);
            v16 = v111;

            v33 = v16;
            if (!v44)
            {
LABEL_69:

              if (a3)
                goto LABEL_29;
              goto LABEL_70;
            }
          }
          if (v32)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundle"));
            v46 = objc_msgSend(v45, "isPlaceholder");

            if ((v46 & 1) == 0 && v20 == 2)
            {
              v104 = [MIInstallableParallelPlaceholder alloc];
              v99 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
              v96 = -[MIInstaller packageFormat](self, "packageFormat");
              v93 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
              v47 = -[MIInstaller installationDomain](self, "installationDomain");
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
              v110 = v33;
              v49 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:](v104, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:", v18, v99, v96, v93, v47, v48, v32, -[MIInstaller installOperationType](self, "installOperationType"), &v110);
              v16 = v110;

              v50 = (MIInstallableBundlePatch *)v49;
              if (!v49)
                goto LABEL_69;
LABEL_74:

              v43 = v50;
              goto LABEL_71;
            }
            if (v20 == 3)
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundle"));
              v56 = objc_msgSend(v55, "isPlaceholder");

              if ((v56 & 1) == 0)
              {
                v57 = qword_10009E048;
                if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
                {
                  v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", v87, v88));
                  MOLogWrite(v57, 5, "-[MIInstaller _discoverInstallableWithError:]", CFSTR("Downgrading %@ to a placeholder."));

                }
              }
            }
          }
          else if (v20 == 3)
          {
            v51 = (void *)MIInstallerErrorDomain;
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            v54 = sub_100010E50((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 760, v51, 26, 0, 0, CFSTR("Application %@ not found to downgrade to placeholder."), v53, (uint64_t)v52);
            v16 = (id)objc_claimAutoreleasedReturnValue(v54);

            goto LABEL_69;
          }
          v105 = v32;
          v109 = 0;
          v100 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL", v87));
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
          v108 = v33;
          v59 = objc_claimAutoreleasedReturnValue(-[MIInstaller _manifestPathForBase:withIdentifier:patchType:error:](self, "_manifestPathForBase:withIdentifier:patchType:error:", v100, v58, &v109, &v108));
          v16 = v108;

          v60 = (void *)v59;
          if (v59)
          {
            if (!v105)
            {
              v73 = (void *)MIInstallerErrorDomain;
              v74 = v109 - 1;
              if (v74 > 2)
                v75 = CFSTR("Invalid");
              else
                v75 = *(&off_1000854E8 + (char)v74);
              v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
              v80 = sub_100010E50((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 771, v73, 8, 0, &off_10008F7A8, CFSTR("%@ patch submitted for application %@ that's not installed. Failing."), v79, (uint64_t)v75);
              goto LABEL_66;
            }
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "bundle"));
            v62 = objc_msgSend(v61, "isPlaceholder");

            if (v62)
            {
              v64 = (void *)MIInstallerErrorDomain;
              v65 = v109 - 1;
              if (v65 > 2)
                v66 = CFSTR("Invalid");
              else
                v66 = *(&off_1000854E8 + (char)v65);
              v78 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
              v80 = sub_100010E50((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 774, v64, 8, 0, &off_10008F7D0, CFSTR("%@ patch submitted for application %@ that's just a placeholder. Failing."), v81, (uint64_t)v66);
LABEL_66:
              v82 = objc_claimAutoreleasedReturnValue(v80);

              v16 = (id)v78;
              v32 = v105;
LABEL_67:

              v16 = (id)v82;
LABEL_68:

              goto LABEL_69;
            }
            if ((v20 & 0xFFFFFFFFFFFFFFFELL) == 2)
            {
              v76 = v109 - 1;
              v32 = v105;
              if (v76 > 2)
                v77 = CFSTR("Invalid");
              else
                v77 = *(&off_1000854E8 + (char)v76);
              v86 = sub_100010E50((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 777, MIInstallerErrorDomain, 25, v16, 0, CFSTR("%@ patch supplied but install target type was placeholder or downgrade. This doesn't make sense."), v63, (uint64_t)v77);
              v82 = objc_claimAutoreleasedReturnValue(v86);
              goto LABEL_67;
            }
            v95 = [MIInstallableBundlePatch alloc];
            v98 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
            v92 = -[MIInstaller packageFormat](self, "packageFormat");
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
            v91 = -[MIInstaller installationDomain](self, "installationDomain");
            v102 = v60;
            v85 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
            v107 = v16;
            LOBYTE(v90) = v109;
            v32 = v105;
            v50 = -[MIInstallableBundlePatch initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:](v95, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:manifestURL:existingBundleContainer:patchType:operationType:error:", v18, v98, v92, v84, v91, v85, v102, v105, v90, -[MIInstaller installOperationType](self, "installOperationType"), &v107);
            v72 = v107;

            v60 = v102;
            v16 = v72;
            if (!v50)
              goto LABEL_68;
          }
          else
          {
            v32 = v105;
            if (v16)
              goto LABEL_68;
            v101 = [MIInstallableBundle alloc];
            v94 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingURL](self, "stagingURL"));
            v97 = -[MIInstaller packageFormat](self, "packageFormat");
            v67 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
            v68 = -[MIInstaller installationDomain](self, "installationDomain");
            v69 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
            v70 = -[MIInstaller installOperationType](self, "installOperationType");
            v106 = 0;
            v71 = v68;
            v60 = 0;
            v50 = -[MIInstallableBundle initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:](v101, "initWithBundle:inStagingRoot:packageFormat:identity:domain:installOptions:existingBundleContainer:operationType:error:", v18, v94, v97, v67, v71, v69, v105, v70, &v106);
            v16 = v106;

            v32 = v105;
            v72 = v16;
            if (!v50)
              goto LABEL_68;
          }

          v16 = v72;
          goto LABEL_74;
        }
        v39 = (void *)MIInstallerErrorDomain;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundleURL"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "path"));
        v42 = sub_100010E50((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", 819, v39, 4, 0, 0, CFSTR("Got unexpected bundle type %d at %@"), v41, v27);
        v23 = (id)objc_claimAutoreleasedReturnValue(v42);

LABEL_27:
        v16 = v23;
LABEL_28:
        if (a3)
          goto LABEL_29;
        goto LABEL_70;
      default:
        v14 = (void *)MIInstallerErrorDomain;
        v87 = -[MIInstaller packageFormat](self, "packageFormat");
        v12 = CFSTR("Unknown package format: %hhu");
        v13 = 689;
        v11 = v14;
        goto LABEL_6;
    }
  }
  v11 = (void *)MIInstallerErrorDomain;
  v12 = CFSTR("Caller did not supply bundle identifer in install options");
  v13 = 672;
LABEL_6:
  v15 = sub_100010E50((uint64_t)"-[MIInstaller _discoverInstallableWithError:]", v13, v11, 4, 0, 0, v12, v7, v87);
  v16 = (id)objc_claimAutoreleasedReturnValue(v15);
  v17 = 0;
  v18 = 0;
  if (!a3)
  {
LABEL_70:
    v43 = 0;
    goto LABEL_71;
  }
LABEL_29:
  v16 = objc_retainAutorelease(v16);
  v43 = 0;
  *a3 = v16;
LABEL_71:

  return v43;
}

- (BOOL)_installProvisioningProfilesFromUserOptionsWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v25;
  MIInstaller *v26;
  id *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "provisioningProfiles"));
  if (v6)
  {
    v26 = self;
    v27 = a3;
    v7 = objc_msgSend(v5, "provisioningProfileInstallFailureIsFatal");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          objc_opt_class(NSData);
          if ((objc_opt_isKindOfClass(v13) & 1) != 0)
          {
            v14 = MIInstallProfileWithData(v13);
            if ((MIIsFatalMISProfileInstallationError(v14, v7) & 1) != 0)
            {
              v16 = (void *)MIInstallerErrorDomain;
              v33[0] = CFSTR("LegacyErrorString");
              v33[1] = MILibMISErrorNumberKey;
              v34[0] = CFSTR("ApplicationVerificationFailed");
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v14));
              v34[1] = v17;
              v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](v26, "installURL"));
              v20 = MIErrorStringForMISError(v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue(v20);
              v22 = sub_100010E50((uint64_t)"-[MIInstaller _installProvisioningProfilesFromUserOptionsWithError:]", 857, v16, 13, 0, v18, CFSTR("Failed to install local provisioning profile from user options for %@ : 0x%08x (%@)"), v21, (uint64_t)v19);
              v23 = (id)objc_claimAutoreleasedReturnValue(v22);

              if (v27)
              {
                v23 = objc_retainAutorelease(v23);
                v15 = 0;
                *v27 = v23;
              }
              else
              {
                v15 = 0;
              }
              goto LABEL_20;
            }
          }
          else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installProvisioningProfilesFromUserOptionsWithError:]", CFSTR("Encountered non-NSData object (%@) in provisioning profile array, skipping"));
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v10)
          continue;
        break;
      }
    }

    v23 = 0;
    v15 = 1;
LABEL_20:
    v6 = v28;
  }
  else
  {
    v23 = 0;
    v15 = 1;
  }

  return v15;
}

- (BOOL)_installProvisioningProfilesAtStagingRootWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[6];
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100021264;
  v21 = sub_100021274;
  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("ProvisioningProfiles"), 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v8 = objc_msgSend(v7, "provisioningProfileInstallFailureIsFatal");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022EFC;
  v15[3] = &unk_100085480;
  v16 = v8;
  v15[4] = self;
  v15[5] = &v17;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v6, 1, v15));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    if ((objc_msgSend(v11, "isEqualToString:", NSPOSIXErrorDomain) & 1) != 0)
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == (id)2)
        goto LABEL_9;
    }
    else
    {

    }
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installProvisioningProfilesAtStagingRootWithError:]", CFSTR("Error while enumerating provision profiles directory: %@"));
  }
LABEL_9:
  v13 = (void *)v18[5];
  if (a3 && v13)
    *a3 = objc_retainAutorelease(v13);

  _Block_object_dispose(&v17, 8);
  return v13 == 0;
}

- (BOOL)_installInstallable:(id)a3 containingSymlink:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  id *v45;
  unsigned __int8 v46;
  NSObject *v47;
  int v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  id *v53;
  unsigned __int8 v54;
  NSObject *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  int v62;
  int v63;
  void *v64;
  id *v65;
  int v66;
  int v67;
  void *v68;
  id *v69;
  unsigned __int8 v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  int v75;
  id *v76;
  unsigned __int8 v77;
  void *v78;
  id *v79;
  int v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  id v86;
  char v87;
  LSRecordPromise *v89;
  LSRecordPromise *recordPromise;
  NSArray *v91;
  NSArray *receipt;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  unint64_t v98;
  uint64_t v100;
  void *v101;
  _QWORD block[4];
  id v103;
  uint64_t *v104;
  uint8_t *v105;
  uint8_t buf[8];
  uint8_t *v107;
  uint64_t v108;
  char v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id obj;
  _QWORD v119[5];
  uint64_t v120;
  id *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;

  v5 = a4;
  v7 = a3;
  v120 = 0;
  v121 = (id *)&v120;
  v122 = 0x3032000000;
  v123 = sub_100021264;
  v124 = sub_100021274;
  v125 = 0;
  v98 = -[MIInstaller installOperationType](self, "installOperationType");
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_100023E94;
  v119[3] = &unk_1000854A8;
  v119[4] = self;
  objc_msgSend(v7, "setProgressBlock:", v119);
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
  {
    v95 = v7;
    MOLogWrite(qword_10009E048, 5, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Installing %@"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle", v95));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));

  objc_opt_class(MIInstallableBundle);
  if ((objc_opt_isKindOfClass(v7) & 1) != 0)
  {
    v13 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));

    if (v14 && v98 == 1)
    {
      v15 = 13;
LABEL_34:

      v16 = v15;
      goto LABEL_35;
    }
    objc_opt_class(MIInstallableBundlePatch);
    if ((objc_opt_isKindOfClass(v13) & 1) != 0)
    {
      v15 = 1;
      goto LABEL_34;
    }
    objc_opt_class(MIInstallableParallelPlaceholder);
    if ((objc_opt_isKindOfClass(v13) & 1) != 0)
    {
      v15 = 2;
      goto LABEL_34;
    }
    if (objc_msgSend(v13, "isPlaceholderInstall"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bundle"));
        v20 = objc_msgSend(v19, "isPlaceholder");

        if ((v20 & 1) != 0)
        {
          v15 = 3;
          goto LABEL_34;
        }
      }
    }
    if ((objc_msgSend(v13, "isPlaceholderInstall") & 1) != 0)
    {
      v15 = 4;
      goto LABEL_34;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bundle"));
        v25 = objc_msgSend(v24, "isPlaceholder");

        if ((v25 & 1) != 0)
          goto LABEL_22;
      }
      else
      {

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundle"));
        if (objc_msgSend(v28, "isPlaceholder"))
        {

        }
        else
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
          v30 = objc_msgSend(v29, "installTargetType");

          if (v30 == (id)3)
          {
            v15 = 6;
            goto LABEL_34;
          }
        }
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "existingBundleContainer"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bundle"));
        v34 = objc_msgSend(v33, "isPlaceholder");

        if (v34)
          v15 = 8;
        else
          v15 = 7;
      }
      else
      {
        v15 = 8;
      }
      goto LABEL_34;
    }
LABEL_22:
    v15 = 5;
    goto LABEL_34;
  }
  v16 = 0;
LABEL_35:
  v100 = v16;
  _MILogTransactionStep(v16, 1, 1, v9, v101, 0, v11, v12, v96);
  v35 = mach_absolute_time();
  if (v5)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bundleURL"));
    v39 = v121;
    obj = v121[5];
    v40 = objc_msgSend(v36, "validateSymlinksInURLDoNotEscapeURL:error:", v38, &obj);
    objc_storeStrong(v39 + 5, obj);

    if ((v40 & 1) == 0)
    {
      v57 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bundleURL"));
        v97 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "path"));
        MOLogWrite(v57, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Discovered invalid symlinks in %@"));

      }
      v49 = 0;
      goto LABEL_119;
    }
  }
  v43 = objc_autoreleasePoolPush();
  if (qword_10009DF78 != -1)
    dispatch_once(&qword_10009DF78, &stru_1000854C8);
  v44 = (id)qword_10009DF70;
  if (os_signpost_enabled(v44))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PreflightAndPatch", "Start preflighting and patching", buf, 2u);
  }

  v45 = v121 + 5;
  v117 = v121[5];
  v46 = objc_msgSend(v7, "performPreflightWithError:", &v117);
  objc_storeStrong(v45, v117);
  if ((v46 & 1) != 0)
  {
    -[MIInstaller setPreflightAndPatchTime:](self, "setPreflightAndPatchTime:", (mach_absolute_time() - v35) * qword_10009E050 / HIDWORD(qword_10009E050));
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v47 = (id)qword_10009DF70;
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PreflightAndPatch", "End preflighting and patching [succeeded]", buf, 2u);
    }
    v48 = 0;
  }
  else
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Preflight stage failed"));
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v47 = (id)qword_10009DF70;
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PreflightAndPatch", "End preflighting and patching [failed]", buf, 2u);
    }
    v48 = 10;
  }

  objc_autoreleasePoolPop(v43);
  v49 = 0;
  if (v48 != 10)
  {
    v50 = mach_absolute_time();
    v51 = objc_autoreleasePoolPush();
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v52 = (id)qword_10009DF70;
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Verification", "Start code sign verification", buf, 2u);
    }

    v53 = v121 + 5;
    v116 = v121[5];
    v54 = objc_msgSend(v7, "performVerificationWithError:", &v116);
    objc_storeStrong(v53, v116);
    if ((v54 & 1) != 0)
    {
      -[MIInstaller setVerificationTime:](self, "setVerificationTime:", (mach_absolute_time() - v50) * qword_10009E050 / HIDWORD(qword_10009E050));
      if (qword_10009DF78 != -1)
        dispatch_once(&qword_10009DF78, &stru_1000854C8);
      v55 = (id)qword_10009DF70;
      if (os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Verification", "End code sign verification [succeeded]", buf, 2u);
      }
      v56 = 0;
    }
    else
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Verification stage failed"));
      if (qword_10009DF78 != -1)
        dispatch_once(&qword_10009DF78, &stru_1000854C8);
      v55 = (id)qword_10009DF70;
      if (os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Verification", "End code sign verification [failed]", buf, 2u);
      }
      v56 = 10;
    }

    objc_autoreleasePoolPop(v51);
    v49 = 0;
    if (v56 != 10)
    {
      v60 = objc_autoreleasePoolPush();
      v61 = v121 + 5;
      v115 = v121[5];
      v62 = objc_msgSend(v7, "performInstallationWithError:", &v115);
      objc_storeStrong(v61, v115);
      if ((v62 & 1) != 0)
      {
        v63 = 0;
      }
      else
      {
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Installation stage failed"));
        v63 = 10;
      }
      objc_autoreleasePoolPop(v60);
      v49 = 0;
      if (v63 != 10)
      {
        v64 = objc_autoreleasePoolPush();
        v65 = v121 + 5;
        v114 = v121[5];
        v66 = objc_msgSend(v7, "postFlightInstallationWithError:", &v114);
        objc_storeStrong(v65, v114);
        if ((v66 & 1) != 0)
        {
          v67 = 0;
        }
        else
        {
          if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Postflight stage failed"));
          v67 = 10;
        }
        objc_autoreleasePoolPop(v64);
        v49 = 0;
        if (v67 != 10)
        {
          v68 = objc_autoreleasePoolPush();
          if (v98 == 1)
          {
            v69 = v121;
            v112 = v121[5];
            v113 = 0;
            v70 = objc_msgSend(v7, "stageBackgroundUpdate:withError:", &v113, &v112);
            v71 = v113;
            v72 = v113;
            objc_storeStrong(v69 + 5, v112);
            if ((v70 & 1) != 0)
            {
              objc_storeStrong((id *)&self->_stagedJournalEntryUniqueID, v71);
              v73 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

              if (v73)
              {
                v74 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
                sub_10004E89C(v74);

                -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0);
              }
              v75 = 39;
            }
            else
            {
              v75 = 10;
            }

          }
          else
          {
            v76 = v121 + 5;
            v111 = v121[5];
            v77 = objc_msgSend(v7, "finalizeInstallationWithError:", &v111);
            objc_storeStrong(v76, v111);
            if ((v77 & 1) != 0)
            {
              v75 = 0;
            }
            else
            {
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
                MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Finalize stage failed"));
              v75 = 10;
            }
          }
          objc_autoreleasePoolPop(v68);
          v49 = 0;
          if (v75 != 39)
          {
            if (v75 == 10)
              goto LABEL_119;
            v78 = objc_autoreleasePoolPush();
            v79 = v121;
            v110 = v121[5];
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "launchServicesBundleRecordsWithError:", &v110));
            objc_storeStrong(v79 + 5, v110);
            if (v49)
            {
              v80 = 0;
            }
            else
            {
              if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
              {
                v97 = v121[5];
                MOLogWrite(qword_10009E048, 3, "-[MIInstaller _installInstallable:containingSymlink:error:]", CFSTR("Failed to get LaunchServices bundle records: %@"));
              }
              v80 = 10;
            }
            objc_autoreleasePoolPop(v78);
            if (v80 == 10)
              goto LABEL_119;
            v81 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

            if (v81)
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
              sub_10004E89C(v82);

              -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0);
            }
            v83 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client", v97));
            objc_msgSend(v83, "releaseTerminationAssertion");

            -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1);
            *(_QWORD *)buf = 0;
            v107 = buf;
            v108 = 0x2020000000;
            v109 = 0;
            v84 = sub_10000B610();
            v85 = objc_claimAutoreleasedReturnValue(v84);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100023EA4;
            block[3] = &unk_100084C80;
            v86 = v7;
            v103 = v86;
            v104 = &v120;
            v105 = buf;
            dispatch_sync(v85, block);

            if (v107[24])
            {

              _Block_object_dispose(buf, 8);
              goto LABEL_119;
            }
            v89 = (LSRecordPromise *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "recordPromise"));
            recordPromise = self->_recordPromise;
            self->_recordPromise = v89;

            _Block_object_dispose(buf, 8);
          }
          if (objc_msgSend(v49, "count"))
            v91 = v49;
          else
            v91 = (NSArray *)&__NSArray0__struct;
          receipt = self->_receipt;
          self->_receipt = v91;

          v87 = 1;
          _MILogTransactionStep(v100, 2, 1, v9, v101, 0, v93, v94, (uint64_t)v97);
          goto LABEL_124;
        }
      }
    }
  }
LABEL_119:
  if (v9 && v100)
    _MILogTransactionStep(v100, 2, 0, v9, v101, 0, v41, v42, (uint64_t)v97);
  v87 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v121[5]);
LABEL_124:

  _Block_object_dispose(&v120, 8);
  return v87 & 1;
}

- (void)_logOperationCompletionWithStartTime:(unint64_t)a3 distributorID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  unint64_t v11;
  id v12;

  v12 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));

  mach_absolute_time();
  if ((id)-[MIInstaller installOperationType](self, "installOperationType") == (id)1)
  {
    v8 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "installTypeSummaryString"));
      -[MIInstaller stagingTime](self, "stagingTime");
      -[MIInstaller waitingTime](self, "waitingTime");
      -[MIInstaller preflightAndPatchTime](self, "preflightAndPatchTime");
      -[MIInstaller verificationTime](self, "verificationTime");
      v10 = CFSTR("Staging Update Phase Successful for (%@:%@) [Distributor: %@]; Staging: %.2fs; Waiting: %.2fs; Preflight/Patch: %.2fs, Verifying: %.2fs");
LABEL_12:
      MOLogWrite(v8, 5, "-[MIInstaller _logOperationCompletionWithStartTime:distributorID:]", v10);

    }
  }
  else
  {
    v11 = -[MIInstaller installOperationType](self, "installOperationType");
    v8 = qword_10009E048;
    if (v11 == 2)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "installTypeSummaryString"));
        v10 = CFSTR("Applying Staged Update Successful for (%@:%@) [Distributor: %@]; Overall: %.2fs");
        goto LABEL_12;
      }
    }
    else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "installTypeSummaryString"));
      -[MIInstaller stagingTime](self, "stagingTime");
      -[MIInstaller waitingTime](self, "waitingTime");
      -[MIInstaller preflightAndPatchTime](self, "preflightAndPatchTime");
      -[MIInstaller verificationTime](self, "verificationTime");
      v10 = CFSTR("Install Successful for (%@:%@) [Distributor: %@]; Staging: %.2fs; Waiting: %.2fs; Preflight/Patch: %.2fs, Verifying: %.2fs; Overall: %.2fs");
      goto LABEL_12;
    }
  }

}

- (BOOL)performInstallationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  unsigned __int8 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unsigned __int8 v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  char v45;
  unsigned int v47;
  unsigned int v48;
  id v49;
  unsigned int v50;
  void *v51;
  void *v52;
  id *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  unsigned __int8 v62;
  uint8_t buf[4];
  const char *v64;

  v62 = 0;
  v5 = mach_absolute_time();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "installationBlacklist"));

  v7 = -[MIInstaller installOperationType](self, "installOperationType");
  if (v7 == 1)
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v8 = qword_10009DF70;
    if (os_signpost_enabled((os_log_t)qword_10009DF70))
    {
      *(_WORD *)buf = 0;
      v9 = "StageUpdate";
      v10 = "Start update staging";
LABEL_10:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v9, v10, buf, 2u);
    }
  }
  else
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v8 = qword_10009DF70;
    if (os_signpost_enabled((os_log_t)qword_10009DF70))
    {
      *(_WORD *)buf = 0;
      v9 = "Install";
      v10 = "Start installation";
      goto LABEL_10;
    }
  }
  if (qword_10009DF78 != -1)
    dispatch_once(&qword_10009DF78, &stru_1000854C8);
  v11 = qword_10009DF70;
  if (os_signpost_enabled((os_log_t)qword_10009DF70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Stage", "Start staging", buf, 2u);
  }
  v61 = 0;
  v12 = -[MIInstaller _takeOwnershipOfInstallableContainingSymlink:error:](self, "_takeOwnershipOfInstallableContainingSymlink:error:", &v62, &v61);
  v13 = v61;
  if ((v12 & 1) == 0)
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v25 = qword_10009DF70;
    if (!os_signpost_enabled((os_log_t)qword_10009DF70))
      goto LABEL_43;
    *(_WORD *)buf = 0;
    goto LABEL_42;
  }
  v14 = qword_10009E048;
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller installURL](self, "installURL"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
    MOLogWrite(v14, 7, "-[MIInstaller performInstallationWithError:]", CFSTR("self.installURL after ownership change = %@"));

  }
  v60 = v13;
  v16 = -[MIInstaller _setupPackageStateWithError:](self, "_setupPackageStateWithError:", &v60, v52);
  v17 = v60;

  if ((v16 & 1) == 0)
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v26 = qword_10009DF70;
    if (os_signpost_enabled((os_log_t)qword_10009DF70))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stage", "End staging [failed]", buf, 2u);
    }
    v20 = 0;
    goto LABEL_37;
  }
  -[MIInstaller _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("CreatingStagingDirectory"), 5);
  -[MIInstaller _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("ExtractingPackage"), 15);
  v59 = v17;
  v18 = -[MIInstaller _extractPackageContainedSymlink:withError:](self, "_extractPackageContainedSymlink:withError:", &v62, &v59);
  v13 = v59;

  if ((v18 & 1) == 0)
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v25 = qword_10009DF70;
    if (!os_signpost_enabled((os_log_t)qword_10009DF70))
      goto LABEL_43;
    *(_WORD *)buf = 0;
LABEL_42:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stage", "End staging [failed]", buf, 2u);
LABEL_43:
    v20 = 0;
    v22 = 0;
    v27 = 0;
    goto LABEL_44;
  }
  -[MIInstaller _fireCallbackWithStatus:percentComplete:](self, "_fireCallbackWithStatus:percentComplete:", CFSTR("InspectingPackage"), 20);
  if (qword_10009DF78 != -1)
    dispatch_once(&qword_10009DF78, &stru_1000854C8);
  v19 = qword_10009DF70;
  if (os_signpost_enabled((os_log_t)qword_10009DF70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Stage", "End staging [succeeded]", buf, 2u);
  }
  -[MIInstaller setStagingTime:](self, "setStagingTime:", (mach_absolute_time() - v5) * qword_10009E050 / HIDWORD(qword_10009E050));
  v58 = v13;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller _discoverInstallableWithError:](self, "_discoverInstallableWithError:", &v58));
  v17 = v58;

  if (!v20)
  {
LABEL_37:
    v22 = 0;
    v27 = 0;
    v13 = v17;
    goto LABEL_44;
  }
  v53 = a3;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));

  if (objc_msgSend(v54, "intersectsSet:", v22))
  {
    v24 = sub_100010E50((uint64_t)"-[MIInstaller performInstallationWithError:]", 1185, MIInstallerErrorDomain, 7, 0, &off_10008F7F8, CFSTR("Found blacklisted app in identifiers to be installed: %@"), v23, (uint64_t)v22);
    v13 = (id)objc_claimAutoreleasedReturnValue(v24);

LABEL_80:
    v27 = 0;
    goto LABEL_81;
  }
  v57 = v17;
  v47 = -[MIInstaller _installProvisioningProfilesAtStagingRootWithError:](self, "_installProvisioningProfilesAtStagingRootWithError:", &v57);
  v13 = v57;

  if (!v47)
    goto LABEL_80;
  v56 = v13;
  v48 = -[MIInstaller _installProvisioningProfilesFromUserOptionsWithError:](self, "_installProvisioningProfilesFromUserOptionsWithError:", &v56);
  v49 = v56;

  if (!v48)
  {
    v27 = 0;
    v13 = v49;
    goto LABEL_81;
  }
  v55 = v49;
  v50 = -[MIInstaller _installInstallable:containingSymlink:error:](self, "_installInstallable:containingSymlink:error:", v20, v62, &v55);
  v13 = v55;

  if (!v50)
    goto LABEL_80;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "installedDistributorID"));
  -[MIInstaller _logOperationCompletionWithStartTime:distributorID:](self, "_logOperationCompletionWithStartTime:distributorID:", v5, v51);

  v27 = 1;
LABEL_81:
  a3 = v53;
LABEL_44:
  if (v7 == 1)
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v28 = qword_10009DF70;
    if (os_signpost_enabled((os_log_t)qword_10009DF70))
    {
      v29 = "failed";
      if (v27)
        v29 = "succeeded";
      *(_DWORD *)buf = 136315138;
      v64 = v29;
      v30 = "StageUpdate";
      v31 = "End staging update [%s]";
LABEL_57:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v30, v31, buf, 0xCu);
    }
  }
  else
  {
    if (qword_10009DF78 != -1)
      dispatch_once(&qword_10009DF78, &stru_1000854C8);
    v28 = qword_10009DF70;
    if (os_signpost_enabled((os_log_t)qword_10009DF70))
    {
      v32 = "failed";
      if (v27)
        v32 = "succeeded";
      *(_DWORD *)buf = 136315138;
      v64 = v32;
      v30 = "Install";
      v31 = "End installation [%s]";
      goto LABEL_57;
    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

  if (v33)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
    sub_10004E89C(v34);

    -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0);
  }
  v35 = objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  if (v35)
  {
    v36 = (void *)v35;
    v37 = -[MIInstaller terminationAssertionReleased](self, "terminationAssertionReleased");

    if ((v37 & 1) == 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
      objc_msgSend(v38, "releaseTerminationAssertion");

      -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1);
    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));

  if (v39)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller stagingRoot](self, "stagingRoot"));
    objc_msgSend(v41, "removeItemAtURL:error:", v42, 0);

  }
  if (v13)
    v43 = 1;
  else
    v43 = v27;
  if ((v43 & 1) == 0)
  {
    v44 = sub_100010E50((uint64_t)"-[MIInstaller performInstallationWithError:]", 1232, MIInstallerErrorDomain, 1, 0, 0, CFSTR("No error was specified but the operation failed."), v40, (uint64_t)v52);
    v13 = (id)objc_claimAutoreleasedReturnValue(v44);
  }
  if (a3)
    v45 = v27;
  else
    v45 = 1;
  if ((v45 & 1) == 0)
    *a3 = objc_retainAutorelease(v13);

  return v27;
}

- (BOOL)_applyStagedUpdateForUUID:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id *v15;
  void *v16;
  id *v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  LSRecordPromise *v25;
  LSRecordPromise *recordPromise;
  NSArray *v27;
  NSArray *receipt;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *context;
  uint64_t v47;
  NSArray *v49;
  _QWORD *v50;
  id v51;
  _QWORD block[4];
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  id v60;
  id obj;
  _QWORD v62[5];
  uint64_t v63;
  id *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint8_t buf[4];
  const char *v70;

  v5 = a3;
  v63 = 0;
  v64 = (id *)&v63;
  v65 = 0x3032000000;
  v66 = sub_100021264;
  v67 = sub_100021274;
  v68 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller identity](self, "identity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_100025178;
  v62[3] = &unk_1000854A8;
  v62[4] = self;
  v50 = objc_retainBlock(v62);
  v47 = mach_absolute_time();
  if (!v5)
  {
    v29 = sub_100010E50((uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]", 1259, MIInstallerErrorDomain, 217, 0, 0, CFSTR("Finalizing staged install operation is missing staged bundle UUID"), v8, v44);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    v10 = 0;
    v49 = 0;
    v16 = 0;
    v11 = 0;
LABEL_19:
    v14 = 0;
LABEL_20:
    v32 = 0;
    receipt = (NSArray *)v64[5];
    v64[5] = (id)v30;
LABEL_21:

    goto LABEL_24;
  }
  if (qword_10009DF78 != -1)
    dispatch_once(&qword_10009DF78, &stru_1000854C8);
  v9 = qword_10009DF70;
  if (os_signpost_enabled((os_log_t)qword_10009DF70))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InstallStagedUpdate", "Start Applying Staged Update", buf, 2u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personaUniqueString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIJournal sharedInstance](MIJournal, "sharedInstance"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "journalEntryForUniqueIdentifier:", v5));
  if (!v14)
  {
    v31 = sub_100010E50((uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]", 1269, MIInstallerErrorDomain, 218, 0, 0, CFSTR("Failed to find matching journal entry for making staged install live operation: %@"), v13, (uint64_t)v5);
    v30 = objc_claimAutoreleasedReturnValue(v31);
    v49 = 0;
    v16 = 0;
    goto LABEL_19;
  }
  if (qword_10009E048 && *(int *)(qword_10009E048 + 44) >= 7)
  {
    v44 = (uint64_t)v14;
    MOLogWrite(qword_10009E048, 7, "-[MIInstaller _applyStagedUpdateForUUID:withError:]", CFSTR("Operating on journal entry: %@"));
  }
  _MILogTransactionStep(14, 1, 1, v7, v10, 0, v12, v13, v44);
  objc_msgSend(v14, "setProgressBlock:", v50);
  v15 = v64;
  obj = v64[5];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller _identifiersToLockBundleIdentifier:error:](self, "_identifiersToLockBundleIdentifier:error:", v7, &obj));
  objc_storeStrong(v15 + 5, obj);
  if (!v16)
  {
    v49 = 0;
    goto LABEL_23;
  }
  -[MIInstaller _writeLockIdentifiers:](self, "_writeLockIdentifiers:", v16);
  v17 = v64;
  v60 = v64[5];
  v18 = objc_msgSend(v14, "makeStagedBackgroundUpdateLive:", &v60);
  objc_storeStrong(v17 + 5, v60);
  if ((v18 & 1) == 0)
  {
    v43 = sub_100010E50((uint64_t)"-[MIInstaller _applyStagedUpdateForUUID:withError:]", 1288, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Failed to make staged background update live for app identity: %@"), v19, (uint64_t)v6);
    v30 = objc_claimAutoreleasedReturnValue(v43);
    v49 = 0;
    goto LABEL_20;
  }
  v49 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleRecordsToRegister"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
    sub_10004E89C(v21);

    -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
  objc_msgSend(v22, "releaseTerminationAssertion");

  -[MIInstaller setTerminationAssertionReleased:](self, "setTerminationAssertionReleased:", 1);
  context = objc_autoreleasePoolPush();
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v23 = sub_10000B610();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025188;
  block[3] = &unk_100084C80;
  v14 = v14;
  v53 = v14;
  v54 = &v63;
  v55 = &v56;
  dispatch_sync(v24, block);

  LODWORD(v24) = *((unsigned __int8 *)v57 + 24);
  _Block_object_dispose(&v56, 8);
  objc_autoreleasePoolPop(context);
  if (!(_DWORD)v24)
  {
    -[MIInstaller _logOperationCompletionWithStartTime:distributorID:](self, "_logOperationCompletionWithStartTime:distributorID:", v47, CFSTR("Unknown"));
    v25 = (LSRecordPromise *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recordPromise"));
    recordPromise = self->_recordPromise;
    self->_recordPromise = v25;

    if (-[NSArray count](v49, "count"))
    {
      v27 = v49;
      receipt = self->_receipt;
      v49 = v27;
      self->_receipt = v27;
    }
    else
    {
      receipt = self->_receipt;
      self->_receipt = (NSArray *)&__NSArray0__struct;
    }
    v32 = 1;
    goto LABEL_21;
  }
LABEL_23:
  v32 = 0;
LABEL_24:
  if (qword_10009DF78 != -1)
    dispatch_once(&qword_10009DF78, &stru_1000854C8);
  v33 = qword_10009DF70;
  if (os_signpost_enabled((os_log_t)qword_10009DF70))
  {
    v36 = "failed";
    if ((_DWORD)v32)
      v36 = "succeeded";
    *(_DWORD *)buf = 136315138;
    v70 = v36;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InstallStagedUpdate", "End staging update installation [%s]", buf, 0xCu);
  }
  _MILogTransactionStep(14, 2, v32, v7, v10, 0, v34, v35, v45);
  if ((v32 & 1) == 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));

    if (v37)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller lockedIdentifiers](self, "lockedIdentifiers"));
      sub_10004E89C(v38);

      -[MIInstaller setLockedIdentifiers:](self, "setLockedIdentifiers:", 0);
    }
    if (!-[MIInstaller terminationAssertionReleased](self, "terminationAssertionReleased"))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstaller client](self, "client"));
      objc_msgSend(v39, "releaseTerminationAssertion");

    }
    if (v14)
    {
      v51 = 0;
      v40 = objc_msgSend(v11, "purgeJournalEntry:withError:", v14, &v51);
      v41 = v51;
      if ((v40 & 1) == 0 && (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3))
        MOLogWrite(qword_10009E048, 3, "-[MIInstaller _applyStagedUpdateForUUID:withError:]", CFSTR("Failed to purge journal entry after staging update failure %@ : %@"));
    }
    else
    {
      v41 = 0;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v64[5]);

  }
  _Block_object_dispose(&v63, 8);

  return v32;
}

- (BOOL)applyStagedUpdateForUUID:(id)a3 withError:(id *)a4
{
  return -[MIInstaller _applyStagedUpdateForUUID:withError:](self, "_applyStagedUpdateForUUID:withError:", a3, a4);
}

- (NSArray)receipt
{
  return self->_receipt;
}

- (LSRecordPromise)recordPromise
{
  return self->_recordPromise;
}

- (NSString)stagedJournalEntryUniqueID
{
  return self->_stagedJournalEntryUniqueID;
}

- (NSURL)installURL
{
  return self->_installURL;
}

- (void)setInstallURL:(id)a3
{
  objc_storeStrong((id *)&self->_installURL, a3);
}

- (unint64_t)installationDomain
{
  return self->_installationDomain;
}

- (MIInstallOptions)options
{
  return self->_options;
}

- (MIClientConnection)client
{
  return self->_client;
}

- (NSURL)stagingRoot
{
  return self->_stagingRoot;
}

- (void)setStagingRoot:(id)a3
{
  objc_storeStrong((id *)&self->_stagingRoot, a3);
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (void)setStagingURL:(id)a3
{
  objc_storeStrong((id *)&self->_stagingURL, a3);
}

- (unsigned)packageFormat
{
  return self->_packageFormat;
}

- (void)setPackageFormat:(unsigned __int8)a3
{
  self->_packageFormat = a3;
}

- (NSArray)lockedIdentifiers
{
  return self->_lockedIdentifiers;
}

- (void)setLockedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_lockedIdentifiers, a3);
}

- (MIAppIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (BOOL)terminationAssertionReleased
{
  return self->_terminationAssertionReleased;
}

- (void)setTerminationAssertionReleased:(BOOL)a3
{
  self->_terminationAssertionReleased = a3;
}

- (unint64_t)stagingTime
{
  return self->_stagingTime;
}

- (void)setStagingTime:(unint64_t)a3
{
  self->_stagingTime = a3;
}

- (unint64_t)waitingTime
{
  return self->_waitingTime;
}

- (void)setWaitingTime:(unint64_t)a3
{
  self->_waitingTime = a3;
}

- (unint64_t)preflightAndPatchTime
{
  return self->_preflightAndPatchTime;
}

- (void)setPreflightAndPatchTime:(unint64_t)a3
{
  self->_preflightAndPatchTime = a3;
}

- (unint64_t)verificationTime
{
  return self->_verificationTime;
}

- (void)setVerificationTime:(unint64_t)a3
{
  self->_verificationTime = a3;
}

- (unint64_t)installOperationType
{
  return self->_installOperationType;
}

- (void)setInstallOperationType:(unint64_t)a3
{
  self->_installOperationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_lockedIdentifiers, 0);
  objc_storeStrong((id *)&self->_stagingURL, 0);
  objc_storeStrong((id *)&self->_stagingRoot, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_installURL, 0);
  objc_storeStrong((id *)&self->_stagedJournalEntryUniqueID, 0);
  objc_storeStrong((id *)&self->_recordPromise, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
}

@end
