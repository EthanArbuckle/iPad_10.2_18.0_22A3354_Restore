@implementation RouteStepFooterItem

- (RouteStepFooterItem)initWithCommandSet:(int64_t)a3 cellClass:(Class)a4 state:(unint64_t)a5 metrics:(id)a6 context:(int64_t)a7 route:(id)a8 scale:(double)a9
{
  RouteStepFooterItem *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RouteStepFooterItem;
  result = -[RouteStepItem initWithCellClass:state:metrics:context:route:scale:](&v11, "initWithCellClass:state:metrics:context:route:scale:", a4, a5, a6, a7, a8, a9);
  if (result)
    result->_commandSet = a3;
  return result;
}

- (int64_t)commandSet
{
  return self->_commandSet;
}

- (RoutePlanningFooterViewDelegate)delegate
{
  return (RoutePlanningFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
