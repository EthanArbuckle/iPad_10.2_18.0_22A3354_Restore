@implementation _SWCTrackingDomainInfo

+ (void)_getTrackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "_queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86___SWCTrackingDomainInfo__getTrackingDomainInfoWithDomains_sources_completionHandler___block_invoke;
  v13[3] = &unk_1E547D430;
  v16 = a1;
  v17 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

+ (OS_dispatch_queue)_queue
{
  if (qword_1ED1B62B8 != -1)
    dispatch_once(&qword_1ED1B62B8, &__block_literal_global_77);
  return (OS_dispatch_queue *)(id)_MergedGlobals_6;
}

+ (id)_trackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  _SWCGetBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  if (v6)
  {
    objc_msgSend(v6, "URLForResource:withExtension:", CFSTR("trackingdomains"), CFSTR("json"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v37 = 0;
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v24, 1, &v37);
      v8 = v37;
      v22 = (void *)v7;
      if (v7)
      {
        v36 = v8;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v36);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v36;

        if (v9)
        {
          if (v26)
          {
            v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v26, "count"));
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v10 = v26;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v33;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v33 != v12)
                    objc_enumerationMutation(v10);
                  v14 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                  objc_msgSend(v9, "objectForKeyedSubscript:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v15)
                  {
                    objc_msgSend(a1, "_trackingDomainInfoWithDomain:JSONObject:expectedSources:", v14, v15, a4);
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "setObject:forKeyedSubscript:", v16, v14);

                  }
                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v11);
            }

          }
          else
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __65___SWCTrackingDomainInfo__trackingDomainInfoWithDomains_sources___block_invoke;
            v28[3] = &unk_1E547D408;
            v27 = v19;
            v29 = v27;
            v30 = a1;
            v31 = a4;
            objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v28);

          }
        }
        else
        {
          if (qword_1ED1B62C8 != -1)
            dispatch_once(&qword_1ED1B62C8, &__block_literal_global_83);
          v18 = qword_1ED1B62C0;
          if (os_log_type_enabled((os_log_t)qword_1ED1B62C0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v23;
            _os_log_error_impl(&dword_1A855A000, v18, OS_LOG_TYPE_ERROR, "Failed to read tracking domains JSON file: %@", buf, 0xCu);
          }
          v27 = 0;
        }

      }
      else
      {
        if (qword_1ED1B62C8 != -1)
          dispatch_once(&qword_1ED1B62C8, &__block_literal_global_83);
        v17 = qword_1ED1B62C0;
        if (os_log_type_enabled((os_log_t)qword_1ED1B62C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v8;
          _os_log_error_impl(&dword_1A855A000, v17, OS_LOG_TYPE_ERROR, "Failed to find tracking domains JSON file: %@", buf, 0xCu);
        }
        v27 = 0;
        v23 = v8;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  v20 = (void *)objc_msgSend(v27, "copy");
  return v20;
}

+ (void)getTrackingDomainInfoWithDomains:(id)a3 sources:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (qword_1ED1B62C8 != -1)
    dispatch_once(&qword_1ED1B62C8, &__block_literal_global_83);
  v9 = (id)qword_1ED1B62C0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = getpid();
    _os_log_impl(&dword_1A855A000, v9, OS_LOG_TYPE_INFO, "Process %llu is getting tracking domain info out-of-process", buf, 0xCu);
  }

  _SWCGetServerConnection();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78___SWCTrackingDomainInfo_getTrackingDomainInfoWithDomains_sources_completion___block_invoke;
  v17[3] = &unk_1E547D278;
  v12 = v8;
  v18 = v12;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __78___SWCTrackingDomainInfo_getTrackingDomainInfoWithDomains_sources_completion___block_invoke_2;
  v15[3] = &unk_1E547D3E0;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "getTrackingDomains:sources:completionHandler:", v7, a4, v15);

}

+ (NSDate)lastDatabaseUpdate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1667849750.0);
}

+ (id)new
{
  abort();
}

