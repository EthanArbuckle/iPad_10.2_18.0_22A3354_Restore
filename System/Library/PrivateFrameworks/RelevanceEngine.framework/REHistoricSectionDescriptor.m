@implementation REHistoricSectionDescriptor

- (REHistoricSectionDescriptor)init
{
  REHistoricSectionDescriptor *v2;
  REHistoricSectionDescriptor *v3;
  uint64_t v4;
  NSOrderedSet *rules;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REHistoricSectionDescriptor;
  v2 = -[REHistoricSectionDescriptor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_invertsRanking = 1;
    v2->_maxElementCount = -1;
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSet");
    v4 = objc_claimAutoreleasedReturnValue();
    rules = v3->_rules;
    v3->_rules = (NSOrderedSet *)v4;

  }
  return v3;
}

- (NSString)name
{
  id WeakRetained;
  void *v3;
  __CFString *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentDescriptor);
  objc_msgSend(WeakRetained, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("_historic"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_24CF92178;
  }

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  REHistoricSectionDescriptor *v4;
  REHistoricSectionDescriptor *v5;
  REHistoricSectionDescriptor *v6;
  NSOrderedSet *rules;
  NSOrderedSet *v8;
  NSOrderedSet *v9;
  NSOrderedSet *v10;
  char v11;

  v4 = (REHistoricSectionDescriptor *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_maxElementCount == v5->_maxElementCount && self->_invertsRanking == v5->_invertsRanking)
      {
        rules = self->_rules;
        v8 = v5->_rules;
        v9 = rules;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSOrderedSet isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_maxElementCount ^ self->_invertsRanking;
  return v2 ^ -[NSOrderedSet hash](self->_rules, "hash");
}

- (NSSet)rules
{
  void *v2;
  void *v3;

  -[NSOrderedSet set](self->_rules, "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSSet *)v3;
}

- (void)setRules:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *rules;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithSet:", a3);
  v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  rules = self->_rules;
  self->_rules = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setInvertsRanking:", self->_invertsRanking);
  objc_msgSend(v4, "setMaxElementCount:", self->_maxElementCount);
  objc_storeStrong(v4 + 1, self->_rules);
  return v4;
}

- (BOOL)invertsRanking
{
  return self->_invertsRanking;
}

- (void)setInvertsRanking:(BOOL)a3
{
  self->_invertsRanking = a3;
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (RESectionDescriptor)parentDescriptor
{
  return (RESectionDescriptor *)objc_loadWeakRetained((id *)&self->_parentDescriptor);
}

- (void)setParentDescriptor:(id)a3
{
  objc_storeWeak((id *)&self->_parentDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentDescriptor);
  objc_storeStrong((id *)&self->_rules, 0);
}

- (NSArray)orderedRules
{
  return -[NSOrderedSet array](self->_rules, "array");
}

- (void)setOrderedRules:(id)a3
{
  NSOrderedSet *v4;
  NSOrderedSet *rules;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", a3);
  v4 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  rules = self->_rules;
  self->_rules = v4;

}

@end
