@implementation PXStoryMultipartPanoramaParameters

- (PXStoryMultipartPanoramaParameters)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMultipartPanoramaParameters.m"), 17, CFSTR("%s is not available as initializer"), "-[PXStoryMultipartPanoramaParameters init]");

  abort();
}

- (PXStoryMultipartPanoramaParameters)initWithNormalizedKenBurnsEffectParameters:(id *)a3 partDurationInfo:(id *)a4 transitionInfo:(id *)a5
{
  PXStoryMultipartPanoramaParameters *result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PXStoryMultipartPanoramaParameters;
  result = -[PXStoryMultipartPanoramaParameters init](&v20, sel_init);
  if (result)
  {
    v9 = *(_OWORD *)&a3->var0.var0.c;
    *(_OWORD *)&result->_transitionInfo.var1.scaleRelativeFactor = *(_OWORD *)&a3->var0.var0.a;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.s.t.b = v9;
    v10 = *(_OWORD *)&a3->var0.var0.tx;
    v11 = *(_OWORD *)&a3->var1.var0.a;
    v12 = *(_OWORD *)&a3->var1.var0.tx;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.t.t.b = *(_OWORD *)&a3->var1.var0.c;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.t.t.d = v12;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.s.t.d = v10;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.s.t.ty = v11;
    v13 = *(_OWORD *)&a4->var3.var1;
    v15 = *(_OWORD *)&a4->var2.var0;
    v14 = *(_OWORD *)&a4->var2.var3;
    *(_OWORD *)&result->_partDurationInfo.preferredCue.time.value = *(_OWORD *)&a4->var3.var0.var1;
    *(_OWORD *)&result->_partDurationInfo.preferredCue.time.epoch = v13;
    *(_OWORD *)&result->_partDurationInfo.preferredDuration.epoch = v15;
    *(_OWORD *)&result->_partDurationInfo.maximumDuration.timescale = v14;
    v16 = *(_OWORD *)&a4->var0.var0;
    v17 = *(_OWORD *)&a4->var1.var1;
    *(_OWORD *)&result->_partDurationInfo.minimumDuration.timescale = *(_OWORD *)&a4->var0.var3;
    *(_OWORD *)&result->_partDurationInfo.preferredDuration.value = v17;
    *(_OWORD *)&result->_normalizedKenBurnsEffectParameters.t.t.ty = v16;
    v18 = *(_OWORD *)&a5->var0;
    v19 = *(_OWORD *)&a5->var2.var1;
    *(_QWORD *)&result->_transitionInfo.fallbackFromTransitionKind = *(_QWORD *)&a5->var3;
    *(_OWORD *)&result->_transitionInfo.duration.timescale = v19;
    *(_OWORD *)&result->_transitionInfo.orderOutTransition = v18;
  }
  return result;
}

- ($D91B8EE9D09FDCAD835AAEC54CF3D85E)normalizedKenBurnsEffectParameters
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[1].var0.var0.a;
  *(_OWORD *)&retstr->var0.var0.tx = *(_OWORD *)&self->var1.var0.tx;
  *(_OWORD *)&retstr->var1.var0.a = v3;
  v4 = *(_OWORD *)&self[1].var0.var0.tx;
  *(_OWORD *)&retstr->var1.var0.c = *(_OWORD *)&self[1].var0.var0.c;
  *(_OWORD *)&retstr->var1.var0.tx = v4;
  v5 = *(_OWORD *)&self->var1.var0.c;
  *(_OWORD *)&retstr->var0.var0.a = *(_OWORD *)&self->var1.var0.a;
  *(_OWORD *)&retstr->var0.var0.c = v5;
  return self;
}

- ($F6BA6A5CD79A8D3CC60DB9DEA7616E28)partDurationInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[2].var0.var0;
  *(_OWORD *)&retstr->var2.var3 = *(_OWORD *)&self[1].var3.var1;
  *(_OWORD *)&retstr->var3.var0.var1 = v3;
  *(_OWORD *)&retstr->var3.var1 = *(_OWORD *)&self[2].var0.var3;
  v4 = *(_OWORD *)&self[1].var2.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v4;
  v5 = *(_OWORD *)&self[1].var3.var0.var1;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var2.var3;
  *(_OWORD *)&retstr->var2.var0 = v5;
  return self;
}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(double *)&retstr->var3 = self->var5.var0;
  return self;
}

@end
