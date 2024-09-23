@implementation TTSRegexCache

+ (id)sharedInstance
{
  if (qword_1ED1B5CC0 != -1)
    dispatch_once(&qword_1ED1B5CC0, &unk_1E4A9F488);
  return (id)qword_1ED1B5B80;
}

- (TTSRegexCache)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  TTSRegexCache *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TTSRegexCache;
  v6 = -[TTSRegexCache init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v2, v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCache_(v6, v8, (uint64_t)v7, v9, v10);

    v6->_regexCacheLock._os_unfair_lock_opaque = 0;
  }
  return v6;
}

- (id)regexForString:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_regexForString_atStart_(self, a2, (uint64_t)a3, 0, v3);
}

- (id)regexForString:(id)a3 atStart:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  id v17;
  id v19;
  id v20;
  id v21[6];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a4;
  v9 = a3;
  v10 = v9;
  if (v4)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v6, (uint64_t)CFSTR("^%@"), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1A39959D0;
  v28 = sub_1A39959E0;
  v29 = 0;
  v21[1] = (id)MEMORY[0x1E0C809B0];
  v21[2] = (id)3221225472;
  v21[3] = sub_1A39959E8;
  v21[4] = &unk_1E4AA1758;
  v23 = &v24;
  v21[5] = self;
  v11 = v10;
  v22 = v11;
  AX_PERFORM_WITH_LOCK();
  v12 = (void *)v25[5];
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB38E8]);
    v21[0] = 0;
    v16 = (void *)objc_msgSend_initWithPattern_options_error_(v14, v15, (uint64_t)v11, 1, (uint64_t)v21);
    v17 = v21[0];
    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        sub_1A3AB32A8((uint64_t)v17);
      v13 = 0;
    }
    else
    {
      v19 = v16;
      v20 = v11;
      AX_PERFORM_WITH_LOCK();
      v13 = v19;

    }
  }

  _Block_object_dispose(&v24, 8);
  return v13;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
