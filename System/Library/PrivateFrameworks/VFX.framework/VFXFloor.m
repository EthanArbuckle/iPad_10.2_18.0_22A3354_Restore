@implementation VFXFloor

- (void)_syncObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
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
  const char *v24;
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
  const char *v35;
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
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  objc_super v50;

  v5 = objc_msgSend_geometryRef(self, a2, v2, v3);
  self->_reflectivity = sub_1B18D9FEC(v5, v6, v7, v8, v9, v10, v11, v12);
  v16 = objc_msgSend_geometryRef(self, v13, v14, v15);
  self->_reflectionFalloffStart = sub_1B18DA110(v16, v17, v18, v19, v20, v21, v22, v23);
  v27 = objc_msgSend_geometryRef(self, v24, v25, v26);
  self->_reflectionFalloffEnd = sub_1B18DA1F0(v27, v28, v29, v30, v31, v32, v33, v34);
  v38 = objc_msgSend_geometryRef(self, v35, v36, v37);
  self->_reflectionResolutionScaleFactor = sub_1B18DA2D0(v38, v39, v40, v41, v42, v43, v44, v45);
  v49 = objc_msgSend_geometryRef(self, v46, v47, v48);
  self->_reflectionCategoryBitMask = sub_1B18DA46C(v49);
  v50.receiver = self;
  v50.super_class = (Class)VFXFloor;
  -[VFXModel _syncObjCModel](&v50, sel__syncObjCModel);
}

- (VFXFloor)init
{
  const void *v3;
  VFXFloor *v4;
  objc_super v6;

  v3 = (const void *)-[VFXFloor __createCFObject]_0();
  v6.receiver = self;
  v6.super_class = (Class)VFXFloor;
  v4 = -[VFXModel initWithGeometryRef:](&v6, sel_initWithGeometryRef_, v3);
  CFRelease(v3);
  return v4;
}

- (VFXFloor)initWithFloorGeometryRef:(__CFXFloor *)a3
{
  VFXFloor *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXFloor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXFloor;
  v3 = -[VFXModel initWithGeometryRef:](&v9, sel_initWithGeometryRef_, a3);
  v7 = v3;
  if (v3)
    objc_msgSend__syncObjCModel(v3, v4, v5, v6);
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VFXFloor;
  -[VFXModel dealloc](&v2, sel_dealloc);
}

+ (id)floor
{
  return objc_alloc_init((Class)a1);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (void)setReflectionResolutionScaleFactor:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  float v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_reflectionResolutionScaleFactor != a3)
  {
    self->_reflectionResolutionScaleFactor = a3;
    if (a3 == 0.0)
      v6 = 0.5;
    else
      v6 = a3;
    *((_BYTE *)self + 176) = *((_BYTE *)self + 176) & 0xFD | (2 * (a3 != 0.0));
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18D8EB0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = v6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (void)setReflectionCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_reflectionCategoryBitMask != a3)
  {
    self->_reflectionCategoryBitMask = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18D8F70;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (unint64_t)reflectionCategoryBitMask
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_reflectionCategoryBitMask;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18DA46C(v15);
  if (v14)
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
  return v5;
}

- (void)setWidth:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_width != a3)
  {
    self->_width = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18D90B8;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("width"), v9);
  }
}

- (float)width
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_width;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18DA44C(v15);
  if (v14)
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
  return v5;
}

- (void)setLength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_length != a3)
  {
    self->_length = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18D9208;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("length"), v9);
  }
}

- (float)length
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_length;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18DA45C(v15);
  if (v14)
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
  return v5;
}

- (float)reflectionFalloffEnd
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_reflectionFalloffEnd;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18DA1F0(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setReflectionFalloffEnd:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_reflectionFalloffEnd != a3)
  {
    self->_reflectionFalloffEnd = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18D93CC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("reflectionFalloffEnd"), v9);
  }
}

- (float)reflectionFalloffStart
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_reflectionFalloffStart;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18DA110(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setReflectionFalloffStart:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_reflectionFalloffStart != a3)
  {
    self->_reflectionFalloffStart = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18D9514;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("reflectionFalloffStart"), v9);
  }
}

