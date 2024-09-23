@implementation TVLPersistenceManager

+ (id)documentsDirectory:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)recordingsDirectory:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "documentsDirectory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("tvlatency-recordings"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)URLForRecording
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordingsDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
LABEL_4:
    v10 = (void *)MEMORY[0x24BDD17C8];
    if (CurrentTimeStamp_onceToken != -1)
      dispatch_once(&CurrentTimeStamp_onceToken, &__block_literal_global_13);
    v11 = (void *)CurrentTimeStamp_ISO8601DateFormatter;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringWithFormat:", CFSTR("recording-%@.caf"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v18);
  v7 = v18;

  if ((v9 & 1) != 0)
    goto LABEL_4;
  if (_TVLLogDefault_onceToken_0 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_0, &__block_literal_global_0);
  v16 = (void *)_TVLLogDefault_log_0;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_0, OS_LOG_TYPE_ERROR))
    +[TVLPersistenceManager URLForRecording].cold.1(v16, v4);
  v15 = 0;
LABEL_12:

  return v15;
}

+ (id)allRecordingPaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordingsDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v6)
  {
    if (_TVLLogDefault_onceToken_0 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_0, &__block_literal_global_0);
    v7 = (void *)_TVLLogDefault_log_0;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_0, OS_LOG_TYPE_ERROR))
      +[TVLPersistenceManager allRecordingPaths].cold.1(v7, v4);
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (void)eraseAllRecordings
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3(a1);
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F2AB000, v5, v6, "Failed to remove directory at path %@ with error %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

+ (void)URLForRecording
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3(a1);
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F2AB000, v5, v6, "Failed to create recordings directory at path %@ with error %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

+ (void)allRecordingPaths
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_3(a1);
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21F2AB000, v5, v6, "Failed to retrieve contents of directory at path %@ with error %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

@end
