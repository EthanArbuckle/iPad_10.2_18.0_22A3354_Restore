@implementation VFXCameraEffectColorGrading

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_parentWillDie_(self->_lookupTable, a2, (uint64_t)self, v2);

  v4.receiver = self;
  v4.super_class = (Class)VFXCameraEffectColorGrading;
  -[VFXCameraEffect dealloc](&v4, sel_dealloc);
}

- (__CFXCameraEffectColorGrading)cfxObject
{
  return (__CFXCameraEffectColorGrading *)self->super._cameraEffect;
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

- (void)setSaturation:(float)a3
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
    v9[2] = sub_1B17BB718;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("saturation"), v9);
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
    return self->_saturation;
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

- (void)setContrast:(float)a3
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
    v9[2] = sub_1B17BB864;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("contrast"), v9);
  }
}

- (float)whiteBalanceTemperature
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
  v29 = sub_1B18E9308(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setWhiteBalanceTemperature:(float)a3
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
    v9[2] = sub_1B17BB9B0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("whiteBalanceTemperature"), v9);
  }
}

- (float)whiteBalanceTint
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
    return self->_whiteBalanceTemperature;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18E95E4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setWhiteBalanceTint:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_whiteBalanceTemperature != a3)
  {
    self->_whiteBalanceTemperature = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BBAFC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("whiteBalanceTint"), v9);
  }
}

- (__n128)liftColor
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

- (void)setLiftColor:(VFXCameraEffectColorGrading *)self
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
  VFXCameraEffectColorGrading *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_liftColor, v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)self->_liftColor = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BBC50;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("liftColor"), v10);
  }
}

- (float)liftOffset
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
    return self->_liftOffset;
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

- (void)setLiftOffset:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_liftOffset != a3)
  {
    self->_liftOffset = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BBD9C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("liftOffset"), v9);
  }
}

- (__n128)gammaColor
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
    return a1[6];
  }
  return result;
}

- (void)setGammaColor:(VFXCameraEffectColorGrading *)self
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
  VFXCameraEffectColorGrading *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_gammaColor, v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)self->_gammaColor = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BBEF0;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("gammaColor"), v10);
  }
}

- (float)gammaOffset
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
    return self->_gammaOffset;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EAC04(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setGammaOffset:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_gammaOffset != a3)
  {
    self->_gammaOffset = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BC03C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("gammaOffset"), v9);
  }
}

- (__n128)gainColor
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
    return a1[8];
  }
  return result;
}

- (void)setGainColor:(VFXCameraEffectColorGrading *)self
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
  VFXCameraEffectColorGrading *v12;

  if (self->super._isPresentationObject
    || (v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_gainColor, v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)self->_gainColor = v4;
    v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B17BC190;
    v10[3] = &unk_1E63D5468;
    v12 = self;
    v11 = v9;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("gainColor"), v10);
  }
}

- (float)gainOffset
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
    return self->_gainOffset;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v29 = sub_1B18EAD38(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v13)
    sub_1B18797B4(v13, v22, v23, v24, v25, v26, v27, v28);
  return v29;
}

- (void)setGainOffset:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->super._isPresentationObject || self->_gainOffset != a3)
  {
    self->_gainOffset = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B17BC2DC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("gainOffset"), v9);
  }
}

- (id)lookupTable
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
  id *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id *v30;

  if (!self->super._isPresentationObject)
    return self->_lookupTable;
  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_cfxObject(self, v6, v7, v8);
  v22 = (id *)sub_1B18EADD4(v14, v15, v16, v17, v18, v19, v20, v21);
  if (v22)
  {
    v30 = sub_1B193E758(v22);
    if (!v13)
      return v30;
    goto LABEL_9;
  }
  v30 = 0;
  if (v13)
LABEL_9:
    sub_1B18797B4(v13, v23, v24, v25, v26, v27, v28, v29);
  return v30;
}

