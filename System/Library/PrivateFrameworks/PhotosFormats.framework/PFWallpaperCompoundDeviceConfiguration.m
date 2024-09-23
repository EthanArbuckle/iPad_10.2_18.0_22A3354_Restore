@implementation PFWallpaperCompoundDeviceConfiguration

- (BOOL)isEqual:(id)a3
{
  PFWallpaperCompoundDeviceConfiguration *v4;
  BOOL v5;

  v4 = (PFWallpaperCompoundDeviceConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PFWallpaperCompoundDeviceConfiguration isEqualToLayoutConfiguration:](self, "isEqualToLayoutConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToLayoutConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PFParallaxLayoutConfiguration *v7;
  void *v8;
  PFParallaxLayoutConfiguration *landscapeConfiguration;
  void *v10;
  BOOL v11;
  void *v12;
  PFParallaxLayoutConfiguration *portraitConfiguration;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_landscapeConfiguration)
      goto LABEL_3;
    objc_msgSend(v4, "landscapeConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      portraitConfiguration = self->_portraitConfiguration;
      objc_msgSend(v5, "portraitConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PFParallaxLayoutConfiguration isEqualToLayoutConfiguration:](portraitConfiguration, "isEqualToLayoutConfiguration:", v8);
LABEL_11:

      goto LABEL_12;
    }
    if (self->_landscapeConfiguration)
    {
LABEL_3:
      objc_msgSend(v5, "landscapeConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = self->_portraitConfiguration;
        objc_msgSend(v5, "portraitConfiguration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[PFParallaxLayoutConfiguration isEqualToLayoutConfiguration:](v7, "isEqualToLayoutConfiguration:", v8))
        {
          landscapeConfiguration = self->_landscapeConfiguration;
          objc_msgSend(v5, "landscapeConfiguration");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[PFParallaxLayoutConfiguration isEqualToLayoutConfiguration:](landscapeConfiguration, "isEqualToLayoutConfiguration:", v10);

        }
        else
        {
          v11 = 0;
        }
        goto LABEL_11;
      }
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (PFWallpaperCompoundDeviceConfiguration)initWithPortraitConfiguration:(id)a3 landscapeConfiguration:(id)a4
{
  PFParallaxLayoutConfiguration *v6;
  PFParallaxLayoutConfiguration *v7;
  PFParallaxLayoutConfiguration *v8;
  PFWallpaperCompoundDeviceConfiguration *v9;
  PFParallaxLayoutConfiguration *portraitConfiguration;
  PFParallaxLayoutConfiguration *v11;
  PFParallaxLayoutConfiguration *landscapeConfiguration;
  PFWallpaperCompoundDeviceConfiguration *v14;
  SEL v15;
  objc_super v16;

  v6 = (PFParallaxLayoutConfiguration *)a3;
  v7 = (PFParallaxLayoutConfiguration *)a4;
  if (v6)
  {
    v8 = v7;
    v16.receiver = self;
    v16.super_class = (Class)PFWallpaperCompoundDeviceConfiguration;
    v9 = -[PFWallpaperCompoundDeviceConfiguration init](&v16, sel_init);
    portraitConfiguration = v9->_portraitConfiguration;
    v9->_portraitConfiguration = v6;
    v11 = v6;

    landscapeConfiguration = v9->_landscapeConfiguration;
    v9->_landscapeConfiguration = v8;

    return v9;
  }
  else
  {
    v14 = (PFWallpaperCompoundDeviceConfiguration *)_PFAssertFailHandler();
    return (PFWallpaperCompoundDeviceConfiguration *)-[PFWallpaperCompoundDeviceConfiguration dictionaryRepresentation](v14, v15);
  }
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PFParallaxLayoutConfiguration dictionaryRepresentation](self->_portraitConfiguration, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayoutConfiguration dictionaryRepresentation](self->_landscapeConfiguration, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", &unk_1E45CB6B8);
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("portrait"));
  if (v4)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("landscape"));

  return v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFParallaxLayoutConfiguration description](self->_portraitConfiguration, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayoutConfiguration description](self->_landscapeConfiguration, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayoutConfiguration screenScale](self->_portraitConfiguration, "screenScale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p portrait:%@ landscape:%@ screenScale:%f>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFParallaxLayoutConfiguration debugDescription](self->_portraitConfiguration, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayoutConfiguration debugDescription](self->_landscapeConfiguration, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayoutConfiguration screenScale](self->_portraitConfiguration, "screenScale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p portrait:%@ landscape:%@ screenScale:%f>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PFWallpaperCompoundDeviceConfiguration portraitConfiguration](self, "portraitConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("portrait"));

  -[PFWallpaperCompoundDeviceConfiguration landscapeConfiguration](self, "landscapeConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("landscape"));

}

- (PFWallpaperCompoundDeviceConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PFWallpaperCompoundDeviceConfiguration *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portrait"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("landscape"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:](self, "initWithPortraitConfiguration:landscapeConfiguration:", v5, v6);
  return v7;
}

- (CGSize)deviceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_deviceSize.width;
  height = self->_deviceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PFParallaxLayoutConfiguration)portraitConfiguration
{
  return self->_portraitConfiguration;
}

- (PFParallaxLayoutConfiguration)landscapeConfiguration
{
  return self->_landscapeConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeConfiguration, 0);
  objc_storeStrong((id *)&self->_portraitConfiguration, 0);
}

+ (id)bestConfigurationForScreenSize:(CGSize)a3 screenScale:(double)a4
{
  double height;
  double width;
  PFWallpaperCompoundDeviceConfiguration *v7;
  void *v8;
  void *v9;
  PFWallpaperCompoundDeviceConfiguration *v10;

  height = a3.height;
  width = a3.width;
  v7 = [PFWallpaperCompoundDeviceConfiguration alloc];
  +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 1, width, height, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 2, width, height, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:](v7, "initWithPortraitConfiguration:landscapeConfiguration:", v8, v9);

  return v10;
}

