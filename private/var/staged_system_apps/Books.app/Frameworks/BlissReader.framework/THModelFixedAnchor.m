@implementation THModelFixedAnchor

- (THModelFixedAnchor)initWithContentNode:(id)a3 elementId:(id)a4
{
  THModelFixedAnchor *v5;
  THModelFixedAnchor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THModelFixedAnchor;
  v5 = -[THModelBoundAnchor initWithContentNode:](&v8, "initWithContentNode:", a3);
  v6 = v5;
  if (v5)
    -[THModelFixedAnchor setElementId:](v5, "setElementId:", a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[THModelFixedAnchor setElementId:](self, "setElementId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THModelFixedAnchor;
  -[THModelBoundAnchor dealloc](&v3, "dealloc");
}

- (NSString)elementId
{
  return self->mElementId;
}

- (void)setElementId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
