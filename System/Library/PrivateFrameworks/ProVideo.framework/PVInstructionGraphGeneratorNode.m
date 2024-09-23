@implementation PVInstructionGraphGeneratorNode

+ (id)newGeneratorNode:(id)a3
{
  id v3;
  PVInstructionGraphGeneratorNode *v4;

  v3 = a3;
  v4 = objc_alloc_init(PVInstructionGraphGeneratorNode);
  -[PVInstructionGraphGeneratorNode setGeneratorEffect:](v4, "setGeneratorEffect:", v3);

  return v4;
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(*(id *)&self->super._transform.ty, "loadEffect");
  if (v5)
    objc_msgSend(v5, "addObject:", *(_QWORD *)&self->super._transform.ty);

}

- (void)unloadIGNode
{
  objc_msgSend(*(id *)&self->super._transform.ty, "releaseEffect");
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  _QWORD *v6;
  _QWORD *v11;
  const char *v12;
  char *v13;
  const char *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  CGFloat ty;
  unsigned __int8 v21;
  HGNode *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  uint64_t v26;
  const char *v27;
  char *v28;
  CGFloat v29;
  uint64_t v30;
  HGXForm *v31;
  int v32;
  HGXForm *v33;
  HGRef<HGNode> v34;
  _OWORD v35[3];
  HGXForm *v36;
  uint64_t v37;
  __int128 v38;
  int64_t var3;
  HGXForm *v40;
  _QWORD *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[2];
  CMTimeRange range;
  uint64_t v49;
  _BYTE v50[16];

  v11 = v6;
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v50, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphGeneratorNode hgNodeForTime:...]");
  if (*(_QWORD *)&self->super._transform.ty)
  {
    v49 = *(_QWORD *)a6.m_Obj;
    if (v49)
      (*(void (**)(uint64_t))(*(_QWORD *)v49 + 16))(v49);
    -[PVInstructionGraphNode loadIGNode:](self, "loadIGNode:", &v49);
    if (v49)
      (*(void (**)(uint64_t))(*(_QWORD *)v49 + 24))(v49);
    v15 = atomic_load(HGLogger::_enabled);
    if ((v15 & 1) != 0)
    {
      objc_msgSend(*(id *)&self->super._transform.ty, "effectID");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = objc_msgSend(v16, "UTF8String");
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Getting output node from generator effect (%s)\n", v18, v19, v17);

    }
    if ((int)HGLogger::getLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v14) >= 1)
    {
      ty = self->super._transform.ty;
      if (ty == 0.0)
        memset(&range, 0, sizeof(range));
      else
        objc_msgSend(*(id *)&ty, "effectRange");
      CMTimeRangeCopyDescription(0, &range);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = atomic_load(HGLogger::_enabled);
      if ((v25 & 1) != 0)
      {
        v26 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Effect Time Range: %s\n", v27, v28, v26);
      }
      CFRelease(v24);

    }
    *v11 = 0;
    v41 = v42;
    v42[0] = 0;
    v43[0] = 0;
    v43[1] = 0;
    v42[1] = 0;
    v42[2] = v43;
    v43[2] = v44;
    v44[0] = 0;
    v45[0] = 0;
    v45[1] = 0;
    v44[1] = 0;
    v44[2] = v45;
    v45[2] = v46;
    v46[0] = 0;
    v47[0] = 0;
    v47[1] = 0;
    v46[1] = 0;
    v46[2] = v47;
    v29 = self->super._transform.ty;
    var3 = a3->var3;
    v38 = *(_OWORD *)&a3->var0;
    v30 = *(_QWORD *)a6.m_Obj;
    v37 = v30;
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 16))(v30);
    if (v29 == 0.0)
    {
      v31 = 0;
    }
    else
    {
      objc_msgSend(*(id *)&v29, "hgNodeForTime:inputs:renderer:igContext:", &v38, &v41, a5, &v37);
      v31 = v40;
      if (!v40)
      {
LABEL_25:
        if (v37)
          (*(void (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);
        v36 = v31;
        if (v31)
          (*(void (**)(HGXForm *))(*(_QWORD *)v31 + 16))(v31);
        -[PVInstructionGraphSourceNode transform](self, "transform");
        v32 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 64))(*(_QWORD *)a6.m_Obj);
        HGXFormForCGAffineTransform(&v36, v35, v32, &v40);
        v33 = v40;
        if (v31 == v40)
        {
          if (v31)
            (*(void (**)(HGXForm *))(*(_QWORD *)v31 + 24))(v31);
        }
        else
        {
          if (v31)
          {
            (*(void (**)(HGXForm *))(*(_QWORD *)v31 + 24))(v31);
            v33 = v40;
          }
          *v11 = v33;
          v40 = 0;
        }
        if (v36)
          (*(void (**)(HGXForm *))(*(_QWORD *)v36 + 24))(v36);
        -[PVInstructionGraphGeneratorNode unloadIGNode](self, "unloadIGNode");
        PVInputHGNodeMap<unsigned int>::~PVInputHGNodeMap(&v41);
        goto LABEL_38;
      }
      *v11 = v40;
    }
    v40 = 0;
    goto LABEL_25;
  }
  v21 = atomic_load(HGLogger::_enabled);
  if ((v21 & 1) != 0)
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Generator effect is Nil. Returning empty HGNode\n", v12, v13);
  v22 = (HGNode *)HGObject::operator new(0x1A0uLL);
  HGNode::HGNode(v22);
  *v11 = v22;
