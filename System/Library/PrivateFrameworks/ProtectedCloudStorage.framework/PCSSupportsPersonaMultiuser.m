@implementation PCSSupportsPersonaMultiuser

void __PCSSupportsPersonaMultiuser_block_invoke()
{
  const char *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PCSSupportsPersonaMultiuser_ffPCSSupportsPersonaMultiuserStatus = _os_feature_enabled_impl();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    if (PCSSupportsPersonaMultiuser_ffPCSSupportsPersonaMultiuserStatus)
      v0 = "enabled";
    else
      v0 = "disabled";
    v1 = 136315138;
    v2 = v0;
    _os_log_impl(&dword_1A9508000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PCSSupportsMultiuser is %s", (uint8_t *)&v1, 0xCu);
  }
}

@end
