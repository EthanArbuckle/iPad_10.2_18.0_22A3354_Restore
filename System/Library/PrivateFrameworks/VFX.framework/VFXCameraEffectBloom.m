@implementation VFXCameraEffectBloom

- (__CFXCameraEffectBloom)cfxObject
{
  return (__CFXCameraEffectBloom *)self->super._cameraEffect;
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

- (void)setIntensity:(float)a3
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
    v9[2] = sub_1B17B99D8;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("intensity"), v9);
  }
}

- (float)threshold
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
    return self->_intensity;
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

- (void)setThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_intensity != a3)
  {
    self->_intensity = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B9B24;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("threshold"), v9);
  }
}

- (float)thresholdSmoothness
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
    return self->_threshold;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9308(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setThresholdSmoothness:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_threshold != a3)
  {
    self->_threshold = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17B9C70;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("thresholdSmoothness"), v9);
  }
}

- (BOOL)useHighQuality
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
    return LOBYTE(self->_thresholdSmoothness) != 0;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9274(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setUseHighQuality:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->super._isPresentationObject || LOBYTE(self->_thresholdSmoothness) != a3)
  {
    LOBYTE(self->_thresholdSmoothness) = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17B9DBC;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("useHighQuality"), v8);
  }
}

- (__n128)colorFilter
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
  __n128 *v14;
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
  __n128 result;
  __n128 v30;

  if (a1[1].n128_u8[0])
  {
    v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
    v13 = v5;
    if (v5)
      sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
    v14 = (__n128 *)objc_msgSend_cfxObject(a1, v6, v7, v8);
    result = sub_1B18EA670(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      v30 = result;
      sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[4];
  }
  return result;
}

- (void)setColorFilter:(VFXCameraEffectBloom *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  VFXCameraEffectBloom *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_colorFilter[3], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_colorFilter[3] = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17B9F10;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("colorFilter"), v10);
  }
}

- (float)contrast
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
    return self->_contrast;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EA708(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setContrast:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_contrast != a3)
  {
    self->_contrast = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BA05C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("contrast"), v9);
  }
}

- (float)saturation
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
    return self->_saturation;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EA7A4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setSaturation:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_saturation != a3)
  {
    self->_saturation = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BA1A8;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("saturation"), v9);
  }
}

