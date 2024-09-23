@implementation CEMEventSubscriptionDeclaration

- (id)dmf_installRequestWithContext:(id)a3 error:(id *)a4
{
  id v5;
  DMDInstallEventSubscriptionRequest *v6;
  void *v7;

  v5 = a3;
  v6 = objc_opt_new(DMDInstallEventSubscriptionRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));

  -[DMDInstallEventSubscriptionRequest setOrganizationIdentifier:](v6, "setOrganizationIdentifier:", v7);
  -[DMDInstallEventSubscriptionRequest setSubscriptionDeclaration:](v6, "setSubscriptionDeclaration:", self);
  return v6;
}

- (id)dmf_replaceRequestWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)dmf_removeRequestWithContext:(id)a3 error:(id *)a4
{
  id v5;
  DMDRemoveEventSubscriptionRequest *v6;
  void *v7;

  v5 = a3;
  v6 = objc_opt_new(DMDRemoveEventSubscriptionRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "organizationIdentifier"));

  -[DMDRemoveEventSubscriptionRequest setOrganizationIdentifier:](v6, "setOrganizationIdentifier:", v7);
  -[DMDRemoveEventSubscriptionRequest setSubscriptionDeclaration:](v6, "setSubscriptionDeclaration:", self);
  return v6;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end
