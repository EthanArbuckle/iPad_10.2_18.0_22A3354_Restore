@implementation PRUISSwitcherLayout

- (PRUISSwitcherLayout)initWithLayoutMode:(unint64_t)a3
{
  PRUISSwitcherLayout *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRUISSwitcherLayout;
  result = -[PRUISSwitcherLayout init](&v5, sel_init);
  if (result)
    result->_layoutMode = a3;
  return result;
}

- (unint64_t)layoutMode
{
  return self->_layoutMode;
}

@end
