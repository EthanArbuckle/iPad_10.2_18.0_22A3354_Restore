@implementation ReaderAnalyticsData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ReaderAnalyticsData)initWithCoder:(id)a3
{
  id v4;
  ReaderAnalyticsData *v5;
  uint64_t v6;
  NSString *untrustedIdentifier;
  uint64_t v8;
  NSString *untrustedOrganization;
  uint64_t v10;
  NSString *untrustedIssuerIdentifier;
  uint64_t v12;
  NSString *untrustedIssuerOrganization;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ReaderAnalyticsData;
  v5 = -[ReaderAnalyticsData init](&v15, sel_init);
  if (v5)
  {
    v5->_trusted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("trusted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untrustedIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    untrustedIdentifier = v5->_untrustedIdentifier;
    v5->_untrustedIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untrustedOrganization"));
    v8 = objc_claimAutoreleasedReturnValue();
    untrustedOrganization = v5->_untrustedOrganization;
    v5->_untrustedOrganization = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untrustedIssuerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    untrustedIssuerIdentifier = v5->_untrustedIssuerIdentifier;
    v5->_untrustedIssuerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("untrustedIssuerOrganization"));
    v12 = objc_claimAutoreleasedReturnValue();
    untrustedIssuerOrganization = v5->_untrustedIssuerOrganization;
    v5->_untrustedIssuerOrganization = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 trusted;
  id v5;

  trusted = self->_trusted;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", trusted, CFSTR("trusted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedIdentifier, CFSTR("untrustedIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedOrganization, CFSTR("untrustedOrganization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedIssuerIdentifier, CFSTR("untrustedIssuerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_untrustedIssuerOrganization, CFSTR("untrustedIssuerOrganization"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const __CFString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *untrustedIssuerOrganization;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("NO");
  if (self)
  {
    if (self->_trusted)
      v6 = CFSTR("YES");
    v7 = self->_untrustedIdentifier;
    v8 = self->_untrustedOrganization;
    v9 = self->_untrustedIssuerIdentifier;
    untrustedIssuerOrganization = self->_untrustedIssuerOrganization;
  }
  else
  {
    v9 = 0;
    v7 = 0;
    v8 = 0;
    untrustedIssuerOrganization = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; trusted = %@; untrustedIdentifier = %@; untrustedOrganization = %@; untrustedIssuerIdentifier = %@; untrustedIssuerOrganization = %@>"),
    v5,
    v6,
    v7,
    v8,
    v9,
    untrustedIssuerOrganization);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_untrustedIssuerOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIssuerIdentifier, 0);
  objc_storeStrong((id *)&self->_untrustedOrganization, 0);
  objc_storeStrong((id *)&self->_untrustedIdentifier, 0);
}

@end
