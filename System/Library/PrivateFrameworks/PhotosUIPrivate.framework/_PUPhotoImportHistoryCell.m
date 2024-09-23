@implementation _PUPhotoImportHistoryCell

- (_PUPhotoImportHistoryCell)initWithFrame:(CGRect)a3
{
  _PUPhotoImportHistoryCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PUPhotoImportHistoryCell;
  v3 = -[_PUPhotoImportHistoryCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 2);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[_PUPhotoImportHistoryCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_imageView);

    v3->_currentImageRequestToken = 0;
  }
  return v3;
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
  v12.super_class = (Class)_PUPhotoImportHistoryCell;
  -[_PUPhotoImportHistoryCell layoutSubviews](&v12, sel_layoutSubviews);
  -[_PUPhotoImportHistoryCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_PUPhotoImportHistoryCell imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PUPhotoImportHistoryCell;
  -[_PUPhotoImportHistoryCell prepareForReuse](&v3, sel_prepareForReuse);
  -[_PUPhotoImportHistoryCell setAsset:](self, "setAsset:", 0);
}

- (void)setAsset:(id)a3
{
  PHAsset *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  id location;

  v5 = (PHAsset *)a3;
  if (self->_asset != v5)
  {
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelImageRequest:", -[_PUPhotoImportHistoryCell currentImageRequestToken](self, "currentImageRequestToken"));

    -[_PUPhotoImportHistoryCell setCurrentImageRequestToken:](self, "setCurrentImageRequestToken:", 0);
    -[_PUPhotoImportHistoryCell imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);

    objc_storeStrong((id *)&self->_asset, a3);
    if (v5)
    {
      objc_initWeak(&location, self);
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v18 = 1;
      objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PUPhotoImportHistoryCell bounds](self, "bounds");
      v10 = v9;
      v12 = v11;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __38___PUPhotoImportHistoryCell_setAsset___block_invoke;
      v13[3] = &unk_1E58AADB8;
      objc_copyWeak(&v14, &location);
      v13[4] = &v15;
      -[_PUPhotoImportHistoryCell setCurrentImageRequestToken:](self, "setCurrentImageRequestToken:", objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, 1, 0, v13, v10, v12));

      *((_BYTE *)v16 + 24) = 0;
      objc_destroyWeak(&v14);
      _Block_object_dispose(&v15, 8);
      objc_destroyWeak(&location);
    }
    -[_PUPhotoImportHistoryCell _updateBorderColor](self, "_updateBorderColor");
  }

}

- (void)_updateBorderColor
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  -[_PUPhotoImportHistoryCell asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFavorite");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[_PUPhotoImportHistoryCell layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v6);

    -[_PUPhotoImportHistoryCell layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 4.0;
  }
  else
  {
    -[_PUPhotoImportHistoryCell layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderColor:", 0);

    -[_PUPhotoImportHistoryCell layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0.0;
  }
  v11 = v8;
  objc_msgSend(v8, "setBorderWidth:", v9);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (int)currentImageRequestToken
{
  return self->_currentImageRequestToken;
}

- (void)setCurrentImageRequestToken:(int)a3
{
  self->_currentImageRequestToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
