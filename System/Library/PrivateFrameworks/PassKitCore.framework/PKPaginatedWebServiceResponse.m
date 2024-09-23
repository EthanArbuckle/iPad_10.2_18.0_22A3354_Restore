@implementation PKPaginatedWebServiceResponse

- (PKPaginatedWebServiceResponse)initWithData:(id)a3
{
  PKPaginatedWebServiceResponse *v3;
  PKPaginatedWebServiceResponse *v4;
  void *v5;
  uint64_t v6;
  NSDate *lastUpdated;
  uint64_t v8;
  void *rawDataList;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKPaginatedWebServiceResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4->_moreComing = objc_msgSend(v5, "PKBoolForKey:", CFSTR("moreComing"));
      objc_msgSend(v5, "PKDateForKey:", CFSTR("lastUpdated"));
      v6 = objc_claimAutoreleasedReturnValue();
      lastUpdated = v4->_lastUpdated;
      v4->_lastUpdated = (NSDate *)v6;

      objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("data"));
      v8 = objc_claimAutoreleasedReturnValue();
      rawDataList = v4->_rawDataList;
      v4->_rawDataList = (NSArray *)v8;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        v14 = v13;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      rawDataList = v4;
      v4 = 0;
    }

  }
  return v4;
}

+ (PKPaginatedWebServiceResponse)responseWithData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v3);

  return (PKPaginatedWebServiceResponse *)v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PKWebServiceResponse JSONObject](self, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> JSONObject: %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaginatedWebServiceResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PKPaginatedWebServiceResponse *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKPaginatedWebServiceResponse initWithData:](self, "initWithData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PKWebServiceResponse rawData](self, "rawData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("rawData"));

}

- (NSArray)rawDataList
{
  return self->_rawDataList;
}

- (BOOL)moreComing
{
  return self->_moreComing;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_rawDataList, 0);
}

@end
