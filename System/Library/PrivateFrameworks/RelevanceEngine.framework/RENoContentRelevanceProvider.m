@implementation RENoContentRelevanceProvider

+ (id)relevanceSimulatorID
{
  return CFSTR("no_content");
}

- (id)dictionaryEncoding
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (RENoContentRelevanceProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RENoContentRelevanceProvider;
  return -[RERelevanceProvider init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RENoContentRelevanceProvider;
  return -[RERelevanceProvider copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  RENoContentRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (RENoContentRelevanceProvider *)a3;
  v5 = 1;
  if (v4 != self)
  {
    v7.receiver = self;
    v7.super_class = (Class)RENoContentRelevanceProvider;
    if (!-[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)_hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RENoContentRelevanceProvider;
  return -[RERelevanceProvider _hash](&v3, sel__hash);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RENoContentRelevanceProvider;
  -[RENoContentRelevanceProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
