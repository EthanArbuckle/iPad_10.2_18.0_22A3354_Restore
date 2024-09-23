@implementation SearchUICollectionResultsViewRestorationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchUICollectionResultsViewRestorationContext)initWithCoder:(id)a3
{
  id v4;
  SearchUICollectionResultsViewRestorationContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *sections;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUICollectionResultsViewRestorationContext;
  v5 = -[SearchUICollectionViewRestorationContext initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sections"));
    v9 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICollectionResultsViewRestorationContext;
  v4 = a3;
  -[SearchUICollectionViewRestorationContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sections, CFSTR("sections"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchUICollectionResultsViewRestorationContext;
  v4 = -[SearchUICollectionViewRestorationContext copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SearchUICollectionResultsViewRestorationContext sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSections:", v5);

  return v4;
}

- (NSArray)sections
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
