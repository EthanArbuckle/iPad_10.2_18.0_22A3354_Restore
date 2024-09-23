@implementation MTItemListManifest

- (void)setItems:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_items, a3);
  if (objc_msgSend(v9, "count"))
  {
    v5 = -[MTItemListManifest currentIndex](self, "currentIndex");
    if (v5 < objc_msgSend(v9, "count"))
      goto LABEL_6;
    v6 = 0;
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[MTItemListManifest setCurrentIndex:](self, "setCurrentIndex:", v6);
LABEL_6:
  if (objc_msgSend(v9, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v7));
      objc_msgSend(v8, "setManifestIndex:", v7);

      ++v7;
    }
    while ((unint64_t)objc_msgSend(v9, "count") > v7);
  }
  -[MTItemListManifest postManifestDidChangeNotification](self, "postManifestDidChangeNotification");

}

- (MTItemListManifest)initWithItems:(id)a3
{
  id v4;
  MTItemListManifest *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  unsigned __int8 v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTItemListManifest;
  v5 = -[MTPlayerManifest init](&v12, "init");
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000B14C0;
    v10[3] = &unk_1004A9518;
    v11 = +[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_filterUsingTest:", v10));
    -[MTItemListManifest setItems:](v5, "setItems:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](v5, "items"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
      -[MTItemListManifest setCurrentIndex:](v5, "setCurrentIndex:", 0);
    -[MTItemListManifest setIsLoaded:](v5, "setIsLoaded:", 1);
  }

  return v5;
}

- (unint64_t)count
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](self, "items"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSArray)items
{
  return self->_items;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTItemListManifest items](self, "items"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a3));

  objc_msgSend(v6, "setManifest:", self);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
