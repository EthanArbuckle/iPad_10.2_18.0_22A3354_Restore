@implementation PKApplyWebServiceApplyResponse

- (PKApplyWebServiceApplyResponse)initWithData:(id)a3
{
  PKApplyWebServiceApplyResponse *v3;
  PKApplyWebServiceApplyResponse *v4;
  void *v5;
  id v6;
  void *v7;
  PKFeatureApplication *v8;
  PKFeatureApplication *featureApplication;
  void *v10;
  PKAccount *v11;
  PKAccount *account;
  void *v13;
  uint64_t v14;
  NSSet *actionIdentifiersRequiringAuthentication;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PKApplyWebServiceApplyResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v17, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("application"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[PKFeatureApplication initWithDictionary:]([PKFeatureApplication alloc], "initWithDictionary:", v7);
        featureApplication = v4->_featureApplication;
        v4->_featureApplication = v8;

      }
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("account"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = -[PKAccount initWithDictionary:]([PKAccount alloc], "initWithDictionary:", v10);
        account = v4->_account;
        v4->_account = v11;

      }
      objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("requiredDeviceMetadataFields"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
        v4->_requiredDeviceMetadataFields = PKPaymentDeviceMetadataFieldsFromStrings(v13);
      objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("actionIdentifiersRequiringAuthentication"));
      v14 = objc_claimAutoreleasedReturnValue();
      actionIdentifiersRequiringAuthentication = v4->_actionIdentifiersRequiringAuthentication;
      v4->_actionIdentifiersRequiringAuthentication = (NSSet *)v14;

      v4->_requiresODIAssessment = objc_msgSend(v6, "PKBoolForKey:", CFSTR("requiresODIAssessment"));
    }

  }
  return v4;
}

- (id)nextStepInfo
{
  PKApplyWebServiceApplyStepInfo *v3;
  void *v4;
  PKApplyWebServiceApplyStepInfo *v5;
  void *v6;

  v3 = [PKApplyWebServiceApplyStepInfo alloc];
  -[PKWebServiceResponse JSONObject](self, "JSONObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKApplyWebServiceApplyStepInfo initWithJSONObject:featureApplication:](v3, "initWithJSONObject:featureApplication:", v4, self->_featureApplication);

  -[PKApplyWebServiceResponse conversationIdentifier](self, "conversationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKApplyWebServiceApplyStepInfo setConversationIdentifier:](v5, "setConversationIdentifier:", v6);

  return v5;
}

- (PKApplyWebServiceApplyResponse)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceApplyResponse *v5;
  uint64_t v6;
  PKAccount *account;
  uint64_t v8;
  PKFeatureApplication *featureApplication;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *actionIdentifiersRequiringAuthentication;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKApplyWebServiceApplyResponse;
  v5 = -[PKWebServiceResponse initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("account"));
    v6 = objc_claimAutoreleasedReturnValue();
    account = v5->_account;
    v5->_account = (PKAccount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureApplication"));
    v8 = objc_claimAutoreleasedReturnValue();
    featureApplication = v5->_featureApplication;
    v5->_featureApplication = (PKFeatureApplication *)v8;

    v5->_requiredDeviceMetadataFields = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requiredDeviceMetadataFields"));
    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("actionIdentifiersRequiringAuthentication"));
    v13 = objc_claimAutoreleasedReturnValue();
    actionIdentifiersRequiringAuthentication = v5->_actionIdentifiersRequiringAuthentication;
    v5->_actionIdentifiersRequiringAuthentication = (NSSet *)v13;

    v5->_requiresODIAssessment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresODIAssessment"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplyResponse;
  v4 = a3;
  -[PKWebServiceResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureApplication, CFSTR("featureApplication"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_account, CFSTR("account"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_requiredDeviceMetadataFields, CFSTR("requiredDeviceMetadataFields"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_actionIdentifiersRequiringAuthentication, CFSTR("actionIdentifiersRequiringAuthentication"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresODIAssessment, CFSTR("requiresODIAssessment"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplication)featureApplication
{
  return self->_featureApplication;
}

- (PKAccount)account
{
  return self->_account;
}

- (unint64_t)requiredDeviceMetadataFields
{
  return self->_requiredDeviceMetadataFields;
}

- (BOOL)requiresODIAssessment
{
  return self->_requiresODIAssessment;
}

- (NSSet)actionIdentifiersRequiringAuthentication
{
  return self->_actionIdentifiersRequiringAuthentication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifiersRequiringAuthentication, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_featureApplication, 0);
}

@end
