@implementation PXGEngineDeferRenderEvent

- (PXGEngineDeferRenderEvent)initWithShouldDeferRenderUntilNextFrame:(BOOL)a3 delegateAllowsRender:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  PXGEngineDeferRenderEvent *v6;
  PXGEngineDeferRenderEventSerializable *v7;
  PXGEngineDeferRenderEventSerializable *serializable;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGEngineDeferRenderEvent;
  v6 = -[PXGTungstenRecordingEvent initWithComponent:eventName:](&v10, sel_initWithComponent_eventName_, 0, CFSTR("deferRender"));
  if (v6)
  {
    v7 = objc_alloc_init(PXGEngineDeferRenderEventSerializable);
    serializable = v6->_serializable;
    v6->_serializable = v7;

    -[PXGEngineDeferRenderEventSerializable setShouldDeferRenderUntilNextFrame:](v6->_serializable, "setShouldDeferRenderUntilNextFrame:", v5);
    -[PXGEngineDeferRenderEventSerializable setDelegateAllowsRender:](v6->_serializable, "setDelegateAllowsRender:", v4);
  }
  return v6;
}

- (id)serializable
{
  return self->_serializable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializable, 0);
}

+ (id)eventWithShouldDeferRenderUntilNextFrame:(BOOL)a3 delegateAllowsRender:(BOOL)a4
{
  return -[PXGEngineDeferRenderEvent initWithShouldDeferRenderUntilNextFrame:delegateAllowsRender:]([PXGEngineDeferRenderEvent alloc], "initWithShouldDeferRenderUntilNextFrame:delegateAllowsRender:", a3, a4);
}

@end
