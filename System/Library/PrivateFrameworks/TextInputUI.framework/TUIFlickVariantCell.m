@implementation TUIFlickVariantCell

- (UIEdgeInsets)backgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)backgroundCornerRadius
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[TUIVariantCell traitsForCell](self, "traitsForCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roundRectRadius");
  v5 = v4;

  return v5;
}

- (void)setCurvedCorners:(unint64_t)a3
{
  if (self->_curvedCorners != a3)
  {
    -[TUIFlickVariantCell setCornerMaskForBackground:](self, "setCornerMaskForBackground:", 0);
    if ((a3 & 1) != 0)
    {
      -[TUIFlickVariantCell setCornerMaskForBackground:](self, "setCornerMaskForBackground:", -[TUIFlickVariantCell cornerMaskForBackground](self, "cornerMaskForBackground") | 1);
      if ((a3 & 2) == 0)
      {
LABEL_4:
        if ((a3 & 4) == 0)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    else if ((a3 & 2) == 0)
    {
      goto LABEL_4;
    }
    -[TUIFlickVariantCell setCornerMaskForBackground:](self, "setCornerMaskForBackground:", -[TUIFlickVariantCell cornerMaskForBackground](self, "cornerMaskForBackground") | 2);
    if ((a3 & 4) == 0)
    {
LABEL_5:
      if ((a3 & 8) == 0)
      {
LABEL_7:
        self->_curvedCorners = a3;
        return;
      }
LABEL_6:
      -[TUIFlickVariantCell setCornerMaskForBackground:](self, "setCornerMaskForBackground:", -[TUIFlickVariantCell cornerMaskForBackground](self, "cornerMaskForBackground") | 8);
      goto LABEL_7;
    }
LABEL_11:
    -[TUIFlickVariantCell setCornerMaskForBackground:](self, "setCornerMaskForBackground:", -[TUIFlickVariantCell cornerMaskForBackground](self, "cornerMaskForBackground") | 4);
    if ((a3 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
}

- (unint64_t)curvedCorners
{
  return self->_curvedCorners;
}

- (unint64_t)cornerMaskForBackground
{
  return self->_cornerMaskForBackground;
}

- (void)setCornerMaskForBackground:(unint64_t)a3
{
  self->_cornerMaskForBackground = a3;
}

@end