+ (id)genericConfiguration
{
  PFWallpaperCompoundDeviceConfiguration *v2;
  void *v3;
  void *v4;
  PFWallpaperCompoundDeviceConfiguration *v5;

  v2 = [PFWallpaperCompoundDeviceConfiguration alloc];
  +[PFParallaxLayoutConfiguration genericConfigurationForOrientation:](PFParallaxLayoutConfiguration, "genericConfigurationForOrientation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFParallaxLayoutConfiguration genericConfigurationForOrientation:](PFParallaxLayoutConfiguration, "genericConfigurationForOrientation:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:](v2, "initWithPortraitConfiguration:landscapeConfiguration:", v3, v4);

  return v5;
}

+ (id)genericPadConfiguration
{
  PFWallpaperCompoundDeviceConfiguration *v2;
  void *v3;
  void *v4;
  PFWallpaperCompoundDeviceConfiguration *v5;

  v2 = [PFWallpaperCompoundDeviceConfiguration alloc];
  +[PFParallaxLayoutConfiguration genericPadConfigurationForOrientation:](PFParallaxLayoutConfiguration, "genericPadConfigurationForOrientation:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFParallaxLayoutConfiguration genericPadConfigurationForOrientation:](PFParallaxLayoutConfiguration, "genericPadConfigurationForOrientation:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:](v2, "initWithPortraitConfiguration:landscapeConfiguration:", v3, v4);

  return v5;
}

+ (id)callServicesConfigurationWithScreenSize:(CGSize)a3 titleBounds:(CGRect)a4 parallaxPadding:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat v7;
  double v8;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  PFParallaxLayoutConfiguration *v14;
  PFWallpaperCompoundDeviceConfiguration *v15;
  void *v17;
  SEL v18;
  double v19;
  CGRect v20;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.height;
  v12 = a3.width;
  if (CGRectIsEmpty(a4))
  {
    v17 = (void *)_PFAssertFailHandler();
    return +[PFWallpaperCompoundDeviceConfiguration genericCallServicesConfigurationWithTitleBounds:](v17, v18, v20);
  }
  else
  {
    v19 = v7;
    if (+[PFWallpaperCompoundDeviceConfiguration deviceSupportsLandscapeConfiguration](PFWallpaperCompoundDeviceConfiguration, "deviceSupportsLandscapeConfiguration"))
    {
      v13 = 2.0;
    }
    else
    {
      v13 = 3.0;
    }
    v14 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:", v12, v11, v13, x, y, v8, v19, *(_QWORD *)&width, *(_QWORD *)&height);
    v15 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v14, 0);

    return v15;
  }
}

+ (id)genericCallServicesConfigurationWithTitleBounds:(CGRect)a3
{
  return (id)objc_msgSend(a1, "callServicesConfigurationWithScreenSize:titleBounds:parallaxPadding:", PFDeviceScreenSize());
}

