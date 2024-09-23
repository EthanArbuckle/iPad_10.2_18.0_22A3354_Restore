@implementation STUIStatusBarDynamicSplitAvoidanceData

- (STUIStatusBarDynamicSplitAvoidanceData)init
{
  STUIStatusBarDynamicSplitAvoidanceData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarDynamicSplitAvoidanceData;
  v2 = -[STUIStatusBarDynamicSplitAvoidanceData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarDynamicSplitAvoidanceData setAvoidanceFrameAbsoluteFrames:](v2, "setAvoidanceFrameAbsoluteFrames:", v3);

  }
  return v2;
}

- (STUIStatusBarDynamicSplitAvoidanceData)initWithLeadingDelta:(double)a3 trailingDelta:(double)a4
{
  STUIStatusBarDynamicSplitAvoidanceData *v6;
  STUIStatusBarDynamicSplitAvoidanceData *v7;

  v6 = -[STUIStatusBarDynamicSplitAvoidanceData init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[STUIStatusBarDynamicSplitAvoidanceData setLeadingDelta:](v6, "setLeadingDelta:", a3);
    -[STUIStatusBarDynamicSplitAvoidanceData setTrailingDelta:](v7, "setTrailingDelta:", a4);
  }
  return v7;
}

- (double)leadingDelta
{
  return self->_leadingDelta;
}

- (void)setLeadingDelta:(double)a3
{
  self->_leadingDelta = a3;
}

- (double)trailingDelta
{
  return self->_trailingDelta;
}

- (void)setTrailingDelta:(double)a3
{
  self->_trailingDelta = a3;
}

- (NSMutableDictionary)avoidanceFrameAbsoluteFrames
{
  return self->_avoidanceFrameAbsoluteFrames;
}

- (void)setAvoidanceFrameAbsoluteFrames:(id)a3
{
  objc_storeStrong((id *)&self->_avoidanceFrameAbsoluteFrames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avoidanceFrameAbsoluteFrames, 0);
}

@end
