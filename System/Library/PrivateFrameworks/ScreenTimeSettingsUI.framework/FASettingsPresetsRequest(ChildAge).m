@implementation FASettingsPresetsRequest(ChildAge)

- (void)st_fetchCachedPresetsWithCompletion:()ChildAge
{
  id v4;
  SEL v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = NSSelectorFromString(CFSTR("fetchCachedPresetsWithCompletion:"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = _Block_copy(v4);
    objc_msgSend(a1, "performSelector:withObject:", v5, v6);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FASettingsPresetsRequest(ChildAge) st_fetchCachedPresetsWithCompletion:].cold.1();
    v7 = objc_alloc(MEMORY[0x24BE30B20]);
    v8 = (void *)objc_msgSend(v7, "initWithAvailablePresets:expectedPreset:currentPreset:", MEMORY[0x24BDBD1A8], 0, 0);
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v8, 0);

  }
}

- (void)st_fetchCachedPresetsWithCompletion:()ChildAge .cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "fetchCachedPresetsWithCompletion not available", v0, 2u);
}

@end
