@implementation HomeResultCache

- (HomeResultCache)init
{
  HomeResultCache *v2;
  uint64_t UInteger;
  uint64_t v4;
  NSMutableArray *keys;
  uint64_t v6;
  NSMutableArray *values;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HomeResultCache;
  v2 = -[HomeResultCache init](&v9, "init");
  if (v2)
  {
    UInteger = GEOConfigGetUInteger(MapsConfig_MapsHomeResultCacheCapacity, off_1014B3E98);
    v2->_capacity = UInteger;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", UInteger));
    keys = v2->_keys;
    v2->_keys = (NSMutableArray *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v2->_capacity));
    values = v2->_values;
    v2->_values = (NSMutableArray *)v6;

  }
  return v2;
}

- (id)resultForKey:(id)a3
{
  id v4;
  NSMutableArray *keys;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  keys = self->_keys;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10047B314;
  v12[3] = &unk_1011B7D30;
  v6 = v4;
  v13 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](keys, "indexOfObjectPassingTest:", v12);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_values, "objectAtIndexedSubscript:", v7));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_keys, "objectAtIndexedSubscript:", v9));
      -[NSMutableArray removeObjectAtIndex:](self->_keys, "removeObjectAtIndex:", v9);
      -[NSMutableArray removeObjectAtIndex:](self->_values, "removeObjectAtIndex:", v9);
      -[NSMutableArray insertObject:atIndex:](self->_keys, "insertObject:atIndex:", v10, 0);
      -[NSMutableArray insertObject:atIndex:](self->_values, "insertObject:atIndex:", v8, 0);

    }
  }

  return v8;
}

- (void)setResult:(id)a3 forKey:(id)a4
{
  id v6;

  v6 = a3;
  if (v6 && a4)
  {
    -[NSMutableArray insertObject:atIndex:](self->_keys, "insertObject:atIndex:", a4, 0);
    -[NSMutableArray insertObject:atIndex:](self->_values, "insertObject:atIndex:", v6, 0);
    while ((unint64_t)-[NSMutableArray count](self->_keys, "count") > self->_capacity)
    {
      -[NSMutableArray removeLastObject](self->_keys, "removeLastObject");
      -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
