@implementation CNContact

- (id)avatarImageWithSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CNContact *v15;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  if (+[CNContact _maps_addressBookAllowed](CNContact, "_maps_addressBookAllowed"))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v5, 0, width, height, a4));
    v11 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v15 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "avatarImageForContacts:scope:", v12, v10));

  }
  else
  {
    v10 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeholderImageProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageForSize:scale:", width, height, a4));
  }

  return v13;
}

- (CGImage)imageForCustomImageKey:(unint64_t)a3 suggestedSize:(CGSize)a4 contentScale:(float)a5
{
  id v5;
  CGImage *v6;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CNContact avatarImageWithSize:scale:rightToLeft:](self, "avatarImageWithSize:scale:rightToLeft:", 0, a4.width, a4.height, a5)));
  v6 = (CGImage *)objc_msgSend(v5, "CGImage");

  return v6;
}

+ (BOOL)_maps_addressBookAllowed
{
  return +[CNContactStore _maps_isAuthorized](CNContactStore, "_maps_isAuthorized");
}

- (BOOL)isMeCard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "meCard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact identifier](self, "identifier"));
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (void)_maps_imageForContactWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5
{
  id v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  double v13;

  v7 = a5;
  global_queue = dispatch_get_global_queue(17, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B4694C;
  block[3] = &unk_1011B2188;
  v13 = a3;
  block[4] = self;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, block);

}

+ (void)_maps_imageForNoContactWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5
{
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v6 = a5;
  global_queue = dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B46ABC;
  v10[3] = &unk_1011B6D60;
  v12 = a3;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

}

+ (void)_maps_imageForUnkonwnWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5
{
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v6 = a5;
  global_queue = dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B46C28;
  v10[3] = &unk_1011B6D60;
  v12 = a3;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, v10);

}

- (id)_maps_spokenNameForNavigation
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", self, 1));
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", self, 0));
  v5 = v4;

  return v5;
}

@end
