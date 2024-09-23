@implementation SEMIndexSiteReadAccess

+ (id)defaultSharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_24630C9A0;
  block[3] = &unk_251783388;
  block[4] = a1;
  if (qword_25441F930 != -1)
    dispatch_once(&qword_25441F930, block);
  return (id)qword_25441F928;
}

- (SEMIndexSiteReadAccess)initWithRootDirectoryURL:(id)a3 settings:(id)a4
{
  id v5;
  SEMIndexSiteReadAccess *v6;
  SEMIndexSiteCache *v7;
  const char *v8;
  uint64_t Only;
  SEMIndexSiteCache *indexSiteCache;
  objc_class *v11;
  id v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SEMIndexSiteReadAccess;
  v6 = -[SEMIndexSiteReadAccess init](&v19, sel_init);
  if (v6)
  {
    v7 = [SEMIndexSiteCache alloc];
    Only = objc_msgSend_initWithRootDirectoryURL_readOnly_(v7, v8, (uint64_t)v5, 1);
    indexSiteCache = v6->_indexSiteCache;
    v6->_indexSiteCache = (SEMIndexSiteCache *)Only;

    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend_cStringUsingEncoding_(v12, v13, 4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v16;

  }
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSMutableDictionary *skitAccessCache;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  char v24;
  id v25;
  NSObject *v26;
  NSMutableDictionary *databaseAccessCache;
  SEMIndexSiteReadAccess *v28;
  objc_super v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend_allValues(self->_skitAccessCache, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v35, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_deactivate(v10, v11, v12);
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v11, (uint64_t)&v35, v44, 16);
    }
    while (v7);
  }

  skitAccessCache = self->_skitAccessCache;
  self->_skitAccessCache = 0;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v28 = self;
  objc_msgSend_allValues(self->_databaseAccessCache, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v31, v43, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v21);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = 0;
          v24 = objc_msgSend_deactivateWithError_(v22, v23, (uint64_t)&v30);
          v25 = v30;
          if ((v24 & 1) == 0)
          {
            v26 = qword_25441F970;
            if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "-[SEMIndexSiteReadAccess dealloc]";
              v41 = 2112;
              v42 = v25;
              _os_log_error_impl(&dword_2462C4000, v26, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
            }
          }

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v23, (uint64_t)&v31, v43, 16);
    }
    while (v19);
  }

  databaseAccessCache = v28->_databaseAccessCache;
  v28->_databaseAccessCache = 0;

  v29.receiver = v28;
  v29.super_class = (Class)SEMIndexSiteReadAccess;
  -[SEMIndexSiteReadAccess dealloc](&v29, sel_dealloc);
}

+ (BOOL)_isFileNotFoundError:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  BOOL v13;

  objc_msgSend_underlyingErrors(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_domain(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqual_(v9, v10, *MEMORY[0x24BDD0B88]))
    v13 = objc_msgSend_code(v6, v11, v12) == 260;
  else
    v13 = 0;

  return v13;
}

- (id)skitReadAccessWithUserId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char isEvaluationEnabled;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v5, v6);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_24630CF24;
  v20 = sub_24630CF34;
  v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_24630CF3C;
  v12[3] = &unk_2517833B0;
  v12[4] = self;
  v13 = v4;
  v14 = &v16;
  v15 = isEvaluationEnabled ^ 1;
  v9 = v4;
  dispatch_sync(queue, v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (BOOL)supportsMultiUser
{
  return 1;
}

- (BOOL)setEntityPool:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accessDescription
{
  return CFSTR("Index");
}

- (id)ftsDatabaseReadAccessWithUserId:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  char isEvaluationEnabled;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(self->_settings, v5, v6);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_24630CF24;
  v20 = sub_24630CF34;
  v21 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_24630D394;
  v12[3] = &unk_2517833B0;
  v12[4] = self;
  v13 = v4;
  v14 = &v16;
  v15 = isEvaluationEnabled ^ 1;
  v9 = v4;
  dispatch_sync(queue, v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessCache, 0);
  objc_storeStrong((id *)&self->_skitAccessCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_indexSiteCache, 0);
}

@end
