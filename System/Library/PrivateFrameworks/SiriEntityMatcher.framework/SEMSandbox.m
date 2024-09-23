@implementation SEMSandbox

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMSandbox)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  SEMSandbox *IsSaved_setEnumerator_settings;

  objc_msgSend_UUID(MEMORY[0x24BDD1880], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IsSaved_setEnumerator_settings = (SEMSandbox *)objc_msgSend_initWithSandboxId_sandboxIsSaved_setEnumerator_settings_(self, v8, (uint64_t)v7, 0, 0, 0);

  return IsSaved_setEnumerator_settings;
}

- (SEMSandbox)initWithSandboxId:(id)a3 sandboxIsSaved:(BOOL)a4 setEnumerator:(id)a5 settings:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  SEMSandbox *v15;
  uint64_t v16;
  NSString *sandboxId;
  void *v18;
  const char *v19;
  uint64_t v20;
  NSString *sandboxBaseName;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  SEMAuxiliaryFilesystemBase *base;
  const char *v26;
  const char *v27;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *queue;
  const char *v31;
  uint64_t v32;
  SEMSandboxSettings *v33;
  uint64_t v34;
  SEMAuxiliaryFilesystemBase *v35;
  const char *v36;
  const char *v37;
  NSObject *v38;
  dispatch_queue_t v39;
  OS_dispatch_queue *v40;
  const char *v41;
  uint64_t v42;
  SEMSandboxSettings *settings;
  void **p_setEnumerator;
  const char *v45;
  uint64_t v46;
  void *v47;
  SEMIndexSiteManager *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  SEMIndexSiteManager *indexSiteManager;
  const char *v55;
  SEMSandbox *v56;
  SEMIndexSiteReadAccess *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  SEMIndexSiteReadAccess *indexSiteReadAccess;
  NSObject *v64;
  NSString *v65;
  objc_super v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  NSString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v67.receiver = self;
  v67.super_class = (Class)SEMSandbox;
  v15 = -[SEMSandbox init](&v67, sel_init);
  if (!v15)
  {
LABEL_14:
    v56 = v15;
    goto LABEL_16;
  }
  v16 = objc_msgSend_copy(v10, v13, v14);
  sandboxId = v15->_sandboxId;
  v15->_sandboxId = (NSString *)v16;

  v15->_sandboxIsSaved = a4;
  v18 = (void *)objc_opt_class();
  objc_msgSend__sandboxBaseNameWithId_(v18, v19, (uint64_t)v10);
  v20 = objc_claimAutoreleasedReturnValue();
  sandboxBaseName = v15->_sandboxBaseName;
  v15->_sandboxBaseName = (NSString *)v20;

  v23 = (uint64_t)v15->_sandboxBaseName;
  if (a4)
  {
    objc_msgSend_savedBaseWithName_(SEMAuxiliaryFilesystemBase, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    base = v15->_base;
    v15->_base = (SEMAuxiliaryFilesystemBase *)v24;

    v27 = (const char *)objc_msgSend_cStringUsingEncoding_(v15->_sandboxBaseName, v26, 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create(v27, v28);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v29;

    objc_msgSend__loadSavedSettings(v15, v31, v32);
    v33 = (SEMSandboxSettings *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_temporaryBaseWithName_(SEMAuxiliaryFilesystemBase, v22, v23);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v15->_base;
    v15->_base = (SEMAuxiliaryFilesystemBase *)v34;

    v37 = (const char *)objc_msgSend_cStringUsingEncoding_(v15->_sandboxBaseName, v36, 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = dispatch_queue_create(v37, v38);
    v40 = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v39;

    if (v12)
    {
      v33 = (SEMSandboxSettings *)v12;
    }
    else
    {
      objc_msgSend_defaultSandboxSettings(SEMSandboxSettings, v41, v42);
      v33 = (SEMSandboxSettings *)objc_claimAutoreleasedReturnValue();
    }
  }
  settings = v15->_settings;
  v15->_settings = v33;

  if (!v15->_settings)
  {
    v56 = 0;
    goto LABEL_16;
  }
  p_setEnumerator = (void **)&v15->_setEnumerator;
  objc_storeStrong((id *)&v15->_setEnumerator, a5);
  if (!v15->_setEnumerator)
  {
    objc_msgSend_setEnumeratorWithSerializedSets_(MEMORY[0x24BE156D0], v45, MEMORY[0x24BDBD1A8]);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = *p_setEnumerator;
    *p_setEnumerator = (void *)v46;

  }
  v48 = [SEMIndexSiteManager alloc];
  objc_msgSend_rootDirectory(v15->_base, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_initWithRootDirectoryURL_setEnumerator_settings_(v48, v52, (uint64_t)v51, v15->_setEnumerator, v15->_settings);
  indexSiteManager = v15->_indexSiteManager;
  v15->_indexSiteManager = (SEMIndexSiteManager *)v53;

  if (v15->_sandboxIsSaved
    || (v56 = 0, objc_msgSend_performMaintenance_(v15->_indexSiteManager, v55, 0)))
  {
    v57 = [SEMIndexSiteReadAccess alloc];
    objc_msgSend_rootDirectory(v15->_base, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_initWithRootDirectoryURL_settings_(v57, v61, (uint64_t)v60, v15->_settings);
    indexSiteReadAccess = v15->_indexSiteReadAccess;
    v15->_indexSiteReadAccess = (SEMIndexSiteReadAccess *)v62;

    v64 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
    {
      v65 = v15->_sandboxBaseName;
      *(_DWORD *)buf = 136315394;
      v69 = "-[SEMSandbox initWithSandboxId:sandboxIsSaved:setEnumerator:settings:]";
      v70 = 2112;
      v71 = v65;
      _os_log_impl(&dword_2462C4000, v64, OS_LOG_TYPE_INFO, "%s Initialized %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_16:

  return v56;
}

+ (id)loadWithSandboxId:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  char v10;
  const char *v11;
  id v12;
  const char *v13;
  void *IsSaved_setEnumerator_settings;
  const char *v15;
  id v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3);
  v6 = (void *)objc_opt_class();
  objc_msgSend__sandboxBaseNameWithId_(v6, v7, (uint64_t)v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_savedBaseExistsWithName_(SEMAuxiliaryFilesystemBase, v9, (uint64_t)v8);

  if ((v10 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v34 = *MEMORY[0x24BDD0BA0];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("Could not load saved sandbox. No sandbox with id: %@ exists on the filesystem."), v5);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v35[0] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v19, (uint64_t)v35, &v34, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v18, v21, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.sandbox"), 1, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a4 && v22)
      *a4 = objc_retainAutorelease(v22);

    goto LABEL_12;
  }
  v12 = objc_alloc((Class)objc_opt_class());
  IsSaved_setEnumerator_settings = (void *)objc_msgSend_initWithSandboxId_sandboxIsSaved_setEnumerator_settings_(v12, v13, (uint64_t)v5, 1, 0, 0);
  if (!IsSaved_setEnumerator_settings)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, (uint64_t)CFSTR("Could not load saved sandbox. Required sandbox state failed to be loaded from the filesystem. SandboxId: %@"), v5, *MEMORY[0x24BDD0BA0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v25;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v33, &v32, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v24, v28, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.sandbox"), 2, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (a4 && v29)
      *a4 = objc_retainAutorelease(v29);

    v16 = 0;
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v16 = IsSaved_setEnumerator_settings;
  v17 = v16;
LABEL_13:

  return v17;
}

+ (id)sandboxWithRawSpeechProfile:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BYTE buf[24];
  void *v41;
  uint64_t *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("language"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x24BDBCEA0], v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v10 = (void *)qword_25441F8E8;
    v37 = qword_25441F8E8;
    if (!qword_25441F8E8)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_2462C9298;
      v41 = &unk_25175EAF0;
      v42 = &v34;
      sub_2462C9298((uint64_t)buf);
      v10 = (void *)v35[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v34, 8);
    v12 = [v11 alloc];
    v14 = (void *)objc_msgSend_initWithOmittedItemTypes_(v12, v13, 0);
    v33 = 0;
    LODWORD(v11) = objc_msgSend_setPrimaryRawSpeechProfile_error_(v14, v15, (uint64_t)v5, &v33);
    v16 = v33;
    v18 = v16;
    if ((_DWORD)v11)
    {
      v32 = v16;
      objc_msgSend_convertToKVProfileWithError_(v14, v17, (uint64_t)&v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v32;

      if (v19)
      {
        v21 = (void *)objc_opt_class();
        objc_msgSend_sandboxWithKVProfile_locale_error_(v21, v22, (uint64_t)v19, v9, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        goto LABEL_20;
      }
      v18 = v20;
    }
    v30 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[SEMSandbox sandboxWithRawSpeechProfile:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      _os_log_error_impl(&dword_2462C4000, v30, OS_LOG_TYPE_ERROR, "%s Failed to convert rawSpeechProfile using CESRRawSpeechProfileConverter due to error: %@", buf, 0x16u);
    }
    v23 = 0;
    if (a4 && v18)
    {
      v20 = objc_retainAutorelease(v18);
      v23 = 0;
      *a4 = v20;
    }
    else
    {
      v20 = v18;
    }
    goto LABEL_19;
  }
  v24 = (void *)MEMORY[0x24BDD1540];
  v38 = *MEMORY[0x24BDD0FC8];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Failed to extract locale identifier from profile: %@"), v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v25;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, (uint64_t)&v39, &v38, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v24, v28, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.sandbox"), 3, v27);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v29 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[SEMSandbox sandboxWithRawSpeechProfile:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v20;
    _os_log_error_impl(&dword_2462C4000, v29, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
  }
  v23 = 0;
  if (a4 && v20)
  {
    v20 = objc_retainAutorelease(v20);
    v23 = 0;
    *a4 = v20;
  }
LABEL_20:

  return v23;
}

+ (id)sandboxWithKVProfile:(id)a3 locale:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0;
    objc_msgSend_toSerializedSets_(v8, v9, (uint64_t)&v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v30;
    v12 = v11;
    if (v10)
    {
      v13 = (void *)objc_opt_class();
      objc_msgSend_sandboxWithSerializedSets_locale_error_(v13, v14, (uint64_t)v10, v7, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5 && v11)
        *a5 = objc_retainAutorelease(v11);
      v28 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "+[SEMSandbox sandboxWithKVProfile:locale:error:]";
        v33 = 2112;
        v34 = v12;
        _os_log_error_impl(&dword_2462C4000, v28, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v15 = 0;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = (objc_class *)objc_opt_class();

    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v17, v22, (uint64_t)CFSTR("Invalid profile: %@ expected %@"), v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v36, &v35, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v26, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.sandbox"), 3, v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && v12)
      *a5 = objc_retainAutorelease(v12);
    v27 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "+[SEMSandbox sandboxWithKVProfile:locale:error:]";
      v33 = 2112;
      v34 = v12;
      _os_log_error_impl(&dword_2462C4000, v27, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)sandboxWithSerializedSets:(id)a3 locale:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *IsSaved_setEnumerator_settings;
  const char *v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)MEMORY[0x24BE156D0];
  v8 = a4;
  objc_msgSend_setEnumeratorWithSerializedSets_(v7, v9, (uint64_t)a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  objc_msgSend_sandboxSettingsWithLocale_error_(SEMSandboxSettings, v11, (uint64_t)v8, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v34;
  v14 = v13;
  if (v12)
  {
    v15 = objc_alloc((Class)objc_opt_class());
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    IsSaved_setEnumerator_settings = (void *)objc_msgSend_initWithSandboxId_sandboxIsSaved_setEnumerator_settings_(v15, v22, (uint64_t)v21, 0, v10, v12);

    if (IsSaved_setEnumerator_settings)
    {
      v25 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "+[SEMSandbox sandboxWithSerializedSets:locale:error:]";
        _os_log_impl(&dword_2462C4000, v25, OS_LOG_TYPE_INFO, "%s Successfully staged profile data in SiriEntityMatcher Sandbox.", buf, 0xCu);
      }
      v26 = IsSaved_setEnumerator_settings;
    }
    else
    {
      v28 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDD0FC8];
      v36 = CFSTR("Failed to initialize SiriEntityMatcher Sandbox");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)&v36, &v35, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v28, v30, (uint64_t)CFSTR("com.apple.siri.inference.EntityMatcher.sandbox"), 2, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (a5 && v31)
        *a5 = objc_retainAutorelease(v31);
      v32 = qword_25441F970;
      if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "+[SEMSandbox sandboxWithSerializedSets:locale:error:]";
        v39 = 2112;
        v40 = v31;
        _os_log_error_impl(&dword_2462C4000, v32, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v14 = v31;
    }

  }
  else
  {
    if (a5 && v13)
      *a5 = objc_retainAutorelease(v13);
    v27 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "+[SEMSandbox sandboxWithSerializedSets:locale:error:]";
      v39 = 2112;
      v40 = v14;
      _os_log_error_impl(&dword_2462C4000, v27, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    IsSaved_setEnumerator_settings = 0;
  }

  return IsSaved_setEnumerator_settings;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462C8808;
  block[3] = &unk_25175EAA0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)SEMSandbox;
  -[SEMSandbox dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462C8950;
  block[3] = &unk_25175EAA0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)save
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2462C8AA8;
  block[3] = &unk_25175EAA0;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_sandboxId;
}

- (BOOL)_saveSettings
{
  void *v3;
  const char *v4;
  char v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getOrCreateDirectoryWithRelativePath_(self->_base, a2, (uint64_t)CFSTR("sandbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_writeObject_toFileWithName_inDirectory_(self->_base, v4, (uint64_t)self->_settings, CFSTR("settings"), v3);
  if ((v5 & 1) == 0)
  {
    v6 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[SEMSandbox _saveSettings]";
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_2462C4000, v6, OS_LOG_TYPE_ERROR, "%s Failed to save settings file to storage directory: %@", (uint8_t *)&v8, 0x16u);
    }
  }

  return v5;
}

- (id)_loadSavedSettings
{
  void *v3;
  SEMAuxiliaryFilesystemBase *base;
  uint64_t v5;
  const char *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getOrCreateDirectoryWithRelativePath_(self->_base, a2, (uint64_t)CFSTR("sandbox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  base = self->_base;
  v5 = objc_opt_class();
  objc_msgSend_readFileWithName_objectClass_inDirectory_(base, v6, (uint64_t)CFSTR("settings"), v5, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315650;
      v12 = "-[SEMSandbox _loadSavedSettings]";
      v13 = 2112;
      v14 = v3;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Failed to load settings file from saved sandbox storage directory: %@ got: %@", (uint8_t *)&v11, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)_loadSavedProfile
{
  void *v2;
  const char *v3;
  void *v4;
  const char *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getOrCreateDirectoryWithRelativePath_(self->_base, a2, (uint64_t)CFSTR("sandbox"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_relativeToURL_(MEMORY[0x24BDBCF48], v3, (uint64_t)CFSTR("profile"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend_profileWithContentsOfURL_error_(MEMORY[0x24BE5E8F8], v5, (uint64_t)v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[SEMSandbox _loadSavedProfile]";
      v14 = 2112;
      v15 = v2;
      v16 = 2112;
      v17 = v7;
      _os_log_error_impl(&dword_2462C4000, v9, OS_LOG_TYPE_ERROR, "%s Failed to load profile from saved sandbox storage directory: %@ error: %@", buf, 0x20u);
    }
  }

  return v6;
}

+ (id)_sandboxBaseNameWithId:(id)a3
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("Sandbox-%@"), a3);
}

- (id)rootDirectoryURL
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_2462C90E4;
  v10 = sub_2462C90F4;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_2462C90FC;
  v5[3] = &unk_25175EAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)appCustomVocabularySearcherWithUserId:(id)a3
{
  id v4;
  SEMFTSMatcher *v5;
  const char *v6;
  void *v7;
  SEMAppCustomVocabularySearcher *v8;
  const char *v9;
  void *v10;

  v4 = a3;
  v5 = [SEMFTSMatcher alloc];
  v7 = (void *)objc_msgSend_initWithFTSAccessProvider_(v5, v6, (uint64_t)self->_indexSiteReadAccess);
  v8 = [SEMAppCustomVocabularySearcher alloc];
  v10 = (void *)objc_msgSend_initWithUserId_ftsMatcher_(v8, v9, (uint64_t)v4, v7);

  return v10;
}

- (id)indexMatcher
{
  SEMSpanMatcher *v3;
  SEMIndexSiteReadAccess *indexSiteReadAccess;
  SEMSpanMatchResultInterpreter *v5;
  const char *v6;
  void *v7;

  v3 = [SEMSpanMatcher alloc];
  indexSiteReadAccess = self->_indexSiteReadAccess;
  v5 = objc_alloc_init(SEMSpanMatchResultInterpreter);
  v7 = (void *)objc_msgSend_initWithSkitAccessProvider_resultInterpreter_(v3, v6, (uint64_t)indexSiteReadAccess, v5);

  return v7;
}

- (NSString)sandboxId
{
  return self->_sandboxId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxId, 0);
  objc_storeStrong((id *)&self->_setEnumerator, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_indexSiteReadAccess, 0);
  objc_storeStrong((id *)&self->_indexSiteManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_rootDirectoryURL, 0);
  objc_storeStrong((id *)&self->_sandboxBaseName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
