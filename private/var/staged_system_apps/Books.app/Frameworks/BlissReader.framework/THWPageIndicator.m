@implementation THWPageIndicator

- (THWPageIndicator)initWithLayer:(id)a3
{
  THWPageIndicator *v4;
  THWPageIndicator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWPageIndicator;
  v4 = -[THWPageIndicator init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THWPageIndicator setLayer:](v4, "setLayer:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THWPageIndicator setLayer:](self, "setLayer:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWPageIndicator;
  -[THWPageIndicator dealloc](&v3, "dealloc");
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
