@implementation __MABuiltinBrainBundle__

+ (id)currentTargetPath
{
  return sub_100004F98((uint64_t)CFSTR(".current"));
}

+ (id)proposedTargetPath
{
  return sub_100004F98((uint64_t)CFSTR(".proposed"));
}

+ (BOOL)destageCurrent:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", CFSTR(".current")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ currentTargetPath](__MABuiltinBrainBundle__, "currentTargetPath"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v4, a3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)destageProposed:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", CFSTR(".proposed")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ proposedTargetPath](__MABuiltinBrainBundle__, "proposedTargetPath"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "removeItemAtPath:error:", v4, a3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (BOOL)stageProposed:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", CFSTR(".proposed")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  v7 = sub_1000044DC(v6, v5);

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to write stagingName final path component(%@) to proposed path(%@)"), v8, v5));

    v10 = objc_retainAutorelease(v9);
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v10, "UTF8String"));

  }
  return v7;
}

+ (void)garbageCollect
{
  void *v2;
  unsigned int v3;
  id v4;
  const __CFString *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/private/var/MobileAsset/MobileAssetBrain")))
  {
    v19 = 0;
    v3 = objc_msgSend(v2, "removeItemAtPath:error:", CFSTR("/private/var/MobileAsset/MobileAssetBrain"), &v19);
    v4 = v19;
    if (v3)
    {
      v5 = CFSTR("Successfully removed old MobileAssetBrain installation directory");
    }
    else
    {
      v15 = v4;
      v5 = CFSTR("Error removing old MobileAssetBrain installation directory: %@");
    }
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v15)));
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v6, "UTF8String"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_10000D7B0));
  v8 = objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[__MABuiltinBrainBundle__ currentTargetPath](__MABuiltinBrainBundle__, "currentTargetPath"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));

  if (v10)
  {
    objc_msgSend(v8, "addObject:", v10);
    v11 = v10;
  }
  else
  {
    v11 = CFSTR("nil");
  }
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Performing MABrain garbage collection (current=%@)..."), v11)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v12, "UTF8String"));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100005564;
  v16[3] = &unk_10000C388;
  v17 = v8;
  v18 = v2;
  v13 = v2;
  v14 = v8;
  sub_1000046E8(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), 0, v16);

}

- (__MABuiltinBrainBundle__)initWithPath:(id)a3
{
  id v5;
  __MABuiltinBrainBundle__ *v6;
  __MABuiltinBrainBundle__ *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)__MABuiltinBrainBundle__;
  v6 = -[__MABuiltinBrainBundle__ init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundlePath, a3);

  return v7;
}

- (BOOL)isGrafted
{
  __MABuiltinBrainBundle__ *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ graftPath](self, "graftPath"));
  LOBYTE(v2) = -[__MABuiltinBrainBundle__ isGraftedPath:](v2, "isGraftedPath:", v3);

  return (char)v2;
}

- (BOOL)isGraftedPath:(id)a3
{
  BOOL v3;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  if (fsctl((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation", 0, 0), 0xC0104A66uLL, v5, 1u))
  {
    v3 = 1;
  }
  else
  {
    v3 = BYTE4(v5[0]) == 0;
  }
  return !v3;
}

- (BOOL)stageCurrent:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/MobileAsset/MobileAssetBrain"), "stringByAppendingPathComponent:", CFSTR(".current")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ bundleId](self, "bundleId"));
  v6 = sub_1000044DC(v5, v4);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ bundleId](self, "bundleId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to mark bundle(%@) as current brain."), v7));

    v9 = objc_retainAutorelease(v8);
    NSLog(CFSTR("[MAB] %s"), objc_msgSend(v9, "UTF8String"));

  }
  return v6;
}

