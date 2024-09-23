@implementation SCDAGoodnessScoreContext

- (SCDAGoodnessScoreContext)init
{
  SCDAGoodnessScoreContext *v2;
  uint64_t v3;
  NSSet *reasons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCDAGoodnessScoreContext;
  v2 = -[SCDAGoodnessScoreContext init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_251755398);
    v3 = objc_claimAutoreleasedReturnValue();
    reasons = v2->_reasons;
    v2->_reasons = (NSSet *)v3;

    v2->_mediaPlaybackInterruptedTime = 0.0;
    -[SCDAGoodnessScoreContext setOverridingContext:](v2, "setOverridingContext:", 0);
    v2->_recentlyWonBySmallAmount = 0;
  }
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("reasons: %@, playback interrupted time: %f"), self->_reasons, *(_QWORD *)&self->_mediaPlaybackInterruptedTime);
}

- (void)setOverridingContext:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenContext, a3);
}

- (id)getOverridingContext
{
  return self->_overriddenContext;
}

- (NSSet)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)mediaPlaybackInterruptedTime
{
  return self->_mediaPlaybackInterruptedTime;
}

- (void)setMediaPlaybackInterruptedTime:(double)a3
{
  self->_mediaPlaybackInterruptedTime = a3;
}

- (BOOL)recentlyWonBySmallAmount
{
  return self->_recentlyWonBySmallAmount;
}

- (void)setRecentlyWonBySmallAmount:(BOOL)a3
{
  self->_recentlyWonBySmallAmount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_overriddenContext, 0);
}

@end
