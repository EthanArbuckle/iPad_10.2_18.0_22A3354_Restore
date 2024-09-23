@implementation NFHardwareSerialWriteBlock

ssize_t __NFHardwareSerialWriteBlock_block_invoke(uint64_t a1)
{
  ssize_t result;
  uint64_t v3;
  uint64_t v4;
  ssize_t v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  int *v9;
  char *v10;
  int *v11;
  NSObject *v12;
  int *v13;
  char *v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  result = write(**(_DWORD **)(a1 + 40), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 160));
  if (result < 0)
  {
    v6 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      v9 = __error();
      v10 = strerror(*v9);
      v11 = __error();
      v8(3, "%s:%i \"%s\" errno=%d ", "NFHardwareSerialWriteBlock_block_invoke", 742, v10, *v11);
    }
    dispatch_get_specific(*v6);
    v12 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = __error();
      v14 = strerror(*v13);
      v15 = *__error();
      *(_DWORD *)buf = 136446978;
      v17 = "NFHardwareSerialWriteBlock_block_invoke";
      v18 = 1024;
      v19 = 742;
      v20 = 2080;
      v21 = v14;
      v22 = 1024;
      v23 = v15;
      _os_log_impl(&dword_2295E9000, v12, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v3 + 160) = 0;
    goto LABEL_9;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152) += result;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 160);
  *(_DWORD *)(v3 + 168) += result;
  v5 = v4 - result;
  *(_QWORD *)(v3 + 160) = v5;
  if (!v5)
  {
LABEL_9:
    *(_QWORD *)(v3 + 152) = 0;
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 136));
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 144);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

@end
