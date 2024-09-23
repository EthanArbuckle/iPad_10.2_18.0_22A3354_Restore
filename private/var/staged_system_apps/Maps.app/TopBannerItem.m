@implementation TopBannerItem

- (TopBannerItem)initWithType:(unint64_t)a3 layout:(int64_t)a4 userInfo:(id)a5 attributedString:(id)a6 icon:(id)a7 buttonText:(id)a8 buttonAction:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TopBannerItem *v21;
  TopBannerItem *v22;
  NSAttributedString *v23;
  NSAttributedString *attributedText;
  NSString *v25;
  NSString *buttonText;
  id v27;
  id buttonAction;
  objc_super v30;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)TopBannerItem;
  v21 = -[TopBannerItem init](&v30, "init");
  v22 = v21;
  if (v21)
  {
    v21->_itemType = a3;
    v21->_layout = a4;
    objc_storeStrong(&v21->_userInfo, a5);
    v22->_maxNumberOfLines = 2;
    v23 = (NSAttributedString *)objc_msgSend(v17, "copy");
    attributedText = v22->_attributedText;
    v22->_attributedText = v23;

    objc_storeStrong((id *)&v22->_artwork, a7);
    v25 = (NSString *)objc_msgSend(v19, "copy");
    buttonText = v22->_buttonText;
    v22->_buttonText = v25;

    v27 = objc_msgSend(v20, "copy");
    buttonAction = v22->_buttonAction;
    v22->_buttonAction = v27;

  }
  return v22;
}

- (TopBannerItem)initWithType:(unint64_t)a3 layout:(int64_t)a4 userInfo:(id)a5 attributedString:(id)a6 iconURL:(id)a7 buttonText:(id)a8 buttonAction:(id)a9 iconProcessingHandler:(id)a10
{
  id v16;
  id v17;
  TopBannerItem *v18;
  NSURL *v19;
  NSURL *artworkURL;
  id v21;
  id iconProcessingHandler;

  v16 = a7;
  v17 = a10;
  v18 = -[TopBannerItem initWithType:layout:userInfo:attributedString:icon:buttonText:buttonAction:](self, "initWithType:layout:userInfo:attributedString:icon:buttonText:buttonAction:", a3, a4, a5, a6, 0, a8, a9);
  if (v18)
  {
    v19 = (NSURL *)objc_msgSend(v16, "copy");
    artworkURL = v18->_artworkURL;
    v18->_artworkURL = v19;

    v21 = objc_msgSend(v17, "copy");
    iconProcessingHandler = v18->_iconProcessingHandler;
    v18->_iconProcessingHandler = v21;

    -[TopBannerItem downloadImage](v18, "downloadImage");
  }

  return v18;
}

- (void)downloadImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v3));

  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem artworkURL](self, "artworkURL"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100754740;
  v8[3] = &unk_1011C0668;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataTaskWithURL:completionHandler:", v5, v8));
  -[TopBannerItem setUrlSessionTask:](self, "setUrlSessionTask:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TopBannerItem urlSessionTask](self, "urlSessionTask"));
  objc_msgSend(v7, "resume");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (int64_t)maxNumberOfLines
{
  return self->_maxNumberOfLines;
}

- (void)setMaxNumberOfLines:(int64_t)a3
{
  self->_maxNumberOfLines = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (int64_t)layout
{
  return self->_layout;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (MKArtworkImageSource)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (id)buttonAction
{
  return self->_buttonAction;
}

- (NSURLSessionTask)urlSessionTask
{
  return self->_urlSessionTask;
}

- (void)setUrlSessionTask:(id)a3
{
  objc_storeStrong((id *)&self->_urlSessionTask, a3);
}

- (id)iconProcessingHandler
{
  return self->_iconProcessingHandler;
}

- (void)setIconProcessingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_iconProcessingHandler, 0);
  objc_storeStrong((id *)&self->_urlSessionTask, 0);
  objc_storeStrong(&self->_buttonAction, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong(&self->_userInfo, 0);
}

@end
