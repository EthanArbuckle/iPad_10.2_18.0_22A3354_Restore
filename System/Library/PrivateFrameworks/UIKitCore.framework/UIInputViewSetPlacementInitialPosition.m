@implementation UIInputViewSetPlacementInitialPosition

- (BOOL)isEqual:(id)a3
{
  UIInputViewSetPlacementInitialPosition *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementInitialPosition;
  v4 = (UIInputViewSetPlacementInitialPosition *)a3;
  v5 = -[UIInputViewSetPlacement isEqual:](&v7, sel_isEqual_, v4);

  return self != v4 && v5;
}

@end
