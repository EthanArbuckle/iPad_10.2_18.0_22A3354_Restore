@implementation PNScoreConfiguration

- (PNScoreConfiguration)initWithScoreConfigurationDataType:(int64_t)a3 scoreConfigurationThemeType:(int64_t)a4
{
  PNScoreConfiguration *v6;
  PNScoreConfiguration *v7;
  uint64_t v8;
  NSString *name;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PNScoreConfiguration;
  v6 = -[PNScoreConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_dataType = a3;
    v6->_themeType = a4;
    +[PNScoreConfiguration scoreConfigurationNameForDataType:withThemeType:](PNScoreConfiguration, "scoreConfigurationNameForDataType:withThemeType:", a3, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v8;

  }
  return v7;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)themeType
{
  return self->_themeType;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)scoreConfigurationNamePrefixForDataType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("??");
  if (a3 == 1)
    v3 = CFSTR("IconicScore");
  if (a3)
    return (id)v3;
  else
    return CFSTR("WallpaperScore");
}

+ (id)scoreConfigurationNameSuffixForThemeType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("??");
  if (a3 == 1)
    v3 = CFSTR("Grouped By GeoHash");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Grouped By People");
}

+ (id)scoreConfigurationNameForDataType:(int64_t)a3 withThemeType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[PNScoreConfiguration scoreConfigurationNamePrefixForDataType:](PNScoreConfiguration, "scoreConfigurationNamePrefixForDataType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PNScoreConfiguration scoreConfigurationNameSuffixForThemeType:](PNScoreConfiguration, "scoreConfigurationNameSuffixForThemeType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)plistPathForPhotoLibrary:(id)a3 dataType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  +[PNScoreConfiguration scoreConfigurationNamePrefixForDataType:](PNScoreConfiguration, "scoreConfigurationNamePrefixForDataType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlForApplicationDataFolderIdentifier:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.plist"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
