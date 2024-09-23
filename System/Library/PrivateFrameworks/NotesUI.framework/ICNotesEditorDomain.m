@implementation ICNotesEditorDomain

+ (id)rootSettings
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ICNotesEditorDomain;
  objc_msgSendSuper2(&v3, sel_rootSettings);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)rootSettingsClass
{
  return (Class)objc_opt_class();
}

+ (id)domainGroupName
{
  return CFSTR("Notes");
}

+ (id)domainName
{
  return CFSTR("Editor");
}

@end
