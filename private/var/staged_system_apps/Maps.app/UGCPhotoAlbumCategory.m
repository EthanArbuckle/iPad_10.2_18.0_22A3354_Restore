@implementation UGCPhotoAlbumCategory

- (UGCPhotoAlbumCategory)initWithTitle:(id)a3 categoryType:(unint64_t)a4
{
  id v7;
  UGCPhotoAlbumCategory *v8;
  UGCPhotoAlbumCategory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCPhotoAlbumCategory;
  v8 = -[UGCPhotoAlbumCategory init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_albumTitle, a3);
    v9->_categoryType = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  id v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_opt_class(UGCPhotoAlbumCategory);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "albumTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPhotoAlbumCategory albumTitle](self, "albumTitle"));
    v9 = v7;
    v10 = v8;
    if (v9 | v10
      && (v11 = objc_msgSend((id)v9, "isEqual:", v10), (id)v10, (id)v9, !v11))
    {
      v13 = 0;
    }
    else
    {
      v12 = objc_msgSend(v6, "categoryType");
      v13 = v12 == (id)-[UGCPhotoAlbumCategory categoryType](self, "categoryType");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumTitle, 0);
}

@end
