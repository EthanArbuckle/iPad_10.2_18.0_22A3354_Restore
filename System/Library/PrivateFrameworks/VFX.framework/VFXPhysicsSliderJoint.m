@implementation VFXPhysicsSliderJoint

- (VFXPhysicsSliderJoint)init
{
  VFXPhysicsSliderJoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsSliderJoint;
  result = -[VFXPhysicsSliderJoint init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result[1].super.super.isa = xmmword_1B2244D90;
    *(_OWORD *)&result[1].super._bodyB = xmmword_1B2244D90;
    *(_OWORD *)&result[2].super._constraint = xmmword_1B22479F0;
    *(_DWORD *)&result[2]._anon_28[4] = 1065353216;
    HIDWORD(result[2].super._bodyB) = 1065353216;
  }
  return result;
}

- (VFXPhysicsSliderJoint)initWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  VFXPhysicsSliderJoint *v10;
  const char *v11;
  uint64_t v12;
  VFXPhysicsSliderJoint *v13;
  const char *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;

  v19 = v6;
  v20 = v7;
  v17 = v4;
  v18 = v5;
  v21.receiver = self;
  v21.super_class = (Class)VFXPhysicsSliderJoint;
  v10 = -[VFXPhysicsSliderJoint init](&v21, sel_init);
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setBodyA_(v10, v11, (uint64_t)a3, v12);
    *(_OWORD *)&v13[1].super.super.isa = v17;
    *(_OWORD *)&v13[1].super._constraint = v18;
    objc_msgSend_setBodyB_(v13, v14, (uint64_t)a4, v15);
    *(_OWORD *)&v13[1].super._bodyB = v19;
    *(_OWORD *)&v13[2].super.super.isa = v20;
    *(_OWORD *)&v13[2].super._constraint = xmmword_1B22479F0;
    *(_DWORD *)&v13[2]._anon_28[4] = 1065353216;
    HIDWORD(v13[2].super._bodyB) = 1065353216;
  }
  return v13;
}

- (VFXPhysicsSliderJoint)initWithBody:(VFXPhysicsSliderJoint *)self axis:(SEL)a2 anchor:(id)a3
{
  return (VFXPhysicsSliderJoint *)objc_msgSend_initWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_(self, a2, (uint64_t)a3, 0);
}

+ (id)jointWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v10;
  const char *v11;
  double v13;
  double v14;
  double v15;
  double v16;

  v16 = v7;
  v14 = v5;
  v15 = v6;
  v13 = v4;
  v10 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_(v10, v11, (uint64_t)a3, (uint64_t)a4, v13, v14, v15, v16);
}

+ (id)jointWithBody:(id)a1 axis:(SEL)a2 anchor:(id)a3
{
  double v3;
  double v4;
  id v6;
  const char *v7;
  uint64_t v8;
  double v10;
  double v11;

  v10 = v3;
  v11 = v4;
  v6 = objc_alloc((Class)a1);
  return (id)objc_msgSend_initWithBody_axis_anchor_(v6, v7, (uint64_t)a3, v8, v10, v11);
}

- (void)copyFrom:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self[1].super.super.isa = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self[1].super._constraint = v3;
  v4 = *((_OWORD *)a3 + 8);
  v6 = *((_OWORD *)a3 + 5);
  v5 = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self[2].super._constraint = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self[2].super._bodyB = v4;
  *(_OWORD *)&self[1].super._bodyB = v6;
  *(_OWORD *)&self[2].super.super.isa = v5;
}

- (__n128)axisA
{
  return a1[3];
}

- (void)setAxisA:(VFXPhysicsSliderJoint *)self
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
  VFXPhysicsSliderJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super.super.isa = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B8F48;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)axisB
{
  return a1[5];
}

- (void)setAxisB:(VFXPhysicsSliderJoint *)self
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
  VFXPhysicsSliderJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super._bodyB = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B90E4;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorA
{
  return a1[4];
}