- (float)reflectionResolutionScaleFactor
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_reflectionResolutionScaleFactor;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18DA2D0(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (unint64_t)reflectionSampleCount
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_reflectionSampleCount;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = (int)sub_1B18DA398(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setReflectionSampleCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_reflectionSampleCount != a3)
  {
    self->_reflectionSampleCount = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18D96C4;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)reflectivity
{
  uint64_t v2;
  uint64_t v3;
  float v5;
  uint64_t v6;
  const char *v7;
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

  if ((*((_BYTE *)self + 176) & 1) == 0)
    return self->_reflectivity;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend_geometryRef(self, v7, v8, v9);
  v5 = sub_1B18D9FEC(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setReflectivity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_reflectivity != a3)
  {
    self->_reflectivity = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B18D980C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("reflectivity"), v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  objc_msgSend__setupObjCModelFrom_(v4, v10, (uint64_t)self, v11);
  objc_msgSend_reflectivity(self, v12, v13, v14);
  objc_msgSend_setReflectivity_(v4, v15, v16, v17);
  objc_msgSend_reflectionFalloffEnd(self, v18, v19, v20);
  objc_msgSend_setReflectionFalloffEnd_(v4, v21, v22, v23);
  objc_msgSend_reflectionFalloffStart(self, v24, v25, v26);
  objc_msgSend_setReflectionFalloffStart_(v4, v27, v28, v29);
  objc_msgSend_reflectionResolutionScaleFactor(self, v30, v31, v32);
  objc_msgSend_setReflectionResolutionScaleFactor_(v4, v33, v34, v35);
  v39 = objc_msgSend_reflectionSampleCount(self, v36, v37, v38);
  objc_msgSend_setReflectionSampleCount_(v4, v40, v39, v41);
  v45 = objc_msgSend_reflectionCategoryBitMask(self, v42, v43, v44);
  objc_msgSend_setReflectionCategoryBitMask_(v4, v46, v45, v47);
  objc_msgSend_width(self, v48, v49, v50);
  objc_msgSend_setWidth_(v4, v51, v52, v53);
  objc_msgSend_length(self, v54, v55, v56);
  objc_msgSend_setLength_(v4, v57, v58, v59);
  objc_msgSend__copyAnimationsFrom_(v4, v60, (uint64_t)self, v61);
  objc_msgSend_commitImmediate(VFXTransaction, v62, v63, v64);
  return v4;
}

- (void)_customDecodingOfVFXFloor:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = objc_msgSend_geometryRef(self, a2, (uint64_t)a3, v3);
  self->_reflectivity = sub_1B18D9FEC(v5, v6, v7, v8, v9, v10, v11, v12);
  v16 = objc_msgSend_geometryRef(self, v13, v14, v15);
  self->_reflectionCategoryBitMask = sub_1B18DA46C(v16);
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
  const char *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VFXFloor;
  -[VFXModel encodeWithCoder:](&v24, sel_encodeWithCoder_);
  *(float *)&v5 = self->_reflectivity;
  objc_msgSend_encodeFloat_forKey_(a3, v6, (uint64_t)CFSTR("reflectivity"), v7, v5);
  *(float *)&v8 = self->_reflectionFalloffStart;
  objc_msgSend_encodeFloat_forKey_(a3, v9, (uint64_t)CFSTR("reflectionFalloffStart"), v10, v8);
  *(float *)&v11 = self->_reflectionFalloffEnd;
  objc_msgSend_encodeFloat_forKey_(a3, v12, (uint64_t)CFSTR("reflectionFalloffEnd"), v13, v11);
  *(float *)&v14 = self->_width;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("width"), v16, v14);
  *(float *)&v17 = self->_length;
  objc_msgSend_encodeFloat_forKey_(a3, v18, (uint64_t)CFSTR("length"), v19, v17);
  objc_msgSend_encodeInteger_forKey_(a3, v20, self->_reflectionCategoryBitMask, (uint64_t)CFSTR("reflectionCategoryBitMask"));
  if ((*((_BYTE *)self + 176) & 2) != 0)
  {
    *(float *)&v23 = self->_reflectionResolutionScaleFactor;
    objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("reflectionResolutionScaleFactor"), v22, v23);
  }
}

