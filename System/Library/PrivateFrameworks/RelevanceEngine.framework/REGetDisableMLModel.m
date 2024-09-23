@implementation REGetDisableMLModel

uint64_t __REGetDisableMLModel_block_invoke()
{
  uint64_t result;

  result = _REGetIsInternalBuild();
  _isInternalDevice_12 = result;
  return result;
}

void __REGetDisableMLModel_block_invoke_2()
{
  void *v0;
  unsigned int v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  char v5;
  char v6;
  uint8_t buf[16];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  if (!RelevanceEngineLibraryCore_frameworkLibrary_4)
  {
    *(_OWORD *)buf = xmmword_24CF91718;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (RelevanceEngineLibraryCore_frameworkLibrary_4)
  {
    objc_msgSend(soft__REEngineDefaults_2(), "globalDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = 0;
  }
  v1 = objc_msgSend(v0, "_BOOLValueForKey:set:", CFSTR("DisableMLModel"), &v6);
  if (v6)
    v2 = v1;
  else
    v2 = 0;
  RELogForDomain(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_DEFAULT, "Prefs reading value for key DisableMLModel: %@", buf, 0xCu);

  }
  if (v6)
    v5 = v2;
  else
    v5 = 0;
  REGetDisableMLModel__REValueDisableMLModel = v5;
}

@end
