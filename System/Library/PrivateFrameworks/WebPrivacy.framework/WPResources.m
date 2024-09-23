@implementation WPResources

- (void)requestLinkFilteringData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WebPrivacy::Client *inited;
  dispatch_queue_t *v9;
  void *v10;
  uint64_t (***v11)();
  uint64_t v12;
  id to;
  uint64_t v14;
  char v15;
  id location;
  uint64_t (**v17)();
  id v18[2];
  uint64_t (***v19)();
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  inited = (WebPrivacy::Client *)objc_initWeak(&location, self);
  v9 = (dispatch_queue_t *)WebPrivacy::Client::shared(inited);
  v15 = objc_msgSend(v6, "afterUpdates");
  objc_copyWeak(&to, &location);
  v14 = MEMORY[0x24BD10684](v7);
  v19 = 0;
  v17 = &off_251BCE008;
  objc_moveWeak(v18, &to);
  v10 = (void *)v14;
  v14 = 0;
  v18[1] = v10;
  v19 = &v17;
  objc_destroyWeak(&to);
  WebPrivacy::Client::getList(v9, 2, &v15, &v17);
  v11 = v19;
  if (v19 == &v17)
  {
    v12 = 4;
    v11 = &v17;
    goto LABEL_5;
  }
  if (v19)
  {
    v12 = 5;
LABEL_5:
    (*v11)[v12]();
  }
  objc_destroyWeak(&location);

}

- (void)loadTrackerBlockerRuleListForStore:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v12 = 1;
  v8 = MEMORY[0x24BD10684](v6);
  v9 = v5;
  v13[0] = &off_251BCF060;
  v13[1] = v8;
  v13[2] = v9;
  v14 = v13;
  WebPrivacy::Client::getList(v7, 1, &v12, v13);
  v10 = v14;
  if (v14 == v13)
  {
    v11 = 4;
    v10 = v13;
    goto LABEL_5;
  }
  if (v14)
  {
    v11 = 5;
LABEL_5:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }

}

- (void)requestLinkFilteringData:completionHandler:
{
  id *v2;

  v2 = a1 + 1;

  objc_destroyWeak(v2);
  operator delete(a1);
}

- (uint64_t)requestLinkFilteringData:completionHandler:
{
  id *v2;

  v2 = (id *)(a1 + 8);

  objc_destroyWeak(v2);
  return a1;
}

- (void)requestAllowedLinkFilteringData:completionHandler:
{

  operator delete(a1);
}

- (uint64_t)requestAllowedLinkFilteringData:completionHandler:
{

  return a1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  return self;
}

void __29__WPResources_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[WPResources sharedInstance]::sharedInstance;
  +[WPResources sharedInstance]::sharedInstance = v0;

}

+ (id)sharedInstance
{
  if (+[WPResources sharedInstance]::onceToken != -1)
    dispatch_once(&+[WPResources sharedInstance]::onceToken, &__block_literal_global_2);
  return (id)+[WPResources sharedInstance]::sharedInstance;
}

- (void)requestTrackerBlockerContentExtension:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE200;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 1, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestTrackerQueryParameters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  WebPrivacy::Client *inited;
  dispatch_queue_t *v9;
  void *v10;
  uint64_t (***v11)();
  uint64_t v12;
  id to;
  uint64_t v14;
  char v15;
  id location;
  uint64_t (**v17)();
  id v18[2];
  uint64_t (***v19)();
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  inited = (WebPrivacy::Client *)objc_initWeak(&location, self);
  v9 = (dispatch_queue_t *)WebPrivacy::Client::shared(inited);
  v15 = objc_msgSend(v6, "afterUpdates");
  objc_copyWeak(&to, &location);
  v14 = MEMORY[0x24BD10684](v7);
  v19 = 0;
  v17 = &off_251BCE0E0;
  objc_moveWeak(v18, &to);
  v10 = (void *)v14;
  v14 = 0;
  v18[1] = v10;
  v19 = &v17;
  objc_destroyWeak(&to);
  WebPrivacy::Client::getList(v9, 2, &v15, &v17);
  v11 = v19;
  if (v19 == &v17)
  {
    v12 = 4;
    v11 = &v17;
    goto LABEL_5;
  }
  if (v19)
  {
    v12 = 5;
LABEL_5:
    (*v11)[v12]();
  }
  objc_destroyWeak(&location);

}

