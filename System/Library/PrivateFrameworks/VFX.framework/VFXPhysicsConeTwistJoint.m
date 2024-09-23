@implementation VFXPhysicsConeTwistJoint

- (VFXPhysicsConeTwistJoint)init
{
  VFXPhysicsConeTwistJoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsConeTwistJoint;
  result = -[VFXPhysicsConeTwistJoint init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_definition.maximumAngularLimit1 = xmmword_1B2244DB0;
    *(_OWORD *)&result[1].super.super.isa = xmmword_1B2244DD0;
    *(_OWORD *)&result[1].super._constraint = xmmword_1B2244D90;
    *(_OWORD *)&result[1].super._bodyB = xmmword_1B2244E20;
    *(_OWORD *)&result[1]._definition.maximumAngularLimit1 = xmmword_1B2244DB0;
    *(_OWORD *)&result[2].super.super.isa = xmmword_1B2244DD0;
    *(_OWORD *)&result[2].super._constraint = xmmword_1B2244D90;
    *(_OWORD *)&result[2].super._bodyB = xmmword_1B2244E20;
    *(int32x2_t *)&result[2]._definition.maximumAngularLimit1 = vdup_n_s32(0x3F490FDBu);
    result[2]._definition.maximumTwistAngle = 0.7854;
  }
  return result;
}

- (VFXPhysicsConeTwistJoint)initWithBodyA:(__n128)a3 frameA:(__n128)a4 bodyB:(__n128)a5 frameB:(__n128)a6
{
  VFXPhysicsConeTwistJoint *v14;
  const char *v15;
  uint64_t v16;
  VFXPhysicsConeTwistJoint *v17;
  const char *v18;
  uint64_t v19;
  objc_super v29;

  v29.receiver = a1;
  v29.super_class = (Class)VFXPhysicsConeTwistJoint;
  v14 = -[VFXPhysicsConeTwistJoint init](&v29, sel_init);
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setBodyA_(v14, v15, a11, v16);
    *(__n128 *)&v17->_definition.maximumAngularLimit1 = a2;
    *(__n128 *)&v17[1].super.super.isa = a3;
    *(__n128 *)&v17[1].super._constraint = a4;
    *(__n128 *)&v17[1].super._bodyB = a5;
    objc_msgSend_setBodyB_(v17, v18, a12, v19);
    *(__n128 *)&v17[1]._definition.maximumAngularLimit1 = a6;
    *(__n128 *)&v17[2].super.super.isa = a7;
    *(__n128 *)&v17[2].super._constraint = a8;
    *(__n128 *)&v17[2].super._bodyB = a9;
    *(int32x2_t *)&v17[2]._definition.maximumAngularLimit1 = vdup_n_s32(0x3F490FDBu);
    v17[2]._definition.maximumTwistAngle = 0.7854;
  }
  return v17;
}

- (__n128)initWithBody:(__n128)a3 frame:(__n128)a4
{
  VFXPhysicsConeTwistJoint *v8;
  const char *v9;
  uint64_t v10;
  __n128 *v11;
  objc_super v17;

  v17.receiver = a1;
  v17.super_class = (Class)VFXPhysicsConeTwistJoint;
  v8 = -[VFXPhysicsConeTwistJoint init](&v17, sel_init);
  v11 = (__n128 *)v8;
  if (v8)
  {
    objc_msgSend_setBodyA_(v8, v9, a7, v10);
    v11[3] = a2;
    v11[4] = a3;
    v11[5] = a4;
    v11[6] = a5;
  }
  return v11;
}

+ (id)jointWithBodyA:(double)a3 frameA:(double)a4 bodyB:(double)a5 frameB:(double)a6
{
  id v14;
  const char *v15;

  v14 = [a1 alloc];
  return (id)objc_msgSend_initWithBodyA_frameA_bodyB_frameB_(v14, v15, a11, a12, a2, a3, a4, a5, a6, a7, a8, a9);
}

+ (id)jointWithBody:(double)a3 frame:(double)a4
{
  id v8;
  const char *v9;
  uint64_t v10;

  v8 = [a1 alloc];
  return (id)objc_msgSend_initWithBody_frame_(v8, v9, a7, v10, a2, a3, a4, a5);
}

- (void)copyFrom:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)&self->_definition.maximumAngularLimit1 = *((_OWORD *)a3 + 3);
  v3 = *((_OWORD *)a3 + 7);
  v5 = *((_OWORD *)a3 + 4);
  v4 = *((_OWORD *)a3 + 5);
  *(_OWORD *)&self[1].super._bodyB = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self[1]._definition.maximumAngularLimit1 = v3;
  *(_OWORD *)&self[1].super.super.isa = v5;
  *(_OWORD *)&self[1].super._constraint = v4;
  v6 = *((_OWORD *)a3 + 11);
  v8 = *((_OWORD *)a3 + 8);
  v7 = *((_OWORD *)a3 + 9);
  *(_OWORD *)&self[2].super._bodyB = *((_OWORD *)a3 + 10);
  *(_OWORD *)&self[2]._definition.maximumAngularLimit1 = v6;
  *(_OWORD *)&self[2].super.super.isa = v8;
  *(_OWORD *)&self[2].super._constraint = v7;
}

