@implementation THSectionLayout

- (void)dealloc
{
  objc_super v3;

  -[THSectionLayout setChildren:](self, "setChildren:", +[NSArray array](NSArray, "array"));
  v3.receiver = self;
  v3.super_class = (Class)THSectionLayout;
  -[THSectionLayout dealloc](&v3, "dealloc");
}

- (void)setGeometry:(id)a3
{
  id v5;
  __int128 v6;
  objc_super v7;
  objc_super v8;
  _OWORD v9[3];

  if (objc_msgSend(-[THSectionLayout info](self, "info"), "anchorAtOrigin"))
  {
    v5 = objc_msgSend(a3, "mutableCopy");
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9[1] = v6;
    v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v5, "setTransform:", v9);
    v8.receiver = self;
    v8.super_class = (Class)THSectionLayout;
    -[THSectionLayout setGeometry:](&v8, "setGeometry:", v5);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)THSectionLayout;
    -[THSectionLayout setGeometry:](&v7, "setGeometry:", a3);
  }
}

- (id)computeLayoutGeometry
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(objc_msgSend(-[THSectionLayout info](self, "info"), "pageController"), "i_rectForSectionLayout");
  x = v3;
  y = v5;
  v8 = v7;
  v10 = v9;
  if (objc_msgSend(-[THSectionLayout info](self, "info"), "anchorAtOrigin"))
  {
    y = CGPointZero.y;
    x = CGPointZero.x;
  }
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, v8, v10);
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)dependentLayouts
{
  id v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THSectionLayout;
  v3 = objc_msgSend(-[THSectionLayout parent](&v6, "parent"), "children");
  v4 = (char *)objc_msgSend(v3, "indexOfObject:", self) + 1;
  if (v4 >= objc_msgSend(v3, "count"))
    return 0;
  else
    return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(v3, "objectAtIndex:", v4));
}

- (BOOL)shouldFilterTextSource:(id)a3
{
  return 1;
}

- (BOOL)useApplicationFontScaleForTextSource:(id)a3
{
  return 1;
}

- (unint64_t)fontSizeForTextSource:(id)a3
{
  return (unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(-[THSectionLayout info](self, "info", a3), "pageController"), "presentationType"), "fontSize");
}

@end
