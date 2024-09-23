@implementation TUIHostingGeometryMap

- (TUIHostingGeometryMap)initWithMap:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  TUIHostingGeometryMap *v8;
  NSDictionary *v9;
  NSDictionary *map;
  NSSet *v11;
  NSSet *identifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIHostingGeometryMap;
  v8 = -[TUIHostingGeometryMap init](&v14, "init");
  if (v8)
  {
    v9 = (NSDictionary *)objc_msgSend(v6, "copy");
    map = v8->_map;
    v8->_map = v9;

    v11 = (NSSet *)objc_msgSend(v7, "copy");
    identifiers = v8->_identifiers;
    v8->_identifiers = v11;

  }
  return v8;
}

- (id)geometryForIdentifier:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", a3);
}

- (id)identifierEnumerator
{
  return -[NSDictionary keyEnumerator](self->_map, "keyEnumerator");
}

- (id)computeDifferencesWithMap:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *map;
  NSMutableSet *v10;
  id v11;
  id v12;
  void *v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  NSMutableSet *v20;

  v4 = a3;
  v5 = objc_opt_new(NSMutableSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "map"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v7));

  map = self->_map;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_C86B0;
  v17[3] = &unk_241108;
  v18 = v4;
  v19 = v8;
  v10 = v5;
  v20 = v10;
  v11 = v8;
  v12 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](map, "enumerateKeysAndObjectsUsingBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
  -[NSMutableSet addObjectsFromArray:](v10, "addObjectsFromArray:", v13);

  v14 = v20;
  v15 = v10;

  return v15;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p map=%@>"), v5, self, self->_map));

  return v6;
}

- (NSDictionary)map
{
  return self->_map;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_map, 0);
}

@end
