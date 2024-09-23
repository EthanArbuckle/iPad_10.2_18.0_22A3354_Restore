@implementation SBSiriHardwareButtonEventsOnlyButtonInteraction

+ (id)hardwareButtonInteractionForHomeButtonForwardingToInteraction:(id)a3
{
  id v3;
  SBSiriHardwareButtonEventsOnlyButtonInteraction *v4;

  v3 = a3;
  v4 = objc_alloc_init(SBSiriHardwareButtonEventsOnlyButtonInteraction);
  -[SBSiriHardwareButtonEventsOnlyButtonInteraction setSiriButtonIdentifier:](v4, "setSiriButtonIdentifier:", 1);
  -[SBSiriHardwareButtonEventsOnlyButtonInteraction setParentSiriInteraction:](v4, "setParentSiriInteraction:", v3);

  return v4;
}

- (BOOL)consumeSinglePressUp
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentSiriInteraction);
  v3 = objc_msgSend(WeakRetained, "consumeSinglePressUp");

  return v3;
}

- (int64_t)siriButtonIdentifier
{
  return self->_siriButtonIdentifier;
}

- (void)setSiriButtonIdentifier:(int64_t)a3
{
  self->_siriButtonIdentifier = a3;
}

- (SBSiriHardwareButtonInteraction)parentSiriInteraction
{
  return (SBSiriHardwareButtonInteraction *)objc_loadWeakRetained((id *)&self->_parentSiriInteraction);
}

- (void)setParentSiriInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_parentSiriInteraction, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentSiriInteraction);
}

@end
