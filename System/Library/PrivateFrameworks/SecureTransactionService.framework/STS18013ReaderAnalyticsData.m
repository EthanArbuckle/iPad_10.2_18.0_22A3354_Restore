@implementation STS18013ReaderAnalyticsData

- (STS18013ReaderAnalyticsData)initWithTrusted:(BOOL)a3 untrustedIdentifier:(id)a4 untrustedOrganization:(id)a5 untrustedIssuerIdentifier:(id)a6 untrustedIssuerOrganization:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STS18013ReaderAnalyticsData *v17;
  STS18013ReaderAnalyticsData *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STS18013ReaderAnalyticsData;
  v17 = -[STS18013ReaderAnalyticsData init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_trusted = a3;
    objc_storeStrong((id *)&v17->_untrustedIdentifier, a4);
    objc_storeStrong((id *)&v18->_untrustedOrganization, a5);
    objc_storeStrong((id *)&v18->_untrustedIssuerIdentifier, a6);
    objc_storeStrong((id *)&v18->_untrustedIssuerOrganization, a7);
  }

  return v18;
}

- (STS18013ReaderAnalyticsData)initWithUntrustedIdentifier:(id)a3 untrustedOrganization:(id)a4
{
  return -[STS18013ReaderAnalyticsData initWithTrusted:untrustedIdentifier:untrustedOrganization:untrustedIssuerIdentifier:untrustedIssuerOrganization:](self, "initWithTrusted:untrustedIdentifier:untrustedOrganization:untrustedIssuerIdentifier:untrustedIssuerOrganization:", 0, a3, a4, 0, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STS18013ReaderAnalyticsData isTrusted](self, "isTrusted"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[STS18013ReaderAnalyticsData untrustedIdentifier](self, "untrustedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STS18013ReaderAnalyticsData untrustedOrganization](self, "untrustedOrganization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STS18013ReaderAnalyticsData untrustedIssuerIdentifier](self, "untrustedIssuerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STS18013ReaderAnalyticsData untrustedIssuerOrganization](self, "untrustedIssuerOrganization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; trusted = %@; untrustedIdentifier = %@; untrustedOrganization = %@; untrustedIssuerIdentifier = %@; untrustedIssuerOrganization = %@>"),
    v5,
    v6,
    v7,
    v8,
    v9,
    v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isTrusted
{
  return self->_trusted;
}

- (NSString)untrustedIdentifier
{
  return self->_untrustedIdentifier;
}

- (NSString)untrustedOrganization
{
  return self->_untrustedOrganization;
}

- (NSString)untrustedIssuerIdentifier
{
  return self->_untrustedIssuerIdentifier;
}

- (NSString)untrustedIssuerOrganization
{
  return self->_untrustedIssuerOrganization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untrustedIssuerOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIdentifier, 0);
}

@end
