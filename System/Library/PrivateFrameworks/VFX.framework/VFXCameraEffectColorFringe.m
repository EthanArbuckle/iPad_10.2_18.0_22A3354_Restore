@implementation VFXCameraEffectColorFringe

- (__CFXCameraEffectColorFringe)cfxObject
{
  return (__CFXCameraEffectColorFringe *)self->super._cameraEffect;
}

- (float)strength
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
  v29 = sub_1B18E91D8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setStrength:(float)a3
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
    v9[2] = sub_1B17BB1FC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("strength"), v9);
  }
}

- (float)intensity
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
    return self->_strength;
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

- (void)setIntensity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_strength != a3)
  {
    self->_strength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BB348;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("intensity"), v9);
  }
}

+ (id)colorFringe
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VFXCameraEffectColorFringe;
  v4 = -[VFXCameraEffect copyWithZone:](&v14, sel_copyWithZone_, a3);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setStrength_(v4, v6, v7, v8, v5);
  *(float *)&v9 = self->_strength;
  objc_msgSend_setIntensity_(v4, v10, v11, v12, v9);
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VFXCameraEffectColorFringe;
  -[VFXCameraEffect _syncObjCModel](&v17, sel__syncObjCModel);
  *((float *)&self->super._enabled + 1) = sub_1B18E91D8((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_strength = sub_1B18E8CD4((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VFXCameraEffectColorFringe;
  -[VFXCameraEffect encodeWithCoder:](&v11, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("strength"), v7, v5);
  *(float *)&v8 = self->_strength;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("intensity"), v10, v8);
}

- (VFXCameraEffectColorFringe)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectColorFringe *v7;
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
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectColorFringe;
  v7 = -[VFXCameraEffect initWithCoder:](&v24, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("strength"), v12);
    objc_msgSend_setStrength_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("intensity"), v17);
    objc_msgSend_setIntensity_(v7, v18, v19, v20);
    objc_msgSend_setImmediateMode_(VFXTransaction, v21, v8, v22);
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

  if (qword_1ED4CEAF0 != -1)
    dispatch_once(&qword_1ED4CEAF0, &unk_1E63D16D0);
  v0 = sub_1B179CB90(qword_1ED4CEAF8, 0x40uLL);
  *(_BYTE *)(v0 + 64) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v0 + 72) = result;
  return result;
}

@end
