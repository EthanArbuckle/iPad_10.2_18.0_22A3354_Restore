@implementation SBPresentationObservationToken

- (SBPresentationObservationToken)initWithScene:(id)a3
{
  id v4;
  SBPresentationObservationToken *v5;
  SBPresentationObservationToken *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBPresentationObservationToken;
  v5 = -[SBPresentationObservationToken init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_windowScene, v4);

  return v6;
}

- (void)willPresent
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](self->_willPresentHandler, a2);
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)didPresent
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](self->_didPresentHandler, a2);
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)willDismiss
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](self->_willDismissHandler, a2);
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)didDismiss
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](self->_didDismissHandler, a2);
  if (v3)
  {
    v4 = v3;
    ((void (**)(_QWORD, SBPresentationObservationToken *))v3)[2](v3, self);
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)invalidate
{
  id willPresentHandler;
  id didPresentHandler;
  id willDismissHandler;
  id didDismissHandler;

  willPresentHandler = self->_willPresentHandler;
  self->_willPresentHandler = 0;

  didPresentHandler = self->_didPresentHandler;
  self->_didPresentHandler = 0;

  willDismissHandler = self->_willDismissHandler;
  self->_willDismissHandler = 0;

  didDismissHandler = self->_didDismissHandler;
  self->_didDismissHandler = 0;

}

- (int64_t)state
{
  return self->_state;
}

- (id)willPresentHandler
{
  return self->_willPresentHandler;
}

- (void)setWillPresentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didPresentHandler
{
  return self->_didPresentHandler;
}

- (void)setDidPresentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)willDismissHandler
{
  return self->_willDismissHandler;
}

- (void)setWillDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)setDidDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong(&self->_didDismissHandler, 0);
  objc_storeStrong(&self->_willDismissHandler, 0);
  objc_storeStrong(&self->_didPresentHandler, 0);
  objc_storeStrong(&self->_willPresentHandler, 0);
}

@end
