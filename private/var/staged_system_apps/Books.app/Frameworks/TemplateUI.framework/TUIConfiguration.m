@implementation TUIConfiguration

- (TUIConfiguration)initWithData:(id)a3
{
  id v4;
  TUIConfiguration *v5;
  NSDictionary *v6;
  NSDictionary *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIConfiguration;
  v5 = -[TUIConfiguration init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    data = v5->_data;
    v5->_data = v6;

  }
  return v5;
}

- (id)sectionForKey:(id)a3
{
  void *v3;
  TUIConfiguration *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3));
  if (v3)
    v4 = -[TUIConfiguration initWithData:]([TUIConfiguration alloc], "initWithData:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)colorForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (id)fontSpecForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (id)dataForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (double)floatForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int64_t)integerForKey:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3));
  v4 = objc_msgSend(v3, "integerValue");

  return (int64_t)v4;
}

- (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)stringForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (CGSize)sizeForKey:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat width;
  double v7;
  CGFloat height;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "CGSizeValue");
    width = v5;
    height = v7;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIEdgeInsets)insetsForKey:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat top;
  double v7;
  CGFloat left;
  double v9;
  CGFloat bottom;
  double v11;
  CGFloat right;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "UIEdgeInsetsValue");
    top = v5;
    left = v7;
    bottom = v9;
    right = v11;
  }
  else
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }

  v13 = top;
  v14 = left;
  v15 = bottom;
  v16 = right;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)boxForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (id)snapForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (id)dictionaryForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
