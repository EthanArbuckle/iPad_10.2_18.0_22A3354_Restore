@implementation SearchSelectionAction

- (SearchSelectionAction)initWithSelectedIndex:(unint64_t)a3
{
  SearchSelectionAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchSelectionAction;
  result = -[SearchSelectionAction init](&v5, "init");
  if (result)
    result->_selectedIndex = a3;
  return result;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 29;
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

@end
