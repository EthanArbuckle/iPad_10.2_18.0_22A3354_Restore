@implementation _TUISegmentedControlViewState

- (_TUISegmentedControlViewState)initWithSelectIndex:(int64_t)a3
{
  _TUISegmentedControlViewState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TUISegmentedControlViewState;
  result = -[_TUISegmentedControlViewState init](&v5, "init");
  if (result)
    result->_selectIndex = a3;
  return result;
}

- (int64_t)selectIndex
{
  return self->_selectIndex;
}

@end
