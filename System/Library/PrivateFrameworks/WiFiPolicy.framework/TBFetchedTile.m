@implementation TBFetchedTile

- (TBFetchedTile)initWithKey:(unint64_t)a3 etag:(id)a4 created:(id)a5
{
  NSString *v8;
  NSDate *v9;
  TBFetchedTile *v10;
  NSString *etag;
  NSString *v12;
  NSDate *created;
  objc_super v15;

  v8 = (NSString *)a4;
  v9 = (NSDate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)TBFetchedTile;
  v10 = -[TBFetchedTile init](&v15, sel_init);
  etag = v10->_etag;
  v10->_key = a3;
  v10->_etag = v8;
  v12 = v8;

  created = v10->_created;
  v10->_created = v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_created, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

+ (id)fetchedTileWithKey:(unint64_t)a3 etag:(id)a4 created:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:etag:created:", a3, v9, v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setKey:", -[TBFetchedTile key](self, "key"));
  -[TBFetchedTile etag](self, "etag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEtag:", v5);

  -[TBFetchedTile created](self, "created");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCreated:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TBFetchedTile _isEqualToFetchedTile:](self, "_isEqualToFetchedTile:", v4);

  return v5;
}

- (BOOL)_isEqualToFetchedTile:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[TBFetchedTile key](self, "key");
  v6 = objc_msgSend(v4, "key");

  return v5 == v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("key: %llu"), -[TBFetchedTile key](self, "key"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (NSDate)created
{
  return self->_created;
}

- (void)setCreated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
