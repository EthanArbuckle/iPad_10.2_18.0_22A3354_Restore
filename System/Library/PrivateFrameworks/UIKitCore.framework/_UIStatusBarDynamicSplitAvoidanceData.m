@implementation _UIStatusBarDynamicSplitAvoidanceData

- (_UIStatusBarDynamicSplitAvoidanceData)init
{
  _UIStatusBarDynamicSplitAvoidanceData *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDynamicSplitAvoidanceData;
  v2 = -[_UIStatusBarDynamicSplitAvoidanceData init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIStatusBarDynamicSplitAvoidanceData setAvoidanceFrameAbsoluteFrames:](v2, "setAvoidanceFrameAbsoluteFrames:", v3);

  }
  return v2;
}

- (_UIStatusBarDynamicSplitAvoidanceData)initWithLeadingDelta:(double)a3 trailingDelta:(double)a4
{
  _UIStatusBarDynamicSplitAvoidanceData *v6;
  _UIStatusBarDynamicSplitAvoidanceData *v7;

  v6 = -[_UIStatusBarDynamicSplitAvoidanceData init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[_UIStatusBarDynamicSplitAvoidanceData setLeadingDelta:](v6, "setLeadingDelta:", a3);
    -[_UIStatusBarDynamicSplitAvoidanceData setTrailingDelta:](v7, "setTrailingDelta:", a4);
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
