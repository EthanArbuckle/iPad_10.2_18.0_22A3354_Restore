@implementation OfflineMapsManagementSection

- (OfflineMapsManagementSection)initWithSectionType:(unint64_t)a3
{
  OfflineMapsManagementSection *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OfflineMapsManagementSection;
  result = -[OfflineMapsManagementSection init](&v5, "init");
  if (result)
    result->_sectionType = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  OfflineMapsManagementSection *v4;
  OfflineMapsManagementSection *v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  v4 = (OfflineMapsManagementSection *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = -[OfflineMapsManagementSection sectionType](v5, "sectionType");
    v8 = v7 == (id)-[OfflineMapsManagementSection sectionType](self, "sectionType");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)headerText
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[OfflineMapsManagementSection sectionType](self, "sectionType");
  if (v2 == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Settings [section title]");
  }
  else
  {
    if (v2 != 4)
    {
      v6 = 0;
      return (NSString *)v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Suggested Maps [section title]");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), CFSTR("Offline")));

  return (NSString *)v6;
}

- (NSString)footerText
{
  -[OfflineMapsManagementSection sectionType](self, "sectionType");
  return 0;
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
