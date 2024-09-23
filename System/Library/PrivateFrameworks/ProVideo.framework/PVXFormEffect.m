@implementation PVXFormEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.filter"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v7, v6);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGNode **v6;
  _QWORD *v7;
  HGRef<HGNode> v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  int v11;
  HGXForm *v12;
  uint64_t v13;
  HGColorMatrix *v14;
  uint64_t v15;
  _BYTE v16[144];

  v7 = v6;
  v8.var0 = PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, v6);
  if ((v9 & 1) == 0)
  {
    if (LODWORD(v8.var0))
    {
      -[PVXFormEffect hgNodeForTime:inputs:renderer:igContext:]::s_numPasses = +[PVEnvironment PV_NUM_RENDER_PASSES](PVEnvironment, "PV_NUM_RENDER_PASSES");
    }
  }
  if ((v10 & 1) == 0)
  {
    if (LODWORD(v8.var0))
    {
      -[PVXFormEffect hgNodeForTime:inputs:renderer:igContext:]::s_testType = +[PVEnvironment PV_RENDER_PASS_TEST_TYPE](PVEnvironment, "PV_RENDER_PASS_TEST_TYPE");
    }
  }
  if (-[PVXFormEffect hgNodeForTime:inputs:renderer:igContext:]::s_numPasses >= 1)
  {
    v11 = 0;
    do
    {
      if (-[PVXFormEffect hgNodeForTime:inputs:renderer:igContext:]::s_testType == 1)
      {
        v14 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
        HGColorMatrix::HGColorMatrix(v14);
        (*(void (**)(HGColorMatrix *, _QWORD, _QWORD))(*(_QWORD *)v14 + 120))(v14, 0, *v7);
        (*(void (**)(HGColorMatrix *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, 1.1, 0.0, 0.0, 0.0);
        (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 1, 0.0, 1.1, 0.0, 0.0);
        (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 2, 0.0, 0.0, 1.1, 0.0);
        (*(void (**)(HGColorMatrix *, uint64_t, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 3, 0.0, 0.0, 0.0, 1.0);
        v15 = *v7;
        if ((HGColorMatrix *)*v7 != v14)
        {
          if (v15)
            (*(void (**)(uint64_t))(*(_QWORD *)v15 + 24))(v15);
          *v7 = v14;
          (*(void (**)(HGColorMatrix *))(*(_QWORD *)v14 + 16))(v14);
        }
        (*(void (**)(HGColorMatrix *))(*(_QWORD *)v14 + 24))(v14);
      }
      else if (-[PVXFormEffect hgNodeForTime:inputs:renderer:igContext:]::s_testType)
      {
        NSLog(CFSTR("*** WARNING: unknown test type for render passes test."));
      }
      else
      {
        HGTransform::HGTransform((HGTransform *)v16);
        HGTransform::Translate((HGTransform *)v16, 10.0, 0.0, 0.0);
        v12 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v12);
        (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v12 + 120))(v12, 0, *v7);
        (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v12 + 576))(v12, v16);
        v13 = *v7;
        if ((HGXForm *)*v7 != v12)
        {
          if (v13)
            (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
          *v7 = v12;
          (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 16))(v12);
        }
        (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 24))(v12);
        HGTransform::~HGTransform((HGTransform *)v16);
      }
      v8.var0 = (HGNode *)(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)*v7 + 136))(*v7, 0xFFFFFFFFLL, 32);
      ++v11;
    }
    while (v11 < -[PVXFormEffect hgNodeForTime:inputs:renderer:igContext:]::s_numPasses);
  }
  return v8;
}

@end
