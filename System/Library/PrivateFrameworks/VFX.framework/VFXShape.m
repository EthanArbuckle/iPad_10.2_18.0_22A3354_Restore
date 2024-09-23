@implementation VFXShape

- (void)_syncObjCModel:(__CFXShapeGeometry *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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

  self->_primitiveType = (int)sub_1B19DD498((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  self->_chamferRadius = sub_1B19DD24C((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  self->_extrusionDepth = sub_1B19DD3D4((uint64_t)a3, v17, v18, v19, v20, v21, v22, v23);
  self->_chamferProfile = (UIBezierPath *)(id)sub_1B19DD550((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = sub_1B19DD310((uint64_t)a3, v24, v25, v26, v27, v28, v29, v30);
  self->_path = (UIBezierPath *)(id)sub_1B18DA46C((uint64_t)a3);
  self->_chamferMode = (int)sub_1B19DD194((uint64_t)a3, v31, v32, v33, v34, v35, v36, v37);
}

- (VFXShape)init
{
  const void *v3;
  VFXShape *v4;
  VFXShape *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;
  objc_super v14;

  v3 = (const void *)-[VFXShape __createCFObject]_0();
  v14.receiver = self;
  v14.super_class = (Class)VFXShape;
  v4 = -[VFXModel initWithGeometryRef:](&v14, sel_initWithGeometryRef_, v3);
  v5 = v4;
  if (v4)
  {
    v13.receiver = v4;
    v13.super_class = (Class)VFXShape;
    -[VFXModel _syncObjCModel](&v13, sel__syncObjCModel);
    v9 = objc_msgSend_geometryRef(v5, v6, v7, v8);
    objc_msgSend__syncObjCModel_(v5, v10, v9, v11);
  }
  CFRelease(v3);
  return v5;
}

- (VFXShape)initWithShapeGeometryRef:(__CFXShapeGeometry *)a3
{
  VFXShape *v3;
  VFXShape *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VFXShape;
  v3 = -[VFXModel initWithGeometryRef:](&v13, sel_initWithGeometryRef_, a3);
  v4 = v3;
  if (v3)
  {
    v12.receiver = v3;
    v12.super_class = (Class)VFXShape;
    -[VFXModel _syncObjCModel](&v12, sel__syncObjCModel);
    v8 = objc_msgSend_geometryRef(v4, v5, v6, v7);
    objc_msgSend__syncObjCModel_(v4, v9, v8, v10);
  }
  return v4;
}

- (id)initPresentationShapeGeometryWithShapeGeometryRef:(__CFXShapeGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXShape;
  return -[VFXModel initPresentationModelWithGeometryRef:](&v4, sel_initPresentationModelWithGeometryRef_, a3);
}

- (id)presentationModel
{
  VFXShape *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v3 = [VFXShape alloc];
  v7 = objc_msgSend_geometryRef(self, v4, v5, v6);
  return (id)objc_msgSend_initPresentationShapeGeometryWithShapeGeometryRef_(v3, v8, v7, v9);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

+ (id)shapeWithPath:(id)a3 extrusionDepth:(float)a4
{
  id v6;
  double v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v6 = objc_alloc_init((Class)a1);
  *(float *)&v7 = a4;
  objc_msgSend_setExtrusionDepth_(v6, v8, v9, v10, v7);
  objc_msgSend_setPath_(v6, v11, (uint64_t)a3, v12);
  return v6;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  const char *v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_modelDescription(self, a2, v2, v3);
  v10 = objc_msgSend_path(self, v7, v8, v9);
  objc_msgSend_extrusionDepth(self, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("<%@ | path=%@ extrusionDepth=%.3f> "), v16, v6, v10, v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  id v32;

  v5 = objc_msgSend_path(self, a2, (uint64_t)a3, v3);
  objc_msgSend_extrusionDepth(self, v6, v7, v8);
  v32 = (id)objc_msgSend_shapeWithPath_extrusionDepth_(VFXShape, v9, v5, v10);
  v14 = objc_msgSend_chamferMode(self, v11, v12, v13);
  objc_msgSend_setChamferMode_(v32, v15, v14, v16);
  objc_msgSend_chamferRadius(self, v17, v18, v19);
  objc_msgSend_setChamferRadius_(v32, v20, v21, v22);
  v26 = objc_msgSend_chamferProfile(self, v23, v24, v25);
  objc_msgSend_setChamferProfile_(v32, v27, v26, v28);
  objc_msgSend__setupObjCModelFrom_(v32, v29, (uint64_t)self, v30);
  return v32;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (int64_t)chamferMode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_chamferMode;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B19DD194(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setChamferMode:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_chamferMode != a3)
  {
    self->_chamferMode = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19DB654;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)chamferRadius
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_chamferRadius;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B19DD24C(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setChamferRadius:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_chamferRadius != a3)
  {
    self->_chamferRadius = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19DB794;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("chamferRadius"), v9);
  }
}

- (float)discretizedStraightLineMaxLength
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_discretizedStraightLineMaxLength;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B19DD310(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setDiscretizedStraightLineMaxLength:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_discretizedStraightLineMaxLength != a3)
  {
    self->_discretizedStraightLineMaxLength = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19DB8CC;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (float)extrusionDepth
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  float v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_extrusionDepth;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = sub_1B19DD3D4(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setExtrusionDepth:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_extrusionDepth != a3)
  {
    self->_extrusionDepth = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19DBA0C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("extrusionDepth"), v9);
  }
}

- (int64_t)primitiveType
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  int64_t v32;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_primitiveType;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v32 = (int)sub_1B19DD498(v17, v18, v19, v20, v21, v22, v23, v24);
  if (v16)
    sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
  return v32;
}

- (void)setPrimitiveType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_primitiveType != a3)
  {
    self->_primitiveType = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19DBB38;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (UIBezierPath)path
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  void *path;

  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v8 = objc_msgSend_worldRef(self, v5, v6, v7);
    v16 = v8;
    if (v8)
      sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
    path = (void *)sub_1B18DA46C(v17);
    if (v16)
      sub_1B18797B4(v16, (uint64_t)v5, v6, v7, v18, v19, v20, v21);
  }
  else
  {
    path = self->_path;
  }
  return (UIBezierPath *)(id)objc_msgSend_copy(path, v5, v6, v7);
}

- (void)setPath:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];

  self->_path = (UIBezierPath *)objc_msgSend_copy(a3, v5, v6, v7);
  v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B19DBC70;
  v13[3] = &unk_1E63D5378;
  v13[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- (UIBezierPath)chamferProfile
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  void *chamferProfile;

  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v8 = objc_msgSend_worldRef(self, v5, v6, v7);
    v16 = v8;
    if (v8)
      sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
    chamferProfile = (void *)sub_1B19DD550(v17);
    if (v16)
      sub_1B18797B4(v16, (uint64_t)v5, v6, v7, v18, v19, v20, v21);
  }
  else
  {
    chamferProfile = self->_chamferProfile;
  }
  return (UIBezierPath *)(id)objc_msgSend_copy(chamferProfile, v5, v6, v7);
}

- (void)setChamferProfile:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[5];

  self->_chamferProfile = (UIBezierPath *)objc_msgSend_copy(a3, v5, v6, v7);
  v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B19DBDB4;
  v13[3] = &unk_1E63D5378;
  v13[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- ($C2D7B96093337A7412AA75FC240FE189)params
{
  uint64_t v3;
  uint64_t v4;
  $C2D7B96093337A7412AA75FC240FE189 *result;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  float chamferRadius;
  float discretizedStraightLineMaxLength;
  UIBezierPath *path;
  UIBezierPath *chamferProfile;
  _OWORD v23[2];
  void *v24;

  retstr->var6 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  result = ($C2D7B96093337A7412AA75FC240FE189 *)objc_msgSend_isPresentationObject(self, a3, v3, v4);
  if ((_DWORD)result)
  {
    v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    sub_1B19DCC00(v11, v12, v13, v14, v15, v16, v17, (uint64_t)v23);
    v18 = v23[1];
    *(_OWORD *)&retstr->var0 = v23[0];
    *(_OWORD *)&retstr->var4 = v18;
    retstr->var6 = v24;
  }
  else
  {
    retstr->var0 = self->_primitiveType;
    chamferRadius = self->_chamferRadius;
    retstr->var1 = self->_extrusionDepth;
    retstr->var2 = chamferRadius;
    discretizedStraightLineMaxLength = self->_discretizedStraightLineMaxLength;
    retstr->var3 = self->_chamferMode;
    path = self->_path;
    chamferProfile = self->_chamferProfile;
    retstr->var4 = discretizedStraightLineMaxLength;
    retstr->var5 = path;
    retstr->var6 = chamferProfile;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(VFXShape *)self max:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
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
  int v31;
  _OWORD v33[2];
  uint64_t v34;
  __int128 v35;
  __int128 v36;

  v4 = (_OWORD *)v3;
  v5 = (_OWORD *)v2;
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  DWORD2(v36) = 0;
  *(_QWORD *)&v36 = 0;
  DWORD2(v35) = 0;
  *(_QWORD *)&v35 = 0;
  v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self)
  {
    objc_msgSend_params(self, v16, v17, v18);
  }
  else
  {
    v34 = 0;
    memset(v33, 0, sizeof(v33));
  }
  v31 = sub_1B19DE188(v23, &v36, &v35, (uint64_t)v33, v19, v20, v21, v22);
  if (v31)
  {
    if (v5)
      *v5 = v36;
    if (v4)
      *v4 = v35;
  }
  if (v15)
    sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
  return v31;
}

- (BOOL)getBoundingSphereCenter:(VFXShape *)self radius:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  _OWORD *v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
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
  int v31;
  _OWORD v33[2];
  uint64_t v34;
  __int128 v35;

  v4 = (_DWORD *)v3;
  v5 = (_OWORD *)v2;
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  v35 = 0uLL;
  v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self)
  {
    objc_msgSend_params(self, v16, v17, v18);
  }
  else
  {
    v34 = 0;
    memset(v33, 0, sizeof(v33));
  }
  v31 = sub_1B19DE1D0(v23, &v35, (uint64_t)v33, v18, v19, v20, v21, v22);
  if (v31)
  {
    if (v5)
      *v5 = v35;
    if (v4)
      *v4 = HIDWORD(v35);
  }
  if (v15)
    sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
  return v31;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXShape;
  -[VFXModel dealloc](&v3, sel_dealloc);
}

