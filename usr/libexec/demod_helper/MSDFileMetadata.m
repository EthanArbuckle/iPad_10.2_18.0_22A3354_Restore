@implementation MSDFileMetadata

+ (id)fileHashWithPath:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char v13;
  uint8_t buf[4];
  id v15;

  v3 = a3;
  v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v13);

  if ((v5 & 1) != 0)
  {
    if (!v13)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](NSURL, "fileURLWithString:", v3));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fileHash"));

      if (v6)
        goto LABEL_5;
      v9 = sub_100024A40();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Maybe it's an iCloud file (%{public}@)?", buf, 0xCu);
      }

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  }
  else
  {
    v11 = sub_100024A40();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10002A074();

    v6 = 0;
  }
LABEL_5:

  return v6;
}

+ (id)fileAttributesWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  id v11;
  _QWORD v12[4];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v11));
  v6 = v11;
  v7 = objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    v10 = sub_100024A40();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002A0D4((uint64_t)v3, v6);
  }
  else
  {
    v12[0] = CFSTR("NSFileExtendedAttributes");
    v12[1] = NSFileReferenceCount;
    v12[2] = NSFileSystemNumber;
    v12[3] = NSFileSystemFileNumber;
    v8 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
    objc_msgSend(v7, "removeObjectsForKeys:", v8);
  }

  return v7;
}

+ (id)extendedAttributeKeysWithPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  ssize_t v7;
  size_t v8;
  void *v9;
  void *v10;
  id v11;
  ssize_t v12;
  ssize_t v13;
  ssize_t v14;
  const char *v15;
  void *v16;
  void *v17;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v7 = listxattr(v6, 0, 0, 1);
  if (v7 < 0)
  {
    v19 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10002A158();

    v11 = 0;
    goto LABEL_14;
  }
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v7));
  v10 = v9;
  if (v8)
  {
    v11 = objc_retainAutorelease(v9);
    v12 = listxattr(v6, (char *)objc_msgSend(v11, "mutableBytes"), v8, 1);
    if (v12 > 0)
    {
      v13 = v12;
      objc_msgSend(v11, "setLength:", v12);
      v14 = 0;
      do
      {
        v15 = (char *)objc_msgSend(objc_retainAutorelease(v11), "bytes") + v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
        objc_msgSend(v4, "addObject:", v16);
        v14 += strlen(v15) + 1;

      }
      while (v14 < v13);
      goto LABEL_6;
    }
    v21 = sub_100024A40();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10002A1C4();

LABEL_14:
    v17 = 0;
    goto LABEL_7;
  }
LABEL_6:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
  v11 = v10;
LABEL_7:

  return v17;
}

+ (id)accessControlListWithPath:(id)a3
{
  id v3;
  _acl *file;
  _acl *v5;
  ssize_t v6;
  void *v7;
  void *v8;
  ssize_t v9;
  void *v10;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;

  v3 = objc_retainAutorelease(a3);
  file = acl_get_file((const char *)objc_msgSend(v3, "fileSystemRepresentation"), ACL_TYPE_EXTENDED);
  if (!file)
  {
    if (*__error() == 2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
      goto LABEL_9;
    }
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10002A230();

LABEL_21:
    v10 = 0;
    goto LABEL_9;
  }
  v5 = file;
  if (acl_valid(file))
  {
    v12 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002A334();
    goto LABEL_14;
  }
  v6 = acl_size(v5);
  v7 = malloc_type_malloc(v6, 0xFA04FA24uLL);
  if (!v7)
  {
    v14 = sub_100024A40();
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10002A29C();
LABEL_14:

    acl_free(v5);
    goto LABEL_21;
  }
  v8 = v7;
  v9 = acl_copy_ext(v7, v5, v6);
  if (v9 < 0)
  {
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002A2C8();

    v10 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, v9));
  }
  acl_free(v5);
  free(v8);
LABEL_9:

  return v10;
}

