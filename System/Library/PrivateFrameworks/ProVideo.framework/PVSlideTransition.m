@implementation PVSlideTransition

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
  double v15;
  double v16;
  double v17;
  float v18;
  float v19;
  HGXForm *v20;
  HGHWBlendFlipped *v21;
  float v22;
  float v23;
  float v24;
  HGNode *v25;
  CMTime v26[6];
  CMTime v27;
  CMTime time;
  CMTime rhs;
  CMTime lhs;
  CMTime v31;
  HGNode *v32;
  HGNode *v33;

  v11 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v33);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v32);
  v12 = v33;
  *v11 = (HGHWBlendFlipped *)v33;
  if (v12)
    (*(void (**)(HGNode *))(*(_QWORD *)v12 + 16))(v12);
  memset(&v31, 0, sizeof(v31));
  lhs = (CMTime)*a3;
  -[PVEffect effectRange](self, "effectRange");
  rhs = v26[0];
  CMTimeSubtract(&v31, &lhs, &rhs);
  time = v31;
  Seconds = CMTimeGetSeconds(&time);
  -[PVEffect effectRange](self, "effectRange");
  v27 = v26[1];
  v14 = CMTimeGetSeconds(&v27);
  v15 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v17 = v16;
  v18 = Seconds / v14;
  switch(-[PVSlideTransition transitionDirection](self, "transitionDirection"))
  {
    case 0:
      HGTransform::HGTransform((HGTransform *)v26);
      v19 = -(v15 * v18);
      HGTransform::Translate((HGTransform *)v26, v19, 0.0, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v20 + 120))(v20, 0, v33);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v21 + 120))(v21, 0, v20);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v21 + 120))(v21, 1, v32);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v21 + 16))(v21);
      }
      goto LABEL_23;
    case 1:
      HGTransform::HGTransform((HGTransform *)v26);
      v22 = v15 * v18;
      HGTransform::Translate((HGTransform *)v26, v22, 0.0, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v20 + 120))(v20, 0, v32);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGNode *))(*(_QWORD *)v21 + 120))(v21, 0, v33);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(_QWORD *)v21 + 120))(v21, 1, v20);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v21 + 16))(v21);
      }
      goto LABEL_23;
    case 2:
      HGTransform::HGTransform((HGTransform *)v26);
      v23 = -(v17 * v18);
      HGTransform::Translate((HGTransform *)v26, 0.0, v23, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v20 + 120))(v20, 0, v33);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v21 + 120))(v21, 0, v20);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v21 + 120))(v21, 1, v32);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v21 + 16))(v21);
      }
      goto LABEL_23;
    case 3:
      HGTransform::HGTransform((HGTransform *)v26);
      v24 = -(v17 * v18);
      HGTransform::Translate((HGTransform *)v26, 0.0, v24, 0.0);
      v20 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v20);
      (*(void (**)(HGXForm *, CMTime *))(*(_QWORD *)v20 + 576))(v20, v26);
      (*(void (**)(HGXForm *, _QWORD, HGNode *))(*(_QWORD *)v20 + 120))(v20, 0, v33);
      v21 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v21);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v21 + 120))(v21, 0, v20);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v21 + 120))(v21, 1, v32);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v21)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v21;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v21 + 16))(v21);
      }
LABEL_23:
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v21 + 24))(v21);
      (*(void (**)(HGXForm *))(*(_QWORD *)v20 + 24))(v20);
      HGTransform::~HGTransform((HGTransform *)v26);
      break;
    default:
      break;
  }
  if (v32)
    (*(void (**)(HGNode *))(*(_QWORD *)v32 + 24))(v32);
  v25 = v33;
  if (v33)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v33 + 24))(v33);
  return (HGRef<HGNode>)v25;
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
