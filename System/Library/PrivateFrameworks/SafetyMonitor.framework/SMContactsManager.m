@implementation SMContactsManager

+ (id)shared
{
  return +[SMContactsManagerInternal shared](SMContactsManagerInternal, "shared");
}

- (id)activeSessionRecipientContactsFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SMContactsManager shared](SMContactsManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSessionRecipientContactsFor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contactWith:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SMContactsManager shared](SMContactsManager, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactWith:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchAdditionalInfoFor:(id)a3 keysToFetch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[SMContactsManager shared](SMContactsManager, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAdditionalInfoFor:keysToFetch:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchSelfContact
{
  void *v2;
  void *v3;

  +[SMContactsManager shared](SMContactsManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchSelfContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
