@implementation POXSDefinition

- (POXSDefinition)init
{
  POXSDefinition *v2;
  uint64_t v3;
  NSMutableDictionary *types;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)POXSDefinition;
  v2 = -[POXSDefinition init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    types = v2->_types;
    v2->_types = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_types, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)types
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_types, "allValues");
}

- (Class)typeForName:(id)a3
{
  return (Class)-[NSMutableDictionary objectForKeyedSubscript:](self->_types, "objectForKeyedSubscript:", a3);
}

- (id)propertyForName:(id)a3
{
  return a3;
}

- (unint64_t)maxCountForElementName:(id)a3
{
  return 1;
}

- (id)isSpecifiedKeyForAttributeName:(id)a3
{
  return 0;
}

- (id)isSpecifiedKeyForElementName:(id)a3
{
  return 0;
}

- (id)namespaceForAttributeName:(id)a3
{
  return 0;
}

- (BOOL)flattenMultiValueElementWithName:(id)a3
{
  return 0;
}

- (void)setType:(Class)a3 forName:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_types, "setObject:forKeyedSubscript:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
}

@end
