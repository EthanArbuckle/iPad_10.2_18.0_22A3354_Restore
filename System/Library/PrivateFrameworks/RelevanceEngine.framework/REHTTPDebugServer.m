@implementation REHTTPDebugServer

- (REHTTPDebugServer)initWithPort:(unsigned __int16)a3 dataSource:(id)a4
{
  uint64_t v4;
  id v6;
  REHTTPDebugServer *v7;
  REHTTPDebugServer *v8;
  id v9;
  id WeakRetained;
  char v11;
  void *v12;
  void *v13;
  REHTTPFileCache *v14;
  REHTTPFileCache *cache;
  REHTMLPageBuilder *v16;
  REHTMLPageBuilder *pageBuilder;
  uint64_t v18;
  REHTTPServer *v19;
  REHTTPServer *server;
  objc_super v22;

  v4 = a3;
  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)REHTTPDebugServer;
  v7 = -[REHTTPDebugServer init](&v22, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_dataSource, v6);
    *(_BYTE *)&v8->_dataSourceCallbacks = *(_BYTE *)&v8->_dataSourceCallbacks & 0xFE | objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v8->_dataSource);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 2;
    else
      v11 = 0;
    *(_BYTE *)&v8->_dataSourceCallbacks = *(_BYTE *)&v8->_dataSourceCallbacks & 0xFD | v11;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/RelevanceEngine/Debugger/RelevanceEngineDebuggerServer.bundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pathForResource:ofType:", CFSTR("Debugger"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[REHTTPFileCache initWithRootDirectory:]([REHTTPFileCache alloc], "initWithRootDirectory:", v13);
    cache = v8->_cache;
    v8->_cache = v14;

    v16 = objc_alloc_init(REHTMLPageBuilder);
    pageBuilder = v8->_pageBuilder;
    v8->_pageBuilder = v16;

    -[REHTMLPageBuilder setStylesheets:](v8->_pageBuilder, "setStylesheets:", &unk_24CFC1CD0);
    -[REHTMLPageBuilder setLoadingScripts:](v8->_pageBuilder, "setLoadingScripts:", &unk_24CFC1CE8);
    -[REHTMLPageBuilder setPageDescription:](v8->_pageBuilder, "setPageDescription:", CFSTR("A tool to debug issues and interacting with Relevance Engine."));
    v18 = MEMORY[0x24BDBD1A8];
    -[REHTTPDebugServer setAvailableEngines:](v8, "setAvailableEngines:", MEMORY[0x24BDBD1A8]);
    -[REHTTPDebugServer _loadAvailableEngines:](v8, "_loadAvailableEngines:", v18);
    v19 = -[REHTTPServer initWithPort:delegate:]([REHTTPServer alloc], "initWithPort:delegate:", v4, v8);
    server = v8->_server;
    v8->_server = v19;

  }
  return v8;
}

- (unsigned)port
{
  return -[REHTTPServer port](self->_server, "port");
}

- (void)_loadAvailableEngines:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  REHTMLPageNavigationLink *v20;
  REHTMLPageNavigationLink *v21;
  void *v22;
  void *v23;
  REHTMLPageNavigationLink *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  REHTMLPageNavigationLink *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  REHTMLPageNavigationLink *v35;
  void *v36;
  void *v37;
  REHTMLPageNavigationLink *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  REHTMLPageNavigationLink *v55;
  void *v56;
  REHTMLPageNavigationLink *v57;
  REHTMLPageNavigationLink *v58;
  void *v59;
  void *v60;
  id v61;
  id obj;
  id obja;
  REHTTPDebugServer *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[REHTTPDebugServer setAvailableEngines:](self, "setAvailableEngines:", v4);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[REHTTPDebugServer _pageMap](self, "_pageMap");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  v64 = self;
  v59 = v5;
  v61 = v4;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v74;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v74 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i);
        -[REHTTPDebugServer _pageMap](self, "_pageMap", v59);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "attributes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("re-display-name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = v14;
        }
        else
        {
          -[REHTTPDebugServer _pageTitle](self, "_pageTitle");
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;

        -[REHTTPDebugServer _pageTitle](self, "_pageTitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqualToString:", v18);

        if (v19)
        {
          v21 = [REHTMLPageNavigationLink alloc];
          objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[REHTMLPageNavigationLink initWithLocation:title:](v21, "initWithLocation:title:", v22, v17);

          v5 = v59;
          objc_msgSend(v59, "addObject:", v20);

          self = v64;
          goto LABEL_14;
        }

        self = v64;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      if (v7)
        continue;
      break;
    }
    v20 = 0;
    v5 = v59;
