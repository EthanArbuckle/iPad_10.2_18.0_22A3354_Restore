@implementation _RESectionDescriptor

- (NSArray)rules
{
  return self->_rules;
}

- (_RESectionDescriptor)initWithSectionDescriptor:(id)a3
{
  id v4;
  _RESectionDescriptor *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSArray *rules;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RESectionDescriptor;
  v5 = -[_RESectionDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_invertRanking = 0;
    v5->_maxElementCount = objc_msgSend(v4, "maxElementCount");
    objc_msgSend(v4, "orderedRules");
    v8 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSArray *)v8;

    v5->_allowsSubsections = 1;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (BOOL)invertRanking
{
  return self->_invertRanking;
}

- (BOOL)allowsSubsections
{
  return self->_allowsSubsections;
}

- (_RESectionDescriptor)initWithHistoricSectionDescriptor:(id)a3
{
  id v4;
  _RESectionDescriptor *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSArray *rules;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_RESectionDescriptor;
  v5 = -[_RESectionDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_invertRanking = objc_msgSend(v4, "invertsRanking");
    v5->_maxElementCount = objc_msgSend(v4, "maxElementCount");
    objc_msgSend(v4, "orderedRules");
    v8 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSArray *)v8;

    v5->_allowsSubsections = 1;
  }

  return v5;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (void)setRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
