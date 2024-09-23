@implementation NFHardwareSerialReadBlock

uint64_t __NFHardwareSerialReadBlock_block_invoke(uint64_t a1)
{
  size_t v2;
  uintptr_t data;
  const void **v4;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  ssize_t v10;
  uint64_t v11;
  void (*v12)(_QWORD, uint64_t, const char *, char *, ssize_t);
  const char *v13;
  const void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  int *v17;
  char *v18;
  int *v19;
  NSObject *v20;
  int *v21;
  char *v22;
  int v23;
  uint64_t v24;
  const void **v25;
  void (*v26)(uint64_t, const char *, ...);
  NSObject *v27;
  uint64_t v28;
  const void **v30;
  void (*v31)(uint64_t, const char *, ...);
  NSObject *v32;
  const void **v33;
  void (*v34)(uint64_t, const char *, ...);
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uintptr_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  data = dispatch_source_get_data(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 112));
  if (data < v2)
  {
    v4 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
      Logger(6, "%s:%i Only %lu bytes available, requested %zu !", "NFHardwareSerialReadBlock_block_invoke", 673, data, *(_QWORD *)(a1 + 40));
    dispatch_get_specific(*v4);
    v6 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136446978;
      v36 = "NFHardwareSerialReadBlock_block_invoke";
      v37 = 1024;
      v38 = 673;
      v39 = 2048;
      v40 = (const char *)data;
      v41 = 2048;
      v42 = v7;
      _os_log_impl(&dword_2295E9000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only %lu bytes available, requested %zu !", buf, 0x26u);
    }
  }
  v8 = *(char **)(a1 + 56);
  if (!v8)
  {
    v30 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v31 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v31)
      v31(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 629, "buffer!=((void *)0)");
    dispatch_get_specific(*v30);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v36 = "_NFHardwareSerialRead";
      v37 = 1024;
      v38 = 629;
      v39 = 2080;
      v40 = "buffer!=((void *)0)";
LABEL_31:
      _os_log_impl(&dword_2295E9000, v32, OS_LOG_TYPE_ERROR, "%{public}s:%i FAILED: %s", buf, 0x1Cu);
    }
LABEL_32:
    abort();
  }
  if (!v2)
  {
    v33 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v34 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v34)
      v34(3, "%s:%i FAILED: %s", "_NFHardwareSerialRead", 630, "*length>0");
    dispatch_get_specific(*v33);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v36 = "_NFHardwareSerialRead";
      v37 = 1024;
      v38 = 630;
      v39 = 2080;
      v40 = "*length>0";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = read(*(_DWORD *)v9, *(void **)(a1 + 56), v2);
  if (v10 < 0)
  {
    v14 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v15 = NFLogGetLogger();
    if (v15)
    {
      v16 = (void (*)(uint64_t, const char *, ...))v15;
      v17 = __error();
      v18 = strerror(*v17);
      v19 = __error();
      v16(3, "%s:%i \"%s\" errno=%d ", "_NFHardwareSerialRead", 636, v18, *v19);
    }
    dispatch_get_specific(*v14);
    v20 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = __error();
      v22 = strerror(*v21);
      v23 = *__error();
      *(_DWORD *)buf = 136446978;
      v36 = "_NFHardwareSerialRead";
      v37 = 1024;
      v38 = 636;
      v39 = 2080;
      v40 = v22;
      v41 = 1024;
      LODWORD(v42) = v23;
      _os_log_impl(&dword_2295E9000, v20, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d ", buf, 0x22u);
    }
    v13 = 0;
  }
  else
  {
    v11 = *(_QWORD *)(v9 + 8);
    v12 = *(void (**)(_QWORD, uint64_t, const char *, char *, ssize_t))(v11 + 80);
    if (v12)
    {
      v12(*(unsigned __int8 *)(v11 + 96), 7, "[RX<]", v8, v10);
      v11 = *(_QWORD *)(v9 + 8);
    }
    NFHardwareSerialDebugLog(*(os_unfair_lock_s **)(v11 + 88), 3, v8, v10);
    v13 = (const char *)v10;
  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 112));
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  ++*(_DWORD *)(v24 + 120);
  *(_QWORD *)(v24 + 128) = 0;
  if ((unint64_t)v13 < *(_QWORD *)(a1 + 40))
  {
    v25 = (const void **)MEMORY[0x24BEDCDB0];
    dispatch_get_specific((const void *)*MEMORY[0x24BEDCDB0]);
    v26 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v26)
      v26(6, "%s:%i Only got %zu bytes, requested %zu, available %lu.", "NFHardwareSerialReadBlock_block_invoke", 688, (size_t)v13, *(_QWORD *)(a1 + 40), data);
    dispatch_get_specific(*v25);
    v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136447234;
      v36 = "NFHardwareSerialReadBlock_block_invoke";
      v37 = 1024;
      v38 = 688;
      v39 = 2048;
      v40 = v13;
      v41 = 2048;
      v42 = v28;
      v43 = 2048;
      v44 = data;
      _os_log_impl(&dword_2295E9000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Only got %zu bytes, requested %zu, available %lu.", buf, 0x30u);
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
