@implementation SEMIndexSiteManager

+ (id)defaultManager
{
  id v2;
  void *v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v2 = objc_alloc((Class)objc_opt_class());
  sub_2462ED950();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnumeratorWithUseCase_(MEMORY[0x24BE156D8], v4, 0x251784FD0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultSettings(SEMSettings, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_initWithRootDirectoryURL_setEnumerator_settings_(v2, v9, (uint64_t)v3, v5, v8);

  return v10;
}

- (SEMIndexSiteManager)initWithRootDirectoryURL:(id)a3 setEnumerator:(id)a4 settings:(id)a5
{
  id v9;
  id v10;
  id v11;
  SEMIndexSiteManager *v12;
  SEMIndexSiteManager *v13;
  objc_class *v14;
  id v15;
  const char *v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  SEMIndexSiteCache *v21;
  const char *v22;
  uint64_t Only;
  SEMIndexSiteCache *indexSiteCache;
  const char *v25;
  uint64_t v26;
  SEMIndexSiteManager *v27;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SEMIndexSiteManager;
  v12 = -[SEMIndexSiteManager init](&v29, sel_init);
  v13 = v12;
  if (!v12)
    goto LABEL_3;
  objc_storeStrong((id *)&v12->_rootDirectoryURL, a3);
  objc_storeStrong((id *)&v13->_settings, a5);
  objc_storeStrong((id *)&v13->_setEnumerator, a4);
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = (const char *)objc_msgSend_cStringUsingEncoding_(v15, v16, 4);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = dispatch_queue_create(v17, v18);
  queue = v13->_queue;
  v13->_queue = (OS_dispatch_queue *)v19;

  v21 = [SEMIndexSiteCache alloc];
  Only = objc_msgSend_initWithRootDirectoryURL_readOnly_(v21, v22, (uint64_t)v13->_rootDirectoryURL, 0);
  indexSiteCache = v13->_indexSiteCache;
  v13->_indexSiteCache = (SEMIndexSiteCache *)Only;

  v27 = 0;
  if (objc_msgSend__loadIndexSites(v13, v25, v26))
LABEL_3:
    v27 = v13;

  return v27;
}

- (BOOL)handleUpdatedSets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_246307A50;
  block[3] = &unk_2517831E8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)handleSettingsChange
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_246307B18;
  v5[3] = &unk_25175EAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)performMaintenance:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_246307C04;
  block[3] = &unk_251783210;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)clearAllState
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_246307E18;
  v5[3] = &unk_25175EAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)clearIndexSiteWithUserId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_246307EF8;
  block[3] = &unk_2517831E8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)rebuildAllStateWithSerializedSets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_246307FDC;
  block[3] = &unk_2517831E8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)handleSysdiagnoseStarted
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_246308068;
  block[3] = &unk_25175EAA0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_loadIndexSites
{
  NSURL *rootDirectoryURL;
  void *v4;
  __CFString *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  __CFString *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSURL *v18;
  SEMIndexSiteCache *indexSiteCache;
  void *v20;
  __CFString *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  NSURL *v28;
  void *v29;
  int v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  const __CFString *v40;
  NSURL *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  NSURL *v55;
  __int16 v56;
  const __CFString *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  rootDirectoryURL = self->_rootDirectoryURL;
  v50 = 0;
  sub_2462ED484(rootDirectoryURL, &v50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CFString *)v50;

  if (v4)
  {
    objc_msgSend__loadOrCreateManagerInfo(self, v6, v7);
    objc_msgSend_objectForKey_(self->_managerInfo, v8, (uint64_t)CFSTR("schemaVersion"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqual_(&unk_25178EEA0, v10, (uint64_t)v9) & 1) != 0)
    {
      v43 = v9;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      sub_2462ED10C(self->_rootDirectoryURL);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v46, v51, 16);
      if (!v13)
        goto LABEL_25;
      v15 = v13;
      v16 = *(_QWORD *)v47;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v47 != v16)
            objc_enumerationMutation(v11);
          v18 = *(NSURL **)(*((_QWORD *)&v46 + 1) + 8 * v17);
          indexSiteCache = self->_indexSiteCache;
          v45 = v5;
          objc_msgSend_indexSiteAtURL_error_(indexSiteCache, v14, (uint64_t)v18, &v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v45;

          if (v20)
          {
LABEL_9:
            v5 = v21;
            goto LABEL_10;
          }
          if (objc_msgSend__isDataProtectionError_(self, v14, (uint64_t)v21))
          {
            if (sub_2462ED00C(v18, v22, v23) != 6)
              goto LABEL_9;
            v24 = (void *)qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
            {
              v25 = v24;
              objc_msgSend_path(v18, v26, v27);
              v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v53 = "-[SEMIndexSiteManager _loadIndexSites]";
              v54 = 2112;
              v55 = v28;
              _os_log_impl(&dword_2462C4000, v25, OS_LOG_TYPE_INFO, "%s Class F index site (%@) is inaccessible - Resetting index site", buf, 0x16u);
LABEL_16:

            }
          }
          else
          {
            v29 = (void *)qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              v25 = v29;
              objc_msgSend_path(v18, v32, v33);
              v28 = (NSURL *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315650;
              v53 = "-[SEMIndexSiteManager _loadIndexSites]";
              v54 = 2112;
              v55 = v28;
              v56 = 2112;
              v57 = v21;
              _os_log_error_impl(&dword_2462C4000, v25, OS_LOG_TYPE_ERROR, "%s Failed to load index site (%@) due to error: %@", buf, 0x20u);
              goto LABEL_16;
            }
          }
          v44 = v21;
          v30 = sub_2462ED544(v18, &v44);
          v5 = v44;

          v31 = qword_25441F970;
          if (v30)
          {
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v53 = "-[SEMIndexSiteManager _loadIndexSites]";
              v54 = 2112;
              v55 = v18;
              _os_log_impl(&dword_2462C4000, v31, OS_LOG_TYPE_INFO, "%s Index site removed: %@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v53 = "-[SEMIndexSiteManager _loadIndexSites]";
            v54 = 2112;
            v55 = v18;
            v56 = 2112;
            v57 = v5;
            _os_log_error_impl(&dword_2462C4000, v31, OS_LOG_TYPE_ERROR, "%s Failed to remove index site: %@ error: %@", buf, 0x20u);
          }
LABEL_10:
          ++v17;
        }
        while (v15 != v17);
        v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v46, v51, 16);
        v15 = v34;
        if (!v34)
        {
LABEL_25:

          v35 = 1;
          v9 = v43;
          goto LABEL_34;
        }
      }
    }
    v37 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v40 = CFSTR("empty");
      *(_DWORD *)buf = 136315650;
      v53 = "-[SEMIndexSiteManager _loadIndexSites]";
      v54 = 2112;
      if (v9)
        v40 = v9;
      v55 = (NSURL *)&unk_25178EEA0;
      v56 = 2112;
      v57 = v40;
      _os_log_impl(&dword_2462C4000, v37, OS_LOG_TYPE_INFO, "%s Current schema (expected: %@) not initialized yet (found: %@)", buf, 0x20u);
    }
    v35 = objc_msgSend__resetRootDirectory(self, v38, v39);
