@implementation SSDownloadAsset

- (SSDownloadAsset)initWithURLRequest:(id)a3
{
  SSDownloadAsset *v4;
  SSURLRequestProperties *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSDownloadAsset;
  v4 = -[SSEntity init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = -[SSURLRequestProperties initWithURLRequest:]([SSURLRequestProperties alloc], "initWithURLRequest:", a3);
    else
      v5 = 0;
    v4->_localProperties = v5;
  }
  return v4;
}

- (SSDownloadAsset)initWithURLRequestProperties:(id)a3
{
  SSDownloadAsset *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSDownloadAsset;
  v4 = -[SSEntity init](&v6, sel_init);
  if (v4)
    v4->_localProperties = (SSURLRequestProperties *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSDownloadAsset;
  -[SSEntity dealloc](&v3, sel_dealloc);
}

- (int64_t)bytesDownloaded
{
  int64_t result;

  result = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("0"));
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (int64_t)bytesUploaded
{
  int64_t result;

  result = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("9"));
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (int64_t)bytesUploadTotal
{
  int64_t result;

  result = -[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("A"));
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (NSArray)sinfs
{
  return (NSArray *)-[SSEntity valueForExternalProperty:](self, "valueForExternalProperty:", CFSTR("1"));
}

- (NSURLRequest)URLRequest
{
  id v2;
  void *v3;

  v2 = -[SSDownloadAsset _copyURLRequestProperties](self, "_copyURLRequestProperties");
  v3 = (void *)objc_msgSend(v2, "copyURLRequest");

  return (NSURLRequest *)v3;
}

+ (int64_t)_existsMessage
{
  return 53;
}

+ (int64_t)_getExternalValuesMessage
{
  return 26;
}

+ (int64_t)_getValueMessage
{
  return 10;
}

+ (int64_t)_setValuesMessage
{
  return 21;
}

- (void)_resetLocalIVars
{
  objc_super v3;

  self->_localProperties = 0;
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadAsset;
  -[SSEntity _resetLocalIVars](&v3, sel__resetLocalIVars);
}

- (SSURLRequestProperties)URLRequestProperties
{
  return (SSURLRequestProperties *)-[SSDownloadAsset _copyURLRequestProperties](self, "_copyURLRequestProperties");
}

- (int64_t)_legacyAssetType
{
  return self->_assetType;
}

- (SSURLRequestProperties)_localProperties
{
  return (SSURLRequestProperties *)(id)-[SSURLRequestProperties copy](self->_localProperties, "copy");
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSObject *dispatchQueue;
  _QWORD v6[6];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->super._pid);
  dispatchQueue = self->super._dispatchQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__SSDownloadAsset_copyXPCEncoding__block_invoke;
  v6[3] = &unk_1E47B8BB8;
  v6[4] = v3;
  v6[5] = self;
  dispatch_sync(dispatchQueue, v6);
  return v3;
}

void __34__SSDownloadAsset_copyXPCEncoding__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  int *v64;
  int *v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "1", *(__CFString **)(*(_QWORD *)(a1 + 40) + 32));
  SSXPCDictionarySetCFObject(*(void **)(a1 + 32), "2", *(__CFString **)(*(_QWORD *)(a1 + 40) + 72));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", CFSTR("d"));
  if (v2)
  {
    v3 = v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v3);
      v5 = objc_msgSend(v4, "URLByDeletingLastPathComponent");

      if (v5)
        goto LABEL_17;
    }
  }
  v6 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v6)
    v6 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    v8 = v7 | 2;
  else
    v8 = v7;
  if (os_log_type_enabled((os_log_t)objc_msgSend(v6, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 = v8;
  else
    v9 = v8 & 2;
  if (v9)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
    v68 = 134217984;
    v69 = v10;
    LODWORD(v66) = 12;
    v63 = &v68;
    v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v68, v66);
      free(v12);
      SSFileLog(v6, CFSTR("%@"), v14, v15, v16, v17, v18, v19, v13);
    }
  }
  v20 = SSGetFinalizedDirectoryForAssetType(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  if (v20)
  {
    v5 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
    if (v5)
    {
LABEL_17:
      v67 = 0;
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v63), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v67) & 1) == 0)
      {
        v21 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v21)
          v21 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v22 = objc_msgSend(v21, "shouldLog");
        if (objc_msgSend(v21, "shouldLogToDisk"))
          v23 = v22 | 2;
        else
          v23 = v22;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v24 = v23;
        else
          v24 = v23 & 2;
        if (v24)
        {
          v68 = 138543362;
          v69 = v67;
          LODWORD(v66) = 12;
          v64 = &v68;
          v25 = _os_log_send_and_compose_impl();
          if (v25)
          {
            v26 = (void *)v25;
            v27 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v68, v66);
            free(v26);
            SSFileLog(v21, CFSTR("%@"), v28, v29, v30, v31, v32, v33, v27);
          }
        }
        v67 = 0;
      }
      v34 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig", v64);
      if (!v34)
        v34 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v35 = objc_msgSend(v34, "shouldLog");
      if (objc_msgSend(v34, "shouldLogToDisk"))
        v36 = v35 | 2;
      else
        v36 = v35;
      if (os_log_type_enabled((os_log_t)objc_msgSend(v34, "OSLogObject"), OS_LOG_TYPE_INFO))
        v37 = v36;
      else
        v37 = v36 & 2;
      if (v37)
      {
        v68 = 138543362;
        v69 = v5;
        LODWORD(v66) = 12;
        v65 = &v68;
        v38 = _os_log_send_and_compose_impl();
        if (v38)
        {
          v39 = (void *)v38;
          v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v38, 4, &v68, v66);
          free(v39);
          SSFileLog(v34, CFSTR("%@"), v41, v42, v43, v44, v45, v46, v40);
        }
      }
      v47 = objc_alloc(MEMORY[0x1E0CB3910]);
      v48 = (void *)objc_msgSend(v47, "initWithURL:readonly:extensionClass:", v5, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80008]));
      v49 = objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v48, 1, &v67);
      if (v49)
      {
        SSXPCDictionarySetObject(*(_QWORD *)(a1 + 32), "3", v49);
      }
      else
      {
        v50 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v50)
          v50 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v51 = objc_msgSend(v50, "shouldLog", v65);
        if (objc_msgSend(v50, "shouldLogToDisk"))
          v52 = v51 | 2;
        else
          v52 = v51;
        if (os_log_type_enabled((os_log_t)objc_msgSend(v50, "OSLogObject"), OS_LOG_TYPE_ERROR))
          v53 = v52;
        else
          v53 = v52 & 2;
        if (v53)
        {
          v68 = 138543362;
          v69 = v67;
          LODWORD(v66) = 12;
          v54 = _os_log_send_and_compose_impl();
          if (v54)
          {
            v55 = (void *)v54;
            v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v54, 4, &v68, v66);
            free(v55);
            SSFileLog(v50, CFSTR("%@"), v57, v58, v59, v60, v61, v62, v56);
          }
        }
        v67 = 0;
      }

    }
  }
}

