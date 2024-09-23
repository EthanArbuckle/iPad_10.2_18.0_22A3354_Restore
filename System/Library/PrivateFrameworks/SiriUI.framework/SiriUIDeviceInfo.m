@implementation SiriUIDeviceInfo

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SiriUIDeviceInfo_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_sharedInstance_1;
}

void __34__SiriUIDeviceInfo_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = MGGetBoolAnswer();
  v10 = (id)MGCopyAnswer();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;
  v7 = v6;

  v8 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithLargeFormatPhone:gestaltModes:screenSize:", v2, v10, v5, v7);
  v9 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = v8;

}

- (SiriUIDeviceInfo)initWithLargeFormatPhone:(BOOL)a3 gestaltModes:(id)a4 screenSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  SiriUIDeviceInfo *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  float v16;
  double v17;
  float v18;
  objc_super v20;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SiriUIDeviceInfo;
  v10 = -[SiriUIDeviceInfo init](&v20, sel_init);
  if (v10)
  {
    v10->_deviceSupportsProximitySensor = MGGetBoolAnswer();
    v10->_largeFormatPhone = a3;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("zoomed"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "count") < 4)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = 0;
        if (v12 && v13)
        {
          objc_msgSend(v12, "floatValue");
          v17 = v16;
          objc_msgSend(v14, "floatValue");
          v15 = height == v18 && width == v17;
        }

      }
    }
    else
    {
      v15 = 0;
    }
    v10->_deviceZoomed = v15;
    -[SiriUIDeviceInfo _updateProductTypeDerivedProperties](v10, "_updateProductTypeDerivedProperties");
  }

  return v10;
}

- (void)_updateProductTypeDerivedProperties
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 1;
  v4 = MGGetProductType();
  if (v4 <= 1737882205)
  {
    if (v4 == 445396642)
      goto LABEL_9;
    v5 = 1701146937;
  }
  else
  {
    if (v4 == 1737882206 || v4 == 3637438250)
      goto LABEL_9;
    v5 = 3933982784;
  }
  if (v4 != v5)
    v3 = 0;
LABEL_9:
  self->_deviceShouldUseFrozenBackdropSnapshot = v3;
  self->_deviceShouldFreezeAura = v3;
  self->_deviceShouldDeferFlamesView = v3;
  self->_deviceShouldSkipGuidePreloading = v3;
}

- (BOOL)isDeviceZoomed
{
  return self->_deviceZoomed;
}

- (BOOL)isLargeFormatPhone
{
  return self->_largeFormatPhone;
}

- (BOOL)deviceShouldUseFrozenBackdropSnapshot
{
  return self->_deviceShouldUseFrozenBackdropSnapshot;
}

- (BOOL)deviceShouldFreezeAura
{
  return self->_deviceShouldFreezeAura;
}

- (BOOL)deviceShouldDeferFlamesView
{
  return self->_deviceShouldDeferFlamesView;
}

- (BOOL)deviceSupportsProximitySensor
{
  return self->_deviceSupportsProximitySensor;
}

- (BOOL)deviceShouldSkipGuidePreloading
{
  return self->_deviceShouldSkipGuidePreloading;
}

@end
