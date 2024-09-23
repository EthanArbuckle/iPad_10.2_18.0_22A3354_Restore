@implementation STS18013ReaderAuthInfo

- (STS18013ReaderAuthInfo)initWithIdentifier:(id)a3 organization:(id)a4 organizationUnit:(id)a5 iconData:(id)a6 iconURL:(id)a7 iconMediaType:(id)a8 privacyPolicyURL:(id)a9 merchantCategoryCode:(id)a10 certificateData:(id)a11
{
  return -[STS18013ReaderAuthInfo initWithIdentifier:organization:organizationUnit:iconData:iconURL:iconMediaType:privacyPolicyURL:merchantCategoryCode:certificateData:readerAnalyticsData:](self, "initWithIdentifier:organization:organizationUnit:iconData:iconURL:iconMediaType:privacyPolicyURL:merchantCategoryCode:certificateData:readerAnalyticsData:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0);
}

- (STS18013ReaderAuthInfo)initWithIdentifier:(id)a3 organization:(id)a4 organizationUnit:(id)a5 iconData:(id)a6 iconURL:(id)a7 iconMediaType:(id)a8 privacyPolicyURL:(id)a9 merchantCategoryCode:(id)a10 certificateData:(id)a11 readerAnalyticsData:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  STS18013ReaderAuthInfo *v22;
  STS18013ReaderAuthInfo *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)STS18013ReaderAuthInfo;
  v22 = -[STS18013ReaderAuthInfo init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v23->_organization, obj);
    objc_storeStrong((id *)&v23->_organizationUnit, a5);
    objc_storeStrong((id *)&v23->_iconData, v26);
    objc_storeStrong((id *)&v23->_iconURL, v27);
    objc_storeStrong((id *)&v23->_iconMediaType, a8);
    objc_storeStrong((id *)&v23->_privacyPolicyURL, a9);
    objc_storeStrong((id *)&v23->_merchantCategoryCode, a10);
    objc_storeStrong((id *)&v23->_certificateData, a11);
    objc_storeStrong((id *)&v23->_readerAnalyticsData, a12);
  }

  return v23;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{\n ID=%@,\n Org=%@,\n OrgUnit=%@,\n IconData length=%lu,\n IconMediaType=%@,\n IconURL=%@,\n PrivacyPolicyURL=%@,\n MerchantCategoryCode=%@,\n CertificateData length=%lu\n}"), self->_identifier, self->_organization, self->_organizationUnit, -[NSData length](self->_iconData, "length"), self->_iconMediaType, self->_iconURL, self->_privacyPolicyURL, self->_merchantCategoryCode, -[NSData length](self->_certificateData, "length"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)organizationUnit
{
  return self->_organizationUnit;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSString)iconMediaType
{
  return self->_iconMediaType;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (NSData)certificateData
{
  return self->_certificateData;
}

- (STS18013ReaderAnalyticsData)readerAnalyticsData
{
  return self->_readerAnalyticsData;
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
