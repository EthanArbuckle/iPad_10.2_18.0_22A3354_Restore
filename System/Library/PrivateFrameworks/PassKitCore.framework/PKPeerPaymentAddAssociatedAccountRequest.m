@implementation PKPeerPaymentAddAssociatedAccountRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *altDSID;
  NSString *firstName;
  NSString *lastName;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  int v24;
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v20;
    v26 = 2082;
    v27 = "url";
LABEL_17:
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v24, 0x16u);

    goto LABEL_18;
  }
  if (!v7)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v20;
    v26 = 2082;
    v27 = "appleAccountInformation";
    goto LABEL_17;
  }
  if (!self->_altDSID)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v20;
      v26 = 2082;
      v27 = "_altDSID";
      goto LABEL_17;
    }
LABEL_18:

    v17 = 0;
    goto LABEL_19;
  }
  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v6, &unk_1E2C3E788, 0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  altDSID = self->_altDSID;
  if (altDSID)
    objc_msgSend(v10, "setObject:forKey:", altDSID, CFSTR("altDSID"));
  firstName = self->_firstName;
  if (firstName)
    objc_msgSend(v11, "setObject:forKey:", firstName, CFSTR("firstName"));
  lastName = self->_lastName;
  if (lastName)
    objc_msgSend(v11, "setObject:forKey:", lastName, CFSTR("lastName"));
  PKPeerPaymentAccountRoleToString(self->_role);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("role"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHTTPBody:", v16);

  v17 = (void *)objc_msgSend(v9, "copy");
LABEL_19:

  return v17;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
