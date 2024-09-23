@implementation ICQTipCriteria

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("minimumRange: %@, maximumRange: %@, criteriaURL: %@, excludeApps: %@"), self->_minimumRange, self->_maximumRange, self->_criteriaURL, self->_excludeApps);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICQTipCriteria *v4;

  v4 = objc_alloc_init(ICQTipCriteria);
  -[ICQTipCriteria setMinimumRange:](v4, "setMinimumRange:", self->_minimumRange);
  -[ICQTipCriteria setMaximumRange:](v4, "setMaximumRange:", self->_maximumRange);
  -[ICQTipCriteria setCriteriaURL:](v4, "setCriteriaURL:", self->_criteriaURL);
  -[ICQTipCriteria setExcludeApps:](v4, "setExcludeApps:", self->_excludeApps);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *minimumRange;
  id v5;

  minimumRange = self->_minimumRange;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minimumRange, CFSTR("minimumRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumRange, CFSTR("maximumRange"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_criteriaURL, CFSTR("criteriaURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludeApps, CFSTR("excludeApps"));

}

- (ICQTipCriteria)initWithCoder:(id)a3
{
  id v4;
  ICQTipCriteria *v5;
  uint64_t v6;
  NSNumber *minimumRange;
  uint64_t v8;
  NSNumber *maximumRange;
  uint64_t v10;
  NSURL *criteriaURL;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *excludeApps;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICQTipCriteria;
  v5 = -[ICQTipCriteria init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumRange"));
    v6 = objc_claimAutoreleasedReturnValue();
    minimumRange = v5->_minimumRange;
    v5->_minimumRange = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumRange"));
    v8 = objc_claimAutoreleasedReturnValue();
    maximumRange = v5->_maximumRange;
    v5->_maximumRange = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("criteriaURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    criteriaURL = v5->_criteriaURL;
    v5->_criteriaURL = (NSURL *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("excludeApps"));
    v15 = objc_claimAutoreleasedReturnValue();
    excludeApps = v5->_excludeApps;
    v5->_excludeApps = (NSArray *)v15;

  }
  return v5;
}

- (NSNumber)minimumRange
{
  return self->_minimumRange;
}

- (void)setMinimumRange:(id)a3
{
  objc_storeStrong((id *)&self->_minimumRange, a3);
}

- (NSNumber)maximumRange
{
  return self->_maximumRange;
}

- (void)setMaximumRange:(id)a3
{
  objc_storeStrong((id *)&self->_maximumRange, a3);
}

- (NSURL)criteriaURL
{
  return self->_criteriaURL;
}

- (void)setCriteriaURL:(id)a3
{
  objc_storeStrong((id *)&self->_criteriaURL, a3);
}

- (NSArray)excludeApps
{
  return self->_excludeApps;
}

- (void)setExcludeApps:(id)a3
{
  objc_storeStrong((id *)&self->_excludeApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeApps, 0);
  objc_storeStrong((id *)&self->_criteriaURL, 0);
  objc_storeStrong((id *)&self->_maximumRange, 0);
  objc_storeStrong((id *)&self->_minimumRange, 0);
}

@end
