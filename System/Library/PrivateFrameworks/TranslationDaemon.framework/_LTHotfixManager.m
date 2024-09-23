@implementation _LTHotfixManager

+ (_LTHotfixManager)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_15);
  return (_LTHotfixManager *)(id)shared_shared;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    +[_LTDAssetService assetDirectoryURL](_LTDAssetService, "assetDirectoryURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Hotfix"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)hotfixBasePath;
    hotfixBasePath = v2;

  }
}

+ (void)_enableTestFixture:(BOOL)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "temporaryDirectory");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[_LTDAssetService assetDirectoryURL](_LTDAssetService, "assetDirectoryURL");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Hotfix"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)hotfixBasePath;
  hotfixBasePath = v4;

}

- (_LTHotfixManager)init
{
  _LTHotfixManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *hotfixURL;
  _LTHotfixManager *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_LTHotfixManager;
  v2 = -[_LTHotfixManager init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.Translator.HotfixManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)hotfixBasePath, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend((id)hotfixBasePath, "URLByAppendingPathComponent:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      hotfixURL = v2->_hotfixURL;
      v2->_hotfixURL = (NSURL *)v9;

    }
    v11 = v2;

  }
  return v2;
}

- (void)refreshHotfix:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34___LTHotfixManager_refreshHotfix___block_invoke;
  v7[3] = &unk_251A12770;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_replaceHotfix:(int64_t)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSURL *hotfixURL;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSURL *v38;
  NSObject *v39;
  uint8_t v40[8];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v6 = (void *)hotfixBasePath;
  v7 = (void (**)(id, id))a4;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", CFSTR("-rollback"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 3:
      v21 = _LTOSLogAssets();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[_LTHotfixManager _replaceHotfix:completion:].cold.4(v21, v22, v23, v24, v25, v26, v27, v28);
      if (!objc_msgSend(v10, "fileExistsAtPath:", v8))
        goto LABEL_27;
      if (!objc_msgSend(v10, "fileExistsAtPath:", v9))
        goto LABEL_27;
      v41 = 0;
      objc_msgSend(v10, "removeItemAtPath:error:", v9, &v41);
      v19 = v41;
      if (!v19)
        goto LABEL_27;
      break;
    case 2:
      v29 = _LTOSLogAssets();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[_LTHotfixManager _replaceHotfix:completion:].cold.3(v29, v30, v31, v32, v33, v34, v35, v36);
      if (!objc_msgSend(v10, "fileExistsAtPath:", v8)
        || (v43 = 0, objc_msgSend(v10, "removeItemAtPath:error:", v8, &v43), (v19 = v43) == 0))
      {
        if (!objc_msgSend(v10, "fileExistsAtPath:", v9))
        {
LABEL_27:
          v39 = _LTOSLogAssets();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_2491B9000, v39, OS_LOG_TYPE_INFO, "Hotfix manager refresh completed", v40, 2u);
          }
          v19 = 0;
          goto LABEL_30;
        }
        v42 = 0;
        objc_msgSend(v10, "moveItemAtPath:toPath:error:", v9, v8, &v42);
        v19 = v42;
        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
          v38 = (NSURL *)objc_claimAutoreleasedReturnValue();
          hotfixURL = self->_hotfixURL;
          self->_hotfixURL = v38;
          goto LABEL_26;
        }
      }
      break;
    case 1:
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_LTHotfixManager _replaceHotfix:completion:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
      if (!objc_msgSend(v10, "fileExistsAtPath:", v8))
        goto LABEL_27;
      if (!objc_msgSend(v10, "fileExistsAtPath:", v9)
        || (v45 = 0, objc_msgSend(v10, "removeItemAtPath:error:", v9, &v45), (v19 = v45) == 0))
      {
        v44 = 0;
        objc_msgSend(v10, "moveItemAtPath:toPath:error:", v8, v9, &v44);
        v19 = v44;
        if (!v19)
        {
          hotfixURL = self->_hotfixURL;
          self->_hotfixURL = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      break;
    default:
      goto LABEL_27;
  }
  v37 = _LTOSLogAssets();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    -[_LTHotfixManager _replaceHotfix:completion:].cold.1();
LABEL_30:
  v7[2](v7, v19);

}

- (void)updateHotfix:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33___LTHotfixManager_updateHotfix___block_invoke;
  v7[3] = &unk_251A12770;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_updateHotfixInternal:(id)a3
{
  id v4;
  NSURL *hotfixURL;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  hotfixURL = self->_hotfixURL;
  self->_hotfixURL = 0;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42___LTHotfixManager__updateHotfixInternal___block_invoke;
  v7[3] = &unk_251A12798;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_LTHotfixManager _downloadMappingPlist:](self, "_downloadMappingPlist:", v7);

}

- (void)deleteHotfix:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33___LTHotfixManager_deleteHotfix___block_invoke;
  v7[3] = &unk_251A12770;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_downloadWithURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = _LTOSLogHotfix();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v5;
    _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Downloading hotfix from URL: %{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.Translate"));
  objc_msgSend(v8, "setAllowsCellularAccess:", 1);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __48___LTHotfixManager__downloadWithURL_completion___block_invoke;
  v16 = &unk_251A127C0;
  v17 = v5;
  v18 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v11, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume", v13, v14, v15, v16);

}

