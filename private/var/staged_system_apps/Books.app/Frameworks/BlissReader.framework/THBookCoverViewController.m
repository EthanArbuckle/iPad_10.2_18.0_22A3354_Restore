@implementation THBookCoverViewController

- (THBookCoverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  THBookCoverViewController *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THBookCoverViewController;
  v4 = -[THBookCoverViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v6 = -[THBookCoverViewController registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v5, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UIImageView *v5;
  UIImageView *imageView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THBookCoverViewController;
  -[THBookCoverViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THBookCoverViewController view](self, "view"));
  v4 = objc_alloc((Class)UIImageView);
  objc_msgSend(v3, "bounds");
  v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
  imageView = self->_imageView;
  self->_imageView = v5;

  -[UIImageView setAutoresizingMask:](self->_imageView, "setAutoresizingMask:", 18);
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
  objc_msgSend(v3, "addSubview:", self->_imageView);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THBookCoverViewController;
  -[THBookCoverViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_imageView, "image"));

  if (!v4)
    -[THBookCoverViewController th_fetchCoverImage](self, "th_fetchCoverImage");
}

- (void)th_fetchCoverImage
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  THBookCoverViewController *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  NSObject *v33;
  _QWORD *v34;
  _QWORD v35[4];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THAsset assetID](self->_asset, "assetID"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THBookCoverViewController traitCollection](self, "traitCollection"));
    v5 = objc_msgSend(v4, "userInterfaceStyle") == (char *)&dword_0 + 2;

    v6 = (v5 << 6);
    v7 = BCImageCacheLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_27120C((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[THBookCoverViewController view](self, "view"));
    objc_msgSend(v15, "bounds");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v3, v6, v16, v17));

    objc_msgSend(v18, "setRequestOptions:", 18);
    objc_msgSend(v18, "setPriority:", 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THAsset title](self->_asset, "title"));
    objc_msgSend(v18, "setTitle:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[THAsset author](self->_asset, "author"));
    objc_msgSend(v18, "setAuthor:", v20);

    v21 = objc_msgSend(v18, "copy");
    objc_msgSend(v21, "setRequestOptions:", 514);
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = sub_5574C;
    v40[4] = sub_5575C;
    v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = sub_5574C;
    v38[4] = sub_5575C;
    v39 = 0;
    v22 = dispatch_group_create();
    dispatch_group_enter(v22);
    dispatch_group_enter(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_55764;
    v35[3] = &unk_427C28;
    v37 = v40;
    v24 = v22;
    v36 = v24;
    objc_msgSend(v23, "fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:", v21, v21, 1, v35, 4.0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[BCCacheManager defaultCacheManager](BCCacheManager, "defaultCacheManager"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_557B0;
    v32[3] = &unk_427C28;
    v34 = v38;
    v26 = v24;
    v33 = v26;
    objc_msgSend(v25, "fetchCGImageFor:forRequest:timeOut:waitForNonGeneric:completion:", v18, v18, 1, v32, 4.0);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_557FC;
    block[3] = &unk_427C50;
    v30 = v40;
    v31 = v38;
    v28 = v3;
    v29 = self;
    dispatch_group_notify(v26, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);

  }
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (THAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
