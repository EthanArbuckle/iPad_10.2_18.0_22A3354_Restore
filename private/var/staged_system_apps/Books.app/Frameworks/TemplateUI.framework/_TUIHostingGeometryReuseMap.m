@implementation _TUIHostingGeometryReuseMap

- (_TUIHostingGeometryReuseMap)initWithMap:(id)a3 reuseTypes:(id)a4
{
  id v6;
  id v7;
  _TUIHostingGeometryReuseMap *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSSet *reuseIdentifiers;
  void *v13;
  id v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  id v17;
  NSDictionary *v18;
  NSDictionary *reuseMap;
  objc_super v21;
  void **v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSMutableDictionary *v27;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_TUIHostingGeometryReuseMap;
  v8 = -[_TUIHostingGeometryReuseMap init](&v21, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifiers"));
    v10 = v7;
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_DDD58;
    v25 = &unk_241460;
    v26 = v10;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectsPassingTest:", &v22));

    reuseIdentifiers = v8->_reuseIdentifiers;
    v8->_reuseIdentifiers = (NSSet *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "map"));
    v14 = v10;
    v15 = objc_opt_new(NSMutableDictionary);
    v22 = _NSConcreteStackBlock;
    v23 = 3221225472;
    v24 = sub_DDD9C;
    v25 = &unk_241488;
    v26 = v14;
    v16 = v15;
    v27 = v16;
    v17 = v14;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v22);
    if (-[NSMutableDictionary count](v16, "count"))
      v18 = (NSDictionary *)-[NSMutableDictionary copy](v16, "copy");
    else
      v18 = 0;

    reuseMap = v8->_reuseMap;
    v8->_reuseMap = v18;

  }
  return v8;
}

- (id)geometryForIdentifier:(id)a3 requestedSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _TUIHostingGeometryReuseKey *v8;
  void *v9;
  void *v10;
  _TUIHostingGeometryReuseKey *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = [_TUIHostingGeometryReuseKey alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  v11 = -[_TUIHostingGeometryReuseKey initWithType:identifier:requestedSize:](v8, "initWithType:identifier:requestedSize:", v9, v10, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_reuseMap, "objectForKeyedSubscript:", v11));

  return v12;
}

- (NSSet)reuseIdentifiers
{
  return self->_reuseIdentifiers;
}

- (NSDictionary)reuseMap
{
  return self->_reuseMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseMap, 0);
  objc_storeStrong((id *)&self->_reuseIdentifiers, 0);
}

@end
