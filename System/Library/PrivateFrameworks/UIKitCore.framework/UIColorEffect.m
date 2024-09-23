@implementation UIColorEffect

+ (id)_colorEffectCAMatrix:(CAColorMatrix *)a3
{
  id *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E0CD2BF0]);
  v24 = *MEMORY[0x1E0CD2D20];
  v5 = v24;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v19 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v20 = v6;
  v21 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v17 = *MEMORY[0x1E0CD2338];
  v18 = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v4[3];
  v4[3] = (id)v9;

  v22 = v5;
  v11 = *(_OWORD *)&a3->m33;
  v19 = *(_OWORD *)&a3->m24;
  v20 = v11;
  v21 = *(_OWORD *)&a3->m42;
  v12 = *(_OWORD *)&a3->m15;
  v17 = *(_OWORD *)&a3->m11;
  v18 = v12;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v4[4];
  v4[4] = (id)v14;

  return v4;
}

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_filterType)
  {
    objc_msgSend(v7, "traitCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColorEffect _filterEntryForTraitCollection:](self, "_filterEntryForTraitCollection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addFilterEntry:", v10);

    if (self->_disableInPlaceFiltering)
      objc_msgSend(v11, "setDisableInPlaceFiltering:", 1);
  }

}

- (id)_filterEntry
{
  return -[UIColorEffect _filterEntryForTraitCollection:](self, "_filterEntryForTraitCollection:", 0);
}

+ (id)colorEffectBrightness:(double)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  v5 = v4;
  if (a3 != 0.0)
  {
    objc_storeStrong((id *)v4 + 1, (id)*MEMORY[0x1E0CD2BB8]);
    v15 = *MEMORY[0x1E0CD2CB8];
    v6 = v15;
    v16[0] = &unk_1E1A955D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v5[3];
    v5[3] = v7;

    v13 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v5[4];
    v5[4] = v10;

  }
  return v5;
}

+ (id)colorEffectLuminanceCurveMap:(id)a3 blendingAmount:(double)a4
{
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  _UIColorEffectUpgradeCurve(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (a3)
  {
    objc_storeStrong((id *)v8 + 1, (id)*MEMORY[0x1E0CD2E18]);
    v23 = *MEMORY[0x1E0CD2DD0];
    v24[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v9[2];
    v9[2] = v10;

    v21 = *MEMORY[0x1E0CD2CB8];
    v12 = v21;
    v22 = &unk_1E1A955D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v9[3];
    v9[3] = v13;

    v19 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v9[4];
    v9[4] = v16;

  }
  return v9;
}

+ (id)colorEffectMatrix:(id *)a3
{
  id *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  uint64_t v9;
  id v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float32x4_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  _OWORD v23[5];
  _OWORD v24[5];
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E0CD2BF0]);
  v27 = *MEMORY[0x1E0CD2D20];
  v5 = v27;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v24[2] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v24[3] = v6;
  v24[4] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v24[0] = *MEMORY[0x1E0CD2338];
  v24[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v4[3];
  v4[3] = (id)v9;

  v25 = v5;
  v11.f64[0] = a3->var1.var3;
  v12 = *(float64x2_t *)&a3->var2.var0;
  v13 = *(float64x2_t *)&a3->var2.var2;
  v14 = *(float64x2_t *)&a3->var3.var1;
  v15.f64[0] = a3->var3.var3;
  v16.f64[0] = a3->var4.var0;
  v17.f64[0] = a3->var4.var2;
  v16.f64[1] = a3->var1.var0;
  v18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), *(float64x2_t *)&a3->var1.var1);
  v23[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a3->var0.var0), *(float64x2_t *)&a3->var0.var2);
  v23[1] = v18;
  v11.f64[1] = a3->var4.var1;
  v17.f64[1] = a3->var3.var0;
  v23[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v11), v12);
  v23[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v17);
  v15.f64[1] = a3->var4.var3;
  v23[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v15);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v4[4];
  v4[4] = (id)v20;

  return v4;
}

