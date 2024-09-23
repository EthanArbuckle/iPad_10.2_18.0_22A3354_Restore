@implementation REMStoreSwiftInvocation

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultTokenToDiffAgainst, 0);
}

- (REMStoreSwiftInvocation)init
{
  return -[REMStoreSwiftInvocation initWithFetchResultTokenToDiffAgainst:](self, "initWithFetchResultTokenToDiffAgainst:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMStoreSwiftInvocation fetchResultTokenToDiffAgainst](self, "fetchResultTokenToDiffAgainst");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fetchResultTokenToDiffAgainst"));

}

- (REMFetchResultToken)fetchResultTokenToDiffAgainst
{
  return self->_fetchResultTokenToDiffAgainst;
}

- (REMStoreSwiftInvocation)initWithFetchResultTokenToDiffAgainst:(id)a3
{
  id v5;
  REMStoreSwiftInvocation *v6;
  REMStoreSwiftInvocation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMStoreSwiftInvocation;
  v6 = -[REMStoreSwiftInvocation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fetchResultTokenToDiffAgainst, a3);

  return v7;
}

- (REMStoreSwiftInvocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMStoreSwiftInvocation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchResultTokenToDiffAgainst"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMStoreSwiftInvocation initWithFetchResultTokenToDiffAgainst:](self, "initWithFetchResultTokenToDiffAgainst:", v5);
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