LABEL_14:
    v4 = v61;
  }
  else
  {
    v20 = 0;
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [REHTMLPageNavigationLink alloc];
    -[REHTTPDebugServer processName](self, "processName");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_24CF92178;
    v28 = -[REHTMLPageNavigationLink initWithLocation:title:](v24, "initWithLocation:title:", &stru_24CF92178, v27, v59);
    objc_msgSend(v5, "addObject:", v28);

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v29 = v23;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    v61 = v29;
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v70;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v70 != v32)
            objc_enumerationMutation(v61);
          v34 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
          v35 = [REHTMLPageNavigationLink alloc];
          objc_msgSend(v34, "stringByAppendingPathComponent:", CFSTR("/"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[REHTMLPageNavigationLink initWithLocation:title:](v35, "initWithLocation:title:", v37, v34);

          objc_msgSend(v5, "addObject:", v38);
        }
        v29 = v61;
        v31 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v31);
    }

    self = v64;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v59);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[REHTTPDebugServer _pageMap](self, "_pageMap");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v66 != v42)
          objc_enumerationMutation(obja);
        v44 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
        if (v20)
        {
          -[REHTMLPageNavigationLink location](v20, "location");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "lastPathComponent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v44, "isEqualToString:", v46);

          if ((v47 & 1) != 0)
            continue;
        }
        -[REHTTPDebugServer _pageMap](v64, "_pageMap");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v44);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v49, "attributes");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("re-display-name"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
        {
          v53 = v51;
        }
        else
        {
          -[REHTTPDebugServer _pageTitle](v64, "_pageTitle");
          v53 = (id)objc_claimAutoreleasedReturnValue();
        }
        v54 = v53;

        v55 = [REHTMLPageNavigationLink alloc];
        objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v44);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[REHTMLPageNavigationLink initWithLocation:title:](v55, "initWithLocation:title:", v56, v54);

        objc_msgSend(v39, "addObject:", v57);
      }
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v41);
  }

  if (objc_msgSend(v39, "count"))
  {
    objc_msgSend(v39, "sortUsingComparator:", &__block_literal_global_27_0);
    v58 = -[REHTMLPageNavigationLink initWithLocation:title:]([REHTMLPageNavigationLink alloc], "initWithLocation:title:", &stru_24CF92178, &stru_24CF92178);
    objc_msgSend(v60, "addObject:", v58);

    objc_msgSend(v60, "addObjectsFromArray:", v39);
  }
  -[REHTMLPageBuilder setLinks:](v64->_pageBuilder, "setLinks:", v60);

}

uint64_t __43__REHTTPDebugServer__loadAvailableEngines___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 1);
}

uint64_t __43__REHTTPDebugServer__loadAvailableEngines___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

- (id)_createContentItemWithTitle:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[REHTMLElement div](REHTMLElement, "div");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "elementByAddingClass:", CFSTR("section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addChild:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  +[REHTMLElement div](REHTMLElement, "div");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "elementByAddingClass:", CFSTR("content-item"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v12, "addChild:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  if (v6)
  {
    objc_msgSend(v12, "addChild:", v6);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }

  return v12;
}

- (id)_create404Element
{
  void *v3;
  void *v4;
  REHTMLPageBuilder *pageBuilder;
  void *v6;
  void *v7;

  +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", CFSTR("<br><div style=\"display: inline-block; text-align: center; font-size: 300%; width: 100%;\">👻</div><br><br>"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPDebugServer _createContentItemWithTitle:content:](self, "_createContentItemWithTitle:content:", CFSTR("Page not found — 404"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pageBuilder = self->_pageBuilder;
  -[REHTTPDebugServer _pageTitle](self, "_pageTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLPageBuilder pageWithTitle:content:backLocation:](pageBuilder, "pageWithTitle:content:backLocation:", v6, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleFileRequest:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v8 = WeakRetained;
    if (WeakRetained && (*(_BYTE *)&self->_dataSourceCallbacks & 2) != 0)
      objc_msgSend(WeakRetained, "debugServer:processName:handleFileRequest:completion:", self, self->_processName, v9, v6);
    else
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);

  }
}

- (void)_availableEngineInstancesForProcess:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v8 = WeakRetained;
    if (WeakRetained && (*(_BYTE *)&self->_dataSourceCallbacks & 1) != 0)
      objc_msgSend(WeakRetained, "debugServer:availableEngineInstancesForProcess:completion:", self, v9, v6);
    else
      v6[2](v6, MEMORY[0x24BDBD1A8]);

  }
}