+ (id)valueForExtendedAttributesKey:(id)a3 forPath:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  const char *v8;
  id v9;
  ssize_t v10;
  void *v11;
  ssize_t v12;
  id v14;
  NSObject *v15;
  id v16;

  v5 = a4;
  v6 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v10 = getxattr(v8, v6, 0, 0, 0, 1);
  if (v10 < 0)
  {
    v14 = sub_100024A40();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10002A3A0();
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v10));

  v9 = objc_retainAutorelease(v11);
  v12 = getxattr(v8, v6, objc_msgSend(v9, "mutableBytes"), v10, 0, 1);
  if (v12 < 0)
  {
    v16 = sub_100024A40();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10002A414();
LABEL_9:

    goto LABEL_4;
  }
  objc_msgSend(v9, "setLength:", v12);
LABEL_4:

  return v9;
}

+ (id)extendedAttributesWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata extendedAttributeKeysWithPath:](MSDFileMetadata, "extendedAttributeKeysWithPath:", v3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
    if (objc_msgSend(v4, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v19 = v4;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = *(_QWORD *)v21;
        do
        {
          v11 = 0;
          v12 = v9;
          do
          {
            if (*(_QWORD *)v21 != v10)
              objc_enumerationMutation(v6);
            v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata valueForExtendedAttributesKey:forPath:](MSDFileMetadata, "valueForExtendedAttributesKey:forPath:", v13, v3));

            objc_msgSend(v5, "setObject:forKey:", v9, v13);
            v11 = (char *)v11 + 1;
            v12 = v9;
          }
          while (v8 != v11);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v8);
      }
      else
      {
        v9 = 0;
      }

      v4 = v19;
    }
    else
    {
      v9 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v5));
  }
  else
  {
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10002A474();

    v9 = 0;
    v5 = 0;
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

+ (id)targetFileWithPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationOfSymbolicLinkAtPath:error:", v3, &v10));
  v6 = v10;

  if (v6)
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002A4D4((uint64_t)v3, v6);

  }
  return v5;
}

- (MSDFileMetadata)initWithDictionary:(id)a3
{
  id v5;
  MSDFileMetadata *v6;
  MSDFileMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDFileMetadata;
  v6 = -[MSDFileMetadata init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dict, a3);

  return v7;
}

- (MSDFileMetadata)initWithPath:(id)a3
{
  id v4;
  MSDFileMetadata *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *p_super;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MSDFileMetadata;
  v5 = -[MSDFileMetadata init](&v21, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileAttributesWithPath:](MSDFileMetadata, "fileAttributesWithPath:", v4));
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata extendedAttributesWithPath:](MSDFileMetadata, "extendedAttributesWithPath:", v4));
      if (v8)
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSFileType));
        v11 = objc_msgSend(v10, "isEqualToString:", NSFileTypeSymbolicLink);

        if (v11)
        {
          v12 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata targetFileWithPath:](MSDFileMetadata, "targetFileWithPath:", v4));
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("MSDManifestSymbolicLinkTargetFile"));

            objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MSDManifestFileAttributes"));
            v14 = 0;
            p_super = 0;
LABEL_11:
            if (objc_msgSend(v9, "count"))
              objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("MSDManifestFileExtendedAttributes"));
            if (p_super && -[NSObject length](p_super, "length"))
              objc_msgSend(v6, "setObject:forKey:", p_super, CFSTR("MSDManifestFileACL"));
            objc_storeStrong((id *)&v5->_dict, v6);

            goto LABEL_17;
          }
          goto LABEL_24;
        }
        v16 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata accessControlListWithPath:](MSDFileMetadata, "accessControlListWithPath:", v4));
        if (!v16)
        {
LABEL_24:
          p_super = &v5->super;
          goto LABEL_26;
        }
        p_super = v16;
        v17 = objc_claimAutoreleasedReturnValue(+[MSDFileMetadata fileHashWithPath:](MSDFileMetadata, "fileHashWithPath:", v4));
        if (v17)
        {
          v14 = (void *)v17;
          objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("MSDManifestFileAttributes"));
          if (objc_msgSend(v14, "length"))
            objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("MSDManifestFileHash"));
          goto LABEL_11;
        }

