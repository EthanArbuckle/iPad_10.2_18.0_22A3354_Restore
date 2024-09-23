@implementation PVCrossDissolveTransition

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
  HGHWBlendFlipped **v9;
  double Seconds;
  double v11;
  HGHWBlendFlipped *v12;
  float v13;
  CMTimeValue value;
  HGNode *v15;
  CMTime v16;
  CMTime time;
  CMTime v18[2];
  CMTime rhs;
  CMTime lhs;
  CMTime v21;

  v9 = v6;
  memset(&v21, 0, sizeof(v21));
  lhs = *(CMTime *)a3;
  -[PVEffect effectRange](self, "effectRange");
  rhs = v18[0];
  CMTimeSubtract(&v21, &lhs, &rhs);
  time = v21;
  Seconds = CMTimeGetSeconds(&time);
  -[PVEffect effectRange](self, "effectRange");
  v16 = v18[1];
  v11 = CMTimeGetSeconds(&v16);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, (HGNode **)v18);
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 1u, &v15);
  v12 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
  HGHWBlendFlipped::HGHWBlendFlipped(v12);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, HGNode *))(*(_QWORD *)v12 + 120))(v12, 0, v15);
  (*(void (**)(HGHWBlendFlipped *, uint64_t, CMTimeValue))(*(_QWORD *)v12 + 120))(v12, 1, v18[0].value);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 0, 9.0, 0.0, 0.0, 0.0);
  v13 = Seconds / v11;
  (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 1, v13, 0.0, 0.0, 0.0);
  *v9 = v12;
  if (v15)
    (*(void (**)(HGNode *))(*(_QWORD *)v15 + 24))(v15);
  value = v18[0].value;
  if (v18[0].value)
    return (HGRef<HGNode>)(*(uint64_t (**)(CMTimeValue))(*(_QWORD *)v18[0].value + 24))(v18[0].value);
  return (HGRef<HGNode>)value;
}

@end
