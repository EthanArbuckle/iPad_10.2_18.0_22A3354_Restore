@implementation VUIAdditionalAdvisoryInfoViewLayout

- (VUIAdditionalAdvisoryInfoViewLayout)init
{
  VUIAdditionalAdvisoryInfoViewLayout *v2;
  VUIAdditionalAdvisoryInfoViewLayout *v3;
  uint64_t v9;
  UIColor *dividerColor;
  VUITextLayout *v11;
  void *v12;
  VUITextLayout *descriptionLayout;
  __int128 v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VUIAdditionalAdvisoryInfoViewLayout;
  v2 = -[TVViewLayout init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_logoSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    *(_OWORD *)&v2->_logoMargin.top = xmmword_1DA1C2090;
    *(_OWORD *)&v2->_logoMargin.bottom = xmmword_1DA1C20A0;
    v2->_portraitLogoSize = (CGSize)vdupq_n_s64(0x4041800000000000uLL);
    __asm { FMOV            V1.2D, #5.0 }
    v15 = _Q1;
    *(_OWORD *)&v2->_portraitLogoMargin.top = xmmword_1DA1C20B0;
    *(_OWORD *)&v2->_portraitLogoMargin.bottom = _Q1;
    v2->_descriptionWidth = 220.0;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v9 = objc_claimAutoreleasedReturnValue();
    dividerColor = v3->_dividerColor;
    v3->_dividerColor = (UIColor *)v9;

    *(_OWORD *)&v3->_dividerMargin.top = xmmword_1DA1C20C0;
    *(_OWORD *)&v3->_dividerMargin.bottom = xmmword_1DA1C20C0;
    *(_OWORD *)&v3->_portraitDividerMargin.top = xmmword_1DA1C20D0;
    *(_OWORD *)&v3->_portraitDividerMargin.bottom = xmmword_1DA1C20D0;
    v3->_dividerSize = (CGSize)xmmword_1DA1C20E0;
    v3->_portraitDividerSize = (CGSize)xmmword_1DA1C20F0;
    v3->_descriptionCornerRadius = 3.0;
    *(_OWORD *)&v3->_descriptionMargin.top = xmmword_1DA1C20A0;
    *(_OWORD *)&v3->_descriptionMargin.bottom = xmmword_1DA1C2090;
    *(_OWORD *)&v3->_portraitDescriptionMargin.top = v15;
    *(_OWORD *)&v3->_portraitDescriptionMargin.bottom = xmmword_1DA1C20B0;
    v11 = (VUITextLayout *)objc_opt_new();
    -[VUITextLayout setTextStyle:](v11, "setTextStyle:", 13);
    -[VUITextLayout setNumberOfLines:](v11, "setNumberOfLines:", 3);
    -[VUITextLayout setFontWeight:](v11, "setFontWeight:", 5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v11, "setColor:", v12);

    -[VUITextLayout setMargin:](v11, "setMargin:", 0.0, 3.0, 0.0, 0.0);
    -[VUITextLayout setFontSize:](v11, "setFontSize:", 10.0);
    -[VUITextLayout setAllowsTextAlignmentOverride:](v11, "setAllowsTextAlignmentOverride:", 1);
    descriptionLayout = v3->_descriptionLayout;
    v3->_descriptionLayout = v11;

    -[TVViewLayout setMargin:](v3, "setMargin:", 10.0, 20.0, 0.0, 0.0);
    -[VUIAdditionalAdvisoryInfoViewLayout setPortraitMargin:](v3, "setPortraitMargin:", 5.0, 10.0, 0.0, 0.0);
  }
  return v3;
}

- (CGSize)logoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_logoSize.width;
  height = self->_logoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLogoSize:(CGSize)a3
{
  self->_logoSize = a3;
}

- (UIEdgeInsets)logoMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_logoMargin.top;
  left = self->_logoMargin.left;
  bottom = self->_logoMargin.bottom;
  right = self->_logoMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLogoMargin:(UIEdgeInsets)a3
{
  self->_logoMargin = a3;
}

- (double)descriptionWidth
{
  return self->_descriptionWidth;
}

- (void)setDescriptionWidth:(double)a3
{
  self->_descriptionWidth = a3;
}

- (UIEdgeInsets)descriptionMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_descriptionMargin.top;
  left = self->_descriptionMargin.left;
  bottom = self->_descriptionMargin.bottom;
  right = self->_descriptionMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDescriptionMargin:(UIEdgeInsets)a3
{
  self->_descriptionMargin = a3;
}

- (double)descriptionCornerRadius
{
  return self->_descriptionCornerRadius;
}

- (void)setDescriptionCornerRadius:(double)a3
{
  self->_descriptionCornerRadius = a3;
}

- (UIEdgeInsets)dividerMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_dividerMargin.top;
  left = self->_dividerMargin.left;
  bottom = self->_dividerMargin.bottom;
  right = self->_dividerMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setDividerMargin:(UIEdgeInsets)a3
{
  self->_dividerMargin = a3;
}

- (CGSize)dividerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_dividerSize.width;
  height = self->_dividerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDividerSize:(CGSize)a3
{
  self->_dividerSize = a3;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (VUITextLayout)descriptionLayout
{
  return self->_descriptionLayout;
}

- (UIEdgeInsets)portraitMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitMargin.top;
  left = self->_portraitMargin.left;
  bottom = self->_portraitMargin.bottom;
  right = self->_portraitMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPortraitMargin:(UIEdgeInsets)a3
{
  self->_portraitMargin = a3;
}

- (CGSize)portraitLogoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitLogoSize.width;
  height = self->_portraitLogoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPortraitLogoSize:(CGSize)a3
{
  self->_portraitLogoSize = a3;
}

- (UIEdgeInsets)portraitLogoMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitLogoMargin.top;
  left = self->_portraitLogoMargin.left;
  bottom = self->_portraitLogoMargin.bottom;
  right = self->_portraitLogoMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPortraitLogoMargin:(UIEdgeInsets)a3
{
  self->_portraitLogoMargin = a3;
}

- (UIEdgeInsets)portraitDescriptionMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitDescriptionMargin.top;
  left = self->_portraitDescriptionMargin.left;
  bottom = self->_portraitDescriptionMargin.bottom;
  right = self->_portraitDescriptionMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPortraitDescriptionMargin:(UIEdgeInsets)a3
{
  self->_portraitDescriptionMargin = a3;
}

- (UIEdgeInsets)portraitDividerMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitDividerMargin.top;
  left = self->_portraitDividerMargin.left;
  bottom = self->_portraitDividerMargin.bottom;
  right = self->_portraitDividerMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPortraitDividerMargin:(UIEdgeInsets)a3
{
  self->_portraitDividerMargin = a3;
}

- (CGSize)portraitDividerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitDividerSize.width;
  height = self->_portraitDividerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPortraitDividerSize:(CGSize)a3
{
  self->_portraitDividerSize = a3;
}

- (VUITextLayout)portraitDescriptionLayout
{
  return self->_portraitDescriptionLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitDescriptionLayout, 0);
  objc_storeStrong((id *)&self->_descriptionLayout, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end
