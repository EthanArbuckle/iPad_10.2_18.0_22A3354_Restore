@implementation PRUpdatingSessionInfo

- (id)_initWithInfo:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PRUpdatingSessionInfo;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (NSString)identifier
{
  return (NSString *)-[PRSPosterUpdateSessionInfo identifier](self->_info, "identifier");
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[PRSPosterUpdateSessionInfo userInfo](self->_info, "userInfo");
}

- (id)shortcutsWallpaperConfiguration
{
  return (id)-[PRSPosterUpdateSessionInfo shortcutsWallpaperConfiguration](self->_info, "shortcutsWallpaperConfiguration");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
