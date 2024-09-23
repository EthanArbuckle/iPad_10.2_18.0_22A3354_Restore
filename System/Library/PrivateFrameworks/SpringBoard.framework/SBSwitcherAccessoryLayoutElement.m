@implementation SBSwitcherAccessoryLayoutElement

- (SBSwitcherAccessoryLayoutElement)initWithType:(unint64_t)a3
{
  SBSwitcherAccessoryLayoutElement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSwitcherAccessoryLayoutElement;
  result = -[SBSwitcherAccessoryLayoutElement init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (unint64_t)switcherLayoutElementType
{
  return self->_type;
}

- (unint64_t)type
{
  return self->_type;
}

@end
