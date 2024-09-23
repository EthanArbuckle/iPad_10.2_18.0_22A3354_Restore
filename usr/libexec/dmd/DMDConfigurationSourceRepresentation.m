@implementation DMDConfigurationSourceRepresentation

- (DMDConfigurationSourceRepresentation)initWithConfigurationSource:(id)a3
{
  id v4;
  DMDConfigurationSourceRepresentation *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *organizationIdentifier;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSString *machServiceName;
  uint64_t v14;
  NSXPCListenerEndpoint *listenerEndpoint;
  uint64_t v16;
  DMFReportingRequirements *reportingRequirements;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMDConfigurationSourceRepresentation;
  v5 = -[DMDConfigurationSourceRepresentation init](&v19, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "organizationIdentifier"));
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "machServiceName"));
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "listenerEndpoint"));
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v14;

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reportingRequirements"));
    reportingRequirements = v5->_reportingRequirements;
    v5->_reportingRequirements = (DMFReportingRequirements *)v16;

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[3];

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("displayName");
  v7[2] = CFSTR("machServiceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 3));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("displayName");
  v7[2] = CFSTR("machServiceName");
  v7[3] = CFSTR("listenerEndpoint");
  v7[4] = CFSTR("reportingRequirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 5));
  v4 = DMFObjectDescriptionWithProperties(self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_reportingRequirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
