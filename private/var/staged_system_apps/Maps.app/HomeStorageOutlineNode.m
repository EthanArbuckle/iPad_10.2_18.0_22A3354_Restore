@implementation HomeStorageOutlineNode

- (HomeStorageOutlineNode)initWithExpandedValue:(id)a3 children:(id)a4
{
  id v7;
  id v8;
  HomeStorageOutlineNode *v9;
  HomeStorageOutlineNode *v10;
  uint64_t v11;
  NSDictionary *children;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HomeStorageOutlineNode;
  v9 = -[HomeStorageOutlineNode init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_expandedValue, a3);
    v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));
    children = v10->_children;
    v10->_children = (NSDictionary *)v11;

  }
  return v10;
}

- (HomeStorageOutlineNode)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  HomeStorageOutlineNode *v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expanded")));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("children")));
  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A6AF48;
  v16[3] = &unk_1011BA738;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v12, "count")));
  v13 = v17;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);

  v14 = -[HomeStorageOutlineNode initWithExpandedValue:children:](self, "initWithExpandedValue:children:", v8, v13);
  return v14;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSNumber *expandedValue;
  void *v6;
  NSDictionary *children;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  expandedValue = self->_expandedValue;
  if (expandedValue)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", expandedValue, CFSTR("expanded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  children = self->_children;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100A6B0BC;
  v12[3] = &unk_1011E0DD8;
  v8 = v6;
  v13 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](children, "enumerateKeysAndObjectsUsingBlock:", v12);
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v8, "copy");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("children"));

  }
  v10 = objc_msgSend(v4, "copy");

  return (NSDictionary *)v10;
}

- (NSNumber)expandedValue
{
  return self->_expandedValue;
}

- (NSDictionary)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_expandedValue, 0);
}

@end
