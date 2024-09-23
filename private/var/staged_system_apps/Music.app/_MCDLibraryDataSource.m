@implementation _MCDLibraryDataSource

- (_MCDLibraryDataSource)initWithLimitedUI:(BOOL)a3
{
  _MCDLibraryDataSource *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MCDLibraryDataSource;
  result = -[_MCDLibraryDataSource init](&v5, "init");
  if (result)
    result->_limitedUI = a3;
  return result;
}

- (MPModelKind)requestItemKind
{
  return 0;
}

- (NSString)requestLabel
{
  return (NSString *)CFSTR("Library CarPlay View Controller");
}

- (MPPropertySet)requestItemProperties
{
  return (MPPropertySet *)+[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
}

- (MPPropertySet)requestSectionProperties
{
  void *v2;
  void *v3;
  uint64_t v5;

  v5 = MPModelPropertySectionTitle;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v2));

  return (MPPropertySet *)v3;
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (void)setLimitedUI:(BOOL)a3
{
  self->_limitedUI = a3;
}

- (NSString)sortingPreference
{
  return self->_sortingPreference;
}

- (void)setSortingPreference:(id)a3
{
  objc_storeStrong((id *)&self->_sortingPreference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortingPreference, 0);
}

@end
