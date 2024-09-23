@implementation SiriUIAceObjectViewController

- (SiriUIAceObjectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUIAceObjectViewController;
  return -[SiriUIAceObjectViewController initWithNibName:bundle:](&v5, sel_initWithNibName_bundle_, a3, a4);
}

- (BOOL)removedAfterDialogProgresses
{
  return 0;
}

- (double)desiredHeight
{
  return 0.0;
}

- (BOOL)isUtteranceUserInteractionEnabled
{
  return self->_utteranceUserInteractionEnabled;
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  self->_utteranceUserInteractionEnabled = a3;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (void)setAceObject:(id)a3
{
  objc_storeStrong((id *)&self->_aceObject, a3);
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (SiriUIAceObjectViewControllerDelegate)delegate
{
  return (SiriUIAceObjectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)instrumentationTurnIdentifier
{
  return self->_instrumentationTurnIdentifier;
}

- (void)setInstrumentationTurnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationTurnIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationTurnIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_aceObject, 0);
}

- (id)_privateDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[SiriUIAceObjectViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254F58668);

  if (v4)
  {
    -[SiriUIAceObjectViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)_setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (int64_t)_pinAnimationType
{
  return 0;
}

- (int64_t)_insertionAnimation
{
  return 3;
}

- (int64_t)_replacementAnimation
{
  return 0;
}

- (double)_insertionAnimatedZPosition
{
  return 0.0;
}

- (BOOL)_shouldSkipAnimationsInAlternateSpeeds
{
  return 0;
}

@end
