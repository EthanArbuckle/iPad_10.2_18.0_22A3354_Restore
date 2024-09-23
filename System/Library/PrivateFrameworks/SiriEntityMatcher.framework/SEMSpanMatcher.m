@implementation SEMSpanMatcher

+ (void)initialize
{
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

+ (id)indexMatcher
{
  uint64_t v2;
  void *v3;
  SEMSpanMatchResultInterpreter *v4;
  id v5;
  const char *v6;
  void *v7;

  objc_msgSend_defaultSharedInstance(SEMIndexSiteReadAccess, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(SEMSpanMatchResultInterpreter);
  v5 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)objc_msgSend_initWithSkitAccessProvider_resultInterpreter_(v5, v6, (uint64_t)v3, v4);

  return v7;
}

+ (id)injectedEntityMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  SEMSkitInjector *v9;
  const char *v10;
  void *v11;
  const char *v12;
  SEMSpanMatchResultInterpreter *v13;
  id v14;
  const char *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = [SEMSkitInjector alloc];
  v11 = (void *)objc_msgSend_initWithTokenizer_error_(v9, v10, (uint64_t)v8, a5);

  if (v11 && objc_msgSend_setEntityPool_error_(v11, v12, (uint64_t)v7, a5))
  {
    v13 = objc_alloc_init(SEMSpanMatchResultInterpreter);
    v14 = objc_alloc((Class)objc_opt_class());
    v16 = (void *)objc_msgSend_initWithSkitAccessProvider_resultInterpreter_(v14, v15, (uint64_t)v11, v13);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)itemMatcher:(id)a3 tokenizer:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend_injectedEntityMatcher_tokenizer_error_(v9, v10, (uint64_t)v8, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SEMSpanMatcher)initWithSkitAccessProvider:(id)a3 resultInterpreter:(id)a4
{
  id v7;
  id v8;
  SEMSpanMatcher *v9;
  SEMSpanMatcher *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SEMSpanMatcher;
  v9 = -[SEMSpanMatcher init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_skitProvider, a3);
    objc_storeStrong((id *)&v10->_interpreter, a4);
  }

  return v10;
}

- (SEMSpanMatcher)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)setEntityPool:(id)a3 error:(id *)a4
{
  return objc_msgSend_setEntityPool_error_(self->_skitProvider, a2, (uint64_t)a3, a4);
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_matchSpans_userId_error_, a3);
}

- (id)matchSpans:(id)a3 userId:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  _DWORD v32[2];
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = qword_25441F970;
  v10 = a4;
  v11 = os_signpost_id_generate(v9);
  v12 = (id)qword_25441F970;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v32[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_2462C4000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "matchSpans", (const char *)&unk_24633E77F, (uint8_t *)v32, 2u);
  }

  objc_msgSend__matchSpans_userId_error_(self, v14, (uint64_t)v8, v10, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (id)qword_25441F970;
    v17 = v16;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      v20 = objc_msgSend_tokenCount(v8, v18, v19);
      v23 = objc_msgSend_count(v15, v21, v22);
      objc_msgSend_locale(v8, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localeIdentifier(v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = 67240706;
      v32[1] = v20;
      v33 = 1026;
      v34 = v23;
      v35 = 2114;
      v36 = v29;
      _os_signpost_emit_with_name_impl(&dword_2462C4000, v17, OS_SIGNPOST_INTERVAL_END, v11, "matchSpans", " queryTokenCnt=%{public,signpost.telemetry:number1}d  resultCnt=%{public,signpost.telemetry:number2}d  locale=%{public,signpost.telemetry:string1}@  enableTelemetry=YES ", (uint8_t *)v32, 0x18u);

    }
    v30 = v15;
  }

  return v15;
}

