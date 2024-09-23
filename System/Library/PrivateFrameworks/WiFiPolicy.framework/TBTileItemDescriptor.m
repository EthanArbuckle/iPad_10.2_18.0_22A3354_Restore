@implementation TBTileItemDescriptor

- (NSNumber)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

+ (id)tileItemDescriptorWithKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:etag:", v4, 0);

  return v5;
}

- (TBTileItemDescriptor)initWithKey:(id)a3 etag:(id)a4
{
  NSNumber *v6;
  NSString *v7;
  TBTileItemDescriptor *v8;
  NSNumber *key;
  NSNumber *v10;
  NSString *etag;
  objc_super v13;

  v6 = (NSNumber *)a3;
  v7 = (NSString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)TBTileItemDescriptor;
  v8 = -[TBTileItemDescriptor init](&v13, sel_init);
  key = v8->_key;
  v8->_key = v6;
  v10 = v6;

  etag = v8->_etag;
  v8->_etag = v7;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc_init((Class)objc_opt_class());
  -[TBTileItemDescriptor etag](self, "etag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setEtag:", v7);

  -[TBTileItemDescriptor key](self, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setKey:", v9);

  return v5;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

@end
