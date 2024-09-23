@implementation BrowseCategory

- (BrowseCategory)initWithCategory:(id)a3
{
  id v5;
  BrowseCategory *v6;
  BrowseCategory *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  BrowseCategory *v14;
  uint64_t v15;
  NSArray *subCategories;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BrowseCategory;
  v6 = -[BrowseCategory init](&v22, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    v8 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory subcategories](v7->_category, "subcategories", 0));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = -[BrowseCategory initWithCategory:]([BrowseCategory alloc], "initWithCategory:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13));
          objc_msgSend(v8, "addObject:", v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v8));
    subCategories = v7->_subCategories;
    v7->_subCategories = (NSArray *)v15;

  }
  return v7;
}

- (void)imageWithResultHandler:(id)a3
{
  -[BrowseCategory imageWithScale:isCarplay:resultHandler:](self, "imageWithScale:isCarplay:resultHandler:", 0, a3, 0.0);
}

- (void)imageWithScale:(double)a3 isCarplay:(BOOL)a4 resultHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[BrowseManager sharedManager](BrowseManager, "sharedManager"));
  objc_msgSend(v9, "imageForCategory:scale:isCarplay:resultHandler:", self, v5, v8, a3);

}

- (NSString)name
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[GEOSearchCategory displayString](self->_category, "displayString"));
  v3 = v2;
  if (!v2)
    v2 = &stru_1011EB268;
  v4 = v2;

  return v4;
}

- (NSString)alternativeName
{
  return (NSString *)-[GEOSearchCategory shortDisplayString](self->_category, "shortDisplayString");
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseCategory name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseCategory subCategories](self, "subCategories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: name='%@' children=%d>"), v3, self, v4, objc_msgSend(v5, "count")));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BrowseCategory *v4;
  uint64_t v5;
  BrowseCategory *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = (BrowseCategory *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    v5 = objc_opt_class(BrowseCategory);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseCategory category](self, "category"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseCategory category](v6, "category"));

      v9 = objc_msgSend(v7, "isEqual:", v8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseCategory category](self, "category"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSArray)subCategories
{
  return self->_subCategories;
}

- (GEOSearchCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subCategories, 0);
}

@end
