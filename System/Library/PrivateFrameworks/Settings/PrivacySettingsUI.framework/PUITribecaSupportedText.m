@implementation PUITribecaSupportedText

void __PUITribecaSupportedText_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (aks_bak_get_beacon())
  {
    _PUILoggingFacility();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "PUITribecaSupportedText_block_invoke";
      _os_log_impl(&dword_1DB1FB000, v0, OS_LOG_TYPE_DEFAULT, "%s: didn't successfully find beacon.", buf, 0xCu);
    }
  }
  else
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "_initUniqueWithPath:", CFSTR("/System/Library/PrivateFrameworks/FindMyBeaconingSupport.framework"), 0);
    v0 = v1;
    if (v1)
    {
      -[NSObject localizedStringForKey:value:table:](v1, "localizedStringForKey:value:table:", CFSTR("E786CC8A-FAD0-49DB-9460-F27F248521CD"), &stru_1EA26D430, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2 && objc_msgSend(v2, "length"))
      {
        v4 = v3;
        v5 = PUITribecaSupportedText_text;
        PUITribecaSupportedText_text = (uint64_t)v4;
      }
      else
      {
        _PUILoggingFacility();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          __PUITribecaSupportedText_block_invoke_cold_1(v5);
      }

    }
  }

}

void __PUITribecaSupportedText_block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "PUITribecaSupportedText_block_invoke";
  _os_log_error_impl(&dword_1DB1FB000, log, OS_LOG_TYPE_ERROR, "%s: didn't find tribeca text.", (uint8_t *)&v1, 0xCu);
}

@end