- (VFXFloor)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXFloor *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  objc_super v50;

  v50.receiver = self;
  v50.super_class = (Class)VFXFloor;
  v7 = -[VFXModel initWithCoder:](&v50, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXFloor_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("reflectivity"), v14);
    objc_msgSend_setReflectivity_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("reflectionFalloffStart"), v19);
    objc_msgSend_setReflectionFalloffStart_(v7, v20, v21, v22);
    objc_msgSend_decodeFloatForKey_(a3, v23, (uint64_t)CFSTR("reflectionFalloffEnd"), v24);
    objc_msgSend_setReflectionFalloffEnd_(v7, v25, v26, v27);
    objc_msgSend_decodeFloatForKey_(a3, v28, (uint64_t)CFSTR("width"), v29);
    objc_msgSend_setWidth_(v7, v30, v31, v32);
    objc_msgSend_decodeFloatForKey_(a3, v33, (uint64_t)CFSTR("length"), v34);
    objc_msgSend_setLength_(v7, v35, v36, v37);
    if (objc_msgSend_containsValueForKey_(a3, v38, (uint64_t)CFSTR("reflectionCategoryBitMask"), v39))
    {
      v42 = objc_msgSend_decodeIntegerForKey_(a3, v40, (uint64_t)CFSTR("reflectionCategoryBitMask"), v41);
      objc_msgSend_setReflectionCategoryBitMask_(v7, v43, v42, v44);
    }
    if (objc_msgSend_containsValueForKey_(a3, v40, (uint64_t)CFSTR("reflectionResolutionScaleFactor"), v41))
    {
      objc_msgSend_decodeFloatForKey_(a3, v45, (uint64_t)CFSTR("reflectionResolutionScaleFactor"), v46);
      if (v48 != 0.0)
      {
        objc_msgSend_setReflectionResolutionScaleFactor_(v7, v45, v47, v46);
        *((_BYTE *)v7 + 176) |= 2u;
      }
    }
    objc_msgSend_setImmediateMode_(VFXTransaction, v45, v8, v46);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (uint64_t)__createCFObject
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  const void *v34;
  const void *v35;
  int v36;
  unsigned int v37;
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
  uint64_t v52;

  if (qword_1ED4CEC78 != -1)
    dispatch_once(&qword_1ED4CEC78, &unk_1E63D0FF0);
  v0 = sub_1B179CB90(qword_1ED4CEC80, 0xE8uLL);
  sub_1B17A13B4(v0);
  *(_DWORD *)(v0 + 220) = 1065353216;
  *(_QWORD *)(v0 + 240) = -1;
  v1 = (const void *)sub_1B19077CC(0, 10, 10, 0, 2.0, -2.0, 0.0);
  sub_1B17A14D4(v0, (uint64_t)v1, v2, v3, v4, v5, v6, v7);
  CFRelease(v1);
  v8 = (void *)sub_1B1877ABC();
  sub_1B187806C((uint64_t)v8, 1, v9, v10, v11, v12, v13, v14);
  v22 = sub_1B187813C((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18424A8(v22, 1, v23, v24, v25, v26, v27, v28);
  sub_1B180CBAC(2, 2, 2, 2, 2, 2);
  v35 = v34;
  v36 = 0;
  do
  {
    sub_1B17ADC84((uint64_t)v8, (char)v36, v35, v29, v30, v31, v32, v33, v52);
    v37 = v36++;
  }
  while (v37 < 0x10);
  CFRelease(v35);
  sub_1B17A1B04(v0, v8, v38, v39, v40, v41, v42, v43);
  CFRelease(v8);
  sub_1B18DA078(v0, v44, v45, v46, v47, v48, v49, v50, 0.25);
  return v0;
}

@end