- (void)_customDecodingOfVFXShape:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v5 = sub_1B18BD870(a3, (uint64_t)CFSTR("chamferProfile"));
  objc_msgSend_setChamferProfile_(self, v6, (uint64_t)v5, v7);
  v8 = sub_1B18BD870(a3, (uint64_t)CFSTR("path"));
  objc_msgSend_setPath_(self, v9, (uint64_t)v8, v10);
}

- (void)_customEncodingOfVFXShape:(id)a3
{
  uint64_t v3;
  uint64_t v6;

  sub_1B18BD778(a3, self->_chamferProfile, (uint64_t)CFSTR("chamferProfile"), v3);
  sub_1B18BD778(a3, self->_path, (uint64_t)CFSTR("path"), v6);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  const char *v23;
  const char *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VFXShape;
  -[VFXModel encodeWithCoder:](&v25, sel_encodeWithCoder_);
  if (objc_msgSend_isPresentationObject(self, v5, v6, v7))
  {
    v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    objc_msgSend__syncObjCModel_(self, v12, v11, v13);
  }
  objc_msgSend__customEncodingOfVFXShape_(self, v8, (uint64_t)a3, v10);
  *(float *)&v14 = self->_chamferRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("chamferRadius"), v16, v14);
  *(float *)&v17 = self->_extrusionDepth;
  objc_msgSend_encodeFloat_forKey_(a3, v18, (uint64_t)CFSTR("extrusionDepth"), v19, v17);
  *(float *)&v20 = self->_discretizedStraightLineMaxLength;
  objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("discretizedStraightLineMaxLength"), v22, v20);
  objc_msgSend_encodeInteger_forKey_(a3, v23, self->_primitiveType, (uint64_t)CFSTR("primitiveType"));
  objc_msgSend_encodeInteger_forKey_(a3, v24, self->_chamferMode, (uint64_t)CFSTR("chamferMode"));
}

