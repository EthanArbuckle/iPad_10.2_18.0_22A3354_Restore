@implementation SHMediaItemPropertyCollection

+ (id)collectionWithArray:(id)a3 representingProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArray:representingProperty:", v7, v6);

  return v8;
}

- (SHMediaItemPropertyCollection)initWithArray:(id)a3 representingProperty:(id)a4
{
  id v6;
  id v7;
  SHMediaItemPropertyCollection *v8;
  uint64_t v9;
  NSSet *collection;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHMediaItemPropertyCollection;
  v8 = -[SHMediaItemPropertyCollection init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    collection = v8->_collection;
    v8->_collection = (NSSet *)v9;

    objc_storeStrong((id *)&v8->_property, a4);
  }

  return v8;
}

- (NSSet)collection
{
  return self->_collection;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
