@implementation _BSUIFamilyProfileImageLayerConfig

- (_BSUIFamilyProfileImageLayerConfig)initWithSize:(CGSize)a3 contentsScale:(double)a4 cornerRadius:(double)a5 urlString:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  _BSUIFamilyProfileImageLayerConfig *v13;
  _BSUIFamilyProfileImageLayerConfig *v14;
  void *v15;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_BSUIFamilyProfileImageLayerConfig;
  v13 = -[_BSUIFamilyProfileImageLayerConfig init](&v17, "init");
  v14 = v13;
  if (v13)
  {
    v13->_size.width = width;
    v13->_size.height = height;
    v13->_contentsScale = a4;
    v13->_cornerRadius = a5;
    objc_storeStrong((id *)&v13->_urlString, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, "_profilePictureStoreChanged:", AAUIProfilePictureStoreDidChangeNotification, 0);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, AAUIProfilePictureStoreDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)_BSUIFamilyProfileImageLayerConfig;
  -[_BSUIFamilyProfileImageLayerConfig dealloc](&v4, "dealloc");
}

- (void)_profilePictureStoreChanged:(id)a3
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
  v8[2] = sub_1F564;
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
      block[2] = sub_1F5EC;
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
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIFamilyProfileImageLayerConfig urlString](self, "urlString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v2));

  v4 = BSUIGetFamilyMemberImage(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (Class)layerClassForSize:(CGSize)a3
{
  return -[_BSUIFamilyProfileImageLayerConfig layerClass](self, "layerClass", a3.width, a3.height);
}

- (void)configureLayer:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_layer, a3);
  v5 = a3;
  objc_msgSend(v5, "setRasterizationScale:", self->_contentsScale);
  objc_msgSend(v5, "setContentsGravity:", kCAGravityResizeAspectFill);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[_BSUIFamilyProfileImageLayerConfig _generateImage](self, "_generateImage")));
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

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
  objc_storeStrong((id *)&self->_urlString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
