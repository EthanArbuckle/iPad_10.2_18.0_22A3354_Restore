@implementation PKPassBannerTrailingView

- (PKPassBannerTrailingView)init
{

  return 0;
}

- (PKPassBannerTrailingView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PKPassBannerTrailingView)initWithCoder:(id)a3
{

  return 0;
}

- (uint64_t)_initWithStyle:(void *)a3 configuration:
{
  _QWORD *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  if (a1)
  {
    v15.receiver = (id)a1;
    v15.super_class = (Class)PKPassBannerTrailingView;
    v7 = objc_msgSendSuper2(&v15, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    a1 = (uint64_t)v7;
    if (v7)
    {
      *((_QWORD *)v7 + 52) = a2;
      objc_storeStrong((id *)v7 + 53, a3);
      v8 = *(_QWORD *)(a1 + 424);
      if (!v8)
      {
LABEL_10:
        -[PKPassBannerTrailingView _updateImage](a1);
        goto LABEL_11;
      }
      if (*(_QWORD *)(v8 + 8))
      {
        __break(1u);
      }
      else if (v6)
      {
        v9 = (void *)v6[3];
        goto LABEL_7;
      }
      v9 = 0;
LABEL_7:
      objc_storeStrong((id *)(a1 + 440), v9);
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
      v11 = *(void **)(a1 + 448);
      *(_QWORD *)(a1 + 448) = v10;

      objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 448));
      v12 = *(void **)(a1 + 448);
      if (*(_QWORD *)(a1 + 440))
      {
        objc_msgSend(*(id *)(a1 + 448), "setTintColor:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setTintColor:", v13);

      }
      goto LABEL_10;
    }
  }
LABEL_11:

  return a1;
}

- (void)_updateImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 416))
    {
      objc_msgSend((id)a1, "traitCollection");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "sbui_systemApertureDefaultConfiguration");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4B50], 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "configurationByApplyingConfiguration:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (*(_QWORD *)(a1 + 432))
        return;
      objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AE8]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v3, 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v11 && v4)
    {
      objc_msgSend(v4, "configurationWithTraitCollection:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0DC3870];
      v7 = *(_QWORD **)(a1 + 424);
      if (v7)
        v7 = (_QWORD *)v7[2];
      v8 = v7;
      objc_msgSend(v6, "_systemImageNamed:withConfiguration:", v8, v5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = v9;

    }
    else
    {
      v8 = *(_QWORD **)(a1 + 432);
      *(_QWORD *)(a1 + 432) = 0;
      v5 = v4;
    }

    objc_msgSend(*(id *)(a1 + 448), "setImage:", *(_QWORD *)(a1 + 432));
    objc_msgSend((id)a1, "setNeedsLayout");

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSComparisonResult v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassBannerTrailingView;
  -[PKPassBannerTrailingView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[PKPassBannerTrailingView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v4, "preferredContentSizeCategory"),
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "preferredContentSizeCategory"),
        v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKPassBannerTrailingView _updateImage]((uint64_t)self);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t style;
  UIImage *image;
  double v5;
  double v6;
  CGSize result;

  style = self->_style;
  image = self->_image;
  if (style == 1)
  {
    if (!image)
    {
      v5 = 1.0;
      v6 = 1.0;
      goto LABEL_8;
    }
  }
  else if (!image)
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_8;
  }
  -[UIImage pkui_alignmentSize](image, "pkui_alignmentSize", a3.width, a3.height);
  PKSizeRoundToPixel();
LABEL_8:
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImage *image;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassBannerTrailingView;
  -[PKPassBannerTrailingView layoutSubviews](&v6, sel_layoutSubviews);
  if (self->_image)
  {
    -[PKPassBannerTrailingView bounds](self, "bounds");
    image = self->_image;
    if (image)
      -[UIImage pkui_alignmentSizeThatFits:](image, "pkui_alignmentSizeThatFits:", v3, v4, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
    PKRectRoundToPixel();
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
