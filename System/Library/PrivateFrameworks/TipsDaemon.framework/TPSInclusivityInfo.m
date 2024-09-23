@implementation TPSInclusivityInfo

- (TPSInclusivityInfo)initWithTargetValues:(id)a3 excludeValues:(id)a4
{
  id v7;
  id v8;
  TPSInclusivityInfo *v9;
  TPSInclusivityInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSInclusivityInfo;
  v9 = -[TPSInclusivityInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetValues, a3);
    objc_storeStrong((id *)&v10->_excludeValues, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeValues, 0);
  objc_storeStrong((id *)&self->_targetValues, 0);
}

- (NSArray)targetValues
{
  return self->_targetValues;
}

- (NSArray)excludeValues
{
  return self->_excludeValues;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSInclusivityInfo;
  -[TPSInclusivityInfo debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSInclusivityInfo targetValues](self, "targetValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@"), CFSTR("include"), v6);

  -[TPSInclusivityInfo excludeValues](self, "excludeValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("; %@ = %@"), CFSTR("exclude"), v7);

  return v5;
}

- (void)setTargetValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setExcludeValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
