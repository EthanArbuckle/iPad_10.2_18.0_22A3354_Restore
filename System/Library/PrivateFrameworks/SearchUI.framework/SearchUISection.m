@implementation SearchUISection

- (SFResultSection)resultSection
{
  return (SFResultSection *)objc_getProperty(self, a2, 8, 1);
}

- (SFCollectionCardSection)collectionSection
{
  return (SFCollectionCardSection *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sectionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)reuseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

+ (id)reuseIdentifierForSectionResult
{
  return CFSTR("resultSection");
}

+ (id)reuseIdentifierForCollectionSection
{
  return CFSTR("collectionSection");
}

+ (SearchUISection)sectionWithResultSection:(id)a3 collectionCardSection:(id)a4 sectionIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  SearchUISection *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SearchUISection initWithResultSection:collectionSection:sectionIdentifier:]([SearchUISection alloc], "initWithResultSection:collectionSection:sectionIdentifier:", v9, v8, v7);

  return v10;
}

- (SearchUISection)initWithResultSection:(id)a3 collectionSection:(id)a4 sectionIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  SearchUISection *v12;
  SearchUISection *v13;
  void *v14;
  uint64_t v15;
  NSString *reuseIdentifier;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SearchUISection;
  v12 = -[SearchUISection init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resultSection, a3);
    objc_storeStrong((id *)&v13->_collectionSection, a4);
    objc_storeStrong((id *)&v13->_sectionIdentifier, a5);
    v14 = (void *)objc_opt_class();
    if (v10)
      objc_msgSend(v14, "reuseIdentifierForCollectionSection");
    else
      objc_msgSend(v14, "reuseIdentifierForSectionResult");
    v15 = objc_claimAutoreleasedReturnValue();
    reuseIdentifier = v13->_reuseIdentifier;
    v13->_reuseIdentifier = (NSString *)v15;

  }
  return v13;
}

+ (SearchUISection)sectionWithResultSection:(id)a3 sectionIdentifier:(id)a4
{
  SearchUISection *v4;
  id v5;
  SearchUISection *v6;

  v4 = (SearchUISection *)a3;
  if (a3)
  {
    v5 = a4;
    v6 = v4;
    v4 = -[SearchUISection initWithResultSection:collectionSection:sectionIdentifier:]([SearchUISection alloc], "initWithResultSection:collectionSection:sectionIdentifier:", v6, 0, v5);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionSection, 0);
  objc_storeStrong((id *)&self->_resultSection, 0);
}

@end
