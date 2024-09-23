@implementation UIScrollView

+ (void)_maps_updateHairlineAlpha:(double)a3 animated:(BOOL)a4 getter:(id)a5 setter:(id)a6
{
  _BOOL4 v7;
  id v9;
  void ***v10;
  void **v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  double v16;

  v7 = a4;
  v9 = a6;
  if ((*((double (**)(id))a5 + 2))(a5) != a3)
  {
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10043D0AC;
    v14 = &unk_1011B6D60;
    v15 = v9;
    v16 = a3;
    v10 = objc_retainBlock(&v11);
    if (v7)
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.2, 0.0, v11, v12, v13, v14);
    else
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v10, v11, v12, v13, v14);

  }
}

- (void)_maps_scrollTextViewSelectedRangeVisible:(id)a3
{
  void *v4;
  double x;
  double y;
  double width;
  double height;
  unint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedTextRange"));
  if (v4)
  {
    objc_msgSend(v15, "firstRectForRange:", v4);
    -[UIScrollView convertRect:toView:](self, "convertRect:toView:", v15);
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    v18.origin.x = CGRectZero.origin.x;
    v18.origin.y = CGRectZero.origin.y;
    v18.size.width = CGRectZero.size.width;
    v18.size.height = CGRectZero.size.height;
    if (!CGRectEqualToRect(v16, v18))
    {
      v9 = 0;
      do
      {
        -[UIScrollView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0, x, y, width, height);
        -[UIScrollView layoutIfNeeded](self, "layoutIfNeeded");
        objc_msgSend(v15, "firstRectForRange:", v4);
        -[UIScrollView convertRect:toView:](self, "convertRect:toView:", v15);
        v10 = v17.origin.x;
        v11 = v17.origin.y;
        v12 = v17.size.width;
        v13 = v17.size.height;
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        if (CGRectEqualToRect(v17, v19))
          break;
        x = v10;
        y = v11;
        width = v12;
        height = v13;
      }
      while (v9++ < 9);
    }
  }

}

- (unint64_t)_maps_edgesObscuringContentIncludingContentInsets:(BOOL)a3
{
  _BOOL4 v3;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Width;
  CGFloat Height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double MaxY;
  double MaxX;
  double v23;
  CGFloat v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v3 = a3;
  -[UIScrollView bounds](self, "bounds");
  MinX = CGRectGetMinX(v26);
  -[UIScrollView bounds](self, "bounds");
  MinY = CGRectGetMinY(v27);
  -[UIScrollView bounds](self, "bounds");
  Width = CGRectGetWidth(v28);
  -[UIScrollView bounds](self, "bounds");
  Height = CGRectGetHeight(v29);
  -[UIScrollView contentSize](self, "contentSize");
  v10 = v9;
  -[UIScrollView contentSize](self, "contentSize");
  v12 = v11;
  if (v3)
  {
    -[UIScrollView adjustedContentInset](self, "adjustedContentInset");
    v16 = 0.0 - v15;
    v25 = 0.0 - v17;
    v10 = v10 - (-v14 - v15);
    v12 = v12 - (-v13 - v17);
  }
  else
  {
    v25 = 0.0;
    v16 = 0.0;
  }
  v30.origin.x = MinX;
  v30.origin.y = MinY;
  v30.size.width = Width;
  v30.size.height = Height;
  v24 = MinX;
  v23 = CGRectGetMinY(v30);
  v31.origin.x = v16;
  v31.origin.y = v25;
  v31.size.width = v10;
  v31.size.height = v12;
  v18 = v23 > CGRectGetMinY(v31);
  v32.origin.x = MinX;
  v32.origin.y = MinY;
  v32.size.width = Width;
  v32.size.height = Height;
  v19 = CGRectGetMinX(v32);
  v33.origin.x = v16;
  v33.origin.y = v25;
  v33.size.width = v10;
  v33.size.height = v12;
  if (v19 > CGRectGetMinX(v33))
    v18 |= 2uLL;
  v34.origin.x = v24;
  v34.origin.y = MinY;
  v34.size.width = Width;
  v34.size.height = Height;
  MaxY = CGRectGetMaxY(v34);
  v35.origin.x = v16;
  v35.origin.y = v25;
  v35.size.width = v10;
  v35.size.height = v12;
  if (MaxY < CGRectGetMaxY(v35))
    v18 |= 4uLL;
  v36.origin.x = v24;
  v36.origin.y = MinY;
  v36.size.width = Width;
  v36.size.height = Height;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = v16;
  v37.origin.y = v25;
  v37.size.width = v10;
  v37.size.height = v12;
  if (MaxX >= CGRectGetMaxX(v37))
    return v18;
  else
    return v18 | 8;
}

@end