- (void)setLookupTable:(id)a3
{
  VFXMaterialProperty *lookupTable;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  lookupTable = self->_lookupTable;
  if (lookupTable != a3 || self->super._isPresentationObject)
  {

    self->_lookupTable = (VFXMaterialProperty *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B17BC430;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
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
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("liftColor"), v3))
  {
    objc_msgSend_liftColor(self, v7, v8, v9);
LABEL_7:
    *v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("gammaColor"), v9))
  {
    objc_msgSend_gammaColor(self, v11, v12, v13);
    goto LABEL_7;
  }
  isEqualToString = objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("gainColor"), v13);
  if (isEqualToString)
  {
    objc_msgSend_gainColor(self, v15, v16, v17);
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
  objc_super v20;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("liftColor"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_liftColor(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("gammaColor"), v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_gammaColor(self, v13, v14, v15);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v13, (uint64_t)CFSTR("gainColor"), v15))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_gainColor(self, v16, v17, v18);
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  v20.receiver = self;
  v20.super_class = (Class)VFXCameraEffectColorGrading;
  return -[VFXCameraEffectColorGrading valueForKey:](&v20, sel_valueForKey_, a3);
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

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("liftColor"), (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setLiftColor_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("gammaColor"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setGammaColor_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("gainColor"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setGainColor_(self, v22, v23, v24);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VFXCameraEffectColorGrading;
    -[VFXCameraEffectColorGrading setValue:forKey:](&v25, sel_setValue_forKey_, a3, a4);
  }
}

+ (id)colorGrading
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
  double v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)VFXCameraEffectColorGrading;
  v4 = -[VFXCameraEffect copyWithZone:](&v45, sel_copyWithZone_, a3);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_setSaturation_(v4, v6, v7, v8, v5);
  *(float *)&v9 = self->_saturation;
  objc_msgSend_setContrast_(v4, v10, v11, v12, v9);
  *(float *)&v13 = self->_contrast;
  objc_msgSend_setWhiteBalanceTemperature_(v4, v14, v15, v16, v13);
  *(float *)&v17 = self->_whiteBalanceTemperature;
  objc_msgSend_setWhiteBalanceTint_(v4, v18, v19, v20, v17);
  objc_msgSend_setLiftColor_(v4, v21, v22, v23, *(double *)self->_liftColor);
  *(float *)&v24 = self->_liftOffset;
  objc_msgSend_setLiftOffset_(v4, v25, v26, v27, v24);
  objc_msgSend_setGammaColor_(v4, v28, v29, v30, *(double *)self->_gammaColor);
  *(float *)&v31 = self->_gammaOffset;
  objc_msgSend_setGammaOffset_(v4, v32, v33, v34, v31);
  objc_msgSend_setGainColor_(v4, v35, v36, v37, *(double *)self->_gainColor);
  *(float *)&v38 = self->_gainOffset;
  objc_msgSend_setGainOffset_(v4, v39, v40, v41, v38);
  objc_msgSend_setLookupTable_(v4, v42, (uint64_t)self->_lookupTable, v43);
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
  objc_super v73;

  v73.receiver = self;
  v73.super_class = (Class)VFXCameraEffectColorGrading;
  -[VFXCameraEffect _syncObjCModel](&v73, sel__syncObjCModel);
  *((float *)&self->super._enabled + 1) = sub_1B18E8CD4((uint64_t)self->super._cameraEffect, v3, v4, v5, v6, v7, v8, v9);
  self->_saturation = sub_1B18E91D8((uint64_t)self->super._cameraEffect, v10, v11, v12, v13, v14, v15, v16);
  self->_contrast = sub_1B18E9308((uint64_t)self->super._cameraEffect, v17, v18, v19, v20, v21, v22, v23);
  self->_whiteBalanceTemperature = sub_1B18E95E4((uint64_t)self->super._cameraEffect, v24, v25, v26, v27, v28, v29, v30);
  *(__n128 *)self->_liftColor = sub_1B18EA670((__n128 *)self->super._cameraEffect, v31, v32, v33, v34, v35, v36, v37);
  self->_liftOffset = sub_1B18EA708((uint64_t)self->super._cameraEffect, v38, v39, v40, v41, v42, v43, v44);
  *(__n128 *)self->_gammaColor = sub_1B18EAB6C((__n128 *)self->super._cameraEffect, v45, v46, v47, v48, v49, v50, v51);
  self->_gammaOffset = sub_1B18EAC04((uint64_t)self->super._cameraEffect, v52, v53, v54, v55, v56, v57, v58);
  *(__n128 *)self->_gainColor = sub_1B18EACA0((__n128 *)self->super._cameraEffect, v59, v60, v61, v62, v63, v64, v65);
  self->_gainOffset = sub_1B18EAD38((uint64_t)self->super._cameraEffect, v66, v67, v68, v69, v70, v71, v72);
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
  VFXMaterialProperty *lookupTable;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)VFXCameraEffectColorGrading;
  -[VFXCameraEffect encodeWithCoder:](&v28, sel_encodeWithCoder_);
  LODWORD(v5) = *((_DWORD *)&self->super._enabled + 1);
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("saturation"), v7, v5);
  *(float *)&v8 = self->_saturation;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("contrast"), v10, v8);
  *(float *)&v11 = self->_contrast;
  objc_msgSend_encodeFloat_forKey_(a3, v12, (uint64_t)CFSTR("whiteBalanceTemperature"), v13, v11);
  *(float *)&v14 = self->_whiteBalanceTemperature;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("whiteBalanceTint"), v16, v14);
  sub_1B18BD1D8(a3, CFSTR("liftColor"), *(__n128 *)self->_liftColor);
  *(float *)&v17 = self->_liftOffset;
  objc_msgSend_encodeFloat_forKey_(a3, v18, (uint64_t)CFSTR("liftOffset"), v19, v17);
  sub_1B18BD1D8(a3, CFSTR("gammaColor"), *(__n128 *)self->_gammaColor);
  *(float *)&v20 = self->_gammaOffset;
  objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("gammaOffset"), v22, v20);
  sub_1B18BD1D8(a3, CFSTR("gainColor"), *(__n128 *)self->_gainColor);
  *(float *)&v23 = self->_gainOffset;
  objc_msgSend_encodeFloat_forKey_(a3, v24, (uint64_t)CFSTR("gainOffset"), v25, v23);
  lookupTable = self->_lookupTable;
  if (lookupTable)
    objc_msgSend_encodeObject_forKey_(a3, v26, (uint64_t)lookupTable, (uint64_t)CFSTR("lookupTable"));
}