LABEL_26:
        v5 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v20 = sub_100024A40();
      p_super = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_10002A5B8();
    }
    else
    {
      v19 = sub_100024A40();
      p_super = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        sub_10002A558();
    }
    v9 = v5;
    goto LABEL_26;
  }
LABEL_18:

  return v5;
}

+ (id)fileMetadatatWithPath:(id)a3
{
  id v3;
  MSDFileMetadata *v4;

  v3 = a3;
  v4 = -[MSDFileMetadata initWithPath:]([MSDFileMetadata alloc], "initWithPath:", v3);

  return v4;
}

+ (id)fileMetaDataWithMetadataDictionary:(id)a3
{
  id v3;
  MSDFileMetadata *v4;

  v3 = a3;
  v4 = -[MSDFileMetadata initWithDictionary:]([MSDFileMetadata alloc], "initWithDictionary:", v3);

  return v4;
}

- (void)dealloc
{
  NSDictionary *dict;
  objc_super v4;

  dict = self->_dict;
  self->_dict = 0;

  v4.receiver = self;
  v4.super_class = (Class)MSDFileMetadata;
  -[MSDFileMetadata dealloc](&v4, "dealloc");
}

- (BOOL)removeAllExtendedAttributes:(id)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  ssize_t v6;
  size_t v7;
  char *v8;
  char *v9;
  ssize_t v10;
  const char *v11;
  const char *v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;

  v3 = objc_retainAutorelease(a3);
  v4 = (const char *)objc_msgSend(v3, "fileSystemRepresentation");
  v5 = 1;
  v6 = listxattr(v4, 0, 0, 1);
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = (char *)malloc_type_malloc(v6, 0x5903D745uLL);
    if (v8)
    {
      v9 = v8;
      v10 = listxattr(v4, v8, v7, 1);
      if (v10 < 1)
      {
        v18 = sub_100024A40();
        v15 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10002A644();
      }
      else
      {
        v11 = &v9[v10];
        v12 = v9;
        while (!removexattr(v4, v12, 1))
        {
          v12 += strlen(v12) + 1;
          if (v12 >= v11)
          {
            v5 = 1;
            goto LABEL_8;
          }
        }
        v14 = sub_100024A40();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_10002A670();
      }

      v5 = 0;
LABEL_8:
      free(v9);
    }
    else
    {
      v16 = sub_100024A40();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_10002A618();

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)restoreAttribuesToPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  const char *v9;
  void *v10;
  void *v11;
  uid_t v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *i;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  const char *v40;
  MSDFileMetadata *v41;
  void *v42;
  unsigned __int8 v43;
  void *v44;
  id v45;
  id v46;
  _acl *v47;
  id v48;
  NSObject *v49;
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  BOOL v54;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  id v64;
  NSObject *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  id obj;
  uint64_t v77;
  MSDFileMetadata *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  id v83;
  id v84;
  uint8_t v85[128];
  uint8_t buf[4];
  id v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
  v7 = objc_msgSend(v6, "isEqualToString:", NSFileTypeSymbolicLink);

  v75 = v5;
  if (v7)
  {
    v8 = objc_retainAutorelease(v4);
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileOwnerAccountID"));
    v12 = objc_msgSend(v11, "intValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileGroupOwnerAccountID"));
    LODWORD(v9) = lchown(v9, v12, (gid_t)objc_msgSend(v14, "intValue"));

    if ((_DWORD)v9)
    {
      v56 = sub_100024A40();
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        sub_10002A94C();

    }
    else
    {
      v15 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
      LODWORD(v15) = lchmod(v15, (mode_t)objc_msgSend(v16, "filePosixPermissions"));

      if (!(_DWORD)v15)
      {
        v17 = 0;
        goto LABEL_8;
      }
      v60 = sub_100024A40();
      v61 = objc_claimAutoreleasedReturnValue(v60);
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        sub_10002A8E0();

    }
    v54 = 0;
    v17 = 0;
    goto LABEL_53;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata fileAttributesAllowSet:](self, "fileAttributesAllowSet:", v18));
  v84 = 0;
  v20 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v19, v4, &v84);
  v17 = v84;

  if ((v20 & 1) == 0)
  {
    v58 = sub_100024A40();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata fileAttributesAllowSet:](self, "fileAttributesAllowSet:", v69));
      *(_DWORD *)buf = 138543874;
      v87 = v4;
      v88 = 2114;
      v89 = v68;
      v90 = 2114;
      v91 = v70;
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Could not set file attributes at %{public}@ with error - %{public}@, attributes = %{public}@", buf, 0x20u);

    }
    v54 = 0;
    v33 = 0;
    v30 = 0;
    goto LABEL_41;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", NSFileProtectionKey));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v22, NSFileProtectionKey, 0));
  v83 = v17;
  v24 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v23, v4, &v83);
  v25 = v83;

  if ((v24 & 1) == 0)
  {
    v62 = sub_100024A40();
    v63 = objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKey:", NSFileProtectionKey));
      *(_DWORD *)buf = 138543874;
      v87 = v4;
      v88 = 2114;
      v89 = v71;
      v90 = 2114;
      v91 = v73;
      _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Could not set file protection key at %{public}@ with error - %{public}@, attributes = %{public}@", buf, 0x20u);

    }
    v54 = 0;
    v33 = 0;
    v30 = 0;
    v17 = v25;
    goto LABEL_57;
  }
  v17 = v25;
