@implementation CNVCardNameComponents

+ (id)components
{
  return objc_alloc_init((Class)a1);
}

+ (id)componentsWithFirstName:(id)a3 lastName:(id)a4 middleName:(id)a5 title:(id)a6 suffix:(id)a7 companyName:(id)a8 isCompany:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  +[CNVCardNameComponents components](CNVCardMutableNameComponents, "components");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFirstName:", v19);

  objc_msgSend(v20, "setLastName:", v18);
  objc_msgSend(v20, "setMiddleName:", v17);

  objc_msgSend(v20, "setTitle:", v16);
  objc_msgSend(v20, "setSuffix:", v15);

  objc_msgSend(v20, "setCompanyName:", v14);
  objc_msgSend(v20, "setIsCompany:", a9);
  return v20;
}

- (NSString)formattedName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)suffix
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)companyName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isCompany
{
  return self->_isCompany;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_formattedName, 0);
}

@end
