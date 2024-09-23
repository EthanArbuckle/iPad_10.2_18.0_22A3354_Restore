@implementation VFXReplicatorConstraint

- (VFXReplicatorConstraint)init
{
  VFXReplicatorConstraint *v2;
  __CFXConstraint *v3;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXReplicatorConstraint;
  v2 = -[VFXConstraint init](&v10, sel_init);
  if (v2)
  {
    sub_1B19C0114();
    v2->super._constraintRef = v3;
    v2->_replicateOrientation = 1;
    v2->_replicatePosition = 1;
    v2->_replicateScale = 1;
    *(_OWORD *)&v2->_anon_40[5] = xmmword_1B2244E20;
    *(_OWORD *)&v2->_positionOffset[5] = 0u;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&v2->_scaleOffset[5] = _Q0;
  }
  return v2;
}

+ (id)replicatorConstraint
{
  return objc_alloc_init(VFXReplicatorConstraint);
}

+ (id)replicatorConstraintWithTarget:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_replicatorConstraint(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_setTarget_(v5, v6, (uint64_t)a3, v7);
  return v5;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_setTarget_(v4, v9, v8, v10);
  v14 = objc_msgSend_replicatesOrientation(self, v11, v12, v13);
  objc_msgSend_setReplicatesOrientation_(v4, v15, v14, v16);
  v20 = objc_msgSend_replicatesPosition(self, v17, v18, v19);
  objc_msgSend_setReplicatesPosition_(v4, v21, v20, v22);
  v26 = objc_msgSend_replicatesScale(self, v23, v24, v25);
  objc_msgSend_setReplicatesScale_(v4, v27, v26, v28);
  objc_msgSend_orientationOffset(self, v29, v30, v31);
  objc_msgSend_setOrientationOffset_(v4, v32, v33, v34);
  objc_msgSend_positionOffset(self, v35, v36, v37);
  objc_msgSend_setPositionOffset_(v4, v38, v39, v40);
  objc_msgSend_scaleOffset(self, v41, v42, v43);
  objc_msgSend_setScaleOffset_(v4, v44, v45, v46);
  objc_msgSend_copyTo_(self, v47, (uint64_t)v4, v48);
  return v4;
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
    v13[2] = sub_1B19C814C;
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

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  const void *Value;
  const char *v5;
  uint64_t v6;

  Value = CFDictionaryGetValue(a3, self->_target);
  if (Value)
    objc_msgSend_setTarget_(self, v5, (uint64_t)Value, v6);
}

- (void)setReplicatesOrientation:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_replicateOrientation = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C8240;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)replicatesOrientation
{
  return self->_replicateOrientation;
}

- (void)setReplicatesPosition:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_replicatePosition = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C82F4;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)replicatesPosition
{
  return self->_replicatePosition;
}

- (void)setReplicatesScale:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  self->_replicateScale = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B19C83A8;
  v8[3] = &unk_1E63D5328;
  v8[4] = self;
  v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)replicatesScale
{
  return self->_replicateScale;
}

- (uint64_t)setOrientationOffset:(uint64_t)a3
{
  uint64_t v6;
  const char *v7;
  _QWORD v10[4];
  __n128 v11;
  __n128 *v12;

  a1[4] = a5;
  v6 = objc_msgSend_worldRef(a1, a2, a3, a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B19C8460;
  v10[3] = &unk_1E63D5468;
  v12 = a1;
  v11 = a5;
  return objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)a1, CFSTR("orientationOffset"), v10);
}

- (__n128)orientationOffset
{
  return a1[4];
}

- (void)setPositionOffset:(VFXReplicatorConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  VFXReplicatorConstraint *v11;

  v8 = v4;
  *(_OWORD *)&self->_positionOffset[5] = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C8518;
  v9[3] = &unk_1E63D5468;
  v11 = self;
  v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("positionOffset"), v9);
}

- (__n128)positionOffset
{
  return a1[5];
}

