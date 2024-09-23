@implementation WFCloudKitWebServiceRequest

- (WFCloudKitWebServiceRequest)initWithContainer:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  WFCloudKitWebServiceRequest *v9;
  WFCloudKitWebServiceRequest *v10;
  WFCloudKitWebServiceRequest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFCloudKitWebServiceRequest;
  v9 = -[WFCloudKitWebServiceRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_database, a4);
    v11 = v10;
  }

  return v10;
}

- (id)fetchRecordsWithItemType:(Class)a3 filter:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  WFCloudKitWebServiceRequest *v30;
  id v31;
  id v32;
  Class v33;
  _QWORD v34[3];
  _QWORD v35[3];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitWebServiceRequest.m"), 82, CFSTR("itemType passed to WFCloudKitServiceRequest must conform to WFCloudKitItem protocol"));

  }
  v14 = (void *)objc_opt_new();
  -[WFCloudKitWebServiceRequest urlForType:parameters:](self, "urlForType:parameters:", 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitWebServiceRequest queryWithItemType:filter:](self, "queryWithItemType:filter:", a3, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  getWFCloudKitWSLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]";
    v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_1C15B3000, v17, OS_LOG_TYPE_INFO, "%s Querying CloudKit: %@", buf, 0x16u);
  }

  v34[0] = CFSTR("resultsLimit");
  v34[1] = CFSTR("zoneID");
  v35[0] = &unk_1E7B8B8D8;
  v35[1] = &unk_1E7B8DEA0;
  v34[2] = CFSTR("queryString");
  v35[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke;
  v29 = &unk_1E7AF3C80;
  v32 = v11;
  v33 = a3;
  v30 = self;
  v19 = v14;
  v31 = v19;
  v20 = v11;
  -[WFCloudKitWebServiceRequest postJSON:toURL:cacheKey:completionHandler:](self, "postJSON:toURL:cacheKey:completionHandler:", v18, v15, v12, &v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setDataTask:", v21, v26, v27, v28, v29, v30);
  v22 = v31;
  v23 = v19;

  return v23;
}

- (id)fetchProxiedRecordWithIdentifier:(id)a3 possibleItemTypes:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t);
  void *v25;
  id v26;
  WFCloudKitWebServiceRequest *v27;
  id v28;
  id v29;
  SEL v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  v31 = CFSTR("WFCloudKitURLParameterIdentifier");
  v32[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitWebServiceRequest urlForType:parameters:](self, "urlForType:parameters:", 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke;
  v25 = &unk_1E7AF3CA8;
  v29 = v10;
  v30 = a2;
  v26 = v9;
  v27 = self;
  v15 = v12;
  v28 = v15;
  v16 = v9;
  v17 = v10;
  -[WFCloudKitWebServiceRequest getJSONFromURL:headers:completionHandler:](self, "getJSONFromURL:headers:completionHandler:", v14, 0, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDataTask:", v18, v22, v23, v24, v25);

  v19 = v28;
  v20 = v15;

  return v20;
}

- (id)queryWithItemType:(Class)a3 filter:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[objc_class recordType](a3, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.*"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringRepresentationWithRecordType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = CFSTR("SELECT");
  v12[1] = v7;
  v12[2] = CFSTR("FROM");
  v12[3] = v6;
  v12[4] = CFSTR("WHERE");
  v12[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(" "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)postJSON:(id)a3 toURL:(id)a4 cacheKey:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  void (**v22)(id, _QWORD, id);
  id v23;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, id))a6;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 0, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;
  if (v13)
  {
    v11[2](v11, 0, v13);
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v15, "setHTTPBody:", v12);
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-Cache-Key"));
    objc_msgSend(MEMORY[0x1E0CB39F0], "wf_sharedSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __73__WFCloudKitWebServiceRequest_postJSON_toURL_cacheKey_completionHandler___block_invoke;
    v21 = &unk_1E7AF3CD0;
    v22 = v11;
    objc_msgSend(v16, "dataTaskWithRequest:completionHandler:", v15, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "resume", v18, v19, v20, v21);
  }

  return v14;
}

