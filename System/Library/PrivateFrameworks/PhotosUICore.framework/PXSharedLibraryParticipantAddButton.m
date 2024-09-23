@implementation PXSharedLibraryParticipantAddButton

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PXSharedLibraryParticipantAddButton setContentHorizontalAlignment:](self, "setContentHorizontalAlignment:", 4);
  -[PXSharedLibraryParticipantAddButton titleLabel](self, "titleLabel");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E0DC4A88], 0x8000, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v3);
  objc_msgSend(v11, "setLineBreakMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "tableCellBlueTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantAddButton setTitleColor:forState:](self, "setTitleColor:forState:", v4, 0);
  -[PXSharedLibraryParticipantAddButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 1);
  -[PXSharedLibraryParticipantAddButton setTitleColor:forState:](self, "setTitleColor:forState:", v6, 2);
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrarySetupAssistant_Participants_AddPeople_Button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantAddButton setTitle:forState:](self, "setTitle:forState:", v7, 0);

  PXSharedLibraryCellSystemImageNamed(CFSTR("plus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_tintedImageWithColor:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_tintedImageWithColor:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibraryParticipantAddButton setImage:forState:](self, "setImage:forState:", v8, 0);
  -[PXSharedLibraryParticipantAddButton setImage:forState:](self, "setImage:forState:", v9, 1);
  -[PXSharedLibraryParticipantAddButton setImage:forState:](self, "setImage:forState:", v10, 2);

}

- (PXSharedLibraryParticipantAddButton)initWithFrame:(CGRect)a3
{
  PXSharedLibraryParticipantAddButton *v3;
  PXSharedLibraryParticipantAddButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryParticipantAddButton;
  v3 = -[PXSharedLibraryParticipantAddButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXSharedLibraryParticipantAddButton _commonInit](v3, "_commonInit");
  return v4;
}

- (PXSharedLibraryParticipantAddButton)initWithCoder:(id)a3
{
  PXSharedLibraryParticipantAddButton *v3;
  PXSharedLibraryParticipantAddButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryParticipantAddButton;
  v3 = -[PXSharedLibraryParticipantAddButton initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXSharedLibraryParticipantAddButton _commonInit](v3, "_commonInit");
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
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibraryParticipantAddButton;
  -[PXSharedLibraryParticipantAddButton layoutSubviews](&v21, sel_layoutSubviews);
  v3 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PXSharedLibraryParticipantAddButton semanticContentAttribute](self, "semanticContentAttribute"));
  -[PXSharedLibraryParticipantAddButton imageSizeToAlignWith](self, "imageSizeToAlignWith");
  v5 = v4;
  -[PXSharedLibraryParticipantAddButton inset](self, "inset");
  v7 = v6;
  -[PXSharedLibraryParticipantAddButton imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v7 + v5 * 0.5 - v10 * 0.5;

  -[PXSharedLibraryParticipantAddButton imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "size");
  v15 = v7 + v7 + v5 - v14;

  v16 = 0.0;
  if (v3 == 1)
  {
    PXEdgeInsetsByFlippingHorizontally();
    -[PXSharedLibraryParticipantAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:");
    PXEdgeInsetsByFlippingHorizontally();
    v15 = v19;
    v16 = v20;
  }
  else
  {
    -[PXSharedLibraryParticipantAddButton setImageEdgeInsets:](self, "setImageEdgeInsets:", 0.0, v11, 0.0, 0.0);
    v18 = 0.0;
    v17 = 0.0;
  }
  -[PXSharedLibraryParticipantAddButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", v17, v15, v18, v16);
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
