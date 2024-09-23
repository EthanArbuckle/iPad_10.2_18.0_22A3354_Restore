@implementation FRHeadlineNotificationWrapper

- (FRHeadlineNotificationWrapper)initWithHeadline:(id)a3
{
  id v4;
  FRHeadlineNotificationWrapper *v5;
  uint64_t v6;
  NSString *headlineNotification_identifier;
  uint64_t v8;
  NSString *headlineNotification_publisher;
  uint64_t v10;
  NSString *headlineNotification_title;
  void *v12;
  uint64_t v13;
  NSString *headlineNotification_date;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIImage *v23;
  NSData *v24;
  void *v25;
  id v26;
  void *v27;
  NSString *v28;
  NSString *headlineNotification_base64Image;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  UIImage *v39;
  NSData *v40;
  void *v41;
  id v42;
  void *v43;
  NSString *v44;
  NSString *headlineNotification_base64PublisherImage;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)FRHeadlineNotificationWrapper;
  v5 = -[FRHeadlineNotificationWrapper init](&v47, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    headlineNotification_identifier = v5->_headlineNotification_identifier;
    v5->_headlineNotification_identifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceName"));
    headlineNotification_publisher = v5->_headlineNotification_publisher;
    v5->_headlineNotification_publisher = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    headlineNotification_title = v5->_headlineNotification_title;
    v5->_headlineNotification_title = (NSString *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publishDate"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fr_gregorianShortDisplayString"));
    headlineNotification_date = v5->_headlineNotification_date;
    v5->_headlineNotification_date = (NSString *)v13;

    v15 = FCThumbnailForHeadline(v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "thumbnailAssetHandle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filePath"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "thumbnailAssetHandle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "filePath"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v20));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fr_croppedImageWithAspectRatio:", 2.0));
      v23 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fr_scaledImageWithMaximumSize:targetScale:", 100.0, 50.0, 2.0));

      v24 = UIImagePNGRepresentation(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      v26 = objc_alloc((Class)NSString);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "base64EncodedDataWithOptions:", 0));
      v28 = (NSString *)objc_msgSend(v26, "initWithData:encoding:", v27, 4);
      headlineNotification_base64Image = v5->_headlineNotification_base64Image;
      v5->_headlineNotification_base64Image = v28;

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceChannel"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "theme"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "logoImageAssetHandle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "filePath"));

    if (v33)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourceChannel"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "theme"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "logoImageAssetHandle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "filePath"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v37));

      v39 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "fr_scaledImageWithMaximumSize:targetScale:", 16.0, 16.0, 2.0));
      v40 = UIImagePNGRepresentation(v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = objc_alloc((Class)NSString);
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "base64EncodedDataWithOptions:", 0));
      v44 = (NSString *)objc_msgSend(v42, "initWithData:encoding:", v43, 4);
      headlineNotification_base64PublisherImage = v5->_headlineNotification_base64PublisherImage;
      v5->_headlineNotification_base64PublisherImage = v44;

    }
  }

  return v5;
}

- (FRHeadlineNotificationWrapper)initWithDictionary:(id)a3
{
  id v4;
  FRHeadlineNotificationWrapper *v5;
  uint64_t v6;
  NSString *headlineNotification_identifier;
  uint64_t v8;
  NSString *headlineNotification_date;
  uint64_t v10;
  NSString *headlineNotification_publisher;
  uint64_t v12;
  NSString *headlineNotification_title;
  uint64_t v14;
  NSString *headlineNotification_base64Image;
  uint64_t v16;
  NSString *headlineNotification_base64PublisherImage;
  NSString *v18;
  NSString *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FRHeadlineNotificationWrapper;
  v5 = -[FRHeadlineNotificationWrapper init](&v21, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("identifier")));
    headlineNotification_identifier = v5->_headlineNotification_identifier;
    v5->_headlineNotification_identifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("date")));
    headlineNotification_date = v5->_headlineNotification_date;
    v5->_headlineNotification_date = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("publisher")));
    headlineNotification_publisher = v5->_headlineNotification_publisher;
    v5->_headlineNotification_publisher = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("title")));
    headlineNotification_title = v5->_headlineNotification_title;
    v5->_headlineNotification_title = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("b64image")));
    headlineNotification_base64Image = v5->_headlineNotification_base64Image;
    v5->_headlineNotification_base64Image = (NSString *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("b64publisherImage")));
    headlineNotification_base64PublisherImage = v5->_headlineNotification_base64PublisherImage;
    v5->_headlineNotification_base64PublisherImage = (NSString *)v16;

    if (!-[NSString length](v5->_headlineNotification_base64Image, "length"))
    {
      v18 = v5->_headlineNotification_base64Image;
      v5->_headlineNotification_base64Image = 0;

    }
    if (!-[NSString length](v5->_headlineNotification_base64PublisherImage, "length"))
    {
      v19 = v5->_headlineNotification_base64PublisherImage;
      v5->_headlineNotification_base64PublisherImage = 0;

    }
  }

  return v5;
}

- (id)headlineNotification_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRHeadlineNotificationWrapper headlineNotification_base64Image](self, "headlineNotification_base64Image"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v4, CFSTR("b64image"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRHeadlineNotificationWrapper headlineNotification_base64PublisherImage](self, "headlineNotification_base64PublisherImage"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v5, CFSTR("b64publisherImage"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRHeadlineNotificationWrapper headlineNotification_identifier](self, "headlineNotification_identifier"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v6, CFSTR("identifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRHeadlineNotificationWrapper headlineNotification_title](self, "headlineNotification_title"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v7, CFSTR("title"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRHeadlineNotificationWrapper headlineNotification_publisher](self, "headlineNotification_publisher"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v8, CFSTR("publisher"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRHeadlineNotificationWrapper headlineNotification_date](self, "headlineNotification_date"));
  objc_msgSend(v3, "fc_safelySetObject:forKey:", v9, CFSTR("date"));

  v10 = objc_msgSend(v3, "copy");
  return v10;
}

- (NSString)headlineNotification_identifier
{
  return self->_headlineNotification_identifier;
}

- (NSString)headlineNotification_title
{
  return self->_headlineNotification_title;
}

- (NSString)headlineNotification_date
{
  return self->_headlineNotification_date;
}

- (NSString)headlineNotification_base64Image
{
  return self->_headlineNotification_base64Image;
}

- (NSString)headlineNotification_publisher
{
  return self->_headlineNotification_publisher;
}

- (NSString)headlineNotification_base64PublisherImage
{
  return self->_headlineNotification_base64PublisherImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headlineNotification_base64PublisherImage, 0);
  objc_storeStrong((id *)&self->_headlineNotification_publisher, 0);
  objc_storeStrong((id *)&self->_headlineNotification_base64Image, 0);
  objc_storeStrong((id *)&self->_headlineNotification_date, 0);
  objc_storeStrong((id *)&self->_headlineNotification_title, 0);
  objc_storeStrong((id *)&self->_headlineNotification_identifier, 0);
}

@end