LABEL_8:
  if (!-[MSDFileMetadata removeAllExtendedAttributes:](self, "removeAllExtendedAttributes:", v4))
  {
    v54 = 0;
LABEL_53:
    v33 = 0;
    v30 = 0;
LABEL_57:
    v5 = v75;
    goto LABEL_41;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getExtendedAttributes](self, "getExtendedAttributes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allKeys"));

  obj = v27;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (!v28)
  {
    v30 = 0;
    goto LABEL_21;
  }
  v29 = v28;
  v74 = v17;
  v30 = 0;
  v31 = 0;
  v77 = *(_QWORD *)v80;
  v78 = self;
  while (2)
  {
    for (i = 0; i != v29; i = (char *)i + 1)
    {
      if (*(_QWORD *)v80 != v77)
        objc_enumerationMutation(obj);
      v33 = *(id *)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)i);

      v34 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0)
      {
        v50 = sub_100024A40();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          sub_10002A8B4();
        goto LABEL_34;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getExtendedAttributes](v78, "getExtendedAttributes"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v33));

      v37 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v36, v37) & 1) == 0)
      {
        v52 = sub_100024A40();
        v51 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          sub_10002A888();
        v30 = v36;
        goto LABEL_34;
      }
      v38 = v4;
      v39 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
      v31 = objc_retainAutorelease(v33);
      v40 = (const char *)objc_msgSend(v31, "UTF8String");
      v30 = objc_retainAutorelease(v36);
      if (setxattr(v39, v40, objc_msgSend(v30, "bytes"), (size_t)objc_msgSend(v30, "length"), 0, 1))
      {
        v53 = sub_100024A40();
        v51 = objc_claimAutoreleasedReturnValue(v53);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          sub_10002A828();
        v4 = v38;
LABEL_34:
        v5 = v75;
        v17 = v74;

        goto LABEL_40;
      }
      v4 = v38;
    }
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v29)
      continue;
    break;
  }

  v17 = v74;
  self = v78;
LABEL_21:

  v41 = self;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
  v43 = objc_msgSend(v42, "isEqualToString:", NSFileTypeSymbolicLink);

  v5 = v75;
  if ((v43 & 1) == 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v41, "getAccessControlList"));
    v45 = objc_msgSend(v44, "length");

    if (v45)
    {
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v41, "getAccessControlList")));
      v47 = acl_copy_int(objc_msgSend(v46, "bytes"));

      if (!v47)
      {
        v48 = sub_100024A40();
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          sub_10002A7BC();
        goto LABEL_65;
      }
