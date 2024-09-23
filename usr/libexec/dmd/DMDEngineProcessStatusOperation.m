@implementation DMDEngineProcessStatusOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineProcessStatusOperation organizationIdentifier](self, "organizationIdentifier"));
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("DMDConfigurationSourceStatusDidChange"), v5);

  -[DMDEngineProcessStatusOperation setResultObject:](self, "setResultObject:", 0);
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_organizationIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
