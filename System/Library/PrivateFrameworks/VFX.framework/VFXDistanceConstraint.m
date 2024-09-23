@implementation VFXDistanceConstraint

- (VFXDistanceConstraint)init
{
  VFXDistanceConstraint *v2;
  double v3;
  __CFXConstraint *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXDistanceConstraint;
  v2 = -[VFXConstraint init](&v10, sel_init);
  if (v2)
  {
    *(int32x2_t *)&v3 = sub_1B19BEA4C();
    v2->_maximumDistance = 3.4028e38;
    v2->super._constraintRef = v4;
    v2->_minimumDistance = 0.0;
    v2->_maximumDirectionAngle = 360.0;
    objc_msgSend_localFront(VFXNode, v5, v6, v7, v3);
    *(_OWORD *)v2->_targetDirection = v8;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXDistanceConstraint;
  -[VFXConstraint dealloc](&v3, sel_dealloc);
}

+ (id)distanceConstraint
{
  return objc_alloc_init(VFXDistanceConstraint);
}

+ (id)distanceConstraintWithTarget:(id)a3
{
  VFXDistanceConstraint *v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc_init(VFXDistanceConstraint);
  objc_msgSend_setTarget_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (VFXNode)target
{
  return self->_target;
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
    v13[2] = sub_1B19C7974;
    v13[3] = &unk_1E63D5440;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (__n128)targetDirection
{
  return a1[5];
}

- (void)setTargetDirection:(VFXDistanceConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  VFXDistanceConstraint *v11;

  v8 = v4;
  *(_OWORD *)self->_targetDirection = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C7A24;
  v9[3] = &unk_1E63D5468;
  v11 = self;
  v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("targetDirection"), v9);
}

- (BOOL)keepTargetDirection
{
  return self->_keepTargetDirection;
}

- (void)setKeepTargetDirection:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_keepTargetDirection = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C7AD8;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (float)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_minimumDistance = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C7B94;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("minimumDistance"), v9);
}

- (float)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_maximumDistance = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C7C50;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("maximumDistance"), v9);
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
  v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_setTarget_(v4, v9, v8, v10);
  objc_msgSend_maximumDistance(self, v11, v12, v13);
  objc_msgSend_setMaximumDistance_(v4, v14, v15, v16);
  objc_msgSend_minimumDistance(self, v17, v18, v19);
  objc_msgSend_setMinimumDistance_(v4, v20, v21, v22);
  objc_msgSend_copyTo_(self, v23, (uint64_t)v4, v24);
  return v4;
}

- (void)_customEncodingOfVFXDistanceConstraint:(id)a3
{
  VFXNode *target;

  target = self->_target;
  if (target)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, (uint64_t)CFSTR("target"));
}

- (void)_customDecodingOfVFXDistanceConstraint:(id)a3
{
  __CFXConstraint *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  sub_1B19BEA4C();
  self->super._constraintRef = v5;
  v6 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, (uint64_t)CFSTR("target"));
  objc_msgSend_setTarget_(self, v9, v8, v10);
  objc_msgSend_finalizeDecodeConstraint_(self, v11, (uint64_t)a3, v12);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VFXDistanceConstraint;
  -[VFXConstraint encodeWithCoder:](&v13, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXDistanceConstraint_(self, v5, (uint64_t)a3, v6);
  *(float *)&v7 = self->_minimumDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v8, (uint64_t)CFSTR("minimumDistance"), v9, v7);
  *(float *)&v10 = self->_maximumDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v11, (uint64_t)CFSTR("maximumDistance"), v12, v10);
}

- (VFXDistanceConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXDistanceConstraint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
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
  v26.super_class = (Class)VFXDistanceConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v26, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXDistanceConstraint_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("minimumDistance"), v14);
    objc_msgSend_setMinimumDistance_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("maximumDistance"), v19);
    objc_msgSend_setMaximumDistance_(v7, v20, v21, v22);
    objc_msgSend_setImmediateMode_(VFXTransaction, v23, v8, v24);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
