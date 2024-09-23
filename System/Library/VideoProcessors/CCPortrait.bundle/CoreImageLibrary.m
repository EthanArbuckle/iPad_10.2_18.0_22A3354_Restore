@implementation CoreImageLibrary

- (id)url
{
  id v2;
  _QWORD v4[5];
  __CFString *v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = sub_24B6D651C;
  v4[3] = &unk_251C8F9D8;
  v4[1] = 3221225472;
  v4[4] = self;
  v5 = CFSTR("CoreImageKernels.ci");
  if (qword_2544D9CB8 != -1)
    dispatch_once(&qword_2544D9CB8, v4);
  v2 = (id)qword_2544D9CC0;

  return v2;
}

- (CoreImageLibrary)init
{
  CoreImageLibrary *v2;
  const char *v3;
  uint64_t v4;
  CoreImageLibrary *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  CoreImageLibrary *v20;
  CoreImageLibrary *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CoreImageLibrary;
  v2 = -[CoreImageLibrary init](&v23, sel_init);
  v5 = v2;
  if (v2)
  {
    v6 = (void *)MEMORY[0x24BDBF668];
    objc_msgSend_url(v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_kernelNamesFromMetalLibrary_(v6, v8, (uint64_t)v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend_count(v9, v10, v11))
      {
        objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v12, (uint64_t)v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setAvailableNames_(v5, v14, (uint64_t)v13);

      }
      else
      {
        uni_logger_compile();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          sub_24B6F0EA0(v15, v16, v17);

        objc_msgSend_setAvailableNames_(v5, v18, 0);
      }
    }

  }
  objc_msgSend_availableNames(v5, v3, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v20 = v5;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

- (id)kernelWithFunctionName:(id)a3 constants:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend_availableNames(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_containsObject_(v10, v11, (uint64_t)v6);

  if ((v12 & 1) != 0)
  {
    v15 = (void *)MEMORY[0x24BDBF668];
    objc_msgSend_url(self, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_constants_error_(v15, v17, (uint64_t)v6, v16, v7, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;

    if (!v18 || v19)
    {
      uni_logger_compile();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_24B6F0F18((uint64_t)v6, v19, (uint64_t)v21);

      v20 = 0;
    }
    else
    {
      v20 = v18;
    }

  }
  else
  {
    uni_logger_compile();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_24B6F0FB8(v6, v19);
    v20 = 0;
  }

  return v20;
}

- (NSSet)availableNames
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvailableNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableNames, 0);
}

@end