- (VFXCameraEffectColorGrading)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCameraEffectColorGrading *v7;
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
  const char *v28;
  uint64_t v29;
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
  double v40;
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
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)VFXCameraEffectColorGrading;
  v7 = -[VFXCameraEffect initWithCoder:](&v68, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, (uint64_t)CFSTR("saturation"), v12);
    objc_msgSend_setSaturation_(v7, v13, v14, v15);
    objc_msgSend_decodeFloatForKey_(a3, v16, (uint64_t)CFSTR("contrast"), v17);
    objc_msgSend_setContrast_(v7, v18, v19, v20);
    objc_msgSend_decodeFloatForKey_(a3, v21, (uint64_t)CFSTR("whiteBalanceTemperature"), v22);
    objc_msgSend_setWhiteBalanceTemperature_(v7, v23, v24, v25);
    objc_msgSend_decodeFloatForKey_(a3, v26, (uint64_t)CFSTR("whiteBalanceTint"), v27);
    objc_msgSend_setWhiteBalanceTint_(v7, v28, v29, v30);
    v31 = sub_1B18BD300(a3, CFSTR("liftColor"));
    objc_msgSend_setLiftColor_(v7, v32, v33, v34, v31);
    objc_msgSend_decodeFloatForKey_(a3, v35, (uint64_t)CFSTR("liftOffset"), v36);
    objc_msgSend_setLiftOffset_(v7, v37, v38, v39);
    v40 = sub_1B18BD300(a3, CFSTR("gammaColor"));
    objc_msgSend_setGammaColor_(v7, v41, v42, v43, v40);
    objc_msgSend_decodeFloatForKey_(a3, v44, (uint64_t)CFSTR("gammaOffset"), v45);
    objc_msgSend_setGammaOffset_(v7, v46, v47, v48);
    v49 = sub_1B18BD300(a3, CFSTR("gainColor"));
    objc_msgSend_setGainColor_(v7, v50, v51, v52, v49);
    objc_msgSend_decodeFloatForKey_(a3, v53, (uint64_t)CFSTR("gainOffset"), v54);
    objc_msgSend_setGainOffset_(v7, v55, v56, v57);
    if (objc_msgSend_containsValueForKey_(a3, v58, (uint64_t)CFSTR("lookupTable"), v59))
    {
      v62 = objc_opt_class();
      v64 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v63, v62, (uint64_t)CFSTR("lookupTable"));
      objc_msgSend_setLookupTable_(v7, v65, (uint64_t)v64, v66);
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v60, v8, v61);
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

  if (qword_1ED4CEB00 != -1)
    dispatch_once(&qword_1ED4CEB00, &unk_1E63D15D0);
  v0 = sub_1B179CB90(qword_1ED4CEB08, 0xB0uLL);
  *(_BYTE *)(v0 + 64) = 1;
  result = 0.00781250185;
  *(_OWORD *)(v0 + 72) = xmmword_1B2244EC0;
  *(_QWORD *)(v0 + 184) = 0;
  *(_QWORD *)(v0 + 96) = 0;
  *(_QWORD *)(v0 + 104) = 0;
  *(_DWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 128) = 0;
  *(_QWORD *)(v0 + 136) = 0;
  *(_DWORD *)(v0 + 144) = 0;
  *(_QWORD *)(v0 + 160) = 0;
  *(_QWORD *)(v0 + 168) = 0;
  *(_DWORD *)(v0 + 176) = 0;
  return result;
}

@end