+ (id)colorEffectSaturate:(double)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E0CD2C00]);
  v14 = *MEMORY[0x1E0CD2CB8];
  v5 = v14;
  v15[0] = &unk_1E1A955C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v4[3];
  v4[3] = (id)v6;

  v12 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v4[4];
  v4[4] = (id)v9;

  return v4;
}

- (UIColorEffect)init
{
  UIColorEffect *v2;
  UIColorEffect *v3;
  NSDictionary *configurationValues;
  NSDictionary *v5;
  NSDictionary *identityValues;
  NSDictionary *requestedValues;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIColorEffect;
  v2 = -[UIColorEffect init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    configurationValues = v2->_configurationValues;
    v5 = (NSDictionary *)MEMORY[0x1E0C9AA70];
    v2->_configurationValues = (NSDictionary *)MEMORY[0x1E0C9AA70];

    identityValues = v3->_identityValues;
    v3->_identityValues = v5;

    requestedValues = v3->_requestedValues;
    v3->_requestedValues = v5;

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UIColorEffect *v4;
  UIColorEffect *v5;
  id *v6;
  char v7;

  v4 = (UIColorEffect *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && -[UIColorEffect isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v6 = v5;
    if (objc_msgSend(v6[1], "isEqualToString:", self->_filterType)
      && objc_msgSend(v6[2], "isEqualToDictionary:", self->_configurationValues))
    {
      v7 = objc_msgSend(v6[4], "isEqualToDictionary:", self->_requestedValues);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sourceColorUpdater, 0);
  objc_storeStrong((id *)&self->_requestedValues, 0);
  objc_storeStrong((id *)&self->_identityValues, 0);
  objc_storeStrong((id *)&self->_configurationValues, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

- (UIColorEffect)initWithCoder:(id)a3
{
  id v4;
  UIColorEffect *v5;
  uint64_t v6;
  NSString *filterType;
  uint64_t v8;
  NSDictionary *configurationValues;
  uint64_t v10;
  NSDictionary *identityValues;
  uint64_t v12;
  NSDictionary *requestedValues;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIColorEffect;
  v5 = -[UIVisualEffect initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIColorEffectType"));
    v6 = objc_claimAutoreleasedReturnValue();
    filterType = v5->_filterType;
    v5->_filterType = (NSString *)v6;

    _UIColorEffectDecodeDictionary(v4, (uint64_t)CFSTR("UIColorEffectConfigurationValues"));
    v8 = objc_claimAutoreleasedReturnValue();
    configurationValues = v5->_configurationValues;
    v5->_configurationValues = (NSDictionary *)v8;

    _UIColorEffectDecodeDictionary(v4, (uint64_t)CFSTR("UIColorEffectIdentityValues"));
    v10 = objc_claimAutoreleasedReturnValue();
    identityValues = v5->_identityValues;
    v5->_identityValues = (NSDictionary *)v10;

    _UIColorEffectDecodeDictionary(v4, (uint64_t)CFSTR("UIColorEffectRequestedValues"));
    v12 = objc_claimAutoreleasedReturnValue();
    requestedValues = v5->_requestedValues;
    v5->_requestedValues = (NSDictionary *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIColorEffect;
  v4 = a3;
  -[UIVisualEffect encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_filterType, CFSTR("UIColorEffectType"), v5.receiver, v5.super_class);
  _UIColorEffectEncodeDictionary(v4, CFSTR("UIColorEffectConfigurationValues"), self->_configurationValues);
  _UIColorEffectEncodeDictionary(v4, CFSTR("UIColorEffectIdentityValues"), self->_identityValues);
  _UIColorEffectEncodeDictionary(v4, CFSTR("UIColorEffectRequestedValues"), self->_requestedValues);

}

+ (id)colorEffectColor:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  __int128 v7;
  float64x2_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  _OWORD v24[5];
  float64x2_t v25;
  float64x2_t v26;
  _OWORD v27[2];
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30[2];
  __int128 v31;
  __int128 v32;
  _QWORD aBlock[4];
  id v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E0CD2BF0]);
  v6 = *MEMORY[0x1E0CD2D20];
  v39 = *MEMORY[0x1E0CD2D20];
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v27[0] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v27[1] = v7;
  v28 = *(float64x2_t *)(MEMORY[0x1E0CD2338] + 64);
  v8 = *(float64x2_t *)(MEMORY[0x1E0CD2338] + 16);
  v25 = *(float64x2_t *)MEMORY[0x1E0CD2338];
  v26 = v8;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v5[3];
  v5[3] = (id)v10;

  if (objc_msgSend(v4, "_isDynamic"))
  {
    v37 = CFSTR("UIDynamicColor");
    v38 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v5[4];
    v5[4] = (id)v12;

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __34__UIColorEffect_colorEffectColor___block_invoke;
    aBlock[3] = &unk_1E16B4FA0;
    v34 = v4;
    v14 = _Block_copy(aBlock);
    v15 = v5[5];
    v5[5] = v14;

  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    memset(v30, 0, sizeof(v30));
    v28 = 0u;
    v29 = 0u;
    memset(v27, 0, sizeof(v27));
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v4, "getRed:green:blue:alpha:", &v31, (char *)&v31 + 8, &v32, (char *)&v32 + 8);
    v35 = v6;
    v16.f64[0] = *((float64_t *)&v27[1] + 1);
    v17.f64[0] = v30[1].f64[1];
    *(_QWORD *)&v18.f64[0] = v31;
    *(_QWORD *)&v19.f64[0] = v32;
    v18.f64[1] = *(float64_t *)v27;
    v24[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v26);
    v24[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), *(float64x2_t *)((char *)v27 + 8));
    v16.f64[1] = *((float64_t *)&v31 + 1);
    v19.f64[1] = v30[0].f64[0];
    v24[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v28);
    v24[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v19);
    v17.f64[1] = *((float64_t *)&v32 + 1);
    v24[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)v30 + 8)), v17);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v5[4];
    v5[4] = (id)v21;

  }
  return v5;
}

