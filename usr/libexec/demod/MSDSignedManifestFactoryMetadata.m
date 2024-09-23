@implementation MSDSignedManifestFactoryMetadata

+ (id)loadManifestMetadata:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  char v36;

  v36 = 0;
  v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = sub_10008C52C;
  v34[3] = sub_10008C53C;
  v3 = a3;
  v35 = v3;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_10008C52C;
  v31[4] = sub_10008C53C;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_10008C52C;
  v29 = sub_10008C53C;
  v30 = (id)objc_opt_new(NSMutableArray, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if ((objc_msgSend(v5, "fileExistsAtPath:isDirectory:", *(_QWORD *)(v34[0] + 40), &v36) & 1) == 0)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C7E8C((uint64_t)v34, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_9;
  }
  if (!v36)
  {
    v17 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000C7E20((uint64_t)v34, v10, v18, v19, v20, v21, v22, v23);
LABEL_9:

    v6 = 0;
    goto LABEL_4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", *(_QWORD *)(v34[0] + 40), 0));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008C544;
  v24[3] = &unk_10013F5A0;
  v24[4] = &v33;
  v24[5] = v31;
  v24[6] = &v25;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v24);
LABEL_4:
  v7 = objc_msgSend((id)v26[5], "copy");

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

  _Block_object_dispose(&v33, 8);
  return v7;
}

+ (id)languageIdentifiersForMetadataList:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v5 = (void *)objc_opt_new(NSMutableArray, v4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(MSDSignedManifestFactoryMetadata, v8);
        if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "languageIdentifier", (_QWORD)v17));
          if (v14)
            objc_msgSend(v5, "addObject:", v14);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = objc_msgSend(v5, "copy");
  return v15;
}

+ (id)metadataWithLanugageIdentifier:(id)a3 fromList:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(MSDSignedManifestFactoryMetadata, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "languageIdentifier", (_QWORD)v15));
          if ((objc_msgSend(v13, "isEqualToString:", v5) & 1) != 0)
          {
            v8 = v11;

            goto LABEL_13;
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v8;
}

- (MSDSignedManifestFactoryMetadata)initWithContentPlistFile:(id)a3
{
  id v4;
  MSDSignedManifestFactoryMetadata *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSString *bundleID;
  uint64_t v15;
  NSString *fileName;
  void *v17;
  uint64_t v18;
  NSString *languageIdentifier;
  uint64_t v20;
  NSString *regionCode;
  uint64_t v22;
  NSArray *supportedRegions;
  unsigned __int8 v24;
  MSDSignedManifestFactoryMetadata *v25;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)MSDSignedManifestFactoryMetadata;
  v5 = -[MSDSignedManifestFactoryMetadata init](&v40, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if ((objc_msgSend(v6, "fileExistsAtPath:", v4) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v4));
      v8 = sub_1000604F0();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v42 = v4;
          v43 = 2114;
          v44 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Content.plist at path %{public}@: %{public}@", buf, 0x16u);
        }

        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("Name")));
        name = v5->_name;
        v5->_name = (NSString *)v11;

        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ManifestBundleID")));
        bundleID = v5->_bundleID;
        v5->_bundleID = (NSString *)v13;

        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ManifestFileName")));
        fileName = v5->_fileName;
        v5->_fileName = (NSString *)v15;

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("IsPrimaryBundle")));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ManifestLanguageCode")));
        languageIdentifier = v5->_languageIdentifier;
        v5->_languageIdentifier = (NSString *)v18;

        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("ManifestRegionCode")));
        regionCode = v5->_regionCode;
        v5->_regionCode = (NSString *)v20;

        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("SupportRegionCodes")));
        supportedRegions = v5->_supportedRegions;
        v5->_supportedRegions = (NSArray *)v22;

        if (v17)
          v24 = objc_msgSend(v17, "BOOLValue");
        else
          v24 = 0;
        v5->_isPrimaryBundle = v24;

        goto LABEL_10;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1000C7F5C((uint64_t)v4, v10, v34, v35, v36, v37, v38, v39);
    }
    else
    {
      v27 = sub_1000604F0();
      v10 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1000C7FC0((uint64_t)v4, v10, v28, v29, v30, v31, v32, v33);
    }

    v25 = 0;
    goto LABEL_11;
  }
LABEL_10:
  v25 = v5;
LABEL_11:

  return v25;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestFactoryMetadata name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestFactoryMetadata languageIdentifier](self, "languageIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSignedManifestFactoryMetadata regionCode](self, "regionCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Name: %@; Language: %@; Region: %@>"),
                   v5,
                   v6,
                   v7,
                   v8));

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (BOOL)isPrimaryBundle
{
  return self->_isPrimaryBundle;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSArray)supportedRegions
{
  return self->_supportedRegions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRegions, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
