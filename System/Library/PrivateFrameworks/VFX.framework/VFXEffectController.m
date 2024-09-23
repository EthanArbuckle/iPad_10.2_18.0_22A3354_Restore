@implementation VFXEffectController

- (VFXEffectController)initWithCoder:(id)a3
{
  VFXEffectController *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VFXEffectController;
  v4 = -[VFXEffectController init](&v11, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("rootIdentifier"));
    objc_msgSend_setTag_(v4, v8, v7, v9);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)tag
{
  return self->tag;
}

- (void)setTag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
