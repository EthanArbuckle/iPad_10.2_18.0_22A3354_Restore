@implementation SBAlertItemWindow

- (SBAlertItemWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5 alertLayoutPresentationVerifier:(id)a6
{
  id v10;
  SBAlertItemWindow *v11;
  SBAlertItemWindow *v12;
  SBAlertItemRootViewController *v13;
  objc_super v15;

  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SBAlertItemWindow;
  v11 = -[SBWindow initWithWindowScene:role:debugName:](&v15, sel_initWithWindowScene_role_debugName_, a3, a4, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_alertLayoutPresentationVerifier, v10);
    v13 = -[SBAlertItemRootViewController initWithNibName:bundle:]([SBAlertItemRootViewController alloc], "initWithNibName:bundle:", 0, 0);
    -[SBAlertItemWindow setRootViewController:](v12, "setRootViewController:", v13);

  }
  return v12;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  void *v7;
  id WeakRetained;
  void *v9;
  CGAffineTransform transform;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBAlertItemWindow;
  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&transform.c = v5;
  *(_OWORD *)&transform.tx = *(_OWORD *)&a3->tx;
  -[SBAlertItemWindow setTransform:](&v11, sel_setTransform_, &transform);
  v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&transform.c = v6;
  *(_OWORD *)&transform.tx = *(_OWORD *)&a3->tx;
  NSStringFromCGAffineTransform(&transform);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert window setTransform: %@."), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", v9);

}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  id WeakRetained;
  void *v8;
  objc_super v9;
  CGPoint v10;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)SBAlertItemWindow;
  -[SBAlertItemWindow setCenter:](&v9, sel_setCenter_);
  v10.x = x;
  v10.y = y;
  NSStringFromCGPoint(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert window setCenter: %@."), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", v8);

}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id WeakRetained;
  void *v10;
  objc_super v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBAlertItemWindow;
  -[SBAlertItemWindow setFrame:](&v11, sel_setFrame_);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  NSStringFromCGRect(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert window setFrame: %@."), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", v10);

}

- (void)setBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  id WeakRetained;
  void *v10;
  objc_super v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBAlertItemWindow;
  -[SBAlertItemWindow setBounds:](&v11, sel_setBounds_);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  NSStringFromCGRect(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert window setBounds: %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", v10);

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  objc_super v21;
  CGPoint v22;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBAlertItemWindow;
  v7 = a4;
  -[SBAlertItemWindow actionForLayer:forKey:](&v21, sel_actionForLayer_forKey_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("position"));

  if (v9)
  {
    objc_msgSend(v6, "position");
    NSStringFromCGPoint(v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogAlertItems();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[SBOldAlertItemWindow actionForLayer:forKey:].cold.1((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

    WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert window set actionForLayer position changed to %@"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", v19);

  }
  return v8;
}

- (SBAlertLayoutPresentationVerifier)alertLayoutPresentationVerifier
{
  return (SBAlertLayoutPresentationVerifier *)objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
}

- (void)setAlertLayoutPresentationVerifier:(id)a3
{
  objc_storeWeak((id *)&self->_alertLayoutPresentationVerifier, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertLayoutPresentationVerifier);
}

@end
