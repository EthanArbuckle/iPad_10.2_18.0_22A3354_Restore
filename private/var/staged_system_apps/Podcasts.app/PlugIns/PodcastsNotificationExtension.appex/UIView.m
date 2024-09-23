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

@end
