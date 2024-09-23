@implementation HUDLineAnimationDelegate

- (void)animationDidStart:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HUDLineAnimationDelegate hudLine](self, "hudLine", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lineDelegate"));
  objc_msgSend(v3, "animationDidStartOnLine:", v4);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[HUDLineAnimationDelegate hudLine](self, "hudLine", a3, a4));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lineDelegate"));
  objc_msgSend(v4, "animationDidStopOnLine:", v5);

}

- (HUDLine)hudLine
{
  return (HUDLine *)objc_loadWeakRetained((id *)&self->_hudLine);
}

- (void)setHudLine:(id)a3
{
  objc_storeWeak((id *)&self->_hudLine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hudLine);
}

@end
