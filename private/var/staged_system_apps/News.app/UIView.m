@implementation UIView

- (void)roundOrigin
{
  double v3;
  double v4;

  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", round(v3), round(v4));
}

- (void)fr_setMinX:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", a3);
}

- (void)fr_setMaxX:(double)a3
{
  double v5;

  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:", a3 - v5);
}

- (void)fr_setMinY:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (void)fr_setMaxY:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (double)fr_width
{
  CGRect v3;

  -[UIView frame](self, "frame");
  return CGRectGetWidth(v3);
}

- (void)setFr_width:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (double)fr_height
{
  CGRect v3;

  -[UIView frame](self, "frame");
  return CGRectGetHeight(v3);
}

- (void)setFr_height:(double)a3
{
  -[UIView fr_setHeight:](self, "fr_setHeight:", a3);
}

- (void)fr_setHeight:(double)a3
{
  -[UIView frame](self, "frame");
  -[UIView setFrame:](self, "setFrame:");
}

- (void)fr_accessibilityWorkaroundFor20458918ByClearingParentTableCellsChildCache
{
  id v2;
  SEL v3;
  id v4;

  v2 = -[UIView fr_selfOrFirstAncestorOfType:](self, "fr_selfOrFirstAncestorOfType:", objc_opt_class(UITableViewCell, a2));
  v4 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = NSSelectorFromString(CFSTR("_accessibilityClearChildren"));
  if ((objc_opt_respondsToSelector(v4, v3) & 1) != 0)
    objc_msgSend(v4, "_accessibilityClearChildren");

}

- (BOOL)fr_hasAncestorOfType:(Class)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView fr_firstAncestorOfType:](self, "fr_firstAncestorOfType:", a3));
  v4 = v3 != 0;

  return v4;
}

