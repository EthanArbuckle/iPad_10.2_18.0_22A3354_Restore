@implementation SCUIReportAddress

- (SCUIReportAddress)initWithAddress:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 postCode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SCUIReportAddress *v17;
  uint64_t v18;
  NSString *address;
  uint64_t v20;
  NSString *city;
  uint64_t v22;
  NSString *state;
  uint64_t v24;
  NSString *country;
  uint64_t v26;
  NSString *postCode;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SCUIReportAddress;
  v17 = -[SCUIReportAddress init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    address = v17->_address;
    v17->_address = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    city = v17->_city;
    v17->_city = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    state = v17->_state;
    v17->_state = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    country = v17->_country;
    v17->_country = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    postCode = v17->_postCode;
    v17->_postCode = (NSString *)v26;

  }
  return v17;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)city
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)country
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)postCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
