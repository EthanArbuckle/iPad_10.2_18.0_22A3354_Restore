@implementation TUIGradient

+ (unint64_t)defaultRole
{
  return 1;
}

+ (unint64_t)directionFromString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (qword_2CB530 != -1)
  {
    dispatch_once(&qword_2CB530, &stru_2401E0);
    if (v4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_2CB528, "objectForKeyedSubscript:", v4));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

LABEL_6:
  return (unint64_t)v6;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIGradientLayout, a2);
}

- (NSString)blendMode
{
  return self->_blendMode;
}

- (void)setBlendMode:(id)a3
{
  objc_storeStrong((id *)&self->_blendMode, a3);
}

- (UIColor)gradientStartColor
{
  return self->_gradientStartColor;
}

- (void)setGradientStartColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)gradientEndColor
{
  return self->_gradientEndColor;
}

- (void)setGradientEndColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)gradientStartPosition
{
  return self->_gradientStartPosition;
}

- (void)setGradientStartPosition:(double)a3
{
  self->_gradientStartPosition = a3;
}

- (double)gradientEndPosition
{
  return self->_gradientEndPosition;
}

- (void)setGradientEndPosition:(double)a3
{
  self->_gradientEndPosition = a3;
}

- (unint64_t)gradientDirection
{
  return self->_gradientDirection;
}

- (void)setGradientDirection:(unint64_t)a3
{
  self->_gradientDirection = a3;
}

- (NSString)CAfilterBlendMode
{
  return self->_CAfilterBlendMode;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (void)setContinuousCorners:(BOOL)a3
{
  self->_continuousCorners = a3;
}

- (double)gradientBlurRadius
{
  return self->_gradientBlurRadius;
}

- (void)setGradientBlurRadius:(double)a3
{
  self->_gradientBlurRadius = a3;
}

- (double)gradientBlurOffset
{
  return self->_gradientBlurOffset;
}

- (void)setGradientBlurOffset:(double)a3
{
  self->_gradientBlurOffset = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CAfilterBlendMode, 0);
  objc_storeStrong((id *)&self->_gradientEndColor, 0);
  objc_storeStrong((id *)&self->_gradientStartColor, 0);
  objc_storeStrong((id *)&self->_blendMode, 0);
}

@end
