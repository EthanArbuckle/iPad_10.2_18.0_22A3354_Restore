@implementation UIDynamicAnimatorTicker

- (void)_displayLinkTick:(id)a3
{
  double v4;
  double v5;
  id v6;

  objc_msgSend(a3, "timestamp");
  v5 = v4;
  -[UIDynamicAnimatorTicker animator](self, "animator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_performAnimationTickForTimestamp:", v5);

}

- (void)_uiUpdateSequenceTick:(double)a3
{
  id v4;

  -[UIDynamicAnimatorTicker animator](self, "animator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_performAnimationTickForTimestamp:", a3);

}

- (UIDynamicAnimator)animator
{
  return (UIDynamicAnimator *)objc_loadWeakRetained((id *)&self->_animator);
}

- (void)setAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_animator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animator);
}

@end
