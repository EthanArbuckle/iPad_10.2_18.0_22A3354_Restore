@implementation UIView

- (CGAffineTransform)transformToAbutToEdge:(SEL)a3 ofView:(unint64_t)a4
{
  id v9;
  __int128 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGAffineTransform *result;
  void *v24;
  id v25;

  v9 = a5;
  v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v25 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));

  if (!v11)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PHInCallUIUtilities.m"), 72, CFSTR("The window must not be nil to abut views within it."));

  }
  if (a4 == 8)
  {
    -[UIView frame](self, "frame");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0);
    v16 = v18;
    objc_msgSend(v25, "frame");
    v20 = v19;
    objc_msgSend(v25, "frame");
    v17 = v20 + v21;
    goto LABEL_7;
  }
  if (a4 == 2)
  {
    -[UIView frame](self, "frame");
    v13 = v12;
    -[UIView frame](self, "frame");
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v13 + v14, 0.0);
    v16 = v15;
    objc_msgSend(v25, "frame");
LABEL_7:
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v17, 0.0);
    *(float *)&v22 = v22 - v16;
    CGAffineTransformMakeTranslation(retstr, roundf(*(float *)&v22), 0.0);
  }

  return result;
}

- (double)xOriginForCenterOfSuperview
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));

  if (!v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInCallUIUtilities.m"), 94, CFSTR("xOriginForCenterOfSuperview - there is no superview"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  objc_msgSend(v5, "bounds");
  v7 = v6 * 0.5;
  -[UIView bounds](self, "bounds");
  v9 = v7 - v8 * 0.5;
  v10 = floorf(v9);

  return v10;
}

- (double)yOriginForCenterOfSuperview
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));

  if (!v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHInCallUIUtilities.m"), 101, CFSTR("yOriginForCenterOfSuperview - there is no superview"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  objc_msgSend(v5, "bounds");
  v7 = v6 * 0.5;
  -[UIView bounds](self, "bounds");
  v9 = v7 - v8 * 0.5;
  v10 = floorf(v9);

  return v10;
}

@end
