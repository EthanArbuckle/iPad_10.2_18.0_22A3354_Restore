@implementation SURotationImageModifier

- (BOOL)isEqual:(id)a3
{
  int64_t v5;
  float v6;
  float v7;
  float v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[SURotationImageModifier orientation](self, "orientation");
  if (v5 != objc_msgSend(a3, "orientation"))
    return 0;
  -[SURotationImageModifier degrees](self, "degrees");
  v7 = v6;
  objc_msgSend(a3, "degrees");
  return v7 == v8;
}

- (void)drawBeforeImageForContext:(CGContext *)a3 imageFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  double height;
  double width;
  CGFloat v9;
  CGFloat v10;
  double v11;
  float v12;

  height = a4.size.height;
  width = a4.size.width;
  v10 = *MEMORY[0x24BDBF148];
  v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  switch(-[SURotationImageModifier orientation](self, "orientation", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height))
  {
    case 1:
      v11 = 0.0;
      if (width > height)
      {
        v11 = 1.57079633;
        v10 = height;
      }
      break;
    case 2:
    case 4:
      v11 = 0.0;
      if (height > width)
        v11 = -1.57079633;
      break;
    case 3:
      v11 = 0.0;
      if (height > width)
        v11 = 1.57079633;
      break;
    default:
      -[SURotationImageModifier degrees](self, "degrees");
      v11 = v12 * 0.0174532925;
      break;
  }
  CGContextTranslateCTM(a3, v10, v9);
  CGContextRotateCTM(a3, v11);
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)a4 finalSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  int64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a3, "size", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
  v11 = v10;
  v13 = v12;
  v14 = -[SURotationImageModifier orientation](self, "orientation");
  if ((unint64_t)(v14 - 1) >= 2)
  {
    if ((unint64_t)(v14 - 3) <= 1 && v13 > v11)
      goto LABEL_4;
LABEL_6:
    v15 = width;
    width = height;
    goto LABEL_7;
  }
  if (v11 <= v13)
    goto LABEL_6;
LABEL_4:
  v15 = height;
LABEL_7:
  v16 = x;
  v17 = y;
  v18 = width;
  result.size.height = v18;
  result.size.width = v15;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (float)degrees
{
  return self->_degrees;
}

- (void)setDegrees:(float)a3
{
  self->_degrees = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

@end
