@implementation DMDConfigurationSource

- (void)setOrganizationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSource organization](self, "organization"));
  objc_msgSend(v5, "setIdentifier:", v4);

}

- (NSString)organizationIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSource organization](self, "organization"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));

  return (NSString *)v3;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("organizationIdentifier");
  v7[2] = CFSTR("displayName");
  v7[3] = CFSTR("machServiceName");
  v7[4] = CFSTR("reportingRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 5));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

@end
