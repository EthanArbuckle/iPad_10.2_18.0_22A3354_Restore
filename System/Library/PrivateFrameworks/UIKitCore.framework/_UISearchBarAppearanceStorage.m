@implementation _UISearchBarAppearanceStorage

- (void)setSearchFieldBackgroundImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *searchFieldBackgroundImages;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v6 = a3;
  searchFieldBackgroundImages = self->searchFieldBackgroundImages;
  v11 = v6;
  if (v6)
  {
    if (!searchFieldBackgroundImages)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->searchFieldBackgroundImages;
      self->searchFieldBackgroundImages = v8;

      searchFieldBackgroundImages = self->searchFieldBackgroundImages;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](searchFieldBackgroundImages, "setObject:forKey:", v11, v10);
    goto LABEL_7;
  }
  if (searchFieldBackgroundImages)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](searchFieldBackgroundImages, "removeObjectForKey:", v10);
LABEL_7:

  }
}

- (id)searchFieldBackgroundImageForState:(unint64_t)a3
{
  NSMutableDictionary *searchFieldBackgroundImages;
  void *v4;
  void *v5;

  searchFieldBackgroundImages = self->searchFieldBackgroundImages;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](searchFieldBackgroundImages, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setImage:(id)a3 forIcon:(int64_t)a4 state:(unint64_t)a5
{
  id v8;
  NSMutableDictionary *iconImages;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  id v14;

  v8 = a3;
  iconImages = self->iconImages;
  v14 = v8;
  if (v8)
  {
    if (!iconImages)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = self->iconImages;
      self->iconImages = v10;

    }
  }
  else if (!iconImages)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5 + 100 * a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->iconImages;
  if (v14)
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, v12);
  else
    -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v12);

LABEL_9:
}

- (id)imageForIcon:(int64_t)a3 state:(unint64_t)a4
{
  NSMutableDictionary *iconImages;
  int64_t v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  iconImages = self->iconImages;
  v7 = 100 * a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 100 * a3 + a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](iconImages, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1 && !v9)
  {
    v10 = self->iconImages;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v10, "objectForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSValue)searchFieldPositionAdjustment
{
  return self->searchFieldPositionAdjustment;
}

- (void)setSearchFieldPositionAdjustment:(id)a3
{
  objc_storeStrong((id *)&self->searchFieldPositionAdjustment, a3);
}

- (UIImage)separatorImage
{
  return self->separatorImage;
}

- (void)setSeparatorImage:(id)a3
{
  objc_storeStrong((id *)&self->separatorImage, a3);
}

- (UIImage)scopeBarBackgroundImage
{
  return self->scopeBarBackgroundImage;
}

- (void)setScopeBarBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->scopeBarBackgroundImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->scopeBarBackgroundImage, 0);
  objc_storeStrong((id *)&self->separatorImage, 0);
  objc_storeStrong((id *)&self->iconImages, 0);
  objc_storeStrong((id *)&self->searchFieldPositionAdjustment, 0);
  objc_storeStrong((id *)&self->searchFieldBackgroundImages, 0);
}

@end
