@implementation CarTableView

- (void)setAccessoryView:(id)a3 atEdge:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CarTableView;
  -[CarTableView setAccessoryView:atEdge:](&v18, "setAccessoryView:atEdge:", v5, 4);
  v6 = objc_msgSend(v5, "_mapsCar_injectBlurView");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "_mapsCar_recursiveSubviewsWithClass:", objc_opt_class(UIButton), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v8);
        LODWORD(v10) = 0;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "setCharge:", v10);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v11);
  }

}

- (id)accessoryViewAtEdge:(int64_t)a3
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarTableView;
  v3 = -[CarTableView accessoryViewAtEdge:](&v5, "accessoryViewAtEdge:", 4);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (UIEdgeInsets)_sectionContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 10.0;
  v4 = 10.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_sectionCornerRadius
{
  return 4.0;
}

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (id)_car_visibleCells
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView visibleCells](self, "visibleCells"));
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    -[CarTableView frame](self, "frame");
    v6 = v5;
    v8 = v7;
    -[CarTableView _sectionContentInset](self, "_sectionContentInset");
    v11 = v6 - (v9 + v10);
    v14 = v8 - (v12 + v13);
    -[CarTableView contentOffset](self, "contentOffset");
    v16 = v15;
    -[CarTableView contentOffset](self, "contentOffset");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100B6E200;
    v21[3] = &unk_1011E6F58;
    v21[4] = v16;
    v21[5] = v17;
    *(double *)&v21[6] = v11;
    *(double *)&v21[7] = v14;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexesOfObjectsPassingTest:", v21));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsAtIndexes:", v18));

  }
  else
  {
    v19 = &__NSArray0__struct;
  }

  return v19;
}

- (id)_car_indexPathsForVisibleRows
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self, "_car_visibleCells"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B6E2A4;
  v7[3] = &unk_1011E6F80;
  v7[4] = self;
  v4 = sub_10039DCD4(v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end
