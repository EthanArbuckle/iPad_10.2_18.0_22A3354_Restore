@implementation PVInstructionGraphTransformNode

+ (id)newTransformNode:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  id v7;
  __int128 v8;
  void *v9;
  _OWORD v11[3];

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  v8 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a4->tx;
  v9 = (void *)objc_msgSend(v7, "initWithInputNode:transform:", v6, v11);

  return v9;
}

- (PVInstructionGraphTransformNode)initWithInputNode:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6;
  PVInstructionGraphTransformNode *v7;
  PVInstructionGraphTransformNode *v8;
  __int128 v9;
  _OWORD v11[3];
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PVInstructionGraphTransformNode;
  v7 = -[PVInstructionGraphNode init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PVInstructionGraphTransformNode setInputNode:](v7, "setInputNode:", v6);
    v9 = *(_OWORD *)&a4->c;
    v11[0] = *(_OWORD *)&a4->a;
    v11[1] = v9;
    v11[2] = *(_OWORD *)&a4->tx;
    -[PVInstructionGraphTransformNode setTransform:](v8, "setTransform:", v11);
    -[PVInstructionGraphTransformNode setTransformOrigin:](v8, "setTransformOrigin:", 2);
  }

  return v8;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = a4;
  -[PVInstructionGraphTransformNode inputNode](self, "inputNode");
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

  -[PVInstructionGraphTransformNode inputNode](self, "inputNode");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadIGNode");

}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGXForm **v6;
  HGXForm **v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  float v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  HGXForm *v25;
  int v26;
  HGXForm *v27;
  CGFloat a;
  uint64_t v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  HGSolidColor *v35;
  HGHWMultiBlend *v36;
  HGXForm *v37;
  HGRef<HGNode> v38;
  CGAffineTransform v39;
  HGXForm *v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  uint64_t v43;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;
  _BYTE v45[16];
  CGAffineTransform v46;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v49;
  HGRect v51;

  v12 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v45, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphTransformNode hgNodeForTime:...]");
  -[PVInstructionGraphTransformNode inputNode](self, "inputNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *a3;
  v14 = *(_QWORD *)a6.m_Obj;
  v43 = v14;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 16))(v14);
  if (v13)
    objc_msgSend(v13, "hgNodeForTime:trackInputs:renderer:igContext:", &v44, a4, a5, &v43);
  else
    *v12 = 0;
  if (v43)
    (*(void (**)(uint64_t))(*(_QWORD *)v43 + 24))(v43);

  v15 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v17 = v16;
  v18 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
  memset(&v42, 0, sizeof(v42));
  -[PVInstructionGraphTransformNode transform](self, "transform");
  v19 = -[PVInstructionGraphTransformNode transformOrigin](self, "transformOrigin");
  v20 = v18;
  v21 = v15 * v18;
  v22 = v17 * v20;
  if (v19)
  {
    if (v19 == 1)
      v23 = v17 * v20;
    else
      v23 = v22 * 0.5;
    if (v19 == 1)
      v24 = 0.0;
    else
      v24 = v21 * 0.5;
  }
  else
  {
    v24 = *MEMORY[0x1E0C9D538];
    v23 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeTranslation(&t1, -v24, -v23);
  t2 = v42;
  CGAffineTransformConcat(&v49, &t1, &t2);
  CGAffineTransformMakeTranslation(&v46, v24, v23);
  CGAffineTransformConcat(&v41, &v49, &v46);
  v25 = *v12;
  v40 = v25;
  if (v25)
    (*(void (**)(HGXForm *))(*(_QWORD *)v25 + 16))(v25);
  v39 = v41;
  v26 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
  HGXFormForCGAffineTransform(&v40, &v39, v26, (HGXForm **)&v49);
  v27 = *v12;
  a = v49.a;
  if (*v12 == *(HGXForm **)&v49.a)
  {
    if (v27)
      (*(void (**)(HGXForm *))(*(_QWORD *)v27 + 24))(v27);
  }
  else
  {
    if (v27)
    {
      (*(void (**)(HGXForm *))(*(_QWORD *)v27 + 24))(v27);
      a = v49.a;
    }
    *(CGFloat *)v12 = a;
    v49.a = 0.0;
  }
  if (v40)
    (*(void (**)(HGXForm *))(*(_QWORD *)v40 + 24))(v40);
  if (-[PVInstructionGraphNode isDebugDrawingEnabled](self, "isDebugDrawingEnabled"))
  {
    v30 = v21;
    v31 = v22;
    v32 = HGRectMake4f(v29, 0.0, 0.0, v30, v31);
    v34 = v33;
    v35 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(_QWORD *)&v51.var0 = v32;
    *(_QWORD *)&v51.var2 = v34;
    HGSolidColor::HGSolidColor(v35, v51);
    (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v35 + 96))(v35, 0, 0.3, 0.5, 0.8, 1.0);
    v36 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
    HGHWMultiBlend::HGHWMultiBlend(v36);
    (*(void (**)(HGHWMultiBlend *, _QWORD, float, float, float, float))(*(_QWORD *)v36 + 96))(v36, 0, 9.0, 0.0, 0.0, 0.0);
    (*(void (**)(HGHWMultiBlend *, _QWORD, HGSolidColor *))(*(_QWORD *)v36 + 120))(v36, 0, v35);
    (*(void (**)(HGHWMultiBlend *, uint64_t, HGXForm *))(*(_QWORD *)v36 + 120))(v36, 1, *v12);
    v37 = *v12;
    if (*v12 != (HGXForm *)v36)
    {
      if (v37)
        (*(void (**)(HGXForm *))(*(_QWORD *)v37 + 24))(v37);
      *v12 = (HGXForm *)v36;
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v36 + 16))(v36);
    }
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v36 + 24))(v36);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v35 + 24))(v35);
  }
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v45);
  return v38;
}

- (id)requiredSourceTrackIDs
{
  void *v2;
  void *v3;

  -[PVInstructionGraphTransformNode inputNode](self, "inputNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requiredSourceTrackIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getAllSourceNodes
{
  void *v2;
  void *v3;

  -[PVInstructionGraphTransformNode inputNode](self, "inputNode");
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

- (int)transformOrigin
{
  return self->_transformOrigin;
}

- (void)setTransformOrigin:(int)a3
{
  self->_transformOrigin = a3;
}

- (PVInstructionGraphNode)inputNode
{
  return self->_inputNode;
}

- (void)setInputNode:(id)a3
{
  objc_storeStrong((id *)&self->_inputNode, a3);
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputNode, 0);
}

@end