- (void)setAnchorA:(VFXPhysicsSliderJoint *)self
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
  VFXPhysicsSliderJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super._constraint = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9280;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorB
{
  return a1[5];
}

- (void)setAnchorB:(VFXPhysicsSliderJoint *)self
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
  VFXPhysicsSliderJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[2].super.super.isa = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9370;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (float)minimumLinearLimit
{
  return *(float *)&self[2].super._constraint;
}

- (void)setMinimumLinearLimit:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *(float *)&self[2].super._constraint = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9464;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumLinearLimit
{
  return *((float *)&self[2].super._constraint + 1);
}

- (void)setMaximumLinearLimit:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *((float *)&self[2].super._constraint + 1) = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9528;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)minimumAngularLimit
{
  return *(float *)&self[2].super._bodyA;
}

- (void)setMinimumAngularLimit:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *(float *)&self[2].super._bodyA = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B95EC;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumAngularLimit
{
  return *((float *)&self[2].super._bodyA + 1);
}

- (void)setMaximumAngularLimit:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *((float *)&self[2].super._bodyA + 1) = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9700;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorTargetLinearVelocity
{
  return *(float *)&self[2].super._bodyB;
}

- (void)setMotorTargetLinearVelocity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *(float *)&self[2].super._bodyB = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9814;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorMaximumForce
{
  return *((float *)&self[2].super._bodyB + 1);
}

- (void)setMotorMaximumForce:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *((float *)&self[2].super._bodyB + 1) = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B98E4;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorTargetAngularVelocity
{
  return *(float *)self[2]._anon_28;
}

- (void)setMotorTargetAngularVelocity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *(float *)self[2]._anon_28 = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B99A8;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorMaximumTorque
{
  return *(float *)&self[2]._anon_28[4];
}

