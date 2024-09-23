@implementation SIOutputData

+ (id)initWithConfig:(id)a3
{
  id v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "algorithmOutputClassName");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v4)), "initWithConfig:", v3);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136380931;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
      v11 = 1025;
      v12 = 18;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** algorithm output class name is not specified in the subclass ***", (uint8_t *)&v9, 0x12u);
    }

    v6 = 0;
  }

  return v6;
}

- (SIOutputData)initWithConfig:(id)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136380931;
    v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
    v8 = 1025;
    v9 = 24;
    _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** init function for output data should be implemented by the subclass ***", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

- (BOOL)copyDataTo:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
    v7 = 1025;
    v8 = 30;
    _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Not Supported for output data ***", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (BOOL)saveToDisk:(id)a3 identifier:(id)a4
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 136380931;
    v7 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
    v8 = 1025;
    v9 = 36;
    _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** saveToDisk function for output data should be implemented by the subclass ***", (uint8_t *)&v6, 0x12u);
  }

  return 0;
}

+ (BOOL)ensureDirectoryExist:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v12);

  if ((v5 & 1) == 0)
  {
    __SceneIntelligenceLogSharedInstance();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136381187;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
      v15 = 1025;
      v16 = 47;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_21071A000, v7, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** Path %@ does not exist in the system, create one to save the output data. ***", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v6 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v11);
    v9 = v11;

    goto LABEL_10;
  }
  if (!v12)
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381187;
      v14 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIData.m";
      v15 = 1025;
      v16 = 50;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Path %@ exists, but it is not a directory ***", buf, 0x1Cu);
    }
    v6 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