- (VFXShape)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXShape *v7;
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
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)VFXShape;
  v7 = -[VFXModel initWithCoder:](&v41, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXShape_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("chamferRadius"), v14);
    objc_msgSend_setChamferRadius_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("extrusionDepth"), v19);
    objc_msgSend_setExtrusionDepth_(v7, v20, v21, v22);
    objc_msgSend_decodeFloatForKey_(a3, v23, (uint64_t)CFSTR("discretizedStraightLineMaxLength"), v24);
    objc_msgSend_setDiscretizedStraightLineMaxLength_(v7, v25, v26, v27);
    v30 = objc_msgSend_decodeIntegerForKey_(a3, v28, (uint64_t)CFSTR("primitiveType"), v29);
    objc_msgSend_setPrimitiveType_(v7, v31, v30, v32);
    v35 = objc_msgSend_decodeIntegerForKey_(a3, v33, (uint64_t)CFSTR("chamferMode"), v34);
    objc_msgSend_setChamferMode_(v7, v36, v35, v37);
    objc_msgSend_setImmediateMode_(VFXTransaction, v38, v8, v39);
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

  if (qword_1ED4CEE50 != -1)
    dispatch_once(&qword_1ED4CEE50, &unk_1E63D14D0);
  v0 = sub_1B179CB90(qword_1ED4CEE58, 0x120uLL);
  sub_1B19DDCF8(v0);
  return v0;
}

@end
