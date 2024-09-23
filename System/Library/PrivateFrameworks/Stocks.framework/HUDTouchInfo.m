@implementation HUDTouchInfo

- (id)description
{
  void *v3;
  id WeakRetained;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_touch);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HUDTouchInfo %p with touch = %@"), self, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- ($87A9BE3275E22128A73FF46D0B92144E)stockValue
{
  *($04C7558FCA835F866B126A859D92FCD9 *)retstr = *($04C7558FCA835F866B126A859D92FCD9 *)((char *)self + 64);
  return self;
}

- (void)setStockValue:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_stockValue.volume = a3->var2;
  *(_OWORD *)&self->_stockValue.unixTime = v3;
}

- (CGPoint)plottedLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_plottedLocation.x;
  y = self->_plottedLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPlottedLocation:(CGPoint)a3
{
  self->_plottedLocation = a3;
}

- (CGPoint)locationInHUD
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInHUD.x;
  y = self->_locationInHUD.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationInHUD:(CGPoint)a3
{
  self->_locationInHUD = a3;
}

- (UITouch)touch
{
  return (UITouch *)objc_loadWeakRetained((id *)&self->_touch);
}

- (void)setTouch:(id)a3
{
  objc_storeWeak((id *)&self->_touch, a3);
}

- (UIImageView)dot
{
  return self->_dot;
}

- (void)setDot:(id)a3
{
  objc_storeStrong((id *)&self->_dot, a3);
}

- (UIView)bar
{
  return self->_bar;
}

- (void)setBar:(id)a3
{
  objc_storeStrong((id *)&self->_bar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bar, 0);
  objc_storeStrong((id *)&self->_dot, 0);
  objc_destroyWeak((id *)&self->_touch);
}

@end
