@implementation PVWipeTransition

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
  unsigned int v18;
  __n128 v19;
  float v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  HGCrop *v25;
  HGHWBlendFlipped *v26;
  float v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  HGNode *v42;
  CMTime v43;
  CMTime time;
  CMTime v45;
  CMTime v46;
  CMTime rhs;
  CMTime lhs;
  CMTime v49;
  HGNode *v50;
  HGNode *v51;

  v11 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v51);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v50);
  v12 = v51;
  *v11 = (HGHWBlendFlipped *)v51;
  if (v12)
    (*(void (**)(HGNode *))(*(_QWORD *)v12 + 16))(v12);
  memset(&v49, 0, sizeof(v49));
  lhs = (CMTime)*a3;
  -[PVEffect effectRange](self, "effectRange");
  rhs = v45;
  CMTimeSubtract(&v49, &lhs, &rhs);
  time = v49;
  Seconds = CMTimeGetSeconds(&time);
  -[PVEffect effectRange](self, "effectRange");
  v43 = v46;
  v14 = CMTimeGetSeconds(&v43);
  v15 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v17 = v16;
  v18 = -[PVWipeTransition transitionDirection](self, "transitionDirection");
  v19.n128_f64[0] = Seconds / v14;
  v19.n128_f32[0] = Seconds / v14;
  switch(v18)
  {
    case 0u:
      v20 = v15 * (float)(1.0 - v19.n128_f32[0]);
      v21 = v17;
      v22 = HGRectMake4f(v18, 0.0, 0.0, v20, v21);
      v24 = v23;
      v25 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v25);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, (float)(int)v22, (float)SHIDWORD(v22), (float)(int)v24, (float)SHIDWORD(v24));
      (*(void (**)(HGCrop *, _QWORD, HGNode *))(*(_QWORD *)v25 + 120))(v25, 0, v51);
      v26 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v26);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGCrop *))(*(_QWORD *)v26 + 120))(v26, 0, v25);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v26 + 120))(v26, 1, v50);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v26 + 96))(v26, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v26)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v26;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v26 + 16))(v26);
      }
      goto LABEL_23;
    case 1u:
      v27 = v15 * v19.n128_f32[0];
      v28 = v17;
      v29 = HGRectMake4f(v18, 0.0, 0.0, v27, v28);
      v31 = v30;
      v25 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v25);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, (float)(int)v29, (float)SHIDWORD(v29), (float)(int)v31, (float)SHIDWORD(v31));
      (*(void (**)(HGCrop *, _QWORD, HGNode *))(*(_QWORD *)v25 + 120))(v25, 0, v51);
      v26 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v26);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGCrop *))(*(_QWORD *)v26 + 120))(v26, 0, v25);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v26 + 120))(v26, 1, v50);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v26 + 96))(v26, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v26)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v26;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v26 + 16))(v26);
      }
      goto LABEL_23;
    case 2u:
      v32 = v15;
      v33 = v17 * (float)(1.0 - v19.n128_f32[0]);
      v34 = HGRectMake4f(v18, 0.0, 0.0, v32, v33);
      v36 = v35;
      v25 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v25);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, (float)(int)v34, (float)SHIDWORD(v34), (float)(int)v36, (float)SHIDWORD(v36));
      (*(void (**)(HGCrop *, _QWORD, HGNode *))(*(_QWORD *)v25 + 120))(v25, 0, v51);
      v26 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v26);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGCrop *))(*(_QWORD *)v26 + 120))(v26, 0, v25);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v26 + 120))(v26, 1, v50);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v26 + 96))(v26, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v26)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v26;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v26 + 16))(v26);
      }
      goto LABEL_23;
    case 3u:
      v37 = v15;
      v38 = v17 * v19.n128_f32[0];
      v39 = HGRectMake4f(v18, 0.0, 0.0, v37, v38);
      v41 = v40;
      v25 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v25);
      (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, (float)(int)v39, (float)SHIDWORD(v39), (float)(int)v41, (float)SHIDWORD(v41));
      (*(void (**)(HGCrop *, _QWORD, HGNode *))(*(_QWORD *)v25 + 120))(v25, 0, v51);
      v26 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v26);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGCrop *))(*(_QWORD *)v26 + 120))(v26, 0, v25);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v26 + 120))(v26, 1, v50);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v26 + 96))(v26, 0, 9.0, 0.0, 0.0, 0.0);
      if (v12 != (HGNode *)v26)
      {
        if (v12)
          (*(void (**)(HGNode *))(*(_QWORD *)v12 + 24))(v12);
        *v11 = v26;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v26 + 16))(v26);
      }
LABEL_23:
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v26 + 24))(v26);
      (*(void (**)(HGCrop *))(*(_QWORD *)v25 + 24))(v25);
      break;
    default:
      break;
  }
  if (v50)
    (*(void (**)(HGNode *, __n128))(*(_QWORD *)v50 + 24))(v50, v19);
  v42 = v51;
  if (v51)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *, __n128))(*(_QWORD *)v51 + 24))(v51, v19);
  return (HGRef<HGNode>)v42;
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
