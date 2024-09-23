@implementation VFXText

- (void)_syncObjCModel:(__CFXTextGeometry *)a3
{
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
  const char *v34;
  uint64_t v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  UIFont *v39;
  id v40;
  UIBezierPath *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)VFXText;
  -[VFXModel _syncObjCModel](&v42, sel__syncObjCModel);
  self->_primitiveType = (int)sub_1B19DD498((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
  self->_flatness = sub_1B19DD6A8((uint64_t)a3);
  self->_chamferRadius = sub_1B19DD24C((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
  self->_extrusionDepth = sub_1B19DD3D4((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);
  self->_chamferProfile = (UIBezierPath *)sub_1B19DD550((uint64_t)a3);
  self->_discretizedStraightLineMaxLength = sub_1B19DD310((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
  self->_alignmentMode = sub_1B19DD6EC((uint64_t)a3);
  self->_truncationMode = sub_1B19DD6F4((uint64_t)a3);
  self->_string = (id)sub_1B19DD6DC((uint64_t)a3);
  v33 = sub_1B19DD6E4((uint64_t)a3);
  self->_font = (UIFont *)objc_msgSend_patchFont_(self, v34, v33, v35);
  self->_useCustomContainerFrame = sub_1B19DD180((uint64_t)a3);
  self->_customContainerFrame.origin.x = sub_1B19DD188((uint64_t)a3);
  self->_customContainerFrame.origin.y = v36;
  self->_customContainerFrame.size.width = v37;
  self->_customContainerFrame.size.height = v38;
  self->_wrapped = sub_1B19DD6FC((uint64_t)a3);
  self->__wantsSeparateGeometryElements = sub_1B19DDA98((uint64_t)a3);
  v39 = self->_font;
  v40 = self->_string;
  v41 = self->_chamferProfile;
}

- (VFXText)init
{
  const void *v3;
  VFXText *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXText *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v3 = (const void *)-[VFXText __createCFObject]_0();
  v13.receiver = self;
  v13.super_class = (Class)VFXText;
  v4 = -[VFXModel initWithGeometryRef:](&v13, sel_initWithGeometryRef_, v3);
  v8 = v4;
  if (v4)
  {
    v9 = objc_msgSend_geometryRef(v4, v5, v6, v7);
    objc_msgSend__syncObjCModel_(v8, v10, v9, v11);
  }
  CFRelease(v3);
  return v8;
}

- (VFXText)initWithTextGeometryRef:(__CFXTextGeometry *)a3
{
  VFXText *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXText *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXText;
  v3 = -[VFXModel initWithGeometryRef:](&v12, sel_initWithGeometryRef_, a3);
  v7 = v3;
  if (v3)
  {
    v8 = objc_msgSend_geometryRef(v3, v4, v5, v6);
    objc_msgSend__syncObjCModel_(v7, v9, v8, v10);
  }
  return v7;
}

- (id)initPresentationTextGeometryWithTextGeometryRef:(__CFXTextGeometry *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXText;
  return -[VFXModel initPresentationModelWithGeometryRef:](&v4, sel_initPresentationModelWithGeometryRef_, a3);
}

- (id)presentationModel
{
  VFXText *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v3 = [VFXText alloc];
  v7 = objc_msgSend_geometryRef(self, v4, v5, v6);
  return (id)objc_msgSend_initPresentationTextGeometryWithTextGeometryRef_(v3, v8, v7, v9);
}

- (id)copyAnimationPathForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B18C2DEC(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

+ (id)text
{
  uint64_t v2;
  double v3;

  LODWORD(v3) = 0;
  return (id)objc_msgSend_textWithString_extrusionDepth_(a1, a2, 0, v2, v3);
}

+ (id)textWithString:(id)a3 extrusionDepth:(float)a4
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
  objc_msgSend_setString_(v6, v11, (uint64_t)a3, v12);
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
  v10 = objc_msgSend_string(self, v7, v8, v9);
  objc_msgSend_extrusionDepth(self, v11, v12, v13);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("<%@ | string=%@ extrusionDepth=%.3f> "), v16, v6, v10, v14);
}

- (void)_setupObjCModelFrom:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t isWrapped;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)VFXText;
  -[VFXModel _setupObjCModelFrom:](&v62, sel__setupObjCModelFrom_);
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v13 = objc_msgSend_font(a3, v10, v11, v12);
  objc_msgSend_setFont_(self, v14, v13, v15);
  objc_msgSend_containerFrame(a3, v16, v17, v18);
  if (v22 != 0.0)
  {
    objc_msgSend_containerFrame(a3, v19, v20, v21);
    objc_msgSend_setContainerFrame_(self, v23, v24, v25);
  }
  v26 = objc_msgSend_truncationMode(a3, v19, v20, v21);
  objc_msgSend_setTruncationMode_(self, v27, v26, v28);
  v32 = objc_msgSend_alignmentMode(a3, v29, v30, v31);
  objc_msgSend_setAlignmentMode_(self, v33, v32, v34);
  objc_msgSend_flatness(a3, v35, v36, v37);
  objc_msgSend_setFlatness_(self, v38, v39, v40);
  isWrapped = objc_msgSend_isWrapped(a3, v41, v42, v43);
  objc_msgSend_setWrapped_(self, v45, isWrapped, v46);
  objc_msgSend_chamferRadius(a3, v47, v48, v49);
  objc_msgSend_setChamferRadius_(self, v50, v51, v52);
  v56 = objc_msgSend_chamferProfile(a3, v53, v54, v55);
  objc_msgSend_setChamferProfile_(self, v57, v56, v58);
  objc_msgSend_commitImmediate(VFXTransaction, v59, v60, v61);
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
  const char *v13;
  uint64_t v14;
  id v16;

  v5 = objc_msgSend_string(self, a2, (uint64_t)a3, v3);
  objc_msgSend_extrusionDepth(self, v6, v7, v8);
  v16 = (id)objc_msgSend_textWithString_extrusionDepth_(VFXText, v9, v5, v10);
  objc_msgSend__setupObjCModelFrom_(v16, v11, (uint64_t)self, v12);
  objc_msgSend__copyAttributesTo_(self, v13, (uint64_t)v16, v14);
  return v16;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (BOOL)_wantsSeparateGeometryElements
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
  char v25;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->__wantsSeparateGeometryElements;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v25 = sub_1B19DDA98(v17);
  if (v16)
    sub_1B18797B4(v16, v18, v19, v20, v21, v22, v23, v24);
  return v25;
}

- (void)set_wantsSeparateGeometryElements:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->__wantsSeparateGeometryElements != a3)
  {
    self->__wantsSeparateGeometryElements = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19D5840;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
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
  float v5;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  v5 = fmaxf(a3, 0.0);
  if (v5 != self->_chamferRadius)
  {
    self->_chamferRadius = v5;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19D5984;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = v5;
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
  float v5;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  v5 = fmaxf(a3, 0.0);
  if (v5 != self->_discretizedStraightLineMaxLength)
  {
    self->_discretizedStraightLineMaxLength = v5;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19D5AC0;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = v5;
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
  float v5;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  v5 = fmaxf(a3, 0.0);
  if (v5 != self->_extrusionDepth)
  {
    self->_extrusionDepth = v5;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19D5C04;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = v5;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, CFSTR("extrusionDepth"), v9);
  }
}

- (float)flatness
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
  float v25;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_flatness;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v25 = sub_1B19DD6A8(v17);
  if (v16)
    sub_1B18797B4(v16, v18, v19, v20, v21, v22, v23, v24);
  return v25;
}

- (void)setFlatness:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  float v10;

  if (self->_flatness != a3)
  {
    self->_flatness = a3;
    v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B19D5D3C;
    v9[3] = &unk_1E63D53A0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
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
    v8[2] = sub_1B19D5E68;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (id)string
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
  void *string;

  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v8 = objc_msgSend_worldRef(self, v5, v6, v7);
    v16 = v8;
    if (v8)
      sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
    string = (void *)sub_1B19DD6DC(v17);
    if (v16)
      sub_1B18797B4(v16, (uint64_t)v5, v6, v7, v18, v19, v20, v21);
  }
  else
  {
    string = self->_string;
  }
  return (id)objc_msgSend_copy(string, v5, v6, v7);
}

- (void)setString:(id)a3
{
  id string;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];

  string = self->_string;
  if (string != a3)
  {

    self->_string = (id)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B19D5FA8;
    v14[3] = &unk_1E63D5378;
    v14[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (BOOL)isWrapped
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
  char v25;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
    return self->_wrapped;
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v25 = sub_1B19DD6FC(v17);
  if (v16)
    sub_1B18797B4(v16, v18, v19, v20, v21, v22, v23, v24);
  return v25;
}

- (void)setWrapped:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_wrapped != a3)
  {
    self->_wrapped = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19D60EC;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (id)patchFont:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;

  v4 = a3;
  if (!a3)
    return v4;
  v5 = (void *)objc_msgSend_fontName(a3, a2, (uint64_t)a3, v3);
  if (objc_msgSend_hasPrefix_(v5, v6, (uint64_t)CFSTR(".SFUI"), v7))
  {
    v11 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend_pointSize(v4, v8, v9, v10);
    v4 = (void *)objc_msgSend_fontWithName_size_(v11, v12, (uint64_t)CFSTR("HelveticaNeue"), v13);
    if (!v4)
      return v4;
  }
  v14 = (void *)objc_msgSend_fontName(v4, v8, v9, v10);
  if (!objc_msgSend_hasPrefix_(v14, v15, (uint64_t)CFSTR(".SFNS"), v16))
    return v4;
  v20 = (void *)MEMORY[0x1E0DC37E8];
  objc_msgSend_pointSize(v4, v17, v18, v19);
  return (id)objc_msgSend_fontWithName_size_(v20, v21, (uint64_t)CFSTR("HelveticaNeue"), v22);
}

- (UIFont)font
{
  uint64_t v2;
  uint64_t v3;
  uint64_t isPresentationObject;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  UIFont *font;

  isPresentationObject = objc_msgSend_isPresentationObject(self, a2, v2, v3);
  if ((_DWORD)isPresentationObject)
  {
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v17 = v9;
    if (v9)
      sub_1B187973C(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
    v18 = objc_msgSend_geometryRef(self, v10, v11, v12);
    isPresentationObject = sub_1B19DD6E4(v18);
    font = (UIFont *)isPresentationObject;
    if (v17)
      isPresentationObject = sub_1B18797B4(v17, (uint64_t)v6, v7, v8, v19, v20, v21, v22);
    if (font)
      return font;
  }
  else
  {
    font = self->_font;
    if (font)
      return font;
  }
  return (UIFont *)sub_1B19DDA80(isPresentationObject, v6, v7, v8);
}

- (void)setFont:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if (self->_font != a3)
  {
    v5 = (void *)objc_msgSend_patchFont_(self, a2, (uint64_t)a3, v3);

    self->_font = (UIFont *)v5;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B19D62E0;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (CGRect)containerFrame
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
  char v18;
  const char *v19;
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
  double x;
  double v31;
  CGFloat y;
  double v33;
  CGFloat width;
  double v35;
  CGFloat height;
  CGRect *p_customContainerFrame;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect result;

  if (!objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    if (self->_useCustomContainerFrame)
    {
      p_customContainerFrame = &self->_customContainerFrame;
LABEL_11:
      x = p_customContainerFrame->origin.x;
      y = p_customContainerFrame->origin.y;
      width = p_customContainerFrame->size.width;
      height = p_customContainerFrame->size.height;
      goto LABEL_12;
    }
LABEL_10:
    p_customContainerFrame = (CGRect *)MEMORY[0x1E0C9D648];
    goto LABEL_11;
  }
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v16 = v8;
  if (v8)
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
  v17 = objc_msgSend_geometryRef(self, v9, v10, v11);
  v18 = sub_1B19DD180(v17);
  v22 = objc_msgSend_geometryRef(self, v19, v20, v21);
  x = sub_1B19DD188(v22);
  y = v31;
  width = v33;
  height = v35;
  if (v16)
    sub_1B18797B4(v16, v23, v24, v25, v26, v27, v28, v29);
  if ((v18 & 1) == 0)
    goto LABEL_10;
LABEL_12:
  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)setContainerFrame:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->_useCustomContainerFrame || !CGRectEqualToRect(self->_customContainerFrame, a3))
  {
    self->_useCustomContainerFrame = 1;
    self->_customContainerFrame.origin.x = x;
    self->_customContainerFrame.origin.y = y;
    self->_customContainerFrame.size.width = width;
    self->_customContainerFrame.size.height = height;
    v10 = objc_msgSend_worldRef(self, a2, v3, v4);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B19D64CC;
    v12[3] = &unk_1E63D5378;
    v12[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (NSString)truncationMode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
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
  int truncationMode;

  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v12 = objc_msgSend_worldRef(self, v5, v6, v7);
    v20 = v12;
    if (v12)
      sub_1B187973C(v12, (uint64_t)v13, v14, v15, v16, v17, v18, v19);
    v21 = objc_msgSend_geometryRef(self, v13, v14, v15);
    truncationMode = sub_1B19DD6F4(v21);
    if (v20)
      sub_1B18797B4(v20, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    truncationMode = self->_truncationMode;
  }
  return (NSString *)sub_1B19D6584(truncationMode, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
}

- (void)setTruncationMode:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[5];
  int v17;

  if ((objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x1E0CD31A0], v3) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD31A8], v8) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD3190], v8) & 1) != 0)
  {
    v9 = 2;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD3198], v8) & 1) == 0)
    {
      sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Unknown truncation mode %@"), v7, v8, v10, v11, v12, v13, (uint64_t)a3);
LABEL_2:
      v9 = 0;
      goto LABEL_9;
    }
    v9 = 3;
  }
