@implementation TSDCapabilities

- (void)p_setupPlatform
{
  self->_platform = 1;
}

- (void)p_setupDevice
{
  void *v3;
  unint64_t v4;
  int64x2_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  int v11;
  char v12;
  char v13;
  __int128 v14;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDF69C8], "platformString");
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod3,")) & 1) != 0)
  {
    v4 = 1;
LABEL_5:
    v5 = vdupq_n_s64(v4);
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod4,")) & 1) != 0)
  {
    v4 = 2;
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPod5,")) & 1) != 0)
  {
    v5 = (int64x2_t)xmmword_217C2A820;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone2,")) & 1) != 0)
  {
    v5 = (int64x2_t)xmmword_217C2A830;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone3,")) & 1) != 0)
  {
    v5 = (int64x2_t)xmmword_217C2A840;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone4,")) & 1) != 0)
  {
    v5 = (int64x2_t)xmmword_217C2A850;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPhone5,")) & 1) != 0)
  {
    v5 = (int64x2_t)xmmword_217C2A860;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad1,")) & 1) != 0)
  {
    v5 = (int64x2_t)xmmword_217C2A870;
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,")))
  {
    v6 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,1"));
    v5 = (int64x2_t)xmmword_217C2A8A0;
    if ((v6 & 1) != 0)
      goto LABEL_6;
    v14 = xmmword_217C2A8A0;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,2")) & 1) == 0)
    {
      v7 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,3"));
      v5 = (int64x2_t)xmmword_217C2A8A0;
      if ((v7 & 1) != 0)
        goto LABEL_6;
      if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,4"), COERCE_DOUBLE(9)) & 1) != 0)
      {
        v5 = (int64x2_t)xmmword_217C2A8B0;
        goto LABEL_6;
      }
      v12 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,5"));
      v5 = (int64x2_t)xmmword_217C2A8C0;
      if ((v12 & 1) != 0)
        goto LABEL_6;
      v14 = xmmword_217C2A8C0;
      if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,6")) & 1) == 0)
      {
        v13 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad2,7"));
        v5 = (int64x2_t)xmmword_217C2A8C0;
        if ((v13 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }
    }
LABEL_29:
    v5 = (int64x2_t)v14;
    goto LABEL_6;
  }
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,")))
    goto LABEL_7;
  v8 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,1"));
  v5 = (int64x2_t)xmmword_217C2A880;
  if ((v8 & 1) == 0)
  {
    v14 = xmmword_217C2A880;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,2")) & 1) == 0)
    {
      v9 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,3"));
      v5 = (int64x2_t)xmmword_217C2A880;
      if ((v9 & 1) != 0)
        goto LABEL_6;
      v10 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,4"), COERCE_DOUBLE(10));
      v5 = (int64x2_t)xmmword_217C2A890;
      if ((v10 & 1) != 0)
        goto LABEL_6;
      v14 = xmmword_217C2A890;
      if ((objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,5")) & 1) == 0)
      {
        v11 = objc_msgSend(v3, "hasPrefix:", CFSTR("iPad3,6"));
        v5 = (int64x2_t)xmmword_217C2A890;
        if (!v11)
          goto LABEL_7;
        goto LABEL_6;
      }
    }
    goto LABEL_29;
  }
LABEL_6:
  *(int64x2_t *)&self->_device = v5;
LABEL_7:
  self->_deviceType = TSDCapabilitiesDeviceTypeFromHWModelString(v3);
}

- (TSDCapabilities)init
{
  TSDCapabilities *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCapabilities;
  v2 = -[TSDCapabilities init](&v4, sel_init);
  if (v2)
  {
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, &__block_literal_global_55);
    -[TSDCapabilities p_setupPlatform](v2, "p_setupPlatform");
    -[TSDCapabilities p_setupDevice](v2, "p_setupDevice");
  }
  return v2;
}

uint64_t __23__TSDCapabilities_init__block_invoke()
{
  uint64_t result;

  result = objc_opt_new();
  s_virtualScreenToMaximumTextureSizeDict = result;
  return result;
}

+ (id)currentCapabilities
{
  if (currentCapabilities_sOnce != -1)
    dispatch_once(&currentCapabilities_sOnce, &__block_literal_global_66);
  return (id)currentCapabilities_sCurrentCapabilities;
}

TSDCapabilities *__38__TSDCapabilities_currentCapabilities__block_invoke()
{
  TSDCapabilities *result;

  result = objc_alloc_init(TSDCapabilities);
  currentCapabilities_sCurrentCapabilities = (uint64_t)result;
  return result;
}

- (BOOL)isRendererH3OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 2;
}

- (BOOL)isRendererH4OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 5;
}

- (BOOL)isRendererH5OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 7;
}

- (BOOL)hasLightningPort
{
  return (self->_device > 0x26uLL) | (0x3FFFFFF88EuLL >> self->_device) & 1;
}

- (CGSize)maximumTextureSize
{
  uint64_t v2;
  double v3;
  double v4;
  CGSize result;

  if (self->_platform == 1 && !-[TSDCapabilities isRendererH3OrBelow](self, "isRendererH3OrBelow"))
    v2 = 0x40B0000000000000;
  else
    v2 = 0x40A0000000000000;
  v3 = *(double *)&v2;
  v4 = *(double *)&v2;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)maximumHardcodedTextureSize
{
  int64_t platform;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  CGSize result;

  platform = self->_platform;
  if ((unint64_t)(platform - 2) < 2)
  {
    v5 = 0x40C0000000000000;
    goto LABEL_6;
  }
  v4 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (!platform)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCapabilities maximumHardcodedTextureSize]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCapabilities.m"), 328, CFSTR("Unknown platform!"));
    goto LABEL_8;
  }
  if (platform == 1)
  {
    v5 = 0x40B0000000000000;
LABEL_6:
    v3 = *(double *)&v5;
    v4 = *(double *)&v5;
  }
LABEL_8:
  v8 = v4;
  v9 = v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)maximumMetalTextureSizeForDevice:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  CGSize result;

  -[TSDCapabilities maximumHardcodedTextureSize](self, "maximumHardcodedTextureSize");
  v6 = v5;
  v8 = v7;
  if (-[TSDCapabilities isMetalCapable](self, "isMetalCapable"))
  {
    if ((objc_msgSend(a3, "supportsFeatureSet:", 0) & 1) != 0
      || (objc_msgSend(a3, "supportsFeatureSet:", 1) & 1) != 0)
    {
      *(double *)&v9 = 4096.0;
    }
    else
    {
      if ((objc_msgSend(a3, "supportsFeatureSet:", 2) & 1) == 0
        && (objc_msgSend(a3, "supportsFeatureSet:", 3) & 1) == 0
        && (objc_msgSend(a3, "supportsFeatureSet:", 5) & 1) == 0
        && (objc_msgSend(a3, "supportsFeatureSet:", 6) & 1) == 0
        && (objc_msgSend(a3, "supportsFeatureSet:", 8) & 1) == 0)
      {
        if (objc_msgSend(a3, "supportsFeatureSet:", 9))
          v6 = 8192.0;
        else
          v6 = 16384.0;
        goto LABEL_12;
      }
      *(double *)&v9 = 8192.0;
    }
    v6 = *(double *)&v9;
LABEL_12:
    v8 = v6;
  }
  v10 = v6;
  v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (BOOL)p_isMetalCapable
{
  return MTLCreateSystemDefaultDevice() != 0;
}

- (BOOL)isMetalCapable
{
  return 0;
}

+ (id)currentCapabilitiesOverride
{
  return (id)sCurrentCapabilitiesOverride;
}

+ (void)setCurrentCapabilitiesOverride:(id)a3
{
  sCurrentCapabilitiesOverride = (uint64_t)a3;
}

- (int64_t)platform
{
  return self->_platform;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)device
{
  return self->_device;
}

- (int64_t)renderer
{
  return self->_renderer;
}

@end