- (void)setMotorMaximumTorque:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[5];
  float v11;

  *(float *)&self[2]._anon_28[4] = a3;
  v7 = (void *)objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18B9A78;
  v10[3] = &unk_1E63D53A0;
  v10[4] = self;
  v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (btTypedConstraint)_createConstraint
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  VFXPhysicsSliderJoint *v14;
  __int128 v15;
  float v16;
  float v17;
  BOOL v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  __int128 v34;
  float v35;
  float v36;
  float v37;
  BOOL v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  float v61;
  float v62;
  float v63;
  float v64;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  __int128 v78;

  v5 = (void *)objc_msgSend_bodyA(self, a2, v2, v3);
  v9 = objc_msgSend_bodyB(self, v6, v7, v8);
  if (!v5)
    return 0;
  v13 = (void *)v9;
  v14 = self + 1;
  v15 = *(_OWORD *)&self[1].super._constraint;
  HIDWORD(v15) = 0;
  v78 = v15;
  v16 = *((float *)&self[1].super.super.isa + 1);
  v17 = *(float *)&self[1].super._physicsWorld;
  v18 = fabsf(v17) <= 0.70711;
  *(float *)&v15 = (float)(v16 * v16) + (float)(*(float *)&self[1].super.super.isa * *(float *)&self[1].super.super.isa);
  v19 = 1.0 / sqrtf(*(float *)&v15);
  v20 = -(float)(v16 * v19);
  v21 = *(float *)&self[1].super.super.isa * v19;
  v22 = -(float)(v17 * v21);
  v23 = v17 * v20;
  v24 = *(float *)&v15 * v19;
  v25 = 0.0;
  v26 = (float)(v17 * v17) + (float)(v16 * v16);
  v27 = 1.0 / sqrtf(v26);
  v28 = -(float)(v17 * v27);
  v29 = v16 * v27;
  v30 = v26 * v27;
  v31 = -(float)(*(float *)&self[1].super.super.isa * (float)(v16 * v27));
  v32 = *(float *)&self[1].super.super.isa * v28;
  if (v18)
  {
    v33 = 0.0;
  }
  else
  {
    v21 = v28;
    v20 = 0.0;
    v33 = v29;
  }
  if (!v18)
  {
    v24 = v32;
    v23 = v31;
    v22 = v30;
  }
  LODWORD(v72) = v14->super.super.isa;
  *((float *)&v72 + 1) = v20;
  v73 = LODWORD(v22);
  v74 = __PAIR64__(LODWORD(v21), LODWORD(v16));
  v75 = LODWORD(v23);
  v76 = __PAIR64__(LODWORD(v33), LODWORD(v17));
  v77 = LODWORD(v24);
  v34 = *(_OWORD *)&self[2].super.super.isa;
  HIDWORD(v34) = 0;
  v71 = v34;
  v35 = *(float *)&self[1].super._bodyB;
  v36 = *((float *)&self[1].super._bodyB + 1);
  v37 = *(float *)self[1]._anon_28;
  v38 = fabsf(v37) <= 0.70711;
  v39 = (float)(v36 * v36) + (float)(v35 * v35);
  v40 = 1.0 / sqrtf(v39);
  v41 = -(float)(v36 * v40);
  v42 = v35 * v40;
  v43 = -(float)(v37 * (float)(v35 * v40));
  v44 = v37 * v41;
  v45 = v39 * v40;
  v46 = (float)(v37 * v37) + (float)(v36 * v36);
  v47 = 1.0 / sqrtf(v46);
  v48 = -(float)(v37 * v47);
  v49 = v36 * v47;
  v50 = v46 * v47;
  v51 = -(float)(v35 * (float)(v36 * v47));
  if (v38)
  {
    v50 = v43;
  }
  else
  {
    v42 = v48;
    v41 = 0.0;
  }
  LODWORD(v66) = self[1].super._bodyB;
  *((float *)&v66 + 1) = v41;
  v67 = LODWORD(v50);
  v68 = __PAIR64__(LODWORD(v42), LODWORD(v36));
  v52 = v35 * v48;
  if (v38)
  {
    v53 = v44;
  }
  else
  {
    v25 = v49;
    v53 = v51;
  }
  v69 = LODWORD(v53);
  v70 = __PAIR64__(LODWORD(v25), LODWORD(v37));
  if (v38)
    v54 = v45;
  else
    v54 = v52;
  v58 = objc_msgSend__handle(v5, v10, v11, v12, v66, v67, v68, v69, v70, LODWORD(v54), v71, v72, v73, v74, v75, v76, v77, v78);
  if (v13)
  {
    v59 = objc_msgSend__handle(v13, v55, v56, v57);
    v60 = sub_1B21FF5F0(1248, 16);
    sub_1B21F984C(v60, v58, v59, &v72, &v66, 1);
  }
  else
  {
    v60 = sub_1B21FF5F0(1248, 16);
    sub_1B21F9950(v60, v58, &v72, 1);
  }
  *(_QWORD *)(v60 + 212) = v14[1].super._constraint;
  v61 = fmodf(*(float *)&v14[1].super._bodyA, 6.2832);
  if (v61 >= -3.1416)
  {
    if (v61 > 3.1416)
      v61 = v61 + -6.2832;
  }
  else
  {
    v61 = v61 + 6.2832;
  }
  *(float *)(v60 + 220) = v61;
  v62 = fmodf(*((float *)&v14[1].super._bodyA + 1), 6.2832);
  if (v62 >= -3.1416)
  {
    if (v62 > 3.1416)
      v62 = v62 + -6.2832;
  }
  else
  {
    v62 = v62 + 6.2832;
  }
  *(float *)(v60 + 224) = v62;
  v63 = *(float *)&v14[1].super._bodyB;
  if (v63 != 0.0)
  {
    *(_BYTE *)(v60 + 1216) = 1;
    *(float *)(v60 + 1220) = v63;
    *(_DWORD *)(v60 + 1224) = HIDWORD(v14[1].super._bodyB);
  }
  v64 = *(float *)v14[1]._anon_28;
  if (v64 != 0.0)
  {
    *(_BYTE *)(v60 + 1232) = 1;
    *(float *)(v60 + 1236) = v64;
    *(_DWORD *)(v60 + 1240) = *(_DWORD *)&v14[1]._anon_28[4];
  }
  return (btTypedConstraint *)v60;
}

