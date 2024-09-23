@implementation SPResultSet

- (SPResultSet)initWithSections:(id)a3
{
  id v5;
  SPResultSet *v6;
  SPResultSet *v7;
  NSArray *stableSections;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SPResultSet;
  v6 = -[SPResultSet init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resultSections, a3);
    stableSections = v7->_stableSections;
    v7->_stableSections = 0;

  }
  return v7;
}

- (SPResultSet)initWithSections:(id)a3 stableSections:(id)a4
{
  id v7;
  id v8;
  SPResultSet *v9;
  SPResultSet *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPResultSet;
  v9 = -[SPResultSet init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resultSections, a3);
    objc_storeStrong((id *)&v10->_stableSections, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)classesToDecode;
    classesToDecode = v7;

  }
}

- (SPResultSet)initWithCoder:(id)a3
{
  id v4;
  SPResultSet *v5;
  uint64_t v6;
  NSArray *resultSections;
  uint64_t v8;
  NSArray *stableSections;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPResultSet;
  v5 = -[SPResultSet init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", classesToDecode, CFSTR("_resultSections"));
    v6 = objc_claimAutoreleasedReturnValue();
    resultSections = v5->_resultSections;
    v5->_resultSections = (NSArray *)v6;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", classesToDecode, CFSTR("_stableSections"));
    v8 = objc_claimAutoreleasedReturnValue();
    stableSections = v5->_stableSections;
    v5->_stableSections = (NSArray *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *resultSections;
  id v5;

  resultSections = self->_resultSections;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", resultSections, CFSTR("_resultSections"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stableSections, CFSTR("_stableSections"));

}

- (NSArray)resultSections
{
  return self->_resultSections;
}

- (NSArray)stableSections
{
  return self->_stableSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableSections, 0);
  objc_storeStrong((id *)&self->_resultSections, 0);
}

@end