id __34__UIColorEffect_colorEffectColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  void *v14;
  id v15;
  _OWORD v17[5];
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20[2];
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23[2];
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    memset(v23, 0, sizeof(v23));
    v21 = 0u;
    v22 = 0u;
    memset(v20, 0, sizeof(v20));
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v9, "getRed:green:blue:alpha:", &v24, (char *)&v24 + 8, &v25, (char *)&v25 + 8);
    v26 = *MEMORY[0x1E0CD2D20];
    v10.f64[0] = v20[1].f64[1];
    v11.f64[0] = v23[1].f64[1];
    *(_QWORD *)&v12.f64[0] = v24;
    *(_QWORD *)&v13.f64[0] = v25;
    v12.f64[1] = v20[0].f64[0];
    v17[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
    v17[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v12), *(float64x2_t *)((char *)v20 + 8));
    v10.f64[1] = *((float64_t *)&v24 + 1);
    v13.f64[1] = v23[0].f64[0];
    v17[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v10), v21);
    v17[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v13);
    v11.f64[1] = *((float64_t *)&v25 + 1);
    v17[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)v23 + 8)), v11);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v7;
  }

  return v15;
}

+ (id)colorEffectMultiply:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E0CD2E60]);
  v6 = *MEMORY[0x1E0CD2D00];
  v23 = *MEMORY[0x1E0CD2D00];
  +[UIColor whiteColor](UIColor, "whiteColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[0] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v5[3];
  v5[3] = (id)v8;

  if (objc_msgSend(v4, "_isDynamic"))
  {
    v21 = CFSTR("UIDynamicColor");
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5[4];
    v5[4] = (id)v10;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__UIColorEffect_colorEffectMultiply___block_invoke;
    v17[3] = &unk_1E16B4FA0;
    v18 = v4;
    v12 = _Block_copy(v17);
    v13 = v5[5];
    v5[5] = v12;

    v14 = v18;
  }
  else
  {
    v19 = v6;
    v20 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = v5[4];
    v5[4] = (id)v15;
  }

  return v5;
}