LABEL_9:
  if (self->_truncationMode != v9)
  {
    self->_truncationMode = v9;
    v14 = objc_msgSend_worldRef(self, v6, v7, v8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B19D6734;
    v16[3] = &unk_1E63D53A0;
    v16[4] = self;
    v17 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (NSString)alignmentMode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
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
  int alignmentMode;

  if (objc_msgSend_isPresentationObject(self, a2, v2, v3))
  {
    v12 = objc_msgSend_worldRef(self, v5, v6, v7);
    v20 = v12;
    if (v12)
      sub_1B187973C(v12, (uint64_t)v13, v14, v15, v16, v17, v18, v19);
    v21 = objc_msgSend_geometryRef(self, v13, v14, v15);
    alignmentMode = sub_1B19DD6EC(v21);
    if (v20)
      sub_1B18797B4(v20, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    alignmentMode = self->_alignmentMode;
  }
  return (NSString *)sub_1B19D67C8(alignmentMode, (uint64_t)v5, v6, v7, v8, v9, v10, v11);
}

- (void)setAlignmentMode:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[5];
  int v17;

  if ((objc_msgSend_isEqualToString_(a3, a2, *MEMORY[0x1E0CD2908], v3) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD2900], v8) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD2910], v8) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD28F0], v8) & 1) != 0)
  {
    v9 = 3;
  }
  else
  {
    if ((objc_msgSend_isEqualToString_(a3, v6, *MEMORY[0x1E0CD28F8], v8) & 1) == 0)
    {
      sub_1B17C4408(0, (uint64_t)CFSTR("Warning: Unknown alignment mode %@"), v7, v8, v10, v11, v12, v13, (uint64_t)a3);
LABEL_2:
      v9 = 0;
      goto LABEL_11;
    }
    v9 = 4;
  }