- (id)getJSONFromURL:(id)a3 completionHandler:(id)a4
{
  return -[WFCloudKitWebServiceRequest getJSONFromURL:headers:completionHandler:](self, "getJSONFromURL:headers:completionHandler:", a3, 0, a4);
}

- (id)getJSONFromURL:(id)a3 headers:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB37A8];
  v9 = a4;
  objc_msgSend(v8, "requestWithURL:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("GET"));
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke;
  v22[3] = &unk_1E7AF4688;
  v23 = v10;
  v12 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v22);

  objc_msgSend(MEMORY[0x1E0CB39F0], "wf_sharedSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  v18 = 3221225472;
  v19 = __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke_2;
  v20 = &unk_1E7AF3CD0;
  v21 = v7;
  v14 = v7;
  objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v12, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "resume", v17, v18, v19, v20);
  return v15;
}

- (id)databaseName
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;

  -[WFCloudKitWebServiceRequest database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "databaseScope");

  v4 = CFSTR("public");
  if (v3 == 3)
    v4 = CFSTR("shared");
  if (v3 == 2)
    return CFSTR("private");
  else
    return (id)v4;
}

- (unint64_t)webServiceForRequestType:(unint64_t)a3
{
  return a3 != 0;
}

- (id)pathComponentsForType:(unint64_t)a3 parameters:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("WFCloudKitURLParameterIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitWebServiceRequest.m"), 318, CFSTR("Missing %@ for proxied record lookup"), CFSTR("WFCloudKitURLParameterIdentifier"));

    }
    v12[0] = CFSTR("records");
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &unk_1E7B8DA48;
  }
  return v9;
}

- (id)cloudKitEnvironment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wf_entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.developer.icloud-container-environment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = CFSTR("development");
  -[__CFString lowercaseString](v8, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)cloudKitAPIToken
{
  void *v2;
  void *v3;
  int v4;

  -[WFCloudKitWebServiceRequest container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D142F0]);

  if (v4)
    return CFSTR("7488b9154a1a645448ca0b434fe1e0a63f312198ae1edf687920e274850d536c");
  else
    return CFSTR("8ab06078c4a6b3fa9dfb17508d0ca33174297a2382da5b17b272c5546780d68d");
}

