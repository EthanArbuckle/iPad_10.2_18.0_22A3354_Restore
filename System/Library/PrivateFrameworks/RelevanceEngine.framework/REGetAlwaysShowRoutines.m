@implementation REGetAlwaysShowRoutines

uint64_t __REGetAlwaysShowRoutines_block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_10 = result;
  return result;
}

void __REGetAlwaysShowRoutines_block_invoke_2()
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
  if (!RelevanceEngineLibraryCore_frameworkLibrary_3)
  {
    *(_OWORD *)buf = xmmword_24CF90658;
    v14 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (RelevanceEngineLibraryCore_frameworkLibrary_3)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2050000000;
    v0 = (void *)get_REEngineDefaultsClass_softClass_2;
    v12 = get_REEngineDefaultsClass_softClass_2;
    if (!get_REEngineDefaultsClass_softClass_2)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      v14 = __get_REEngineDefaultsClass_block_invoke_2;
      v15 = &unk_24CF8AC38;
      v16 = &v9;
      __get_REEngineDefaultsClass_block_invoke_2((uint64_t)buf);
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
  v3 = objc_msgSend(v2, "_BOOLValueForKey:set:", CFSTR("AlwaysShowRoutines"), &v8);
  if (v8)
    v4 = v3;
  else
    v4 = 0;
  RELogForDomain(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_2132F7000, v5, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key AlwaysShowRoutines: %@", buf, 0xCu);

  }
  if (v8)
    v7 = v4;
  else
    v7 = 0;
  REGetAlwaysShowRoutines__REValueAlwaysShowRoutines = v7;
}

@end
