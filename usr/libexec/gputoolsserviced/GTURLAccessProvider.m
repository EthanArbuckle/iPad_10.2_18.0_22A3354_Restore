@implementation GTURLAccessProvider

- (GTURLAccessProvider)initWithServiceProvider:(id)a3 connectionProvider:(id)a4 serviceVendor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  GTURLAccessProvider *v13;
  GTURLAccessProvider *v14;
  os_log_t v15;
  OS_os_log *log;
  NSMutableDictionary *v17;
  NSMutableDictionary *registeredURLs;
  uint64_t v19;
  NSString *deviceUDID;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v22.receiver = self;
    v22.super_class = (Class)GTURLAccessProvider;
    v14 = -[GTURLAccessProvider init](&v22, "init");
    if (v14)
    {
      v15 = os_log_create("com.apple.gputools.transport", "URLAccessProvider");
      log = v14->_log;
      v14->_log = (OS_os_log *)v15;

      v17 = objc_opt_new(NSMutableDictionary);
      registeredURLs = v14->_registeredURLs;
      v14->_registeredURLs = v17;

      v19 = objc_claimAutoreleasedReturnValue(+[GTDeviceProperties uniqueDeviceID](GTDeviceProperties, "uniqueDeviceID"));
      deviceUDID = v14->_deviceUDID;
      v14->_deviceUDID = (NSString *)v19;

      objc_storeStrong((id *)&v14->_serviceProvider, a3);
      objc_storeStrong((id *)&v14->_connectionProvider, a4);
      objc_storeStrong((id *)&v14->_serviceVendor, a5);
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (id)urlForPath:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_registeredURLs;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), (_QWORD)v14));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (BOOL)_sharesFileSystemWith:(id)a3 remoteConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  GTServiceVendor *serviceVendor;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (-[NSString isEqualToString:](self->_deviceUDID, "isEqualToString:", v6))
    {
      v9 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceProvider allServices](self->_serviceProvider, "allServices"));
      v11 = filteredArrayByService(v10, (Protocol *)&OBJC_PROTOCOL___GTSimulatorDeviceBrowser);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

      serviceVendor = self->_serviceVendor;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "serviceProperties"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GTServiceVendor getSimulatorDeviceBrowserService:](serviceVendor, "getSimulatorDeviceBrowserService:", v15));

      v9 = objc_msgSend(v16, "isSimulatorDevice:", v6);
    }
  }

  return v9;
}

- (void)securityScopedURLFromSandboxID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  OS_os_log *log;
  OS_os_log *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  GTURLAccessProviderXPCProxy *v35;
  void *v36;
  GTURLAccessProviderXPCProxy *v37;
  id *v38;
  id v39;
  id *v40;
  OS_os_log *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  NSString *deviceUDID;
  _QWORD v51[5];
  id v52;
  void (**v53)(id, void *);
  _QWORD v54[5];
  id v55;
  void (**v56)(id, void *);
  _QWORD v57[5];
  id v58;
  void (**v59)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = v6;
  if (v8
    && (v9 = objc_opt_class(NSURL), (objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scheme")),
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("gtsandboxid")),
        v10,
        v11)
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host")), v12, v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

    if (v13)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        sub_10000E9C4();
      v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", v8));
      if (v14)
      {
        v15 = (void *)v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
        v18 = objc_msgSend(v16, "fileExistsAtPath:", v17);

        log = self->_log;
        if (v18)
        {
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
            sub_10000E904();
          v7[2](v7, v15);
LABEL_37:

          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
          sub_10000E964();

        -[NSMutableDictionary removeObjectForKey:](self->_registeredURLs, "removeObjectForKey:", v8);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "host"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionProvider connectionForDeviceUDID:](self->_connectionProvider, "connectionForDeviceUDID:", v15));
      v29 = v28;
      if (v28)
      {
        v30 = allServicesForDeviceUDID(v28, v15);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        v32 = filteredArrayByService(v31, (Protocol *)&OBJC_PROTOCOL___GTURLAccessProvider);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "firstObject"));

        if (v34)
        {
          v35 = [GTURLAccessProviderXPCProxy alloc];
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "serviceProperties"));
          v37 = -[GTURLAccessProviderXPCProxy initWithConnection:remoteProperties:](v35, "initWithConnection:remoteProperties:", v29, v36);

          if (-[GTURLAccessProvider _sharesFileSystemWith:remoteConnection:](self, "_sharesFileSystemWith:remoteConnection:", v15, v29))
          {
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_1000076AC;
            v57[3] = &unk_100030888;
            v57[4] = self;
            v38 = &v58;
            v39 = v8;
            v58 = v39;
            v40 = (id *)&v59;
            v59 = v7;
            -[GTURLAccessProviderXPCProxy securityScopedURLFromSandboxID:completionHandler:](v37, "securityScopedURLFromSandboxID:completionHandler:", v39, v57);
          }
          else
          {
            v49 = objc_opt_respondsToSelector(v37, "copyIdentifier:toDevice:completionHandler:");
            deviceUDID = self->_deviceUDID;
            if ((v49 & 1) != 0)
            {
              v54[0] = _NSConcreteStackBlock;
              v54[1] = 3221225472;
              v54[2] = sub_100007704;
              v54[3] = &unk_1000308B0;
              v54[4] = self;
              v38 = (id *)&v56;
              v56 = v7;
              v40 = &v55;
              v55 = v8;
              -[GTURLAccessProviderXPCProxy copyIdentifier:toDevice:completionHandler:](v37, "copyIdentifier:toDevice:completionHandler:", v55, deviceUDID, v54);
            }
            else
            {
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472;
              v51[2] = sub_1000078D0;
              v51[3] = &unk_1000308D8;
              v51[4] = self;
              v38 = (id *)&v53;
              v53 = v7;
              v40 = &v52;
              v52 = v8;
              -[GTURLAccessProviderXPCProxy transferIdentifier:toDevice:completionHandler:](v37, "transferIdentifier:toDevice:completionHandler:", v52, deviceUDID, v51);
            }
          }

        }
        else
        {
          v41 = self->_log;
          if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
            sub_10000E8D4(v41, v42, v43, v44, v45, v46, v47, v48);
          v7[2](v7, 0);
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          sub_10000E874();
        v7[2](v7, 0);
      }

      goto LABEL_37;
    }
  }
  else
  {

  }
  v20 = self->_log;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    sub_10000E844(v20, v21, v22, v23, v24, v25, v26, v27);
  v7[2](v7, 0);
