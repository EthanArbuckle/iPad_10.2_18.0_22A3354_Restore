@implementation UIPDFViewManager

+ (id)sharedViewManager
{
  if (_MergedGlobals_3_21 != -1)
    dispatch_once(&_MergedGlobals_3_21, &__block_literal_global_477);
  return (id)qword_1ECD7A768;
}

UIPDFViewManager *__37__UIPDFViewManager_sharedViewManager__block_invoke()
{
  UIPDFViewManager *result;

  result = objc_alloc_init(UIPDFViewManager);
  qword_1ECD7A768 = (uint64_t)result;
  return result;
}

- (void)makeViewActive:(id)a3
{
  UIView *activeView;
  UIView *v6;

  activeView = self->_activeView;
  objc_sync_enter(activeView);
  v6 = self->_activeView;
  if (v6 != a3)
  {
    if (v6)
      -[UIView clearSelection](v6, "clearSelection");
    self->_activeView = (UIView *)a3;
  }
  objc_sync_exit(activeView);
}

- (void)viewReleased:(id)a3
{
  UIView *activeView;

  activeView = self->_activeView;
  objc_sync_enter(activeView);
  if (self->_activeView == a3)
    self->_activeView = 0;
  objc_sync_exit(activeView);
}

@end
