@implementation VFXSliderConstraint

- (VFXSliderConstraint)init
{
  VFXSliderConstraint *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VFXSliderConstraint;
  v2 = -[VFXConstraint init](&v5, sel_init);
  if (v2)
  {
    v3 = sub_1B182F6F0();
    v2->_categoryBitMask = 0;
    v2->super._constraintRef = (__CFXConstraint *)v3;
    v2->_radius = 1.0;
  }
  return v2;
}

+ (id)sliderConstraint
{
  return objc_alloc_init(VFXSliderConstraint);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend_collisionCategoryBitMask(self, v5, v6, v7);
  objc_msgSend_setCollisionCategoryBitMask_(v4, v9, v8, v10);
  objc_msgSend_offset(self, v11, v12, v13);
  objc_msgSend_setOffset_(v4, v14, v15, v16);
  objc_msgSend_radius(self, v17, v18, v19);
  objc_msgSend_setRadius_(v4, v20, v21, v22);
  objc_msgSend_copyTo_(self, v23, (uint64_t)v4, v24);
  return v4;
}

- (unint64_t)collisionCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCollisionCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  self->_categoryBitMask = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C91B0;
  v8[3] = &unk_1E63D5440;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (float)radius
{
  return self->_radius;
}

- (void)setRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_radius = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C9264;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("radius"), v9);
}

- (__n128)offset
{
  return a1[4];
}

- (void)setOffset:(VFXSliderConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  *(_OWORD *)self->_offset = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C9310;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("offset"), v8);
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("offset"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_offset(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VFXSliderConstraint;
    return -[VFXSliderConstraint valueForKey:](&v14, sel_valueForKey_, a3);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("offset"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setOffset_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXSliderConstraint;
    -[VFXSliderConstraint setValue:forKey:](&v13, sel_setValue_forKey_, a3, a4);
  }
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXSliderConstraint;
  -[VFXConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_categoryBitMask, (uint64_t)CFSTR("collisionCategoryBitMask"));
  *(float *)&v6 = self->_radius;
  objc_msgSend_encodeFloat_forKey_(a3, v7, (uint64_t)CFSTR("radius"), v8, v6);
  sub_1B18BD1D8(a3, CFSTR("offset"), *(__n128 *)self->_offset);
}

- (VFXSliderConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXSliderConstraint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)VFXSliderConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v30, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->super._constraintRef = (__CFXConstraint *)sub_1B182F6F0();
    objc_msgSend_finalizeDecodeConstraint_(v7, v11, (uint64_t)a3, v12);
    v15 = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("collisionCategoryBitMask"), v14);
    objc_msgSend_setCollisionCategoryBitMask_(v7, v16, v15, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("radius"), v19);
    objc_msgSend_setRadius_(v7, v20, v21, v22);
    v23 = sub_1B18BD300(a3, CFSTR("offset"));
    objc_msgSend_setOffset_(v7, v24, v25, v26, v23);
    objc_msgSend_setImmediateMode_(VFXTransaction, v27, v8, v28);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
