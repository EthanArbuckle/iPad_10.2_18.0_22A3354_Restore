@implementation NSURL(Pasteboard)

- (uint64_t)_pb_isDirectory
{
  uint64_t v2;
  int v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v2 = *MEMORY[0x1E0C999D0];
  v10 = 0;
  v3 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v11, v2, &v10);
  v4 = v11;
  v5 = v10;
  if (v3)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    _PBLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_18C53A000, v7, OS_LOG_TYPE_INFO, "Warning: Cannot stat file at %@. Error: %@. Using -[NSURL hasDirectoryPath] instead.", buf, 0x16u);
    }

    v6 = objc_msgSend(a1, "hasDirectoryPath");
  }
  v8 = v6;

  return v8;
}

- (BOOL)_pb_isFileProvider
{
  return FPURLMightBeInFileProvider() != 0;
}

@end
