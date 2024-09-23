@implementation PLDeviceConfiguration

- (BOOL)isRetina
{
  return self->_screenScale > 1.0;
}

- (BOOL)shouldUseNanoThumbnailFormats
{
  return self->_isWatch;
}

- (BOOL)isTV
{
  return self->_isTV;
}

- (BOOL)isPad
{
  return self->_isPad;
}

- (BOOL)isMac
{
  return self->_isMac;
}

+ (id)defaultDeviceConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PLDeviceConfiguration_defaultDeviceConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultDeviceConfiguration_onceToken != -1)
    dispatch_once(&defaultDeviceConfiguration_onceToken, block);
  return (id)defaultDeviceConfiguration_defaultConfiguration;
}

- (CGSize)logicalScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_logicalScreenSize.width;
  height = self->_logicalScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

void __51__PLDeviceConfiguration_defaultDeviceConfiguration__block_invoke(uint64_t a1)
{
  const void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;

  v2 = (const void *)MGCopyAnswer();
  v3 = objc_alloc(*(Class *)(a1 + 32));
  v4 = PLPhysicalScreenSize();
  v6 = v5;
  pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_133_3455);
  v7 = *(double *)&PLPhysicalScreenScale_screenScale;
  if (PLDeviceSupportsASTC_s_onceToken != -1)
    dispatch_once(&PLDeviceSupportsASTC_s_onceToken, &__block_literal_global_334);
  v8 = objc_msgSend(v3, "initWithLogicalScreenSize:screenScale:deviceClass:supportsASTC:isMigrationService:", v2, PLDeviceSupportsASTC_s_hasSupport, __PLIsMigrationService, v4, v6, v7);
  v9 = (void *)defaultDeviceConfiguration_defaultConfiguration;
  defaultDeviceConfiguration_defaultConfiguration = v8;

  if (v2)
    CFRelease(v2);
}

- (PLDeviceConfiguration)initWithLogicalScreenSize:(CGSize)a3 screenScale:(double)a4 deviceClass:(void *)a5 supportsASTC:(BOOL)a6 isMigrationService:(BOOL)a7
{
  CGFloat height;
  CGFloat width;
  PLDeviceConfiguration *v13;
  PLDeviceConfiguration *v14;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)PLDeviceConfiguration;
  v13 = -[PLDeviceConfiguration init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_screenScale = a4;
    v13->_logicalScreenSize.width = width;
    v13->_logicalScreenSize.height = height;
    v13->_supportsASTC = a6;
    v13->_isMigrationService = a7;
    if (a5)
    {
      v13->_isPad = CFEqual(a5, CFSTR("iPad")) != 0;
      v14->_isTV = CFEqual(a5, CFSTR("AppleTV")) != 0;
      v14->_isWatch = CFEqual(a5, CFSTR("Watch")) != 0;
      v14->_isMac = CFEqual(a5, CFSTR("Unicorn")) != 0;
    }
  }
  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLDeviceConfiguration;
  -[PLDeviceConfiguration description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - screen size: (%f, %f), scale: %f, isPad: %d, isWatch: %d, isTV: %d, isMac: %d, isRetina: %d"), *(_QWORD *)&self->_logicalScreenSize.width, *(_QWORD *)&self->_logicalScreenSize.height, *(_QWORD *)&self->_screenScale, -[PLDeviceConfiguration isPad](self, "isPad"), -[PLDeviceConfiguration shouldUseNanoThumbnailFormats](self, "shouldUseNanoThumbnailFormats"), -[PLDeviceConfiguration isTV](self, "isTV"), -[PLDeviceConfiguration isMac](self, "isMac"), -[PLDeviceConfiguration isRetina](self, "isRetina"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)logicalScreenPixelSize
{
  return (unint64_t)(self->_logicalScreenSize.width * self->_logicalScreenSize.height);
}

- (void)setIsRetina:(BOOL)a3
{
  self->_isRetina = a3;
}

- (void)setIsPad:(BOOL)a3
{
  self->_isPad = a3;
}

- (void)setIsTV:(BOOL)a3
{
  self->_isTV = a3;
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (void)setIsMac:(BOOL)a3
{
  self->_isMac = a3;
}

- (BOOL)supportsASTC
{
  return self->_supportsASTC;
}

- (void)setSupportsASTC:(BOOL)a3
{
  self->_supportsASTC = a3;
}

- (BOOL)isMigrationService
{
  return self->_isMigrationService;
}

- (void)setIsMigrationService:(BOOL)a3
{
  self->_isMigrationService = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

@end
