@implementation PUPhotoEditAutoAdjustmentCell

- (PUPhotoEditAutoAdjustmentCell)initWithFrame:(CGRect)a3
{
  PUPhotoEditAutoAdjustmentCell *v3;
  PUPhotoEditAutoAdjustmentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  v3 = -[PUPhotoEditBaseAdjustmentCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PUPhotoEditAutoAdjustmentCell _configureContainerButton](v3, "_configureContainerButton");
  return v4;
}

- (PUPhotoEditAutoAdjustmentCell)initWithCoder:(id)a3
{
  PUPhotoEditAutoAdjustmentCell *v3;
  PUPhotoEditAutoAdjustmentCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  v3 = -[PUPhotoEditBaseAdjustmentCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PUPhotoEditAutoAdjustmentCell _configureContainerButton](v3, "_configureContainerButton");
  return v4;
}

- (void)_configureContainerButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldShowValueLabel:", 0);

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowCircularRing:", 0);

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldScaleDownImage:", 0);

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_handleButton_, 64);

}

- (void)setImageName:(id)a3
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;

  v5 = (NSString *)a3;
  if (self->super._imageName != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->super._imageName, a3);
    objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-Selected"), v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pu_PhotosUIImageNamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUPhotoEditAutoAdjustmentCell traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceStyle");

    -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 2)
      v14 = v6;
    else
      v14 = v9;
    objc_msgSend(v12, "setImage:forState:", v14, 0);

    if (v9)
    {
      -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v11 == 2)
        v17 = v9;
      else
        v17 = v6;
      objc_msgSend(v15, "setImage:forState:", v17, 4);

    }
    v5 = v18;
  }

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setSelected:](&v6, sel_setSelected_);
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditAutoAdjustmentCell;
  -[PUPhotoEditBaseAdjustmentCell setEnabled:](&v6, sel_setEnabled_);
  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", v3);

}

- (void)handleButton:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUPhotoEditAutoAdjustmentCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canToggleCell:", self);

  if (v5)
  {
    objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
    -[PUPhotoEditAutoAdjustmentCell setEnabled:](self, "setEnabled:", objc_msgSend(v7, "isSelected"));
    -[PUPhotoEditAutoAdjustmentCell delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didToggleCell:", self);

  }
}

- (void)performPrimaryAction
{
  id v3;

  -[PUPhotoEditBaseAdjustmentCell containerButton](self, "containerButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditAutoAdjustmentCell handleButton:](self, "handleButton:", v3);

}

- (PUPhotoEditBaseAdjustmentCellDelegate)delegate
{
  return (PUPhotoEditBaseAdjustmentCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
