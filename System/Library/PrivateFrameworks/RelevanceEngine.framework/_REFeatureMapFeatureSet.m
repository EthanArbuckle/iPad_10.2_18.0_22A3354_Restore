@implementation _REFeatureMapFeatureSet

- (_REFeatureMapFeatureSet)initWithFeatureMap:(id)a3
{
  id v5;
  _REFeatureMapFeatureSet *v6;
  _REFeatureMapFeatureSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REFeatureMapFeatureSet;
  v6 = -[_REFeatureMapFeatureSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_map, a3);

  return v7;
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_map, "count");
}

- (id)member:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    v5 = v4;

  return v5;
}

- (id)objectEnumerator
{
  return -[NSDictionary keyEnumerator](self->_map, "keyEnumerator");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
}

@end
