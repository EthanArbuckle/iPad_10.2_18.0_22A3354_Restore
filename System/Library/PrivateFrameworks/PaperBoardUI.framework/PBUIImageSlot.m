@implementation PBUIImageSlot

- (id)_initWithImage:(id)a3 lifetimeToken:(id)a4
{
  id v7;
  id v8;
  PBUIImageSlot *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBUIImageSlot;
  v9 = -[PBUIImageSlot init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (void)dealloc
{
  BSInvalidatable *lifetimeToken;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_lifetimeToken, "invalidate");
  lifetimeToken = self->_lifetimeToken;
  self->_lifetimeToken = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBUIImageSlot;
  -[PBUIImageSlot dealloc](&v4, sel_dealloc);
}

- (id)_deferredImageSlot
{
  return 0;
}

- (UIImage)image
{
  return (UIImage *)objc_getProperty(self, a2, 8, 1);
}

- (void)_setImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BSInvalidatable)lifetimeToken
{
  return self->_lifetimeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeToken, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