- (void)httpServer:(id)a3 handleRequest:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __CFString *v17;
  id v18;
  id v19;
  void *v20;
  const char *v21;
  const char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *, void *);
  void *v33;
  __CFString *v34;
  id v35;
  REHTTPDebugServer *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1808];
  objc_msgSend(v7, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsWithURL:resolvingAgainstBaseURL:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setQuery:", 0);
  objc_msgSend(v11, "path");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (__CFString *)v12;
    objc_msgSend(v7, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasDirectoryPath");

    if (v15)
    {
      -[__CFString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", CFSTR("index.html"));
      v16 = objc_claimAutoreleasedReturnValue();

      v13 = (__CFString *)v16;
    }
  }
  else
  {
    v13 = CFSTR("index.html");
  }
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __57__REHTTPDebugServer_httpServer_handleRequest_completion___block_invoke;
  v33 = &unk_24CF8D420;
  v17 = v13;
  v34 = v17;
  v18 = v7;
  v35 = v18;
  v36 = self;
  v19 = v8;
  v37 = v19;
  v20 = (void *)MEMORY[0x2199B2434](&v30);
  v21 = -[REHTTPDebugServer _serverMethod:](self, "_serverMethod:", v17, v30, v31, v32, v33);
  if (v21)
  {
    v22 = v21;
    RELogForDomain(21);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v24;
      _os_log_impl(&dword_2132F7000, v23, OS_LOG_TYPE_INFO, "Handling server request with method %@", buf, 0xCu);

    }
    v25 = (void *)MEMORY[0x2199B2434](v19);
    -[REHTTPDebugServer performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", v22, v18, v25);

  }
  else if (-[REHTTPDebugServer _isReservedFilePath:](self, "_isReservedFilePath:", v17))
  {
    -[REHTTPDebugServer _loadPageForReservedPath:completion:](self, "_loadPageForReservedPath:completion:", v17, v20);
  }
  else
  {
    -[REHTTPFileCache loadFileAtPath:](self->_cache, "loadFileAtPath:", v17);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "url");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "path");
    v28 = objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v18, "responseWithStatusCode:", 200);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBody:", v26);
      (*((void (**)(id, void *))v19 + 2))(v19, v29);

    }
    else
    {
      -[REHTTPDebugServer _handleFileRequest:completion:](self, "_handleFileRequest:completion:", v28, v20);
    }

    v17 = (__CFString *)v28;
  }

}

void __57__REHTTPDebugServer_httpServer_handleRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "responseWithStatusCode:", 200);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "pageWithTitle:content:backLocation:", v5, v10, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBody:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "responseWithStatusCode:", 404);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_create404Element");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodedData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBody:", v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (id)_pageMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__REHTTPDebugServer__pageMap__block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  if (_pageMap_onceToken != -1)
    dispatch_once(&_pageMap_onceToken, block);
  return (id)_pageMap_PageMap;
}

void __29__REHTTPDebugServer__pageMap__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("index.html");
  objc_msgSend(*(id *)(a1 + 32), "_landingPage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("about.html");
  objc_msgSend(*(id *)(a1 + 32), "_aboutPage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("engines.html");
  objc_msgSend(*(id *)(a1 + 32), "_enginesPage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_pageMap_PageMap;
  _pageMap_PageMap = v5;

}

- (SEL)_serverMethod:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  const char *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__REHTTPDebugServer__serverMethod___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  v3 = _serverMethod__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_serverMethod__onceToken, block);
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (const char *)objc_msgSend((id)_serverMethod__MethodMap, "objectForKey:", v5);
  return v6;
}

void __35__REHTTPDebugServer__serverMethod___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, 256);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_engineList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", sel__loadEngineListWithRequest_completion_, v3);

  v4 = (void *)_serverMethod__MethodMap;
  _serverMethod__MethodMap = (uint64_t)v2;

}

- (BOOL)_isReservedFilePath:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__REHTTPDebugServer__isReservedFilePath___block_invoke;
  block[3] = &unk_24CF8AAF0;
  block[4] = self;
  v3 = _isReservedFilePath__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_isReservedFilePath__onceToken, block);
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend((id)_isReservedFilePath__Paths, "containsObject:", v5);
  return v6;
}