- (void)requestAllowedLinkFilteringData:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE170;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 5, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestTrackerDomainNames:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE050;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 3, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestTrackerDomainNamesData:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE098;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 3, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestTrackerNetworkAddresses:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE128;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 4, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestStorageAccessUserAgentStringQuirksData:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE248;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 6, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestStorageAccessPromptQuirksData:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCE1B8;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 7, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)requestRestrictedOpenerDomains:(id)a3 completionHandler:(id)a4
{
  id v5;
  WebPrivacy::Client *v6;
  dispatch_queue_t *v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (WebPrivacy::Client *)a4;
  v7 = (dispatch_queue_t *)WebPrivacy::Client::shared(v6);
  v10 = objc_msgSend(v5, "afterUpdates");
  v11[0] = &off_251BCF018;
  v11[1] = MEMORY[0x24BD10684](v6);
  v12 = v11;
  WebPrivacy::Client::getList(v7, 8, &v10, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v9 = 5;
LABEL_5:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

- (void)_doWithCachedLinkFilteringData:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4[2](v4, *((_QWORD *)self + 1));
  std::mutex::unlock((std::mutex *)((char *)self + 16));

}

- (void)_waitForCachedLinkFilteringData
{
  std::mutex *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  _QWORD v13[2];
  id v14;
  void *v15;
  Platform::SharedMemory *v16;
  std::__shared_weak_count *v17;

  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  if (!objc_msgSend(*((id *)self + 1), "count"))
  {
    v4 = WebPrivacy::Client::shared(0);
    WebPrivacy::Client::getList(v4, 2u, &v16);
    if (v16)
    {
      Platform::SharedMemory::view(v16);
      if (v5)
      {
        v13[0] = Platform::SharedMemory::view(v16);
        v13[1] = v6;
        WebPrivacy::createLinkFilteringData((uint64_t)v13, (uint64_t *)&v14);
        v7 = v15;
        if (!v15)
        {
          objc_msgSend(v14, "scopedQueryParameters");
          v8 = objc_claimAutoreleasedReturnValue();
          v9 = (void *)*((_QWORD *)self + 1);
          *((_QWORD *)self + 1) = v8;

          v7 = v15;
        }

      }
    }
    v10 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  std::mutex::unlock(v3);
}

- (void)_installMessageHandlerForTesting:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  WebPrivacy::Client *v6;

  v6 = (WebPrivacy::Client *)a3;
  v3 = WebPrivacy::Client::shared(v6);
  v4 = MEMORY[0x24BD10684](v6);
  v5 = *(void **)(v3 + 416);
  *(_QWORD *)(v3 + 416) = v4;

}

- (void)_resetStateForTesting
{
  WebPrivacy::Client *v3;
  void *v4;

  v3 = (WebPrivacy::Client *)WebPrivacy::Client::shared((WebPrivacy::Client *)self);
  WebPrivacy::Client::resetStateForTesting(v3);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v4 = (void *)*((_QWORD *)self + 1);
  *((_QWORD *)self + 1) = 0;

  std::mutex::unlock((std::mutex *)((char *)self + 16));
}

- (void)_makeXPCTimeoutInstantForTesting
{
  uint64_t v2;

  v2 = WebPrivacy::Client::shared((WebPrivacy::Client *)self);
  *(_QWORD *)(v2 + 448) = 0;
  *(_BYTE *)(v2 + 456) = 1;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
  objc_storeStrong((id *)self + 1, 0);
}

- (uint64_t)requestTrackerBlockerContentExtension:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCE200;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerBlockerContentExtension:completionHandler:
{
  unsigned int v4;
  void *v5;
  void *v6;

  v4 = *a2;
  WebPrivacy::createTrackingResourceRequestContentExtensionSource(a3, (uint64_t *)&v5);
  callCompletionHandler<void({block_pointer} {__strong})(NSData *,NSError *)>(*(void **)(a1 + 8), v5, v6, v4);

}

- (_QWORD)requestTrackerBlockerContentExtension:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE200;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestTrackerQueryParameters:completionHandler:
{
  uint64_t result;

  *(_QWORD *)a2 = &off_251BCE0E0;
  objc_copyWeak((id *)(a2 + 8), (id *)(a1 + 8));
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 16));
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