- (id)fr_firstAncestorOfType:(Class)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    while ((objc_opt_isKindOfClass(v5, a3) & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v7 = v5;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (id)fr_selfOrFirstAncestorOfType:(Class)a3
{
  UIView *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = self;
  if (v4)
  {
    v5 = v4;
    while ((objc_opt_isKindOfClass(v5, a3) & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v7 = v5;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (id)fr_subviewsOfType:(Class)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v11, a3) & 1) != 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  return v12;
}

- (CGRect)fr_adjustedWidthAndXOriginFromFrame:(CGRect)a3
{
  CGFloat width;
  CGFloat x;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  width = a3.size.width;
  x = a3.origin.x;
  -[UIView frame](self, "frame", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = x;
  v8 = width;
  result.size.height = v6;
  result.size.width = v8;
  result.origin.y = v5;
  result.origin.x = v7;
  return result;
}

+ (void)fr_animateWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;

  v15 = a7;
  v13 = a8;
  if (a5)
  {
    v14 = a5;
    a5 = objc_alloc_init(FRCustomAnimationCurveFactory);
    objc_msgSend(a5, "setTimingFunction:", v14);

    a6 |= 0x60000uLL;
  }
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", a6, a5, v15, v13, a3, a4);

}

- (void)fr_setBlurred:(BOOL)a3 radius:(double)a4 animated:(BOOL)a5 duration:(double)a6
{
  _BOOL4 v7;
  _BOOL4 v9;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  _UNKNOWN **v16;
  _UNKNOWN **v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void **v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  UIView *v46;
  id v47;
  __CFString *v48;
  uint64_t v49;
  double v50;
  BOOL v51;
  _QWORD v52[6];
  void *v53;
  void *v54;

  v7 = a5;
  v9 = a3;
  if (!UIAccessibilityIsReduceTransparencyEnabled())
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "scale");
    v14 = v13;

    v15 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    v16 = (_UNKNOWN **)v15;
    if (v9)
    {
      if (v7)
      {
        v17 = (_UNKNOWN **)v15;
        v16 = &off_1000E4C80;
        v18 = 0.7;
        v19 = v14;
LABEL_10:
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        objc_msgSend(v20, "setShouldRasterize:", 1);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        objc_msgSend(v21, "setRasterizationScale:", v18);

        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a6);
        v42 = _NSConcreteStackBlock;
        v43 = 3221225472;
        v44 = sub_100075650;
        v45 = &unk_1000DEE10;
        v46 = self;
        v22 = v17;
        v47 = v22;
        v48 = CFSTR("filters.gaussianBlur.inputRadius");
        v51 = v9;
        v49 = 0x3FE6666666666666;
        v50 = v14;
        +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", &v42);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterGaussianBlur, v42, v43, v44, v45, v46));
        objc_msgSend(v23, "setName:", CFSTR("gaussianBlur"));
        objc_msgSend(v23, "setCachesInputImage:", 0);
        objc_msgSend(v23, "setValue:forKey:", v16, CFSTR("inputRadius"));
        objc_msgSend(v23, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        v54 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
        objc_msgSend(v24, "setFilters:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius")));
        objc_msgSend(v26, "setRemovedOnCompletion:", 0);
        objc_msgSend(v26, "setFillMode:", kCAFillModeForwards);
        objc_msgSend(v26, "setFromValue:", v16);
        objc_msgSend(v26, "setToValue:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        objc_msgSend(v27, "addAnimation:forKey:", v26, CFSTR("filters.gaussianBlur.inputRadius"));

        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a6 * 0.1);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("rasterizationScale")));
        objc_msgSend(v28, "setRemovedOnCompletion:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
        objc_msgSend(v28, "setFromValue:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
        objc_msgSend(v28, "setToValue:", v30);

        objc_msgSend(v28, "setFillMode:", kCAFillModeBackwards);
        if (!v9)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
          objc_msgSend(v31, "convertTime:fromLayer:", 0, CACurrentMediaTime());
          objc_msgSend(v28, "setBeginTime:", v32 + a6 - a6 * 0.1);

        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
        objc_msgSend(v33, "addAnimation:forKey:", v28, CFSTR("rasterizationScale"));

        +[CATransaction commit](CATransaction, "commit");
        +[CATransaction commit](CATransaction, "commit");

        goto LABEL_15;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterGaussianBlur));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
      objc_msgSend(v35, "setShouldRasterize:", 1);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
      objc_msgSend(v36, "setRasterizationScale:", 0.7);

      objc_msgSend(v34, "setName:", CFSTR("gaussianBlur"));
      objc_msgSend(v34, "setCachesInputImage:", 0);
      objc_msgSend(v34, "setValue:forKey:", v16, CFSTR("inputRadius"));
      objc_msgSend(v34, "setValue:forKey:", CFSTR("low"), CFSTR("inputQuality"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
      v53 = v34;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
      objc_msgSend(v37, "setFilters:", v38);

      v22 = v16;
      v16 = &off_1000E4C80;
    }
    else
    {
      if (v7)
      {
        v17 = &off_1000E4C80;
        v19 = 0.7;
        v18 = v14;
        goto LABEL_10;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
      objc_msgSend(v39, "setFilters:", &__NSArray0__struct);

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
      objc_msgSend(v40, "setShouldRasterize:", 0);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
      objc_msgSend(v41, "setRasterizationScale:", 1.0);

      v22 = &off_1000E4C80;
    }
LABEL_15:

    return;
  }
  v11 = 1.0;
  if (v9)
    v11 = 0.0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100075644;
  v52[3] = &unk_1000DDD70;
  v52[4] = self;
  *(double *)&v52[5] = v11;
  +[UIView fr_animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "fr_animateWithDuration:delay:timingFunction:options:animations:completion:", 0, 0, v52, 0, a6, 0.0);
}

+ (id)fr_adjacentSiblingViewsFromViews:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v27;
  void *v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 512));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    v27 = *(_QWORD *)v36;
    v28 = v6;
    do
    {
      v15 = 0;
      v29 = v13;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v15), "superview", v27));
        if ((objc_msgSend(v6, "containsObject:", v16) & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subviews"));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(_QWORD *)v32 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)j);
                if (objc_msgSend(v5, "containsObject:", v23))
                {
                  objc_msgSend(v17, "addObject:", v23);
                }
                else if (objc_msgSend(v17, "count"))
                {
                  v24 = objc_msgSend(v17, "copy");
                  objc_msgSend(v4, "addObject:", v24);

                  objc_msgSend(v17, "removeAllObjects");
                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
            }
            while (v20);
          }

          if (objc_msgSend(v17, "count"))
          {
            v25 = objc_msgSend(v17, "copy");
            objc_msgSend(v4, "addObject:", v25);

          }
          v6 = v28;
          objc_msgSend(v28, "addObject:", v16);

          v14 = v27;
          v13 = v29;
        }

        v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v13);
  }

  return v4;
}

- (void)fr_recolorLabelSubviewsWithColor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(UILabel, v7);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          objc_msgSend(v11, "setTextColor:", v4);
        else
          objc_msgSend(v11, "fr_recolorLabelSubviewsWithColor:", v4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)visible
{
  double v3;
  CGRect v5;

  if (-[UIView isHidden](self, "isHidden"))
    return 0;
  -[UIView alpha](self, "alpha");
  if (v3 <= 0.0)
    return 0;
  -[UIView frame](self, "frame");
  return !CGRectIsEmpty(v5);
}

@end