- (BOOL)graft:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  id *v12;
  NSErrorUserInfoKey *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  id v24;
  NSError *v25;
  id v26;
  int v27;
  id v28;
  id v29;
  id v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  unsigned int v35;
  void *v36;
  unsigned int v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  int v48;
  unsigned int v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[2];
  stat v57;
  char v58;
  _QWORD v59[4];
  _QWORD v60[4];
  _QWORD v61[3];
  _QWORD v62[3];
  NSErrorUserInfoKey v63;
  id v64;
  NSErrorUserInfoKey v65;
  id v66;
  _QWORD v67[3];
  _QWORD v68[3];
  __int128 v69;
  int v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _BYTE v100[28];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ graftPath](self, "graftPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ cryptexPath](self, "cryptexPath"));
  v58 = 0;
  memset(&v57, 0, sizeof(v57));
  v56[0] = 0;
  v56[1] = 0;
  v99 = 0u;
  memset(v100, 0, sizeof(v100));
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v86 = 0u;
  v85 = 0u;
  v84 = 0u;
  v83 = 0u;
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  v78 = 0u;
  v77 = 0u;
  v76 = 0u;
  v75 = 0u;
  v74 = 0u;
  v73 = 0u;
  v72 = 0u;
  v71 = 0u;
  v69 = xmmword_100009BE0;
  v70 = -1;
  v67[0] = NSFileOwnerAccountID;
  v67[1] = NSFileGroupOwnerAccountID;
  v68[0] = &off_10000D758;
  v68[1] = &off_10000D758;
  v67[2] = NSFilePosixPermissions;
  v68[2] = &off_10000D770;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v68, v67, 3));
  if (!v6)
  {
    v65 = NSDebugDescriptionErrorKey;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("graftPath is nil")));
    v66 = v11;
    v12 = &v66;
    v13 = &v65;
LABEL_7:
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, 1));
    v15 = 100;
    v16 = v14;
LABEL_8:
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MobileAssetBrainErrorDomain"), v15, v16));

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (!v7)
  {
    v63 = NSDebugDescriptionErrorKey;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cryptexPath is nil")));
    v64 = v11;
    v12 = &v64;
    v13 = &v63;
    goto LABEL_7;
  }
  if (-[__MABuiltinBrainBundle__ isGraftedPath:](self, "isGraftedPath:", v6))
  {
    v9 = 0;
    v10 = 1;
    goto LABEL_13;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v6, &v58);

  v52 = v5;
  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v55 = 0;
    v21 = objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v8, &v55);
    v9 = v55;

    if ((v21 & 1) != 0)
    {
LABEL_18:
      v5 = v52;
LABEL_19:
      v22 = objc_retainAutorelease(v6);
      if (lstat((const char *)objc_msgSend(v22, "fileSystemRepresentation"), &v57))
      {
        v23 = objc_retainAutorelease(v22);
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not lstat %s"), objc_msgSend(v23, "fileSystemRepresentation"))));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v24, "UTF8String"));

        v5 = v52;
        v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, *__error(), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v25);

        v61[0] = NSDebugDescriptionErrorKey;
        v61[1] = NSUnderlyingErrorKey;
        v62[0] = CFSTR("lstat failed");
        v62[1] = v14;
        v61[2] = CFSTR("graftPath");
        v62[2] = v23;
        v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61, 3));
        v15 = 104;
        v16 = v11;
        goto LABEL_8;
      }
      if (-[__MABuiltinBrainBundle__ isPersonalized](self, "isPersonalized")
        || -[__MABuiltinBrainBundle__ isGloballySigned](self, "isGloballySigned"))
      {
        v50 = v22;
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ cryptexPath](self, "cryptexPath")));
        v27 = open((const char *)objc_msgSend(v26, "fileSystemRepresentation"), 0);

        v49 = v27;
        if (v27 < 0)
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("open()"), CFSTR("syscall"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ cryptexPath](self, "cryptexPath"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("path"));

          v22 = v50;
