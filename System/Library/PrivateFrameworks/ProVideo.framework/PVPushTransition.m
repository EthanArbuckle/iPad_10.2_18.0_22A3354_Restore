@implementation PVPushTransition

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.transition"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v7, v6);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGHWBlendFlipped **v6;
  HGHWBlendFlipped **v11;
  HGNode *v12;
  double Seconds;
  double v14;
  HGXForm *v15;
  HGXForm *v16;
  double v17;
  double v18;
  double v19;
  float v20;
  float v21;
  HGHWBlendFlipped *v22;
  float v23;
  float v24;
  float v25;
  HGNode *v26;
  _BYTE v27[144];
  CMTime v28[6];
  CMTime v29;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v33;
  HGNode *v34;
  HGNode *v35;

  v11 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v35);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v34);
  v12 = v35;
  *v11 = (HGHWBlendFlipped *)v35;
  if (v12)
    (*(void (**)(HGNode *))(*(_QWORD *)v12 + 16))(v12);
  memset(&v33, 0, sizeof(v33));
  lhs = (CMTime)*a3;
  -[PVEffect effectRange](self, "effectRange");
  rhs = v28[0];
  CMTimeSubtract(&v33, &lhs, &rhs);
  time = v33;
  Seconds = CMTimeGetSeconds(&time);
  -[PVEffect effectRange](self, "effectRange");
  v29 = v28[1];
  v14 = CMTimeGetSeconds(&v29);
  HGTransform::HGTransform((HGTransform *)v28);
  HGTransform::HGTransform((HGTransform *)v27);
  v15 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v15);
  v16 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v16);
  v17 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v19 = v18;
  v20 = Seconds / v14;
  switch(-[PVPushTransition transitionDirection](self, "transitionDirection"))
  {
    case 0:
      v21 = v17;
      HGTransform::Translate((HGTransform *)v28, (float)((float)((float)(1.0 - v20) * 0.0) - (float)(v20 * v21)), 0.0, 0.0);
      HGTransform::Translate((HGTransform *)v27, (float)((float)(v20 * 0.0) + (float)((float)(1.0 - v20) * v21)), 0.0, 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v22 + 16))(v22);
      }
      goto LABEL_25;
    case 1:
      v23 = v17;
      HGTransform::Translate((HGTransform *)v28, (float)((float)((float)(1.0 - v20) * 0.0) + (float)(v20 * v23)), 0.0, 0.0);
      HGTransform::Translate((HGTransform *)v27, (float)((float)(v20 * 0.0) - (float)((float)(1.0 - v20) * v23)), 0.0, 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v22 + 16))(v22);
      }
      goto LABEL_25;
    case 2:
      v24 = v19;
      HGTransform::Translate((HGTransform *)v28, 0.0, (float)((float)((float)(1.0 - v20) * 0.0) - (float)(v20 * v24)), 0.0);
      HGTransform::Translate((HGTransform *)v27, 0.0, (float)((float)(v20 * 0.0) + (float)((float)(1.0 - v20) * v24)), 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v22 + 16))(v22);
      }
      goto LABEL_25;
    case 3:
      v25 = v19;
      HGTransform::Translate((HGTransform *)v28, 0.0, (float)((float)((float)(1.0 - v20) * 0.0) + (float)(v20 * v25)), 0.0);
      HGTransform::Translate((HGTransform *)v27, 0.0, (float)((float)(v20 * 0.0) - (float)((float)(1.0 - v20) * v25)), 0.0);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v15 + 576))(v15, v28);
      (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v16 + 576))(v16, v27);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v15 + 120))(v15, 0, v35);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v16 + 120))(v16, 0, v34);
      v22 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v22);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 0, v15);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(_QWORD *)v22 + 120))(v22, 1, v16);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v22)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v22;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v22 + 16))(v22);
      }
LABEL_25:
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v22 + 24))(v22);
      goto LABEL_26;
    default:
      if (!v16)
        goto LABEL_27;
LABEL_26:
      (*(void (**)(HGXForm *))(*(_QWORD *)v16 + 24))(v16);
LABEL_27:
      if (v15)
        (*(void (**)(HGXForm *))(*(_QWORD *)v15 + 24))(v15);
      HGTransform::~HGTransform((HGTransform *)v27);
      HGTransform::~HGTransform((HGTransform *)v28);
      if (v34)
        (*(void (**)(HGNode *))(*(_QWORD *)v34 + 24))(v34);
      v26 = v35;
      if (v35)
        return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v35 + 24))(v35);
      return (HGRef<HGNode>)v26;
  }
}

- (int)transitionDirection
{
  return self->_transitionDirection;
}

- (void)setTransitionDirection:(int)a3
{
  self->_transitionDirection = a3;
}

@end
