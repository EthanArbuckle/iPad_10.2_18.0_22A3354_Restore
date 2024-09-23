@implementation PSGOperationalPredictedItem

- (PSGOperationalPredictedItem)initWithItemIdentifier:(id)a3 value:(id)a4 bundleIdentifier:(id)a5 operationData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PSGOperationalPredictedItem *v15;
  PSGOperationalPredictedItem *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSGOperationalPredictedItem;
  v15 = -[PSGOperationalPredictedItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_itemIdentifier, a3);
    objc_storeStrong((id *)&v16->_value, a4);
    objc_storeStrong((id *)&v16->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v16->_operationData, a6);
  }

  return v16;
}

- (PSGOperationalPredictedItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PSGOperationalPredictedItem *v14;
  void *v15;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("iid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("val"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1DF0B9950]();
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v9, "initWithObjects:", v5, v10, v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("opd"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  if (v6 && v7 && v13)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("bid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:](self, "initWithItemIdentifier:value:bundleIdentifier:operationData:", v6, v7, v15, v13);

    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("iid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("val"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationData, CFSTR("opd"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_opt_class();
  v5 = (_QWORD *)objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_itemIdentifier, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = -[NSDictionary copyWithZone:](self->_operationData, "copyWithZone:", a3);
    v13 = (void *)v5[4];
    v5[4] = v12;

  }
  return v5;
}

- (BOOL)isEqualToItem:(id)a3
{
  id *v4;
  id *v5;
  NSString *itemIdentifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *value;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *bundleIdentifier;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  char v21;
  NSDictionary *v22;
  NSDictionary *v23;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  itemIdentifier = self->_itemIdentifier;
  v7 = (NSString *)v4[1];
  if (itemIdentifier == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = itemIdentifier;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_12;
  }
  value = self->_value;
  v12 = (NSString *)v5[2];
  if (value == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = value;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_12;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v17 = (NSString *)v5[3];
  if (bundleIdentifier == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = bundleIdentifier;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
    {
LABEL_12:
      v21 = 0;
      goto LABEL_18;
    }
  }
  v22 = self->_operationData;
  v23 = v22;
  if (v22 == v5[4])
    v21 = 1;
  else
    v21 = -[NSDictionary isEqual:](v22, "isEqual:");

LABEL_18:
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  PSGOperationalPredictedItem *v4;
  PSGOperationalPredictedItem *v5;
  BOOL v6;

  v4 = (PSGOperationalPredictedItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGOperationalPredictedItem isEqualToItem:](self, "isEqualToItem:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_itemIdentifier, "hash");
  v4 = -[NSString hash](self->_value, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_bundleIdentifier, "hash") - v4 + 32 * v4;
  return -[NSDictionary hash](self->_operationData, "hash") - v5 + 32 * v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PSGOperationalPredictedItem iid:%@ val:%@ bid:%@ opd:%@>"), self->_itemIdentifier, self->_value, self->_bundleIdentifier, self->_operationData);
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSDictionary)operationData
{
  return self->_operationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationData, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
