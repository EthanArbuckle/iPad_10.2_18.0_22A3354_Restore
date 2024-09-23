@implementation JSONBagRecord

- (JSONBagRecord)initWithObject:(id)a3
{
  id v4;
  JSONBagRecord *v5;
  JSONBagRecord *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUUID *id;
  uint64_t v12;
  NSData *bag;
  uint64_t v14;
  NSDate *updated;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JSONBagRecord;
  v5 = -[JSONBagRecord init](&v17, "init");
  if (!v5)
    goto LABEL_7;
  v6 = (JSONBagRecord *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "id"));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bag"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updated"));

      if (v9)
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "id"));
        id = v5->_id;
        v5->_id = (NSUUID *)v10;

        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bag"));
        bag = v5->_bag;
        v5->_bag = (NSData *)v12;

        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "updated"));
        updated = v5->_updated;
        v5->_updated = (NSDate *)v14;

        v6 = v5;
        goto LABEL_8;
      }
    }
    else
    {

    }
LABEL_7:
    v6 = 0;
  }
LABEL_8:

  return v6;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (NSDate)updated
{
  return self->_updated;
}

- (void)setUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
