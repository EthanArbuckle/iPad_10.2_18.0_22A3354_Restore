@implementation NIRegionKey

- (NIRegionKey)initWithName:(id)a3 regionSizeCategory:(int64_t)a4
{
  id v7;
  NIRegionKey *v8;
  NIRegionKey *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NIRegionKey;
  v8 = -[NIRegionKey init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_regionName, a3);
    v9->_regionSizeCategory = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithName:regionSizeCategory:", self->_regionName, self->_regionSizeCategory);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NIRegionKey *v7;
  NIRegionKey *v8;
  void *regionSizeCategory;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (NIRegionKey *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v11 = 1;
    }
    else
    {
      regionSizeCategory = (void *)self->_regionSizeCategory;
      if (regionSizeCategory == (void *)-[NIRegionKey regionSizeCategory](v7, "regionSizeCategory"))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[NIRegionKey regionName](v8, "regionName"));
        v11 = objc_msgSend(v10, "isEqualToString:", self->_regionName);

      }
      else
      {
        v11 = 0;
      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t regionSizeCategory;

  regionSizeCategory = self->_regionSizeCategory;
  return -[NSString hash](self->_regionName, "hash") ^ regionSizeCategory;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *regionName;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  regionName = self->_regionName;
  v7 = sub_100268EE4(self->_regionSizeCategory);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@: name:%@ regionCategory:%@)"), v5, regionName, v8));

  return v9;
}

- (NSString)regionName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)regionSizeCategory
{
  return self->_regionSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionName, 0);
}

@end