LABEL_38:
  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v50);
  return v34;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v4;
  uint64_t v6;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PCRect<double> result;

  v6 = v4;
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v4 + 16) = _Q0;
  v12 = (*(double (**)(_QWORD, SEL, id))(**(_QWORD **)a4.m_Obj + 40))(*(_QWORD *)a4.m_Obj, a2, a3);
  v14 = v13;
  v15 = (*(float (**)(_QWORD))(**(_QWORD **)a4.m_Obj + 48))(*(_QWORD *)a4.m_Obj);
  v18 = v12 * v15;
  v19 = v14 * v15;
  *(double *)(v6 + 16) = v18;
  *(double *)(v6 + 24) = v19;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v18;
  result.var0 = v19;
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

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CGFloat ty;
  id receiver;
  uint64_t super_class_low;
  void *v16;
  CGFloat v17;
  void *v18;
  CMTimeRange range;
  CMTime v21;
  objc_super v22[3];
  objc_super v23;
  uint64_t v24;
  CMTime time;

  v24 = *(_QWORD *)a3.m_Obj;
  if (v24)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v24 + 16))(v24, a2);
  v23.receiver = self;
  v23.super_class = (Class)PVInstructionGraphGeneratorNode;
  -[PVInstructionGraphNode dotTreeLabel:](&v23, sel_dotTreeLabel_, &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 24))(v24);
  if (*(_QWORD *)&self->super._transform.ty)
  {
    v6 = PVInstructionGraphContext::DotTreeLogLevel(*(PVInstructionGraphContext **)a3.m_Obj);
    objc_msgSend(*(id *)&self->super._transform.ty, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" [%@]"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 >= 2)
    {
      objc_msgSend(*(id *)&self->super._transform.ty, "effectType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)&self->super._transform.ty, "effectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PVEffect categoryForEffectID:](PVEffect, "categoryForEffectID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" {%@, %@}"), v9, v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    ty = self->super._transform.ty;
    if (ty == 0.0)
    {
      super_class_low = 0;
      receiver = 0;
      memset(v22, 0, sizeof(v22));
    }
    else
    {
      objc_msgSend(*(id *)&ty, "effectRange");
      receiver = v22[0].receiver;
      super_class_low = LODWORD(v22[0].super_class);
    }
    *(_QWORD *)&time.flags = *(Class *)((char *)&v22[0].super_class + 4);
    HIDWORD(time.epoch) = HIDWORD(v22[1].receiver);
    time.value = (CMTimeValue)receiver;
    time.timescale = super_class_low;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), receiver, super_class_low, CMTimeGetSeconds(&time));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = self->super._transform.ty;
    if (v17 == 0.0)
      memset(&range, 0, sizeof(range));
    else
      objc_msgSend(*(id *)&v17, "effectRange");
    CMTimeRangeGetEnd(&v21, &range);
    time = v21;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lld/%d = %.3f}"), v21.value, v21.timescale, CMTimeGetSeconds(&time));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("\nRange: Start (%@) End (%@)"), v16, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)instructionGraphNodeDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  CGFloat ty;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PVInstructionGraphGeneratorNode;
  -[PVInstructionGraphSourceNode instructionGraphNodeDescription](&v10, sel_instructionGraphNodeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("class"));

  ty = self->super._transform.ty;
  if (ty != 0.0)
  {
    objc_msgSend(*(id *)&ty, "effectDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("effect"));

  }
  return v4;
}

- (PVEffect)generatorEffect
{
  return *(PVEffect **)&self->super._transform.ty;
}

- (void)setGeneratorEffect:(id)a3
{
  objc_storeStrong((id *)&self->super._transform.ty, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._transform.ty, 0);
}

@end