LABEL_36:
      if (acl_valid(v47))
      {
        v64 = sub_100024A40();
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          sub_10002A334();
      }
      else
      {
        if (!acl_set_file((const char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), ACL_TYPE_EXTENDED, v47))goto LABEL_38;
        v66 = sub_100024A40();
        v65 = objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          sub_10002A750();
      }

LABEL_38:
      acl_free(v47);
    }
    else
    {
      v47 = acl_init(0);
      if (v47)
        goto LABEL_36;
      v67 = sub_100024A40();
      v49 = objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_10002A6E4();
LABEL_65:

    }
  }
  v33 = 0;
LABEL_40:
  v54 = 1;
LABEL_41:

  return v54;
}

- (int)compareWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *i;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  MSDFileMetadata *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  uint64_t v43;
  void *v44;
  void *v45;
  unsigned int v46;
  int v47;
  void *v48;
  unsigned __int8 v49;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  unsigned __int8 v55;
  MSDFileMetadata *v56;
  void *v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getFileType"));
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
      v9 = objc_msgSend(v8, "isEqualToString:", NSFileTypeRegular);

      if (v9
        && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getHash](self, "getHash")),
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getHash")),
            v12 = objc_msgSend(v10, "isEqualToData:", v11),
            v11,
            v10,
            !v12))
      {
        v47 = 2;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](self, "getFileType"));
        v14 = objc_msgSend(v13, "isEqualToString:", NSFileTypeSymbolicLink);

        if (!v14
          || (v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getTargetFile](self, "getTargetFile")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getTargetFile")),
              v17 = objc_msgSend(v15, "isEqualToString:", v16),
              v16,
              v15,
              v17))
        {
          v56 = self;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileAttributes](self, "getFileAttributes"));
          v57 = v4;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getFileAttributes"));
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v20 = v18;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
          if (v21)
          {
            v22 = v21;
            v58 = *(_QWORD *)v64;
            while (2)
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v64 != v58)
                  objc_enumerationMutation(v20);
                v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
                if ((objc_msgSend(v24, "isEqualToString:", NSFileGroupOwnerAccountID) & 1) != 0
                  || (objc_msgSend(v24, "isEqualToString:", NSFileOwnerAccountID) & 1) != 0
                  || objc_msgSend(v24, "isEqualToString:", NSFilePosixPermissions))
                {
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v24));
                  v26 = v20;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v24));
                  v28 = objc_msgSend(v25, "isEqual:", v27);

                  v20 = v26;
                  if (!v28)
                  {
                    v47 = 4;
                    v34 = v26;
                    v35 = v19;
                    v4 = v57;
                    goto LABEL_54;
                  }
                }
                if (objc_msgSend(v24, "isEqualToString:", NSFileProtectionKey))
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", v24));
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v24));
                  if ((objc_msgSend(v29, "isEqualToString:", v30) & 1) == 0)
                  {
                    v31 = objc_msgSend(v29, "isEqualToString:", NSFileProtectionNone);
                    v32 = v30 ? 0 : v31;
                    if ((v32 & 1) == 0
                      && !v29
                      && (objc_msgSend(v30, "isEqualToString:", NSFileProtectionNone) & 1) != 0)
                    {
                      v47 = 4;
                      v35 = v19;
                      v34 = v20;
LABEL_52:
                      v4 = v57;
                      goto LABEL_53;
                    }
                  }

                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
              if (v22)
                continue;
              break;
            }
          }

          v33 = v56;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getExtendedAttributes](v56, "getExtendedAttributes"));

          v4 = v57;
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "getExtendedAttributes"));

          if (v34)
          {
            if (v35)
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v34));
              v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v35));
              objc_msgSend(v36, "removeObjectForKey:", CFSTR("com.apple.assetsd.dbRebuildUuid"));
              objc_msgSend(v30, "removeObjectForKey:", CFSTR("com.apple.assetsd.dbRebuildUuid"));
              v37 = objc_msgSend(v36, "count");
              if (v37 != objc_msgSend(v30, "count"))
              {
                v47 = 4;
                v20 = v36;
                goto LABEL_53;
              }
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              v38 = v36;
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v60;
                while (2)
                {
                  for (j = 0; j != v40; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v60 != v41)
                      objc_enumerationMutation(v38);
                    v43 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKey:", v43));
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v43));
                    v46 = objc_msgSend(v44, "isEqualToData:", v45);

                    if (!v46)
                    {
                      v20 = v38;

                      v47 = 4;
                      goto LABEL_52;
                    }
                  }
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
                  if (v40)
                    continue;
                  break;
                }
              }

              v33 = v56;
              v4 = v57;
