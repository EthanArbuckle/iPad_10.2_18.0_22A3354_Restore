@implementation UIView

- (UIEdgeInsets)mt_layoutMargins
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  -[UIView bounds](self, "bounds");
  -[UIView mt_layoutMarginsForWidth:](self, "mt_layoutMarginsForWidth:", v3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[UIView layoutMargins](self, "layoutMargins");
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_opt_class(self), "mt_horizontalMarginsForWidth:", a3);
  v10 = v9;
  v11 = v6;
  v12 = v8;
  v13 = v10;
  result.right = v13;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (BOOL)mt_areMarginsGenerous
{
  void *v3;
  double v4;

  v3 = (void *)objc_opt_class(self);
  -[UIView bounds](self, "bounds");
  return objc_msgSend(v3, "mt_areMarginsGenerousForWidth:", v4);
}

+ (BOOL)mt_areMarginsGenerousForWidth:(double)a3
{
  return a3 > 385.0;
}

+ (double)mt_horizontalMarginsForWidth:(double)a3
{
  unsigned int v3;
  double result;

  v3 = objc_msgSend(a1, "mt_areMarginsGenerousForWidth:", a3);
  result = 16.0;
  if (v3)
    return 20.0;
  return result;
}

+ (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3
{
  unsigned int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v3 = objc_msgSend(a1, "mt_areMarginsGenerousForWidth:", a3);
  v4 = 20.0;
  if (!v3)
    v4 = 16.0;
  v5 = 8.0;
  v6 = 8.0;
  v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (BOOL)mt_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (id)mt_recursivelyFindFirstViewMeetingCriteria:(id)a3
{
  unsigned int (**v4)(id, UIView *);
  UIView *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (unsigned int (**)(id, UIView *))a3;
  if (v4[2](v4, self))
  {
    v5 = self;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), "mt_recursivelyFindFirstViewMeetingCriteria:", v4));
          if (v11)
          {
            v5 = (UIView *)v11;

            goto LABEL_13;
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)mt_setShouldRTLMirror
{
  void *v3;
  id v4;

  if (-[UIView mt_isRTL](self, "mt_isRTL"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[UIView mt_shouldRTLMirrorStackDepth](self, "mt_shouldRTLMirrorStackDepth"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v4, "integerValue") + 1));
    -[UIView mt_setShouldRTLMirrorStackDepth:](self, "mt_setShouldRTLMirrorStackDepth:", v3);

  }
}

- (void)mt_RTLMirrorIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double MaxX;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  CGFloat x;
  double y;
  double width;
  double height;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (-[UIView mt_isRTL](self, "mt_isRTL"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView mt_shouldRTLMirrorStackDepth](self, "mt_shouldRTLMirrorStackDepth"));
    v4 = (uint64_t)objc_msgSend(v3, "integerValue");

    v5 = v4 <= 1 ? 0 : v4 - 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    -[UIView mt_setShouldRTLMirrorStackDepth:](self, "mt_setShouldRTLMirrorStackDepth:", v6);

    if (v4 <= 1)
    {
      -[UIView bounds](self, "bounds");
      MaxX = CGRectGetMaxX(v31);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v8, "scale");
      v10 = v9;

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v16, "mt_isExcludedFromAutomaticRTLMirroring") & 1) == 0)
            {
              objc_msgSend(v16, "frame");
              x = v32.origin.x;
              y = v32.origin.y;
              width = v32.size.width;
              height = v32.size.height;
              v21 = MaxX - CGRectGetMinX(v32);
              v33.origin.x = x;
              v33.origin.y = y;
              v33.size.width = width;
              v33.size.height = height;
              objc_msgSend(v16, "setFrame:", round(v10 * (v21 - CGRectGetWidth(v33))) / v10, y, width, height);
            }
            if (objc_msgSend(v16, "mt_enableAutomaticRTLMirroringForSubviews"))
              objc_msgSend(v16, "mt_RTLMirrorIfNeeded");
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v13);
      }

      v22 = objc_opt_class(UITableViewCell);
      if ((objc_opt_isKindOfClass(self, v22) & 1) != 0
        || (v23 = objc_opt_class(UICollectionViewCell), (objc_opt_isKindOfClass(self, v23) & 1) != 0)
        || (v24 = objc_opt_class(UIVisualEffectView), (objc_opt_isKindOfClass(self, v24) & 1) != 0))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView contentView](self, "contentView"));
        objc_msgSend(v25, "mt_RTLMirrorIfNeeded");

      }
    }
  }
}

- (void)mt_setExcludedFromAutomaticRTLMirroring:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1005675A0, v4, (void *)1);

}

- (BOOL)mt_isExcludedFromAutomaticRTLMirroring
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1005675A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)mt_setEnableAutomaticRTLMirroringForSubviews:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1005675A1, v4, (void *)1);

}

- (BOOL)mt_enableAutomaticRTLMirroringForSubviews
{
  id AssociatedObject;
  void *v3;
  unsigned __int8 v4;

  AssociatedObject = objc_getAssociatedObject(self, &unk_1005675A1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)mt_setShouldRTLMirrorStackDepth:(id)a3
{
  objc_setAssociatedObject(self, &unk_1005675A2, a3, (void *)1);
}

- (id)mt_shouldRTLMirrorStackDepth
{
  return objc_getAssociatedObject(self, &unk_1005675A2);
}

@end
