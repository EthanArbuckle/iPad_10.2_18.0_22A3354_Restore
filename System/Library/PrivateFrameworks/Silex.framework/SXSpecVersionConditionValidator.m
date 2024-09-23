@implementation SXSpecVersionConditionValidator

- (SXSpecVersionConditionValidator)initWithSpecVersion:(id)a3
{
  id v4;
  SXSpecVersionConditionValidator *v5;
  uint64_t v6;
  NSString *specVersion;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXSpecVersionConditionValidator;
  v5 = -[SXSpecVersionConditionValidator init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    specVersion = v5->_specVersion;
    v5->_specVersion = (NSString *)v6;

  }
  return v5;
}

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "minSpecVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "maxSpecVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[SXSpecVersionConditionValidator specVersion](self, "specVersion"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = SXSpecVersionCompare(v6, v8),
        v8,
        v9 == 1))
  {
    v10 = 0;
  }
  else if (v7)
  {
    -[SXSpecVersionConditionValidator specVersion](self, "specVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SXSpecVersionCompare(v7, v11) != -1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (NSString)specVersion
{
  return self->_specVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specVersion, 0);
}

@end
