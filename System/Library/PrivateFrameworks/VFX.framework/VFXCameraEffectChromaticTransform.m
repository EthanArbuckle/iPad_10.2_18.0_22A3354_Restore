@implementation VFXCameraEffectChromaticTransform

- (__CFXCameraEffectChromaticTransform)cfxObject
{
  return (__CFXCameraEffectChromaticTransform *)self->super._cameraEffect;
}

- (int64_t)sampleCount
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
    return self->_sampleCount;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EB7AC(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setSampleCount:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->super._isPresentationObject || self->_sampleCount != a3)
  {
    self->_sampleCount = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17BD214;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("sampleCount"), v8);
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
    return self->_intensity;
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

- (void)setIntensity:(float)a3
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
    v9[2] = sub_1B17BD360;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("intensity"), v9);
  }
}

- (double)center
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
    return *(double *)(a1 + 64);
  v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  v29 = sub_1B18EB8C8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setCenter:(VFXCameraEffectChromaticTransform *)self
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
    || (v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_center[4], v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_center[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BD4B4;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("center"), v10);
  }
}

- (float)fromZ
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
    return self->_fromAngle;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E97B8(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setFromZ:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_fromAngle != a3)
  {
    self->_fromAngle = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BD600;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fromZ"), v9);
  }
}

- (float)fromAngle
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
    return *(float *)self->_fromShift;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E9854(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setFromAngle:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || *(float *)self->_fromShift != a3)
  {
    *(float *)self->_fromShift = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BD74C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("fromAngle"), v9);
  }
}

- (double)fromShift
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
    return *(double *)(a1 + 80);
  v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  v29 = sub_1B18EB964(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setFromShift:(VFXCameraEffectChromaticTransform *)self
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
    || (v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_fromShift[4], v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_fromShift[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BD8A0;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("fromShift"), v10);
  }
}

- (float)toZ
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
    return self->_toAngle;
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

- (void)setToZ:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_toAngle != a3)
  {
    self->_toAngle = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BD9EC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("toZ"), v9);
  }
}

- (float)toAngle
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
    return *(float *)self->_toShift;
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

- (void)setToAngle:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || *(float *)self->_toShift != a3)
  {
    *(float *)self->_toShift = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BDB38;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("toAngle"), v9);
  }
}

- (double)toShift
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
    return *(double *)(a1 + 96);
  v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  v29 = sub_1B18EBA00(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setToShift:(VFXCameraEffectChromaticTransform *)self
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
    || (v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_toShift[4], v4), (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_toShift[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BDC8C;
    v10[3] = &unk_1E63D5440;
    v10[4] = self;
    v10[5] = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("toShift"), v10);
  }
}

- (__n128)color1
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
    result = sub_1B18EAB6C(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      v30 = result;
      sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[7];
  }
  return result;
}

- (void)setColor1:(VFXCameraEffectChromaticTransform *)self
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
  VFXCameraEffectChromaticTransform *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_color1[4], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_color1[4] = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BDDE0;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("color1"), v10);
  }
}

- (__n128)color2
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
    result = sub_1B18EBA9C(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      v30 = result;
      sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[8];
  }
  return result;
}

- (void)setColor2:(VFXCameraEffectChromaticTransform *)self
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
  VFXCameraEffectChromaticTransform *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_color2[4], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_color2[4] = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BDF34;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("color2"), v10);
  }
}

- (__n128)color3
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
    result = sub_1B18EACA0(v14, v15, v16, v17, v18, v19, v20, v21);
    if (v13)
    {
      v30 = result;
      sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
      return v30;
    }
  }
  else
  {
    return a1[9];
  }
  return result;
}

