void sub_20E39839C(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sub_20E398518(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_20E3986F8((uint64_t)v2, v3);

}

void sub_20E3983F0(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  sub_20E398518(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_20E397000, v6, OS_LOG_TYPE_DEFAULT, "success %d", (uint8_t *)&v8, 8u);
  }

  sub_20E398518(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_20E397000, v7, OS_LOG_TYPE_DEFAULT, "error %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
}

id sub_20E398518(unint64_t a1)
{
  id v2;
  id v3;

  if (qword_253D3A580 != -1)
    dispatch_once(&qword_253D3A580, &unk_24C93CBE8);
  v2 = (id)MEMORY[0x24BDACB78];
  v3 = MEMORY[0x24BDACB78];
  if (a1 <= 1)
  {
    v2 = (id)qword_253D3A588[a1];

  }
  return v2;
}

void sub_20E398594()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.corerepair", "device");
  v1 = (void *)qword_253D3A588[0];
  qword_253D3A588[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.corerepair", "device-error");
  v3 = (void *)qword_253D3A590;
  qword_253D3A590 = (uint64_t)v2;

}

void sub_20E3986F8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20E397000, a2, OS_LOG_TYPE_ERROR, "Error:%@", (uint8_t *)&v2, 0xCu);
}

uint64_t AMFDRSealingMapGetEntry()
{
  return MEMORY[0x24BED4380]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

