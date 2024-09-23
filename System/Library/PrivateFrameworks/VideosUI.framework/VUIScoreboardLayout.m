@implementation VUIScoreboardLayout

+ (id)_textColor:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int)_textBlendMode
{
  return 26;
}

- (_VUICornerRadii)borderRadii
{
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  _VUICornerRadii result;

  topLeft = self->_borderRadii.topLeft;
  topRight = self->_borderRadii.topRight;
  bottomLeft = self->_borderRadii.bottomLeft;
  bottomRight = self->_borderRadii.bottomRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topRight = topRight;
  result.topLeft = topLeft;
  return result;
}

- (void)setBorderRadii:(_VUICornerRadii)a3
{
  self->_borderRadii = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
  objc_storeStrong((id *)&self->_textLayout, a3);
}

- (VUIScoreboardRowLayout)topRowLayout
{
  return self->_topRowLayout;
}

- (void)setTopRowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_topRowLayout, a3);
}

- (VUIScoreboardRowLayout)bottomRowLayout
{
  return self->_bottomRowLayout;
}

- (void)setBottomRowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRowLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomRowLayout, 0);
  objc_storeStrong((id *)&self->_topRowLayout, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
}

@end