LABEL_34:

  }
  else
  {
    v36 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v42 = self->_rootDirectoryURL;
      *(_DWORD *)buf = 136315650;
      v53 = "-[SEMIndexSiteManager _loadIndexSites]";
      v54 = 2112;
      v55 = v42;
      v56 = 2112;
      v57 = v5;
      _os_log_error_impl(&dword_2462C4000, v36, OS_LOG_TYPE_ERROR, "%s Failed to resolve / create root directory: %@ error: %@", buf, 0x20u);
    }
    v35 = 0;
  }

  return v35;
}

- (BOOL)_isDataProtectionError:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_isEqual_(v6, v7, 0x251784950))
  {
    v22 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v10 = objc_msgSend_code(v3, v8, v9);

  if (v10 == 7)
  {
    objc_msgSend_underlyingErrors(v3, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v13, v14, v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_domain(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v18, v19, *MEMORY[0x24BDD0B88]))
      v22 = objc_msgSend_code(v6, v20, v21) == 257;
    else
      v22 = 0;

    goto LABEL_9;
  }
  v22 = 0;
LABEL_10:

  return v22;
}

- (void)_loadOrCreateManagerInfo
{
  SEMDictionaryLog *v3;
  NSURL *rootDirectoryURL;
  const char *v5;
  SEMDictionaryLog *v6;
  id v7;
  SEMDictionaryLog *managerInfo;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = [SEMDictionaryLog alloc];
  rootDirectoryURL = self->_rootDirectoryURL;
  v10 = 0;
  v6 = (SEMDictionaryLog *)objc_msgSend_initWithFilename_protectionClass_directory_readOnly_create_error_(v3, v5, (uint64_t)CFSTR("Manager"), 4, rootDirectoryURL, 0, 1, &v10);
  v7 = v10;
  managerInfo = self->_managerInfo;
  self->_managerInfo = v6;

  if (!self->_managerInfo)
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[SEMIndexSiteManager _loadOrCreateManagerInfo]";
      v13 = 2112;
      v14 = v7;
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Failed to load manager info: %@", buf, 0x16u);
    }
  }

}

