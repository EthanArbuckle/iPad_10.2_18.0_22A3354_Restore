@implementation BKActivityPDFLinkPresentationItemSource

- (BKActivityPDFLinkPresentationItemSource)initWithBookInfo:(id)a3
{
  id v5;
  BKActivityPDFLinkPresentationItemSource *v6;
  BKActivityPDFLinkPresentationItemSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKActivityPDFLinkPresentationItemSource;
  v6 = -[BKActivityPDFLinkPresentationItemSource init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bookInfo, a3);

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return 0;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIImage *v10;
  UIImage *v11;
  NSData *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v27;
  uint64_t v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityPDFLinkPresentationItemSource bookInfo](self, "bookInfo", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookBundlePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pluginForURL:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "helperForURL:withOptions:", v6, 0));
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "helperCoverImageOfSize:", 100.0, 100.0));
  v11 = v10;
  if (!v10)
  {
    v13 = 0;
    goto LABEL_8;
  }
  v12 = UIImagePNGRepresentation(v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v27 = v8;
  v14 = objc_alloc_init((Class)LPLinkMetadata);
  objc_msgSend(v14, "setURL:", v6);
  objc_msgSend(v14, "setOriginalURL:", v6);
  v15 = objc_alloc_init((Class)LPFileMetadata);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityPDFLinkPresentationItemSource bookInfo](self, "bookInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bookTitle"));
  objc_msgSend(v15, "setName:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityPDFLinkPresentationItemSource bookInfo](self, "bookInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
  v21 = BCAssetContentTypeFromAssetTypeString();

  v22 = BCAssetUTIForContentType(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v15, "setType:", v23);

  v28 = 0;
  v24 = objc_msgSend(v6, "bu_fileAllocatedSizeWithError:", &v28);
  if (!v28 && v24)
    objc_msgSend(v15, "setSize:", v24);
  v25 = objc_msgSend(objc_alloc((Class)LPImage), "initWithData:MIMEType:", v13, CFSTR("image/png"));
  objc_msgSend(v15, "setThumbnail:", v25);
  objc_msgSend(v14, "setSpecialization:", v15);

  v8 = v27;
LABEL_9:

  return v14;
}

- (AEBookInfo)bookInfo
{
  return self->_bookInfo;
}

- (void)setBookInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bookInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookInfo, 0);
}

@end
