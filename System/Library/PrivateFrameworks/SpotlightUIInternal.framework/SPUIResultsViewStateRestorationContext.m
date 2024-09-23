@implementation SPUIResultsViewStateRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPUIResultsViewStateRestorationContext)initWithCoder:(id)a3
{
  id v4;
  SPUIResultsViewStateRestorationContext *v5;
  uint64_t v6;
  NSString *searchString;
  uint64_t v8;
  SPSearchEntity *searchEntity;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SPUIResultsViewStateRestorationContext;
  v5 = -[SearchUICollectionResultsViewRestorationContext initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
    v6 = objc_claimAutoreleasedReturnValue();
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchEntity"));
    v8 = objc_claimAutoreleasedReturnValue();
    searchEntity = v5->_searchEntity;
    v5->_searchEntity = (SPSearchEntity *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPUIResultsViewStateRestorationContext;
  v4 = a3;
  -[SearchUICollectionResultsViewRestorationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchString, CFSTR("searchString"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_searchEntity, CFSTR("searchEntity"));

}

- (NSString)searchString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (SPSearchEntity)searchEntity
{
  return (SPSearchEntity *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSearchEntity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchEntity, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
