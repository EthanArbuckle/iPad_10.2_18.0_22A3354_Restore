@implementation PKPeerPaymentServiceRegistrationRequest

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 deviceIdentifier:(id)a5 deviceScore:(id)a6 odiAssessment:(id)a7 deviceMetadata:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  PKPeerPaymentDeviceRegistrationData *deviceData;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSString *pushToken;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  objc_class *v39;
  objc_class *v40;
  objc_class *v41;
  objc_class *v42;
  objc_class *v43;
  objc_class *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (!v14)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    v52 = 2082;
    v53 = "url";
LABEL_35:
    _os_log_impl(&dword_18FC92000, v36, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", buf, 0x16u);

    goto LABEL_36;
  }
  if (!v15)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    v52 = 2082;
    v53 = "appleAccountInformation";
    goto LABEL_35;
  }
  if (!v19)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    v52 = 2082;
    v53 = "deviceMetadata";
    goto LABEL_35;
  }
  if (!self->_pushToken)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    v52 = 2082;
    v53 = "_pushToken";
    goto LABEL_35;
  }
  deviceData = self->_deviceData;
  if (!deviceData)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    v52 = 2082;
    v53 = "_deviceData";
    goto LABEL_35;
  }
  -[PKPeerPaymentDeviceRegistrationData signedAuthToken](deviceData, "signedAuthToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v38;
    v52 = 2082;
    v53 = "[_deviceData signedAuthToken]";
    goto LABEL_35;
  }
  -[PKPeerPaymentDeviceRegistrationData enrollmentData](self->_deviceData, "enrollmentData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    PKLogFacilityTypeGetObject(0xBuLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v38;
      v52 = 2082;
      v53 = "[_deviceData enrollmentData]";
      goto LABEL_35;
    }
LABEL_36:

    v35 = 0;
    goto LABEL_37;
  }
  v49 = v16;
  -[PKPeerPaymentDeviceRegistrationData authorizationHeader](self->_deviceData, "authorizationHeader");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAuthorizationHeader:", v24);

  -[PKPeerPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v14, &unk_1E2C3E5D8, 0, v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v25, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  v48 = v25;
  objc_msgSend(v25, "setCachePolicy:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPeerPaymentDeviceRegistrationData enrollmentData](self->_deviceData, "enrollmentData");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  PKSerialNumber();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("deviceSerialNumber"));

  PKProductType();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("productType"));

  -[PKPeerPaymentDeviceRegistrationData companionSerialNumber](self->_deviceData, "companionSerialNumber");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("companionSerialNumber"));
  -[PKPeerPaymentDeviceRegistrationData signedAuthToken](self->_deviceData, "signedAuthToken");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v26, "setObject:forKey:", v30, CFSTR("signedAuthToken"));
  pushToken = self->_pushToken;
  if (pushToken)
    objc_msgSend(v26, "setObject:forKey:", pushToken, CFSTR("pushToken"));
  v46 = (void *)v29;
  if (v47)
    objc_msgSend(v26, "setObject:forKey:", v47, CFSTR("enrollmentData"));
  if (v17)
  {
    objc_msgSend(v17, "hexEncoding");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v32, CFSTR("deviceScore"));

  }
  if (v18)
    objc_msgSend(v26, "setObject:forKey:", v18, CFSTR("odiAssessment"));
  objc_msgSend(v20, "dictionaryRepresentation");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v33, CFSTR("deviceMetadata"));

  objc_msgSend(MEMORY[0x1E0C92C78], "setProperty:forKey:inRequest:", &unk_1E2C3F808, CFSTR("PKPeerPaymentEndPointKey"), v48);
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v26);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setHTTPBody:", v34);

  v35 = (void *)objc_msgSend(v48, "copy");
  v16 = v49;
LABEL_37:

  return v35;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKPeerPaymentDeviceRegistrationData)deviceData
{
  return self->_deviceData;
}

- (void)setDeviceData:(id)a3
{
  objc_storeStrong((id *)&self->_deviceData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceData, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end