id __37__UIColorEffect_colorEffectMultiply___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CD2D00];
    v10 = objc_retainAutorelease(v9);
    v14[0] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

+ (id)colorEffectAdd:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E0CD2BA8]);
  v6 = *MEMORY[0x1E0CD2D00];
  v23 = *MEMORY[0x1E0CD2D00];
  +[UIColor clearColor](UIColor, "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[0] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v5[3];
  v5[3] = (id)v8;

  if (objc_msgSend(v4, "_isDynamic"))
  {
    v21 = CFSTR("UIDynamicColor");
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5[4];
    v5[4] = (id)v10;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __32__UIColorEffect_colorEffectAdd___block_invoke;
    v17[3] = &unk_1E16B4FA0;
    v18 = v4;
    v12 = _Block_copy(v17);
    v13 = v5[5];
    v5[5] = v12;

    v14 = v18;
  }
  else
  {
    v19 = v6;
    v20 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = v5[4];
    v5[4] = (id)v15;
  }

  return v5;
}

id __32__UIColorEffect_colorEffectAdd___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CD2D00];
    v10 = objc_retainAutorelease(v9);
    v14[0] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

+ (id)colorEffectSubtract:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v5 + 1, (id)*MEMORY[0x1E0CD2C08]);
  v6 = *MEMORY[0x1E0CD2D00];
  v23 = *MEMORY[0x1E0CD2D00];
  +[UIColor clearColor](UIColor, "clearColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v24[0] = objc_msgSend(v7, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v5[3];
  v5[3] = (id)v8;

  if (objc_msgSend(v4, "_isDynamic"))
  {
    v21 = CFSTR("UIDynamicColor");
    v22 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v5[4];
    v5[4] = (id)v10;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __37__UIColorEffect_colorEffectSubtract___block_invoke;
    v17[3] = &unk_1E16B4FA0;
    v18 = v4;
    v12 = _Block_copy(v17);
    v13 = v5[5];
    v5[5] = v12;

    v14 = v18;
  }
  else
  {
    v19 = v6;
    v20 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = objc_claimAutoreleasedReturnValue();
    v14 = v5[4];
    v5[4] = (id)v15;
  }

  return v5;
}

id __37__UIColorEffect_colorEffectSubtract___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0CD2D00];
    v10 = objc_retainAutorelease(v9);
    v14[0] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
  }

  return v11;
}

+ (id)colorEffectBlendColor:(id)a3
{
  id v4;
  int v5;
  id *v6;
  double v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  _BYTE v23[80];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD aBlock[4];
  id v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "_isDynamic");
  v6 = (id *)objc_alloc_init((Class)a1);
  if ((v5 & 1) != 0 || (objc_msgSend(v4, "alphaComponent"), v7 != 0.0))
  {
    objc_storeStrong(v6 + 1, (id)*MEMORY[0x1E0CD2BF0]);
    v8 = *MEMORY[0x1E0CD2D20];
    v40 = *MEMORY[0x1E0CD2D20];
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
    v26 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
    v27 = v9;
    v28 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
    v24 = *MEMORY[0x1E0CD2338];
    v25 = v10;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v6[3];
    v6[3] = (id)v12;

    if (v5)
    {
      v38 = CFSTR("UIDynamicColor");
      v39 = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v6[4];
      v6[4] = (id)v14;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__UIColorEffect_colorEffectBlendColor___block_invoke;
      aBlock[3] = &unk_1E16B4FA0;
      v35 = v4;
      v16 = _Block_copy(aBlock);
      v17 = v6[5];
      v6[5] = v16;

    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v4, "getRed:green:blue:alpha:", &v32, (char *)&v32 + 8, &v33, (char *)&v33 + 8);
      v36 = v8;
      v18 = (void *)MEMORY[0x1E0CB3B18];
      _UIColorEffectSourceOverCAMatrix((uint64_t)v23, v4);
      objc_msgSend(v18, "valueWithCAColorMatrix:", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v6[4];
      v6[4] = (id)v20;

    }
  }

  return v6;
}