LABEL_43:
          v51 = objc_retainAutorelease(v7);
          v41 = objc_msgSend(v51, "fileSystemRepresentation");
          v42 = objc_retainAutorelease(v22);
          v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not graft %s to %s"), v41, objc_msgSend(v42, "fileSystemRepresentation"))));
          NSLog(CFSTR("[MAB] %s"), objc_msgSend(v43, "UTF8String"));

          v44 = *__error();
          if (objc_msgSend(v52, "count"))
            v45 = v52;
          else
            v45 = 0;
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v44, v45));

          v59[0] = NSDebugDescriptionErrorKey;
          v59[1] = NSUnderlyingErrorKey;
          v60[0] = CFSTR("graft failed");
          v60[1] = v46;
          v59[2] = CFSTR("cryptexPath");
          v59[3] = CFSTR("graftPath");
          v60[2] = v51;
          v60[3] = v42;
          v11 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 4));
          v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MobileAssetBrainErrorDomain"), 104, v11));

          v5 = v52;
          goto LABEL_9;
        }
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ ticketPath](self, "ticketPath")));
        v48 = open((const char *)objc_msgSend(v28, "fileSystemRepresentation"), 0);
        if (v48 < 0)
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("open()"), CFSTR("syscall"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("path"));
          v33 = -1;
          v32 = v27;
          v22 = v50;
        }
        else
        {
          v47 = v28;
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Found MA brain ticket: %@"), v28)));
          NSLog(CFSTR("[MAB] %s"), objc_msgSend(v29, "UTF8String"));

          v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ rootHashPath](self, "rootHashPath")));
          v31 = open((const char *)objc_msgSend(v30, "fileSystemRepresentation"), 0);

          v22 = v50;
          if (v31 < 0)
          {
            v5 = v52;
            objc_msgSend(v52, "setObject:forKeyedSubscript:", CFSTR("open()"), CFSTR("syscall"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ rootHashPath](self, "rootHashPath"));
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v40, CFSTR("path"));

            v33 = -1;
            v32 = v49;
          }
          else
          {
            DWORD2(v69) = v48;
            v70 = v31;
            *(_QWORD *)&v71 = 16;
            v32 = v49;
            v33 = graftdmg(v49, objc_msgSend(objc_retainAutorelease(v50), "fileSystemRepresentation"), -[__MABuiltinBrainBundle__ graftdmgType](self, "graftdmgType"), &v69);
            v5 = v52;
            if (v33)
            {
              objc_msgSend(v52, "setObject:forKeyedSubscript:", CFSTR("graftdmg()"), CFSTR("syscall"));
              objc_msgSend(v52, "setObject:forKeyedSubscript:", v47, CFSTR("path"));
            }
            close(v31);
          }
          close(v48);
          v28 = v47;
        }
        close(v32);

      }
      else
      {
        v56[0] = v57.st_ino;
        v33 = fsctl((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"), 0x80104A63uLL, v56, 0);
      }
      if (!v33)
      {
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Successfully grafted %@ onto %@"), v7, v22)));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v11, "UTF8String"));
        v10 = 1;
LABEL_10:

        if (!a3)
          goto LABEL_13;
        goto LABEL_11;
      }
      goto LABEL_43;
    }
    goto LABEL_32;
  }
  if (v58)
  {
    v9 = 0;
    goto LABEL_19;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v54 = 0;
  v35 = objc_msgSend(v34, "removeItemAtPath:error:", v6, &v54);
  v9 = v54;

  if (!v35)
  {
LABEL_32:
    v10 = 0;
    goto LABEL_33;
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v53 = v9;
  v37 = objc_msgSend(v36, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v8, &v53);
  v38 = v53;

  if (v37)
  {
    v9 = v38;
    goto LABEL_18;
  }
  v10 = 0;
  v9 = v38;
LABEL_33:
  v5 = v52;
  if (!a3)
    goto LABEL_13;
LABEL_11:
  if (v9)
  {
    v9 = objc_retainAutorelease(v9);
    *a3 = v9;
  }
LABEL_13:

  return v10;
}

- (BOOL)ungraft:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  uint64_t v23;
  _QWORD v24[3];
  _QWORD v25[3];
  NSErrorUserInfoKey v26;
  void *v27;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ graftPath](self, "graftPath"));
  v23 = 0;
  if (v6)
  {
    if (-[__MABuiltinBrainBundle__ isGraftedPath:](self, "isGraftedPath:", v6))
    {
      v7 = objc_retainAutorelease(v6);
      v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
      if (&_ungraftdmg)
      {
        v9 = ungraftdmg(v8, 0);
        v10 = CFSTR("ungraftdmg()");
      }
      else
      {
        v9 = fsctl(v8, 0x80084A64uLL, &v23, 0);
        v10 = CFSTR("fsctl()");
      }
      if (v9)
      {
        v15 = objc_retainAutorelease(v7);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not ungraft %s"), objc_msgSend(v15, "fileSystemRepresentation"))));
        NSLog(CFSTR("[MAB] %s"), objc_msgSend(v16, "UTF8String"));

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("syscall"));
        v17 = *__error();
        if (objc_msgSend(v5, "count"))
          v18 = v5;
        else
          v18 = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, v18));
        v24[0] = NSDebugDescriptionErrorKey;
        v24[1] = NSUnderlyingErrorKey;
        v25[0] = CFSTR("ungraft failed");
        v25[1] = v12;
        v24[2] = CFSTR("graftPath");
        v25[2] = v15;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 3));
        v13 = 105;
        v14 = v11;
        goto LABEL_12;
      }
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Successfully ungrafted %@ from the file system using %@"), v7, v10, v23)));
      NSLog(CFSTR("[MAB] %s"), objc_msgSend(v21, "UTF8String"));

    }
    v19 = 0;
    v20 = 1;
    goto LABEL_17;
  }
  v26 = NSDebugDescriptionErrorKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("graftPath is nil")));
  v27 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
  v13 = 100;
  v14 = v12;
