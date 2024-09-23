@implementation CRLScrollView

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  char v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[7];

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (a4)
  {
    -[CRLScrollView contentOffset](self, "contentOffset");
    if (x != v9 || y != v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
      v12 = objc_opt_respondsToSelector(v11, "scrollView:willAnimateToContentOffset:");

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
        objc_msgSend(v13, "scrollView:willAnimateToContentOffset:", self, x, y);

      }
    }
  }
  if (-[CRLScrollView p_optOutOfUIScrollViewContentOffsetAnimation](self, "p_optOutOfUIScrollViewContentOffsetAnimation"))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004F24C;
    v18[3] = &unk_10122EDB8;
    v18[4] = self;
    *(double *)&v18[5] = x;
    *(double *)&v18[6] = y;
    v14 = objc_retainBlock(v18);
    v15 = v14;
    if (v4)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004F258;
      v17[3] = &unk_10122F780;
      v17[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v14, v17, 0.3);
    }
    else
    {
      ((void (*)(_QWORD *))v14[2])(v14);
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLScrollView;
    -[CRLScrollView setContentOffset:animated:](&v16, "setContentOffset:animated:", v4, x, y);
  }
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLScrollView;
  -[CRLScrollView setContentOffset:](&v3, "setContentOffset:", a3.x, a3.y);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v15;
  objc_super v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[CRLScrollView contentInset](self, "contentInset");
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLScrollView;
    -[CRLScrollView setContentInset:](&v16, "setContentInset:", top, left, bottom, right);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("CRLScrollViewContentInsetDidChangeNotification"), self);

  }
}

- (void)setContentOffset:(CGPoint)a3 relativeToOriginalSize:(CGSize)a4
{
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  double v15;

  width = a4.width;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate", a3.x, a3.y, a4.width, a4.height));
  if ((objc_opt_respondsToSelector(v8, "scrollViewShouldAnchorToRightEdge:") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
    v10 = objc_msgSend(v9, "scrollViewShouldAnchorToRightEdge:", self);

    v11 = v10 ^ 1;
  }
  else
  {
    v11 = 1;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v12, "contentViewCanResizeToFitScrollView:") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
    v14 = objc_msgSend(v13, "contentViewCanResizeToFitScrollView:", self);

    if (((v11 | v14 ^ 1) & 1) == 0)
    {
      -[CRLScrollView contentSize](self, "contentSize");
      x = x - (width - v15);
    }
  }
  else
  {

  }
  -[CRLScrollView setContentOffset:](self, "setContentOffset:", x, y);
}

- (void)safeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLScrollView;
  -[CRLScrollView safeAreaInsetsDidChange](&v4, "safeAreaInsetsDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CRLScrollViewSafeAreaInsetsDidChangeNotification"), self);

}

- (void)setContentSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;

  if (a3.height > 0.0 && a3.width > 0.0)
  {
    v6 = v3;
    v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)CRLScrollView;
    -[CRLScrollView setContentSize:](&v5, "setContentSize:");
  }
}

- (BOOL)p_optOutOfUIScrollViewContentOffsetAnimation
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScrollView delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "scrollViewShouldOptOutOfUIScrollViewContentOffsetAnimationForScrollView:", self);

  return v6;
}

@end