id __39__UIColorEffect_colorEffectBlendColor___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BYTE v14[80];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CD2D20];
    v10 = (void *)MEMORY[0x1E0CB3B18];
    _UIColorEffectSourceOverCAMatrix((uint64_t)v14, v9);
    objc_msgSend(v10, "valueWithCAColorMatrix:", v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v7;
  }

  return v12;
}

+ (id)_colorEffectSourceOver:(id)a3
{
  double v4;
  __int128 v5;
  __int128 v6;
  double v7;
  __int128 v8;
  __int128 v9;
  double v10;
  __int128 v11;
  __int128 v12;
  double v13;
  $01BB1521EC52D44A8E7628F5261DCEC8 v14;

  if (a3.var3 == 0.0)
    return objc_alloc_init((Class)a1);
  v6 = 0u;
  v5 = 0u;
  v8 = 0u;
  v9 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = 1.0 - a3.var3;
  v7 = 1.0 - a3.var3;
  v10 = 1.0 - a3.var3;
  v13 = 1.0 - a3.var3;
  v14 = a3;
  +[UIColorEffect colorEffectMatrix:](UIColorEffect, "colorEffectMatrix:", &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorEffectContrast:(double)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v4 + 1, (id)*MEMORY[0x1E0CD2BC8]);
  v14 = *MEMORY[0x1E0CD2CB8];
  v5 = v14;
  v15[0] = &unk_1E1A955C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v4[3];
  v4[3] = (id)v6;

  v12 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v4[4];
  v4[4] = (id)v9;

  return v4;
}

