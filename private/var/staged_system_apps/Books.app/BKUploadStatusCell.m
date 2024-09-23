@implementation BKUploadStatusCell

- (void)awakeFromNib
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKUploadStatusCell;
  -[BKUploadStatusCell awakeFromNib](&v4, "awakeFromNib");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageContainerView](self, "coverImageContainerView"));
  objc_msgSend(v3, "setClipsToBounds:", 0);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKUploadStatusCell;
  -[BKUploadStatusCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageLayer](self, "coverImageLayer"));
  objc_msgSend(v3, "removeFromSuperlayer");

  -[BKUploadStatusCell setCoverImageLayer:](self, "setCoverImageLayer:", 0);
}

- (void)configureForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v4 = a3;
  v32 = v4;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell titleLabel](self, "titleLabel"));
    objc_msgSend(v6, "setText:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "path"));
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      v9 = objc_alloc((Class)BKLibraryFileSizeManagerCacheItemRequest);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "assetID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "path"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
      v13 = objc_msgSend(v9, "initWithCacheItemRequestWithAssetID:assetURL:", v10, v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryFileSizeManager sharedInstance](BKLibraryFileSizeManager, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "synchronousFileSizeForCacheItemRequest:", v13));

      v16 = objc_msgSend(v15, "longLongValue");
    }
    else
    {
      v16 = objc_msgSend(v32, "fileSize");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", v16, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryAssetStatusController sharedController](BKLibraryAssetStatusController, "sharedController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "assetID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "statusForAssetID:", v20));

    if (objc_msgSend(v21, "state") == (id)9)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("%@ - Uploading"), &stru_10091C438, 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v18));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell statusLabel](self, "statusLabel"));
      objc_msgSend(v25, "setText:", v24);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell statusLabel](self, "statusLabel"));
      objc_msgSend(v22, "setText:", v18);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "permanentOrTemporaryAssetID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "fetchLayerForAssetID:size:options:", v27, 2, 41.0, 53.0));
    -[BKUploadStatusCell setCoverImageLayer:](self, "setCoverImageLayer:", v28);

    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageContainerView](self, "coverImageContainerView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageLayer](self, "coverImageLayer"));
    objc_msgSend(v30, "addSublayer:", v31);

    -[BKUploadStatusCell _updateBookCover](self, "_updateBookCover");
    +[CATransaction commit](CATransaction, "commit");

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell titleLabel](self, "titleLabel"));
    objc_msgSend(v17, "setText:", CFSTR("General Book Title"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell statusLabel](self, "statusLabel"));
    objc_msgSend(v18, "setText:", CFSTR("3.4 MB - Uploading"));
  }

}

- (void)_updateBookCover
{
  void *v3;
  void *v4;
  __n128 v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageLayer](self, "coverImageLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "describedImageShown"));

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageLayer](self, "coverImageLayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "describedImageShown"));
    objc_msgSend(v7, "imageSize");
    v9 = v8;
    v11 = v10;

  }
  else
  {
    v9 = 40.0;
    v11 = 40.0;
  }
  v5.n128_u64[0] = *(_QWORD *)&CGPointZero.x;
  v12 = CGRectMakeWithOriginSize(v5, CGPointZero.y, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageContainerView](self, "coverImageContainerView"));
  v20 = objc_msgSend(v19, "bounds");
  v25 = CGRectFitRectInRectClip(v20, v12, v14, v16, v18, v21, v22, v23, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (id)objc_claimAutoreleasedReturnValue(-[BKUploadStatusCell coverImageLayer](self, "coverImageLayer"));
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKUploadStatusCell;
  -[BKUploadStatusCell layoutSubviews](&v3, "layoutSubviews");
  -[BKUploadStatusCell _updateBookCover](self, "_updateBookCover");
}

- (UIView)textContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_textContainerView);
}

- (void)setTextContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_textContainerView, a3);
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_titleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeWeak((id *)&self->_titleLabel, a3);
}

- (UILabel)statusLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_statusLabel);
}

- (void)setStatusLabel:(id)a3
{
  objc_storeWeak((id *)&self->_statusLabel, a3);
}

- (id)coverObserver
{
  return self->_coverObserver;
}

- (void)setCoverObserver:(id)a3
{
  objc_storeStrong(&self->_coverObserver, a3);
}

- (id)coverSourceIdentifier
{
  return self->_coverSourceIdentifier;
}

- (void)setCoverSourceIdentifier:(id)a3
{
  objc_storeStrong(&self->_coverSourceIdentifier, a3);
}

- (BCCacheVendedLayer)coverImageLayer
{
  return (BCCacheVendedLayer *)objc_loadWeakRetained((id *)&self->_coverImageLayer);
}

- (void)setCoverImageLayer:(id)a3
{
  objc_storeWeak((id *)&self->_coverImageLayer, a3);
}

- (UIView)coverImageContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_coverImageContainerView);
}

- (void)setCoverImageContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_coverImageContainerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverImageContainerView);
  objc_destroyWeak((id *)&self->_coverImageLayer);
  objc_storeStrong(&self->_coverSourceIdentifier, 0);
  objc_storeStrong(&self->_coverObserver, 0);
  objc_destroyWeak((id *)&self->_statusLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_textContainerView);
}

@end
