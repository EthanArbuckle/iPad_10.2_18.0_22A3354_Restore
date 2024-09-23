@implementation PLRecordLibrarySizeWithReason

void __PLRecordLibrarySizeWithReason_block_invoke(uint64_t a1)
{
  unint64_t v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  if (v1 > 2)
    v2 = 0;
  else
    v2 = off_1E366BE60[v1];
  objc_msgSend(*(id *)(a1 + 32), "librarySizesFromDB");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v2;
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(CFSTR("iCPL-welcome-librarySize"), v7, CFSTR("com.apple.mobileslideshow"));
  PLPreferencesGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Recording library size result %@", buf, 0xCu);
  }

}

@end
