@implementation VFXPhysicsBallSocketJoint

- (VFXPhysicsBallSocketJoint)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsBallSocketJoint;
  return -[VFXPhysicsBallSocketJoint init](&v3, sel_init);
}

- (VFXPhysicsBallSocketJoint)initWithBodyA:(VFXPhysicsBallSocketJoint *)self anchorA:(SEL)a2 bodyB:(id)a3 anchorB:(id)a4
{
  __int128 v4;
  __int128 v5;
  VFXPhysicsBallSocketJoint *v8;
  const char *v9;
  uint64_t v10;
  VFXPhysicsBallSocketJoint *v11;
  const char *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  objc_super v17;

  v15 = v4;
  v16 = v5;
  v17.receiver = self;
  v17.super_class = (Class)VFXPhysicsBallSocketJoint;
  v8 = -[VFXPhysicsBallSocketJoint init](&v17, sel_init);
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setBodyA_(v8, v9, (uint64_t)a3, v10);
    *(_OWORD *)&v11[1].super.super.isa = v15;
    objc_msgSend_setBodyB_(v11, v12, (uint64_t)a4, v13);
    *(_OWORD *)&v11[1].super._constraint = v16;
  }
  return v11;
}

- (VFXPhysicsBallSocketJoint)initWithBody:(id)a3 anchor:
{
  __int128 v3;
  VFXPhysicsBallSocketJoint *v5;
  const char *v6;
  uint64_t v7;
  VFXPhysicsBallSocketJoint *v8;
  __int128 v10;
  objc_super v11;

  v10 = v3;
  v11.receiver = self;
  v11.super_class = (Class)VFXPhysicsBallSocketJoint;
  v5 = -[VFXPhysicsBallSocketJoint init](&v11, sel_init);
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setBodyA_(v5, v6, (uint64_t)a3, v7);
    *(_OWORD *)&v8[1].super.super.isa = v10;
  }
  return v8;
}

+ (id)jointWithBodyA:(id)a1 anchorA:(SEL)a2 bodyB:(id)a3 anchorB:(id)a4
{
  double v4;
  double v5;
  id v8;
  const char *v9;
  double v11;
  double v12;

  v11 = v4;
  v12 = v5;
  v8 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithBodyA_anchorA_bodyB_anchorB_(v8, v9, (uint64_t)a3, (uint64_t)a4, v11, v12);
}

+ (id)jointWithBody:(id)a3 anchor:
{
  double v3;
  id v5;
  const char *v6;
  uint64_t v7;
  double v9;

  v9 = v3;
  v5 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithBody_anchor_(v5, v6, (uint64_t)a3, v7, v9);
}

- (void)copyFrom:(id)a3
{
  __int128 v3;

  v3 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self[1].super.super.isa = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self[1].super._constraint = v3;
}

- (__n128)anchorA
{
  return a1[3];
}

- (void)setAnchorA:(VFXPhysicsBallSocketJoint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXPhysicsBallSocketJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super.super.isa = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1941354;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorB
{
  return a1[4];
}

- (void)setAnchorB:(VFXPhysicsBallSocketJoint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXPhysicsBallSocketJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super._constraint = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B1941418;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (btTypedConstraint)_createConstraint
{
  uint64_t v2;
  uint64_t v3;
  VFXPhysicsBallSocketJoint *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v5 = self + 1;
  v6 = (void *)objc_msgSend_bodyA(self, a2, v2, v3);
  v10 = (void *)objc_msgSend_bodyB(self, v7, v8, v9);
  return (btTypedConstraint *)sub_1B1941010((uint64_t)v5, v6, v10, v11);
}

- (void)encodeWithCoder:(id)a3
{
  __n128 *v4;
  objc_super v5;

  v4 = (__n128 *)self;
  v5.receiver = self;
  v5.super_class = (Class)VFXPhysicsBallSocketJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  v4 += 3;
  sub_1B18BD1D8(a3, CFSTR("anchorA"), *v4);
  sub_1B18BD1D8(a3, CFSTR("anchorB"), v4[1]);
}

- (VFXPhysicsBallSocketJoint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsBallSocketJoint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VFXPhysicsBallSocketJoint;
  v7 = -[VFXPhysicsJoint initWithCoder:](&v16, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *(double *)&v11 = sub_1B18BD300(a3, CFSTR("anchorA"));
    *(_OWORD *)&v7[1].super.super.isa = v11;
    *(double *)&v12 = sub_1B18BD300(a3, CFSTR("anchorB"));
    *(_OWORD *)&v7[1].super._constraint = v12;
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, v8, v14);
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

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("anchorA"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_anchorA(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("anchorB"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_anchorB(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v17.receiver = self;
  v17.super_class = (Class)VFXPhysicsBallSocketJoint;
  return -[VFXPhysicsBallSocketJoint valueForKey:](&v17, sel_valueForKey_, a3);
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

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("anchorA"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    MEMORY[0x1E0DE7D20](self, sel_setAnchorA_, v13, v14);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("anchorB"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v10, v11, v12);
    MEMORY[0x1E0DE7D20](self, sel_setAnchorB_, v15, v16);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXPhysicsBallSocketJoint;
    -[VFXPhysicsBallSocketJoint setValue:forKey:](&v17, sel_setValue_forKey_, a3, a4);
  }
}

- (id)anchorAValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_anchorA(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_anchorA(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_anchorA(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setAnchorAValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  MEMORY[0x1E0DE7D20](self, sel_setAnchorA_, v22, v23);
}

- (id)anchorBValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_anchorB(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_anchorB(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_anchorB(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setAnchorBValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  MEMORY[0x1E0DE7D20](self, sel_setAnchorB_, v22, v23);
}

+ (id)ballSocketWithBodyA:(id)a3 anchorA:(id)a4 bodyB:(id)a5 anchorB:(id)a6
{
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  v10 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v10, v11, v12, v13);
  v16 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v14, 1, v15);
  objc_msgSend_floatValue(v16, v17, v18, v19);
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  v28 = (void *)objc_msgSend_objectAtIndexedSubscript_(a6, v26, 0, v27);
  objc_msgSend_floatValue(v28, v29, v30, v31);
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a6, v32, 1, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v40 = (void *)objc_msgSend_objectAtIndexedSubscript_(a6, v38, 2, v39);
  objc_msgSend_floatValue(v40, v41, v42, v43);
  return (id)MEMORY[0x1E0DE7D20](VFXPhysicsBallSocketJoint, sel_jointWithBodyA_anchorA_bodyB_anchorB_, a3, a5);
}

+ (id)ballSocketWithBody:(id)a3 anchor:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  return (id)MEMORY[0x1E0DE7D20](VFXPhysicsBallSocketJoint, sel_jointWithBody_anchor_, a3, v22);
}

@end
