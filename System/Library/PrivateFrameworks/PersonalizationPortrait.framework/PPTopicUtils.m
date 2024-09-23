@implementation PPTopicUtils

+ (id)cachedTopicScoresAtPath:(id)a3
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithPath:error:", a3, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    pp_topics_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_ERROR, "Could not read Portrait topic cache plist: %@", buf, 0xCu);
    }

  }
  return v3;
}

@end