- (int64_t)iterationCount
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
    return self->_iterationCount;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EA840(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setIterationCount:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->super._isPresentationObject || self->_iterationCount != a3)
  {
    self->_iterationCount = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17BA2E8;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("iterationCount"), v8);
  }
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v3;
  _OWORD *v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int isEqualToString;
  __int128 v10;

  v4 = (_OWORD *)v3;
  isEqualToString = objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("colorFilter"), v3);
  if (isEqualToString)
  {
    objc_msgSend_colorFilter(self, v6, v7, v8);
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
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("colorFilter"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_colorFilter(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)VFXCameraEffectBloom;
    return -[VFXCameraEffectBloom valueForKey:](&v14, sel_valueForKey_, a3);
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

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("colorFilter"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setColorFilter_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXCameraEffectBloom;
    -[VFXCameraEffectBloom setValue:forKey:](&v13, sel_setValue_forKey_, a3, a4);
  }
}

+ (id)bloom
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)VFXCameraEffectBloom;
  v4 = -[VFXCameraEffect copyWithZone:](&v33, sel_copyWithZone_, a3);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setIntensity_(v4, v6, v7, v8, v5);
  *(float *)&v9 = self->_intensity;
  objc_msgSend_setThreshold_(v4, v10, v11, v12, v9);
  *(float *)&v13 = self->_threshold;
  objc_msgSend_setThresholdSmoothness_(v4, v14, v15, v16, v13);
  objc_msgSend_setUseHighQuality_(v4, v17, LOBYTE(self->_thresholdSmoothness), v18);
  objc_msgSend_setColorFilter_(v4, v19, v20, v21, *(double *)&self->_colorFilter[3]);
  *(float *)&v22 = self->_contrast;
  objc_msgSend_setContrast_(v4, v23, v24, v25, v22);
  *(float *)&v26 = self->_saturation;
  objc_msgSend_setSaturation_(v4, v27, v28, v29, v26);
  objc_msgSend_setIterationCount_(v4, v30, self->_iterationCount, v31);
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)VFXCameraEffectBloom;
  -[VFXCameraEffect _syncObjCModel](&v59, sel__syncObjCModel);
  *((float *)&self->super._enabled + 1) = sub_1B18E8CD4((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B18E91D8((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_threshold = sub_1B18E9308((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  LOBYTE(self->_thresholdSmoothness) = sub_1B18E9274((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  *(__n128 *)&self->_colorFilter[3] = sub_1B18EA670((__n128 *)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_contrast = sub_1B18EA708((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_saturation = sub_1B18EA7A4((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  self->_iterationCount = sub_1B18EA840((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
}

- (void)encodeWithCoder:(id)a3
{
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)VFXCameraEffectBloom;
  -[VFXCameraEffect encodeWithCoder:](&v22, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("intensity"), v7, v5);
  *(float *)&v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("threshold"), v10, v8);
  *(float *)&v11 = self->_threshold;
  objc_msgSend_encodeFloat_forKey_(a3, v12, (uint64_t)CFSTR("thresholdSmoothness"), v13, v11);
  objc_msgSend_encodeBool_forKey_(a3, v14, LOBYTE(self->_thresholdSmoothness), (uint64_t)CFSTR("useHighQuality"));
  sub_1B18BD1D8(a3, CFSTR("colorFilter"), *(__n128 *)&self->_colorFilter[3]);
  *(float *)&v15 = self->_contrast;
  objc_msgSend_encodeFloat_forKey_(a3, v16, (uint64_t)CFSTR("contrast"), v17, v15);
  *(float *)&v18 = self->_saturation;
  objc_msgSend_encodeFloat_forKey_(a3, v19, (uint64_t)CFSTR("saturation"), v20, v18);
  objc_msgSend_encodeInteger_forKey_(a3, v21, self->_iterationCount, (uint64_t)CFSTR("iterationCount"));
}

- (VFXCameraEffectBloom)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectBloom *v7;
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
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)VFXCameraEffectBloom;
  v7 = -[VFXCameraEffect initWithCoder:](&v53, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("intensity"), v12);
    objc_msgSend_setIntensity_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("threshold"), v17);
    objc_msgSend_setThreshold_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, (uint64_t)CFSTR("thresholdSmoothness"), v22);
    objc_msgSend_setThresholdSmoothness_(v7, v23, v24, v25);
    v28 = objc_msgSend_decodeBoolForKey_(a3, v26, (uint64_t)CFSTR("useHighQuality"), v27);
    objc_msgSend_setUseHighQuality_(v7, v29, v28, v30);
    v31 = sub_1B18BD300(a3, CFSTR("colorFilter"));
    objc_msgSend_setColorFilter_(v7, v32, v33, v34, v31);
    objc_msgSend_decodeFloatForKey_(a3, v35, (uint64_t)CFSTR("contrast"), v36);
    objc_msgSend_setContrast_(v7, v37, v38, v39);
    objc_msgSend_decodeFloatForKey_(a3, v40, (uint64_t)CFSTR("saturation"), v41);
    objc_msgSend_setSaturation_(v7, v42, v43, v44);
    v47 = objc_msgSend_decodeIntegerForKey_(a3, v45, (uint64_t)CFSTR("iterationCount"), v46);
    objc_msgSend_setIterationCount_(v7, v48, v47, v49);
    objc_msgSend_setImmediateMode_(VFXTransaction, v50, v8, v51);
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

  if (qword_1ED4CEAD0 != -1)
    dispatch_once(&qword_1ED4CEAD0, &unk_1E63D8C70);
  v0 = sub_1B179CB90(qword_1ED4CEAD8, 0x70uLL);
  *(_BYTE *)(v0 + 64) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v0 + 72) = result;
  *(_DWORD *)(v0 + 80) = 1036831949;
  *(_BYTE *)(v0 + 84) = 1;
  __asm { FMOV            V1.4S, #1.0 }
  *(_OWORD *)(v0 + 96) = _Q1;
  *(double *)(v0 + 112) = result;
  *(_QWORD *)(v0 + 120) = 10;
  return result;
}

@end
