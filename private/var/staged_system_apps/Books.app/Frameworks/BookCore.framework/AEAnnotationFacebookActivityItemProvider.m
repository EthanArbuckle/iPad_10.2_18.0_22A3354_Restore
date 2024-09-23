@implementation AEAnnotationFacebookActivityItemProvider

- (id)supportedActivityTypes
{
  UIActivityType v3;

  v3 = UIActivityTypePostToFacebook;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (unint64_t)characterLimit
{
  return 63000;
}

- (id)expandedItemProviders
{
  void *v3;
  IMBlockActivityItemPlusThumbnailProvider *v4;
  void *v5;
  IMBlockActivityItemPlusThumbnailProvider *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  IMBlockActivityItemPlusThumbnailProvider *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_274F8;
  v18[3] = &unk_28C820;
  v18[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_2753C;
  v17[3] = &unk_28C848;
  v17[4] = self;
  v4 = -[IMBlockActivityItemPlusThumbnailProvider initWithUTI:resolutionBlock:thumbnailResolutionBlock:]([IMBlockActivityItemPlusThumbnailProvider alloc], "initWithUTI:resolutionBlock:thumbnailResolutionBlock:", CFSTR("public.plain-text"), v18, v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationFacebookActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
  -[IMBlockActivityItemProvider setSupportedActivityTypes:](v4, "setSupportedActivityTypes:", v5);

  objc_msgSend(v3, "addObject:", v4);
  v15[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_27578;
  v16[3] = &unk_28C820;
  v16[4] = self;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_27674;
  v15[3] = &unk_28C848;
  v6 = -[IMBlockActivityItemPlusThumbnailProvider initWithUTI:resolutionBlock:thumbnailResolutionBlock:]([IMBlockActivityItemPlusThumbnailProvider alloc], "initWithUTI:resolutionBlock:thumbnailResolutionBlock:", CFSTR("public.html"), v16, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationFacebookActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
  -[IMBlockActivityItemProvider setSupportedActivityTypes:](v6, "setSupportedActivityTypes:", v7);

  objc_msgSend(v3, "addObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
  v9 = objc_msgSend(v8, "isStoreAsset");

  if (v9)
  {
    v13[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_276B0;
    v14[3] = &unk_28C820;
    v14[4] = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_276EC;
    v13[3] = &unk_28C848;
    v10 = -[IMBlockActivityItemPlusThumbnailProvider initWithUTI:resolutionBlock:thumbnailResolutionBlock:]([IMBlockActivityItemPlusThumbnailProvider alloc], "initWithUTI:resolutionBlock:thumbnailResolutionBlock:", CFSTR("public.url"), v14, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationFacebookActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
    -[IMBlockActivityItemProvider setSupportedActivityTypes:](v10, "setSupportedActivityTypes:", v11);

    objc_msgSend(v3, "addObject:", v10);
  }

  return v3;
}

@end
