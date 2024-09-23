@implementation VUIVideoAdvisoryViewLayout

- (VUIVideoAdvisoryViewLayout)init
{
  char *v2;
  char *v3;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)VUIVideoAdvisoryViewLayout;
  v2 = -[TVViewLayout init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 408) = vdupq_n_s64(0x4049000000000000uLL);
    *(_OWORD *)(v2 + 504) = xmmword_1DA1C2090;
    *(_OWORD *)(v2 + 520) = xmmword_1DA1C20A0;
    *(int64x2_t *)(v2 + 456) = vdupq_n_s64(0x4041800000000000uLL);
    __asm { FMOV            V1.2D, #5.0 }
    v27 = _Q1;
    *(_OWORD *)(v2 + 696) = xmmword_1DA1C20B0;
    *(_OWORD *)(v2 + 712) = _Q1;
    __asm { FMOV            V0.2D, #15.0 }
    *(_OWORD *)(v2 + 424) = _Q0;
    __asm { FMOV            V0.2D, #10.0 }
    *(_OWORD *)(v2 + 472) = _Q0;
    *(_OWORD *)(v2 + 536) = xmmword_1DA1C2970;
    *(_OWORD *)(v2 + 552) = xmmword_1DA1C2980;
    *(_OWORD *)(v2 + 728) = xmmword_1DA1C2970;
    *(_OWORD *)(v2 + 744) = xmmword_1DA1C2990;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v3 + 45);
    *((_QWORD *)v3 + 45) = v11;

    *(_OWORD *)(v3 + 600) = xmmword_1DA1C20C0;
    *(_OWORD *)(v3 + 616) = xmmword_1DA1C20C0;
    *(_OWORD *)(v3 + 760) = xmmword_1DA1C20D0;
    *(_OWORD *)(v3 + 776) = xmmword_1DA1C20D0;
    *(_OWORD *)(v3 + 440) = xmmword_1DA1C20E0;
    *(_OWORD *)(v3 + 488) = xmmword_1DA1C20F0;
    *((_QWORD *)v3 + 42) = 0x402E000000000000;
    *(_OWORD *)(v3 + 568) = xmmword_1DA1C20D0;
    *(_OWORD *)(v3 + 584) = xmmword_1DA1C20D0;
    *((_QWORD *)v3 + 41) = 0x4072C00000000000;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v3 + 43);
    *((_QWORD *)v3 + 43) = v13;

    *((_QWORD *)v3 + 44) = 0x4008000000000000;
    *((_QWORD *)v3 + 48) = 0x4062C00000000000;
    *(_OWORD *)(v3 + 632) = xmmword_1DA1C20A0;
    *(_OWORD *)(v3 + 648) = xmmword_1DA1C2090;
    *(_OWORD *)(v3 + 792) = v27;
    *(_OWORD *)(v3 + 808) = xmmword_1DA1C20B0;
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setTextStyle:", 13);
    objc_msgSend(v15, "setFontWeight:", 7);
    objc_msgSend(v15, "setNumberOfLines:", 1);
    objc_msgSend(v15, "setAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setColor:", v16);

    objc_msgSend(v15, "setFontSize:", 15.0);
    objc_msgSend(v15, "setMargin:", 2.0, 2.0, 2.0, 2.0);
    objc_msgSend(v15, "setAllowsTextAlignmentOverride:", 1);
    objc_storeStrong((id *)v3 + 46, v15);
    objc_msgSend(v15, "setFontSize:", 10.0);
    objc_msgSend(v15, "setMargin:", 1.0, 1.0, 1.0, 1.0);
    v17 = (void *)*((_QWORD *)v3 + 49);
    *((_QWORD *)v3 + 49) = v15;
    v18 = v15;

    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setTextStyle:", 13);
    objc_msgSend(v19, "setNumberOfLines:", 3);
    objc_msgSend(v19, "setFontWeight:", 5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setColor:", v20);

    objc_msgSend(v19, "setMargin:", 0.0, 3.0, 0.0, 0.0);
    objc_msgSend(v19, "setFontSize:", 10.0);
    objc_msgSend(v19, "setAllowsTextAlignmentOverride:", 1);
    v21 = (void *)*((_QWORD *)v3 + 47);
    *((_QWORD *)v3 + 47) = v19;
    v22 = v19;

    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setTextStyle:", 13);
    objc_msgSend(v23, "setNumberOfLines:", 3);
    objc_msgSend(v23, "setFontWeight:", 5);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setColor:", v24);

    objc_msgSend(v23, "setMargin:", 0.0, 1.5, 0.0, 0.0);
    objc_msgSend(v23, "setFontSize:", 7.0);
    objc_msgSend(v23, "setAllowsTextAlignmentOverride:", 1);
    v25 = (void *)*((_QWORD *)v3 + 50);
    *((_QWORD *)v3 + 50) = v23;

    objc_msgSend(v3, "setMargin:", 10.0, 20.0, 0.0, 0.0);
    objc_msgSend(v3, "setPortraitMargin:", 5.0, 10.0, 0.0, 0.0);
  }
  return (VUIVideoAdvisoryViewLayout *)v3;
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

- (CGSize)legendSize
{
  double width;
  double height;
  CGSize result;

  width = self->_legendSize.width;
  height = self->_legendSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLegendSize:(CGSize)a3
{
  self->_legendSize = a3;
}

- (double)legendMaxWidth
{
  return self->_legendMaxWidth;
}

- (void)setLegendMaxWidth:(double)a3
{
  self->_legendMaxWidth = a3;
}

- (UIEdgeInsets)legendsMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_legendsMargin.top;
  left = self->_legendsMargin.left;
  bottom = self->_legendsMargin.bottom;
  right = self->_legendsMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLegendsMargin:(UIEdgeInsets)a3
{
  self->_legendsMargin = a3;
}

- (double)legendNameMinWidth
{
  return self->_legendNameMinWidth;
}

- (void)setLegendNameMinWidth:(double)a3
{
  self->_legendNameMinWidth = a3;
}

- (UIEdgeInsets)legendNamePadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_legendNamePadding.top;
  left = self->_legendNamePadding.left;
  bottom = self->_legendNamePadding.bottom;
  right = self->_legendNamePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setLegendNamePadding:(UIEdgeInsets)a3
{
  self->_legendNamePadding = a3;
}

- (UIColor)legendBackgroundColor
{
  return self->_legendBackgroundColor;
}

- (double)legendCornerRadius
{
  return self->_legendCornerRadius;
}

- (void)setLegendCornerRadius:(double)a3
{
  self->_legendCornerRadius = a3;
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

- (VUITextLayout)legendLayout
{
  return self->_legendLayout;
}

- (VUITextLayout)descriptionLayout
{
  return self->_descriptionLayout;
}

- (double)descriptionMaxWidth
{
  return self->_descriptionMaxWidth;
}

- (void)setDescriptionMaxWidth:(double)a3
{
  self->_descriptionMaxWidth = a3;
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

- (CGSize)portraitLegendSize
{
  double width;
  double height;
  CGSize result;

  width = self->_portraitLegendSize.width;
  height = self->_portraitLegendSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPortraitLegendSize:(CGSize)a3
{
  self->_portraitLegendSize = a3;
}

- (UIEdgeInsets)portraitLegendsMargin
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_portraitLegendsMargin.top;
  left = self->_portraitLegendsMargin.left;
  bottom = self->_portraitLegendsMargin.bottom;
  right = self->_portraitLegendsMargin.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPortraitLegendsMargin:(UIEdgeInsets)a3
{
  self->_portraitLegendsMargin = a3;
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

- (VUITextLayout)portraitLegendLayout
{
  return self->_portraitLegendLayout;
}

- (VUITextLayout)portraitLegendDescriptionLayout
{
  return self->_portraitLegendDescriptionLayout;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portraitLegendDescriptionLayout, 0);
  objc_storeStrong((id *)&self->_portraitLegendLayout, 0);
  objc_storeStrong((id *)&self->_descriptionLayout, 0);
  objc_storeStrong((id *)&self->_legendLayout, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
  objc_storeStrong((id *)&self->_legendBackgroundColor, 0);
}

@end