+ (id)colorEffectInvert
{
  _QWORD v8[6];
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v14 = 0;
  v15 = 0;
  v8[0] = 0xBFF0000000000000;
  memset(&v8[1], 0, 32);
  v8[5] = 0xBFF0000000000000;
  v9 = 0u;
  v10 = 0u;
  v12 = 0;
  v13 = 0;
  v11 = 0xBFF0000000000000;
  __asm { FMOV            V0.2D, #1.0 }
  v16 = _Q0;
  v17 = _Q0;
  v18 = 0;
  objc_msgSend(a1, "colorEffectMatrix:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorEffectMonochromeTint:(id)a3 blendingAmount:(double)a4 brightnessAdjustment:(double)a5
{
  id v8;
  id *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  _QWORD v26[4];
  id v27;
  double v28;
  double v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v9 + 1, (id)*MEMORY[0x1E0CD2BF8]);
  if (objc_msgSend(v8, "_isDynamic"))
  {
    v34 = CFSTR("UIDynamicColor");
    v35[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9[4];
    v9[4] = (id)v10;

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __79__UIColorEffect_colorEffectMonochromeTint_blendingAmount_brightnessAdjustment___block_invoke;
    v26[3] = &unk_1E16B4FC8;
    v27 = v8;
    v28 = a5;
    v29 = a4;
    v12 = _Block_copy(v26);
    v13 = v9[5];
    v9[5] = v12;

    v14 = v27;
  }
  else
  {
    v32[0] = *MEMORY[0x1E0CD2D00];
    v15 = v32[0];
    v16 = objc_retainAutorelease(v8);
    v17 = objc_msgSend(v16, "CGColor");
    v18 = *MEMORY[0x1E0CD2CE8];
    v33[0] = v17;
    v33[1] = &unk_1E1A955D0;
    v19 = *MEMORY[0x1E0CD2CB8];
    v32[1] = v18;
    v32[2] = v19;
    v33[2] = &unk_1E1A955D0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v9[3];
    v9[3] = (id)v20;

    v30[0] = v15;
    v31[0] = objc_msgSend(objc_retainAutorelease(v16), "CGColor");
    v30[1] = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v14;
    v30[2] = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v9[4];
    v9[4] = (id)v23;

  }
  return v9;
}

id __79__UIColorEffect_colorEffectMonochromeTint_blendingAmount_brightnessAdjustment___block_invoke(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "resolvedColorWithTraitCollection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = objc_msgSend(v9, "CGColor");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CD2D00]);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD2CE8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CD2CB8]);

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E1A955D0, *MEMORY[0x1E0CD2CE8]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E1A955D0, *MEMORY[0x1E0CD2CB8]);
  }

  return v7;
}

+ (id)colorEffectLuminanceMap:(id)a3 blendingAmount:(double)a4
{
  id v7;
  double v8;
  double v9;
  id *v10;
  id v11;
  uint64_t v12;
  id v13;
  CGImage *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIGraphicsImageRenderer *v19;
  void *v20;
  UIGraphicsImageRenderer *v21;
  id v22;
  CGImage *v23;
  CGFloat v24;
  CGFloat v25;
  CGImage *v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];
  CGRect v47;

  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  if (!objc_msgSend(v7, "CGImage"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIColorEffect.m"), 441, CFSTR("Luminance Map Image must be a CGImage based image"));

  }
  objc_msgSend(v7, "size");
  if (v9 <= 0.0 || v8 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIColorEffect.m"), 443, CFSTR("Luminance Map Image must be non-zero size"));

  }
  v10 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v10 + 1, (id)*MEMORY[0x1E0CD2E20]);
  v11 = v7;
  v12 = objc_msgSend(v11, "imageOrientation");
  v13 = objc_retainAutorelease(v11);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");
  if (v12)
  {
    objc_msgSend(v13, "size");
    v16 = v15;
    objc_msgSend(v13, "scale");
    v18 = 1.0 / v17;
    v19 = [UIGraphicsImageRenderer alloc];
    objc_msgSend(v13, "imageRendererFormat");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[UIGraphicsImageRenderer initWithSize:format:](v19, "initWithSize:format:", v20, v16, v18);

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = ___UIColorEffectProcessLuminanceMap_block_invoke;
    v39[3] = &unk_1E16B5018;
    v40 = v13;
    -[UIGraphicsImageRenderer imageWithActions:](v21, "imageWithActions:", v39);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v14;
    if (CGImageGetHeight(v14) == 1)
    {
      v22 = v13;
    }
    else
    {
      v24 = *MEMORY[0x1E0C9D538];
      v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v47.size.width = (double)CGImageGetWidth(v23);
      v47.size.height = 1.0;
      v47.origin.x = v24;
      v47.origin.y = v25;
      v26 = CGImageCreateWithImageInRect(v23, v47);
      +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v26);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v26);
    }
  }

  v45 = *MEMORY[0x1E0CD2D18];
  v27 = objc_retainAutorelease(v22);
  v46[0] = objc_msgSend(v27, "CGImage");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v10[2];
  v10[2] = (id)v28;

  v43 = *MEMORY[0x1E0CD2CB8];
  v30 = v43;
  v44 = &unk_1E1A955D0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v10[3];
  v10[3] = (id)v31;

  v41 = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v10[4];
  v10[4] = (id)v34;

  return v10;
}

