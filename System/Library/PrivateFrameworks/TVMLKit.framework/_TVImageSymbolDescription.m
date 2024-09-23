@implementation _TVImageSymbolDescription

- (_TVImageSymbolDescription)initWithSymbolName:(id)a3 imageSymbolConfiguration:(id)a4
{
  id v7;
  id v8;
  _TVImageSymbolDescription *v9;
  _TVImageSymbolDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TVImageSymbolDescription;
  v9 = -[_TVImageSymbolDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_symbolName, a3);
    objc_storeStrong((id *)&v10->_imageSymbolConfiguration, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _TVImageSymbolDescription *v4;
  void *v5;
  void *v6;
  _TVImageSymbolDescription *v7;

  v4 = +[_TVImageSymbolDescription allocWithZone:](_TVImageSymbolDescription, "allocWithZone:", a3);
  -[_TVImageSymbolDescription symbolName](self, "symbolName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVImageSymbolDescription imageSymbolConfiguration](self, "imageSymbolConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_TVImageSymbolDescription initWithSymbolName:imageSymbolConfiguration:](v4, "initWithSymbolName:imageSymbolConfiguration:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _TVImageSymbolDescription *v4;
  _TVImageSymbolDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v4 = (_TVImageSymbolDescription *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_TVImageSymbolDescription symbolName](self, "symbolName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVImageSymbolDescription symbolName](v5, "symbolName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v12 = 1;
      }
      else
      {
        -[_TVImageSymbolDescription symbolName](self, "symbolName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[_TVImageSymbolDescription symbolName](v5, "symbolName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            -[_TVImageSymbolDescription symbolName](self, "symbolName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[_TVImageSymbolDescription symbolName](v5, "symbolName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v10, "isEqualToString:", v11);

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

      }
      -[_TVImageSymbolDescription imageSymbolConfiguration](self, "imageSymbolConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVImageSymbolDescription imageSymbolConfiguration](v5, "imageSymbolConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
        v20 = 1;
      }
      else
      {
        -[_TVImageSymbolDescription imageSymbolConfiguration](self, "imageSymbolConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[_TVImageSymbolDescription imageSymbolConfiguration](v5, "imageSymbolConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[_TVImageSymbolDescription imageSymbolConfiguration](self, "imageSymbolConfiguration");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[_TVImageSymbolDescription imageSymbolConfiguration](v5, "imageSymbolConfiguration");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "isEqualToConfiguration:", v19);

          }
          else
          {
            v20 = 0;
          }

        }
        else
        {
          v20 = 0;
        }

      }
      v13 = v12 & v20;

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_TVImageSymbolDescription symbolName](self, "symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[_TVImageSymbolDescription imageSymbolConfiguration](self, "imageSymbolConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
