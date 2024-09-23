@implementation BSUIManager

- (id)imageResourceCache
{
  BSUIManager *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  TUIImageResourceCache *v8;
  TUIImageResourceCache *imageResourceCache;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_imageResourceCache)
  {
    v3 = objc_alloc((Class)TUIImageResourceCache);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIManager resourceLoader](v2, "resourceLoader"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIManager filterRegistry](v2, "filterRegistry"));
    v6 = BSUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (TUIImageResourceCache *)objc_msgSend(v3, "initWithLoader:filters:customImageBundle:", v4, v5, v7);
    imageResourceCache = v2->_imageResourceCache;
    v2->_imageResourceCache = v8;

  }
  objc_sync_exit(v2);

  return v2->_imageResourceCache;
}

- (id)filterRegistry
{
  BSUIManager *v2;
  TUIFilterRegistry *v3;
  TUIFilterRegistry *filterRegistry;
  void *v5;
  TUIFilterRegistry *v6;
  void *v7;
  TUIFilterRegistry *v8;
  void *v9;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_filterRegistry)
  {
    v3 = (TUIFilterRegistry *)objc_alloc_init((Class)TUIFilterRegistry);
    filterRegistry = v2->_filterRegistry;
    v2->_filterRegistry = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCCoverEffects sharedInstance](BCCoverEffects, "sharedInstance"));
    v6 = v2->_filterRegistry;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templateImageFilters"));
    -[TUIFilterRegistry registerImageFilters:](v6, "registerImageFilters:", v7);

    v8 = v2->_filterRegistry;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templateImageSetFilters"));
    -[TUIFilterRegistry registerImageSetFilters:](v8, "registerImageSetFilters:", v9);

  }
  objc_sync_exit(v2);

  return v2->_filterRegistry;
}

- (void)registerTemplateBundlesFromPackage:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  BSUIManager *v9;
  NSArray *v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  NSArray *registeredPackages;
  uint64_t v32;
  NSObject *v33;
  __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  __CFString *v41;
  os_signpost_id_t spid;
  id v43;
  NSObject *oslog;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  void *v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  const __CFString *v59;
  void *v60;
  _BYTE v61[128];

  v43 = a3;
  v4 = BCSignpostLaunch();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  spid = os_signpost_id_generate(v5);

  v6 = BCSignpostLaunch();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Register Template Bundles", ", buf, 2u);
  }

  v9 = self;
  objc_sync_enter(v9);
  oslog = os_log_create("com.apple.iBooks", "BSUIManager");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v9->_registeredPackages;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate factory](BSUITemplate, "factory"));
        objc_msgSend(v15, "unregisterPackage:", v14);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17 = NSTemporaryDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  if ((objc_msgSend(v16, "fileExistsAtPath:", v18) & 1) == 0)
  {
    if (+[JSADevice isInternalBuild](JSADevice, "isInternalBuild"))
    {
      v59 = CFSTR("tempDir");
      v60 = v18;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
      v40 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("Temp dir does not exist. Why?"), v39));

      objc_exception_throw(v40);
    }
    v47 = 0;
    v19 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v18, 1, 0, &v47);
    v20 = v47;
    if (v19)
    {
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        sub_238620();
    }
    else if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_238680();
    }

  }
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("templates.tpkg")));
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v21));

  +[TUIBinaryPackage removeCacheForURL:](TUIBinaryPackage, "removeCacheForURL:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "dataAtPath:", CFSTR("templates.tpkg")));
  v46 = 0;
  LOBYTE(v21) = objc_msgSend(v23, "writeToURL:options:error:", v22, 1, &v46);
  v41 = (__CFString *)v46;
  if ((v21 & 1) == 0)
  {
    v24 = oslog;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v38 = (const __CFString *)objc_msgSend(v23, "length");
      *(_DWORD *)buf = 134218498;
      v54 = v38;
      v55 = 2114;
      v56 = v22;
      v57 = 2114;
      v58 = v41;
      _os_log_error_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "Failed to write data (%lu bytes) to disk at '%{public}@': %{public}@", buf, 0x20u);
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("jetpack:///")));
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v25));

  v45 = 0;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[TUIBinaryPackage packageWithURL:baseURL:error:](TUIBinaryPackage, "packageWithURL:baseURL:error:", v22, v26, &v45));
  v28 = (__CFString *)v45;
  if (!v27 && os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138543874;
    v54 = v22;
    v55 = 2114;
    v56 = v26;
    v57 = 2114;
    v58 = v28;
    _os_log_fault_impl(&dword_0, oslog, OS_LOG_TYPE_FAULT, "Fatal: Failed to get a binary package at %{public}@ (%{public}@): %{public}@", buf, 0x20u);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate factory](BSUITemplate, "factory"));
  objc_msgSend(v29, "registerPackage:", v27);

  v52 = v27;
  v30 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1));
  registeredPackages = v9->_registeredPackages;
  v9->_registeredPackages = (NSArray *)v30;

  v32 = BSUITemplateLog();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "version"));
    *(_DWORD *)buf = 138543874;
    v54 = CFSTR("templates.tpkg");
    v55 = 2114;
    v56 = v34;
    v57 = 2114;
    v58 = v26;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "Registered %{public}@ from JetPack %{public}@ to TUITemplateFactory with baseURL=%{public}@", buf, 0x20u);

  }
  objc_sync_exit(v9);

  v35 = BCSignpostLaunch();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  v37 = v36;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v37, OS_SIGNPOST_INTERVAL_END, spid, "Register Template Bundles", ", buf, 2u);
  }

}

- (void)setFilterRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_filterRegistry, a3);
}

- (void)setImageResourceCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageResourceCache, a3);
}

- (NSArray)registeredPackages
{
  return self->_registeredPackages;
}

- (void)setRegisteredPackages:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPackages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredPackages, 0);
  objc_storeStrong((id *)&self->_imageResourceCache, 0);
  objc_storeStrong((id *)&self->_filterRegistry, 0);
}

@end
