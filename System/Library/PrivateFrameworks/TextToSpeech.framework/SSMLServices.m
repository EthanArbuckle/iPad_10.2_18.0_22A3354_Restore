@implementation SSMLServices

+ (id)shared
{
  if (qword_1EE6D5698 != -1)
    dispatch_once(&qword_1EE6D5698, &unk_1E4A9F328);
  return (id)qword_1EE6D56A0;
}

- (id)generateSSMLFromString:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_generateSSMLFromString_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateSSMLFromAVSpeechUtterance:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_generateSSMLFromAVSpeechUtterance_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateSSMLFromPlainTalkString:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_generateSSMLFromPlainTalkString_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isSSMLValid:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_parseSSMLToPlainText_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_error(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)parseSSMLToPlainText:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_parseSSMLToPlainText_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parseSSMLToPlainTalk:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_parseSSMLToPlainTalk_(v4, v5, (uint64_t)v3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)convertRange:(_NSRange)a3 forSSML:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  SSMLServices *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  objc_msgSend_conversionWrapper(v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v18 = (void *)objc_opt_new();
    objc_msgSend_setConversionWrapper_(v8, v19, (uint64_t)v18, v20, v21);

  }
  objc_msgSend_conversionWrapper(v8, v14, v15, v16, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertRange_forSSML_(v22, v23, location, length, (uint64_t)v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v24;
}

- (SSMLServicesWrapper)conversionWrapper
{
  return self->_conversionWrapper;
}

- (void)setConversionWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_conversionWrapper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversionWrapper, 0);
}

@end
