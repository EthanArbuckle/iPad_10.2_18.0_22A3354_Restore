@implementation PUPhotosSharingSelectionView

- (PUPhotosSharingSelectionView)initWithFrame:(CGRect)a3
{
  PUPhotosSharingSelectionView *v3;
  void *v4;
  uint64_t v5;
  UIImageView *selectedCheckmarkView;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImageView *unselectedCheckmarkView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUPhotosSharingSelectionView;
  v3 = -[PUPhotosSharingSelectionView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_circularGlyphViewWithName:backgroundColor:", CFSTR("checkmark.circle"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    selectedCheckmarkView = v3->_selectedCheckmarkView;
    v3->_selectedCheckmarkView = (UIImageView *)v5;

    -[UIImageView setHidden:](v3->_selectedCheckmarkView, "setHidden:", 1);
    -[PUPhotosSharingSelectionView addSubview:](v3, "addSubview:", v3->_selectedCheckmarkView);
    -[PUPhotosSharingSelectionView bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_selectedCheckmarkView, "setFrame:");
    v7 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("circle"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    unselectedCheckmarkView = v3->_unselectedCheckmarkView;
    v3->_unselectedCheckmarkView = (UIImageView *)v9;

    -[PUPhotosSharingSelectionView addSubview:](v3, "addSubview:", v3->_unselectedCheckmarkView);
    -[PUPhotosSharingSelectionView bounds](v3, "bounds");
    -[UIImageView setFrame:](v3->_unselectedCheckmarkView, "setFrame:");

  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIImageView setHidden:](self->_selectedCheckmarkView, "setHidden:", !a3);
  -[UIImageView setHidden:](self->_unselectedCheckmarkView, "setHidden:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedCheckmarkView, 0);
  objc_storeStrong((id *)&self->_selectedCheckmarkView, 0);
}

@end