- (void)setColor3:(VFXCameraEffectChromaticTransform *)self
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
  VFXCameraEffectChromaticTransform *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_color3[4], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_color3[4] = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BE088;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("color3"), v10);
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
    return *(double *)(a1 + 160);
  v5 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject((void *)a1, v6, v7, v8);
  v29 = sub_1B18EBB34(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setMaskCenter:(VFXCameraEffectChromaticTransform *)self
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
    || (v7 = (uint32x2_t)vceq_f32(*(float32x2_t *)&self->_maskCenter[4], v4),
        (vpmin_u32(v7, v7).u32[0] & 0x80000000) == 0))
  {
    *(float32x2_t *)&self->_maskCenter[4] = v5;
    v8 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BE1DC;
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
    return *(float *)&self->_maskEnabled;
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

- (void)setMaskRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || *(float *)&self->_maskEnabled != a3)
  {
    *(float *)&self->_maskEnabled = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BE328;
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
    return LOBYTE(self->_unMultBlending) != 0;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EBC24(v14, v15, v16, v17, v18, v19, v20, v21);
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

  if (self->super._isPresentationObject || LOBYTE(self->_unMultBlending) != a3)
  {
    LOBYTE(self->_unMultBlending) = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B17BE474;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, CFSTR("maskEnabled"), v8);
  }
}

- (float)unMultBlending
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
    return *(float *)&self[1].super.super.isa;
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

- (void)setUnMultBlending:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || *(float *)&self[1].super.super.isa != a3)
  {
    *(float *)&self[1].super.super.isa = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BE5C0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("unMultBlending"), v9);
  }
}

