@implementation PXComposeRecipientAddButton

- (void)_commmonPXComposeRecipientAddButtonInitialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PXComposeRecipientAddButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 4);
  -[PXComposeRecipientAddButton titleLabel](self, "titleLabel");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 32770, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellBlueTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientAddButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);
  -[PXComposeRecipientAddButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 1);
  PXLocalizedStringFromTable(CFSTR("PXComposeRecipientAddPeople"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientAddButton setTitle:forState:](self, "setTitle:forState:", v6, 0);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_tintedImageWithColor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_tintedImageWithColor:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXComposeRecipientAddButton setImage:forState:](self, "setImage:forState:", v8, 0);
  -[PXComposeRecipientAddButton setImage:forState:](self, "setImage:forState:", v9, 1);

}

- (PXComposeRecipientAddButton)initWithFrame:(CGRect)a3
{
  PXComposeRecipientAddButton *v3;
  PXComposeRecipientAddButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientAddButton;
  v3 = -[PXComposeRecipientAddButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXComposeRecipientAddButton _commmonPXComposeRecipientAddButtonInitialization](v3, "_commmonPXComposeRecipientAddButtonInitialization");
  return v4;
}

- (PXComposeRecipientAddButton)initWithCoder:(id)a3
{
  PXComposeRecipientAddButton *v3;
  PXComposeRecipientAddButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientAddButton;
  v3 = -[PXComposeRecipientAddButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXComposeRecipientAddButton _commmonPXComposeRecipientAddButtonInitialization](v3, "_commmonPXComposeRecipientAddButtonInitialization");
  return v4;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PXComposeRecipientAddButton;
  -[PXComposeRecipientAddButton layoutSubviews](&v17, sel_layoutSubviews);
  if (-[PXComposeRecipientAddButton contentHorizontalAlignment](self, "contentHorizontalAlignment") == 4)
  {
    v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXComposeRecipientAddButton semanticContentAttribute](self, "semanticContentAttribute"));
    -[PXComposeRecipientAddButton imageSizeToAlignWith](self, "imageSizeToAlignWith");
    v5 = v4;
    -[PXComposeRecipientAddButton inset](self, "inset");
    v7 = v6;
    -[PXComposeRecipientAddButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "size");
    v11 = v7 + v5 * 0.5 - v10 * 0.5;

    -[PXComposeRecipientAddButton imageView](self, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "size");
    v15 = v7 + v7 + v5 - v14;

    if (v3 == 1)
    {
      -[PXComposeRecipientAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, 0.0, 0.0, v11);
      v16 = 0.0;
    }
    else
    {
      -[PXComposeRecipientAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, v11, 0.0, 0.0);
      v16 = v15;
      v15 = 0.0;
    }
    -[PXComposeRecipientAddButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, v16, 0.0, v15);
  }
}

- (CGSize)imageSizeToAlignWith
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSizeToAlignWith.width;
  height = self->_imageSizeToAlignWith.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSizeToAlignWith:(CGSize)a3
{
  self->_imageSizeToAlignWith = a3;
}

- (double)inset
{
  return self->_inset;
}

- (void)setInset:(double)a3
{
  self->_inset = a3;
}

@end
