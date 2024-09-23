@implementation VFXAnimationClip

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)clipWithAnimation:(id)a3 name:(id)a4
{
  VFXAnimationClip *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = objc_alloc_init(VFXAnimationClip);
  objc_msgSend_setName_(v6, v7, (uint64_t)a4, v8);
  v12 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v9, v10, v11);
  v6->_identifier = (NSString *)(id)objc_msgSend_UUIDString(v12, v13, v14, v15);
  v6->_animation = (VFXAnimation *)a3;
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXAnimationClip;
  -[VFXAnimationClip dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;

  v5 = (id)objc_msgSend_copy(self->_animation, a2, (uint64_t)a3, v3);
  v9 = (id)objc_msgSend_copy(self->_name, v6, v7, v8);
  return (id)objc_msgSend_clipWithAnimation_name_(VFXAnimationClip, v10, (uint64_t)v5, (uint64_t)v9);
}

- (VFXAnimationClip)initWithCoder:(id)a3
{
  VFXAnimationClip *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXAnimationClip;
  v4 = -[VFXAnimationClip init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("name"));
    v7 = objc_opt_class();
    v4->_identifier = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("identifier"));
    v9 = objc_opt_class();
    v4->_animation = (VFXAnimation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("animation"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  const char *v6;

  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)name, (uint64_t)CFSTR("name"));
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_identifier, (uint64_t)CFSTR("name"));
  objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)self->_animation, (uint64_t)CFSTR("animation"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXAnimation)animation
{
  return self->_animation;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