- (BOOL)_resetRootDirectory
{
  NSObject *v3;
  NSURL *rootDirectoryURL;
  NSURL *v5;
  char v6;
  const char *v7;
  uint64_t v8;
  NSURL *v9;
  NSMutableDictionary *indexSiteWriterCache;
  NSURL *v11;
  void *v12;
  NSURL *v13;
  const char *v14;
  uint64_t v15;
  SEMDictionaryLog *managerInfo;
  const char *v17;
  char v18;
  NSObject *v19;
  BOOL v20;
  const char *v21;
  NSObject *v22;
  NSURL *v24;
  NSURL *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NSURL *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    rootDirectoryURL = self->_rootDirectoryURL;
    *(_DWORD *)buf = 136315394;
    v28 = "-[SEMIndexSiteManager _resetRootDirectory]";
    v29 = 2112;
    v30 = rootDirectoryURL;
    _os_log_impl(&dword_2462C4000, v3, OS_LOG_TYPE_INFO, "%s Clearing root directory: %@", buf, 0x16u);
  }
  v5 = self->_rootDirectoryURL;
  v26 = 0;
  v6 = sub_2462ED544(v5, &v26);
  v9 = (NSURL *)v26;
  if ((v6 & 1) == 0)
  {
    v19 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SEMIndexSiteManager _resetRootDirectory]";
      v29 = 2112;
      v30 = v9;
      v21 = "%s Failed to remove root directory: %@";
LABEL_15:
      _os_log_error_impl(&dword_2462C4000, v19, OS_LOG_TYPE_ERROR, v21, buf, 0x16u);
    }
LABEL_16:
    v20 = 0;
    goto LABEL_17;
  }
  objc_msgSend_clear(self->_indexSiteCache, v7, v8);
  indexSiteWriterCache = self->_indexSiteWriterCache;
  self->_indexSiteWriterCache = 0;

  v11 = self->_rootDirectoryURL;
  v25 = v9;
  sub_2462ED484(v11, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;

  if (v12)
  {
    objc_msgSend__loadOrCreateManagerInfo(self, v14, v15);
    managerInfo = self->_managerInfo;
    v24 = v13;
    v18 = objc_msgSend_writeUpdatedObject_forKey_error_(managerInfo, v17, (uint64_t)&unk_25178EEA0, CFSTR("schemaVersion"), &v24);
    v9 = v24;

    v19 = qword_25441F970;
    if ((v18 & 1) != 0)
    {
      v20 = 1;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[SEMIndexSiteManager _resetRootDirectory]";
        v29 = 2112;
        v30 = (NSURL *)&unk_25178EEA0;
        _os_log_impl(&dword_2462C4000, v19, OS_LOG_TYPE_INFO, "%s Root directory initialized with schema version: %@", buf, 0x16u);
      }
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SEMIndexSiteManager _resetRootDirectory]";
      v29 = 2112;
      v30 = v9;
      v21 = "%s Failed to record schema version: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v22 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[SEMIndexSiteManager _resetRootDirectory]";
    v29 = 2112;
    v30 = v13;
    _os_log_error_impl(&dword_2462C4000, v22, OS_LOG_TYPE_ERROR, "%s Failed to create root directory: %@", buf, 0x16u);
  }
  v20 = 0;
  v9 = v13;
LABEL_17:

  return v20;
}