- (id)_CDNURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  _LTPreferencesHotfixEndpointURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_downloadMappingPlist:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_LTHotfixManager _CDNURL:](self, "_CDNURL:", CFSTR("mapping-info-plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42___LTHotfixManager__downloadMappingPlist___block_invoke;
  v7[3] = &unk_251A12810;
  v8 = v4;
  v6 = v4;
  -[_LTHotfixManager _downloadWithURL:completion:](self, "_downloadWithURL:completion:", v5, v7);

}

- (void)_downloadHotfix:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _LTOSLogHotfix();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v6;
    _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Select hotfix: %@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FormatVersion"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HotfixAssetVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v10;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)hotfixBasePath, "URLByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("mt-quasar-config.json"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v9, "fileExistsAtPath:", v15);

  if ((_DWORD)v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47___LTHotfixManager__downloadHotfix_completion___block_invoke;
    block[3] = &unk_251A12838;
    block[4] = self;
    v27 = v13;
    v28 = v7;
    v17 = v13;
    v18 = v7;
    dispatch_async(queue, block);

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HotfixAssetName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTHotfixManager _CDNURL:](self, "_CDNURL:", v19);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __47___LTHotfixManager__downloadHotfix_completion___block_invoke_51;
    v22[3] = &unk_251A12888;
    v25 = v7;
    v22[4] = self;
    v23 = v9;
    v24 = v13;
    v20 = v13;
    v17 = v7;
    -[_LTHotfixManager _downloadWithURL:completion:](self, "_downloadWithURL:completion:", v18, v22);

  }
}

- (void)_decompressArchive:(id)a3 to:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  int support_format_all;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  archive_read_new();
  if (archive_read_support_filter_all())
  {
    v9 = _LTOSLogHotfix();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_LTHotfixManager _decompressArchive:to:error:].cold.4(v9);
    archive_read_free();
    v10 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = CFSTR("Failed to specify compression algorithm");
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = (const __CFString **)v37;
    v13 = &v36;
LABEL_15:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("HotfixManager"), 0, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  support_format_all = archive_read_support_format_all();
  v15 = _LTOSLogHotfix();
  v16 = v15;
  if (support_format_all)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_LTHotfixManager _decompressArchive:to:error:].cold.3(v16);
    archive_read_free();
    v10 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0FC8];
    v35 = CFSTR("Failed to specify format");
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v35;
    v13 = &v34;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Start extracting archive", buf, 2u);
  }
  v17 = objc_retainAutorelease(v7);
  objc_msgSend(v17, "bytes");
  objc_msgSend(v17, "length");
  if (archive_read_open_memory())
  {
    v18 = _LTOSLogHotfix();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_LTHotfixManager _decompressArchive:to:error:].cold.2(v18);
    archive_read_free();
    v10 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    v33 = CFSTR("Failed to open archive for reading");
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = &v33;
    v13 = &v32;
    goto LABEL_15;
  }
  objc_msgSend(v8, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (archive_read_next_header())
  {
LABEL_18:
    archive_read_free();
    v20 = _LTOSLogHotfix();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v8;
      _os_log_impl(&dword_2491B9000, v20, OS_LOG_TYPE_INFO, "Finished extracting archive to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", archive_entry_pathname());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingPathComponent:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = _LTOSLogHotfix();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v22;
        _os_log_debug_impl(&dword_2491B9000, v23, OS_LOG_TYPE_DEBUG, "Entry extraction path: %{public}@", buf, 0xCu);
      }
      v24 = objc_retainAutorelease(v22);
      objc_msgSend(v24, "UTF8String");
      archive_entry_set_pathname();
      if (archive_read_extract())
        break;

      if (archive_read_next_header())
        goto LABEL_18;
    }
    v25 = _LTOSLogHotfix();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[_LTHotfixManager _decompressArchive:to:error:].cold.1(v25);
    archive_read_free();
    v26 = (void *)MEMORY[0x24BDD1540];
    v28 = *MEMORY[0x24BDD0FC8];
    v29 = CFSTR("Unable to extract file");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("HotfixManager"), 0, v27);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_16:

}

- (NSURL)hotfixURL
{
  return self->_hotfixURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotfixURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_replaceHotfix:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v0, v1, "Hotfix manager refresh failure: %@", v2);
  OUTLINED_FUNCTION_1_2();
}

- (void)_replaceHotfix:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Hotfix manager replace phase prepare", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)_replaceHotfix:(uint64_t)a3 completion:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Hotfix manager replace phase rollback", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)_replaceHotfix:(uint64_t)a3 completion:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, a1, a3, "Hotfix manager replace phase commit", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v2, "Unable to extract file: %s", v3);

  OUTLINED_FUNCTION_9();
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v2, "Failed to open archive for reading: %s", v3);

  OUTLINED_FUNCTION_9();
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.3(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v2, "Failed to specify format: %s", v3);

  OUTLINED_FUNCTION_9();
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.4(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v2, "Failed to specify compression algorithm: %s", v3);

  OUTLINED_FUNCTION_9();
}

@end
