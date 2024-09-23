@implementation TSWPPlaceholderSmartField

- (TSWPPlaceholderSmartField)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPPlaceholderSmartField;
  return -[TSWPSmartField initWithContext:](&v4, sel_initWithContext_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPPlaceholderSmartField;
  -[TSWPSmartField dealloc](&v2, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPPlaceholderSmartField;
  v4 = -[TSWPSmartField copyWithContext:](&v6, sel_copyWithContext_, a3);
  if (v4)
    objc_msgSend(v4, "setIsLocalizable:", -[TSWPPlaceholderSmartField isLocalizable](self, "isLocalizable"));
  return v4;
}

- (int)elementKind
{
  return 1024;
}

- (BOOL)isLocalizable
{
  return self->_localizable;
}

- (void)setIsLocalizable:(BOOL)a3
{
  self->_localizable = a3;
}

@end