+ (id)deviceCallServicesConfigurationWithTitleBounds:(CGRect)a3
{
  return (id)objc_msgSend(a1, "callServicesConfigurationWithScreenSize:titleBounds:parallaxPadding:", PFDeviceScreenSize());
}

+ (id)deviceConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PFWallpaperCompoundDeviceConfiguration_deviceConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deviceConfiguration_onceToken[0] != -1)
    dispatch_once(deviceConfiguration_onceToken, block);
  return (id)deviceConfiguration_sDeviceConfiguration;
}

+ (BOOL)deviceSupportsLandscapeConfiguration
{
  if (deviceSupportsLandscapeConfiguration_onceToken != -1)
    dispatch_once(&deviceSupportsLandscapeConfiguration_onceToken, &__block_literal_global_123);
  return deviceSupportsLandscapeConfiguration_isPad;
}

+ (PFWallpaperCompoundDeviceConfiguration)configurationWithDeviceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "knownDeviceConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFWallpaperCompoundDeviceConfiguration *)v6;
}

+ (id)compoundDeviceConfigurationFromDictionary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PFWallpaperCompoundDeviceConfiguration *v11;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[PFParallaxLayoutConfiguration layoutConfigurationFromDictionary:error:](PFParallaxLayoutConfiguration, "layoutConfigurationFromDictionary:error:", v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v11 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v8, 0);
      goto LABEL_9;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("portrait"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFParallaxLayoutConfiguration layoutConfigurationFromDictionary:error:](PFParallaxLayoutConfiguration, "layoutConfigurationFromDictionary:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("landscape"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("landscape"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PFParallaxLayoutConfiguration layoutConfigurationFromDictionary:error:](PFParallaxLayoutConfiguration, "layoutConfigurationFromDictionary:error:", v10, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_8;
  }
  v11 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v8, v9);

LABEL_9:
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)knownDeviceConfigurations
{
  if (knownDeviceConfigurations_onceToken != -1)
    dispatch_once(&knownDeviceConfigurations_onceToken, &__block_literal_global_137);
  return (id)knownDeviceConfigurations_namedConfigs;
}

