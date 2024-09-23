@implementation POSOAPFaultDetail

- (POSOAPFaultDetail)init
{
  POSOAPFaultDetail *v2;
  uint64_t v3;
  NSMutableDictionary *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)POSOAPFaultDetail;
  v2 = -[POSOAPFaultDetail init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)valueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_items, "objectForKeyedSubscript:", a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_items, "setObject:forKeyedSubscript:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
