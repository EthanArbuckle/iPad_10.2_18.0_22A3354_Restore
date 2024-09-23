@implementation OfflineMapsManagementSearchAutocompleteSection

- (OfflineMapsManagementSearchAutocompleteSection)initWithSectionType:(unint64_t)a3
{
  OfflineMapsManagementSearchAutocompleteSection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSearchAutocompleteSection;
  result = -[OfflineMapsManagementSearchAutocompleteSection init](&v5, "init");
  if (result)
    result->_sectionType = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  OfflineMapsManagementSearchAutocompleteSection *v4;
  OfflineMapsManagementSearchAutocompleteSection *v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  v4 = (OfflineMapsManagementSearchAutocompleteSection *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[OfflineMapsManagementSearchAutocompleteSection sectionType](v5, "sectionType");
    v8 = v7 == (id)-[OfflineMapsManagementSearchAutocompleteSection sectionType](self, "sectionType");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)headerText
{
  void *v2;
  void *v3;

  if ((id)-[OfflineMapsManagementSearchAutocompleteSection sectionType](self, "sectionType") == (id)1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Recent Searches [section title]"), CFSTR("localized string not found"), CFSTR("Offline")));

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

@end
