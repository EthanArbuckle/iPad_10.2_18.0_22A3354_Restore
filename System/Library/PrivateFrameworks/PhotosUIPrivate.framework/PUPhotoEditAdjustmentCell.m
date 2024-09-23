@implementation PUPhotoEditAdjustmentCell

- (PUPhotoEditAdjustmentCell)initWithFrame:(CGRect)a3
{
  PUPhotoEditAdjustmentCell *v3;
  PUPhotoEditAdjustmentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAdjustmentCell;
  v3 = -[PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PUPhotoEditAdjustmentCell _setupEventHandler](v3, "_setupEventHandler");
  return v4;
}

- (PUPhotoEditAdjustmentCell)initWithCoder:(id)a3
{
  PUPhotoEditAdjustmentCell *v3;
  PUPhotoEditAdjustmentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAdjustmentCell;
  v3 = -[PUPhotoEditBaseAdjustmentCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PUPhotoEditAdjustmentCell _setupEventHandler](v3, "_setupEventHandler");
  return v4;
}

- (void)_setupEventHandler
{
  id v3;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addTarget:action:forControlEvents:", self, sel_handleButton_, 64);

}

- (void)setImageName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->super._imageName != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._imageName, a3);
    -[PUPhotoEditAdjustmentCell reloadImage](self, "reloadImage");
    v5 = v6;
  }

}

- (void)setImageIsColor:(BOOL)a3
{
  if (self->super._imageIsColor != a3)
  {
    self->super._imageIsColor = a3;
    -[PUPhotoEditAdjustmentCell reloadImage](self, "reloadImage");
  }
}

- (void)setImageTransformBlock:(id)a3
{
  void *v4;
  id imageTransformBlock;

  v4 = _Block_copy(a3);
  imageTransformBlock = self->super._imageTransformBlock;
  self->super._imageTransformBlock = v4;

  -[PUPhotoEditAdjustmentCell reloadImage](self, "reloadImage");
}

- (void)reloadImage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0DC3870];
  -[PUPhotoEditBaseAdjustmentCell imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_PhotosUIImageNamed:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[PUPhotoEditBaseAdjustmentCell imageIsColor](self, "imageIsColor"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithTintColor:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v6;
  }
  -[PUPhotoEditBaseAdjustmentCell imageTransformBlock](self, "imageTransformBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PUPhotoEditBaseAdjustmentCell imageTransformBlock](self, "imageTransformBlock");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v8)[2](v8, v11);
    v9 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v9;
  }
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:forState:", v11, 0);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setSelected:](&v7, sel_setSelected_);
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setEnabled:](&v8, sel_setEnabled_);
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

  if (v3)
    v6 = 1.0;
  else
    v6 = 0.3;
  -[PUPhotoEditAdjustmentCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

- (void)setIsUserModifying:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setIsUserModifying:](&v4, sel_setIsUserModifying_, a3);
  -[PUPhotoEditAdjustmentCell _updateValueLabelVisibility](self, "_updateValueLabelVisibility");
}

- (void)_updateValueLabelVisibility
{
  _BOOL8 v3;
  id v4;

  if (-[PUPhotoEditBaseAdjustmentCell isUserModifying](self, "isUserModifying"))
    v3 = -[PUPhotoEditAdjustmentCell shouldDisplayValueLabel](self, "shouldDisplayValueLabel");
  else
    v3 = 0;
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowValueLabel:", v3);

}

- (void)setDisplayMappedValue:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayMappedValue:", v3);

}

- (BOOL)displayMappedValue
{
  void *v2;
  char v3;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayMappedValue");

  return v3;
}

- (void)handleButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUPhotoEditAdjustmentCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canToggleCell:", self);

  if (v5)
  {
    objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    -[PUPhotoEditAdjustmentCell setEnabled:](self, "setEnabled:", objc_msgSend(v7, "isSelected"));
    -[PUPhotoEditAdjustmentCell delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didToggleCell:", self);

  }
}

- (PUPhotoEditBaseAdjustmentCellDelegate)delegate
{
  return (PUPhotoEditBaseAdjustmentCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldDisplayValueLabel
{
  return self->_shouldDisplayValueLabel;
}

- (void)setShouldDisplayValueLabel:(BOOL)a3
{
  self->_shouldDisplayValueLabel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
