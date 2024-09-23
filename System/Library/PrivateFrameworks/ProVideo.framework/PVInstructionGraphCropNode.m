@implementation PVInstructionGraphCropNode

+ (id)newCropNode:(id)a3 normalizedCropRect:(CGRect)a4
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
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInputNode:normalizedCropRect:", v9, x, y, width, height);

  return v10;
}

- (PVInstructionGraphCropNode)initWithInputNode:(id)a3 normalizedCropRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PVInstructionGraphCropNode *v10;
  PVInstructionGraphCropNode *v11;
  objc_super v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVInstructionGraphCropNode;
  v10 = -[PVInstructionGraphNode init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PVInstructionGraphCropNode setInputNode:](v10, "setInputNode:", v9);
    -[PVInstructionGraphCropNode setNormalizedCropRect:](v11, "setNormalizedCropRect:", x, y, width, height);
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
  -[PVInstructionGraphCropNode inputNode](self, "inputNode");
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

  -[PVInstructionGraphCropNode inputNode](self, "inputNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadIGNode");

}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGCrop **v6;
  HGCrop **v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  HGCrop *v24;
  HGCrop *v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  HGSolidColor *v32;
  HGSolidColor *v33;
  HGHWMultiBlend *v34;
  HGCrop *v35;
  HGRef<HGNode> v36;
  uint64_t v37;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v38;
  _BYTE v39[16];
  HGRect v41;
  HGRect v42;
  CGRect v43;

  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v39, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphCropNode hgNodeForTime:...]");
  -[PVInstructionGraphCropNode inputNode](self, "inputNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *a3;
  v14 = *(_QWORD *)a6.m_Obj;
  v37 = v14;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
  if (v13)
    objc_msgSend(v13, "hgNodeForTime:trackInputs:renderer:igContext:", &v38, a4, a5, &v37);
  else
    *v12 = 0;
  if (v37)
    (*(void (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);

  v15 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v17 = v16;
  v18 = ((__n128 (*)(_QWORD))*(_QWORD *)(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj).n128_f32[0];
  v19 = v15 * v18;
  v20 = v17 * v18;
  -[PVInstructionGraphCropNode denormalizedCropRectInSize:](self, "denormalizedCropRectInSize:", v19, v20);
  v21 = HGRectMakeWithCGRect(v43);
  v23 = v22;
  v24 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v24);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 0, (float)(int)v21, (float)SHIDWORD(v21), (float)(int)v23, (float)SHIDWORD(v23));
  (*(void (**)(HGCrop *, _QWORD, HGCrop *))(*(_QWORD *)v24 + 120))(v24, 0, *v12);
  v25 = *v12;
  if (*v12 != v24)
  {
    if (v25)
      (*(void (**)(HGCrop *))(*(_QWORD *)v25 + 24))(v25);
    *v12 = v24;
    (*(void (**)(HGCrop *))(*(_QWORD *)v24 + 16))(v24);
  }
  if (-[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled"))
  {
    v27 = v19;
    v28 = v20;
    v29 = HGRectMake4f(v26, 0.0, 0.0, v27, v28);
    v31 = v30;
    v32 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v41.var0 = v29;
    *(_QWORD *)&v41.var2 = v31;
    HGSolidColor::HGSolidColor(v32, v41);
    (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v32 + 96))(v32, 0, 0.3, 0.3, 0.3, 1.0);
    v33 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v42.var0 = v21;
    *(_QWORD *)&v42.var2 = v23;
    HGSolidColor::HGSolidColor(v33, v42);
    (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v33 + 96))(v33, 0, 0.9, 0.2, 0.7, 1.0);
    v34 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v34);
    (*(void (**)(HGHWMultiBlend *, _QWORD, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 0, 9.0, 0.0, 0.0, 0.0);
    (*(void (**)(HGHWMultiBlend *, _QWORD, HGSolidColor *))(*(_QWORD *)v34 + 120))(v34, 0, v32);
    (*(void (**)(HGHWMultiBlend *, uint64_t, HGSolidColor *))(*(_QWORD *)v34 + 120))(v34, 1, v33);
    (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v34 + 120))(v34, 2, *v12);
    v35 = *v12;
    if (*v12 != v34)
    {
      if (v35)
        (*(void (**)(HGCrop *))(*(_QWORD *)v35 + 24))(v35);
      *v12 = v34;
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v34 + 16))(v34);
    }
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v34 + 24))(v34);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v33 + 24))(v33);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v32 + 24))(v32);
  }
  (*(void (**)(HGCrop *))(*(_QWORD *)v24 + 24))(v24);
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v39);
  return v36;
}

- (id)requiredSourceTrackIDs
{
  void *v2;
  void *v3;

  -[PVInstructionGraphCropNode inputNode](self, "inputNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requiredSourceTrackIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAllSourceNodes
{
  void *v2;
  void *v3;

  -[PVInstructionGraphCropNode inputNode](self, "inputNode");
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

- (CGRect)denormalizedCropRectInSize:(CGSize)a3
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
  -[PVInstructionGraphCropNode normalizedCropRect](self, "normalizedCropRect");
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

- (PVInstructionGraphNode)inputNode
{
  return self->_inputNode;
}

- (void)setInputNode:(id)a3
{
  objc_storeStrong((id *)&self->_inputNode, a3);
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  self->_normalizedCropRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputNode, 0);
}

@end
