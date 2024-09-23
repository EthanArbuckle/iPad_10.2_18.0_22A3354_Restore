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

@end
