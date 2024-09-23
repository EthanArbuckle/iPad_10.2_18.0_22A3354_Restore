@implementation TUIVScrollBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIVScrollBoxLayout, a2);
}

- (TUIIdentifier)modelIdentifierForScrollable
{
  return self->_modelIdentifierForScrollable;
}

- (void)setModelIdentifierForScrollable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)anchorOffset
{
  return self->_anchorOffset;
}

- (void)setAnchorOffset:(double)a3
{
  self->_anchorOffset = a3;
}

- (BOOL)acceptsDrop
{
  return self->_acceptsDrop;
}

- (void)setAcceptsDrop:(BOOL)a3
{
  self->_acceptsDrop = a3;
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return self->_dropHandler;
}

- (void)setDropHandler:(id)a3
{
  objc_storeStrong((id *)&self->_dropHandler, a3);
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropHandler, 0);
  objc_storeStrong((id *)&self->_modelIdentifierForScrollable, 0);
}

@end
