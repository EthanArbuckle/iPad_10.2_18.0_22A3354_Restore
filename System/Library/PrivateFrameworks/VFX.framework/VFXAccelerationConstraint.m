@implementation VFXAccelerationConstraint

- (VFXAccelerationConstraint)init
{
  VFXAccelerationConstraint *v2;
  __CFXConstraint *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VFXAccelerationConstraint;
  v2 = -[VFXConstraint init](&v5, sel_init);
  if (v2)
  {
    sub_1B19BF07C();
    v2->_maximumLinearAcceleration = 3.4028e38;
    v2->_maximumLinearVelocity = 3.4028e38;
    v2->super._constraintRef = v3;
    v2->_damping = 0.1;
  }
  return v2;
}

+ (id)accelerationConstraint
{
  return objc_alloc_init(VFXAccelerationConstraint);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
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
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_maximumLinearVelocity(self, v5, v6, v7);
  objc_msgSend_setMaximumLinearVelocity_(v4, v8, v9, v10);
  objc_msgSend_maximumLinearAcceleration(self, v11, v12, v13);
  objc_msgSend_setMaximumLinearAcceleration_(v4, v14, v15, v16);
  objc_msgSend_decelerationDistance(self, v17, v18, v19);
  objc_msgSend_setDecelerationDistance_(v4, v20, v21, v22);
  objc_msgSend_damping(self, v23, v24, v25);
  objc_msgSend_setDamping_(v4, v26, v27, v28);
  objc_msgSend_copyTo_(self, v29, (uint64_t)v4, v30);
  return v4;
}

- (float)maximumLinearVelocity
{
  return self->_maximumLinearVelocity;
}

- (void)setMaximumLinearVelocity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_maximumLinearVelocity = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C8C2C;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("maximumLinearVelocity"), v9);
}

- (float)maximumLinearAcceleration
{
  return self->_maximumLinearAcceleration;
}

- (void)setMaximumLinearAcceleration:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_maximumLinearAcceleration = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C8CE8;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("maximumLinearAcceleration"), v9);
}

- (void)setDecelerationDistance:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_decelerationDistance = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C8D94;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("decelerationDistance"), v9);
}

- (float)decelerationDistance
{
  return self->_decelerationDistance;
}

- (float)damping
{
  return self->_damping;
}

- (void)setDamping:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  self->_damping = a3;
  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C8E60;
  v9[3] = &unk_1E63D53A0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("damping"), v9);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VFXAccelerationConstraint;
  -[VFXConstraint encodeWithCoder:](&v17, sel_encodeWithCoder_);
  *(float *)&v5 = self->_maximumLinearVelocity;
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("maximumLinearVelocity"), v7, v5);
  *(float *)&v8 = self->_maximumLinearAcceleration;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("maximumLinearAcceleration"), v10, v8);
  *(float *)&v11 = self->_decelerationDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v12, (uint64_t)CFSTR("decelerationDistance"), v13, v11);
  *(float *)&v14 = self->_damping;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("damping"), v16, v14);
}

- (VFXAccelerationConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXAccelerationConstraint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  double v11;
  __CFXConstraint *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)VFXAccelerationConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v38, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v11 = sub_1B19BF07C();
    v7->super._constraintRef = v12;
    objc_msgSend_finalizeDecodeConstraint_(v7, v13, (uint64_t)a3, v14, v11);
    objc_msgSend_decodeFloatForKey_(a3, v15, (uint64_t)CFSTR("maximumLinearVelocity"), v16);
    objc_msgSend_setMaximumLinearVelocity_(v7, v17, v18, v19);
    objc_msgSend_decodeFloatForKey_(a3, v20, (uint64_t)CFSTR("maximumLinearAcceleration"), v21);
    objc_msgSend_setMaximumLinearAcceleration_(v7, v22, v23, v24);
    objc_msgSend_decodeFloatForKey_(a3, v25, (uint64_t)CFSTR("decelerationDistance"), v26);
    objc_msgSend_setDecelerationDistance_(v7, v27, v28, v29);
    objc_msgSend_decodeFloatForKey_(a3, v30, (uint64_t)CFSTR("damping"), v31);
    objc_msgSend_setDamping_(v7, v32, v33, v34);
    objc_msgSend_setImmediateMode_(VFXTransaction, v35, v8, v36);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