LABEL_17:

}

- (id)makeURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  ++dword_10003DCF8;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLPathAllowedCharacterSet](NSCharacterSet, "URLPathAllowedCharacterSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@/%@?id=%u"), CFSTR("gtsandboxid"), self->_deviceUDID, v7, dword_10003DCF8));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredURLs, "setObject:forKeyedSubscript:", v4, v9);

  return v9;
}

- (void)transferIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007AF8;
  v9[3] = &unk_100030900;
  v10 = a5;
  v8 = v10;
  -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:](self, "copyIdentifier:toDevice:allowLocalURL:completionHandler:", a3, a4, 0, v9);

}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 completionHandler:(id)a5
{
  -[GTURLAccessProvider copyIdentifier:toDevice:allowLocalURL:completionHandler:](self, "copyIdentifier:toDevice:allowLocalURL:completionHandler:", a3, a4, 1, a5);
}

- (void)copyIdentifier:(id)a3 toDevice:(id)a4 allowLocalURL:(BOOL)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  GTURLAccessProvider *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  GTURLAccessProvider *v19;
  void *v20;
  GTFileWriterServiceXPCProxy *v21;
  void *v22;
  id v23;
  void *v24;
  NSURLResourceKey v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  GTFileEntry *v41;
  GTFileEntry *v42;
  id v43;
  void *v44;
  id v45;
  GTFileEntry *v46;
  id v47;
  id v48;
  id v49;
  GTFileTransferOptions *v50;
  void *v51;
  NSString *deviceUDID;
  id *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSString *v59;
  GTFileWriterServiceXPCProxy *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  GTURLAccessProvider *v66;
  void *v67;
  void *v68;
  GTFileWriterServiceXPCProxy *v69;
  _BOOL4 v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  id obj;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  NSErrorUserInfoKey v92;
  void *v93;
  NSErrorUserInfoKey v94;
  void *v95;
  _BYTE v96[128];
  _QWORD v97[3];

  v70 = a5;
  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = v10;
  v13 = a6;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_10000EC74();
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredURLs, "objectForKeyedSubscript:", v9));
  if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG))
    sub_10000EC14();
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GTConnectionProvider connectionForDeviceUDID:](v11->_connectionProvider, "connectionForDeviceUDID:", v12));
  v71 = v15;
  if (v15)
  {
    v16 = v15;
    v17 = sub_100008298(v15, v12, v11->_connectionProvider);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v11;
    v67 = (void *)v18;
    v68 = v14;
    if (v18)
    {
      v20 = (void *)v18;
      v65 = v9;
      v66 = v19;
      v63 = v13;
      v64 = v12;
      v21 = [GTFileWriterServiceXPCProxy alloc];
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serviceProperties"));
      v69 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:](v21, "initWithConnection:remoteProperties:", v16, v22);

      if ((objc_msgSend(v14, "startAccessingSecurityScopedResource") & 1) == 0
        && os_log_type_enabled((os_log_t)v66->_log, OS_LOG_TYPE_DEBUG))
      {
        sub_10000EBB4();
      }
      v23 = v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v25 = NSURLIsDirectoryKey;
      v97[0] = NSURLIsDirectoryKey;
      v97[1] = NSURLFileSizeKey;
      v97[2] = NSURLIsSymbolicLinkKey;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v97, 3));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v23, v26, 0, &stru_100030B20));

      v73 = objc_alloc_init((Class)NSMutableArray);
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      obj = v27;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v89;
        v72 = *(_QWORD *)v89;
        do
        {
          v31 = 0;
          v74 = v29;
          do
          {
            if (*(_QWORD *)v89 != v30)
              objc_enumerationMutation(obj);
            v32 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)v31);
            v33 = objc_autoreleasePoolPush();
            v86 = 0;
            v87 = 0;
            objc_msgSend(v32, "getResourceValue:forKey:error:", &v87, v25, &v86);
            v34 = v87;
            v35 = v86;
            if ((objc_msgSend(v34, "BOOLValue") & 1) == 0)
            {
              v84 = 0;
              v85 = 0;
              objc_msgSend(v32, "getResourceValue:forKey:error:", &v85, NSURLIsSymbolicLinkKey, &v84);
              v36 = v85;
              v76 = v84;

              v37 = sub_10000E6B4(v32, v23);
              v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
              if (objc_msgSend(v36, "BOOLValue"))
              {
                v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "URLByResolvingSymlinksInPath"));
                v40 = sub_10000E6B4(v39, v23);
                v41 = (GTFileEntry *)objc_claimAutoreleasedReturnValue(v40);
                v42 = -[GTFileEntry initWithLink:destination:]([GTFileEntry alloc], "initWithLink:destination:", v38, v41);
                objc_msgSend(v73, "addObject:", v42);

              }
              else
              {
                v82 = 0;
                v83 = 0;
                objc_msgSend(v32, "getResourceValue:forKey:error:", &v83, NSURLFileSizeKey, &v82);
                v43 = v23;
                v44 = v83;
                v39 = v82;
                v45 = v44;
                v46 = [GTFileEntry alloc];
                v47 = objc_msgSend(v45, "unsignedIntegerValue");

                v48 = v47;
                v23 = v43;
                v25 = NSURLIsDirectoryKey;
                v41 = -[GTFileEntry initWithPath:fileSize:](v46, "initWithPath:fileSize:", v38, v48);
                objc_msgSend(v73, "addObject:", v41);
              }

              v35 = v76;
              v29 = v74;
              v30 = v72;
            }

            objc_autoreleasePoolPop(v33);
            v31 = (char *)v31 + 1;
          }
          while (v29 != v31);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v96, 16);
        }
        while (v29);
      }

      v49 = objc_msgSend(v73, "copy");
      objc_msgSend(v23, "stopAccessingSecurityScopedResource");
      v50 = objc_opt_new(GTFileTransferOptions);
      if (v70
        && (objc_opt_respondsToSelector(v69, "startTransfer:basePath:fromDevice:options:completionHandler:") & 1) != 0)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
        deviceUDID = v66->_deviceUDID;
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_100008354;
        v80[3] = &unk_100030900;
        v53 = &v81;
        v13 = v63;
        v81 = v63;
        -[GTFileWriterServiceXPCProxy startTransfer:basePath:fromDevice:options:completionHandler:](v69, "startTransfer:basePath:fromDevice:options:completionHandler:", v49, v51, deviceUDID, v50, v80);
      }
      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));
        v59 = v66->_deviceUDID;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 3221225472;
        v77[2] = sub_100008360;
        v77[3] = &unk_100030928;
        v53 = &v79;
        v13 = v63;
        v79 = v63;
        v78 = v23;
        -[GTFileWriterServiceXPCProxy initiateTransfer:basePath:fromDevice:options:completionHandler:](v69, "initiateTransfer:basePath:fromDevice:options:completionHandler:", v49, v58, v59, v50, v77);

        v51 = v78;
      }

      v12 = v64;
      v9 = v65;
      v60 = v69;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR))
        sub_10000EB54();
      v92 = NSLocalizedDescriptionKey;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing file writer service for device: %@"), v12));
      v93 = v61;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1));
      v60 = (GTFileWriterServiceXPCProxy *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.urlaccessprovider"), 1, v62));

      (*((void (**)(id, _QWORD, GTFileWriterServiceXPCProxy *))v13 + 2))(v13, 0, v60);
    }

    v57 = v67;
    v54 = v68;
  }
  else
  {
    v54 = v14;
    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_ERROR))
      sub_10000EAF4();
    v94 = NSLocalizedDescriptionKey;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing connection for device: %@"), v12));
    v95 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.urlaccessprovider"), 0, v56));

    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v57);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVendor, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_registeredURLs, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