- (id)urlForType:(unint64_t)a3 parameters:(id)a4
{
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  -[WFCloudKitWebServiceRequest pathComponentsForType:parameters:](self, "pathComponentsForType:parameters:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFCloudKitWebServiceRequest webServiceForRequestType:](self, "webServiceForRequestType:", a3);
  if (v8 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringForKey:", CFSTR("WFWebServiceProxyDevelopmentHostnameKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_1E7B8DA60, "arrayByAddingObjectsFromArray:", v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v18 = 0;
    v19 = CFSTR("https://www.icloud.com");
    goto LABEL_5;
  }
  if (!v8)
  {
    v30[0] = CFSTR("database");
    v30[1] = CFSTR("1");
    -[WFCloudKitWebServiceRequest container](self, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v10;
    -[WFCloudKitWebServiceRequest cloudKitEnvironment](self, "cloudKitEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v11;
    -[WFCloudKitWebServiceRequest databaseName](self, "databaseName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v7);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB39D8];
    -[WFCloudKitWebServiceRequest cloudKitAPIToken](self, "cloudKitAPIToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queryItemWithName:value:", CFSTR("ckAPIToken"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = CFSTR("https://api.apple-cloudkit.com");
LABEL_5:
    v7 = (void *)v14;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitWebServiceRequest.m"), 388, CFSTR("baseURL not provided for request type"));

  v18 = 0;
  v19 = 0;
LABEL_7:
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v19);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("/"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/"), "stringByAppendingString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPath:", v25);

  objc_msgSend(v23, "setQueryItems:", v18);
  objc_msgSend(v23, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitWebServiceRequest.m"), 394, CFSTR("Could not create URL for web service request of type: %lu"), a3);

  }
  return v26;
}

- (id)recordsFromQueryResponse:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("results"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)extractRecordDictFromRecordIfNecessary:(id)a3 recordType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("record"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

- (void)parseRecord:(id)a3 intoItem:(id)a4 allKeys:(BOOL)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;

  v50 = a4;
  v7 = (void *)MEMORY[0x1E0CB3828];
  v8 = a3;
  objc_msgSend(v7, "currentQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "recordType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCloudKitWebServiceRequest extractRecordDictFromRecordIfNecessary:recordType:](self, "extractRecordDictFromRecordIfNecessary:recordType:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("fields"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  WFEnforceClass(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = v50;
    objc_msgSend((id)objc_opt_class(), "properties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __60__WFCloudKitWebServiceRequest_parseRecord_intoItem_allKeys___block_invoke;
    v51[3] = &unk_1E7AF3D00;
    v17 = v16;
    v52 = v17;
    v18 = v15;
    v53 = v18;
    v54 = v9;
    v55 = v18;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v51);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("recordName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    WFEnforceClass(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v21);
    objc_msgSend(v18, "willChangeValueForKey:", CFSTR("identifier"));
    objc_msgSend(v18, "setValue:forKey:", v22, CFSTR("identifier"));
    objc_msgSend(v18, "didChangeValueForKey:", CFSTR("identifier"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v44 = v22;
      v45 = v21;
      v46 = v17;
      v47 = v10;
      v48 = v9;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("created"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_class();
      WFEnforceClass(v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("modified"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_opt_class();
      WFEnforceClass(v26, v27);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v25;
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_opt_class();
      WFEnforceClass(v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v32 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v31, "doubleValue");
        objc_msgSend(v32, "dateWithTimeIntervalSince1970:", v33 / 1000.0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_opt_class();
      WFEnforceClass(v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        v38 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v37, "doubleValue");
        objc_msgSend(v38, "dateWithTimeIntervalSince1970:", v39 / 1000.0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = 0;
      }
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("userRecordName"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_opt_class();
      WFEnforceClass(v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "setCreatedAt:modifiedAt:createdBy:", v34, v40, v43);
      v10 = v47;
      v9 = v48;
      v21 = v45;
      v17 = v46;
      v22 = v44;
    }

  }
}

- (CKContainer)container
{
  return self->_container;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

void __60__WFCloudKitWebServiceRequest_parseRecord_intoItem_allKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  WFCloudKitWebServiceAssetDownloadOperation *v19;
  uint64_t v20;
  void *v21;
  WFCloudKitWebServiceAssetDownloadOperation *v22;
  id v23;

  v23 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("ASSETID"))
      && (objc_msgSend(v5, "isIgnoredByDefault") & 1) == 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("downloadURL"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      WFEnforceClass(v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = [WFCloudKitWebServiceAssetDownloadOperation alloc];
        v20 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[WFCloudKitWebServiceAssetDownloadOperation initWithAssetURL:item:key:](v19, "initWithAssetURL:item:key:", v18, v20, v21);

        objc_msgSend(*(id *)(a1 + 48), "addOperation:", v22);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_13;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_13;
      if (!v6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v8 = *(void **)(a1 + 56);
      objc_msgSend(v5, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "willChangeValueForKey:", v9);

      v10 = *(void **)(a1 + 56);
      objc_msgSend(v5, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v6, v11);

      v12 = *(void **)(a1 + 56);
      objc_msgSend(v5, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didChangeValueForKey:", v13);
    }

    goto LABEL_13;
  }
LABEL_15:

}

uint64_t __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", a3, a2);
}

void __72__WFCloudKitWebServiceRequest_getJSONFromURL_headers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v8 && objc_msgSend(v11, "statusCode") == 200)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v8)
    {
      v13 = 0;
      v14 = v8;
    }
    else
    {
      v13 = v12;
      v14 = 0;
    }
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v13, v14);
    goto LABEL_15;
  }
  objc_msgSend(v8, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB32E8];
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v17 = objc_msgSend(v8, "code");

    if (v17 == -999)
    {
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v12);
LABEL_15:

      goto LABEL_16;
    }
  }
  else
  {

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v16, objc_msgSend(v11, "statusCode"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:

}

void __73__WFCloudKitWebServiceRequest_postJSON_toURL_cacheKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v7 = a2;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class();
  WFEnforceClass(v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v8 && objc_msgSend(v11, "statusCode") == 200)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    if (v8)
    {
      v13 = 0;
      v14 = v8;
    }
    else
    {
      v13 = v12;
      v14 = 0;
    }
    (*(void (**)(_QWORD, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v13, v14);
    goto LABEL_15;
  }
  objc_msgSend(v8, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CB32E8];
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {
    v17 = objc_msgSend(v8, "code");

    if (v17 == -999)
    {
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v12);
LABEL_15:

      goto LABEL_16;
    }
  }
  else
  {

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v16, objc_msgSend(v11, "statusCode"), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_16:

}

void __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v25 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recordType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v33;
LABEL_5:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EF72DF08) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("WFCloudKitWebServiceRequest.m"), 152, CFSTR("Found type in possibleItemTypes that doesn't conform to WFCloudKitItem protocol"));

        }
        objc_msgSend(v15, "recordType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if ((v17 & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v12)
            goto LABEL_5;
          goto LABEL_13;
        }
      }
      v19 = objc_alloc_init((Class)v15);

      if (!v19)
        goto LABEL_16;
      dispatch_get_global_queue(0, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_213;
      block[3] = &unk_1E7AF5EF8;
      v21 = *(id *)(a1 + 48);
      v22 = *(_QWORD *)(a1 + 40);
      v27 = v21;
      v28 = v22;
      v6 = v25;
      v29 = v25;
      v30 = v19;
      v31 = *(id *)(a1 + 56);
      v23 = v19;
      dispatch_async(v20, block);

    }
    else
    {
LABEL_13:

LABEL_16:
      getWFCloudKitWSLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      v6 = v25;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[WFCloudKitWebServiceRequest fetchProxiedRecordWithIdentifier:possibleItemTypes:completionHandler:]_block_invoke";
        v38 = 2112;
        v39 = v25;
        _os_log_impl(&dword_1C15B3000, v24, OS_LOG_TYPE_ERROR, "%s Unable to find matching record type. Received response: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 1, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_213(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_2;
  v9[3] = &unk_1E7AF55D0;
  v4 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v2, "addOperationWithBlock:", v9);

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "waitUntilAllOperationsAreFinished");

  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_3;
  block[3] = &unk_1E7AF76F0;
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseRecord:intoItem:allKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);
}

uint64_t __100__WFCloudKitWebServiceRequest_fetchProxiedRecordWithIdentifier_possibleItemTypes_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    getWFCloudKitWSLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]_block_invoke";
      v25 = 2114;
      v26 = (uint64_t)v6;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_ERROR, "%s Unable to fetch records. Error: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "recordsFromQueryResponse:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    getWFCloudKitWSLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]_block_invoke";
        v25 = 2048;
        v26 = objc_msgSend(v8, "count");
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_INFO, "%s Received %lu records from query.", buf, 0x16u);
      }

      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_202;
      block[3] = &unk_1E7AF3C58;
      v12 = v8;
      v13 = *(_QWORD *)(a1 + 56);
      v18 = v12;
      v22 = v13;
      v14 = *(id *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 32);
      v19 = v14;
      v20 = v15;
      v21 = *(id *)(a1 + 48);
      dispatch_async(v11, block);

      v16 = v18;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[WFCloudKitWebServiceRequest fetchRecordsWithItemType:filter:cacheKey:completionHandler:]_block_invoke";
        v25 = 2112;
        v26 = (uint64_t)v5;
        _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_ERROR, "%s Unable to fetch records. Received response: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFCloudKitErrorDomain"), 1, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_202(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_2;
  v13[3] = &unk_1E7AF3C30;
  v16 = *(_QWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v14 = v4;
  v15 = v5;
  objc_msgSend(v3, "if_map:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "waitUntilAllOperationsAreFinished");

  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_4;
  block[3] = &unk_1E7AF76F0;
  v8 = *(id *)(a1 + 56);
  v11 = v6;
  v12 = v8;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

id __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_alloc_init(*(Class *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_3;
  v11[3] = &unk_1E7AF55D0;
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v3;
  v6 = v4;
  v13 = v6;
  v7 = v3;
  objc_msgSend(v5, "addOperationWithBlock:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

uint64_t __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __90__WFCloudKitWebServiceRequest_fetchRecordsWithItemType_filter_cacheKey_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseRecord:intoItem:allKeys:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

@end