void __67__PFWallpaperCompoundDeviceConfiguration_knownDeviceConfigurations__block_invoke()
{
  PFWallpaperCompoundDeviceConfiguration *v0;
  PFWallpaperCompoundDeviceConfiguration *v1;
  PFParallaxLayoutConfiguration *v2;
  PFWallpaperCompoundDeviceConfiguration *v3;
  PFParallaxLayoutConfiguration *v4;
  PFWallpaperCompoundDeviceConfiguration *v5;
  PFParallaxLayoutConfiguration *v6;
  PFWallpaperCompoundDeviceConfiguration *v7;
  PFParallaxLayoutConfiguration *v8;
  PFWallpaperCompoundDeviceConfiguration *v9;
  PFParallaxLayoutConfiguration *v10;
  PFWallpaperCompoundDeviceConfiguration *v11;
  PFParallaxLayoutConfiguration *v12;
  PFParallaxLayoutConfiguration *v13;
  PFWallpaperCompoundDeviceConfiguration *v14;
  uint64_t v15;
  void *v16;
  PFWallpaperCompoundDeviceConfiguration *v17;
  PFParallaxLayoutConfiguration *v18;
  PFParallaxLayoutConfiguration *v19;
  PFParallaxLayoutConfiguration *v20;
  PFWallpaperCompoundDeviceConfiguration *v21;
  PFParallaxLayoutConfiguration *v22;
  PFWallpaperCompoundDeviceConfiguration *v23;
  PFParallaxLayoutConfiguration *v24;
  PFWallpaperCompoundDeviceConfiguration *v25;
  PFParallaxLayoutConfiguration *v26;
  PFWallpaperCompoundDeviceConfiguration *v27;
  PFWallpaperCompoundDeviceConfiguration *v28;
  PFParallaxLayoutConfiguration *v29;
  PFWallpaperCompoundDeviceConfiguration *v30;
  PFParallaxLayoutConfiguration *v31;
  PFWallpaperCompoundDeviceConfiguration *v32;
  PFParallaxLayoutConfiguration *v33;
  PFWallpaperCompoundDeviceConfiguration *v34;
  PFParallaxLayoutConfiguration *v35;
  PFWallpaperCompoundDeviceConfiguration *v36;
  PFParallaxLayoutConfiguration *v37;
  PFWallpaperCompoundDeviceConfiguration *v38;
  PFParallaxLayoutConfiguration *v39;
  PFWallpaperCompoundDeviceConfiguration *v40;
  PFParallaxLayoutConfiguration *v41;
  PFParallaxLayoutConfiguration *v42;
  void *v43;

  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 24);
  v41 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1170.0, 2532.0, 3.0, 81.0, 388.0, 1008.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v40 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v41, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, CFSTR("iPhone12"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, CFSTR("iPhone13"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, CFSTR("iPhone12Pro"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v40, CFSTR("iPhone13Pro"));
  v39 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 0x4053800000000000, 0x4068000000000000);
  v38 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v39, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v38, CFSTR("iPhone12Zoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v38, CFSTR("iPhone13Zoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v38, CFSTR("iPhone12ProZoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v38, CFSTR("iPhone13ProZoom"));
  v37 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1284.0, 2778.0, 3.0, 96.0, 430.0, 1092.0, 0x4053800000000000, 0x4068000000000000);
  v36 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v37, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v36, CFSTR("iPhone12ProMax"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v36, CFSTR("iPhone13ProMax"));
  v35 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 388.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v34 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v35, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v34, CFSTR("iPhone12ProMaxZoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v34, CFSTR("iPhone13ProMaxZoom"));
  v33 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 388.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v32 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v33, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v32, CFSTR("iPhone12Mini"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v32, CFSTR("iPhone13Mini"));
  v31 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 960.0, 2079.0, 3.0, 72.0, 388.0, 816.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v30 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v31, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v30, CFSTR("iPhone12MiniZoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v30, CFSTR("iPhone13MiniZoom"));
  v29 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 388.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v28 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v29, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v28, CFSTR("iPhoneX"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v28, CFSTR("iPhoneXS"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v28, CFSTR("iPhone11Pro"));
  v42 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 960.0, 2079.0, 3.0, 72.0, 331.0, 816.0, 178.0, 0x4053800000000000, 0x4068000000000000);
  v27 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v42, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v27, CFSTR("iPhoneXZoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v27, CFSTR("iPhoneXSZoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v27, CFSTR("iPhone11ProZoom"));
  v26 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1242.0, 2688.0, 3.0, 0x4053800000000000, 0x4068000000000000);
  v25 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v26, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v25, CFSTR("iPhoneXSMax"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v25, CFSTR("iPhone11ProMax"));
  v24 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 750.0, 1334.0, 2.0, 52.0, 185.0, 646.0, 118.0, 0x4053800000000000, 0x4068000000000000);
  v23 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v24, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v23, CFSTR("iPhone8"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v23, CFSTR("iPhoneSE"));
  v22 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 640.0, 1136.0, 2.0, 52.0, 185.0, 536.0, 118.0, 0x4053800000000000, 0x4068000000000000);
  v21 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v22, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v21, CFSTR("iPhone8Zoom"));
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v21, CFSTR("iPhoneSEZoom"));
  v20 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 828.0, 1792.0, 2.0, 56.0, 429.0, 716.0, 152.0, 0x4053800000000000, 0x4068000000000000);
  v0 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v20, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v0, CFSTR("iPhoneXR"));

  v19 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 750.0, 1624.0, 2.0, 48.0, 392.0, 654.0, 141.0, 0x4053800000000000, 0x4068000000000000);
  v1 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v19, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v1, CFSTR("iPhoneXRZoom"));

  v18 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1080.0, 1920.0, 2.0, 84.0, 286.0, 1074.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v17 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v18, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v17, CFSTR("iPhone8Plus"));
  v2 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1179.0, 2556.0, 3.0, 78.0, 571.0, 1023.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v3 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v2, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v3, CFSTR("iPhone14Pro"));

  v4 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1290.0, 2796.0, 3.0, 90.0, 572.0, 1110.0, 228.0, 0x4053800000000000, 0x4068000000000000);
  v5 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v4, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v5, CFSTR("iPhone14ProMax"));

  v6 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1125.0, 2436.0, 3.0, 72.0, 515.0, 981.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v7 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v6, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v7, CFSTR("iPhone14ProMaxZoom"));

  v8 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1179.0, 2556.0, 3.0, 78.0, 571.0, 1023.0, 211.0, 0x4053800000000000, 0x4068000000000000);
  v9 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v8, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v9, CFSTR("iPhone15Pro"));

  v10 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 960.0, 2079.0, 3.0, 45.0, 455.0, 870.0, 178.0, 0x4053800000000000, 0x4068000000000000);
  v11 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v10, 0);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v11, CFSTR("iPhone15ProZoom"));

  v12 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 1668.0, 2388.0, 2.0, 478.0, 257.0, 712.0, 186.0, 0x4053800000000000, 0x4068000000000000);
  v13 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:denormalizedYDownTimeRect:parallaxPadding:", 2388.0, 1668.0, 2.0, 838.0, 257.0, 712.0, 186.0, 0x4053800000000000, 0x4068000000000000);
  v14 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v12, v13);
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v14, CFSTR("iPadPro11Inch"));
  v15 = objc_msgSend(v43, "copy");
  v16 = (void *)knownDeviceConfigurations_namedConfigs;
  knownDeviceConfigurations_namedConfigs = v15;

}

