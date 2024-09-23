@implementation VFXAvoidOccluderConstraint

- (VFXAvoidOccluderConstraint)init
{
  VFXAvoidOccluderConstraint *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VFXAvoidOccluderConstraint;
  v2 = -[VFXConstraint init](&v5, sel_init);
  if (v2)
  {
    v3 = sub_1B18303B8();
    v2->_categoryBitMask = 1;
    v2->super._constraintRef = (__CFXConstraint *)v3;
    v2->_offset = 0.00001;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;

  if (self->_delegate)
  {
    v5 = objc_msgSend_worldRef(self->_target, a2, v2, v3);
    if (v5)
    {
      v13 = v5;
      sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
      sub_1B182F8FC((uint64_t)self->super._constraintRef, 0, v14, v15, v16, v17, v18, v19);
      sub_1B18797B4(v13, v20, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      sub_1B182F8FC((uint64_t)self->super._constraintRef, 0, v7, v8, v9, v10, v11, v12);
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)VFXAvoidOccluderConstraint;
  -[VFXConstraint dealloc](&v27, sel_dealloc);
}

+ (id)avoidOccluderConstraint
{
  return objc_alloc_init(VFXAvoidOccluderConstraint);
}

+ (id)avoidOccluderConstraintWithTarget:(id)a3
{
  VFXAvoidOccluderConstraint *v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc_init(VFXAvoidOccluderConstraint);
  objc_msgSend_setTarget_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  const void *Value;
  const char *v5;
  uint64_t v6;

  Value = CFDictionaryGetValue(a3, self->_target);
  if (Value)
    objc_msgSend_setTarget_(self, v5, (uint64_t)Value, v6);
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
  uint64_t v14;
  const char *v15;
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
  v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_setTarget_(v4, v9, v8, v10);
  v14 = objc_msgSend_occluderCategoryBitMask(self, v11, v12, v13);
  objc_msgSend_setOccluderCategoryBitMask_(v4, v15, v14, v16);
  objc_msgSend_bias(self, v17, v18, v19);
  objc_msgSend_setBias_(v4, v20, v21, v22);
  objc_msgSend_copyTo_(self, v23, (uint64_t)v4, v24);
  return v4;
}

- (void)setDelegate:(id)a3
{
  uint64_t v3;
  uint64_t (*v5)(void *, char *, id *, uint64_t);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[7];

  if (self->_delegate != a3)
  {
    self->_delegate = a3;
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = sub_1B19C9900;
      else
        v5 = 0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = nullsub_171;
      else
        v9 = 0;
      v10 = objc_msgSend_worldRef(self, v6, v7, v8);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = sub_1B19C9978;
      v34[3] = &unk_1E63D7D70;
      v34[4] = self;
      v34[5] = v5;
      v34[6] = v9;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v34);
    }
    else
    {
      v12 = objc_msgSend_worldRef(self->_target, a2, 0, v3);
      if (v12)
      {
        v20 = v12;
        sub_1B187973C(v12, v13, v14, v15, v16, v17, v18, v19);
        sub_1B182F8FC((uint64_t)self->super._constraintRef, 0, v21, v22, v23, v24, v25, v26);
        sub_1B18797B4(v20, v27, v28, v29, v30, v31, v32, v33);
      }
      else
      {
        sub_1B182F8FC((uint64_t)self->super._constraintRef, 0, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

- (VFXAvoidOccluderConstraintDelegate)delegate
{
  return (VFXAvoidOccluderConstraintDelegate *)self->_delegate;
}

- (void)setTarget:(id)a3
{
  VFXNode *target;
  VFXNode *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[6];

  target = self->_target;
  if (target != a3)
  {

    v6 = (VFXNode *)a3;
    self->_target = v6;
    if (v6)
      v10 = objc_msgSend_nodeRef(v6, v7, v8, v9);
    else
      v10 = 0;
    v11 = objc_msgSend_worldRef(self, v7, v8, v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B19C9A80;
    v13[3] = &unk_1E63D5440;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (VFXNode)target
{
  return self->_target;
}

- (void)setOccluderCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  self->_categoryBitMask = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C9B28;
  v8[3] = &unk_1E63D5440;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (unint64_t)occluderCategoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setBias:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_offset = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C9BD4;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (float)bias
{
  return self->_offset;
}

- (void)_customEncodingOfVFXAvoidOccluderConstraint:(id)a3
{
  VFXNode *target;

  target = self->_target;
  if (target)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, (uint64_t)CFSTR("target"));
}

- (void)_customDecodingOfVFXAvoidOccluderConstraint:(id)a3
{
  uint64_t v5;
  const char *v6;
  __CFXConstraint *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v5 = objc_opt_class();
  self->_target = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("target"));
  v7 = (__CFXConstraint *)sub_1B18303B8();
  self->super._constraintRef = v7;
  v11 = (const void *)objc_msgSend_nodeRef(self->_target, v8, v9, v10);
  sub_1B182F974((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
  objc_msgSend_finalizeDecodeConstraint_(self, v18, (uint64_t)a3, v19);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VFXAvoidOccluderConstraint;
  -[VFXConstraint encodeWithCoder:](&v11, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXAvoidOccluderConstraint_(self, v5, (uint64_t)a3, v6);
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_categoryBitMask, (uint64_t)CFSTR("categoryBitMask"));
  *(float *)&v8 = self->_offset;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("bias"), v10, v8);
}

- (VFXAvoidOccluderConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXAvoidOccluderConstraint *v7;
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
  const char *v23;
  uint64_t v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)VFXAvoidOccluderConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v26, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXAvoidOccluderConstraint_(v7, v11, (uint64_t)a3, v12);
    v15 = objc_msgSend_decodeIntegerForKey_(a3, v13, (uint64_t)CFSTR("categoryBitMask"), v14);
    objc_msgSend_setOccluderCategoryBitMask_(v7, v16, v15, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("bias"), v19);
    objc_msgSend_setBias_(v7, v20, v21, v22);
    objc_msgSend_setImmediateMode_(VFXTransaction, v23, v8, v24);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
