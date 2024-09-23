@implementation PVInstructionGraphRectangleMaskNode

+ (id)newMaskNode:(id)a3 normalizedMaskRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputNode:normalizedMaskRect:", v9, x, y, width, height);

  return v10;
}

- (PVInstructionGraphRectangleMaskNode)initWithInputNode:(id)a3 normalizedMaskRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PVInstructionGraphRectangleMaskNode *v10;
  PVInstructionGraphRectangleMaskNode *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVInstructionGraphRectangleMaskNode;
  v10 = -[PVInstructionGraphNode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PVInstructionGraphRectangleMaskNode setInputNode:](v10, "setInputNode:", v9);
    -[PVInstructionGraphRectangleMaskNode setNormalizedMaskRect:](v11, "setNormalizedMaskRect:", x, y, width, height);
  }

  return v11;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a4;
  -[PVInstructionGraphRectangleMaskNode inputNode](self, "inputNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)a3.m_Obj;
  v9 = v8;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  objc_msgSend(v7, "loadIGNode:returnLoadedEffects:", &v9, v6);
  if (v9)
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 24))(v9);

}

- (void)unloadIGNode
{
  id v2;

  -[PVInstructionGraphRectangleMaskNode inputNode](self, "inputNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadIGNode");

}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGHWMultiBlend **v6;
  HGHWMultiBlend **v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  HGHWMultiBlend *v29;
  HGHWMultiBlend *v30;
  HGSolidColor *v31;
  _BOOL4 v32;
  __n128 v33;
  __n128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  HGCrop *v38;
  double MinX;
  double v40;
  double MinY;
  uint64_t v42;
  HGSolidColor *v43;
  _BOOL4 v44;
  __n128 v45;
  __n128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  HGCrop *v50;
  HGSolidColor *v51;
  _BOOL4 v52;
  __n128 v53;
  __n128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  HGCrop *v58;
  double v59;
  HGSolidColor *v60;
  _BOOL4 v61;
  __n128 v62;
  __n128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  HGCrop *v67;
  HGSolidColor *v68;
  _BOOL4 v69;
  __n128 v70;
  __n128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  HGCrop *v75;
  HGRef<HGNode> v76;
  CGFloat MaxY;
  CGFloat MaxX;
  CGFloat v79;
  uint64_t v80;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v81;
  _BYTE v82[16];
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v82, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphRectangleMaskNode hgNodeForTime:...]");
  -[PVInstructionGraphRectangleMaskNode inputNode](self, "inputNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = *a3;
  v14 = *(_QWORD *)a6.m_Obj;
  v80 = v14;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
  if (v13)
    objc_msgSend(v13, "hgNodeForTime:trackInputs:renderer:igContext:", &v81, a4, a5, &v80);
  else
    *v12 = 0;
  if (v80)
    (*(void (**)(uint64_t))(*(_QWORD *)v80 + 24))(v80);

  v15 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v17 = v16;
  v18 = ((__n128 (*)(_QWORD))*(_QWORD *)(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj).n128_f32[0];
  v19 = v15 * v18;
  v20 = v17 * v18;
  -[PVInstructionGraphRectangleMaskNode denormalizedMaskRectInSize:](self, "denormalizedMaskRectInSize:", v19, v17 * v18);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
  HGHWMultiBlend::HGHWMultiBlend(v29);
  (*(void (**)(HGHWMultiBlend *, _QWORD, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 0, 9.0, 0.0, 0.0, 0.0);
  (*(void (**)(HGHWMultiBlend *, _QWORD, HGHWMultiBlend *))(*(_QWORD *)v29 + 120))(v29, 0, *v12);
  v30 = *v12;
  if (*v12 != v29)
  {
    if (v30)
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v30 + 24))(v30);
    *v12 = v29;
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v29 + 16))(v29);
  }
  if (-[PVInstructionGraphRectangleMaskNode isInverted](self, "isInverted"))
  {
    v31 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v31);
    v32 = -[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled");
    v34.n128_u32[0] = 0;
    if (v32)
    {
      v34.n128_f32[0] = 1.0;
      v33.n128_f32[0] = 0.5;
    }
    else
    {
      v33.n128_f32[0] = 1.0;
    }
    (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v31 + 96))(v31, 0, v34, 0.0, 0.0, v33);
    v84.origin.x = v22;
    v84.origin.y = v24;
    v84.size.width = v26;
    v84.size.height = v28;
    v35 = HGRectMakeWithCGRect(v84);
    v37 = v36;
    v38 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v38);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, (float)(int)v35, (float)SHIDWORD(v35), (float)(int)v37, (float)SHIDWORD(v37));
    (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v38 + 120))(v38, 0, v31);
    (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v29 + 120))(v29, 1, v38);
    (*(void (**)(HGCrop *))(*(_QWORD *)v38 + 24))(v38);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v31 + 24))(v31);
  }
  else
  {
    v85.origin.x = v22;
    v85.origin.y = v24;
    v85.size.width = v26;
    v85.size.height = v28;
    MinX = CGRectGetMinX(v85);
    v86.origin.x = v22;
    v86.origin.y = v24;
    v86.size.width = v26;
    v86.size.height = v28;
    MaxX = CGRectGetMaxX(v86);
    v87.origin.x = v22;
    v87.origin.y = v24;
    v87.size.width = v26;
    v87.size.height = v28;
    v40 = CGRectGetMaxX(v87);
    v88.origin.x = v22;
    v88.origin.y = v24;
    v88.size.width = v26;
    v88.size.height = v28;
    MaxY = CGRectGetMaxY(v88);
    v89.origin.x = v22;
    v89.origin.y = v24;
    v89.size.width = v26;
    v89.size.height = v28;
    v79 = CGRectGetMaxY(v89);
    v90.origin.x = v22;
    v90.origin.y = v24;
    v90.size.width = v26;
    v90.size.height = v28;
    MinY = CGRectGetMinY(v90);
    v42 = 1;
    if (MinX > 0.0 && v20 > 0.0)
    {
      v43 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
      HGSolidColor::HGSolidColor(v43);
      v44 = -[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled");
      v46.n128_u32[0] = 0;
      if (v44)
      {
        v46.n128_f32[0] = 1.0;
        v45.n128_f32[0] = 0.5;
      }
      else
      {
        v45.n128_f32[0] = 1.0;
      }
      (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v43 + 96))(v43, 0, v46, 0.0, 0.0, v45);
      v91.origin.x = 0.0;
      v91.origin.y = 0.0;
      v91.size.width = MinX;
      v91.size.height = v20;
      v47 = HGRectMakeWithCGRect(v91);
      v49 = v48;
      v50 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v50);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v50 + 96))(v50, 0, (float)(int)v47, (float)SHIDWORD(v47), (float)(int)v49, (float)SHIDWORD(v49));
      (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v50 + 120))(v50, 0, v43);
      (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v29 + 120))(v29, 1, v50);
      (*(void (**)(HGCrop *))(*(_QWORD *)v50 + 24))(v50);
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v43 + 24))(v43);
      v42 = 2;
    }
    if (v19 - v40 > 0.0 && v20 > 0.0)
    {
      v51 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
      HGSolidColor::HGSolidColor(v51);
      v52 = -[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled");
      v54.n128_u32[0] = 0;
      if (v52)
      {
        v54.n128_f32[0] = 1.0;
        v53.n128_f32[0] = 0.5;
      }
      else
      {
        v53.n128_f32[0] = 1.0;
      }
      (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v51 + 96))(v51, 0, v54, 0.0, 0.0, v53);
      v92.origin.y = 0.0;
      v92.origin.x = MaxX;
      v92.size.width = v19 - v40;
      v92.size.height = v20;
      v55 = HGRectMakeWithCGRect(v92);
      v57 = v56;
      v58 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v58);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 0, (float)(int)v55, (float)SHIDWORD(v55), (float)(int)v57, (float)SHIDWORD(v57));
      (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v58 + 120))(v58, 0, v51);
      (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v29 + 120))(v29, v42, v58);
      (*(void (**)(HGCrop *))(*(_QWORD *)v58 + 24))(v58);
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v51 + 24))(v51);
      v42 = (v42 + 1);
    }
    if (v19 > 0.0)
    {
      v59 = v20 - v79;
      if (v59 > 0.0)
      {
        v60 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v60);
        v61 = -[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled");
        v63.n128_u32[0] = 0;
        if (v61)
        {
          v63.n128_f32[0] = 1.0;
          v62.n128_f32[0] = 0.5;
        }
        else
        {
          v62.n128_f32[0] = 1.0;
        }
        (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v60 + 96))(v60, 0, v63, 0.0, 0.0, v62);
        v93.origin.x = 0.0;
        v93.origin.y = MaxY;
        v93.size.width = v19;
        v93.size.height = v59;
        v64 = HGRectMakeWithCGRect(v93);
        v66 = v65;
        v67 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v67);
        (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v67 + 96))(v67, 0, (float)(int)v64, (float)SHIDWORD(v64), (float)(int)v66, (float)SHIDWORD(v66));
        (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v67 + 120))(v67, 0, v60);
        (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v29 + 120))(v29, v42, v67);
        (*(void (**)(HGCrop *))(*(_QWORD *)v67 + 24))(v67);
        (*(void (**)(HGSolidColor *))(*(_QWORD *)v60 + 24))(v60);
        v42 = (v42 + 1);
      }
    }
    if (v19 > 0.0 && MinY > 0.0)
    {
      v68 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
      HGSolidColor::HGSolidColor(v68);
      v69 = -[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled");
      v71.n128_u32[0] = 0;
      if (v69)
      {
        v71.n128_f32[0] = 1.0;
        v70.n128_f32[0] = 0.5;
      }
      else
      {
        v70.n128_f32[0] = 1.0;
      }
      (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v68 + 96))(v68, 0, v71, 0.0, 0.0, v70);
      v94.origin.x = 0.0;
      v94.origin.y = 0.0;
      v94.size.width = v19;
      v94.size.height = MinY;
      v72 = HGRectMakeWithCGRect(v94);
      v74 = v73;
      v75 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v75);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v75 + 96))(v75, 0, (float)(int)v72, (float)SHIDWORD(v72), (float)(int)v74, (float)SHIDWORD(v74));
      (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v75 + 120))(v75, 0, v68);
      (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v29 + 120))(v29, v42, v75);
      (*(void (**)(HGCrop *))(*(_QWORD *)v75 + 24))(v75);
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v68 + 24))(v68);
    }
  }
  (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v29 + 24))(v29);
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v82);
  return v76;
}

