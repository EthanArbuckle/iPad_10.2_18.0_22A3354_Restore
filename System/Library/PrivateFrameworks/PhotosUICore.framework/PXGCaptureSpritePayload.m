@implementation PXGCaptureSpritePayload

- (PXGCaptureSpritePayload)initWithBehavior:(unint64_t)a3 renderSnapshot:(id)a4
{
  id v7;
  PXGCaptureSpritePayload *v8;
  PXGCaptureSpritePayload *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXGCaptureSpritePayload;
  v8 = -[PXGCaptureSpritePayload init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_behavior = a3;
    objc_storeStrong((id *)&v8->_renderSnapshot, a4);
  }

  return v9;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (PXGRenderSnapshot)renderSnapshot
{
  return self->_renderSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderSnapshot, 0);
}

@end