+ (id)chromaticTransform
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  uint64_t v3;
  _QWORD *v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int isEqualToString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (_QWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("center"), v3))
  {
    objc_msgSend_center(self, v7, v8, v9);
LABEL_9:
    *v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("fromShift"), v9))
  {
    objc_msgSend_fromShift(self, v11, v12, v13);
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("toShift"), v13))
  {
    objc_msgSend_toShift(self, v14, v15, v16);
    goto LABEL_9;
  }
  isEqualToString = objc_msgSend_isEqualToString_(a3, v14, (uint64_t)CFSTR("maskCenter"), v16);
  if (isEqualToString)
  {
    objc_msgSend_maskCenter(self, v18, v19, v20);
    goto LABEL_9;
  }
  return isEqualToString;
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v3;
  _OWORD *v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isEqualToString;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("color1"), v3))
  {
    objc_msgSend_color1(self, v7, v8, v9);
LABEL_7:
    *v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("color2"), v9))
  {
    objc_msgSend_color2(self, v11, v12, v13);
    goto LABEL_7;
  }
  isEqualToString = objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("color3"), v13);
  if (isEqualToString)
  {
    objc_msgSend_color3(self, v15, v16, v17);
    goto LABEL_7;
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
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  uint64_t v34;
  objc_super v35;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("color1"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_color1(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("color2"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_color2(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("color3"), v15))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_color3(self, v16, v17, v18);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v16, (uint64_t)CFSTR("center"), v18))
  {
    v23 = MEMORY[0x1E0CB3B18];
    objc_msgSend_center(self, v20, v21, v22);
    return (id)MEMORY[0x1E0DE7D20](v23, sel_valueWithVFXFloat2_, v24, v25);
  }
  if (objc_msgSend_isEqualToString_(a3, v20, (uint64_t)CFSTR("fromShift"), v22))
  {
    v23 = MEMORY[0x1E0CB3B18];
    objc_msgSend_fromShift(self, v26, v27, v28);
    return (id)MEMORY[0x1E0DE7D20](v23, sel_valueWithVFXFloat2_, v24, v25);
  }
  if (objc_msgSend_isEqualToString_(a3, v26, (uint64_t)CFSTR("toShift"), v28))
  {
    v23 = MEMORY[0x1E0CB3B18];
    objc_msgSend_toShift(self, v29, v30, v31);
    return (id)MEMORY[0x1E0DE7D20](v23, sel_valueWithVFXFloat2_, v24, v25);
  }
  if (objc_msgSend_isEqualToString_(a3, v29, (uint64_t)CFSTR("maskCenter"), v31))
  {
    v23 = MEMORY[0x1E0CB3B18];
    objc_msgSend_maskCenter(self, v32, v33, v34);
    return (id)MEMORY[0x1E0DE7D20](v23, sel_valueWithVFXFloat2_, v24, v25);
  }
  v35.receiver = self;
  v35.super_class = (Class)VFXCameraEffectChromaticTransform;
  return -[VFXCameraEffectChromaticTransform valueForKey:](&v35, sel_valueForKey_, a3);
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("color1"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setColor1_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("color2"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setColor2_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("color3"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setColor3_(self, v22, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v19, (uint64_t)CFSTR("center"), v21))
  {
    objc_msgSend_VFXFloat2Value(a3, v25, v26, v27);
    objc_msgSend_setCenter_(self, v28, v29, v30);
  }
  else if (objc_msgSend_isEqualToString_(a4, v25, (uint64_t)CFSTR("fromShift"), v27))
  {
    objc_msgSend_VFXFloat2Value(a3, v31, v32, v33);
    objc_msgSend_setFromShift_(self, v34, v35, v36);
  }
  else if (objc_msgSend_isEqualToString_(a4, v31, (uint64_t)CFSTR("toShift"), v33))
  {
    objc_msgSend_VFXFloat2Value(a3, v37, v38, v39);
    objc_msgSend_setToShift_(self, v40, v41, v42);
  }
  else if (objc_msgSend_isEqualToString_(a4, v37, (uint64_t)CFSTR("maskCenter"), v39))
  {
    objc_msgSend_VFXFloat2Value(a3, v43, v44, v45);
    objc_msgSend_setMaskCenter_(self, v46, v47, v48);
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)VFXCameraEffectChromaticTransform;
    -[VFXCameraEffectChromaticTransform setValue:forKey:](&v49, sel_setValue_forKey_, a3, a4);
  }
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
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v59;

  v59.receiver = self;
  v59.super_class = (Class)VFXCameraEffectChromaticTransform;
  v4 = -[VFXCameraEffect copyWithZone:](&v59, sel_copyWithZone_, a3);
  objc_msgSend_setSampleCount_(v4, v5, self->_sampleCount, v6);
  *(float *)&v7 = self->_intensity;
  objc_msgSend_setIntensity_(v4, v8, v9, v10, v7);
  objc_msgSend_setCenter_(v4, v11, v12, v13, *(double *)&self->_center[4]);
  *(float *)&v14 = self->_fromAngle;
  objc_msgSend_setFromZ_(v4, v15, v16, v17, v14);
  LODWORD(v18) = *(_DWORD *)self->_fromShift;
  objc_msgSend_setFromAngle_(v4, v19, v20, v21, v18);
  objc_msgSend_setFromShift_(v4, v22, v23, v24, *(double *)&self->_fromShift[4]);
  *(float *)&v25 = self->_toAngle;
  objc_msgSend_setToZ_(v4, v26, v27, v28, v25);
  LODWORD(v29) = *(_DWORD *)self->_toShift;
  objc_msgSend_setToAngle_(v4, v30, v31, v32, v29);
  objc_msgSend_setToShift_(v4, v33, v34, v35, *(double *)&self->_toShift[4]);
  objc_msgSend_setColor1_(v4, v36, v37, v38, *(double *)&self->_color1[4]);
  objc_msgSend_setColor2_(v4, v39, v40, v41, *(double *)&self->_color2[4]);
  objc_msgSend_setColor3_(v4, v42, v43, v44, *(double *)&self->_color3[4]);
  objc_msgSend_setMaskCenter_(v4, v45, v46, v47, *(double *)&self->_maskCenter[4]);
  LODWORD(v48) = *(_DWORD *)&self->_maskEnabled;
  objc_msgSend_setMaskRadius_(v4, v49, v50, v51, v48);
  objc_msgSend_setMaskEnabled_(v4, v52, LOBYTE(self->_unMultBlending), v53);
  LODWORD(v54) = self[1].super.super.isa;
  objc_msgSend_setUnMultBlending_(v4, v55, v56, v57, v54);
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
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  objc_super v115;

  v115.receiver = self;
  v115.super_class = (Class)VFXCameraEffectChromaticTransform;
  -[VFXCameraEffect _syncObjCModel](&v115, sel__syncObjCModel);
  self->_sampleCount = sub_1B18EB7AC((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_intensity = sub_1B18E9308((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  *(double *)&self->_center[4] = sub_1B18EB8C8((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_fromAngle = sub_1B18E97B8((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  *(float *)self->_fromShift = sub_1B18E9854((uint64_t)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  *(double *)&self->_fromShift[4] = sub_1B18EB964((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  self->_toAngle = sub_1B18EA708((uint64_t)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  *(float *)self->_toShift = sub_1B18EA7A4((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
  *(double *)&self->_toShift[4] = sub_1B18EBA00((uint64_t)self->super._cameraEffect, v59, v60, v61, v62, v63, v64, v65);
  *(__n128 *)&self->_color1[4] = sub_1B18EAB6C((__n128 *)self->super._cameraEffect, v66, v67, v68, v69, v70, v71, v72);
  *(__n128 *)&self->_color2[4] = sub_1B18EBA9C((__n128 *)self->super._cameraEffect, v73, v74, v75, v76, v77, v78, v79);
  *(__n128 *)&self->_color3[4] = sub_1B18EACA0((__n128 *)self->super._cameraEffect, v80, v81, v82, v83, v84, v85, v86);
  *(double *)&self->_maskCenter[4] = sub_1B18EBB34((uint64_t)self->super._cameraEffect, v87, v88, v89, v90, v91, v92, v93);
  *(float *)&self->_maskEnabled = sub_1B18E9CA0((uint64_t)self->super._cameraEffect, v94, v95, v96, v97, v98, v99, v100);
  LOBYTE(self->_unMultBlending) = sub_1B18EBC24((uint64_t)self->super._cameraEffect, v101, v102, v103, v104, v105, v106, v107);
  *(float *)&self[1].super.super.isa = sub_1B18E9DE0((uint64_t)self->super._cameraEffect, v108, v109, v110, v111, v112, v113, v114);
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
  double v14;
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
  const char *v26;
  double v27;
  const char *v28;
  uint64_t v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)VFXCameraEffectChromaticTransform;
  -[VFXCameraEffect encodeWithCoder:](&v30, sel_encodeWithCoder_);
  *(float *)&v5 = (float)self->_sampleCount;
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("sampleCount"), v7, v5);
  *(float *)&v8 = self->_intensity;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("intensity"), v10, v8);
  sub_1B18BD180(a3, CFSTR("center"), *(double *)&self->_center[4]);
  *(float *)&v11 = self->_fromAngle;
  objc_msgSend_encodeFloat_forKey_(a3, v12, (uint64_t)CFSTR("fromZ"), v13, v11);
  LODWORD(v14) = *(_DWORD *)self->_fromShift;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("fromAngle"), v16, v14);
  sub_1B18BD180(a3, CFSTR("fromShift"), *(double *)&self->_fromShift[4]);
  *(float *)&v17 = self->_toAngle;
  objc_msgSend_encodeFloat_forKey_(a3, v18, (uint64_t)CFSTR("toZ"), v19, v17);
  LODWORD(v20) = *(_DWORD *)self->_toShift;
  objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("toAngle"), v22, v20);
  sub_1B18BD180(a3, CFSTR("toShift"), *(double *)&self->_toShift[4]);
  sub_1B18BD1D8(a3, CFSTR("color1"), *(__n128 *)&self->_color1[4]);
  sub_1B18BD1D8(a3, CFSTR("color2"), *(__n128 *)&self->_color2[4]);
  sub_1B18BD1D8(a3, CFSTR("color3"), *(__n128 *)&self->_color3[4]);
  sub_1B18BD180(a3, CFSTR("maskCenter"), *(double *)&self->_maskCenter[4]);
  LODWORD(v23) = *(_DWORD *)&self->_maskEnabled;
  objc_msgSend_encodeFloat_forKey_(a3, v24, (uint64_t)CFSTR("maskRadius"), v25, v23);
  objc_msgSend_encodeBool_forKey_(a3, v26, LOBYTE(self->_unMultBlending), (uint64_t)CFSTR("maskEnabled"));
  LODWORD(v27) = self[1].super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v28, (uint64_t)CFSTR("unMultBlending"), v29, v27);
}

- (VFXCameraEffectChromaticTransform)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectChromaticTransform *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  float v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
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
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  objc_super v87;

  v87.receiver = self;
  v87.super_class = (Class)VFXCameraEffectChromaticTransform;
  v7 = -[VFXCameraEffect initWithCoder:](&v87, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("sampleCount"), v12);
    objc_msgSend_setSampleCount_(v7, v14, (uint64_t)v13, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("intensity"), v17);
    objc_msgSend_setIntensity_(v7, v18, v19, v20);
    v21 = sub_1B18BD2C4(a3, CFSTR("center"));
    objc_msgSend_setCenter_(v7, v22, v23, v24, v21);
    objc_msgSend_decodeFloatForKey_(a3, v25, (uint64_t)CFSTR("fromZ"), v26);
    objc_msgSend_setFromZ_(v7, v27, v28, v29);
    objc_msgSend_decodeFloatForKey_(a3, v30, (uint64_t)CFSTR("fromAngle"), v31);
    objc_msgSend_setFromAngle_(v7, v32, v33, v34);
    v35 = sub_1B18BD2C4(a3, CFSTR("fromShift"));
    objc_msgSend_setFromShift_(v7, v36, v37, v38, v35);
    objc_msgSend_decodeFloatForKey_(a3, v39, (uint64_t)CFSTR("toZ"), v40);
    objc_msgSend_setToZ_(v7, v41, v42, v43);
    objc_msgSend_decodeFloatForKey_(a3, v44, (uint64_t)CFSTR("toAngle"), v45);
    objc_msgSend_setToAngle_(v7, v46, v47, v48);
    v49 = sub_1B18BD2C4(a3, CFSTR("toShift"));
    objc_msgSend_setToShift_(v7, v50, v51, v52, v49);
    v53 = sub_1B18BD300(a3, CFSTR("color1"));
    objc_msgSend_setColor1_(v7, v54, v55, v56, v53);
    v57 = sub_1B18BD300(a3, CFSTR("color2"));
    objc_msgSend_setColor2_(v7, v58, v59, v60, v57);
    v61 = sub_1B18BD300(a3, CFSTR("color3"));
    objc_msgSend_setColor3_(v7, v62, v63, v64, v61);
    v65 = sub_1B18BD2C4(a3, CFSTR("maskCenter"));
    objc_msgSend_setMaskCenter_(v7, v66, v67, v68, v65);
    objc_msgSend_decodeFloatForKey_(a3, v69, (uint64_t)CFSTR("maskRadius"), v70);
    objc_msgSend_setMaskRadius_(v7, v71, v72, v73);
    v76 = objc_msgSend_decodeBoolForKey_(a3, v74, (uint64_t)CFSTR("maskEnabled"), v75);
    objc_msgSend_setMaskEnabled_(v7, v77, v76, v78);
    objc_msgSend_decodeFloatForKey_(a3, v79, (uint64_t)CFSTR("unMultBlending"), v80);
    objc_msgSend_setUnMultBlending_(v7, v81, v82, v83);
    objc_msgSend_setImmediateMode_(VFXTransaction, v84, v8, v85);
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

  if (qword_1ED4CEAE0 != -1)
    dispatch_once(&qword_1ED4CEAE0, &unk_1E63D17B0);
  v0 = sub_1B179CB90(qword_1ED4CEAE8, 0xC0uLL);
  *(_BYTE *)(v0 + 64) = 1;
  *(_QWORD *)(v0 + 72) = 32;
  *(_DWORD *)(v0 + 80) = 1065353216;
  result = 0.0;
  *(_QWORD *)(v0 + 88) = 0;
  *(_QWORD *)(v0 + 96) = 1065353216;
  *(_QWORD *)(v0 + 104) = 0;
  *(_QWORD *)(v0 + 112) = 1067030938;
  *(_QWORD *)(v0 + 120) = 0;
  *(_OWORD *)(v0 + 128) = xmmword_1B2244DB0;
  *(_OWORD *)(v0 + 144) = xmmword_1B2244DD0;
  *(_OWORD *)(v0 + 160) = xmmword_1B2244D90;
  *(_QWORD *)(v0 + 176) = 0;
  *(_DWORD *)(v0 + 184) = 1065353216;
  *(_BYTE *)(v0 + 188) = 0;
  *(_DWORD *)(v0 + 192) = 0;
  return result;
}

@end
