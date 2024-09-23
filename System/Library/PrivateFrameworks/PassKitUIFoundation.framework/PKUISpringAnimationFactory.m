@implementation PKUISpringAnimationFactory

- (double)maximumVendedDelay
{
  return self->_maximumVendedDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationDelayHandler, 0);
}

- (id)highFrameRateSpringAnimationForView:(id)a3 withKeyPath:(id)a4 reason:(unsigned __int16)a5
{
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  v5 = a5;
  -[PKUISpringAnimationFactory springAnimationForView:withKeyPath:](self, "springAnimationForView:withKeyPath:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighFrameRateReason:", v5 | 0x210000u);
  LODWORD(v7) = 1117782016;
  LODWORD(v8) = 1123024896;
  LODWORD(v9) = 1123024896;
  objc_msgSend(v6, "setPreferredFrameRateRange:", v7, v8, v9);
  return v6;
}

- (id)springAnimationForView:(id)a3 withKeyPath:(id)a4
{
  void *v4;

  -[PKUISpringAnimationFactory _springAnimationForView:withKeyPath:](self, "_springAnimationForView:withKeyPath:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAdditive:", 1);
  return v4;
}

- (id)_springAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  double (**animationDelayHandler)(id, id, id);
  double v10;
  double v11;

  v6 = a3;
  v7 = a4;
  v8 = -[PKSpringAnimationFactory _createSpringAnimationWithKeyPath:](self, "_createSpringAnimationWithKeyPath:", v7);
  animationDelayHandler = (double (**)(id, id, id))self->_animationDelayHandler;
  if (animationDelayHandler)
  {
    v10 = animationDelayHandler[2](animationDelayHandler, v6, v7);
    if (v10 > 0.0)
    {
      v11 = v10;
      objc_msgSend(v8, "setBeginTime:");
      self->_maximumVendedDelay = fmax(v11, self->_maximumVendedDelay);
    }
  }

  return v8;
}

- (void)setAnimationDelayHandler:(id)a3
{
  void *v4;
  id animationDelayHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  animationDelayHandler = self->_animationDelayHandler;
  self->_animationDelayHandler = v4;

}

- (id)animationDelayHandler
{
  return self->_animationDelayHandler;
}

@end
