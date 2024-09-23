@implementation VFXCameraEffectLensBlur

- (__CFXCameraEffectLensBlur)cfxObject
{
  return (__CFXCameraEffectLensBlur *)self->super._cameraEffect;
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
    v9[2] = sub_1B17BCD60;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("radius"), v9);
  }
}

- (int64_t)filterQuality
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
    return *(_QWORD *)&self->_radius;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EB394(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setFilterQuality:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->super._isPresentationObject || *(_QWORD *)&self->_radius != a3)
  {
    *(_QWORD *)&self->_radius = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17BCEA0;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("filterQuality"), v8);
  }
}

+ (id)lensBlur
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
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXCameraEffectLensBlur;
  v4 = -[VFXCameraEffect copyWithZone:](&v12, sel_copyWithZone_, a3);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setRadius_(v4, v6, v7, v8, v5);
  objc_msgSend_setFilterQuality_(v4, v9, *(_QWORD *)&self->_radius, v10);
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
  v17.super_class = (Class)VFXCameraEffectLensBlur;
  -[VFXCameraEffect _syncObjCModel](&v17, sel__syncObjCModel);
  *((float *)&self->super._enabled + 1) = sub_1B18E8CD4((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)&self->_radius = sub_1B18EB394((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
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
  v11.super_class = (Class)VFXCameraEffectLensBlur;
  -[VFXCameraEffect encodeWithCoder:](&v11, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("radius"), v7, v5);
  *(float *)&v8 = (float)*(uint64_t *)&self->_radius;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("filterQuality"), v10, v8);
}

- (VFXCameraEffectLensBlur)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectLensBlur *v7;
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
  float v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXCameraEffectLensBlur;
  v7 = -[VFXCameraEffect initWithCoder:](&v24, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("radius"), v12);
    objc_msgSend_setRadius_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("filterQuality"), v17);
    objc_msgSend_setFilterQuality_(v7, v19, (uint64_t)v18, v20);
    objc_msgSend_setImmediateMode_(VFXTransaction, v21, v8, v22);
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

  if (qword_1ED4CEB50 != -1)
    dispatch_once(&qword_1ED4CEB50, &unk_1E63D1750);
  result = sub_1B179CB90(qword_1ED4CEB58, 0x40uLL);
  *(_BYTE *)(result + 64) = 1;
  *(_DWORD *)(result + 72) = 1065353216;
  *(_BYTE *)(result + 76) = 0;
  return result;
}

@end
