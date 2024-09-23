@implementation ISO18013ReaderAuthInfo

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organization, CFSTR("organization"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationUnit, CFSTR("organizationUnit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconData, CFSTR("iconData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, CFSTR("iconURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconMediaType, CFSTR("iconMediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyPolicyURL, CFSTR("privacyPolicyURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantCategoryCode, CFSTR("merchantCategoryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificateData, CFSTR("certificateData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_readerAnalyticsData, CFSTR("readerAnalytics"));

}

- (ISO18013ReaderAuthInfo)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *identifier;
  NSString *v7;
  NSString *organization;
  NSString *v9;
  NSString *organizationUnit;
  NSData *v11;
  NSData *iconData;
  NSURL *v13;
  NSURL *iconURL;
  NSString *v15;
  NSString *iconMediaType;
  NSURL *v17;
  NSURL *privacyPolicyURL;
  NSNumber *v19;
  NSNumber *merchantCategoryCode;
  NSData *v21;
  NSData *certificateData;
  ReaderAnalyticsData *v23;
  ReaderAnalyticsData *readerAnalyticsData;

  if (self)
  {
    v4 = a3;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    self->_identifier = v5;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organization"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    organization = self->_organization;
    self->_organization = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("organizationUnit"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    organizationUnit = self->_organizationUnit;
    self->_organizationUnit = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
    v11 = (NSData *)objc_claimAutoreleasedReturnValue();
    iconData = self->_iconData;
    self->_iconData = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconURL"));
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    iconURL = self->_iconURL;
    self->_iconURL = v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconMediaType"));
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    iconMediaType = self->_iconMediaType;
    self->_iconMediaType = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyURL"));
    v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = self->_privacyPolicyURL;
    self->_privacyPolicyURL = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantCategoryCode"));
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    merchantCategoryCode = self->_merchantCategoryCode;
    self->_merchantCategoryCode = v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("certificateData"));
    v21 = (NSData *)objc_claimAutoreleasedReturnValue();
    certificateData = self->_certificateData;
    self->_certificateData = v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("readerAnalytics"));
    v23 = (ReaderAnalyticsData *)objc_claimAutoreleasedReturnValue();

    readerAnalyticsData = self->_readerAnalyticsData;
    self->_readerAnalyticsData = v23;

  }
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerAnalyticsData, 0);
  objc_storeStrong((id *)&self->_certificateData, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_iconMediaType, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_organizationUnit, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
