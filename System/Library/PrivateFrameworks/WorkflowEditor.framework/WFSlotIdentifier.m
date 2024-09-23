@implementation WFSlotIdentifier

- (WFSlotIdentifier)initWithKey:(id)a3
{
  return -[WFSlotIdentifier initWithKey:parameterKey:arrayIndex:](self, "initWithKey:parameterKey:arrayIndex:", a3, 0, 0x7FFFFFFFFFFFFFFFLL);
}

- (WFSlotIdentifier)initWithKey:(id)a3 parameterKey:(id)a4 arrayIndex:(int64_t)a5
{
  id v8;
  id v9;
  WFSlotIdentifier *v10;
  uint64_t v11;
  NSString *key;
  uint64_t v13;
  NSString *parameterKey;
  WFSlotIdentifier *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFSlotIdentifier;
  v10 = -[WFSlotIdentifier init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    key = v10->_key;
    v10->_key = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    parameterKey = v10->_parameterKey;
    v10->_parameterKey = (NSString *)v13;

    v10->_arrayIndex = a5;
    v15 = v10;
  }

  return v10;
}

- (id)identifierBySettingParameterKey:(id)a3 arrayIndex:(int64_t)a4
{
  id v6;
  WFSlotIdentifier *v7;
  void *v8;
  WFSlotIdentifier *v9;

  v6 = a3;
  v7 = [WFSlotIdentifier alloc];
  -[WFSlotIdentifier key](self, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFSlotIdentifier initWithKey:parameterKey:arrayIndex:](v7, "initWithKey:parameterKey:arrayIndex:", v8, v6, a4);

  return v9;
}

- (id)identifierBySettingParameterKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WFSlotIdentifier identifierBySettingParameterKey:arrayIndex:](self, "identifierBySettingParameterKey:arrayIndex:", v4, -[WFSlotIdentifier arrayIndex](self, "arrayIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)identifierBySettingArrayIndex:(int64_t)a3
{
  void *v5;
  void *v6;

  -[WFSlotIdentifier parameterKey](self, "parameterKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSlotIdentifier identifierBySettingParameterKey:arrayIndex:](self, "identifierBySettingParameterKey:arrayIndex:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WFSlotIdentifier *v6;
  WFSlotIdentifier *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int64_t v13;

  v6 = (WFSlotIdentifier *)a3;
  if (self == v6)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[WFSlotIdentifier key](self, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotIdentifier key](v7, "key");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", v9))
      {
        v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
      -[WFSlotIdentifier parameterKey](self, "parameterKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSlotIdentifier parameterKey](v7, "parameterKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11
        || (-[WFSlotIdentifier parameterKey](self, "parameterKey"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[WFSlotIdentifier parameterKey](v7, "parameterKey"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToString:", v4)))
      {
        v13 = -[WFSlotIdentifier arrayIndex](self, "arrayIndex");
        v12 = v13 == -[WFSlotIdentifier arrayIndex](v7, "arrayIndex");
        if (v10 == v11)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_12;
    }
    v12 = 0;
  }
LABEL_14:

  return v12;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (int64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
