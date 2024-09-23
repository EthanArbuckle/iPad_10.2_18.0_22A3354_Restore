@implementation BKAssetCoverImageHelper

- (BKAssetCoverImageHelper)initWithThumbnailGenerator:(id)a3 pluginRegistry:(id)a4
{
  id v7;
  id v8;
  BKAssetCoverImageHelper *v9;
  BKAssetCoverImageHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKAssetCoverImageHelper;
  v9 = -[BKAssetCoverImageHelper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pluginRegistry, a4);
    objc_storeStrong((id *)&v10->_thumbnailGenerator, a3);
  }

  return v10;
}

- (void)coverImageFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C03C4;
    v12[3] = &unk_1008E9AB0;
    v14 = v7;
    v13 = v6;
    objc_copyWeak(&v15, &location);
    -[BKAssetCoverImageHelper _thumbnailGeneratorCoverImageFromURL:completion:](self, "_thumbnailGeneratorCoverImageFromURL:completion:", v13, v12);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  else
  {
    v8 = BKLibraryLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10069F110(v9);

    v10 = (void (**)(id, _QWORD, void *))objc_retainBlock(v7);
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAssetCoverImageDomain"), 1000, 0));
      v10[2](v10, 0, v11);

    }
  }

}

- (void)_thumbnailGeneratorCoverImageFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v8, "scale");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("epub")))
    v13 = 2048.0;
  else
    v13 = 1024.0;

  v14 = objc_msgSend(objc_alloc((Class)QLThumbnailGenerationRequest), "initWithFileAtURL:size:scale:representationTypes:", v7, 6, v13, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetCoverImageHelper thumbnailGenerator](self, "thumbnailGenerator"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C0910;
  v17[3] = &unk_1008E9AD8;
  v18 = v6;
  v16 = v6;
  objc_msgSend(v15, "generateBestRepresentationForRequest:completionHandler:", v14, v17);

}

- (void)_pluginRegistryCoverImageFromURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetCoverImageHelper pluginRegistry](self, "pluginRegistry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pluginForURL:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "helperForURL:withOptions:", v7, 0));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C0A78;
  v12[3] = &unk_1008E9B00;
  v13 = v6;
  v11 = v6;
  -[BKAssetCoverImageHelper _helper:coverImageWithCompletion:](self, "_helper:coverImageWithCompletion:", v10, v12);

}

- (void)_helper:(id)a3 coverImageWithCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if (!v10)
  {
    v6 = objc_retainBlock(v5);
    v7 = v6;
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector(v10, "helperCoverImageWithCompletion:") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "helperCoverImage"));
    v8 = objc_retainBlock(v5);
    v9 = v8;
    if (v8)
      (*((void (**)(id, void *))v8 + 2))(v8, v7);

LABEL_9:
    goto LABEL_10;
  }
  objc_msgSend(v10, "helperCoverImageWithCompletion:", v5);
LABEL_10:

}

- (void)_imageIOCoverImageFromURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void (**v11)(id, _QWORD, void *);
  id v12;
  void *v13;
  uint64_t v14;
  char v15;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v15);

  if (v15)
    v9 = 0;
  if (v9 == 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v5));
    v11 = (void (**)(id, _QWORD, void *))objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v10));

    if (v11)
    {
      v12 = objc_retainBlock(v6);
      v13 = v12;
      if (v12)
        (*((void (**)(id, id, _QWORD))v12 + 2))(v12, v11, 0);
LABEL_12:

      goto LABEL_13;
    }
  }
  v11 = (void (**)(id, _QWORD, void *))objc_retainBlock(v6);
  if (v11)
  {
    if (v9)
      v14 = 1002;
    else
      v14 = 1003;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAssetCoverImageDomain"), v14, 0));
    v11[2](v11, 0, v13);
    goto LABEL_12;
  }
LABEL_13:

}

- (QLThumbnailGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

- (AEPluginRegistry)pluginRegistry
{
  return self->_pluginRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginRegistry, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
}

@end
