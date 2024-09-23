@implementation PKODIServiceProviderAssessment

- (PKODIServiceProviderAssessment)initWithServiceProviderIdentifier:(id)a3 locationBundle:(id)a4
{
  id v7;
  id v8;
  PKODIServiceProviderAssessment *v9;
  PKODIServiceProviderAssessment *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  PKODIServiceProviderAssessment *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKODIServiceProviderAssessment;
  v9 = -[PKODIAssessment init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_locationBundle, a4);
  }
  PKLogFacilityTypeGetObject(6uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Creating PKODIServiceProviderAssessment with locationBundle %@, %@", buf, 0x16u);
  }

  return v10;
}

- (void)createODISession
{
  void *v3;
  NSObject *v4;
  int v5;
  PKODIServiceProviderAssessment *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D17588]), "initWithServiceIdentifier:forDSIDType:andLocationBundle:", self->_serviceIdentifier, 1, self->_locationBundle);
  -[PKODIAssessment setOdiSession:](self, "setOdiSession:", v3);

  PKLogFacilityTypeGetObject(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Created ODISession %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)getAssessmentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[PKODIAssessment odiSession](self, "odiSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PKODIAssessment odiSession](self, "odiSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getAssessment:", v7);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }
    v4 = v7;
  }

}

- (void)setServiceIdentifier:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_serviceIdentifier != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_serviceIdentifier, a3);
    -[PKODIServiceProviderAssessment createODISession](self, "createODISession");
    v5 = v6;
  }

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("serviceIdentifier: '%@'; "), self->_serviceIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationBundle, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