+ (id)colorEffectCurvesRed:(id)a3 green:(id)a4 blue:(id)a5 alpha:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v26;
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[5];

  v32[4] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  _UIColorEffectUpgradeCurve(a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  _UIColorEffectUpgradeCurve(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _UIColorEffectUpgradeCurve(v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _UIColorEffectUpgradeCurve(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v16 + 1, (id)*MEMORY[0x1E0CD2C20]);
  v18 = *MEMORY[0x1E0CD2D48];
  v29[0] = *MEMORY[0x1E0CD2D98];
  v17 = v29[0];
  v29[1] = v18;
  v32[0] = &unk_1E1A92B40;
  v32[1] = &unk_1E1A92B40;
  v20 = *MEMORY[0x1E0CD2CB0];
  v30 = *MEMORY[0x1E0CD2CF0];
  v19 = v30;
  v31 = v20;
  v32[2] = &unk_1E1A92B40;
  v32[3] = &unk_1E1A92B40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v29, 4);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v16[3];
  v16[3] = (id)v21;

  v27[0] = v17;
  v27[1] = v18;
  v28[0] = v26;
  v28[1] = v13;
  v27[2] = v19;
  v27[3] = v20;
  v28[2] = v14;
  v28[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 4);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v16[4];
  v16[4] = (id)v23;

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_filterType, "hash");
}

- (int64_t)_expectedUsage
{
  return 2;
}

- (id)_filterEntryForTraitCollection:(id)a3
{
  NSDictionary *v5;
  NSDictionary *v6;
  _QWORD *sourceColorUpdater;
  void (*v8)(_QWORD *, NSDictionary *, id, uint64_t);
  id v9;
  uint64_t v10;
  uint64_t v11;
  _UIVisualEffectFilterEntry *v12;

  v5 = self->_requestedValues;
  v6 = self->_identityValues;
  if (a3)
  {
    sourceColorUpdater = self->_sourceColorUpdater;
    if (sourceColorUpdater)
    {
      v8 = (void (*)(_QWORD *, NSDictionary *, id, uint64_t))sourceColorUpdater[2];
      v9 = a3;
      v8(sourceColorUpdater, v5, v9, 1);
      v10 = objc_claimAutoreleasedReturnValue();

      (*((void (**)(void))self->_sourceColorUpdater + 2))();
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (NSDictionary *)v10;
      v6 = (NSDictionary *)v11;
    }
  }
  v12 = -[_UIVisualEffectFilterEntry initWithFilterType:configurationValues:requestedValues:identityValues:]([_UIVisualEffectFilterEntry alloc], "initWithFilterType:configurationValues:requestedValues:identityValues:", self->_filterType, self->_configurationValues, v5, v6);

  return v12;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 changedTraits:(id)a5 usage:(int64_t)a6
{
  id v7;
  void *v8;
  unint64_t v9;
  int v10;

  v7 = a5;
  if (self->_sourceColorUpdater)
  {
    +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        v10 = objc_msgSend(v7, "containsObject:", (id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
        if (v10)
          break;
        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_needsUpdateForTransitionFromEnvironment:(id)a3 toEnvironment:(id)a4 usage:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "changedTraitsFromTraitCollection:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[UIColorEffect _needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:](self, "_needsUpdateForTransitionFromEnvironment:toEnvironment:changedTraits:usage:", v9, v8, v12, a5);
  return a5;
}

- (id)description
{
  void *v3;
  void *v4;
  NSDictionary *configurationValues;
  uint64_t v6;
  id v7;
  NSDictionary *requestedValues;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIColorEffect;
  -[UIColorEffect description](&v17, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" filterType=%@"), self->_filterType);
  if (self->_sourceColorUpdater)
    objc_msgSend(v4, "appendString:", CFSTR(" dynamicColorBased"));
  configurationValues = self->_configurationValues;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __28__UIColorEffect_description__block_invoke;
  v15[3] = &unk_1E16B4FF0;
  v7 = v4;
  v16 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configurationValues, "enumerateKeysAndObjectsUsingBlock:", v15);
  requestedValues = self->_requestedValues;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __28__UIColorEffect_description__block_invoke_2;
  v13[3] = &unk_1E16B4FF0;
  v9 = v7;
  v14 = v9;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](requestedValues, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

void __28__UIColorEffect_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  _UIVisualEffectFilterEntryDescribeValue(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@=%@"), v5, v6);

}

void __28__UIColorEffect_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  _UIVisualEffectFilterEntryDescribeValue(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" %@=%@"), v5, v6);

}

@end
