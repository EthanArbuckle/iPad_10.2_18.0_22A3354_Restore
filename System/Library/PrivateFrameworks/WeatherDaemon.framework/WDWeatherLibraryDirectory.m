@implementation WDWeatherLibraryDirectory

void __WDWeatherLibraryDirectory_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v0 = WDSystemDirectoryDirectoryPath();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v0, 4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  free(v0);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLByAppendingPathComponent:", CFSTR("Weather"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)WDWeatherLibraryDirectory_URL;
  WDWeatherLibraryDirectory_URL = v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", WDWeatherLibraryDirectory_URL, 1, 0, 0);

}

@end
