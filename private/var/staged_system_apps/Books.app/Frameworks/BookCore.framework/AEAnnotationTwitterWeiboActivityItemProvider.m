@implementation AEAnnotationTwitterWeiboActivityItemProvider

- (id)supportedActivityTypes
{
  _QWORD v3[2];

  v3[0] = UIActivityTypePostToTwitter;
  v3[1] = UIActivityTypePostToWeibo;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
}

- (unint64_t)characterLimit
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v4 = objc_msgSend(v3, "isStoreAsset");

  if (!v4)
    return 138;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeShortURL"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeShortURL"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "absoluteString"));

  }
  else
  {
    v9 = &stru_296430;
  }

  v11 = IMCommonCoreBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@ %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", v13, &stru_296430, v9);
  v15 = objc_msgSend(v14, "length");
  v16 = -[__CFString length](v9, "length");
  v17 = 138;
  if (!v16)
    v17 = 113;
  v10 = v17 - (_QWORD)v15;

  return v10;
}

- (id)text
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AEAnnotationTwitterWeiboActivityItemProvider;
  v3 = -[AEAnnotationSocialActivityItemProvider text](&v17, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v6 = objc_msgSend(v5, "isStoreAsset");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storeShortURL"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storeShortURL"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteString"));

    }
    else
    {
      v11 = &stru_296430;
    }

    v12 = IMCommonCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@ %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v4, v11));
    v4 = (void *)v15;
  }
  return v4;
}

- (id)expandedItemProviders
{
  void *v3;
  void *v4;
  IMBlockActivityItemPlusThumbnailProvider *v5;
  void *v6;
  unsigned int v7;
  IMBlockActivityItemPlusThumbnailProvider *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationTwitterWeiboActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_27BA8;
  v13[3] = &unk_28C820;
  v13[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_27BB0;
  v12[3] = &unk_28C848;
  v5 = -[IMBlockActivityItemPlusThumbnailProvider initWithUTI:resolutionBlock:thumbnailResolutionBlock:]([IMBlockActivityItemPlusThumbnailProvider alloc], "initWithUTI:resolutionBlock:thumbnailResolutionBlock:", CFSTR("public.plain-text"), v13, v12);
  -[IMBlockActivityItemProvider setSupportedActivityTypes:](v5, "setSupportedActivityTypes:", v3);
  objc_msgSend(v4, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v7 = objc_msgSend(v6, "isStoreAsset");

  if (v7)
  {
    v10[4] = self;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_27BEC;
    v11[3] = &unk_28C820;
    v11[4] = self;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_27C64;
    v10[3] = &unk_28C848;
    v8 = -[IMBlockActivityItemPlusThumbnailProvider initWithUTI:resolutionBlock:thumbnailResolutionBlock:]([IMBlockActivityItemPlusThumbnailProvider alloc], "initWithUTI:resolutionBlock:thumbnailResolutionBlock:", CFSTR("public.url"), v11, v10);
    -[IMBlockActivityItemProvider setSupportedActivityTypes:](v8, "setSupportedActivityTypes:", v3);
    objc_msgSend(v4, "addObject:", v8);

  }
  return v4;
}

@end