- (BOOL)_rebuildAllStateWithSerializedSets:(id)a3
{
  CCSetEnumerator *v5;
  const char *v6;
  CCSetEnumerator *v7;
  CCSetEnumerator *setEnumerator;
  const char *v9;
  uint64_t v10;
  const char *v11;
  char v12;
  CCSetEnumerator *v13;

  v5 = self->_setEnumerator;
  objc_msgSend_setEnumeratorWithSerializedSets_(MEMORY[0x24BE156D0], v6, (uint64_t)a3);
  v7 = (CCSetEnumerator *)objc_claimAutoreleasedReturnValue();
  setEnumerator = self->_setEnumerator;
  self->_setEnumerator = v7;

  if (objc_msgSend__resetRootDirectory(self, v9, v10))
    v12 = objc_msgSend__rebuildAllIndexSites_(self, v11, 0);
  else
    v12 = 0;
  v13 = self->_setEnumerator;
  self->_setEnumerator = v5;

  return v12;
}

- (BOOL)_removeSiteWithUserId:(id)a3
{
  id v4;
  SEMIndexSiteCache *indexSiteCache;
  const char *v6;
  void *v7;
  const char *v8;
  id v9;
  SEMIndexSiteCache *v10;
  char v11;
  id v12;
  const char *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  indexSiteCache = self->_indexSiteCache;
  v21 = 0;
  objc_msgSend_indexSiteWithUserId_error_(indexSiteCache, v6, (uint64_t)v4, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (v7)
  {
    v10 = self->_indexSiteCache;
    v20 = v9;
    v11 = objc_msgSend_removeIndexSite_error_(v10, v8, (uint64_t)v7, &v20);
    v12 = v20;

    if ((v11 & 1) != 0)
    {
      objc_msgSend_removeObjectForKey_(self->_indexSiteWriterCache, v13, (uint64_t)v7);
      v14 = 1;
    }
    else
    {
      v16 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v23 = "-[SEMIndexSiteManager _removeSiteWithUserId:]";
        v24 = 2112;
        v25 = v7;
        v26 = 2112;
        v27 = v12;
        _os_log_error_impl(&dword_2462C4000, v16, OS_LOG_TYPE_ERROR, "%s Failed to remove index site (%@) error: %@", buf, 0x20u);
      }
      v14 = 0;
    }
    v9 = v12;
  }
  else
  {
    v15 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v18 = v15;
      sub_2462ECDC8(v4, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v23 = "-[SEMIndexSiteManager _removeSiteWithUserId:]";
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v9;
      _os_log_error_impl(&dword_2462C4000, v18, OS_LOG_TYPE_ERROR, "%s Failed to resolve index site (%@) error: %@", buf, 0x20u);

    }
    v14 = 0;
  }

  return v14;
}

- (id)_cachedWriterForIndexSite:(id)a3
{
  const char *v4;
  id v5;
  void *v6;
  SEMIndexSiteWriter *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSMutableDictionary *indexSiteWriterCache;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  int v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315138;
      v21 = "-[SEMIndexSiteManager _cachedWriterForIndexSite:]";
      v17 = "%s Cannot resolve writer for nil index site";
      v18 = v14;
      v19 = 12;
      goto LABEL_13;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  objc_msgSend_objectForKey_(self->_indexSiteWriterCache, v4, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_9;
  v7 = [SEMIndexSiteWriter alloc];
  v9 = objc_msgSend_initWithIndexSite_settings_(v7, v8, (uint64_t)v5, self->_settings);
  if (!v9)
  {
    v16 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[SEMIndexSiteManager _cachedWriterForIndexSite:]";
      v22 = 2112;
      v23 = v5;
      v17 = "%s Failed to initialize writer for index site: %@";
      v18 = v16;
      v19 = 22;
LABEL_13:
      _os_log_error_impl(&dword_2462C4000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v20, v19);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v6 = (void *)v9;
  indexSiteWriterCache = self->_indexSiteWriterCache;
  if (!indexSiteWriterCache)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = self->_indexSiteWriterCache;
    self->_indexSiteWriterCache = v12;

    indexSiteWriterCache = self->_indexSiteWriterCache;
  }
  objc_msgSend_setObject_forKey_(indexSiteWriterCache, v10, (uint64_t)v6, v5);
LABEL_9:

  return v6;
}

- (BOOL)_didHandleUpdatedSets:(id)a3 shouldDefer:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  char isAssistantEnabled;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  BOOL v17;
  const char *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  isAssistantEnabled = objc_msgSend_isAssistantEnabled(self->_settings, v8, v9);
  v11 = qword_25441F970;
  v12 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
  if ((isAssistantEnabled & 1) == 0)
  {
    if (!v12)
    {
      v17 = 1;
      goto LABEL_12;
    }
    v20 = 136315138;
    v21 = "-[SEMIndexSiteManager _didHandleUpdatedSets:shouldDefer:]";
    v18 = "%s Skipping update(s) as Siri Assistant is not enabled in settings";
    v17 = 1;
    goto LABEL_9;
  }
  if (v12)
  {
    v14 = v11;
    v20 = 136315650;
    v21 = "-[SEMIndexSiteManager _didHandleUpdatedSets:shouldDefer:]";
    v22 = 1024;
    v23 = objc_msgSend_count(v6, v15, v16);
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_2462C4000, v14, OS_LOG_TYPE_INFO, "%s handling updates from %u sets: %@", (uint8_t *)&v20, 0x1Cu);

  }
  if (!objc_msgSend__updateApplicableIndexSitesWithSets_shouldDefer_(self, v13, (uint64_t)v6, v7))
  {
    v17 = 0;
    goto LABEL_12;
  }
  v11 = qword_25441F970;
  v17 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v20 = 136315138;
    v21 = "-[SEMIndexSiteManager _didHandleUpdatedSets:shouldDefer:]";
    v18 = "%s Finished handling all set updates";
