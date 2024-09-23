@implementation _SBHardwareButtonPortalObservationToken

- (_SBHardwareButtonPortalObservationToken)initWithObserverBlock:(id)a3 invalidationBlock:(id)a4
{
  id v6;
  id v7;
  _SBHardwareButtonPortalObservationToken *v8;
  uint64_t v9;
  id observerBlock;
  uint64_t v11;
  id invalidationBlock;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBHardwareButtonPortalObservationToken;
  v8 = -[_SBHardwareButtonPortalObservationToken init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    observerBlock = v8->_observerBlock;
    v8->_observerBlock = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    invalidationBlock = v8->_invalidationBlock;
    v8->_invalidationBlock = (id)v11;

  }
  return v8;
}

- (void)didUpdateWithView:(id)a3
{
  void (**observerBlock)(id, id);

  observerBlock = (void (**)(id, id))self->_observerBlock;
  if (observerBlock)
    observerBlock[2](observerBlock, a3);
}

- (void)invalidate
{
  id invalidationBlock;
  id v4;
  id observerBlock;
  void (**v6)(id, _SBHardwareButtonPortalObservationToken *);

  invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v6 = (void (**)(id, _SBHardwareButtonPortalObservationToken *))objc_msgSend(invalidationBlock, "copy");
    v4 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

    observerBlock = self->_observerBlock;
    self->_observerBlock = 0;

    v6[2](v6, self);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerBlock, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