LABEL_12:
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MobileAssetBrainErrorDomain"), v13, v14));

  v20 = 0;
  if (a3 && v19)
  {
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a3 = v19;
  }
LABEL_17:

  return v20;
}

- (BOOL)isPersonalized
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ ticketPath](self, "ticketPath"));
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

- (BOOL)isGloballySigned
{
  return 0;
}

- (BOOL)hasValidCurrentBootOnlyTicket
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ currentBootOnlyTicketPath](self, "currentBootOnlyTicketPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)bundleId
{
  return -[NSString lastPathComponent](self->_bundlePath, "lastPathComponent");
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)graftPath
{
  return -[NSString stringByAppendingPathComponent:](self->_bundlePath, "stringByAppendingPathComponent:", CFSTR(".graft"));
}

- (NSString)cryptexPath
{
  return -[NSString stringByAppendingPathComponent:](self->_bundlePath, "stringByAppendingPathComponent:", CFSTR("MobileAssetBrain.cryptex"));
}

- (NSString)ticketPath
{
  void *v3;

  if (-[__MABuiltinBrainBundle__ hasValidCurrentBootOnlyTicket](self, "hasValidCurrentBootOnlyTicket"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ currentBootOnlyTicketPath](self, "currentBootOnlyTicketPath"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ primaryTicketPath](self, "primaryTicketPath"));
  return (NSString *)v3;
}

- (NSString)primaryTicketPath
{
  return -[NSString stringByAppendingPathComponent:](self->_bundlePath, "stringByAppendingPathComponent:", CFSTR("cryptex1ticket.der"));
}

- (NSString)currentBootOnlyTicketPath
{
  NSString *bundlePath;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  bundlePath = self->_bundlePath;
  v3 = sub_100004A58();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cryptex1ticket.%@.der"), v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](bundlePath, "stringByAppendingPathComponent:", v5));

  return (NSString *)v6;
}

- (unsigned)graftdmgType
{
  unsigned int v2;
  const __CFString *v3;
  unsigned int v4;
  id v5;

  v2 = -[__MABuiltinBrainBundle__ hasValidCurrentBootOnlyTicket](self, "hasValidCurrentBootOnlyTicket");
  if (v2)
    v3 = CFSTR("Using GRAFTDMG_CRYPTEX_PDI_NONCE");
  else
    v3 = CFSTR("Using GRAFTDMG_CRYPTEX_BOOT");
  if (v2)
    v4 = 6;
  else
    v4 = 1;
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v3)));
  NSLog(CFSTR("[MAB] %s"), objc_msgSend(v5, "UTF8String"));

  return v4;
}

- (NSString)rootHashPath
{
  return -[NSString stringByAppendingPathComponent:](self->_bundlePath, "stringByAppendingPathComponent:", CFSTR("mobileassetbrain_root_hash"));
}

- (NSString)trustCachePath
{
  return -[NSString stringByAppendingPathComponent:](self->_bundlePath, "stringByAppendingPathComponent:", CFSTR("MobileAssetTrustCache"));
}

- (NSString)brainPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[__MABuiltinBrainBundle__ graftPath](self, "graftPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/usr/lib/libmobileassetd.dylib")));

  return (NSString *)v3;
}

- (NSDictionary)brainInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](self->_bundlePath, "stringByAppendingPathComponent:", CFSTR("MobileAssetBrain.plist")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v2));

  return (NSDictionary *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
}

@end
