@implementation SBLockOverlayStylePropertiesFactory

+ (id)overlayPropertiesFactoryWithStyle:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStyle:", a3);
}

- (SBLockOverlayStylePropertiesFactory)initWithStyle:(unint64_t)a3
{
  SBLockOverlayStylePropertiesFactory *v4;
  SBLockOverlayStylePropertiesFactory *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *deviceQualityToProperties;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBLockOverlayStylePropertiesFactory;
  v4 = -[SBLockOverlayStylePropertiesFactory init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deviceQualityToProperties = v5->_deviceQualityToProperties;
    v5->_deviceQualityToProperties = v6;

  }
  return v5;
}

- (id)propertiesWithDeviceDefaultGraphicsQuality
{
  return -[SBLockOverlayStylePropertiesFactory propertiesWithGraphicsQuality:](self, "propertiesWithGraphicsQuality:", SBUIGraphicsQuality());
}

- (id)_fetchAndCachePropsForDeviceQuality:(int64_t)a3
{
  void *v5;
  SBLockOverlayStyleProperties *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_deviceQualityToProperties, "objectForKey:", v5);
  v6 = (SBLockOverlayStyleProperties *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[SBLockOverlayStyleProperties initWithStyle:quality:]([SBLockOverlayStyleProperties alloc], "initWithStyle:quality:", self->_style, a3);
    -[NSMutableDictionary setObject:forKey:](self->_deviceQualityToProperties, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceQualityToProperties, 0);
}

@end
