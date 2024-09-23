@implementation TPSInclusivityValidation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeValues, 0);
  objc_storeStrong((id *)&self->_targetValues, 0);
}

- (TPSInclusivityValidation)initWithTargetValues:(id)a3 excludeValues:(id)a4
{
  id v7;
  id v8;
  TPSInclusivityValidation *v9;
  TPSInclusivityValidation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSInclusivityValidation;
  v9 = -[TPSInclusivityValidation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetValues, a3);
    objc_storeStrong((id *)&v10->_excludeValues, a4);
  }

  return v10;
}

- (NSArray)targetValues
{
  return self->_targetValues;
}

- (NSArray)excludeValues
{
  return self->_excludeValues;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSInclusivityValidation targetValues](self, "targetValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSInclusivityValidation excludeValues](self, "excludeValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; include = %@; exclude: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setTargetValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setExcludeValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