- (__n128)frameA
{
  return a1[3];
}

- (uint64_t)setFrameA:(uint64_t)a3
{
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v17[4];
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 *v22;

  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
  a1[6] = a8;
  v9 = (void *)objc_msgSend_physicsWorld(a1, a2, a3, a4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B181AEB8;
  v17[3] = &unk_1E63D6A70;
  v22 = a1;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  return objc_msgSend__postCommandWithBlock_(v9, v10, (uint64_t)v17, v11);
}

- (__n128)frameB
{
  return a1[3];
}

- (uint64_t)setFrameB:(uint64_t)a3
{
  void *v9;
  const char *v10;
  uint64_t v11;
  _QWORD v17[4];
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 *v22;

  a1[7] = a5;
  a1[8] = a6;
  a1[9] = a7;
  a1[10] = a8;
  v9 = (void *)objc_msgSend_physicsWorld(a1, a2, a3, a4);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B181B060;
  v17[3] = &unk_1E63D6A70;
  v22 = a1;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  return objc_msgSend__postCommandWithBlock_(v9, v10, (uint64_t)v17, v11);
}

- (float)maximumAngularLimit1
{
  return self[2]._definition.maximumAngularLimit1;
}

- (void)setMaximumAngularLimit1:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  self[2]._definition.maximumAngularLimit1 = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B181B1F0;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumAngularLimit2
{
  return self[2]._definition.maximumAngularLimit2;
}

- (void)setMaximumAngularLimit2:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  self[2]._definition.maximumAngularLimit2 = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B181B2E4;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumTwistAngle
{
  return self[2]._definition.maximumTwistAngle;
}

- (void)setMaximumTwistAngle:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  self[2]._definition.maximumTwistAngle = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B181B3DC;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (btTypedConstraint)_createConstraint
{
  uint64_t v2;
  uint64_t v3;
  $0BF191A71F6C69B81B60C3EA4A488AFF *p_definition;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  p_definition = &self->_definition;
  v6 = (void *)objc_msgSend_bodyA(self, a2, v2, v3);
  v10 = (void *)objc_msgSend_bodyB(self, v7, v8, v9);
  return (btTypedConstraint *)sub_1B181A968((uint64_t)p_definition, v6, v10, v11);
}

- (void)encodeWithCoder:(id)a3
{
  VFXPhysicsConeTwistJoint *v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  objc_super v14;

  v4 = self;
  v14.receiver = self;
  v14.super_class = (Class)VFXPhysicsConeTwistJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v14, sel_encodeWithCoder_);
  v4 = (VFXPhysicsConeTwistJoint *)((char *)v4 + 48);
  LODWORD(v5) = v4[2].super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("maximumAngularLimit1"), v7, v5);
  LODWORD(v8) = HIDWORD(v4[2].super.super.isa);
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("maximumAngularLimit2"), v10, v8);
  LODWORD(v11) = v4[2].super._physicsWorld;
  objc_msgSend_encodeFloat_forKey_(a3, v12, (uint64_t)CFSTR("maximumTwistAngle"), v13, v11);
}

- (VFXPhysicsConeTwistJoint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsConeTwistJoint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  float v13;
  const char *v14;
  uint64_t v15;
  float v16;
  const char *v17;
  uint64_t v18;
  float v19;
  const char *v20;
  uint64_t v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VFXPhysicsConeTwistJoint;
  v7 = -[VFXPhysicsJoint initWithCoder:](&v23, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("maximumAngularLimit1"), v12);
    v7[2]._definition.maximumAngularLimit1 = v13;
    objc_msgSend_decodeFloatForKey_(a3, v14, (uint64_t)CFSTR("maximumAngularLimit2"), v15);
    v7[2]._definition.maximumAngularLimit2 = v16;
    objc_msgSend_decodeFloatForKey_(a3, v17, (uint64_t)CFSTR("maximumTwistAngle"), v18);
    v7[2]._definition.maximumTwistAngle = v19;
    objc_msgSend_setImmediateMode_(VFXTransaction, v20, v8, v21);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("frameA"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_frameA(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("frameB"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_frameB(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  v17.receiver = self;
  v17.super_class = (Class)VFXPhysicsConeTwistJoint;
  return -[VFXPhysicsConeTwistJoint valueForKey:](&v17, sel_valueForKey_, a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("frameA"), (uint64_t)a4))
  {
    objc_msgSend_VFXMatrix4Value(a3, v7, v8, v9);
    MEMORY[0x1E0DE7D20](self, sel_setFrameA_, v13, v14);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("frameB"), v9))
  {
    objc_msgSend_VFXMatrix4Value(a3, v10, v11, v12);
    MEMORY[0x1E0DE7D20](self, sel_setFrameB_, v15, v16);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXPhysicsConeTwistJoint;
    -[VFXPhysicsConeTwistJoint setValue:forKey:](&v17, sel_setValue_forKey_, a3, a4);
  }
}

@end
