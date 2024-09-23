@implementation _BSUIProfileImageLayerConfig

- (_BSUIProfileImageLayerConfig)initWithSize:(CGSize)a3 contentsScale:(double)a4 cornerRadius:(double)a5 maskColor:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  _BSUIProfileImageLayerConfig *v13;
  _BSUIProfileImageLayerConfig *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a3.height;
  width = a3.width;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_BSUIProfileImageLayerConfig;
  v13 = -[_BSUIProfileImageLayerConfig init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    v13->_size.width = width;
    v13->_size.height = height;
    v13->_contentsScale = a4;
    v13->_cornerRadius = a5;
    objc_storeStrong((id *)&v13->_maskColor, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, "_accountStoreChanged:", AAUIProfilePictureStoreDidChangeNotification, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    objc_msgSend(v16, "addObserver:accountTypes:", v14, 1);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AAUIProfilePictureStoreDidChangeNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  objc_msgSend(v4, "removeObserver:accountTypes:", self, 1);

  v5.receiver = self;
  v5.super_class = (Class)_BSUIProfileImageLayerConfig;
  -[_BSUIProfileImageLayerConfig dealloc](&v5, "dealloc");
}

- (void)_accountStoreChanged:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_17290;
  v8[3] = &unk_2E48C8;
  objc_copyWeak(&v9, &location);
  v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_17318;
      block[3] = &unk_2E3F88;
      v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (id)_generateImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double height;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeStoreAccount"));

  if (!v4
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIProfileImageLayerConfig profilePictureStore](self, "profilePictureStore")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "profilePictureForAccountOwnerWithoutMonogramFallback")),
        v5,
        !v6))
  {
    height = self->_size.height;
    if (height < self->_size.width)
      height = self->_size.width;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 3, 3, height));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("person.crop.circle")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIProfileImageLayerConfig maskColor](self, "maskColor"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIProfileImageLayerConfig maskColor](self, "maskColor"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tui_imageMaskWithColor:", v11));

      v6 = (void *)v12;
    }

  }
  return v6;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (Class)layerClassForSize:(CGSize)a3
{
  return -[_BSUIProfileImageLayerConfig layerClass](self, "layerClass", a3.width, a3.height);
}

- (void)configureLayer:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_layer, a3);
  v5 = a3;
  objc_msgSend(v5, "setRasterizationScale:", self->_contentsScale);
  objc_msgSend(v5, "setContentsGravity:", kCAGravityResizeAspectFill);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[_BSUIProfileImageLayerConfig _generateImage](self, "_generateImage")));
  objc_msgSend(v5, "setContents:", objc_msgSend(v6, "CGImage"));
  objc_msgSend(v5, "setContentsScale:", self->_contentsScale);
  objc_msgSend(v5, "setCornerRadius:", self->_cornerRadius);
  objc_msgSend(v5, "setMasksToBounds:", 1);

}

- (BOOL)isEqualToConfig:(id)a3
{
  return self == a3;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (AAUIProfilePictureStore)profilePictureStore
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iCloudAccountName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeStoreAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));

  if (objc_msgSend(v3, "length") && objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryAppleAccount"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore bu_sharedAccountStore](ACAccountStore, "bu_sharedAccountStore"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aida_accountForPrimaryiCloudAccount"));
    v11 = objc_msgSend(objc_alloc((Class)AAUIProfilePictureStore), "initWithAppleAccount:grandSlamAccount:accountStore:", v8, v10, v9);
    objc_msgSend(v11, "setMonogramType:", 2);

  }
  else
  {
    v11 = 0;
  }

  return (AAUIProfilePictureStore *)v11;
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  -[_BSUIProfileImageLayerConfig _accountStoreChanged:](self, "_accountStoreChanged:", 0, a4);
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (UIColor)maskColor
{
  return self->_maskColor;
}

- (void)setMaskColor:(id)a3
{
  objc_storeStrong((id *)&self->_maskColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskColor, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
