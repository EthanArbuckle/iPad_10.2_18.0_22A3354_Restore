@implementation PPSuggestedEventQuery

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSuggestedEventQuery;
  v4 = a3;
  -[PPEventQuery encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchingCategories, CFSTR("mtcat"), v5.receiver, v5.super_class);

}

- (PPSuggestedEventQuery)initWithCoder:(id)a3
{
  id v4;
  PPSuggestedEventQuery *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *matchingCategories;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPSuggestedEventQuery;
  v5 = -[PPEventQuery initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D7805AC]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("mtcat"));
    v10 = objc_claimAutoreleasedReturnValue();
    matchingCategories = v5->_matchingCategories;
    v5->_matchingCategories = (NSSet *)v10;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPEventQuery fromDate](self, "fromDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPEventQuery toDate](self, "toDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPSuggestedEventQuery f:%@ t:%@ m:%@>"), v4, v5, self->_matchingCategories);

  return v6;
}

- (NSSet)matchingCategories
{
  return self->_matchingCategories;
}

- (void)setMatchingCategories:(id)a3
{
  objc_storeStrong((id *)&self->_matchingCategories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingCategories, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
