@implementation SPRLogger

+ (NSString)subsystem
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_current(SPRMeta, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

+ (OS_os_log)pinCrypto
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215977BD8;
  block[3] = &unk_24D3CCD88;
  block[4] = a1;
  if (qword_254DEDF60 != -1)
    dispatch_once(&qword_254DEDF60, block);
  return (OS_os_log *)(id)qword_254DEDF68;
}

+ (OS_os_log)xpcClient
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_215977C9C;
  block[3] = &unk_24D3CCD88;
  block[4] = a1;
  if (qword_254DEDF70 != -1)
    dispatch_once(&qword_254DEDF70, block);
  return (OS_os_log *)(id)qword_254DEDF78;
}

@end
