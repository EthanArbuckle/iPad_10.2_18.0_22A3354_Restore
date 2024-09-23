@implementation BCCardStackBarBackgroundContainingView

- (BCCardStackBarBackgroundContainingView)initWithStatusBarBackgroundController:(id)a3
{
  id v4;
  BCCardStackBarBackgroundContainingView *v5;
  BCCardStackBarBackgroundContainingView *v6;

  v4 = a3;
  v5 = -[BCCardStackBarBackgroundContainingView init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_statusBarBackgroundController, v4);

  return v6;
}

- (void)didAddSubview:(id)a3
{
  void *v4;
  BCCardStackBarBackgroundContainingView *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackBarBackgroundContainingView statusBarBackgroundController](self, "statusBarBackgroundController", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "effectiveBackgroundView"));

  v5 = (BCCardStackBarBackgroundContainingView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
  if (v5 == self)
    -[BCCardStackBarBackgroundContainingView bringSubviewToFront:](self, "bringSubviewToFront:", v6);

}

- (BCStatusBarBackgroundController)statusBarBackgroundController
{
  return (BCStatusBarBackgroundController *)objc_loadWeakRetained((id *)&self->_statusBarBackgroundController);
}

- (void)setStatusBarBackgroundController:(id)a3
{
  objc_storeWeak((id *)&self->_statusBarBackgroundController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBarBackgroundController);
}

@end
