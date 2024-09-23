@implementation TUIImageResourceCacheKey

- (TUIImageResourceCacheKey)initWithID:(id)a3
{
  id v5;
  TUIImageResourceCacheKey *v6;
  TUIImageResourceCacheKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIImageResourceCacheKey;
  v6 = -[TUIImageResourceCacheKey init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_id, a3);

  return v7;
}

- (TUIImageResourceCacheKey)initWithURL:(id)a3
{
  id v4;
  TUIImageResourceCacheKey *v5;
  void *v6;
  uint64_t v7;
  NSString *id;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIImageResourceCacheKey;
  v5 = -[TUIImageResourceCacheKey init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "standardizedURL"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
    id = v5->_id;
    v5->_id = (NSString *)v7;

  }
  return v5;
}

- (TUIImageResourceCacheKey)initWithChildren:(id)a3
{
  id v5;
  TUIImageResourceCacheKey *v6;
  TUIImageResourceCacheKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIImageResourceCacheKey;
  v6 = -[TUIImageResourceCacheKey init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_children, a3);

  return v7;
}

- (TUIImageResourceCacheKey)cacheKeyWithSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  void *v6;

  height = a3.height;
  width = a3.width;
  v5 = -[TUIImageResourceCacheKey copy](self, "copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithSize:](NSValue, "valueWithSize:", width, height));
  objc_msgSend(v5, "setSize:", v6);

  return (TUIImageResourceCacheKey *)v5;
}

- (TUIImageResourceCacheKey)cacheKeyWithColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[TUIImageResourceCacheKey copy](self, "copy");
  objc_msgSend(v5, "setColor:", v4);

  return (TUIImageResourceCacheKey *)v5;
}

- (TUIImageResourceCacheKey)cacheKeyWithFilterInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[TUIImageResourceCacheKey copy](self, "copy");
  objc_msgSend(v5, "setFilterInfo:", v4);

  return (TUIImageResourceCacheKey *)v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;

  v7 = a3;
  v8 = objc_opt_class(TUIImageResourceCacheKey);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey id](self, "id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "id"));
    if (v9 != v10)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey id](self, "id"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "id"));
      if (!objc_msgSend(v37, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_29;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey size](self, "size"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "size"));
    if (v12 != v13)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey size](self, "size"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "size"));
      if (!objc_msgSend(v5, "isEqual:", v3))
      {
        v11 = 0;
LABEL_27:

LABEL_28:
        if (v9 == v10)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v14 = objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey color](self, "color"));
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
    v36 = (void *)v14;
    if (v14 == v35)
    {
      v32 = v3;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey color](self, "color"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "color"));
      v34 = v15;
      if (!objc_msgSend(v15, "isEqual:"))
      {
        v11 = 0;
        v19 = (void *)v35;
        v18 = v36;
LABEL_25:

LABEL_26:
        if (v12 == v13)
          goto LABEL_28;
        goto LABEL_27;
      }
      v32 = v3;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey filterInfo](self, "filterInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filterInfo"));
    if (v16 == v17)
    {
      v29 = v5;
      v30 = v13;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey filterInfo](self, "filterInfo"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filterInfo"));
      if (!objc_msgSend(v4, "isEqual:"))
      {
        v11 = 0;
        goto LABEL_23;
      }
      v29 = v5;
      v30 = v13;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey children](self, "children"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children"));
    if (v20 == (void *)v21)
    {

      v11 = 1;
    }
    else
    {
      v22 = (void *)v21;
      v27 = v4;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey children](self, "children"));
      v28 = v12;
      v24 = v16;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children"));
      v11 = objc_msgSend(v23, "isEqual:", v25);

      v16 = v24;
      v12 = v28;

      v4 = v27;
    }
    v5 = v29;
    v13 = v30;
    if (v16 == v17)
    {
LABEL_24:

      v19 = (void *)v35;
      v18 = v36;
      v3 = v32;
      if (v36 == (void *)v35)
        goto LABEL_26;
      goto LABEL_25;
    }
LABEL_23:

    goto LABEL_24;
  }
  v11 = 0;
LABEL_31:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = -[NSString hash](self->_id, "hash");
  v4 = (unint64_t)-[NSValue hash](self->_size, "hash") ^ v3;
  v5 = (unint64_t)-[UIColor hash](self->_color, "hash");
  v6 = v4 ^ v5 ^ -[_TUICachedImageFilterInfo hash](self->_filterInfo, "hash");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_children;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v6 ^= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), "hash", (_QWORD)v13);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUIImageResourceCacheKey *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(TUIImageResourceCacheKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey id](self, "id"));
  -[TUIImageResourceCacheKey setId:](v4, "setId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey size](self, "size"));
  -[TUIImageResourceCacheKey setSize:](v4, "setSize:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey color](self, "color"));
  -[TUIImageResourceCacheKey setColor:](v4, "setColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey filterInfo](self, "filterInfo"));
  -[TUIImageResourceCacheKey setFilterInfo:](v4, "setFilterInfo:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImageResourceCacheKey children](self, "children"));
  -[TUIImageResourceCacheKey setChildren:](v4, "setChildren:", v9);

  return v4;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSValue)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (_TUICachedImageFilterInfo)filterInfo
{
  return self->_filterInfo;
}

- (void)setFilterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_filterInfo, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_filterInfo, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
