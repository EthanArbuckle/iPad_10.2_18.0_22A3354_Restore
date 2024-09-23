@implementation SBFWallpaperConfigurationManager

- (NSArray)dataStores
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFWallpaperConfigurationManager;
  -[PBUIWallpaperConfigurationManager dataStores](&v3, sel_dataStores);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFWallpaperConfigurationManager;
  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:](&v5, sel_wallpaperConfigurationForVariant_includingValuesForTypes_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)wallpaperConfigurationForVariant:(int64_t)a3 includingValuesForTypes:(unint64_t)a4 wallpaperMode:(int64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFWallpaperConfigurationManager;
  -[PBUIWallpaperConfigurationManager wallpaperConfigurationForVariant:includingValuesForTypes:wallpaperMode:](&v6, sel_wallpaperConfigurationForVariant_includingValuesForTypes_wallpaperMode_, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
