@implementation VFXPrecomputedLightingEnvironment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXPrecomputedLightingEnvironment)initWithCoder:(id)a3
{
  VFXPrecomputedLightingEnvironment *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXPrecomputedLightingEnvironment;
  v4 = -[VFXPrecomputedLightingEnvironment init](&v10, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_radianceData = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("radiance"));
    v7 = objc_opt_class();
    v4->_irradianceData = (NSData *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("irradiance"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_radianceData, (uint64_t)CFSTR("radiance"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_irradianceData, (uint64_t)CFSTR("irradiance"));
}

- (void)dealloc
{
  CFNumberRef v3;
  __CFNotificationCenter *LocalCenter;
  objc_super v5;
  VFXPrecomputedLightingEnvironment *valuePtr;

  valuePtr = self;
  v3 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, CFSTR("kCFXNotificationPrecomputedLightingEnvironmentWillDie"), v3, 0, 1u);
  CFRelease(v3);

  v5.receiver = self;
  v5.super_class = (Class)VFXPrecomputedLightingEnvironment;
  -[VFXPrecomputedLightingEnvironment dealloc](&v5, sel_dealloc);
}

- (NSData)radianceData
{
  return self->_radianceData;
}

- (void)setRadianceData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSData)irradianceData
{
  return self->_irradianceData;
}

- (void)setIrradianceData:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