- (void)encodeWithCoder:(id)a3
{
  __n128 *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  objc_super v21;

  v4 = (__n128 *)self;
  v21.receiver = self;
  v21.super_class = (Class)VFXPhysicsSliderJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v21, sel_encodeWithCoder_);
  v4 += 3;
  sub_1B18BD1D8(a3, CFSTR("axisA"), *v4);
  sub_1B18BD1D8(a3, CFSTR("axisB"), v4[2]);
  sub_1B18BD1D8(a3, CFSTR("anchorA"), v4[1]);
  sub_1B18BD1D8(a3, CFSTR("anchorB"), v4[3]);
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("minLinearLimit"), v6, v4[4].n128_f32[0]);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("maxLinearLimit"), v8, v4[4].n128_f32[1]);
  objc_msgSend_encodeDouble_forKey_(a3, v9, (uint64_t)CFSTR("minAngularLimit"), v10, v4[4].n128_f32[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v11, (uint64_t)CFSTR("maxAngularLimit"), v12, v4[4].n128_f32[3]);
  objc_msgSend_encodeDouble_forKey_(a3, v13, (uint64_t)CFSTR("motorTargetLinearVelocity"), v14, v4[5].n128_f32[0]);
  objc_msgSend_encodeDouble_forKey_(a3, v15, (uint64_t)CFSTR("motorMaximumForce"), v16, v4[5].n128_f32[1]);
  objc_msgSend_encodeDouble_forKey_(a3, v17, (uint64_t)CFSTR("motorTargetAngularVelocity"), v18, v4[5].n128_f32[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v19, (uint64_t)CFSTR("motorMaximumTorque"), v20, v4[5].n128_f32[3]);
}

- (VFXPhysicsSliderJoint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsSliderJoint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)VFXPhysicsSliderJoint;
  v7 = -[VFXPhysicsJoint initWithCoder:](&v42, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *(double *)&v11 = sub_1B18BD300(a3, CFSTR("axisA"));
    *(_OWORD *)&v7[1].super.super.isa = v11;
    *(double *)&v12 = sub_1B18BD300(a3, CFSTR("axisB"));
    *(_OWORD *)&v7[1].super._bodyB = v12;
    *(double *)&v13 = sub_1B18BD300(a3, CFSTR("anchorA"));
    *(_OWORD *)&v7[1].super._constraint = v13;
    *(double *)&v14 = sub_1B18BD300(a3, CFSTR("anchorB"));
    *(_OWORD *)&v7[2].super.super.isa = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v15, (uint64_t)CFSTR("minLinearLimit"), v16);
    *(float *)&v17 = v17;
    LODWORD(v7[2].super._constraint) = LODWORD(v17);
    objc_msgSend_decodeDoubleForKey_(a3, v18, (uint64_t)CFSTR("maxLinearLimit"), v19);
    *(float *)&v20 = v20;
    HIDWORD(v7[2].super._constraint) = LODWORD(v20);
    objc_msgSend_decodeDoubleForKey_(a3, v21, (uint64_t)CFSTR("minAngularLimit"), v22);
    *(float *)&v23 = v23;
    LODWORD(v7[2].super._bodyA) = LODWORD(v23);
    objc_msgSend_decodeDoubleForKey_(a3, v24, (uint64_t)CFSTR("maxAngularLimit"), v25);
    *(float *)&v26 = v26;
    HIDWORD(v7[2].super._bodyA) = LODWORD(v26);
    objc_msgSend_decodeDoubleForKey_(a3, v27, (uint64_t)CFSTR("motorTargetLinearVelocity"), v28);
    *(float *)&v29 = v29;
    LODWORD(v7[2].super._bodyB) = LODWORD(v29);
    objc_msgSend_decodeDoubleForKey_(a3, v30, (uint64_t)CFSTR("motorMaximumForce"), v31);
    *(float *)&v32 = v32;
    HIDWORD(v7[2].super._bodyB) = LODWORD(v32);
    objc_msgSend_decodeDoubleForKey_(a3, v33, (uint64_t)CFSTR("motorTargetAngularVelocity"), v34);
    *(float *)&v35 = v35;
    *(_DWORD *)v7[2]._anon_28 = LODWORD(v35);
    objc_msgSend_decodeDoubleForKey_(a3, v36, (uint64_t)CFSTR("motorMaximumTorque"), v37);
    *(float *)&v38 = v38;
    *(_DWORD *)&v7[2]._anon_28[4] = LODWORD(v38);
    objc_msgSend_setImmediateMode_(VFXTransaction, v39, v8, v40);
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("axisA"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_axisA(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("axisB"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_axisB(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("anchorA"), v15))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_anchorA(self, v16, v17, v18);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v16, (uint64_t)CFSTR("anchorB"), v18))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_anchorB(self, v19, v20, v21);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v23.receiver = self;
  v23.super_class = (Class)VFXPhysicsSliderJoint;
  return -[VFXPhysicsSliderJoint valueForKey:](&v23, sel_valueForKey_, a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
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

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("axisA"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    MEMORY[0x1E0DE7D20](self, sel_setAxisA_, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("axisB"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v10, v11, v12);
    MEMORY[0x1E0DE7D20](self, sel_setAxisB_, v25, v26);
  }
  else if (objc_msgSend_isEqualToString_(a4, v10, (uint64_t)CFSTR("anchorA"), v12))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    MEMORY[0x1E0DE7D20](self, sel_setAnchorA_, v19, v20);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("anchorB"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v16, v17, v18);
    MEMORY[0x1E0DE7D20](self, sel_setAnchorB_, v21, v22);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)VFXPhysicsSliderJoint;
    -[VFXPhysicsSliderJoint setValue:forKey:](&v27, sel_setValue_forKey_, a3, a4);
  }
}

