@implementation SUSUIGetPasscodePolicy

void __SUSUIGetPasscodePolicy_block_invoke(id *a1)
{
  NSObject *log;
  os_log_type_t v2;
  id v3;
  uint8_t v5[7];
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14[3];

  v14[2] = a1;
  v14[1] = a1;
  v14[0] = objc_alloc_init(SUSUIControllerClient);
  if (v14[0])
  {
    v3 = v14[0];
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __SUSUIGetPasscodePolicy_block_invoke_2;
    v12 = &unk_24DA40840;
    v13 = a1[4];
    objc_msgSend(v3, "getPasscodePolicy:", &v8);
    objc_storeStrong(&v13, 0);
  }
  else
  {
    oslog = (os_log_t)SUSUILog();
    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      v2 = type;
      __os_log_helper_16_0_0(v5);
      _os_log_impl(&dword_218F45000, log, v2, "Failed to create SUSUIControllerClient, returning NotRequired", v5, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(void))a1[4] + 2))();
  }
  objc_storeStrong(v14, 0);
}

uint64_t __SUSUIGetPasscodePolicy_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