void __78__PFWallpaperCompoundDeviceConfiguration_deviceSupportsLandscapeConfiguration__block_invoke()
{
  const void *v0;

  v0 = (const void *)MGCopyAnswer();
  deviceSupportsLandscapeConfiguration_isPad = CFEqual(v0, CFSTR("iPad")) != 0;
  if (v0)
    CFRelease(v0);
}

void __61__PFWallpaperCompoundDeviceConfiguration_deviceConfiguration__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  PFParallaxLayoutConfiguration *v18;
  double v19;
  double v20;
  double v21;
  PFParallaxLayoutConfiguration *v22;
  double v23;
  double v24;
  double x;
  double y;
  double width;
  double height;
  PFParallaxLayoutConfiguration *v29;
  PFWallpaperCompoundDeviceConfiguration *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  uint8_t buf[4];
  PFParallaxLayoutConfiguration *v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = PFDeviceLockScreenApproximateTimeRectNormalized(1);
  v34 = v3;
  v5 = v4;
  v7 = v6;
  v8 = PFDeviceScreenSize();
  v10 = v9;
  v11 = PFDeviceScreenScale();
  v12 = PFDeviceScreenScale();
  v33 = v12 * 26.0;
  v13 = v12 * 64.0;
  if (v8 <= v10)
    v14 = v8;
  else
    v14 = v10;
  if (v8 <= v10)
    v8 = v10;
  v38.origin.x = v2;
  v38.origin.y = v34;
  v38.size.width = v5;
  v38.size.height = v7;
  if (CGRectIsEmpty(v38))
  {
    v15 = v14;
    v16 = v14;
    v17 = v8;
    +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 1, v16, v8, v11);
    v18 = (PFParallaxLayoutConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Using fallback device configurations:\n\tportrait: %{public}@\n\t", buf, 0xCu);
    }
    v19 = v11;
    v20 = v15;
    v21 = v13;
  }
  else
  {
    v22 = [PFParallaxLayoutConfiguration alloc];
    v32 = v14;
    v23 = v14;
    v17 = v8;
    v18 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:](v22, "initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:", v23, v8, v11, v2, v34, v5, v7, *(_QWORD *)&v33, *(_QWORD *)&v13);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using SBS device configurations:\n\tportrait: %{public}@\n\t", buf, 0xCu);
    }
    v19 = v11;
    v20 = v32;
    v21 = v13;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "deviceSupportsLandscapeConfiguration"))
  {
    v24 = v17;
    v39.origin.x = PFDeviceLockScreenApproximateTimeRectNormalized(2);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;
    if (CGRectIsEmpty(v39))
    {
      +[PFParallaxLayoutConfiguration bestConfigurationForScreenSize:screenScale:orientation:](PFParallaxLayoutConfiguration, "bestConfigurationForScreenSize:screenScale:orientation:", 2, v24, v20, v19);
      v29 = (PFParallaxLayoutConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v29;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Using fallback device configurations:\n\tlandscape: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v29 = -[PFParallaxLayoutConfiguration initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:]([PFParallaxLayoutConfiguration alloc], "initWithScreenSize:screenScale:normalizedYDownTimeRect:parallaxPadding:", v24, v20, v19, x, y, width, height, *(_QWORD *)&v33, *(_QWORD *)&v21);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v29;
        _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Using SBS device configurations:\n\tlandscape: %{public}@\n\t", buf, 0xCu);
      }
    }
  }
  else
  {
    v29 = 0;
  }
  v30 = -[PFWallpaperCompoundDeviceConfiguration initWithPortraitConfiguration:landscapeConfiguration:]([PFWallpaperCompoundDeviceConfiguration alloc], "initWithPortraitConfiguration:landscapeConfiguration:", v18, v29);
  v31 = (void *)deviceConfiguration_sDeviceConfiguration;
  deviceConfiguration_sDeviceConfiguration = (uint64_t)v30;

}

@end
