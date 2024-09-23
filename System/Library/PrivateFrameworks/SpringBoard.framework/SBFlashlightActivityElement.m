@implementation SBFlashlightActivityElement

- (SBFlashlightActivityElement)initWithFlashlightOn:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFlashlightActivityElement;
  return -[SBFlashlightElement initWithStyle:state:](&v4, sel_initWithStyle_state_, 0, a3);
}

- (void)setFlashlightOn:(BOOL)a3
{
  if (self->_flashlightOn != a3)
  {
    self->_flashlightOn = a3;
    -[SBFlashlightElement setState:](self, "setState:", a3);
  }
}

- (void)_handleExpandedLeadingButtonAction
{
  void *v3;
  id v4;

  -[SBFlashlightActivityElement delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flashlightActivityElementRequestsTogglingFlashlight:", self);

  -[SBSystemApertureProvidedContentElement layoutHost](self, "layoutHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", self);

}

- (void)setPreviewing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBFlashlightActivityElement;
  if (-[SBSystemApertureProvidedContentElement isPreviewing](&v7, sel_isPreviewing) != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFlashlightActivityElement;
    -[SBSystemApertureProvidedContentElement setPreviewing:](&v6, sel_setPreviewing_, v3);
    -[SBSystemApertureProvidedContentElement layoutHost](self, "layoutHost");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  int64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFlashlightActivityElement;
  v3 = -[SBSystemApertureProvidedContentElement systemApertureLayoutCustomizingOptions](&v5, sel_systemApertureLayoutCustomizingOptions);
  if (-[SBSystemApertureProvidedContentElement isPreviewing](self, "isPreviewing"))
    return v3;
  else
    return v3 | 2;
}

- (SAActivityHosting)activityHost
{
  return (SAActivityHosting *)objc_loadWeakRetained((id *)&self->_activityHost);
}

- (void)setActivityHost:(id)a3
{
  objc_storeWeak((id *)&self->_activityHost, a3);
}

- (SBFlashlightActivityElementDelegate)delegate
{
  return (SBFlashlightActivityElementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isFlashlightOn
{
  return self->_flashlightOn;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_activityHost);
}

@end
