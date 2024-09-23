@implementation SEMSkitInfo

+ (id)readOnlySkitInfoAtDirectory:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *Only_error;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  Only_error = (void *)objc_msgSend_initWithSkitDirectory_readOnly_error_(v4, v5, (uint64_t)v3, 1, 0);

  return Only_error;
}

+ (id)writableSkitInfoAtDirectory:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const char *v7;
  void *Only_error;

  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  Only_error = (void *)objc_msgSend_initWithSkitDirectory_readOnly_error_(v6, v7, (uint64_t)v5, 0, a4);

  return Only_error;
}

- (SEMSkitInfo)initWithSkitDirectory:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  SEMSkitInfo *v9;
  SEMDictionaryLog *v10;
  const char *v11;
  uint64_t Only_error;
  SEMDictionaryLog *log;
  SEMSkitInfo *v14;
  objc_super v16;

  v6 = a4;
  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SEMSkitInfo;
  v9 = -[SEMSkitInfo init](&v16, sel_init);
  if (v9
    && (v10 = [SEMDictionaryLog alloc],
        Only_error = objc_msgSend_initWithFilename_directory_readOnly_error_(v10, v11, (uint64_t)CFSTR("Info"), v8, v6, a5), log = v9->_log, v9->_log = (SEMDictionaryLog *)Only_error, log, !v9->_log))
  {
    v14 = 0;
  }
  else
  {
    v14 = v9;
  }

  return v14;
}

- (NSNumber)localeType
{
  void *pending;

  pending = self->_pending;
  if (!pending)
    pending = self->_log;
  objc_msgSend_objectForKey_(pending, a2, (uint64_t)CFSTR("localeType"));
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)indexFeatures
{
  void *pending;

  pending = self->_pending;
  if (!pending)
    pending = self->_log;
  objc_msgSend_objectForKey_(pending, a2, (uint64_t)CFSTR("index_features"));
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_createPendingLog
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *pending;
  const char *v9;
  id v10;

  if (!self->_pending)
  {
    objc_msgSend_localeType(self, a2, v2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexFeatures(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    pending = self->_pending;
    self->_pending = v7;

    if (v10)
      objc_msgSend_updateLocaleType_(self, v9, (uint64_t)v10);
    if (v6)
      objc_msgSend_updateIndexFeatures_(self, v9, (uint64_t)v6);

  }
}

- (void)clear
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  objc_msgSend__createPendingLog(self, a2, v2);
  objc_msgSend_removeAllObjects(self->_pending, v4, v5);
  self->_clear = 1;
}

- (void)updateLocaleType:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend__createPendingLog(self, v4, v5);
  objc_msgSend_setObject_forKey_(self->_pending, v6, (uint64_t)v7, CFSTR("localeType"));

}

- (void)updateIndexFeatures:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend__createPendingLog(self, v4, v5);
  objc_msgSend_setObject_forKey_(self->_pending, v6, (uint64_t)v7, CFSTR("index_features"));

}

- (void)rollbackUpdates
{
  NSMutableDictionary *pending;

  pending = self->_pending;
  self->_pending = 0;

  self->_clear = 0;
}

- (BOOL)commitUpdates:(id *)a3
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  const char *v21;
  char v22;
  const char *v23;
  uint64_t v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_clear && (objc_msgSend_clear_(self->_log, a2, (uint64_t)a3) & 1) == 0)
  {
    objc_msgSend_rollbackUpdates(self, a2, (uint64_t)a3);
    return 0;
  }
  else
  {
    objc_msgSend_allKeys(self->_pending, a2, (uint64_t)a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v9 = objc_msgSend_count(v5, v7, v8);
    v11 = (void *)objc_msgSend_initWithCapacity_(v6, v10, v9);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v5;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v26, v30, 16);
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v12);
          objc_msgSend_objectForKey_(self->_pending, v15, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), (_QWORD)v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v11, v20, (uint64_t)v19);

        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v26, v30, 16);
      }
      while (v16);
    }

    v22 = objc_msgSend_writeUpdatedObjects_forKeys_error_(self->_log, v21, (uint64_t)v11, v12, a3);
    objc_msgSend_rollbackUpdates(self, v23, v24);

  }
  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
