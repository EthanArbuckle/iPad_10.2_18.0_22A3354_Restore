@implementation VFXCameraEffectDepthOfField

- (__CFXCameraEffectDepthOfField)cfxObject
{
  return (__CFXCameraEffectDepthOfField *)self->super._cameraEffect;
}

- (int64_t)focalBlurSampleCount
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
    return *(_QWORD *)&self->_fStop;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E8D70(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setFocalBlurSampleCount:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->super._isPresentationObject || *(_QWORD *)&self->_fStop != a3)
  {
    *(_QWORD *)&self->_fStop = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17B69D4;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("focalBlurSampleCount"), v8);
  }
}

- (float)fStop
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

- (void)setFStop:(float)a3
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
    v9[2] = sub_1B17B6B20;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fStop"), v9);
  }
}

- (int64_t)apertureBladeCount
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
    return self->_focalBlurSampleCount;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E8E04(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setApertureBladeCount:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->super._isPresentationObject || self->_focalBlurSampleCount != a3)
  {
    self->_focalBlurSampleCount = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17B6C60;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("apertureBladeCount"), v8);
  }
}

+ (id)depthOfField
{
  return objc_alloc_init((Class)objc_opt_class());
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
  const char *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VFXCameraEffectDepthOfField;
  v4 = -[VFXCameraEffect copyWithZone:](&v14, sel_copyWithZone_, a3);
  objc_msgSend_setFocalBlurSampleCount_(v4, v5, *(_QWORD *)&self->_fStop, v6);
  LODWORD(v7) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setFStop_(v4, v8, v9, v10, v7);
  objc_msgSend_setApertureBladeCount_(v4, v11, self->_focalBlurSampleCount, v12);
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectDepthOfField;
  -[VFXCameraEffect _syncObjCModel](&v24, sel__syncObjCModel);
  *((float *)&self->super._enabled + 1) = sub_1B18E8CD4((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)&self->_fStop = sub_1B18E8D70((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_focalBlurSampleCount = sub_1B18E8E04((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXCameraEffectDepthOfField;
  -[VFXCameraEffect encodeWithCoder:](&v10, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("fStop"), v7, v5);
  objc_msgSend_encodeInteger_forKey_(a3, v8, *(_QWORD *)&self->_fStop, (uint64_t)CFSTR("focalBlurSampleCount"));
  objc_msgSend_encodeInteger_forKey_(a3, v9, self->_focalBlurSampleCount, (uint64_t)CFSTR("apertureBladeCount"));
}

- (VFXCameraEffectDepthOfField)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectDepthOfField *v7;
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
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)VFXCameraEffectDepthOfField;
  v7 = -[VFXCameraEffect initWithCoder:](&v29, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("fStop"), v12);
    objc_msgSend_setFStop_(v7, v13, v14, v15);
    v18 = objc_msgSend_decodeIntegerForKey_(a3, v16, (uint64_t)CFSTR("focalBlurSampleCount"), v17);
    objc_msgSend_setFocalBlurSampleCount_(v7, v19, v18, v20);
    v23 = objc_msgSend_decodeIntegerForKey_(a3, v21, (uint64_t)CFSTR("apertureBladeCount"), v22);
    objc_msgSend_setApertureBladeCount_(v7, v24, v23, v25);
    objc_msgSend_setImmediateMode_(VFXTransaction, v26, v8, v27);
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

  if (qword_1ED4CEB10 != -1)
    dispatch_once(&qword_1ED4CEB10, &unk_1E63D1050);
  v0 = sub_1B179CB90(qword_1ED4CEB18, 0x50uLL);
  *(_BYTE *)(v0 + 64) = 1;
  *(_DWORD *)(v0 + 72) = 1085485875;
  *(_QWORD *)&result = 25;
  *(_OWORD *)(v0 + 80) = xmmword_1B2247EB0;
  return result;
}

@end
