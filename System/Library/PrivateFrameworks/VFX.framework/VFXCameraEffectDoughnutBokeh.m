@implementation VFXCameraEffectDoughnutBokeh

- (__CFXCameraEffectDoughnutBokeh)cfxObject
{
  return (__CFXCameraEffectDoughnutBokeh *)self->super._cameraEffect;
}

- (float)radius
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
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
  uint64_t v27;
  uint64_t v28;
  float v29;

  if (!self->super._isPresentationObject)
    return *((float *)&self->super._enabled + 1);
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E8CD4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || *((float *)&self->super._enabled + 1) != a3)
  {
    *((float *)&self->super._enabled + 1) = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BF2CC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("radius"), v9);
  }
}

- (double)maskCenter
{
  uint64_t v5;
  const char *v6;
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
  uint64_t v27;
  uint64_t v28;
  double v29;

  if (!*(_BYTE *)(a1 + 16))
    return *(double *)(a1 + 48);
  v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  v29 = sub_1B18EBEA4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setMaskCenter:(VFXCameraEffectDoughnutBokeh *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x2_t v4;
  float32x2_t v5;
  uint32x2_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[6];

  v5 = v4;
  if (self->super._isPresentationObject
    || (v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_radius, v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_radius = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BF420;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("maskCenter"), v10);
  }
}

- (float)maskRadius
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
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
  uint64_t v27;
  uint64_t v28;
  float v29;

  if (!self->super._isPresentationObject)
    return *(float *)&self->_maskCenter[4];
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9680(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setMaskRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || *(float *)&self->_maskCenter[4] != a3)
  {
    *(float *)&self->_maskCenter[4] = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BF56C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("maskRadius"), v9);
  }
}

- (BOOL)maskEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
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
  uint64_t v27;
  uint64_t v28;
  char v29;

  if (!self->super._isPresentationObject)
    return LOBYTE(self->_maskRadius) != 0;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EBF40(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setMaskEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->super._isPresentationObject || LOBYTE(self->_maskRadius) != a3)
  {
    LOBYTE(self->_maskRadius) = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17BF6B8;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("maskEnabled"), v8);
  }
}

+ (id)doughnutBokeh
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  uint64_t v3;
  _QWORD *v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isEqualToString;
  uint64_t v10;

  v4 = (_QWORD *)v3;
  isEqualToString = objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("maskCenter"), v3);
  if (isEqualToString)
  {
    objc_msgSend_maskCenter(self, v6, v7, v8);
    *v4 = v10;
  }
  return isEqualToString;
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("maskCenter"), v3))
  {
    v9 = MEMORY[0x1E0CB3B18];
    objc_msgSend_maskCenter(self, v6, v7, v8);
    return (id)MEMORY[0x1E0DE7D20](v9, sel_valueWithVFXFloat2_, v10, v11);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCameraEffectDoughnutBokeh;
    return -[VFXCameraEffectDoughnutBokeh valueForKey:](&v13, sel_valueForKey_, a3);
  }
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("maskCenter"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat2Value(a3, v7, v8, v9);
    objc_msgSend_setMaskCenter_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCameraEffectDoughnutBokeh;
    -[VFXCameraEffectDoughnutBokeh setValue:forKey:](&v13, sel_setValue_forKey_, a3, a4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  v4 = -[VFXCameraEffect copyWithZone:](&v19, sel_copyWithZone_, a3);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setRadius_(v4, v6, v7, v8, v5);
  objc_msgSend_setMaskCenter_(v4, v9, v10, v11, *(double *)&self->_radius);
  LODWORD(v12) = *(_DWORD *)&self->_maskCenter[4];
  objc_msgSend_setMaskRadius_(v4, v13, v14, v15, v12);
  objc_msgSend_setMaskEnabled_(v4, v16, LOBYTE(self->_maskRadius), v17);
  return v4;
}

- (void)_syncObjCModel
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  -[VFXCameraEffect _syncObjCModel](&v31, sel__syncObjCModel);
  *((float *)&self->super._enabled + 1) = sub_1B18E8CD4((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  *(double *)&self->_radius = sub_1B18EBEA4((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  *(float *)&self->_maskCenter[4] = sub_1B18E9680((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  LOBYTE(self->_maskRadius) = sub_1B18EBF40((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  -[VFXCameraEffect encodeWithCoder:](&v12, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("radius"), v7, v5);
  sub_1B18BD180(a3, CFSTR("maskCenter"), *(double *)&self->_radius);
  LODWORD(v8) = *(_DWORD *)&self->_maskCenter[4];
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("maskRadius"), v10, v8);
  objc_msgSend_encodeBool_forKey_(a3, v11, LOBYTE(self->_maskRadius), (uint64_t)CFSTR("maskEnabled"));
}

- (VFXCameraEffectDoughnutBokeh)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectDoughnutBokeh *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
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
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)VFXCameraEffectDoughnutBokeh;
  v7 = -[VFXCameraEffect initWithCoder:](&v33, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("radius"), v12);
    objc_msgSend_setRadius_(v7, v13, v14, v15);
    v16 = sub_1B18BD2C4(a3, CFSTR("maskCenter"));
    objc_msgSend_setMaskCenter_(v7, v17, v18, v19, v16);
    objc_msgSend_decodeFloatForKey_(a3, v20, (uint64_t)CFSTR("maskRadius"), v21);
    objc_msgSend_setMaskRadius_(v7, v22, v23, v24);
    v27 = objc_msgSend_decodeBoolForKey_(a3, v25, (uint64_t)CFSTR("maskEnabled"), v26);
    objc_msgSend_setMaskEnabled_(v7, v28, v27, v29);
    objc_msgSend_setImmediateMode_(VFXTransaction, v30, v8, v31);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)createCFXObject
{
  uint64_t result;

  if (qword_1ED4CEB20 != -1)
    dispatch_once(&qword_1ED4CEB20, &unk_1E63D1830);
  result = sub_1B179CB90(qword_1ED4CEB28, 0x50uLL);
  *(_BYTE *)(result + 64) = 1;
  *(_DWORD *)(result + 72) = 1065353216;
  *(_QWORD *)(result + 80) = 0;
  *(_DWORD *)(result + 88) = 1065353216;
  *(_BYTE *)(result + 92) = 0;
  return result;
}

@end
