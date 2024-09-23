@implementation SUFrameAdjustmentImageModifier

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[SUFrameAdjustmentImageModifier sizingMask](self, "sizingMask");
  return v5 == objc_msgSend(a3, "sizingMask");
}

- (CGRect)imageFrameForImage:(id)a3 currentFrame:(CGRect)result finalSize:(CGSize)a5
{
  double v5;
  float v6;
  float v7;
  unint64_t sizingMask;
  double v9;
  double v10;
  double v11;

  v5 = a5.height / result.size.height;
  if (a5.height / result.size.height >= a5.width / result.size.width)
    v5 = a5.width / result.size.width;
  if (self->_shouldSizeDownToFit && v5 < 1.0)
  {
    v6 = result.size.height * v5;
    result.size.height = ceilf(v6);
    v7 = result.size.width * v5;
    result.size.width = ceilf(v7);
  }
  sizingMask = self->_sizingMask;
  if ((sizingMask & 4) != 0)
    result.origin.x = 0.0;
  v9 = a5.width - result.size.width;
  if ((sizingMask & 1) != 0)
    result.origin.x = v9;
  v10 = floor(v9 * 0.5);
  if ((sizingMask & 5) != 0)
    result.origin.x = v10;
  if ((sizingMask & 0x20) != 0)
    result.origin.y = 0.0;
  if ((sizingMask & 8) != 0)
    result.origin.y = a5.height - result.size.height;
  v11 = floor((a5.height - result.size.height) * 0.5);
  if ((sizingMask & 0x28) != 0)
    result.origin.y = v11;
  return result;
}

- (BOOL)scalesImage
{
  return 1;
}

- (unint64_t)sizingMask
{
  return self->_sizingMask;
}

- (void)setSizingMask:(unint64_t)a3
{
  self->_sizingMask = a3;
}

- (BOOL)shouldSizeDownToFit
{
  return self->_shouldSizeDownToFit;
}

- (void)setShouldSizeDownToFit:(BOOL)a3
{
  self->_shouldSizeDownToFit = a3;
}

@end
