@implementation VFXConstantScaleConstraint

- (VFXConstantScaleConstraint)init
{
  VFXConstantScaleConstraint *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VFXConstantScaleConstraint;
  v2 = -[VFXConstraint init](&v5, sel_init);
  if (v2)
  {
    v3 = sub_1B19BC974();
    v2->_scale = 1.0;
    v2->super._constraintRef = (__CFXConstraint *)v3;
    v2->_screenSpace = 1;
  }
  return v2;
}

+ (id)constantScaleConstraint
{
  return objc_alloc_init(VFXConstantScaleConstraint);
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_scale = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19CA2B4;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (BOOL)screenSpace
{
  return self->_screenSpace;
}

- (void)setScreenSpace:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_screenSpace = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19CA368;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_copyTo_(self, v5, (uint64_t)v4, v6);
  v4[12] = LODWORD(self->_scale);
  *((_BYTE *)v4 + 52) = self->_screenSpace;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXConstantScaleConstraint;
  -[VFXConstraint encodeWithCoder:](&v9, sel_encodeWithCoder_);
  objc_msgSend_encodeBool_forKey_(a3, v5, self->_screenSpace, (uint64_t)CFSTR("screenSpace"));
  *(float *)&v6 = self->_scale;
  objc_msgSend_encodeFloat_forKey_(a3, v7, (uint64_t)CFSTR("scale"), v8, v6);
}

- (VFXConstantScaleConstraint)initWithCoder:(id)a3
{
  VFXConstantScaleConstraint *v4;
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
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXConstantScaleConstraint;
  v4 = -[VFXConstraint initWithCoder:](&v24, sel_initWithCoder_);
  if (v4)
  {
    v4->super._constraintRef = (__CFXConstraint *)sub_1B19BC974();
    v8 = objc_msgSend_immediateMode(VFXTransaction, v5, v6, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v13 = objc_msgSend_decodeBoolForKey_(a3, v11, (uint64_t)CFSTR("screenSpace"), v12);
    objc_msgSend_setScreenSpace_(v4, v14, v13, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("scale"), v17);
    objc_msgSend_setScale_(v4, v18, v19, v20);
    objc_msgSend_setImmediateMode_(VFXTransaction, v21, v8, v22);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
