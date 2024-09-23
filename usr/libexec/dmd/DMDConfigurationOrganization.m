@implementation DMDConfigurationOrganization

+ (id)fetchRequestMatchingConfigurationOrganizationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("identifier"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

+ (id)fetchRequestMatchingConfigurationOrganizationsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("type"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  return v5;
}

- (void)didSave
{
  void *v3;
  objc_super v4;

  if ((-[DMDConfigurationOrganization isInserted](self, "isInserted") & 1) != 0
    || -[DMDConfigurationOrganization isDeleted](self, "isDeleted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("DMDConfigurationOrganizationsDidChangeNotification"), 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)DMDConfigurationOrganization;
  -[DMDConfigurationOrganization didSave](&v4, "didSave");
}

@end
