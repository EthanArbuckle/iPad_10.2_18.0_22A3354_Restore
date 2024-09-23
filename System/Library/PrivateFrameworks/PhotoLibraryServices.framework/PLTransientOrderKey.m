@implementation PLTransientOrderKey

- (id)childManagedObject
{
  void *v3;
  void *v4;
  void *v5;

  -[PLTransientOrderKey moc](self, "moc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTransientOrderKey objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingObjectWithID:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)secondaryOrderSortKey
{
  void *v2;
  void *v3;
  void *v4;

  -[PLTransientOrderKey objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URIRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLTransientOrderKey;
  -[PLTransientOrderKey description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTransientOrderKey objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@ %lld"), v4, -[PLTransientOrderKey orderValue](self, "orderValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)orderValue
{
  return self->_orderValue;
}

- (void)setOrderValue:(int64_t)a3
{
  self->_orderValue = a3;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