LABEL_47:
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getFileType](v33, "getFileType"));
              v49 = objc_msgSend(v48, "isEqualToString:", NSFileTypeSymbolicLink);

              if ((v49 & 1) != 0)
              {
                v47 = 5;
                goto LABEL_55;
              }
              v20 = (id)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v33, "getAccessControlList"));
              v51 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAccessControlList"));
              v30 = (void *)v51;
              if (v20)
              {
                if (v51)
                {
                  v52 = v20;
                  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MSDFileMetadata getAccessControlList](v56, "getAccessControlList"));
                  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getAccessControlList"));
                  v55 = objc_msgSend(v53, "isEqualToData:", v54);

                  v20 = v52;
                  if ((v55 & 1) != 0)
                    goto LABEL_60;
                }
              }
              else if (!v51)
              {
LABEL_60:
                v47 = 5;
                goto LABEL_53;
              }
              v47 = 4;
LABEL_53:

LABEL_54:
              goto LABEL_55;
            }
          }
          else
          {
            if (!v35)
              goto LABEL_47;
            v34 = 0;
          }
          v47 = 4;
LABEL_55:

          goto LABEL_56;
        }
        v47 = 3;
      }
    }
    else
    {
      v47 = 1;
    }
  }
  else
  {
    v47 = 0;
  }
LABEL_56:

  return v47;
}

- (id)fileAttributesAllowSet:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSFileBusy, NSFileHFSCreatorCode, NSFileHFSTypeCode, NSFileImmutable, NSFileCreationDate, NSFileExtensionHidden, NSFileGroupOwnerAccountID, NSFileGroupOwnerAccountName, NSFileModificationDate, NSFileOwnerAccountID, NSFileOwnerAccountName, NSFilePosixPermissions, 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));

  objc_msgSend(v6, "removeObjectsInArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));

  objc_msgSend(v7, "removeObjectsForKeys:", v6);
  return v7;
}

- (NSData)getHash
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestFileHash")));
  v3 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {

    v2 = 0;
  }
  return (NSData *)v2;
}

- (NSDictionary)getFileAttributes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestFileAttributes")));
  v3 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {

    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSDictionary)getExtendedAttributes
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestFileExtendedAttributes")));
  v3 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {

    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (NSData)getAccessControlList
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestFileACL")));
  v3 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {

    v2 = 0;
  }
  return (NSData *)v2;
}

- (NSString)getFileType
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestFileAttributes")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSFileType));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)getTargetFile
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestSymbolicLinkTargetFile")));
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (int64_t)getFileSize
{
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_dict, "objectForKey:", CFSTR("MSDManifestFileAttributes")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fileType"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NSFileTypeRegular"));

  if (v4)
    v5 = objc_msgSend(v2, "fileSize");
  else
    v5 = 0;

  return (int64_t)v5;
}

+ (id)compareResultToNSString:(int)a3
{
  if (a3 > 5)
    return CFSTR("Unknown compare result.");
  else
    return *(&off_100048CB8 + a3);
}

- (NSDictionary)dict
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