- (void)requestTrackerQueryParameters:completionHandler:
{
  id WeakRetained;
  BOOL v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void (**v19)(id, id, _QWORD);
  id v20;
  id v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v27 = *a2;
  WebPrivacy::createLinkFilteringData(a3, (uint64_t *)&v32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v5 = v32 == 0;

    if (!v5)
    {
      v6 = (char *)objc_loadWeakRetained((id *)(a1 + 8));
      std::mutex::lock((std::mutex *)(v6 + 16));
      objc_msgSend(v32, "scopedQueryParameters");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)v6 + 1);
      *((_QWORD *)v6 + 1) = v7;

      std::mutex::unlock((std::mutex *)(v6 + 16));
    }
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v32, "scopedQueryParameters");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        v14 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "domains");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count") == 0;

        if (v17)
          objc_msgSend(v9, "addObject:", v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v11);
  }

  v18 = v33;
  v19 = (void (**)(id, id, _QWORD))*(id *)(a1 + 16);
  v20 = v9;
  v21 = v18;
  if (v20)
  {
    v19[2](v19, v20, 0);
  }
  else if ((_DWORD)v27)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FD8];
    if (v27 > 3)
      v23 = "Invalid";
    else
      v23 = off_251BCF0E0[(char)(v27 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), v27, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v19)[2](v19, 0, v26);

  }
  else
  {
    ((void (**)(id, id, id))v19)[2](v19, 0, v21);
  }

}

- (id)requestTrackerQueryParameters:completionHandler:
{
  id *v2;
  id *v3;

  v2 = (id *)(a1 + 8);
  v3 = (id *)operator new(0x18uLL);
  *v3 = &off_251BCE0E0;
  objc_copyWeak(v3 + 1, v2);
  v3[2] = (id)MEMORY[0x24BD10684](*(_QWORD *)(a1 + 16));
  return v3;
}

- (id)requestLinkFilteringData:completionHandler:
{
  id *v2;
  id *v3;

  v2 = (id *)(a1 + 8);
  v3 = (id *)operator new(0x18uLL);
  *v3 = &off_251BCE008;
  objc_copyWeak(v3 + 1, v2);
  v3[2] = (id)MEMORY[0x24BD10684](*(_QWORD *)(a1 + 16));
  return v3;
}

- (_QWORD)requestAllowedLinkFilteringData:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE170;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestTrackerDomainNames:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCE050;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerDomainNames:completionHandler:
{
  unsigned int v4;
  void *v5;
  void *v6;

  v4 = *a2;
  WebPrivacy::createTrackerDomainNamesJSONData(a3, (uint64_t *)&v5);
  callCompletionHandler<void({block_pointer} {__strong})(NSData *,NSError *)>(*(void **)(a1 + 8), v5, v6, v4);

}

