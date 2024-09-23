@implementation CPBitmapStore(WeatherAppDataProtection)

- (uint64_t)setVersion:()WeatherAppDataProtection withOptions:
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4 | 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_versionPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "writeToFile:options:error:", v9, v5, 0);

  return objc_msgSend(a1, "version");
}

@end
