@implementation VFXBillboardConstraint

- (VFXBillboardConstraint)init
{
  id v2;
  const char *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VFXBillboardConstraint;
  v2 = -[VFXConstraint init](&v6, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = sub_1B19BB6C0();
    objc_msgSend_setFreeAxes_(v2, v3, 7, v4);
    *((_BYTE *)v2 + 56) = sub_1B19BC8F8(*((_QWORD *)v2 + 1));
  }
  return (VFXBillboardConstraint *)v2;
}

+ (id)billboardConstraint
{
  return objc_alloc_init(VFXBillboardConstraint);
}

- (unint64_t)freeAxes
{
  return self->_freeAxes;
}

- (void)setFreeAxes:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  self->_freeAxes = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C9F14;
  v8[3] = &unk_1E63D5440;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)setPreserveScale:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_preserveScale = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C9FB8;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)preserveScale
{
  return self->_preserveScale;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_copyTo_(self, v5, (uint64_t)v4, v6);
  v10 = objc_msgSend_freeAxes(self, v7, v8, v9);
  objc_msgSend_setFreeAxes_(v4, v11, v10, v12);
  v16 = objc_msgSend_preserveScale(self, v13, v14, v15);
  objc_msgSend_setPreserveScale_(v4, v17, v16, v18);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  const char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXBillboardConstraint;
  -[VFXConstraint encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_freeAxes, (uint64_t)CFSTR("freeAxes"));
  objc_msgSend_encodeBool_forKey_(a3, v6, self->_preserveScale, (uint64_t)CFSTR("preserveScale"));
}

- (VFXBillboardConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXBillboardConstraint *v7;
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VFXBillboardConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v26, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->super._constraintRef = (__CFXConstraint *)sub_1B19BB6C0();
    v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("freeAxes"), v12);
    objc_msgSend_setFreeAxes_(v7, v14, v13, v15);
    v18 = objc_msgSend_decodeBoolForKey_(a3, v16, (uint64_t)CFSTR("preserveScale"), v17);
    objc_msgSend_setPreserveScale_(v7, v19, v18, v20);
    objc_msgSend_finalizeDecodeConstraint_(v7, v21, (uint64_t)a3, v22);
    objc_msgSend_setImmediateMode_(VFXTransaction, v23, v8, v24);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