LABEL_9:
    _os_log_impl(&dword_2462C4000, v11, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v20, 0xCu);
  }
LABEL_12:

  return v17;
}

- (BOOL)_rebuildAllIndexSites:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  id obj;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v35 = 0;
  objc_msgSend__allSetsSorted_(self, v4, (uint64_t)&v35);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v35;
  if (v5)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend_allKeys(v5, v6, v7);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v25 = v8;
      v12 = *(_QWORD *)v32;
      v13 = MEMORY[0x24BDAC760];
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          v28[0] = v13;
          v28[1] = 3221225472;
          v28[2] = sub_2463092BC;
          v28[3] = &unk_251783238;
          v29 = v5;
          v30 = v15;
          v16 = (void *)MEMORY[0x2495571C4](v28);
          objc_msgSend__cachedWriterForIndexSite_(self, v17, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_indexUpdatesToSets_allSets_shouldDefer_(v18, v19, 0, v16, v27) & 1) == 0)
          {
            v22 = qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v38 = "-[SEMIndexSiteManager _rebuildAllIndexSites:]";
              v39 = 2112;
              v40 = v18;
              _os_log_error_impl(&dword_2462C4000, v22, OS_LOG_TYPE_ERROR, "%s Failed to rebuild index site (%@)", buf, 0x16u);
            }

            v21 = 0;
            goto LABEL_14;
          }

        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v31, v36, 16);
        if (v11)
          continue;
        break;
      }
      v21 = 1;
LABEL_14:
      v8 = v25;
    }
    else
    {
      v21 = 1;
    }

  }
  else
  {
    v23 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[SEMIndexSiteManager _rebuildAllIndexSites:]";
      v39 = 2112;
      v40 = v8;
      _os_log_error_impl(&dword_2462C4000, v23, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets sorted: %@", buf, 0x16u);
    }
    v21 = 0;
  }

  return v21;
}

- (BOOL)_updateApplicableIndexSitesWithSets:(id)a3 shouldDefer:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  id obj;
  id v34;
  _QWORD v35[6];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = a4;
  v40 = 0;
  objc_msgSend__sortByIndexSite_error_(self, v7, (uint64_t)v6, &v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v40;
  if (v8)
  {
    if (objc_msgSend_count(v8, v9, v10))
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend_allKeys(v8, v12, v13);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v36, v41, 16);
      if (v15)
      {
        v17 = v15;
        v31 = v11;
        v32 = v6;
        v18 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v37 != v18)
              objc_enumerationMutation(obj);
            v20 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend_objectForKey_(v8, v16, v20, v31, v32);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = MEMORY[0x24BDAC760];
            v35[1] = 3221225472;
            v35[2] = sub_246309628;
            v35[3] = &unk_251783238;
            v35[4] = self;
            v35[5] = v20;
            v22 = (void *)MEMORY[0x2495571C4](v35);
            objc_msgSend__cachedWriterForIndexSite_(self, v23, v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_indexUpdatesToSets_allSets_shouldDefer_(v24, v25, (uint64_t)v21, v22, v34) & 1) == 0)
            {
              v28 = qword_25441F970;
              if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v43 = "-[SEMIndexSiteManager _updateApplicableIndexSitesWithSets:shouldDefer:]";
                v44 = 2112;
                v45 = v24;
                _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s Failed to update index site (%@)", buf, 0x16u);
              }

              v26 = 0;
              goto LABEL_18;
            }

          }
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v36, v41, 16);
          if (v17)
            continue;
          break;
        }
        v26 = 1;