+ (id)assetWithURL:(id)a3 type:(int64_t)a4
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURLRequest:", objc_msgSend(MEMORY[0x1E0CB39E0], "requestWithURL:", a3));
  v5[8] = a4;
  return v5;
}

- (SSDownloadAsset)initWithURLRequest:(id)a3 type:(int64_t)a4
{
  SSDownloadAsset *result;

  result = -[SSDownloadAsset initWithURLRequest:](self, "initWithURLRequest:", a3);
  if (result)
    result->_assetType = a4;
  return result;
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (NSString)downloadFileName
{
  return (NSString *)objc_msgSend(-[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("4")), "lastPathComponent");
}

- (NSString)downloadPath
{
  return (NSString *)-[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("4"));
}

- (NSString)finalizedPath
{
  return 0;
}

- (int64_t)fileSize
{
  int64_t result;

  result = -[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("3"));
  if (result)
    return objc_msgSend((id)result, "longLongValue");
  return result;
}

- (BOOL)isExternal
{
  return objc_msgSend(-[SSEntity valueForProperty:](self, "valueForProperty:", CFSTR("9")), "BOOLValue");
}

- (id)_copyURLRequestProperties
{
  NSObject *dispatchQueue;
  void *v4;
  SSMutableURLRequestProperties *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t *v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[11];

  v24[10] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  dispatchQueue = self->super._dispatchQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__SSDownloadAsset__copyURLRequestProperties__block_invoke;
  v12[3] = &unk_1E47B8DF8;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(dispatchQueue, v12);
  v4 = (void *)v14[5];
  if (!v4)
  {
    v24[0] = CFSTR("5");
    v24[1] = CFSTR("6");
    v24[2] = CFSTR("7");
    v24[3] = CFSTR("8");
    v24[4] = CFSTR("9");
    v24[5] = CFSTR("a");
    v24[6] = CFSTR("b");
    v24[7] = CFSTR("c");
    v24[8] = CFSTR("3");
    v24[9] = CFSTR("n");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    -[SSEntity getValues:forProperties:count:](self, "getValues:forProperties:count:", &v19, v24, 10);
    if (*((_QWORD *)&v22 + 1))
    {
      v5 = objc_alloc_init(SSMutableURLRequestProperties);
      -[SSMutableURLRequestProperties setAllowedRetryCount:](v5, "setAllowedRetryCount:", objc_msgSend((id)v19, "integerValue"));
      -[SSMutableURLRequestProperties setHTTPBody:](v5, "setHTTPBody:", *((_QWORD *)&v19 + 1));
      -[SSMutableURLRequestProperties setITunesStoreRequest:](v5, "setITunesStoreRequest:", objc_msgSend((id)v21, "BOOLValue") ^ 1);
      objc_msgSend((id)v22, "doubleValue");
      -[SSMutableURLRequestProperties setTimeoutInterval:](v5, "setTimeoutInterval:");
      v6 = *((_QWORD *)&v20 + 1);
      if (objc_msgSend(*((id *)&v20 + 1), "length"))
        -[SSMutableURLRequestProperties setHTTPMethod:](v5, "setHTTPMethod:", v6);
      if ((_QWORD)v20)
        -[SSMutableURLRequestProperties setHTTPHeaders:](v5, "setHTTPHeaders:", objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", (_QWORD)v20, 0, 0, 0));
      if (*((_QWORD *)&v23 + 1))
      {
        v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        if (objc_msgSend(v7, "fileExistsAtPath:", *((_QWORD *)&v23 + 1)))
        {
          v8 = objc_alloc(MEMORY[0x1E0C99DB0]);
          v9 = (void *)objc_msgSend(v8, "initWithFileAtPath:", *((_QWORD *)&v23 + 1));
          -[SSMutableURLRequestProperties setHTTPBodyStream:](v5, "setHTTPBodyStream:", v9);

        }
      }
      if (*((_QWORD *)&v21 + 1))
        -[SSMutableURLRequestProperties setRequestParameters:](v5, "setRequestParameters:", objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", *((_QWORD *)&v21 + 1), 0, 0, 0));
      if (*((_QWORD *)&v22 + 1))
        -[SSMutableURLRequestProperties setURL:](v5, "setURL:", objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:"));
      if ((_QWORD)v23)
        -[SSMutableURLRequestProperties setExpectedContentLength:](v5, "setExpectedContentLength:", objc_msgSend((id)v23, "longLongValue"));
      v10 = v14;
      v14[5] = (uint64_t)v5;
    }
    else
    {
      v10 = v14;
    }
    v4 = (void *)v10[5];
  }
  _Block_object_dispose(&v13, 8);
  return v4;
}

id __44__SSDownloadAsset__copyURLRequestProperties__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

@end
