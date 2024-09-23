@implementation UIView

- (BOOL)bkaxAccessibilityShowContextMenuAtPoint:(CGPoint)a3
{
  double y;
  double x;
  UIView *v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  y = a3.y;
  x = a3.x;
  v5 = self;
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  do
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if (v13)
          {
            v14 = objc_opt_class(UIContextMenuInteraction);
            if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
            {
              v15 = v13;
              if ((objc_opt_respondsToSelector(v15, "_presentMenuAtLocation:") & 1) != 0)
              {
                objc_msgSend(v15, "_presentMenuAtLocation:", x, y);

                v7 = 1;
                goto LABEL_16;
              }

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_16:

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "superview"));
    v6 = (void *)v16;
  }
  while (v16);
  return v7;
}

- (void)addAnimatablePropertyWithKey:(id)a3
{
  id AssociatedObject;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    if (qword_1009F50A8 != -1)
      dispatch_once(&qword_1009F50A8, &stru_1008EBDF8);
    AssociatedObject = objc_getAssociatedObject(self, &off_1008EBE18);
    v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
    if ((objc_msgSend(v5, "containsObject:", v7) & 1) == 0)
    {
      if (v5)
      {
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObject:", v7));

        v5 = (void *)v6;
      }
      else
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
      }
      objc_setAssociatedObject(self, &off_1008EBE18, v5, (void *)0x301);
    }

  }
}

- (BOOL)bk_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  id AssociatedObject;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  AssociatedObject = objc_getAssociatedObject(self, &off_1008EBE18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (-[UIView bk_shouldAnimatePropertyWithKey:](self, "bk_shouldAnimatePropertyWithKey:", v4))
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

+ (void)animateWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5 options:(unint64_t)a6 animations:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;

  v15 = a7;
  v13 = a8;
  if (a5)
  {
    v14 = a5;
    a5 = objc_alloc_init(BKCustomAnimationCurveFactory);
    objc_msgSend(a5, "setTimingFunction:", v14);

    a6 |= 0x60000uLL;
  }
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", a6, a5, v15, v13, a3, a4);

}

- (CGRect)untransformedFrame
{
  UIView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_1004112E4();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setUntransformedFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100411494(x, y, width, height);

}

@end
