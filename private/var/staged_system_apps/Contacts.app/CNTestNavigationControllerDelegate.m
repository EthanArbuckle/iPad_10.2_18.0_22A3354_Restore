@implementation CNTestNavigationControllerDelegate

+ (CNTestNavigationControllerDelegate)delegateWithDelegate:(id)a3 willShowViewControllerHandler:(id)a4 didShowViewControllerHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setDelegate:", v10);

  objc_msgSend(v11, "setWillShow:", v9);
  objc_msgSend(v11, "setDidShow:", v8);

  return (CNTestNavigationControllerDelegate *)v11;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate willShow](self, "willShow"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate willShow](self, "willShow"));
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate didShow](self, "didShow"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate didShow](self, "didShow"));
    ((void (**)(_QWORD, id))v7)[2](v7, v8);

  }
}

- (BOOL)_selfReallyRespondsToSelector:(SEL)a3
{
  return sel_isEqual(a3, "navigationController:willShowViewController:animated:")
      || sel_isEqual(a3, "navigationController:didShowViewController:animated:");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;

  if (-[CNTestNavigationControllerDelegate _selfReallyRespondsToSelector:](self, "_selfReallyRespondsToSelector:"))
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate delegate](self, "delegate"));
    v5 = objc_opt_respondsToSelector(v6, a3);

  }
  return v5 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v5;
  char v6;
  void *v7;

  if (-[CNTestNavigationControllerDelegate _selfReallyRespondsToSelector:](self, "_selfReallyRespondsToSelector:")
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate delegate](self, "delegate")),
        v6 = objc_opt_respondsToSelector(v5, a3),
        v5,
        (v6 & 1) == 0))
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CNTestNavigationControllerDelegate delegate](self, "delegate"));
  }
  return v7;
}

- (UINavigationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (id)willShow
{
  return self->_willShow;
}

- (void)setWillShow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didShow
{
  return self->_didShow;
}

- (void)setDidShow:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didShow, 0);
  objc_storeStrong(&self->_willShow, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