LABEL_11:
  if (self->_alignmentMode != v9)
  {
    self->_alignmentMode = v9;
    v14 = objc_msgSend_worldRef(self, v6, v7, v8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B19D69A4;
    v16[3] = &unk_1E63D53A0;
    v16[4] = self;
    v17 = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
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
  _QWORD v13[6];

  self->_chamferProfile = (UIBezierPath *)objc_msgSend_copy(a3, v5, v6, v7);
  v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B19D6ADC;
  v13[3] = &unk_1E63D53C8;
  v13[4] = self;
  v13[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- ($2665043C3412C69D6F3E8E948F5DACCA)params
{
  uint64_t v3;
  uint64_t v4;
  $2665043C3412C69D6F3E8E948F5DACCA *result;
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
  __int128 v19;
  __int128 v20;
  float chamferRadius;
  CGPoint origin;
  UIBezierPath *chamferProfile;
  UIFont *font;
  _OWORD v25[7];

  *(_OWORD *)&retstr->var7.origin.y = 0u;
  *(_OWORD *)&retstr->var7.size.height = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0.var4 = 0u;
  *(_OWORD *)&retstr->var0.var6 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  result = ($2665043C3412C69D6F3E8E948F5DACCA *)objc_msgSend_isPresentationObject(self, a3, v3, v4);
  if ((_DWORD)result)
  {
    v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    sub_1B19DCE90(v11, v12, v13, v14, v15, v16, v17, (uint64_t)v25);
    v18 = v25[5];
    *(_OWORD *)&retstr->var5 = v25[4];
    *(_OWORD *)&retstr->var7.origin.y = v18;
    *(_OWORD *)&retstr->var7.size.height = v25[6];
    v19 = v25[1];
    *(_OWORD *)&retstr->var0.var0 = v25[0];
    *(_OWORD *)&retstr->var0.var4 = v19;
    v20 = v25[3];
    *(_OWORD *)&retstr->var0.var6 = v25[2];
    *(_OWORD *)&retstr->var2 = v20;
  }
  else
  {
    chamferRadius = self->_chamferRadius;
    retstr->var0.var1 = self->_extrusionDepth;
    retstr->var0.var2 = chamferRadius;
    retstr->var0.var4 = self->_discretizedStraightLineMaxLength;
    origin = self->_customContainerFrame.origin;
    retstr->var7.size = self->_customContainerFrame.size;
    retstr->var0.var0 = self->_primitiveType;
    chamferProfile = self->_chamferProfile;
    retstr->var0.var5 = 0;
    retstr->var0.var6 = chamferProfile;
    retstr->var0.var3 = 0;
    font = self->_font;
    retstr->var1 = self->_string;
    retstr->var2 = font;
    LODWORD(font) = self->_truncationMode;
    retstr->var3 = self->_alignmentMode;
    retstr->var4 = (int)font;
    retstr->var5 = self->_wrapped;
    retstr->var6 = self->_useCustomContainerFrame;
    retstr->var7.origin = origin;
    retstr->var8 = self->_flatness;
  }
  return result;
}

- (BOOL)getBoundingBoxMin:(VFXText *)self max:(SEL)a2
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
  _OWORD v33[7];
  __int128 v34;
  __int128 v35;

  v4 = (_OWORD *)v3;
  v5 = (_OWORD *)v2;
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  DWORD2(v35) = 0;
  *(_QWORD *)&v35 = 0;
  DWORD2(v34) = 0;
  *(_QWORD *)&v34 = 0;
  v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self)
    objc_msgSend_params(self, v16, v17, v18);
  else
    memset(v33, 0, sizeof(v33));
  v31 = sub_1B19DE3DC(v23, &v35, &v34, v33, v19, v20, v21, v22);
  if (v31)
  {
    if (v5)
      *v5 = v35;
    if (v4)
      *v4 = v34;
  }
  if (v15)
    sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
  return v31;
}

- (BOOL)getBoundingSphereCenter:(VFXText *)self radius:(SEL)a2
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
  _OWORD v33[7];
  __int128 v34;

  v4 = (_DWORD *)v3;
  v5 = (_OWORD *)v2;
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  v34 = 0uLL;
  v23 = objc_msgSend_geometryRef(self, v8, v9, v10);
  if (self)
    objc_msgSend_params(self, v16, v17, v18);
  else
    memset(v33, 0, sizeof(v33));
  v31 = sub_1B19DE434(v23, &v34, v33, v18, v19, v20, v21, v22);
  if (v31)
  {
    if (v5)
      *v5 = v34;
    if (v4)
      *v4 = HIDWORD(v34);
  }
  if (v15)
    sub_1B18797B4(v15, v24, v25, v26, v27, v28, v29, v30);
  return v31;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXText;
  -[VFXModel dealloc](&v3, sel_dealloc);
}

