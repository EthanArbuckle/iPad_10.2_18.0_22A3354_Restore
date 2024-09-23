@implementation HKSPAnalyticsWindDownEventData

- (HKSPAnalyticsWindDownEventData)initWithWindDownAction:(unint64_t)a3 wasUsed:(BOOL)a4 identifier:(id)a5
{
  return -[HKSPAnalyticsWindDownEventData initWithWindDownAction:wasUsed:identifier:wasCollected:](self, "initWithWindDownAction:wasUsed:identifier:wasCollected:", a3, a4, a5, 0);
}

- (HKSPAnalyticsWindDownEventData)initWithWindDownAction:(unint64_t)a3 wasUsed:(BOOL)a4 identifier:(id)a5 wasCollected:(BOOL)a6
{
  id v11;
  HKSPAnalyticsWindDownEventData *v12;
  HKSPAnalyticsWindDownEventData *v13;
  HKSPAnalyticsWindDownEventData *v14;
  objc_super v16;

  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSPAnalyticsWindDownEventData;
  v12 = -[HKSPAnalyticsWindDownEventData init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_action = a3;
    v12->_wasUsed = a4;
    objc_storeStrong((id *)&v12->_identifier, a5);
    v13->_wasCollected = a6;
    v14 = v13;
  }

  return v13;
}

- (id)collectedEventDataCopy
{
  HKSPAnalyticsWindDownEventData *v3;
  unint64_t v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  HKSPAnalyticsWindDownEventData *v8;

  v3 = [HKSPAnalyticsWindDownEventData alloc];
  v4 = -[HKSPAnalyticsWindDownEventData action](self, "action");
  v5 = -[HKSPAnalyticsWindDownEventData wasUsed](self, "wasUsed");
  -[HKSPAnalyticsWindDownEventData identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = -[HKSPAnalyticsWindDownEventData initWithWindDownAction:wasUsed:identifier:wasCollected:](v3, "initWithWindDownAction:wasUsed:identifier:wasCollected:", v4, v5, v7, 1);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t action;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  action = self->_action;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("WindDownAction"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_wasUsed, CFSTR("WasUsed"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_wasCollected, CFSTR("WasCollected"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("WindDownIdentifier"));

}

- (HKSPAnalyticsWindDownEventData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  HKSPAnalyticsWindDownEventData *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WindDownAction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WasUsed"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WasCollected"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WindDownIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HKSPAnalyticsWindDownEventData initWithWindDownAction:wasUsed:identifier:wasCollected:](self, "initWithWindDownAction:wasUsed:identifier:wasCollected:", v6, v7, v9, v8);
  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[HKSPAnalyticsWindDownEventData identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[HKSPAnalyticsWindDownEventData action](self, "action") ^ v4;

  return v5;
}

- (BOOL)isEqualEventData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  BOOL v8;

  v4 = a3;
  -[HKSPAnalyticsWindDownEventData identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = -[HKSPAnalyticsWindDownEventData action](self, "action");
    v8 = v7 == objc_msgSend(v4, "action");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKSPAnalyticsWindDownEventData *v4;
  BOOL v5;

  v4 = (HKSPAnalyticsWindDownEventData *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HKSPAnalyticsWindDownEventData isEqualEventData:](self, "isEqualEventData:", v4);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)action
{
  return self->_action;
}

- (BOOL)wasUsed
{
  return self->_wasUsed;
}

- (BOOL)wasCollected
{
  return self->_wasCollected;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
