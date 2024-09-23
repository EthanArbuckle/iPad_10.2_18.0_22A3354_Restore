@implementation ICImageCollectionViewCell

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("image"), &stru_1005704B8, 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell itemNumberAccessibilityString](self, "itemNumberAccessibilityString"));
  v5 = __ICAccessibilityStringForVariables(1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
  v7 = v6;
  if (v5)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modificationDateForSpeaking"));
  v9 = (void *)v8;

  return v9;
}

+ (id)thumbnailCache
{
  if (qword_1005DDF58 != -1)
    dispatch_once(&qword_1005DDF58, &stru_100554290);
  return (id)qword_1005DDF50;
}

- (ICImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  ICImageCollectionViewCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (+[UIDevice ic_isVision](UIDevice, "ic_isVision"))
    v9 = 1;
  else
    v9 = 2;
  objc_msgSend(v8, "setContentMode:", v9);
  v12.receiver = self;
  v12.super_class = (Class)ICImageCollectionViewCell;
  v10 = -[ICImagesAndMoviesBaseCell initWithThumbnailView:frame:](&v12, "initWithThumbnailView:frame:", v8, x, y, width, height);

  return v10;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICImageCollectionViewCell;
  -[ICImageCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  -[ICImageCollectionViewCell updatePreviewImage](self, "updatePreviewImage");
}

- (void)setAttachment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICImageCollectionViewCell;
  -[ICImagesAndMoviesBaseCell setAttachment:](&v4, "setAttachment:", a3);
  -[ICImageCollectionViewCell updatePreviewImage](self, "updatePreviewImage");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICImageCollectionViewCell;
  -[ICImagesAndMoviesBaseCell didMoveToWindow](&v5, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  if (!v4)
    -[ICImageCollectionViewCell updatePreviewImage](self, "updatePreviewImage");
}

- (void)updatePreviewImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[6];
  _QWORD v34[4];
  id v35;
  id v36;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImageCollectionViewCell window](self, "window"));
  if (v3 && (v32 = v3, -[ICImageCollectionViewCell frame](self, "frame"), v3 = v32, v4 > 0.0))
  {
    -[ICImageCollectionViewCell frame](self, "frame");
    v6 = v5;

    if (v6 > 0.0)
    {
      objc_initWeak(&location, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v9 = objc_msgSend(v8, "copy");

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageCacheKey"));

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000CEA20;
      v34[3] = &unk_1005542B8;
      objc_copyWeak(&v36, &location);
      v12 = v9;
      v35 = v12;
      v13 = objc_retainBlock(v34);
      -[ICImageCollectionViewCell frame](self, "frame");
      v15 = v14;
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICImageCollectionViewCell window](self, "window"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
      objc_msgSend(v19, "scale");
      v21 = v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ICImageCollectionViewCell window](self, "window"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "screen"));
      objc_msgSend(v23, "scale");
      v25 = v24;
      v26 = v15 * fmax(v21, 1.0);

      v27 = v17 * fmax(v25, 1.0);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000CEB44;
      v33[3] = &unk_1005542D8;
      *(double *)&v33[4] = v26;
      *(double *)&v33[5] = v27;
      v28 = objc_retainBlock(v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICBrowseAttachmentsBaseCell attachment](self, "attachment"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ICImageCollectionViewCell ic_appearanceInfo](self, "ic_appearanceInfo"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[ICImageCollectionViewCell thumbnailCache](ICImageCollectionViewCell, "thumbnailCache"));
      objc_msgSend(v29, "fetchThumbnailImageWithMinSize:scale:appearanceInfo:cache:cacheKey:processingBlock:completionBlock:fallbackBlock:aboutToLoadHandler:", v30, v31, v11, v28, v13, 0, v26, v27, 1.0, 0);

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICImageCollectionViewCell;
  -[ICBrowseAttachmentsBaseCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICImagesAndMoviesBaseCell thumbnailView](self, "thumbnailView"));
  objc_msgSend(v3, "setImage:", 0);

}

@end