- (void)_customDecodingOfVFXText:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v5 = sub_1B18BD870(a3, (uint64_t)CFSTR("chamferProfile"));
  objc_msgSend_setChamferProfile_(self, v6, (uint64_t)v5, v7);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  v10 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v54, 2);
  v13 = (void *)objc_msgSend_setWithArray_(v8, v11, v10, v12);
  v14 = sub_1B18BDB20(a3, (uint64_t)CFSTR("string"), v13);
  objc_msgSend_setString_(self, v15, v14, v16);
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v21 = (void *)objc_msgSend_setWithObject_(v17, v19, v18, v20);
  v22 = sub_1B18BDB20(a3, (uint64_t)CFSTR("font"), v21);
  v25 = objc_msgSend_patchFont_(self, v23, v22, v24);
  objc_msgSend_setFont_(self, v26, v25, v27);
  v30 = objc_msgSend_decodeIntegerForKey_(a3, v28, (uint64_t)CFSTR("alignmentMode"), v29);
  v38 = sub_1B19D67C8(v30, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_setAlignmentMode_(self, v39, v38, v40);
  v43 = objc_msgSend_decodeIntegerForKey_(a3, v41, (uint64_t)CFSTR("truncationMode"), v42);
  v51 = sub_1B19D6584(v43, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_setTruncationMode_(self, v52, v51, v53);
}

- (void)_customEncodingOfVFXText:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;

  sub_1B18BD778(a3, self->_chamferProfile, (uint64_t)CFSTR("chamferProfile"), v3);
  sub_1B18BDAB8(a3, (const char *)self->_string, (uint64_t)CFSTR("string"));
  sub_1B18BDAB8(a3, (const char *)self->_font, (uint64_t)CFSTR("font"));
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_alignmentMode, (uint64_t)CFSTR("alignmentMode"));
  objc_msgSend_encodeInteger_forKey_(a3, v7, self->_truncationMode, (uint64_t)CFSTR("truncationMode"));
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
  double v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)VFXText;
  -[VFXModel encodeWithCoder:](&v35, sel_encodeWithCoder_);
  if (objc_msgSend_isPresentationObject(self, v5, v6, v7))
  {
    v11 = objc_msgSend_geometryRef(self, v8, v9, v10);
    objc_msgSend__syncObjCModel_(self, v12, v11, v13);
  }
  objc_msgSend__customEncodingOfVFXText_(self, v8, (uint64_t)a3, v10);
  *(float *)&v14 = self->_flatness;
  objc_msgSend_encodeFloat_forKey_(a3, v15, (uint64_t)CFSTR("flatness"), v16, v14);
  *(float *)&v17 = self->_chamferRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v18, (uint64_t)CFSTR("chamferRadius"), v19, v17);
  *(float *)&v20 = self->_extrusionDepth;
  objc_msgSend_encodeFloat_forKey_(a3, v21, (uint64_t)CFSTR("extrusionDepth"), v22, v20);
  *(float *)&v23 = self->_discretizedStraightLineMaxLength;
  objc_msgSend_encodeFloat_forKey_(a3, v24, (uint64_t)CFSTR("discretizedStraightLineMaxLength"), v25, v23);
  objc_msgSend_encodeInteger_forKey_(a3, v26, self->_primitiveType, (uint64_t)CFSTR("primitiveType"));
  objc_msgSend_encodeBool_forKey_(a3, v27, self->_wrapped, (uint64_t)CFSTR("wrapped"));
  objc_msgSend_encodeBool_forKey_(a3, v28, self->_useCustomContainerFrame, (uint64_t)CFSTR("useCustomContainerFrame"));
  v32 = objc_msgSend_valueWithCGRect_(MEMORY[0x1E0CB3B18], v29, v30, v31, self->_customContainerFrame.origin.x, self->_customContainerFrame.origin.y, self->_customContainerFrame.size.width, self->_customContainerFrame.size.height);
  objc_msgSend_encodeObject_forKey_(a3, v33, v32, (uint64_t)CFSTR("customContainerFrame"));
  objc_msgSend_encodeBool_forKey_(a3, v34, self->__wantsSeparateGeometryElements, (uint64_t)CFSTR("_wantsSeparateGeometryElements"));
}

