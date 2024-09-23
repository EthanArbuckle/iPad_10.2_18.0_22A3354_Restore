@implementation TLKTextButton

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TLKTextButton;
  -[TLKTextButton setImage:forState:](&v5, sel_setImage_forState_, a3, a4);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (UIFont)font
{
  void *v2;
  void *v3;

  -[TLKTextButton titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TLKTextButton;
  -[TLKTextButton layoutSubviews](&v12, sel_layoutSubviews);
  -[TLKTextButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (TLKImageView)tlkImageView
{
  return self->_tlkImageView;
}

void __41__TLKTextButton_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableAppearanceForView:", v3);

  LODWORD(v3) = objc_msgSend(*(id *)(a1 + 40), "hasTemplateUIImage");
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3)
    objc_msgSend(v4, "enableAppearanceForView:", v5);
  else
    objc_msgSend(v4, "disableAppearanceForView:", v5);

}

- (BOOL)hasTemplateUIImage
{
  void *v2;
  void *v3;

  -[TLKTextButton imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = +[TLKImage isTemplateImage:](TLKImage, "isTemplateImage:", v3);
  return (char)v2;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  TLKTextButton *v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TLKTextButton;
  -[UIView tlk_updateForAppearance:](&v15, sel_tlk_updateForAppearance_, v4);
  objc_msgSend(v4, "buttonColorForProminence:", -[TLKTextButton prominence](self, "prominence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKTextButton setTintColor:](self, "setTintColor:", v5);

  v6 = (void *)MEMORY[0x1E0DC3F10];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __41__TLKTextButton_tlk_updateForAppearance___block_invoke;
  v12 = &unk_1E5C06D50;
  v7 = v4;
  v13 = v7;
  v14 = self;
  objc_msgSend(v6, "performWithoutAnimation:", &v9);
  if (-[TLKTextButton isImageMode](self, "isImageMode", v9, v10, v11, v12)
    && !-[TLKTextButton hasTemplateUIImage](self, "hasTemplateUIImage"))
  {
    -[TLKTextButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKView makeContainerShadowCompatible:](TLKView, "makeContainerShadowCompatible:", v8);

  }
  if (-[TLKTextButton isImageMode](self, "isImageMode")
    && !-[TLKTextButton hasTemplateUIImage](self, "hasTemplateUIImage"))
  {
    objc_msgSend(v7, "disableAppearanceForView:", self);
  }
  else
  {
    objc_msgSend(v7, "enableAppearanceForView:", self);
  }
  -[TLKTextButton updateAttributedTitle](self, "updateAttributedTitle");
  -[TLKTextButton matchHeightForAlignmentRectWithIntrinsicContentSizeIfNecessary](self, "matchHeightForAlignmentRectWithIntrinsicContentSizeIfNecessary");

}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (void)updateAttributedTitle
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  if (!-[TLKTextButton attributedTitleExplicitlySet](self, "attributedTitleExplicitlySet"))
  {
    -[TLKTextButton font](self, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTextButton titleLabel](self, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "adjustsFontForContentSizeCategory");

    if (v5)
    {
      objc_msgSend(v3, "_fontAdjustedForCurrentContentSizeCategory");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
    }
    -[TLKTextButton richTitle](self, "richTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TLKTextButton prominence](self, "prominence");
    v10 = -[TLKTextButton alignment](self, "alignment");
    -[TLKTextButton effectiveScreenScale](self, "effectiveScreenScale");
    v12 = v11;
    +[TLKAppearance bestAppearanceForView:](TLKAppearance, "bestAppearanceForView:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v13, "isDark");
    +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:font:isButton:scale:isDark:", v7, v8, v9, v10, v3, 1, v12, v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v18.receiver = self;
    v18.super_class = (Class)TLKTextButton;
    -[TLKTextButton setAttributedTitle:forState:](&v18, sel_setAttributedTitle_forState_, v15, 0);
    if (!-[TLKTextButton isImageMode](self, "isImageMode"))
    {
      -[TLKTextButton tlkImageView](self, "tlkImageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTlkImage:", 0);

    }
  }
}

- (void)matchHeightForAlignmentRectWithIntrinsicContentSizeIfNecessary
{
  void *v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;

  -[TLKTextButton customAlignmentRectInsets](self, "customAlignmentRectInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (!-[TLKTextButton matchesHeightForAlignmentRectWithIntrinsicContentSize](self, "matchesHeightForAlignmentRectWithIntrinsicContentSize"))goto LABEL_16;
  -[TLKTextButton attributedTitleForState:](self, "attributedTitleForState:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");
  if (!v13)
  {
    -[TLKTextButton richTitle](self, "richTitle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      v16 = 0.0;
LABEL_7:

      goto LABEL_8;
    }
  }
  -[TLKTextButton titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "intrinsicContentSize");
  v16 = v15;

  if (!v13)
    goto LABEL_7;
LABEL_8:
  -[TLKTextButton tlkImage](self, "tlkImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "size");
  if (v18 == 0.0)
  {
    -[TLKTextButton tlkImage](self, "tlkImage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uiImage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v22 = v21;

  }
  else
  {
    v22 = v18;
  }

  if (v16 < v22)
    v16 = v22;
  if (v16 != 0.0)
  {
    -[TLKTextButton intrinsicContentSize](self, "intrinsicContentSize");
    +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, (v23 - v16) * 0.5);
    v9 = v24;
    v11 = 0.0;
    v7 = 0.0;
    v5 = v24;
  }

LABEL_16:
  -[TLKTextButton setCustomAlignmentRectInsets:](self, "setCustomAlignmentRectInsets:", v5, v7, v9, v11);
}

- (BOOL)isImageMode
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[TLKTextButton richTitle](self, "richTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasContent") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TLKTextButton title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v4 = 0;
    }
    else
    {
      -[TLKTextButton tlkImage](self, "tlkImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 != 0;

    }
  }

  return v4;
}

- (TLKRichText)richTitle
{
  return self->_richTitle;
}

- (TLKImage)tlkImage
{
  return self->_tlkImage;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)matchesHeightForAlignmentRectWithIntrinsicContentSize
{
  return self->_matchesHeightForAlignmentRectWithIntrinsicContentSize;
}

- (BOOL)attributedTitleExplicitlySet
{
  return self->_attributedTitleExplicitlySet;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  if (-[TLKTextButton isImageMode](self, "isImageMode"))
  {
    -[TLKTextButton tlkImageView](self, "tlkImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "intrinsicContentSize");
    v5 = v4;
    v7 = v6;

    v8 = v5;
    v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TLKTextButton;
    -[TLKTextButton intrinsicContentSize](&v10, sel_intrinsicContentSize);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setMatchesHeightForAlignmentRectWithIntrinsicContentSize:(BOOL)a3
{
  self->_matchesHeightForAlignmentRectWithIntrinsicContentSize = a3;
}

- (TLKTextButton)init
{
  TLKTextButton *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "buttonWithType:", 1);
  v3 = (TLKTextButton *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TLKTextButton layer](v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsGroupOpacity:", 0);

    -[TLKTextButton _setDisableAutomaticTitleAnimations:](v3, "_setDisableAutomaticTitleAnimations:", 1);
  }
  return v3;
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  _BOOL8 v6;
  id v7;
  objc_super v8;

  v6 = a3 != 0;
  v7 = a3;
  -[TLKTextButton setAttributedTitleExplicitlySet:](self, "setAttributedTitleExplicitlySet:", v6);
  v8.receiver = self;
  v8.super_class = (Class)TLKTextButton;
  -[TLKTextButton setAttributedTitle:forState:](&v8, sel_setAttributedTitle_forState_, v7, a4);

}

- (void)setAttributedTitleExplicitlySet:(BOOL)a3
{
  self->_attributedTitleExplicitlySet = a3;
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlkImageView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tlkImage, 0);
  objc_storeStrong((id *)&self->_richTitle, 0);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TLKTextButton;
  -[TLKTextButton didMoveToWindow](&v3, sel_didMoveToWindow);
  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[TLKTextButton isImageMode](self, "isImageMode"))
  {
    -[TLKTextButton tlkImageView](self, "tlkImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeThatFits:", width, height);
    v8 = v7;
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TLKTextButton;
    -[TLKTextButton sizeThatFits:](&v13, sel_sizeThatFits_, width, height);
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[TLKTextButton isImageMode](self, "isImageMode"))
  {
    v16.receiver = self;
    v16.super_class = (Class)TLKTextButton;
    -[TLKTextButton imageRectForContentRect:](&v16, sel_imageRectForContentRect_, x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TLKTextButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)setTitle:(id)a3
{
  id v5;
  TLKRichText *v6;
  TLKRichText *richTitle;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  +[TLKMultilineText textWithString:](TLKRichText, "textWithString:", v5);
  v6 = (TLKRichText *)objc_claimAutoreleasedReturnValue();
  richTitle = self->_richTitle;
  self->_richTitle = v6;

  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKTextButton;
  -[TLKTextButton traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[TLKTextButton traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4))
  {

LABEL_4:
    -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    goto LABEL_5;
  }
  -[TLKTextButton traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_vibrancy");
  v8 = objc_msgSend(v4, "_vibrancy");

  if (v7 != v8)
    goto LABEL_4;
LABEL_5:

}

- (BOOL)allowsVibrancy
{
  return !-[TLKTextButton isImageMode](self, "isImageMode");
}

- (void)setTlkImage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_storeStrong((id *)&self->_tlkImage, a3);
  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    -[TLKTextButton setTlkImageView:](self, "setTlkImageView:", v6);

    v7 = (void *)objc_opt_new();
    -[TLKTextButton setImage:forState:](self, "setImage:forState:", v7, 0);

    -[TLKTextButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKTextButton tlkImageView](self, "tlkImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTlkImage:", v12);

  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v12 == 0);

  -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
  -[TLKTextButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (CGSize)maximumLayoutSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumLayoutSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setMaximumLayoutSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaximumLayoutSize:", width, height);

}

- (CGSize)minimumLayoutSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumLayoutSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setMinimumLayoutSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumLayoutSize:", width, height);

}

- (BOOL)alwaysShowPlaceholderView
{
  void *v2;
  BOOL v3;

  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "placeholderVisibility") == 1;

  return v3;
}

- (void)setAlwaysShowPlaceholderView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TLKTextButton tlkImageView](self, "tlkImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholderVisibility:", v3);

}

- (void)setRichTitle:(id)a3
{
  TLKRichText *v5;
  void *v6;
  TLKRichText *v7;

  v5 = (TLKRichText *)a3;
  if (self->_richTitle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_richTitle, a3);
    -[TLKTextButton window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UIView tlk_updateWithCurrentAppearance](self, "tlk_updateWithCurrentAppearance");
    else
      -[TLKTextButton updateAttributedTitle](self, "updateAttributedTitle");
    v5 = v7;
  }

}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
  -[TLKTextButton updateAttributedTitle](self, "updateAttributedTitle");
}

- (void)setTlkImageView:(id)a3
{
  objc_storeStrong((id *)&self->_tlkImageView, a3);
}

@end
