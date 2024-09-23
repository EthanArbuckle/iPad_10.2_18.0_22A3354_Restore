@implementation TPSParallaxComputer

- (CGPoint)contentParallaxOffsetForViewFrame:(CGRect)a3 visibleRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD *v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  CGFloat v16;
  double MaxY;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double MaxX;
  double MinY;
  double MinX;
  CGFloat v29;
  _QWORD v30[5];
  CGPoint result;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    v32.origin.x = v11;
    v32.origin.y = v10;
    v32.size.width = v9;
    v32.size.height = v8;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (CGRectIntersectsRect(v32, v41))
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10002EB28;
      v30[3] = &unk_1000A2D68;
      v30[4] = self;
      v13 = objc_retainBlock(v30);
      v14 = -[TPSParallaxComputer axis](self, "axis");
      v15 = v14;
      v29 = height;
      if ((v14 & 1) != 0)
      {
        v37.origin.x = v11;
        v37.origin.y = v10;
        v37.size.width = v9;
        v37.size.height = v8;
        MinX = CGRectGetMinX(v37);
        v38.origin.x = v11;
        v38.origin.y = v10;
        v38.size.width = v9;
        v38.size.height = v8;
        MaxX = CGRectGetMaxX(v38);
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        v21 = CGRectGetMinX(v39);
        v40.size.height = height;
        v22 = v21;
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v23 = CGRectGetMaxX(v40);
        v16 = ((double (*)(_QWORD *, double, double, double, CGFloat))v13[2])(v13, MinX, MaxX, v22, v23);
        if ((v15 & 2) != 0)
          goto LABEL_5;
      }
      else
      {
        v16 = CGPointZero.x;
        if ((v14 & 2) != 0)
        {
LABEL_5:
          v33.origin.x = v11;
          v33.origin.y = v10;
          v33.size.width = v9;
          v33.size.height = v8;
          MinY = CGRectGetMinY(v33);
          v34.origin.x = v11;
          v34.origin.y = v10;
          v34.size.width = v9;
          v34.size.height = v8;
          MaxY = CGRectGetMaxY(v34);
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = v29;
          v18 = CGRectGetMinY(v35);
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = v29;
          v19 = CGRectGetMaxY(v36);
          v20 = ((double (*)(_QWORD *, double, double, double, CGFloat))v13[2])(v13, MinY, MaxY, v18, v19);
LABEL_9:

          goto LABEL_10;
        }
      }
      v20 = CGPointZero.y;
      goto LABEL_9;
    }
  }
  v16 = CGPointZero.x;
  v20 = CGPointZero.y;
LABEL_10:
  v24 = v16;
  v25 = v20;
  result.y = v25;
  result.x = v24;
  return result;
}

- (int64_t)model
{
  return self->_model;
}

- (void)setModel:(int64_t)a3
{
  self->_model = a3;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

@end