- (_QWORD)requestTrackerDomainNames:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE050;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestTrackerDomainNamesData:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCE098;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerDomainNamesData:completionHandler:
{
  uint64_t v4;
  id v5;
  id v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  WebPrivacy::createTrackerDomainNamesData(a3, &v15);
  v5 = v15;
  v6 = v16;
  v7 = (void (**)(id, id, _QWORD))*(id *)(a1 + 8);
  v8 = v5;
  v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if ((_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FD8];
    if (v4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(v4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

- (_QWORD)requestTrackerDomainNamesData:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE098;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestTrackerNetworkAddresses:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCE128;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestTrackerNetworkAddresses:completionHandler:
{
  uint64_t v4;
  id v5;
  id v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  WebPrivacy::createTrackerNetworkAddressesList(a3, &v15);
  v5 = v15;
  v6 = v16;
  v7 = (void (**)(id, id, _QWORD))*(id *)(a1 + 8);
  v8 = v5;
  v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if ((_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FD8];
    if (v4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(v4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

- (_QWORD)requestTrackerNetworkAddresses:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE128;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestStorageAccessUserAgentStringQuirksData:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCE248;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestStorageAccessUserAgentStringQuirksData:completionHandler:
{
  uint64_t v4;
  WPStorageAccessUserAgentStringQuirksData *v5;
  id v6;
  void (**v7)(id, id, _QWORD);
  WPStorageAccessUserAgentStringQuirksData *v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  WPStorageAccessUserAgentStringQuirksData *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  WebPrivacy::createStorageAccessUserAgentStringQuirksData(a3, &v15);
  v5 = v15;
  v6 = v16;
  v7 = (void (**)(id, id, _QWORD))*(id *)(a1 + 8);
  v8 = v5;
  v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if ((_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FD8];
    if (v4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(v4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

- (_QWORD)requestStorageAccessUserAgentStringQuirksData:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE248;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestStorageAccessPromptQuirksData:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCE1B8;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestStorageAccessPromptQuirksData:completionHandler:
{
  uint64_t v4;
  WPStorageAccessPromptQuirksData *v5;
  id v6;
  void (**v7)(id, id, _QWORD);
  WPStorageAccessPromptQuirksData *v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  WPStorageAccessPromptQuirksData *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  WebPrivacy::createStorageAccessPromptQuirksData(a3, &v15);
  v5 = v15;
  v6 = v16;
  v7 = (void (**)(id, id, _QWORD))*(id *)(a1 + 8);
  v8 = v5;
  v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if ((_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FD8];
    if (v4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(v4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

- (_QWORD)requestStorageAccessPromptQuirksData:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCE1B8;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)requestRestrictedOpenerDomains:completionHandler:
{
  uint64_t result;

  *a2 = &off_251BCF018;
  result = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  a2[1] = result;
  return result;
}

- (void)requestRestrictedOpenerDomains:completionHandler:
{
  uint64_t v4;
  id v5;
  id v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  WebPrivacy::createRestrictedOpenerDomains(a3, &v15);
  v5 = v15;
  v6 = v16;
  v7 = (void (**)(id, id, _QWORD))*(id *)(a1 + 8);
  v8 = v5;
  v9 = v6;
  if (v8)
  {
    v7[2](v7, v8, 0);
  }
  else if ((_DWORD)v4)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FD8];
    if (v4 > 3)
      v11 = "Invalid";
    else
      v11 = off_251BCF0E0[(char)(v4 - 1)];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("WebPrivacyErrorDomain"), v4, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, id, void *))v7)[2](v7, 0, v14);

  }
  else
  {
    ((void (**)(id, id, id))v7)[2](v7, 0, v9);
  }

}

- (_QWORD)requestRestrictedOpenerDomains:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_251BCF018;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  return v2;
}

- (uint64_t)loadTrackerBlockerRuleListForStore:completionHandler:
{

  return a1;
}

- (void)loadTrackerBlockerRuleListForStore:completionHandler:
{
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 > 3u)
    v3 = "Invalid";
  else
    v3 = off_251BCF0E0[(char)(a1 - 1)];
  v4 = 136446210;
  v5 = v3;
  OUTLINED_FUNCTION_1(&dword_24A44A000, a2, a3, "Failed to request tracker block list rules with error: %{public}s", (uint8_t *)&v4);
}

- (_QWORD)loadTrackerBlockerRuleListForStore:completionHandler:
{
  _QWORD *v2;

  v2 = operator new(0x18uLL);
  *v2 = &off_251BCF060;
  v2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  v2[2] = *(id *)(a1 + 16);
  return v2;
}

- (id)loadTrackerBlockerRuleListForStore:completionHandler:
{
  id result;

  *a2 = &off_251BCF060;
  a2[1] = MEMORY[0x24BD10684](*(_QWORD *)(a1 + 8));
  result = *(id *)(a1 + 16);
  a2[2] = result;
  return result;
}

@end
