@implementation TableViewMeasurer

- (TableViewMeasurer)initWithMeasurableView:(id)a3
{
  id v4;
  TableViewMeasurer *v5;
  TableViewMeasurer *v6;
  TableViewMeasurer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TableViewMeasurer;
  v5 = -[TableViewMeasurer init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    v7 = v6;
  }

  return v6;
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_view, obj);
    -[TableViewMeasurer invalidatePreviousMeasurements](self, "invalidatePreviousMeasurements");
    v5 = obj;
  }

}

- (double)fittingHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  objc_msgSend(v3, "layoutIfNeeded");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  objc_msgSend(v4, "_maps_commitUpdates");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  objc_msgSend(v5, "_maps_contentSize");
  v7 = v6;

  return v7;
}

- (CGRect)rectForRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat x;
  double v17;
  CGFloat y;
  double v19;
  CGFloat width;
  double v21;
  CGFloat height;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v6 = objc_msgSend(v4, "section");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  v8 = objc_msgSend(v7, "_maps_numberOfSections");

  if ((uint64_t)v6 >= (uint64_t)v8)
    goto LABEL_7;
  v9 = objc_msgSend(v5, "row");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  v11 = objc_msgSend(v10, "_maps_numberOfRowsInSection:", objc_msgSend(v5, "section"));

  if ((uint64_t)v9 < (uint64_t)v11)
  {
    -[TableViewMeasurer _updateForCurrentTableWidth](self, "_updateForCurrentTableWidth");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer rowRectCache](self, "rowRectCache"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v5));
    if (!v13)
    {
      -[TableViewMeasurer _measureRectsUntilRowAtIndexPath:](self, "_measureRectsUntilRowAtIndexPath:", v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v5));
    }
    v14 = v13;
    objc_msgSend(v13, "CGRectValue");
    x = v15;
    y = v17;
    width = v19;
    height = v21;

  }
  else
  {
LABEL_7:
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)rectForHeaderInSection:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat x;
  double v14;
  CGFloat y;
  double v16;
  CGFloat width;
  double v18;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  v6 = objc_msgSend(v5, "_maps_numberOfSections");

  if ((uint64_t)v6 <= a3)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  else
  {
    -[TableViewMeasurer _updateForCurrentTableWidth](self, "_updateForCurrentTableWidth");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer headerRectCache](self, "headerRectCache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

    if (!v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -1, a3));
      -[TableViewMeasurer _measureRectsUntilRowAtIndexPath:](self, "_measureRectsUntilRowAtIndexPath:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v11));

    }
    objc_msgSend(v9, "CGRectValue");
    x = v12;
    y = v14;
    width = v16;
    height = v18;

  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)invalidatePreviousMeasurements
{
  -[NSCache removeAllObjects](self->_rowRectCache, "removeAllObjects");
  -[NSCache removeAllObjects](self->_headerRectCache, "removeAllObjects");
}

- (void)_updateForCurrentTableWidth
{
  void *v3;
  double v4;
  double v5;
  NSNumber *widthForRectCache;
  float v7;
  NSNumber *v8;
  NSNumber *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;

  widthForRectCache = self->_widthForRectCache;
  if (!widthForRectCache
    || (-[NSNumber floatValue](widthForRectCache, "floatValue"), vabdd_f64(v5, v7) > 0.00000011920929))
  {
    -[NSCache removeAllObjects](self->_rowRectCache, "removeAllObjects");
    -[NSCache removeAllObjects](self->_headerRectCache, "removeAllObjects");
  }
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v9 = self->_widthForRectCache;
  self->_widthForRectCache = v8;

}

- (void)_measureRectsUntilRowAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  id v36;

  v36 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer rowRectCache](self, "rowRectCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer headerRectCache](self, "headerRectCache"));
  if (((unint64_t)objc_msgSend(v36, "section") & 0x8000000000000000) == 0)
  {
    v6 = 0;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v7));

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
        objc_msgSend(v9, "_maps_rectForHeaderInSection:", v6);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v11, v13, v15, v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
        objc_msgSend(v5, "setObject:forKey:", v18, v19);

      }
      if (v6 == objc_msgSend(v36, "section"))
      {
        v20 = (uint64_t)objc_msgSend(v36, "row") + 1;
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
        v20 = (uint64_t)objc_msgSend(v21, "_maps_numberOfRowsInSection:", v6);

      }
      if (v20 >= 1)
      {
        for (i = 0; i != v20; ++i)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, v6));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v23));

          if (!v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[TableViewMeasurer view](self, "view"));
            objc_msgSend(v25, "_maps_rectForRowAtIndexPath:", v23);
            v27 = v26;
            v29 = v28;
            v31 = v30;
            v33 = v32;

            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v27, v29, v31, v33));
            objc_msgSend(v4, "setObject:forKey:", v34, v23);

          }
        }
      }
    }
    while ((uint64_t)v6++ < (uint64_t)objc_msgSend(v36, "section"));
  }

}

- (id)rowRectCache
{
  NSCache *rowRectCache;
  NSCache *v4;
  NSCache *v5;

  rowRectCache = self->_rowRectCache;
  if (!rowRectCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_rowRectCache;
    self->_rowRectCache = v4;

    rowRectCache = self->_rowRectCache;
  }
  return rowRectCache;
}

- (id)headerRectCache
{
  NSCache *headerRectCache;
  NSCache *v4;
  NSCache *v5;

  headerRectCache = self->_headerRectCache;
  if (!headerRectCache)
  {
    v4 = (NSCache *)objc_alloc_init((Class)NSCache);
    v5 = self->_headerRectCache;
    self->_headerRectCache = v4;

    headerRectCache = self->_headerRectCache;
  }
  return headerRectCache;
}

- (MeasurableView)view
{
  return (MeasurableView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_widthForRectCache, 0);
  objc_storeStrong((id *)&self->_headerRectCache, 0);
  objc_storeStrong((id *)&self->_rowRectCache, 0);
}

@end