- (id)_matchSpans:(id)a3 userId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend__searchSkit_userId_error_(self, v10, (uint64_t)v8, 0, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_7;
  if (!v9 || !objc_msgSend_supportsMultiUser(self->_skitProvider, v11, v12))
    goto LABEL_6;
  objc_msgSend__searchSkit_userId_error_(self, v11, (uint64_t)v8, v9, a5);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v16 = (void *)v14;
  objc_msgSend_addObjectsFromArray_(v13, v15, v14);

LABEL_6:
  objc_msgSend_interpretSpanMatchResults_ofQuery_(self->_interpreter, v11, (uint64_t)v13, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v17;
}

- (id)_searchSkit:(id)a3 userId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  void *v16;
  _BOOL4 v17;
  const char *v18;
  SEMSkitAccessProvider *skitProvider;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  SEMSkitAccessProvider *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  SEMSkitAccessProvider *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  int v39;
  void *v40;
  void *v41;
  SEMSkitAccessProvider *v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  sub_2462ECDC8(v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_skitReadAccessWithUserId_(self->_skitProvider, v11, (uint64_t)v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_useSensitiveLogging(SEMSettings, v13, v14);
  v16 = (void *)qword_25441F970;
  v17 = os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (!v17)
      goto LABEL_7;
    skitProvider = self->_skitProvider;
    v20 = v16;
    objc_msgSend_accessDescription(skitProvider, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315907;
    v50 = "-[SEMSpanMatcher _searchSkit:userId:error:]";
    v51 = 2112;
    v52 = v10;
    v53 = 2112;
    v54 = v23;
    v55 = 2117;
    v56 = v8;
    v24 = "%s (%@) Searching SKIT %@: %{sensitive}@";
  }
  else
  {
    if (!v17)
      goto LABEL_7;
    v25 = self->_skitProvider;
    v20 = v16;
    objc_msgSend_accessDescription(v25, v26, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v50 = "-[SEMSpanMatcher _searchSkit:userId:error:]";
    v51 = 2112;
    v52 = v10;
    v53 = 2112;
    v54 = v23;
    v55 = 2112;
    v56 = v8;
    v24 = "%s (%@) Searching SKIT %@: %@";
  }
  _os_log_impl(&dword_2462C4000, v20, OS_LOG_TYPE_INFO, v24, buf, 0x2Au);

LABEL_7:
  v48 = 0;
  objc_msgSend_matchSpans_error_(v12, v18, (uint64_t)v8, &v48);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v48;
  v30 = v29;
  if (!v28)
  {
    sub_2462CE41C(v29, 6, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      v43 = self->_skitProvider;
      v44 = v41;
      objc_msgSend_accessDescription(v43, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v50 = "-[SEMSpanMatcher _searchSkit:userId:error:]";
      v51 = 2112;
      v52 = v10;
      v53 = 2112;
      v54 = v47;
      v55 = 2112;
      v56 = v40;
      _os_log_error_impl(&dword_2462C4000, v44, OS_LOG_TYPE_ERROR, "%s (%@) Failed to search SKIT (%@) for matching spans. Error: %@", buf, 0x2Au);

      if (a5)
      {
LABEL_12:
        if (v40)
          *a5 = objc_retainAutorelease(v40);
      }
    }
    else if (a5)
    {
      goto LABEL_12;
    }

    goto LABEL_15;
  }
  v31 = (void *)qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v32 = self->_skitProvider;
    v33 = v31;
    objc_msgSend_accessDescription(v32, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend_count(v28, v37, v38);
    *(_DWORD *)buf = 136315906;
    v50 = "-[SEMSpanMatcher _searchSkit:userId:error:]";
    v51 = 2112;
    v52 = v10;
    v53 = 2112;
    v54 = v36;
    v55 = 1024;
    LODWORD(v56) = v39;
    _os_log_impl(&dword_2462C4000, v33, OS_LOG_TYPE_INFO, "%s (%@) %@ search matched %u results", buf, 0x26u);

  }
LABEL_15:

  return v28;
}

- (id)indexLocale:(id *)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_indexLocaleWithUserId_error_, 0);
}

- (id)indexLocaleWithUserId:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;

  v6 = a3;
  objc_msgSend_skitReadAccessWithUserId_(self->_skitProvider, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexLocale(v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  objc_msgSend_skitReadAccessWithUserId_(self->_skitProvider, v12, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexLocale(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_6:

LABEL_7:
    if (!v11)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      sub_2462ECDC8(v6, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v19, v21, (uint64_t)CFSTR("Failed to read index locale (%@)"), v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2462CE41C(0, 6, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 && v23)
        *a4 = objc_retainAutorelease(v23);

    }
    v11 = v11;
    v24 = v11;
    goto LABEL_13;
  }
  if (!v11 || objc_msgSend_isEqual_(v16, v17, (uint64_t)v11))
  {
    v18 = v16;

    v11 = v18;
    goto LABEL_6;
  }
  v26 = (void *)MEMORY[0x24BDD17C8];
  sub_2462ECDC8(v6, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeIdentifier(v11, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeIdentifier(v16, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v26, v34, (uint64_t)CFSTR("Inconsistent locales (%@) Default: %@ UserEx: %@"), v27, v30, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2462CE41C(0, 6, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v36)
    *a4 = objc_retainAutorelease(v36);

  v24 = 0;
LABEL_13:

  return v24;
}

- (void)prewarmIndex
{
  MEMORY[0x24BEDD108](self, sel_prewarmIndexWithUserId_, 0);
}

- (void)prewarmIndexWithUserId:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  objc_msgSend_skitReadAccessWithUserId_(self->_skitProvider, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prewarm(v5, v6, v7);

  v9 = v13;
  if (v13)
  {
    objc_msgSend_skitReadAccessWithUserId_(self->_skitProvider, v8, (uint64_t)v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_prewarm(v10, v11, v12);

    v9 = v13;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpreter, 0);
  objc_storeStrong((id *)&self->_skitProvider, 0);
}

@end
