@implementation CuratedCollectionItemAppStoreAppClipViewModel

- (CuratedCollectionItemAppStoreAppClipViewModel)initWithAppStoreAppClip:(id)a3
{
  id v5;
  CuratedCollectionItemAppStoreAppClipViewModel *v6;
  CuratedCollectionItemAppStoreAppClipViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionItemAppStoreAppClipViewModel;
  v6 = -[CuratedCollectionItemAppStoreAppClipViewModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_appClip, a3);

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[GEOAppStoreAppClip hash](self->_appClip, "hash");
}

- (BOOL)isEqual:(id)a3
{
  CuratedCollectionItemAppStoreAppClipViewModel *v4;
  CuratedCollectionItemAppStoreAppClipViewModel *v5;
  uint64_t v6;
  GEOAppStoreAppClip *v7;
  GEOAppStoreAppClip *v8;
  unsigned __int8 v9;

  v4 = (CuratedCollectionItemAppStoreAppClipViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (GEOAppStoreAppClip *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionItemAppStoreAppClipViewModel appClip](v5, "appClip"));
    v8 = v7;
    if (v7 == self->_appClip)
      v9 = 1;
    else
      v9 = -[GEOAppStoreAppClip isEqual:](v7, "isEqual:");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)title
{
  return (NSString *)-[GEOAppStoreAppClip title](self->_appClip, "title");
}

- (NSString)subtitle
{
  NSString *subtitle;
  void *v4;
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  subtitle = self->_subtitle;
  if (!subtitle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAppStoreAppClip subtitle](self->_appClip, "subtitle"));
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("[Guides] App Clip button subtitle"), CFSTR("localized string not found"), 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAppStoreAppClip subtitle](self->_appClip, "subtitle"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));
      v10 = self->_subtitle;
      self->_subtitle = v9;

    }
    else
    {
      v6 = self->_subtitle;
      self->_subtitle = (NSString *)&stru_1011EB268;
    }

    subtitle = self->_subtitle;
  }
  return subtitle;
}

- (void)fetchAppClipIconWithSize:(CGSize)a3 scale:(double)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  double v15;
  CGFloat v16;
  CGFloat v17;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAppStoreAppClip artworkURL](self->_appClip, "artworkURL"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007ADDB0;
  v13[3] = &unk_1011C6C60;
  v15 = a4;
  v16 = width;
  v17 = height;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v10, "loadAppImageAtURL:completionHandler:", v11, v13);

}

- (GEOAppStoreAppClip)appClip
{
  return self->_appClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClip, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end
