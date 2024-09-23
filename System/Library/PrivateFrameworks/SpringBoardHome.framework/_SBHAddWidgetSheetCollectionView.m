@implementation _SBHAddWidgetSheetCollectionView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[_SBHAddWidgetSheetCollectionView containsInteractiveUIControls](self, "containsInteractiveUIControls"))
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBHAddWidgetSheetCollectionView;
    v5 = -[_SBHAddWidgetSheetCollectionView touchesShouldCancelInContentView:](&v7, sel_touchesShouldCancelInContentView_, v4);
  }

  return v5;
}

- (BOOL)containsInteractiveUIControls
{
  return self->_containsInteractiveUIControls;
}

- (void)setContainsInteractiveUIControls:(BOOL)a3
{
  self->_containsInteractiveUIControls = a3;
}

@end
