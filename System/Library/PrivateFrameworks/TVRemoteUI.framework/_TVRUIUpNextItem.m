@implementation _TVRUIUpNextItem

- (_TVRUIUpNextItem)initWithUpNextInfo:(id)a3
{
  id v5;
  _TVRUIUpNextItem *v6;
  _TVRUIUpNextItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVRUIUpNextItem;
  v6 = -[_TVRUIUpNextItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_upNextInfo, a3);
    v7->_isMoreItem = v5 == 0;
  }

  return v7;
}

+ (id)itemWithUpNextInfo:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUpNextInfo:", v4);

  return v5;
}

+ (id)moreItem
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithUpNextInfo:", 0);
}

- (unint64_t)hash
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  if (-[_TVRUIUpNextItem isMoreItem](self, "isMoreItem"))
    return 1;
  -[_TVRUIUpNextItem upNextInfo](self, "upNextInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[_TVRUIUpNextItem isMoreItem](self, "isMoreItem") && (objc_msgSend(v6, "isMoreItem") & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        -[_TVRUIUpNextItem upNextInfo](self, "upNextInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mediaInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "upNextInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "mediaInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v10, "isEqualToString:", v13);

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TVRCUpNextInfo)upNextInfo
{
  return self->_upNextInfo;
}

- (BOOL)isMoreItem
{
  return self->_isMoreItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upNextInfo, 0);
}

@end