+ (id)sliderWithBodyA:(id)a3 axisA:(id)a4 anchorA:(id)a5 bodyB:(id)a6 axisB:(id)a7 anchorB:(id)a8
{
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;

  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v19, 1, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v25, 2, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v33 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v31, 0, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v37, 1, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  v45 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v43, 2, v44);
  objc_msgSend_floatValue(v45, v46, v47, v48);
  v51 = (void *)objc_msgSend_objectAtIndexedSubscript_(a7, v49, 0, v50);
  objc_msgSend_floatValue(v51, v52, v53, v54);
  v57 = (void *)objc_msgSend_objectAtIndexedSubscript_(a7, v55, 1, v56);
  objc_msgSend_floatValue(v57, v58, v59, v60);
  v63 = (void *)objc_msgSend_objectAtIndexedSubscript_(a7, v61, 2, v62);
  objc_msgSend_floatValue(v63, v64, v65, v66);
  v69 = (void *)objc_msgSend_objectAtIndexedSubscript_(a8, v67, 0, v68);
  objc_msgSend_floatValue(v69, v70, v71, v72);
  v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(a8, v73, 1, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  v81 = (void *)objc_msgSend_objectAtIndexedSubscript_(a8, v79, 2, v80);
  objc_msgSend_floatValue(v81, v82, v83, v84);
  return (id)MEMORY[0x1E0DE7D20](a1, sel_jointWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_, a3, a6);
}

+ (id)sliderWithBody:(id)a3 axis:(id)a4 anchor:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v9 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v33 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  return (id)MEMORY[0x1E0DE7D20](a1, sel_jointWithBody_axis_anchor_, a3, v43);
}

- (id)axisAValue
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
  objc_msgSend_axisA(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_axisA(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_axisA(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setAxisAValue:(id)a3
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
  MEMORY[0x1E0DE7D20](self, sel_setAxisA_, v22, v23);
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

- (id)axisBValue
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
  objc_msgSend_axisB(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_axisB(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_axisB(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setAxisBValue:(id)a3
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
  MEMORY[0x1E0DE7D20](self, sel_setAxisB_, v22, v23);
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

@end
