@implementation SBOldAlertItemWindow

- (SBOldAlertItemWindow)initWithWindowScene:(id)a3 role:(id)a4 debugName:(id)a5 alertLayoutPresentationVerifier:(id)a6
{
  id v10;
  SBOldAlertItemWindow *v11;
  SBOldAlertItemWindow *v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)SBOldAlertItemWindow;
  v11 = -[SBMainScreenActiveInterfaceOrientationWindow initWithWindowScene:role:debugName:](&v14, sel_initWithWindowScene_role_debugName_, a3, a4, a5);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_alertLayoutPresentationVerifier, v10);

  return v12;
}

- (BOOL)_canBecomeKeyWindow
{
  return 1;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v4;
  id WeakRetained;
  _OWORD v6[3];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBOldAlertItemWindow;
  v4 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->tx;
  -[SBOldAlertItemWindow setTransform:](&v7, sel_setTransform_, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", CFSTR("Alert window setTransform:"));

}

- (void)setCenter:(CGPoint)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBOldAlertItemWindow;
  -[SBOldAlertItemWindow setCenter:](&v5, sel_setCenter_, a3.x, a3.y);
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", CFSTR("Alert window setCenter:"));

}

- (void)setFrame:(CGRect)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBOldAlertItemWindow;
  -[SBOldAlertItemWindow setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", CFSTR("Alert window setFrame:"));

}

- (void)setBounds:(CGRect)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBOldAlertItemWindow;
  -[SBOldAlertItemWindow setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_alertLayoutPresentationVerifier);
  objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", CFSTR("Alert window setBounds:"));

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
  v21.super_class = (Class)SBOldAlertItemWindow;
  v7 = a4;
  -[SBOldAlertItemWindow actionForLayer:forKey:](&v21, sel_actionForLayer_forKey_, v6, v7);
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
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Alert window actionForLayer position changed to %@"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "scheduleDelayedAlertLayoutVerificationForReason:", v19);

  }
  return v8;
}

+ (id)_traitsArbiterOrientationActuationRole
{
  return CFSTR("SBTraitsParticipantRoleAlert");
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

- (void)actionForLayer:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_9(&dword_1D0540000, a2, a3, "Alert window actionForLayer position changed to %@", a5, a6, a7, a8, 2u);
}

@end