LABEL_18:
        v11 = v31;
        v6 = v32;
      }
      else
      {
        v26 = 1;
      }

    }
    else
    {
      v29 = qword_25441F970;
      v26 = 1;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[SEMIndexSiteManager _updateApplicableIndexSitesWithSets:shouldDefer:]";
        v44 = 2112;
        v45 = v6;
        _os_log_impl(&dword_2462C4000, v29, OS_LOG_TYPE_INFO, "%s Zero applicable sets: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v27 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "-[SEMIndexSiteManager _updateApplicableIndexSitesWithSets:shouldDefer:]";
      v44 = 2112;
      v45 = v6;
      v46 = 2112;
      v47 = v11;
      _os_log_error_impl(&dword_2462C4000, v27, OS_LOG_TYPE_ERROR, "%s Failed to resolve index sites for sets: %@ error: %@", buf, 0x20u);
    }
    v26 = 0;
  }

  return v26;
}

- (id)_sortByIndexSite:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  id v26;
  const char *v27;
  id v28;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v32;
    obj = v8;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend_isUserExclusiveSet_(self->_settings, v11, (uint64_t)v15))
        {
          objc_msgSend_account(v15, v16, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_accountIdentifier(v18, v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = 0;
        }
        objc_msgSend_indexSiteWithUserId_error_(self->_indexSiteCache, v16, (uint64_t)v21, a4);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {

          v8 = obj;
          v28 = 0;
          goto LABEL_16;
        }
        v24 = (void *)v22;
        objc_msgSend_objectForKey_(v7, v23, v22);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend_setObject_forKey_(v7, v27, (uint64_t)v26, v24);
        }
        objc_msgSend_addObject_(v26, v25, (uint64_t)v15);

      }
      v8 = obj;
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v31, v35, 16);
      if (v12)
        continue;
      break;
    }
  }

  v28 = v7;
LABEL_16:

  return v28;
}

