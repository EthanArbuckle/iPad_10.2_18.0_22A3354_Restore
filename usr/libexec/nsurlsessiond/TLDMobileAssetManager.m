@implementation TLDMobileAssetManager

- (TLDMobileAssetManager)init
{
  TLDMobileAssetManager *v2;
  id v3;
  id v4;
  int v5;
  int v6;
  ssize_t v7;
  uint64_t v8;
  _QWORD *p_installedAssetVersion;
  objc_super v11;
  uint8_t buf[12];
  unsigned int v13;

  v11.receiver = self;
  v11.super_class = (Class)TLDMobileAssetManager;
  v2 = -[TLDMobileAssetManager init](&v11, "init");
  if (v2)
  {
    v3 = sub_10004A148();
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v3));
    v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 0);
    v6 = v5;
    if (v5 != -1)
    {
      v13 = 0;
      v7 = read(v5, &v13, 4uLL);
      close(v6);
      if (v7 != -1)
      {
        if (v13 >= 0x10000)
          v8 = v13 - 0x10000;
        else
          v8 = 0;

        p_installedAssetVersion = &v2->_installedAssetVersion;
        if (v8 >= 0x2B)
          goto LABEL_13;
        goto LABEL_12;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error reading the TLD Asset version", buf, 2u);
      }
    }

    p_installedAssetVersion = &v2->_installedAssetVersion;
LABEL_12:
    v8 = 43;
LABEL_13:
    *p_installedAssetVersion = v8;
  }
  return v2;
}

- (void)queryAndFindBestAsset:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  uint8_t buf[16];

  v3 = a3;
  v5 = objc_msgSend(objc_alloc((Class)MAAssetQuery), "initWithType:", CFSTR("com.apple.MobileAsset.TopLevelDomainDafsa"));
  objc_msgSend(v5, "returnTypes:", 2);
  v6 = objc_msgSend(v5, "queryMetaDataSync");
  v7 = objc_msgSend(v5, "isCatalogFetchedWithinThePastFewDays:", 5);
  if (v6)
    v8 = 0;
  else
    v8 = v7;
  if (v8 != 1)
  {
LABEL_9:
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004A5D8;
    v12[3] = &unk_1000B1868;
    v12[4] = self;
    v13 = v3;
    +[MAAsset startCatalogDownload:then:](MAAsset, "startCatalogDownload:then:", CFSTR("com.apple.MobileAsset.TopLevelDomainDafsa"), v12);
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Empty results for asset update query", buf, 2u);
    }
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  -[TLDMobileAssetManager findBestAssetFrom:skipDownload:](self, "findBestAssetFrom:skipDownload:", v11, v3);

LABEL_10:
}

- (void)findBestAssetFrom:(id)a3 skipDownload:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  signed int v14;
  void *v15;
  void *v16;
  signed int v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  void *v26;
  TLDMobileAssetManager *v28;
  void *v29;
  void *v30;
  id obj;
  unint64_t v32;
  unint64_t v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  unint64_t v49;
  _BYTE v50[128];

  v5 = a3;
  v28 = self;
  v33 = -[TLDMobileAssetManager installedAssetVersion](self, "installedAssetVersion", v5);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
  if (v6)
  {
    v29 = 0;
    v30 = 0;
    v32 = 0;
    v7 = *(_QWORD *)v37;
    v8 = ASAttributeCompatibilityVersion;
    v9 = ASAttributeContentVersion;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
        v14 = objc_msgSend(v13, "intValue");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "attributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v9));
        v17 = objc_msgSend(v16, "intValue");

        v18 = v17;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v24 = objc_msgSend(v11, "state");
          v25 = -[TLDMobileAssetManager installedAssetVersion](v28, "installedAssetVersion");
          *(_DWORD *)buf = 134219008;
          v41 = (unint64_t)v24;
          v42 = 2048;
          v43 = v18;
          v44 = 2048;
          v45 = v25;
          v46 = 2048;
          v47 = v33;
          v48 = 2048;
          v49 = v32;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Asset (state %ld  Version %ld),  Current version %ld,  best installed version %ld,  best not installed version %ld", buf, 0x34u);
        }
        if (v14 == 3)
        {
          if (objc_msgSend(v11, "state") == (id)2)
          {
            if (v33 < v18)
            {
              v19 = v11;
              if (v32 <= v18)
              {

                v29 = 0;
                v32 = 0;
              }
              if (v30)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "attributes"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v9));

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = (unint64_t)v21;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Purging asset version %@", buf, 0xCu);
                }
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_10004A4E0;
                v34[3] = &unk_1000B1890;
                v22 = v21;
                v35 = v22;
                objc_msgSend(v30, "purge:", v34);

              }
              v30 = v19;
              v33 = v18;
            }
          }
          else if (v32 < v18 && v33 < v18)
          {
            v23 = v11;

            v29 = v23;
            v32 = v18;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v41 = v18;
          v42 = 2048;
          v43 = v14;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Asset version %lu has compatibilty version set to %lu. Not supported on the current OS", buf, 0x16u);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
    }
    while (v6);

    if (v29 && !a4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Download best not installed asset ver %lu", buf, 0xCu);
      }
      -[TLDMobileAssetManager downloadAsset:](v28, "downloadAsset:", v29);
    }
    if (v30)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Read installed asset ver %lu", buf, 0xCu);
      }
      -[TLDMobileAssetManager moveInstalledAsset:withVersion:](v28, "moveInstalledAsset:withVersion:", v30, v33);
    }
    else
    {
      v30 = 0;
    }
    v26 = v29;
  }
  else
  {

    v26 = 0;
    v30 = 0;
  }

}

- (void)downloadAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  _QWORD v8[5];
  unsigned int v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", ASAttributeContentVersion));
  v7 = objc_msgSend(v6, "intValue");

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Asset download requested", buf, 2u);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004A3E8;
  v8[3] = &unk_1000B18B8;
  v8[4] = self;
  v9 = v7;
  objc_msgSend(v4, "startDownload:", v8);

}

- (void)moveFileAtomically:(id)a3 toLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathExtension:", CFSTR("tmp")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = 0;
  v10 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v5, v7, &v16);
  v11 = v16;

  if ((v10 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = v11;
    v13 = objc_msgSend(v12, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v7, 0, 1, 0, &v15);
    v14 = v15;

    if ((v13 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2112;
      v20 = v14;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Replacing a file at location %@ failed. Error %@", buf, 0x16u);
    }
    v11 = v14;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v5;
    v19 = 2112;
    v20 = v11;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Copying from a file at location %@ failed. Error %@", buf, 0x16u);
  }

}

- (void)moveInstalledAsset:(id)a3 withVersion:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v6 = a3;
  -[TLDMobileAssetManager setInstalledAssetVersion:](self, "setInstalledAssetVersion:", a4);
  v7 = sub_10004A148();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getLocalFileUrl"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Read Asset at %@", (uint8_t *)&v11, 0xCu);
      if (!v9)
        goto LABEL_5;
    }
    else if (!v9)
    {
LABEL_5:

      goto LABEL_6;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("DafsaData.bin"), 0));
    -[TLDMobileAssetManager moveFileAtomically:toLocation:](self, "moveFileAtomically:toLocation:", v10, v8);

    goto LABEL_5;
  }
LABEL_6:

}

- (unint64_t)installedAssetVersion
{
  return self->_installedAssetVersion;
}

- (void)setInstalledAssetVersion:(unint64_t)a3
{
  self->_installedAssetVersion = a3;
}

@end
