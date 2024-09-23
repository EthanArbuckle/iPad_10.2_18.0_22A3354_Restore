@implementation TUIVisibilityChangeNode

- (TUIVisibilityChangeNode)initWithIdentifiers:(id)a3 added:(id)a4 removed:(id)a5 identifierNodeMap:(id)a6 attributesMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TUIVisibilityChangeNode *v17;
  NSSet *v18;
  NSSet *identifiers;
  NSSet *v20;
  NSSet *added;
  NSSet *v22;
  NSSet *removed;
  NSDictionary *v24;
  NSDictionary *identifierNodeMap;
  NSDictionary *v26;
  NSDictionary *attributesMap;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)TUIVisibilityChangeNode;
  v17 = -[TUIVisibilityChangeNode init](&v29, "init");
  if (v17)
  {
    v18 = (NSSet *)objc_msgSend(v12, "copy");
    identifiers = v17->_identifiers;
    v17->_identifiers = v18;

    v20 = (NSSet *)objc_msgSend(v13, "copy");
    added = v17->_added;
    v17->_added = v20;

    v22 = (NSSet *)objc_msgSend(v14, "copy");
    removed = v17->_removed;
    v17->_removed = v22;

    v24 = (NSDictionary *)objc_msgSend(v15, "copy");
    identifierNodeMap = v17->_identifierNodeMap;
    v17->_identifierNodeMap = v24;

    v26 = (NSDictionary *)objc_msgSend(v16, "copy");
    attributesMap = v17->_attributesMap;
    v17->_attributesMap = v26;

  }
  return v17;
}

- (id)newAdded
{
  id v3;
  NSDictionary *identifierNodeMap;
  id v5;
  TUIVisibilityChangeNode *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSDictionary count](self->_identifierNodeMap, "count"));
  identifierNodeMap = self->_identifierNodeMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1BF18;
  v8[3] = &unk_23DB68;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](identifierNodeMap, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = -[TUIVisibilityChangeNode initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:]([TUIVisibilityChangeNode alloc], "initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:", self->_identifiers, self->_identifiers, 0, v5, self->_attributesMap);

  return v6;
}

- (id)newRemoved
{
  id v3;
  NSDictionary *identifierNodeMap;
  id v5;
  TUIVisibilityChangeNode *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSDictionary count](self->_identifierNodeMap, "count"));
  identifierNodeMap = self->_identifierNodeMap;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1C044;
  v8[3] = &unk_23DB68;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](identifierNodeMap, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = -[TUIVisibilityChangeNode initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:]([TUIVisibilityChangeNode alloc], "initWithIdentifiers:added:removed:identifierNodeMap:attributesMap:", self->_identifiers, 0, self->_identifiers, v5, self->_attributesMap);

  return v6;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSSet)added
{
  return self->_added;
}

- (NSSet)removed
{
  return self->_removed;
}

- (NSDictionary)identifierNodeMap
{
  return self->_identifierNodeMap;
}

- (NSDictionary)attributesMap
{
  return self->_attributesMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesMap, 0);
  objc_storeStrong((id *)&self->_identifierNodeMap, 0);
  objc_storeStrong((id *)&self->_removed, 0);
  objc_storeStrong((id *)&self->_added, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
