@implementation PITimeVaryingPipelineStateSetting

- (id)nu_evaluateWithPipelineState:(id)a3 error:(id *)a4
{
  id v4;
  PITimeVaryingPipelineStateSetting *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v4 = a3;
  v5 = objc_alloc_init(PITimeVaryingPipelineStateSetting);
  if (v4)
  {
    objc_msgSend(v4, "time");
  }
  else
  {
    v13 = 0uLL;
    v14 = 0;
  }
  v11 = v13;
  v12 = v14;
  -[PITimeVaryingPipelineStateSetting setTime:](v5, "setTime:", &v11);
  -[PITimeVaryingPipelineStateSetting setSampleMode:](v5, "setSampleMode:", objc_msgSend(v4, "sampleMode"));
  if (v4)
  {
    objc_msgSend(v4, "rawTime");
  }
  else
  {
    v9 = 0uLL;
    v10 = 0;
  }
  v7 = v9;
  v8 = v10;
  -[PITimeVaryingPipelineStateSetting setRawTime:](v5, "setRawTime:", &v7);

  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)rawTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setRawTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_rawTime.epoch = a3->var3;
  *(_OWORD *)&self->_rawTime.value = v3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

@end
