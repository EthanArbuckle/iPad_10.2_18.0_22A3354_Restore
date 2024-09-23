@implementation BKAnchorPathLocation

- (BKAnchorPathLocation)initWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BKAnchorPathLocation *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLFragmentString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByRemovingURLFragment"));

  v7 = -[BKAnchorPathLocation initWithOrdinal:anchor:andPath:](self, "initWithOrdinal:anchor:andPath:", -1, v5, v6);
  return v7;
}

- (BKAnchorPathLocation)initWithOrdinal:(int64_t)a3 anchor:(id)a4 andPath:(id)a5
{
  id v8;
  BKAnchorPathLocation *v9;
  NSString *v10;
  NSString *path;
  objc_super v13;

  v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BKAnchorPathLocation;
  v9 = -[BKAnchorLocation initWithOrdinal:andAnchor:](&v13, "initWithOrdinal:andAnchor:", a3, a4);
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    path = v9->_path;
    v9->_path = v10;

  }
  return v9;
}

- (BKAnchorPathLocation)initWithCoder:(id)a3
{
  id v4;
  BKAnchorPathLocation *v5;
  double v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *path;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKAnchorPathLocation;
  v5 = -[BKAnchorLocation initWithCoder:](&v12, "initWithCoder:", v4);
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(NSString).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("path"), v6));
    v9 = (NSString *)objc_msgSend(v8, "copy");
    path = v5->_path;
    v5->_path = v9;

  }
  return v5;
}

- (BKAnchorPathLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKAnchorPathLocation *v6;
  void *v7;
  NSString *v8;
  NSString *path;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v11.receiver = self;
  v11.super_class = (Class)BKAnchorPathLocation;
  v6 = -[BKAnchorLocation initWithLocationDictionary:](&v11, "initWithLocationDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("path")));
    v8 = (NSString *)objc_msgSend(v7, "copy");
    path = v6->_path;
    v6->_path = v8;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class(BKAnchorPathLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)BKAnchorPathLocation,
        -[BKAnchorLocation isEqual:](&v10, "isEqual:", v4)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorPathLocation path](self, "path"));
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAnchorPathLocation;
  v3 = -[BKAnchorLocation hash](&v5, "hash");
  return -[NSString hash](self->_path, "hash") ^ v3;
}

- (id)stringValue
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAnchorPathLocation;
  v3 = -[BKAnchorLocation stringValue](&v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, path:%@ }"), v4, self->_path));

  return v5;
}

- (id)description
{
  NSString *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKAnchorPathLocation;
  v3 = -[BKAnchorLocation description](&v7, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, _path:%@"), v4, self->_path));

  return v5;
}

- (id)pathWithAnchor
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorPathLocation path](self, "path"));
  v4 = objc_msgSend(v3, "mutableCopy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorLocation anchor](self, "anchor"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorLocation anchor](self, "anchor"));
    objc_msgSend(v4, "appendFormat:", CFSTR("#%@"), v7);

  }
  v8 = objc_msgSend(v4, "copy");

  return v8;
}

- (void)updateOrdinalForBookInfo:(id)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "documentWithOrdinal:", -[BKLocation ordinal](self, "ordinal")));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[BKAnchorPathLocation path](self, "path"));
  v6 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v5, &stru_1C3088);

  if (!v4
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "manifestId")),
        v8 = objc_msgSend(v7, "isEqualToString:", v6),
        v7,
        (v8 & 1) == 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "databaseKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND manifestId == %@"), v9, v6));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "managedObjectContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKDocument"), v10, 0, 1, 1));

    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "documentOrdinal"));
      -[BKLocation setOrdinal:](self, "setOrdinal:", objc_msgSend(v14, "integerValue"));

      v4 = v13;
    }

  }
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKAnchorPathLocation;
  v3 = -[BKAnchorLocation serializeLocationToDictionary](&v8, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAnchorPathLocation path](self, "path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("super"), v5, CFSTR("path"), CFSTR("BKAnchorPathLocation"), CFSTR("class"), 0));

  return v6;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKAnchorPathLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKAnchorPathLocation")))
    v5 = -[BKAnchorPathLocation initWithLocationDictionary:]([BKAnchorPathLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (NSString)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