- (void)setScaleOffset:(VFXReplicatorConstraint *)self
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  const char *v7;
  __int128 v8;
  _QWORD v9[4];
  __int128 v10;
  VFXReplicatorConstraint *v11;

  v8 = v4;
  *(_OWORD *)&self->_scaleOffset[5] = v4;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B19C85D0;
  v9[3] = &unk_1E63D5468;
  v11 = self;
  v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("scaleOffset"), v9);
}

- (__n128)scaleOffset
{
  return a1[6];
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("positionOffset"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_positionOffset(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("orientationOffset"), v8))
  {
    v16 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_orientationOffset(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat4_(v16, v17, v18, v19);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("scaleOffset"), v15))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_scaleOffset(self, v21, v22, v23);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v24.receiver = self;
  v24.super_class = (Class)VFXReplicatorConstraint;
  return -[VFXReplicatorConstraint valueForKey:](&v24, sel_valueForKey_, a3);
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("positionOffset"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setPositionOffset_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("orientationOffset"), v9))
  {
    objc_msgSend_VFXFloat4Value(a3, v13, v14, v15);
    objc_msgSend_setOrientationOffset_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("scaleOffset"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setScaleOffset_(self, v22, v23, v24);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VFXReplicatorConstraint;
    -[VFXReplicatorConstraint setValue:forKey:](&v25, sel_setValue_forKey_, a3, a4);
  }
}

- (void)_customEncodingOfVFXReplicatorConstraint:(id)a3
{
  VFXNode *target;

  target = self->_target;
  if (target)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, (uint64_t)CFSTR("target"));
}

- (void)_customDecodingOfVFXReplicatorConstraint:(id)a3
{
  __CFXConstraint *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  sub_1B19C0114();
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
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXReplicatorConstraint;
  -[VFXConstraint encodeWithCoder:](&v10, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXReplicatorConstraint_(self, v5, (uint64_t)a3, v6);
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_replicateOrientation, (uint64_t)CFSTR("replicatesOrientation"));
  objc_msgSend_encodeBool_forKey_(a3, v8, self->_replicateScale, (uint64_t)CFSTR("replicatesScale"));
  objc_msgSend_encodeBool_forKey_(a3, v9, self->_replicatePosition, (uint64_t)CFSTR("replicatesPosition"));
  sub_1B18BD23C(a3, CFSTR("orientationOffset"), *(__n128 *)&self->_anon_40[5]);
  sub_1B18BD1D8(a3, CFSTR("positionOffset"), *(__n128 *)&self->_positionOffset[5]);
  sub_1B18BD1D8(a3, CFSTR("scaleOffset"), *(__n128 *)&self->_scaleOffset[5]);
}

- (VFXReplicatorConstraint)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXReplicatorConstraint *v7;
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
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)VFXReplicatorConstraint;
  v7 = -[VFXConstraint initWithCoder:](&v43, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXReplicatorConstraint_(v7, v11, (uint64_t)a3, v12);
    v15 = objc_msgSend_decodeBoolForKey_(a3, v13, (uint64_t)CFSTR("replicatesOrientation"), v14);
    objc_msgSend_setReplicatesOrientation_(v7, v16, v15, v17);
    v20 = objc_msgSend_decodeBoolForKey_(a3, v18, (uint64_t)CFSTR("replicatesScale"), v19);
    objc_msgSend_setReplicatesScale_(v7, v21, v20, v22);
    v25 = objc_msgSend_decodeBoolForKey_(a3, v23, (uint64_t)CFSTR("replicatesPosition"), v24);
    objc_msgSend_setReplicatesPosition_(v7, v26, v25, v27);
    *(_QWORD *)&v28 = sub_1B18BD344(a3, CFSTR("orientationOffset")).n128_u64[0];
    objc_msgSend_setOrientationOffset_(v7, v29, v30, v31, v28);
    v32 = sub_1B18BD300(a3, CFSTR("positionOffset"));
    objc_msgSend_setPositionOffset_(v7, v33, v34, v35, v32);
    v36 = sub_1B18BD300(a3, CFSTR("scaleOffset"));
    objc_msgSend_setScaleOffset_(v7, v37, v38, v39, v36);
    objc_msgSend_setImmediateMode_(VFXTransaction, v40, v8, v41);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
