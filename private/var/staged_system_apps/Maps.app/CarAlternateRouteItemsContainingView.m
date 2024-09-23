@implementation CarAlternateRouteItemsContainingView

- (CarAlternateRouteItemsContainingView)initWithDataSource:(id)a3
{
  id v5;
  CarAlternateRouteItemsContainingView *v6;
  CarAlternateRouteItemsContainingView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarAlternateRouteItemsContainingView;
  v6 = -[CarAlternateRouteItemsContainingView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dataSource, a3);

  return v7;
}

- (id)focusItemsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[9];
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)CarAlternateRouteItemsContainingView;
  v8 = -[CarAlternateRouteItemsContainingView focusItemsInRect:](&v17, "focusItemsInRect:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarAlternateRouteItemsContainingView dataSource](self, "dataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "focusableRouteItems"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10031D188;
  v16[3] = &unk_1011B1900;
  v16[4] = self;
  *(CGFloat *)&v16[5] = x;
  *(CGFloat *)&v16[6] = y;
  *(CGFloat *)&v16[7] = width;
  *(CGFloat *)&v16[8] = height;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v16));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v13));

  return v14;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (CarAlternateRouteItemsContainingViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
