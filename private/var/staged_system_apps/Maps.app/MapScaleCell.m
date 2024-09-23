@implementation MapScaleCell

- (MapScaleCell)initWithDistanceInMeters:(double)a3
{
  MapScaleCell *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapScaleCell;
  result = -[MapScaleCell init](&v5, "init");
  if (result)
    result->_distanceInMeters = a3;
  return result;
}

- (id)_legendStringForDistanceString:(id)a3 index:(int)a4
{
  id v5;
  void *v6;
  float v7;
  float v8;
  __CFString *v9;
  float v10;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0:
      v9 = CFSTR("0");
      break;
    case 1:
      objc_msgSend(v5, "floatValue");
      goto LABEL_7;
    case 2:
      objc_msgSend(v5, "floatValue");
      v8 = v10 + v10;
      goto LABEL_7;
    case 3:
    case 4:
      objc_msgSend(v5, "floatValue");
      v8 = v7 * 3.0;
LABEL_7:
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%g"), v8));
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void)drawInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  CGContext *CurrentContext;
  double v11;
  double MinX;
  double MaxY;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  double MaxX;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CGFloat v35;
  id v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36 = (id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v8 = objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.470588235, 0.435294118, 0.345098039, 1.0);
  v9 = objc_msgSend(objc_alloc((Class)UIColor), "initWithWhite:alpha:", 0.0, 0.800000012);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(CurrentContext, 1.0);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v11 = CGRectGetWidth(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinX = CGRectGetMinX(v38);
  v35 = x;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MaxY = CGRectGetMaxY(v39);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _mapkit_localizedDistanceStringWithMeters:abbreviated:](NSString, "_mapkit_localizedDistanceStringWithMeters:abbreviated:", (self->_distanceInMeters * 0.0625), 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(" ")));
  if (objc_msgSend(v15, "count"))
  {
    v33 = v14;
    v34 = v9;
    v16 = v11 * 0.0625;
    v17 = MaxY + -16.0;
    v18 = MinX + 12.0;
    v32 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 5.0));
    v21 = 0;
    v22 = 0;
    v23 = 1;
    while (1)
    {
      v40.size.height = 2.0;
      v40.origin.x = v18;
      v40.origin.y = MaxY + -16.0;
      v40.size.width = v16;
      MaxX = CGRectGetMaxX(v40);
      v41.origin.x = v35;
      v41.origin.y = y;
      v41.size.width = width;
      v41.size.height = height;
      if (MaxX > CGRectGetMaxX(v41))
        break;
      v25 = v36;
      if ((v23 & 1) != 0)
        v25 = v8;
      objc_msgSend(v25, "set");
      v23 ^= 1u;
      v42.size.height = 2.0;
      v42.origin.x = v18;
      v42.origin.y = MaxY + -16.0;
      v42.size.width = v16;
      CGContextFillRect(CurrentContext, v42);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapScaleCell _legendStringForDistanceString:index:](self, "_legendStringForDistanceString:index:", v19, v22));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      objc_msgSend(v27, "set");

      objc_msgSend(v26, "_maps_sizeWithFont:", v20);
      objc_msgSend(v26, "_maps_drawAtPoint:withFont:", v20, v18 + v28 * -0.5, v17 + -7.0);
      v18 = v16 + v18;
      v22 = (v22 + 1);
      v21 = v26;
      if ((_DWORD)v22 == 4)
        goto LABEL_9;
    }
    v26 = v21;
LABEL_9:
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapScaleCell _legendStringForDistanceString:index:](self, "_legendStringForDistanceString:index:", v19, v22));

    objc_msgSend(v29, "_maps_sizeWithFont:", v20);
    objc_msgSend(v29, "_maps_drawAtPoint:withFont:", v20, v18 + v30 * -0.5, v17 + -7.0);
    v15 = v32;
    v14 = v33;
    if ((unint64_t)objc_msgSend(v32, "count") >= 2)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 1));

      objc_msgSend(v31, "_maps_drawAtPoint:withFont:", v20, v18 + 3.0, v17 + -3.0);
      v29 = v31;
    }
    v9 = v34;
    objc_msgSend(v34, "set");
    v43.origin.x = v35;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v44.origin.x = CGRectGetMinX(v43) + 12.0;
    v44.size.width = v16 * (double)(int)v22;
    v44.size.height = 2.0;
    v44.origin.y = MaxY + -16.0;
    CGContextStrokeRect(CurrentContext, v44);

  }
}

@end
