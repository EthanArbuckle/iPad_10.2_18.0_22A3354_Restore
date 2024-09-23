@implementation SPRSSEWrapper

+ (id)getSignedDeviceData:(id)a3 error:(id *)a4
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v5 = sub_2159808C4((const __CFData *)a3, (CFDataRef *)&v19);
  if ((_DWORD)v5 || (v10 = v19) == 0)
  {
    if (a4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("General reader error: SSEGetSignedDeviceData failed (%d)"), v7, v8, v9, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FC8];
      v21[0] = v11;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v21, (uint64_t)&v20, 1, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v12, v16, (uint64_t)CFSTR("SoftPosReader"), 4999, (uint64_t)v15, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = 0;
  }
  return v10;
}

+ (BOOL)isFeatureAppleSSESupported
{
  return sub_21597FD54(1) == 0;
}

@end
