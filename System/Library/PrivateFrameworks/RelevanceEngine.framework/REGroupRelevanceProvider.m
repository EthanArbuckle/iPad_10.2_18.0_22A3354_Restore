@implementation REGroupRelevanceProvider

- (REGroupRelevanceProvider)initWithGroupIdentifier:(id)a3
{
  id v4;
  REGroupRelevanceProvider *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REGroupRelevanceProvider;
  v5 = -[RERelevanceProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (id)relevanceSimulatorID
{
  return CFSTR("group");
}

- (REGroupRelevanceProvider)initWithDictionary:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  REGroupRelevanceProvider *v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("group_name"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_24CF92178;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v8 = -[REGroupRelevanceProvider initWithGroupIdentifier:](self, "initWithGroupIdentifier:", v7);
  return v8;
}

- (id)dictionaryEncoding
{
  NSString *groupIdentifier;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  groupIdentifier = self->_groupIdentifier;
  v4 = CFSTR("group_name");
  v5[0] = groupIdentifier;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REGroupRelevanceProvider;
  v4 = -[RERelevanceProvider copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_groupIdentifier);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REGroupRelevanceProvider *v4;
  NSString *groupIdentifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  objc_super v11;

  v4 = (REGroupRelevanceProvider *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)REGroupRelevanceProvider;
    if (-[RERelevanceProvider isEqual:](&v11, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      groupIdentifier = self->_groupIdentifier;
      v6 = v4->_groupIdentifier;
      v7 = groupIdentifier;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSString isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_hash
{
  return -[NSString hash](self->_groupIdentifier, "hash");
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REGroupRelevanceProvider;
  -[REGroupRelevanceProvider description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" groupIdentifier=%@"), self->_groupIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
