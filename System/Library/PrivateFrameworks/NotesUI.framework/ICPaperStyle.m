@implementation ICPaperStyle

+ (id)linedPaperWithPaperStyleType:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  v3 = *MEMORY[0x1E0CD12F0] * 24.0 / 375.0;
  v4 = *MEMORY[0x1E0CD12F0] + v3 * -2.0;
  v5 = v4 / 6.0;
  v6 = v4 / 6.0 * 0.5;
  switch(a3)
  {
    case 2uLL:
      v6 = v6 * 0.5;
      goto LABEL_3;
    case 3uLL:
LABEL_3:
      v5 = v6;
      break;
    case 4uLL:
      v6 = v4 / 6.0;
      break;
    case 5uLL:
      v7 = 24.0;
      goto LABEL_8;
    case 6uLL:
      v6 = v4 * 0.0625;
      v5 = 0.0;
      break;
    case 7uLL:
      v7 = 12.0;
LABEL_8:
      v5 = 0.0;
      v6 = v4 / v7;
      break;
    default:
      break;
  }
  if (v5 == *MEMORY[0x1E0C9D538] && v6 == *(double *)(MEMORY[0x1E0C9D538] + 8))
    v8 = 0;
  else
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD11C8]), "initWithLineSpacing:horizontalInset:", v5, v6, v3);
  return v8;
}

+ (void)drawPaperStyleType:(unint64_t)a3 inRect:(CGRect)a4
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v8;
  CGContext *CurrentContext;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double MaxY;
  double v21;
  CGFloat v23;
  double v24;
  id v26;
  double v27;
  id v28;
  CGRect v29;
  CGRect v30;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a1, "linedPaperWithPaperStyleType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v28 = v8;
    CurrentContext = UIGraphicsGetCurrentContext();
    v10 = *MEMORY[0x1E0CD12F0];
    objc_msgSend(v28, "horizontalInset");
    v12 = width * v11 / v10;
    v27 = v12;
    objc_msgSend(v28, "lineSpacing");
    v14 = width * v13 / v10;
    objc_msgSend(v28, "lineSpacing");
    v16 = x + v12;
    v17 = x;
    v18 = width * v15 / v10;
    v29.origin.x = v17;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v19 = CGRectGetMaxX(v29) - v27;
    v30.origin.x = v17;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxY = CGRectGetMaxY(v30);
    v21 = v19 + 1.0;
    if (v14 > 0.0 && v16 <= v21)
    {
      v23 = v16;
      do
      {
        CGContextMoveToPoint(CurrentContext, v23, y);
        CGContextAddLineToPoint(CurrentContext, v23, MaxY);
        v23 = v14 + v23;
      }
      while (v23 <= v21);
    }
    v24 = MaxY + 1.0;
    if (v18 > 0.0 && y <= v24)
    {
      do
      {
        CGContextMoveToPoint(CurrentContext, v16, y);
        CGContextAddLineToPoint(CurrentContext, v19, y);
        y = v18 + y;
      }
      while (y <= v24);
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.33);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v26, "CGColor"));

    CGContextSetLineWidth(CurrentContext, 1.0);
    CGContextStrokePath(CurrentContext);
    v8 = v28;
  }

}

@end