- (id)_allSetsSorted:(id *)a3
{
  const char *v5;
  void *v6;
  void *v7;

  objc_msgSend_allSets_(self->_setEnumerator, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend__sortByIndexSite_error_(self, v5, (uint64_t)v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_didRefreshSettings:(id)a3 skipMaintenance:(BOOL *)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int isAssistantEnabled;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  __CFString *v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  SEMDictionaryLog *managerInfo;
  NSObject *v34;
  const __CFString *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  const char *v39;
  int isEqual;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  _BOOL4 v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  const char *v49;
  int v50;
  const char *v51;
  int v53;
  const char *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[3];

  v60[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v53 = 136315138;
    v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
    _os_log_impl(&dword_2462C4000, v7, OS_LOG_TYPE_INFO, "%s Refreshing Settings", (uint8_t *)&v53, 0xCu);
  }
  objc_msgSend_refresh(self->_settings, v8, v9);
  isAssistantEnabled = objc_msgSend_isAssistantEnabled(self->_settings, v10, v11);
  objc_msgSend_objectForKey_(self->_managerInfo, v13, (uint64_t)CFSTR("assistantEnabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_BOOLValue(v14, v15, v16);

  objc_msgSend_localization(self->_settings, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_siriLanguageCode(v20, v21, v22);
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (isAssistantEnabled && (v17 & 1) == 0)
  {
    v24 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v53 = 136315138;
      v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
      _os_log_impl(&dword_2462C4000, v24, OS_LOG_TYPE_INFO, "%s Assistant is now enabled. Reading all sets to initialize filesystem state", (uint8_t *)&v53, 0xCu);
    }
    if (objc_msgSend__rebuildAllIndexSites_(self, v25, 0))
    {
      managerInfo = self->_managerInfo;
      objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v26, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v27;
      v60[1] = v23;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v28, (uint64_t)v60, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = CFSTR("assistantEnabled");
      v59[1] = CFSTR("siriLanguageCode");
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v30, (uint64_t)v59, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(managerInfo) = objc_msgSend_writeUpdatedObjects_forKeys_error_(managerInfo, v32, (uint64_t)v29, v31, 0);

      if (!(_DWORD)managerInfo)
        goto LABEL_41;
      goto LABEL_21;
    }
LABEL_29:
    LOBYTE(managerInfo) = 0;
    goto LABEL_41;
  }
  v34 = qword_25441F970;
  if (((isAssistantEnabled | v17 ^ 1) & 1) == 0)
  {
    v44 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (a4)
    {
      if (v44)
      {
        v53 = 136315138;
        v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
        _os_log_impl(&dword_2462C4000, v34, OS_LOG_TYPE_INFO, "%s Assistant is disabled. Cleaning any obsolete filesystem state", (uint8_t *)&v53, 0xCu);
      }
      if (objc_msgSend__resetRootDirectory(self, v45, v46))
      {
        managerInfo = self->_managerInfo;
        objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v47, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend_writeUpdatedObject_forKey_error_(managerInfo, v49, (uint64_t)v48, CFSTR("assistantEnabled"), 0);

        LOBYTE(managerInfo) = 0;
        if (!v50)
          goto LABEL_41;
        LOBYTE(managerInfo) = 1;
        goto LABEL_22;
      }
      goto LABEL_29;
    }
    if (v44)
    {
      v53 = 136315138;
      v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
      _os_log_impl(&dword_2462C4000, v34, OS_LOG_TYPE_INFO, "%s Assistant is disabled. Will clean up state on next maintenance", (uint8_t *)&v53, 0xCu);
      v34 = qword_25441F970;
    }
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = CFSTR("disabled");
    if (isAssistantEnabled)
      v35 = CFSTR("enabled");
    v53 = 136315394;
    v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
    v55 = 2112;
    v56 = v35;
    _os_log_impl(&dword_2462C4000, v34, OS_LOG_TYPE_INFO, "%s Assistant enablement status unchanged (%@)", (uint8_t *)&v53, 0x16u);
  }
  if ((isAssistantEnabled & 1) != 0)
  {
    v36 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v53 = 136315138;
      v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
      _os_log_impl(&dword_2462C4000, v36, OS_LOG_TYPE_INFO, "%s Verifying localization", (uint8_t *)&v53, 0xCu);
    }
    objc_msgSend_objectForKey_(self->_managerInfo, v37, (uint64_t)CFSTR("siriLanguageCode"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v23, v39, (uint64_t)v38);
    v41 = qword_25441F970;
    v42 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
    if (isEqual)
    {
      if (v42)
      {
        v53 = 136315394;
        v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
        v55 = 2112;
        v56 = v23;
        LOBYTE(managerInfo) = 1;
        _os_log_impl(&dword_2462C4000, v41, OS_LOG_TYPE_INFO, "%s Localization unchanged (%@)", (uint8_t *)&v53, 0x16u);
      }
      else
      {
        LOBYTE(managerInfo) = 1;
      }
    }
    else
    {
      if (v42)
      {
        v53 = 136315650;
        v54 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]";
        v55 = 2112;
        v56 = v23;
        v57 = 2112;
        v58 = v38;
        _os_log_impl(&dword_2462C4000, v41, OS_LOG_TYPE_INFO, "%s Refreshed Siri language code setting (%@) differs from stored (%@)", (uint8_t *)&v53, 0x20u);
      }
      if (objc_msgSend__rebuildAllIndexSites_(self, v43, (uint64_t)v6)
        && objc_msgSend_writeUpdatedObject_forKey_error_(self->_managerInfo, v51, (uint64_t)v23, CFSTR("siriLanguageCode"), 0))
      {
        LOBYTE(managerInfo) = 1;
        if (a4)
          *a4 = 1;
      }
      else
      {
        LOBYTE(managerInfo) = 0;
      }
    }

    goto LABEL_41;
  }
LABEL_21:
  LOBYTE(managerInfo) = 1;
  if (a4)
LABEL_22:
    *a4 = 1;
LABEL_41:

  return (char)managerInfo;
}

- (BOOL)_didHandleAnyUpdatedSets:(id)a3
{
  id v4;
  CCSetEnumerator *setEnumerator;
  const char *v6;
  void *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  setEnumerator = self->_setEnumerator;
  v18 = 0;
  objc_msgSend_allSets_(setEnumerator, v6, (uint64_t)&v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = qword_25441F970;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[SEMIndexSiteManager _didHandleAnyUpdatedSets:]";
      v21 = 2112;
      v22 = v8;
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v11 = v9;
    v14 = objc_msgSend_count(v7, v12, v13);
    *(_DWORD *)buf = 136315394;
    v20 = "-[SEMIndexSiteManager _didHandleAnyUpdatedSets:]";
    v21 = 1024;
    LODWORD(v22) = v14;
    _os_log_impl(&dword_2462C4000, v11, OS_LOG_TYPE_INFO, "%s Checking for applicable updates from all (%u) available sets", buf, 0x12u);

  }
  if (!objc_msgSend__updateApplicableIndexSitesWithSets_shouldDefer_(self, v10, (uint64_t)v7, v4))
  {
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
  v15 = qword_25441F970;
  v16 = 1;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SEMIndexSiteManager _didHandleAnyUpdatedSets:]";
    _os_log_impl(&dword_2462C4000, v15, OS_LOG_TYPE_INFO, "%s Completed handling any updated sets", buf, 0xCu);
  }
LABEL_10:

  return v16;
}

- (BOOL)_didPerformVerification:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  id v7;
  NSObject *v8;
  SEMIndexSiteCache *indexSiteCache;
  const char *v10;
  BOOL v11;
  NSObject *v12;
  NSMutableDictionary *indexSiteWriterCache;
  _QWORD v15[5];
  id v16;
  id v17;
  _BYTE *v18;
  id v19;
  uint8_t v20[4];
  const char *v21;
  __int16 v22;
  NSMutableDictionary *v23;
  _BYTE buf[24];
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0;
  objc_msgSend__allSetsSorted_(self, v5, (uint64_t)&v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = qword_25441F970;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SEMIndexSiteManager _didPerformVerification:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_2462C4000, v8, OS_LOG_TYPE_INFO, "%s Performing verification with all sets: %@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v25 = 1;
    indexSiteCache = self->_indexSiteCache;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_24630A31C;
    v15[3] = &unk_251783260;
    v15[4] = self;
    v16 = v6;
    v17 = v4;
    v18 = buf;
    objc_msgSend_enumerateIndexSitesUsingBlock_(indexSiteCache, v10, (uint64_t)v15);
    v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v12 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        indexSiteWriterCache = self->_indexSiteWriterCache;
        *(_DWORD *)v20 = 136315394;
        v21 = "-[SEMIndexSiteManager _didPerformVerification:]";
        v22 = 2112;
        v23 = indexSiteWriterCache;
        _os_log_impl(&dword_2462C4000, v12, OS_LOG_TYPE_INFO, "%s Completed maintenance at all index sites: %@", v20, 0x16u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SEMIndexSiteManager _didPerformVerification:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_2462C4000, v8, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets sorted: %@", buf, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (void)_handleSysdiagnoseStarted
{
  void *v3;
  id v4;
  NSObject *v5;
  SEMIndexSiteCache *indexSiteCache;
  id v7;
  const char *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  objc_msgSend__allSetsSorted_(self, a2, (uint64_t)&v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (!v3)
  {
    v5 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[SEMIndexSiteManager _handleSysdiagnoseStarted]";
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_2462C4000, v5, OS_LOG_TYPE_ERROR, "%s Failed to resolve all sets sorted: %@", buf, 0x16u);
    }
  }
  indexSiteCache = self->_indexSiteCache;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_24630A734;
  v9[3] = &unk_251783288;
  v9[4] = self;
  v10 = v3;
  v7 = v3;
  objc_msgSend_enumerateIndexSitesUsingBlock_(indexSiteCache, v8, (uint64_t)v9);

}

- (SEMSettings)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSiteWriterCache, 0);
  objc_storeStrong((id *)&self->_indexSiteCache, 0);
  objc_storeStrong((id *)&self->_managerInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
}

@end
