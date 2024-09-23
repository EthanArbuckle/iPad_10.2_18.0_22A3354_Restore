@implementation WFConsumeExtensionTokens

id __WFConsumeExtensionTokens_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(a2);
  objc_msgSend(v2, "UTF8String");
  v3 = sandbox_extension_consume();
  if (v3 < 0)
  {
    getWFVoiceShortcutClientLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315394;
      v8 = "WFConsumeExtensionTokens_block_invoke";
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_1AF681000, v5, OS_LOG_TYPE_FAULT, "%s Error consuming granted extension token: %@", (uint8_t *)&v7, 0x16u);
    }

    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