- (_SWCTrackingDomainInfo)init
{
  abort();
}

+ (id)trackingDomainInfoWithDomains:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  pid_t v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  if (qword_1ED1B62C8 != -1)
    dispatch_once(&qword_1ED1B62C8, &__block_literal_global_83);
  v4 = (id)qword_1ED1B62C0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v10 = getpid();
    *(_DWORD *)buf = 134217984;
    v19 = v10;
    _os_log_debug_impl(&dword_1A855A000, v4, OS_LOG_TYPE_DEBUG, "Process %llu is getting tracking domain info out-of-process", buf, 0xCu);
  }

  _SWCGetServerConnection();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56___SWCTrackingDomainInfo_trackingDomainInfoWithDomains___block_invoke_2;
  v11[3] = &unk_1E547D3B8;
  v11[4] = &v12;
  objc_msgSend(v6, "getTrackingDomains:sources:completionHandler:", v3, 3, v11);

  v7 = (void *)v13[5];
  if (!v7)
  {
    v13[5] = MEMORY[0x1E0C9AA70];
    v7 = (void *)v13[5];
  }
  v8 = v7;
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (NSString)ownerName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_JSONObject, "objectForKeyedSubscript:", CFSTR("n"));
}

- (NSString)ownerDisplayName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_JSONObject, "objectForKeyedSubscript:", CFSTR("dn"));
}

- (unint64_t)source
{
  void *v2;
  unint64_t v3;

  -[NSDictionary objectForKeyedSubscript:](self->_JSONObject, "objectForKeyedSubscript:", CFSTR("s"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (BOOL)canBlockRequest
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_JSONObject, "objectForKeyedSubscript:", CFSTR("dnbr"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue") ^ 1;

  return v3;
}

+ (id)_trackingDomainInfoWithDomain:(id)a3 JSONObject:(id)a4
{
  objc_msgSend(a1, "_trackingDomainInfoWithDomain:JSONObject:expectedSources:", a3, a4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_trackingDomainInfoWithDomain:(id)a3 JSONObject:(id)a4 expectedSources:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1A85D4B3C]();
  if (!_NSIsNSDictionary())
    goto LABEL_5;
  v10 = -[_SWCTrackingDomainInfo _initWithDomain:JSONObject:]([_SWCTrackingDomainInfo alloc], "_initWithDomain:JSONObject:", v7, v8);
  if ((objc_msgSend(v10, "source") & a5) == 0)
  {

LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = v10;
LABEL_6:
  objc_autoreleasePoolPop(v9);

  return v11;
}

+ (id)_trackingDomainInfoWithDomains:(id)a3
{
  objc_msgSend(a1, "_trackingDomainInfoWithDomains:sources:", a3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_initWithDomain:(id)a3 JSONObject:(id)a4
{
  id v6;
  id v7;
  _SWCTrackingDomainInfo *v8;
  uint64_t v9;
  NSString *domain;
  uint64_t v11;
  NSDictionary *JSONObject;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SWCTrackingDomainInfo;
  v8 = -[_SWCTrackingDomainInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    domain = v8->_domain;
    v8->_domain = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    JSONObject = v8->_JSONObject;
    v8->_JSONObject = (NSDictionary *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_JSONObject, CFSTR("JSONObject"));

}

- (_SWCTrackingDomainInfo)initWithCoder:(id)a3
{
  id v4;
  _SWCTrackingDomainInfo *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *domain;
  uint64_t v11;
  NSDictionary *JSONObject;
  objc_super v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SWCTrackingDomainInfo;
  v5 = -[_SWCTrackingDomainInfo init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

    objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v9 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v9;

    objc_msgSend(v4, "swc_decodeObjectOfClasses:forKey:", v8, CFSTR("JSONObject"));
    v11 = objc_claimAutoreleasedReturnValue();
    JSONObject = v5->_JSONObject;
    v5->_JSONObject = (NSDictionary *)v11;

  }
  return v5;
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_JSONObject, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
