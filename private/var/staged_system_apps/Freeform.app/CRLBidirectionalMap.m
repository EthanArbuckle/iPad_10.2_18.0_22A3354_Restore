@implementation CRLBidirectionalMap

- (CRLBidirectionalMap)init
{
  CRLBidirectionalMap *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *forward;
  NSMutableDictionary *v5;
  NSMutableDictionary *backward;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLBidirectionalMap;
  v2 = -[CRLBidirectionalMap init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    forward = v2->_forward;
    v2->_forward = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    backward = v2->_backward;
    v2->_backward = v5;

  }
  return v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_forward, "objectForKeyedSubscript:", v4));
  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_backward, "objectForKeyedSubscript:", v4));

  return v5;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_forward, "objectForKeyedSubscript:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_backward, "objectForKeyedSubscript:", v6));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_forward, "objectForKeyedSubscript:", v8));
    if (v9)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_forward, "setObject:forKeyedSubscript:", 0, v8);
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_forward, "setObject:forKeyedSubscript:", v6, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backward, "setObject:forKeyedSubscript:");

  }
  else
  {
    if (v7)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backward, "setObject:forKeyedSubscript:", 0, v7);
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backward, "setObject:forKeyedSubscript:", v6, v10);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_forward, "setObject:forKeyedSubscript:");
  }

}

- (id)allKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_forward, "allKeys"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_backward, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));
  v6 = v5;
  if (!v5)
    v5 = &__NSArray0__struct;
  v7 = v5;

  return v7;
}

- (id)allValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_forward, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_backward, "allValues"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));
  v6 = v5;
  if (!v5)
    v5 = &__NSArray0__struct;
  v7 = v5;

  return v7;
}

- (id)forwardKeys
{
  return -[NSMutableDictionary allKeys](self->_forward, "allKeys");
}

- (id)forwardValues
{
  return -[NSMutableDictionary allValues](self->_forward, "allValues");
}

- (id)backwardKeys
{
  return -[NSMutableDictionary allKeys](self->_backward, "allKeys");
}

- (id)backwardValues
{
  return -[NSMutableDictionary allValues](self->_backward, "allValues");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backward, 0);
  objc_storeStrong((id *)&self->_forward, 0);
}

@end
