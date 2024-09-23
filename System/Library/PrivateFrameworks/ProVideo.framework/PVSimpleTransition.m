@implementation PVSimpleTransition

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
  HGHWBlendFlipped **v10;
  double Seconds;
  double v12;
  HGHWBlendFlipped *v13;
  float v14;
  HGNode *v15;
  CMTime v16;
  CMTime time;
  CMTime v18;
  CMTime v19;
  CMTime rhs;
  CMTime lhs;
  CMTime v22;
  HGNode *v23;
  HGNode *v24;

  v10 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v24);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v23);
  memset(&v22, 0, sizeof(v22));
  lhs = *(CMTime *)a3;
  -[PVEffect effectRange](self, "effectRange");
  rhs = v18;
  CMTimeSubtract(&v22, &lhs, &rhs);
  time = v22;
  Seconds = CMTimeGetSeconds(&time);
  -[PVEffect effectRange](self, "effectRange");
  v16 = v19;
  v12 = CMTimeGetSeconds(&v16);
  v13 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
  HGHWBlendFlipped::HGHWBlendFlipped(v13);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, HGNode *))(*(_QWORD *)v13 + 120))(v13, 0, v23);
  (*(void (**)(HGHWBlendFlipped *, uint64_t, HGNode *))(*(_QWORD *)v13 + 120))(v13, 1, v24);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 0, 9.0, 0.0, 0.0, 0.0);
  v14 = Seconds / v12;
  (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 1, v14, 0.0, 0.0, 0.0);
  *v10 = v13;
  if (v23)
    (*(void (**)(HGNode *))(*(_QWORD *)v23 + 24))(v23);
  v15 = v24;
  if (v24)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v24 + 24))(v24);
  return (HGRef<HGNode>)v15;
}

@end
