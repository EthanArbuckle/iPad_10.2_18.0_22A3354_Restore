@implementation VFXCameraEffectToneMapping

- (__CFXCameraEffectToneMapping)cfxObject
{
  return (__CFXCameraEffectToneMapping *)self->super._cameraEffect;
}

- (int64_t)mode
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
  int64_t v29;

  if (!self->super._isPresentationObject)
    return self->_mode;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9B68(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->super._isPresentationObject || self->_mode != a3)
  {
    self->_mode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17B8C68;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("mode"), v8);
  }
}

- (float)toeStrength
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
    return self->_toeStrength;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9C00(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setToeStrength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_toeStrength != a3)
  {
    self->_toeStrength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B8DB4;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("toeStrength"), v9);
  }
}

- (float)toeLength
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
    return self->_toeLength;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9CA0(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setToeLength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_toeLength != a3)
  {
    self->_toeLength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B8F00;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("toeLength"), v9);
  }
}

- (float)shoulderStrength
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
    return self->_shoulderStrength;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9D40(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setShoulderStrength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_shoulderStrength != a3)
  {
    self->_shoulderStrength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B904C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("shoulderStrength"), v9);
  }
}

- (float)shoulderLength
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
    return self->_shoulderLength;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9DE0(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setShoulderLength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_shoulderLength != a3)
  {
    self->_shoulderLength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B9198;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("shoulderLength"), v9);
  }
}

- (float)shoulderAngle
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
    return self->_shoulderAngle;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9E80(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setShoulderAngle:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_shoulderAngle != a3)
  {
    self->_shoulderAngle = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B92E4;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("shoulderAngle"), v9);
  }
}

- (float)gamma
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
    return self->_gamma;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9F20(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setGamma:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_gamma != a3)
  {
    self->_gamma = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B9430;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("gamma"), v9);
  }
}

+ (id)toneMapping
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (float)eval:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *cameraEffect;
  float v17;

  v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
  cameraEffect = self->super._cameraEffect;
  if (cameraEffect)
  {
    sub_1B18E9FC0((uint64_t)cameraEffect, a3);
    a3 = v17;
  }
  if (v15)
    sub_1B18797B4(v15, v8, v9, v10, v11, v12, v13, v14);
  return a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)VFXCameraEffectToneMapping;
  v4 = -[VFXCameraEffect copyWithZone:](&v32, sel_copyWithZone_, a3);
  objc_msgSend_setMode_(v4, v5, self->_mode, v6);
  *(float *)&v7 = self->_toeStrength;
  objc_msgSend_setToeStrength_(v4, v8, v9, v10, v7);
  *(float *)&v11 = self->_toeLength;
  objc_msgSend_setToeLength_(v4, v12, v13, v14, v11);
  *(float *)&v15 = self->_shoulderStrength;
  objc_msgSend_setShoulderStrength_(v4, v16, v17, v18, v15);
  *(float *)&v19 = self->_shoulderLength;
  objc_msgSend_setShoulderLength_(v4, v20, v21, v22, v19);
  *(float *)&v23 = self->_shoulderAngle;
  objc_msgSend_setShoulderAngle_(v4, v24, v25, v26, v23);
  *(float *)&v27 = self->_gamma;
  objc_msgSend_setGamma_(v4, v28, v29, v30, v27);
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)VFXCameraEffectToneMapping;
  -[VFXCameraEffect _syncObjCModel](&v52, sel__syncObjCModel);
  self->_mode = sub_1B18E9B68((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_toeStrength = sub_1B18E9C00((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_toeLength = sub_1B18E9CA0((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_shoulderStrength = sub_1B18E9D40((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  self->_shoulderLength = sub_1B18E9DE0((uint64_t)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_shoulderAngle = sub_1B18E9E80((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_gamma = sub_1B18E9F20((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectToneMapping;
  -[VFXCameraEffect encodeWithCoder:](&v24, sel_encodeWithCoder_);
  objc_msgSend_encodeInteger_forKey_(a3, v5, self->_mode, (uint64_t)CFSTR("mode"));
  *(float *)&v6 = self->_toeStrength;
  objc_msgSend_encodeFloat_forKey_(a3, v7, (uint64_t)CFSTR("toeStrength"), v8, v6);
  *(float *)&v9 = self->_toeLength;
  objc_msgSend_encodeFloat_forKey_(a3, v10, (uint64_t)CFSTR("toeLength"), v11, v9);
  *(float *)&v12 = self->_shoulderStrength;
  objc_msgSend_encodeFloat_forKey_(a3, v13, (uint64_t)CFSTR("shoulderStrength"), v14, v12);
  *(float *)&v15 = self->_shoulderLength;
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("shoulderLength"), v17, v15);
  *(float *)&v18 = self->_shoulderAngle;
  objc_msgSend_encodeFloat_forKey_(a3, v19, (uint64_t)CFSTR("shoulderAngle"), v20, v18);
  *(float *)&v21 = self->_gamma;
  objc_msgSend_encodeFloat_forKey_(a3, v22, (uint64_t)CFSTR("gamma"), v23, v21);
}

- (VFXCameraEffectToneMapping)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectToneMapping *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
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
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)VFXCameraEffectToneMapping;
  v7 = -[VFXCameraEffect initWithCoder:](&v49, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v13 = objc_msgSend_decodeIntegerForKey_(a3, v11, (uint64_t)CFSTR("mode"), v12);
    objc_msgSend_setMode_(v7, v14, v13, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("toeStrength"), v17);
    objc_msgSend_setToeStrength_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, (uint64_t)CFSTR("toeLength"), v22);
    objc_msgSend_setToeLength_(v7, v23, v24, v25);
    objc_msgSend_decodeFloatForKey_(a3, v26, (uint64_t)CFSTR("shoulderStrength"), v27);
    objc_msgSend_setShoulderStrength_(v7, v28, v29, v30);
    objc_msgSend_decodeFloatForKey_(a3, v31, (uint64_t)CFSTR("shoulderLength"), v32);
    objc_msgSend_setShoulderLength_(v7, v33, v34, v35);
    objc_msgSend_decodeFloatForKey_(a3, v36, (uint64_t)CFSTR("shoulderAngle"), v37);
    objc_msgSend_setShoulderAngle_(v7, v38, v39, v40);
    objc_msgSend_decodeFloatForKey_(a3, v41, (uint64_t)CFSTR("gamma"), v42);
    objc_msgSend_setGamma_(v7, v43, v44, v45);
    objc_msgSend_setImmediateMode_(VFXTransaction, v46, v8, v47);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)createCFXObject
{
  uint64_t v0;
  double result;

  if (qword_1ED4CEB70 != -1)
    dispatch_once(&qword_1ED4CEB70, &unk_1E63D1510);
  v0 = sub_1B179CB90(qword_1ED4CEB78, 0xC0uLL);
  *(_BYTE *)(v0 + 64) = 1;
  *(_OWORD *)(v0 + 180) = xmmword_1B2247EE0;
  *(_QWORD *)(v0 + 196) = 0x3F80000000000000;
  *(_OWORD *)(v0 + 76) = xmmword_1B2247EF0;
  *(_QWORD *)&result = 1065353216;
  *(_QWORD *)(v0 + 92) = 1065353216;
  *(_DWORD *)(v0 + 100) = 0;
  return result;
}

@end
