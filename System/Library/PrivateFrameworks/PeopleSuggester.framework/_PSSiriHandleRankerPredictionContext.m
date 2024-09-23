@implementation _PSSiriHandleRankerPredictionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)suggestionDate
{
  NSDate *suggestionDate;
  NSDate *v4;
  NSDate *v5;

  suggestionDate = self->_suggestionDate;
  if (!suggestionDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_suggestionDate;
    self->_suggestionDate = v4;

    suggestionDate = self->_suggestionDate;
  }
  return suggestionDate;
}

- (_PSSiriHandleRankerPredictionContext)initWithCoder:(id)a3
{
  id v4;
  _PSSiriHandleRankerPredictionContext *v5;
  uint64_t v6;
  NSDate *suggestionDate;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *bundleIds;
  _PSSiriHandleRankerPredictionContext *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_PSSiriHandleRankerPredictionContext;
  v5 = -[_PSSiriHandleRankerPredictionContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    suggestionDate = v5->_suggestionDate;
    v5->_suggestionDate = (NSDate *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("bundleIds"));
    v11 = objc_claimAutoreleasedReturnValue();
    bundleIds = v5->_bundleIds;
    v5->_bundleIds = (NSArray *)v11;

    v5->_domain = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("domain"));
    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *suggestionDate;
  id v5;

  suggestionDate = self->_suggestionDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", suggestionDate, CFSTR("suggestionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIds, CFSTR("bundleIds"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_domain, CFSTR("domain"));

}

- (void)setSuggestionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_suggestionDate, 0);
}

@end
