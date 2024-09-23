@implementation PBDumpLogsWithBlock

void __PBDumpLogsWithBlock_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  const __CFString *v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 67109120;
    v12 = v3;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "Copying watch analytics collectAllLogs=%d...", buf, 8u);
  }

  v4 = objc_alloc_init(*(Class *)(a1 + 40));
  v9 = CFSTR("allFiles");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __PBDumpLogsWithBlock_block_invoke_200;
  v7[3] = &unk_24CBBDB58;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "request:transferGroupWithOptions:onComplete:", 0, v6, v7);

}

void __PBDumpLogsWithBlock_block_invoke_200(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  uint8_t buf[16];

  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __PBDumpLogsWithBlock_block_invoke_200_cold_1((uint64_t)v4, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "Watch diagnostic copy complete!", buf, 2u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __PBDumpLogsWithBlock_block_invoke_201;
  v7[3] = &unk_24CBBDB30;
  v8 = *(id *)(a1 + 32);
  v9 = v4 == 0;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

uint64_t __PBDumpLogsWithBlock_block_invoke_201(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __PBDumpLogsWithBlock_block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __PBDumpLogsWithBlock_block_invoke_200_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2113B6000, a2, OS_LOG_TYPE_ERROR, "Watch diagnostic copy failed. Error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
