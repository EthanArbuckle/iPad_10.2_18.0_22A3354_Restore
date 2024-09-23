@implementation BKHistoryEntity

- (BKHistoryEntity)init
{
  BKHistoryEntity *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pagination;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKHistoryEntity;
  v2 = -[BKHistoryEntity init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pagination = v2->_pagination;
    v2->_pagination = v3;

  }
  return v2;
}

- (int64_t)pageForLookupKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKHistoryEntity pagination](self, "pagination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
    v7 = (int)objc_msgSend(v6, "intValue");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (void)setPage:(int64_t)a3 forLookupKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = objc_msgSend(v9, "length");
  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL && v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKHistoryEntity pagination](self, "pagination"));
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKHistoryEntity pagination](self, "pagination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  *(_QWORD *)&v6 = objc_opt_class(self).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKHistoryEntity location](self, "location", v6));
  *(_QWORD *)&v10 = objc_opt_class(v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKHistoryEntity location](self, "location", v10));
  v14 = objc_msgSend(v13, "ordinal");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKHistoryEntity pagination](self, "pagination"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>(Location: %@ {Ordinal: %d}-- Pagination Keys: %d -- {Last Page Value: %@})"), v8, self, v12, v14, objc_msgSend(v15, "count"), v5));

  return v16;
}

- (BKLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSMutableDictionary)pagination
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
  objc_storeStrong((id *)&self->_pageTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_pagination, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
