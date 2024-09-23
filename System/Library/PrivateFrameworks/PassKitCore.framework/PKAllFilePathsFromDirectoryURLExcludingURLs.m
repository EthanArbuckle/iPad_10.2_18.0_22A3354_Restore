@implementation PKAllFilePathsFromDirectoryURLExcludingURLs

uint64_t ___PKAllFilePathsFromDirectoryURLExcludingURLs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    PKLogFacilityTypeGetObject(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_18FC92000, v6, OS_LOG_TYPE_ERROR, "Error: Failed to read directory contents: %@ at url: %@", (uint8_t *)&v10, 0x16u);

    }
  }

  return 1;
}

@end
