id REHomeBundle()
{
  if (qword_255D67488 != -1)
    dispatch_once(&qword_255D67488, &unk_24F870120);
  return (id)qword_255D67480;
}

void sub_22D267F2C()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_255D67480;
  qword_255D67480 = v0;

}

BOOL REHomeAlwaysShow()
{
  if (qword_255D67490 != -1)
    dispatch_once(&qword_255D67490, &unk_24F870140);
  if (!byte_255D67498)
    return 0;
  if (qword_255D674A0 != -1)
    dispatch_once(&qword_255D674A0, &unk_24F870160);
  return byte_255D67499 != 0;
}

id REHomeContent(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x24BE7D070];
  v4 = a2;
  v5 = a1;
  v6 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

  REHomeImageNamed(CFSTR("SG_Home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOverrideBodyImage:", v8);
  v9 = (void *)MEMORY[0x24BDD17C8];
  REHomeLocalizedString(CFSTR("UP_NEXT_HOME_SCENE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB8798], "textProviderWithText:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setHeaderTextProvider:", v12);
  objc_msgSend(MEMORY[0x24BDB8798], "textProviderWithText:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDescription1TextProvider:", v13);

  objc_msgSend(v6, "setDescription1FontStyle:", 3);
  return v6;
}

id REHomeImageNamed(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  REHomeBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  REImageNamedFromBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id REHomeLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  REHomeBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_24F870220, CFSTR("HomeDataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t sub_22D2681FC()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  byte_255D67498 = result;
  return result;
}

void sub_22D268218()
{
  void *v0;
  id v1;
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[16];
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  if (!qword_255D674A8)
  {
    *(_OWORD *)buf = xmmword_24F870180;
    v14 = 0;
    qword_255D674A8 = _sl_dlopen();
  }
  if (qword_255D674A8)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v0 = (void *)qword_255D674B0;
    v12 = qword_255D674B0;
    if (!qword_255D674B0)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      v14 = sub_22D268450;
      v15 = &unk_24F8701A0;
      v16 = &v9;
      sub_22D268450((uint64_t)buf);
      v0 = (void *)v10[3];
    }
    v1 = objc_retainAutorelease(v0);
    _Block_object_dispose(&v9, 8);
    objc_msgSend(v1, "globalDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v3 = objc_msgSend(v2, "_BOOLValueForKey:set:", CFSTR("HomeAlwaysShow"), &v8);
  if (v8)
    v4 = v3;
  else
    v4 = 0;
  RELogForDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_22D267000, v5, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key HomeAlwaysShow: %@", buf, 0xCu);

  }
  if (v8)
    v7 = v4;
  else
    v7 = 0;
  byte_255D67499 = v7;
}

void sub_22D268430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_22D268450(uint64_t a1)
{
  Class result;

  if (!qword_255D674A8)
  {
    qword_255D674A8 = _sl_dlopen();
    if (!qword_255D674A8)
    {
      abort_report_np();
LABEL_6:
      sub_22D268714();
    }
  }
  result = objc_getClass("_REEngineDefaults");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  qword_255D674B0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D268714()
{
  abort_report_np();
  REImageNamedFromBundle();
}

uint64_t REImageNamedFromBundle()
{
  return MEMORY[0x24BE7D138]();
}

uint64_t RELogForDomain()
{
  return MEMORY[0x24BE7D0F0]();
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return MEMORY[0x24BE7D140]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _REGetIsInternalBuild()
{
  return MEMORY[0x24BE7D130]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

