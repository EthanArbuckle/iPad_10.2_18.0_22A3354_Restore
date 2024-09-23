@implementation CoreImageOnlyLibrary

+ (id)url
{
  id v2;
  _QWORD v4[4];
  __CFString *v5;
  id v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = sub_24B6D68D8;
  v4[3] = &unk_251C8FA00;
  v4[1] = 3221225472;
  v5 = CFSTR("CoreImageKernels_only.ci");
  v6 = a1;
  if (qword_2579AEBC8 != -1)
    dispatch_once(&qword_2579AEBC8, v4);
  v2 = (id)qword_2579AEBC0;

  return v2;
}

+ (id)kernelWithName:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDBF668];
  v5 = a3;
  objc_msgSend_url(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_error_(v4, v9, (uint64_t)v5, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)kernelWithName:(id)a3 andOutputFormat:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x24BDBF668];
  v7 = a3;
  objc_msgSend_url(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_outputPixelFormat_error_(v6, v11, (uint64_t)v7, v10, v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)colorKernelWithName:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDBF640];
  v5 = a3;
  objc_msgSend_url(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_error_(v4, v9, (uint64_t)v5, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)colorKernelWithName:(id)a3 andOutputFormat:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x24BDBF640];
  v7 = a3;
  objc_msgSend_url(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_outputPixelFormat_error_(v6, v11, (uint64_t)v7, v10, v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)warpKernelWithName:(id)a3
{
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BDBF698];
  v5 = a3;
  objc_msgSend_url(a1, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_error_(v4, v9, (uint64_t)v5, v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)warpKernelWithName:(id)a3 andOutputFormat:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = *(_QWORD *)&a4;
  v6 = (void *)MEMORY[0x24BDBF698];
  v7 = a3;
  objc_msgSend_url(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cachedKernelWithFunctionName_fromMetalLibrary_outputPixelFormat_error_(v6, v11, (uint64_t)v7, v10, v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
