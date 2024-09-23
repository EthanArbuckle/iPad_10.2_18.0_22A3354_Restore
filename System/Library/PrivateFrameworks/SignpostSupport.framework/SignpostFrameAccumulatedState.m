@implementation SignpostFrameAccumulatedState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameLatency, 0);
  objc_storeStrong((id *)&self->_hidLatency, 0);
  objc_storeStrong((id *)&self->_frameSeedToSkippedRenderIntervals, 0);
  objc_storeStrong((id *)&self->_renderInterval, 0);
  objc_storeStrong((id *)&self->_contextIDtoContextInfoDict, 0);
}

- (NSMutableDictionary)contextIDtoContextInfoDict
{
  return self->_contextIDtoContextInfoDict;
}

- (NSMutableDictionary)frameSeedToSkippedRenderIntervals
{
  return self->_frameSeedToSkippedRenderIntervals;
}

- (void)setRenderInterval:(id)a3
{
  objc_storeStrong((id *)&self->_renderInterval, a3);
}

- (SignpostRenderServerRenderInterval)renderInterval
{
  return self->_renderInterval;
}

- (void)_addSkippedRender:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *frameSeedToSkippedRenderIntervals;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SignpostFrameAccumulatedState frameSeedToSkippedRenderIntervals](self, "frameSeedToSkippedRenderIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    frameSeedToSkippedRenderIntervals = self->_frameSeedToSkippedRenderIntervals;
    self->_frameSeedToSkippedRenderIntervals = v5;

  }
  -[SignpostFrameAccumulatedState frameSeedToSkippedRenderIntervals](self, "frameSeedToSkippedRenderIntervals");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "frameSeed"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostFrameAccumulatedState frameSeedToSkippedRenderIntervals](self, "frameSeedToSkippedRenderIntervals");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v12, "frameSeed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  objc_msgSend(v9, "addObject:", v12);

}

- (SignpostFrameAccumulatedState)initWithFrameSeed:(unsigned int)a3
{
  SignpostFrameAccumulatedState *v4;
  SignpostFrameAccumulatedState *v5;
  uint64_t v6;
  NSMutableDictionary *contextIDtoContextInfoDict;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SignpostFrameAccumulatedState;
  v4 = -[SignpostFrameAccumulatedState init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_frameSeed = a3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    contextIDtoContextInfoDict = v5->_contextIDtoContextInfoDict;
    v5->_contextIDtoContextInfoDict = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (unsigned)frameSeed
{
  return self->_frameSeed;
}

- (void)setContextIDtoContextInfoDict:(id)a3
{
  objc_storeStrong((id *)&self->_contextIDtoContextInfoDict, a3);
}

- (void)setFrameSeedToSkippedRenderIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_frameSeedToSkippedRenderIntervals, a3);
}

- (SignpostHIDLatencyInterval)hidLatency
{
  return self->_hidLatency;
}

- (void)setHidLatency:(id)a3
{
  objc_storeStrong((id *)&self->_hidLatency, a3);
}

- (SignpostFrameLatencyInterval)frameLatency
{
  return self->_frameLatency;
}

- (void)setFrameLatency:(id)a3
{
  objc_storeStrong((id *)&self->_frameLatency, a3);
}

@end