- (VFXText)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXText *v7;
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
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  objc_super v63;

  v63.receiver = self;
  v63.super_class = (Class)VFXText;
  v7 = -[VFXModel initWithCoder:](&v63, sel_initWithCoder_);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXText_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, (uint64_t)CFSTR("flatness"), v14);
    objc_msgSend_setFlatness_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, (uint64_t)CFSTR("chamferRadius"), v19);
    objc_msgSend_setChamferRadius_(v7, v20, v21, v22);
    objc_msgSend_decodeFloatForKey_(a3, v23, (uint64_t)CFSTR("extrusionDepth"), v24);
    objc_msgSend_setExtrusionDepth_(v7, v25, v26, v27);
    objc_msgSend_decodeFloatForKey_(a3, v28, (uint64_t)CFSTR("discretizedStraightLineMaxLength"), v29);
    objc_msgSend_setDiscretizedStraightLineMaxLength_(v7, v30, v31, v32);
    v35 = objc_msgSend_decodeIntegerForKey_(a3, v33, (uint64_t)CFSTR("primitiveType"), v34);
    objc_msgSend_setPrimitiveType_(v7, v36, v35, v37);
    v40 = objc_msgSend_decodeBoolForKey_(a3, v38, (uint64_t)CFSTR("wrapped"), v39);
    objc_msgSend_setWrapped_(v7, v41, v40, v42);
    v7->_useCustomContainerFrame = objc_msgSend_decodeBoolForKey_(a3, v43, (uint64_t)CFSTR("useCustomContainerFrame"), v44);
    v45 = objc_opt_class();
    v47 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v46, v45, (uint64_t)CFSTR("customContainerFrame"));
    objc_msgSend_CGRectValue(v47, v48, v49, v50);
    v7->_customContainerFrame.origin.x = v51;
    v7->_customContainerFrame.origin.y = v52;
    v7->_customContainerFrame.size.width = v53;
    v7->_customContainerFrame.size.height = v54;
    v57 = objc_msgSend_decodeBoolForKey_(a3, v55, (uint64_t)CFSTR("_wantsSeparateGeometryElements"), v56);
    objc_msgSend_set_wantsSeparateGeometryElements_(v7, v58, v57, v59);
    objc_msgSend_setImmediateMode_(VFXTransaction, v60, v8, v61);
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
  _OWORD *v1;
  __int128 v2;

  if (qword_1ED4CEE88 != -1)
    dispatch_once(&qword_1ED4CEE88, &unk_1E63D1530);
  v0 = sub_1B179CB90(qword_1ED4CEE90, 0x168uLL);
  sub_1B19DDCF8(v0);
  *(_WORD *)(v0 + 336) = 0;
  v1 = (_OWORD *)MEMORY[0x1E0C9D648];
  *(_OWORD *)(v0 + 304) = 0u;
  *(_OWORD *)(v0 + 320) = 0u;
  v2 = v1[1];
  *(_OWORD *)(v0 + 344) = *v1;
  *(_OWORD *)(v0 + 360) = v2;
  *(_BYTE *)(v0 + 338) = 0;
  sub_1B17A1BF4(v0, (uint64_t)sub_1B19DCC78);
  return v0;
}

@end
