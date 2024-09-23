@implementation VFXPhysicsHingeJoint

+ (id)hingeWithBodyA:(id)a3 axisA:(id)a4 anchorA:(id)a5 bodyB:(id)a6 axisB:(id)a7 anchorB:(id)a8
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

+ (id)hingeWithBody:(id)a3 axis:(id)a4 anchor:(id)a5
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VFXPhysicsHingeJoint;
  -[VFXPhysicsJoint dealloc](&v2, sel_dealloc);
}

- (VFXPhysicsHingeJoint)init
{
  VFXPhysicsHingeJoint *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsHingeJoint;
  result = -[VFXPhysicsHingeJoint init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result[1].super._bodyB = xmmword_1B2244D90;
    *(_OWORD *)&result[2].super.super.isa = xmmword_1B2244D90;
    *(_OWORD *)&result[1].super.super.isa = 0u;
    *(_OWORD *)&result[1].super._constraint = 0u;
  }
  return result;
}

- (void)copyFrom:(id)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *((_OWORD *)a3 + 6);
  v5 = *((_OWORD *)a3 + 3);
  v4 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self[1].super._bodyB = *((_OWORD *)a3 + 5);
  *(_OWORD *)&self[2].super.super.isa = v3;
  *(_OWORD *)&self[1].super.super.isa = v5;
  *(_OWORD *)&self[1].super._constraint = v4;
}

- (VFXPhysicsHingeJoint)initWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  VFXPhysicsHingeJoint *v10;
  const char *v11;
  uint64_t v12;
  VFXPhysicsHingeJoint *v13;
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
  v21.super_class = (Class)VFXPhysicsHingeJoint;
  v10 = -[VFXPhysicsHingeJoint init](&v21, sel_init);
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setBodyA_(v10, v11, (uint64_t)a3, v12);
    *(_OWORD *)&v13[1].super._bodyB = v17;
    *(_OWORD *)&v13[1].super.super.isa = v18;
    objc_msgSend_setBodyB_(v13, v14, (uint64_t)a4, v15);
    *(_OWORD *)&v13[2].super.super.isa = v19;
    *(_OWORD *)&v13[1].super._constraint = v20;
  }
  return v13;
}

- (VFXPhysicsHingeJoint)initWithBody:(VFXPhysicsHingeJoint *)self axis:(SEL)a2 anchor:(id)a3
{
  return (VFXPhysicsHingeJoint *)objc_msgSend_initWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_(self, a2, (uint64_t)a3, 0);
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

- (__n128)axisA
{
  return a1[5];
}

- (void)setAxisA:(VFXPhysicsHingeJoint *)self
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
  VFXPhysicsHingeJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super._bodyB = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19DF6C8;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)axisB
{
  return a1[6];
}

- (void)setAxisB:(VFXPhysicsHingeJoint *)self
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
  VFXPhysicsHingeJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[2].super.super.isa = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19DFC94;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorA
{
  return a1[3];
}

- (void)setAnchorA:(VFXPhysicsHingeJoint *)self
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
  VFXPhysicsHingeJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super.super.isa = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19DFD68;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorB
{
  return a1[4];
}

- (void)setAnchorB:(VFXPhysicsHingeJoint *)self
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
  VFXPhysicsHingeJoint *v12;

  v9 = v4;
  *(_OWORD *)&self[1].super._constraint = v4;
  v6 = (void *)objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19DFE5C;
  v10[3] = &unk_1E63D5468;
  v12 = self;
  v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
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
  VFXPhysicsHingeJoint *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int physicsWorld;
  uint64_t v21;
  int v22;
  int bodyA;
  btTypedConstraint *v24;
  btTypedConstraint *constraint;
  int v27;
  int v28;
  Class v29;
  int v30;
  int v31;
  Class isa;
  int v33;
  int v34;
  VFXPhysicsBody *bodyB;
  int v36;
  int v37;

  v5 = (void *)objc_msgSend_bodyA(self, a2, v2, v3);
  v9 = objc_msgSend_bodyB(self, v6, v7, v8);
  if (!v5)
    return 0;
  v13 = (void *)v9;
  v14 = self + 1;
  v18 = objc_msgSend__handle(v5, v10, v11, v12);
  v19 = *(_DWORD *)v14->_anon_28;
  bodyB = v14->super._bodyB;
  v36 = v19;
  v37 = 0;
  physicsWorld = (int)v14->super._physicsWorld;
  isa = v14->super.super.isa;
  v33 = physicsWorld;
  v34 = 0;
  if (v13)
  {
    v21 = objc_msgSend__handle(v13, v15, v16, v17);
    v22 = (int)v14[1].super._physicsWorld;
    v29 = v14[1].super.super.isa;
    v30 = v22;
    v31 = 0;
    bodyA = (int)v14->super._bodyA;
    constraint = v14->super._constraint;
    v27 = bodyA;
    v28 = 0;
    v24 = (btTypedConstraint *)sub_1B21FF5F0(880, 16);
    ((void (*)(btTypedConstraint *, uint64_t, uint64_t, Class *, btTypedConstraint **, VFXPhysicsBody **, Class *, _QWORD))sub_1B21F357C)(v24, v18, v21, &isa, &constraint, &bodyB, &v29, 0);
  }
  else
  {
    v24 = (btTypedConstraint *)sub_1B21FF5F0(880, 16);
    sub_1B21F3964(v24, v18, &isa, &bodyB, 0);
  }
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  __n128 *v4;
  objc_super v5;

  v4 = (__n128 *)self;
  v5.receiver = self;
  v5.super_class = (Class)VFXPhysicsHingeJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  v4 += 3;
  sub_1B18BD1D8(a3, CFSTR("axisA"), v4[2]);
  sub_1B18BD1D8(a3, CFSTR("axisB"), v4[3]);
  sub_1B18BD1D8(a3, CFSTR("anchorA"), *v4);
  sub_1B18BD1D8(a3, CFSTR("anchorB"), v4[1]);
}

- (VFXPhysicsHingeJoint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXPhysicsHingeJoint *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  const char *v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VFXPhysicsHingeJoint;
  v7 = -[VFXPhysicsJoint initWithCoder:](&v18, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *(double *)&v11 = sub_1B18BD300(a3, CFSTR("axisA"));
    *(_OWORD *)&v7[1].super._bodyB = v11;
    *(double *)&v12 = sub_1B18BD300(a3, CFSTR("axisB"));
    *(_OWORD *)&v7[2].super.super.isa = v12;
    *(double *)&v13 = sub_1B18BD300(a3, CFSTR("anchorA"));
    *(_OWORD *)&v7[1].super.super.isa = v13;
    *(double *)&v14 = sub_1B18BD300(a3, CFSTR("anchorB"));
    *(_OWORD *)&v7[1].super._constraint = v14;
    objc_msgSend_setImmediateMode_(VFXTransaction, v15, v8, v16);
  }
  return v7;
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
  v23.super_class = (Class)VFXPhysicsHingeJoint;
  return -[VFXPhysicsHingeJoint valueForKey:](&v23, sel_valueForKey_, a3);
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
    v27.super_class = (Class)VFXPhysicsHingeJoint;
    -[VFXPhysicsHingeJoint setValue:forKey:](&v27, sel_setValue_forKey_, a3, a4);
  }
}

@end
