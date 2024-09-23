@implementation VFXLookAtConstraint

- (id)targetOffsetValue
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
  objc_msgSend_targetOffset(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_targetOffset(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_targetOffset(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setTargetOffsetValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setTargetOffset_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)localFrontValue
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
  objc_msgSend_localFront(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localFront(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localFront(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setLocalFrontValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setLocalFront_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)upVectorValue
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
  objc_msgSend_upVector(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_upVector(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_upVector(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setUpVectorValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setUpVector_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (VFXLookAtConstraint)initWithTarget:(id)a3
{
  VFXLookAtConstraint *v4;
  VFXNode *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXLookAtConstraint;
  v4 = -[VFXConstraint init](&v10, sel_init);
  if (v4)
  {
    v5 = (VFXNode *)a3;
    v4->_target = v5;
    if (v5)
      v5 = (VFXNode *)objc_msgSend_nodeRef(v5, v6, v7, v8);
    v4->_gimbalLockEnabled = 0;
    *(_OWORD *)&v4->_targetOffset[7] = 0u;
    *(_OWORD *)&v4->_localFront[7] = xmmword_1B2244DF0;
    *(_OWORD *)&v4->_upVector[7] = xmmword_1B2244DD0;
    v4->super._constraintRef = (__CFXConstraint *)sub_1B19BAB80(v5);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXLookAtConstraint;
  -[VFXConstraint dealloc](&v3, sel_dealloc);
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

+ (id)lookAtConstraintWithTarget:(id)a3
{
  VFXLookAtConstraint *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXLookAtConstraint alloc];
  return (id)objc_msgSend_initWithTarget_(v4, v5, (uint64_t)a3, v6);
}

- (BOOL)gimbalLockEnabled
{
  return self->_gimbalLockEnabled;
}

- (void)setGimbalLockEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_gimbalLockEnabled = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C6F24;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
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
    v13[2] = sub_1B19C7000;
    v13[3] = &unk_1E63D5440;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (__n128)targetOffset
{
  return a1[4];
}

- (void)setTargetOffset:(VFXLookAtConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  VFXLookAtConstraint *v11;

  v8 = v4;
  *(_OWORD *)&self->_targetOffset[7] = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C70B0;
  v9[3] = &unk_1E63D5468;
  v11 = self;
  v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("targetOffset"), v9);
}

- (__n128)worldUp
{
  return a1[5];
}

- (void)setWorldUp:(VFXLookAtConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  VFXLookAtConstraint *v11;

  v8 = v4;
  *(_OWORD *)&self->_upVector[7] = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C7168;
  v9[3] = &unk_1E63D5468;
  v11 = self;
  v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("worldUp"), v9);
}

- (void)setUpVector:(VFXLookAtConstraint *)self
{
  ((void (*)(VFXLookAtConstraint *, char *))MEMORY[0x1E0DE7D20])(self, sel_setWorldUp_);
}

- (__n128)localFront
{
  return a1[6];
}

- (void)setLocalFront:(VFXLookAtConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  VFXLookAtConstraint *v11;

  v8 = v4;
  *(_OWORD *)&self->_localFront[7] = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C7228;
  v9[3] = &unk_1E63D5468;
  v11 = self;
  v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("localFront"), v9);
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
  objc_super v20;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("targetOffset"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_targetOffset(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("localFront"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_localFront(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("worldUp"), v15))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_worldUp(self, v16, v17, v18);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v20.receiver = self;
  v20.super_class = (Class)VFXLookAtConstraint;
  return -[VFXLookAtConstraint valueForKey:](&v20, sel_valueForKey_, a3);
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("targetOffset"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setTargetOffset_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("localFront"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setLocalFront_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("worldUp"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    MEMORY[0x1E0DE7D20](self, sel_setWorldUp_, v22, v23);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)VFXLookAtConstraint;
    -[VFXLookAtConstraint setValue:forKey:](&v24, sel_setValue_forKey_, a3, a4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
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
  uint64_t v31;
  const char *v32;
  uint64_t v33;

  v4 = objc_alloc((Class)objc_opt_class());
  v7 = (void *)objc_msgSend_initWithTarget_(v4, v5, (uint64_t)self->_target, v6);
  v11 = objc_msgSend_gimbalLockEnabled(self, v8, v9, v10);
  objc_msgSend_setGimbalLockEnabled_(v7, v12, v11, v13);
  objc_msgSend_targetOffset(self, v14, v15, v16);
  objc_msgSend_setTargetOffset_(v7, v17, v18, v19);
  objc_msgSend_upVector(self, v20, v21, v22);
  objc_msgSend_setUpVector_(v7, v23, v24, v25);
  objc_msgSend_localFront(self, v26, v27, v28);
  objc_msgSend_setLocalFront_(v7, v29, v30, v31);
  objc_msgSend_copyTo_(self, v32, (uint64_t)v7, v33);
  return v7;
}

- (void)_customEncodingOfVFXLookAtConstraint:(id)a3
{
  VFXNode *target;

  target = self->_target;
  if (target)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, (uint64_t)CFSTR("target"));
}

- (void)_customDecodingOfVFXLookAtConstraint:(id)a3
{
  uint64_t v5;
  const char *v6;
  VFXNode *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const char *v12;
  uint64_t v13;

  v5 = objc_opt_class();
  v7 = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("target"));
  self->_target = v7;
  v11 = (const void *)objc_msgSend_nodeRef(v7, v8, v9, v10);
  self->super._constraintRef = (__CFXConstraint *)sub_1B19BAB80(v11);
  objc_msgSend_finalizeDecodeConstraint_(self, v12, (uint64_t)a3, v13);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VFXLookAtConstraint;
  -[VFXConstraint encodeWithCoder:](&v8, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXLookAtConstraint_(self, v5, (uint64_t)a3, v6);
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_gimbalLockEnabled, (uint64_t)CFSTR("gimbalLockEnabled"));
  sub_1B18BD1D8(a3, CFSTR("targetOffset"), *(__n128 *)&self->_targetOffset[7]);
  sub_1B18BD1D8(a3, CFSTR("upVector"), *(__n128 *)&self->_upVector[7]);
  sub_1B18BD1D8(a3, CFSTR("localFront"), *(__n128 *)&self->_localFront[7]);
}

- (VFXLookAtConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXLookAtConstraint *v7;
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
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  float32x4_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  float32x4_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)VFXLookAtConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v51, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXLookAtConstraint_(v7, v11, (uint64_t)a3, v12);
    v15 = objc_msgSend_decodeBoolForKey_(a3, v13, (uint64_t)CFSTR("gimbalLockEnabled"), v14);
    objc_msgSend_setGimbalLockEnabled_(v7, v16, v15, v17);
    if (objc_msgSend_containsValueForKey_(a3, v18, (uint64_t)CFSTR("targetOffset"), v19))
    {
      v22 = sub_1B18BD300(a3, CFSTR("targetOffset"));
      objc_msgSend_setTargetOffset_(v7, v23, v24, v25, v22);
    }
    if (objc_msgSend_containsValueForKey_(a3, v20, (uint64_t)CFSTR("upVector"), v21))
      v29 = sub_1B18BD300(a3, CFSTR("upVector"));
    else
      v29 = 0.0078125;
    objc_msgSend_setUpVector_(v7, v26, v27, v28, v29);
    if (objc_msgSend_containsValueForKey_(a3, v30, (uint64_t)CFSTR("localFront"), v31))
    {
      v35 = sub_1B18BD300(a3, CFSTR("localFront"));
      objc_msgSend_setLocalFront_(v7, v36, v37, v38, v35);
    }
    else
    {
      objc_msgSend_setUpVector_(v7, v32, v33, v34, 0.0);
    }
    objc_msgSend_upVector(v7, v39, v40, v41);
    if (VFXVector3EqualToVector3(v42, (float32x4_t)0))
      objc_msgSend_setUpVector_(v7, v43, v44, v45, 0.0078125);
    objc_msgSend_localFront(v7, v43, v44, v45);
    if (VFXVector3EqualToVector3(v46, (float32x4_t)0))
      objc_msgSend_setLocalFront_(v7, v47, v48, v49, 0.0);
    objc_msgSend_setImmediateMode_(VFXTransaction, v47, v8, v49);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
