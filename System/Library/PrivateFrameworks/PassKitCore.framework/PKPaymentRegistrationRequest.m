@implementation PKPaymentRegistrationRequest

- (id)_requestWithServiceURL:(id)a3 deviceData:(id)a4 pushToken:(id)a5 consistencyData:(id)a6 appleAccountInformation:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = (void *)MEMORY[0x1E0C99DE8];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  objc_msgSend(v13, "arrayWithObject:", CFSTR("devices"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v15)
    objc_msgSend(v18, "addObject:", CFSTR("status"));
  objc_msgSend(v12, "authorizationHeader");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAuthorizationHeader:", v20);

  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v17, v19, 0, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v21, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  objc_msgSend(v21, "setCachePolicy:", 1);
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v22, "safelySetObject:forKey:", v16, CFSTR("pushToken"));

  objc_msgSend(v12, "signedAuthToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v23, CFSTR("signedAuthToken"));

  objc_msgSend(v12, "secureElementStateInformation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v24))
  {
    objc_msgSend(v22, "setObject:forKey:", v24, CFSTR("SELDInfo"));
  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 138412290;
      v39 = v24;
      _os_log_impl(&dword_18FC92000, v25, OS_LOG_TYPE_DEFAULT, "Invalid JSON SELDInfo : %@", (uint8_t *)&v38, 0xCu);
    }

  }
  objc_msgSend(v12, "deviceSerialNumber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v26, CFSTR("deviceSerialNumber"));

  objc_msgSend(v12, "deviceMLBSerialNumber");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v27, CFSTR("deviceMLBSerialNumber"));

  objc_msgSend(v12, "additionalDeviceSerialNumbers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v28, CFSTR("additionalSerialNumbers"));

  objc_msgSend(v12, "companionSerialNumber");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v29, CFSTR("companionSerialNumber"));

  objc_msgSend(v12, "productType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v30, CFSTR("productType"));

  objc_msgSend(v12, "platformData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hexEncoding");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v32, CFSTR("pairedSEP"));

  objc_msgSend(v12, "platformDataSignature");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "hexEncoding");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safelySetObject:forKey:", v34, CFSTR("pairedSEPSignature"));

  objc_msgSend(v22, "safelySetObject:forKey:", v15, CFSTR("consistencyData"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v22);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHTTPBody:", v35);

  v36 = (void *)objc_msgSend(v21, "copy");
  return v36;
}

@end