- (id)requiredSourceTrackIDs
{
  void *v2;
  void *v3;

  -[PVInstructionGraphRectangleMaskNode inputNode](self, "inputNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requiredSourceTrackIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAllSourceNodes
{
  void *v2;
  void *v3;

  -[PVInstructionGraphRectangleMaskNode inputNode](self, "inputNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getAllSourceNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PCRect<double> result;

  v6 = v4;
  v7 = (*(double (**)(_QWORD, SEL, id))(**(_QWORD **)a4.m_Obj + 40))(*(_QWORD *)a4.m_Obj, a2, a3);
  v9 = v8;
  v10 = (*(float (**)(_QWORD))(**(_QWORD **)a4.m_Obj + 48))(*(_QWORD *)a4.m_Obj);
  v13 = v7 * v10;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 0;
  v14 = v9 * v10;
  *(double *)(v6 + 16) = v13;
  *(double *)(v6 + 24) = v14;
  result.var3 = v12;
  result.var2 = v11;
  result.var1 = v13;
  result.var0 = v14;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float64x2_t v15;
  PCMatrix44Tmpl<double> *result;
  id v17;

  v17 = a4;
  v7 = (*(double (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 40))(*(_QWORD *)a5.m_Obj);
  v9 = v8;
  v10 = (*(float (**)(_QWORD))(**(_QWORD **)a5.m_Obj + 48))(*(_QWORD *)a5.m_Obj);
  objc_msgSend(v17, "outputSize");
  v11 = v9;
  v12 = (float)(v10 * v11);
  v13 = v7;
  *(float *)&v7 = v10 * v13;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  *(float *)&v14 = v12 / v14;
  v15 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, *(float *)&v14, (float)-*(float *)&v14, 1.0);
  v15.f64[0] = *(float *)&v7 * 0.5;
  PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v15, v12 * 0.5, 0.0);

  return result;
}

- (CGRect)denormalizedMaskRectInSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[PVInstructionGraphRectangleMaskNode normalizedMaskRect](self, "normalizedMaskRect");
  v6 = width * v5;
  v8 = height * v7;
  v10 = width * v9;
  v12 = height * v11;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (BOOL)isInverted
{
  return self->_isInverted;
}

- (void)setIsInverted:(BOOL)a3
{
  self->_isInverted = a3;
}

- (PVInstructionGraphNode)inputNode
{
  return self->_inputNode;
}

- (void)setInputNode:(id)a3
{
  objc_storeStrong((id *)&self->_inputNode, a3);
}

- (CGRect)normalizedMaskRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedMaskRect.origin.x;
  y = self->_normalizedMaskRect.origin.y;
  width = self->_normalizedMaskRect.size.width;
  height = self->_normalizedMaskRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedMaskRect:(CGRect)a3
{
  self->_normalizedMaskRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputNode, 0);
}

@end