void __41__REHTTPDebugServer__isReservedFilePath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_pageMap", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "_landPageFileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v9);

  v10 = objc_msgSend(v2, "copy");
  v11 = (void *)_isReservedFilePath__Paths;
  _isReservedFilePath__Paths = v10;

}

- (void)_loadPageForReservedPath:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, void *);
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, void *))a4;
  objc_msgSend(a3, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  RELogForDomain(21);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_2132F7000, v8, OS_LOG_TYPE_INFO, "Vending system page %@", (uint8_t *)&v13, 0xCu);
  }

  -[REHTTPDebugServer _pageMap](self, "_pageMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("re-display-name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v10, v12);
}

- (id)_pageTitle
{
  return CFSTR("Relevance Engine");
}

- (id)_radarLinkWithTitle:(id)a3
{
  __CFString *v3;
  void *v4;

  v3 = (__CFString *)a3;
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("Relevance Engine | 2.0");
  }
  +[REHTMLElement link:title:](REHTMLElement, "link:title:", CFSTR("rdar://new/problem/component=Relevance%20Engine&version=2.0"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_enginesPage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[REHTTPFileCache loadFileAtPath:](self->_cache, "loadFileAtPath:", CFSTR("/engines.html"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[REHTMLElement div](REHTMLElement, "div");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REHTMLElement elementWithHTMLData:](REHTMLElement, "elementWithHTMLData:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addChild:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "elementByAddingAtttibute:value:", CFSTR("re-display-name"), CFSTR("Select Process"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_landPageFileName
{
  return CFSTR("/land_page.html");
}

- (id)_landingPage
{
  void *v3;
  void *v4;
  void *v5;

  -[REHTTPDebugServer _landPageFileName](self, "_landPageFileName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPFileCache loadFileAtPath:](self->_cache, "loadFileAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REHTMLElement elementWithHTMLData:](REHTMLElement, "elementWithHTMLData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_aboutPage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("p"), CFSTR("This tool allows introspecting state of Relevance Engine and provides a set of tools for debugging."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("p"), CFSTR("File any bugs against "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPDebugServer _radarLinkWithTitle:](self, "_radarLinkWithTitle:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addChild:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "append:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPDebugServer _createContentItemWithTitle:content:](self, "_createContentItemWithTitle:content:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "elementByAddingAtttibute:value:", CFSTR("re-display-name"), CFSTR("About"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_engineList
{
  return CFSTR("/engine-list");
}

- (void)_loadEngineListWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v6 = a4;
  if (v6)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__12;
    v37 = __Block_byref_object_dispose__12;
    v38 = 0;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __59__REHTTPDebugServer__loadEngineListWithRequest_completion___block_invoke;
    v29[3] = &unk_24CF8D448;
    v29[4] = self;
    v32 = &v33;
    v7 = v24;
    v30 = v7;
    v31 = v6;
    v22 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v29);
    v8 = (void *)MEMORY[0x24BDD1808];
    objc_msgSend(v7, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsWithURL:resolvingAgainstBaseURL:", v9, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v23, "queryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v14, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("engine"));

          if (v16)
          {
            objc_msgSend(v14, "value");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v34[5];
            v34[5] = v18;

            RELogForDomain(21);
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = v34[5];
              *(_DWORD *)buf = 138412290;
              v40 = v21;
              _os_log_impl(&dword_2132F7000, v20, OS_LOG_TYPE_INFO, "Vending engines for process %@", buf, 0xCu);
            }

            -[REHTTPDebugServer _availableEngineInstancesForProcess:completion:](self, "_availableEngineInstancesForProcess:completion:", v34[5], v22);
            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v41, 16);
        if (v11)
          continue;
        break;
      }
    }

    RELogForDomain(21);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2132F7000, v17, OS_LOG_TYPE_INFO, "Unable to load engines for process", buf, 2u);
    }

    v22[2](v22, MEMORY[0x24BDBD1A8]);
LABEL_16:

    _Block_object_dispose(&v33, 8);
  }

}

void __59__REHTTPDebugServer__loadEngineListWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setProcessName:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_loadAvailableEngines:", MEMORY[0x24BDBD1A8]);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setProcessName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_loadAvailableEngines:", v6);
  if (!v4)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "responseWithStatusCode:", 500);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 40), "responseWithStatusCode:", 200);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBody:", v4);

LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (REHTTPDebugServerDataSource)dataSource
{
  return (REHTTPDebugServerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSArray)availableEngines
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAvailableEngines:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_availableEngines, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_pageBuilder, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
