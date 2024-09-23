@implementation PKPaymentServiceProviderPerformPaymentRequest

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 webService:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  PKPaymentPass *pass;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSData *nonce;
  void *v25;
  void *v26;
  void *v27;
  NSString *deviceAssessments;
  NSString *shippingAddressHash;
  NSString *targetDeviceSerialNumber;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[7];

  v43[6] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a7;
  v43[0] = CFSTR("devices");
  v43[1] = v12;
  v38 = v12;
  v43[2] = CFSTR("passes");
  pass = self->_pass;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  -[PKPass passTypeIdentifier](pass, "passTypeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v18;
  -[PKPass serialNumber](self->_pass, "serialNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v19;
  v43[5] = CFSTR("performPayment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v17, v20, 0, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v21, "setValue:forHTTPHeaderField:", CFSTR("application/binary"), CFSTR("Content-Type"));
  objc_msgSend(v16, "authorizationHeader");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setValue:forHTTPHeaderField:", v22, CFSTR("Authorization"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  nonce = self->_nonce;
  if (nonce)
  {
    -[NSData hexEncoding](nonce, "hexEncoding", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("nOnce"));

  }
  -[PKPaymentServiceProviderPerformPaymentRequest serviceProviderOrder](self, "serviceProviderOrder", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("order"));
  if (_os_feature_enabled_impl())
  {
    deviceAssessments = self->_deviceAssessments;
    if (deviceAssessments)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", deviceAssessments, CFSTR("deviceAssessments"));
    shippingAddressHash = self->_shippingAddressHash;
    if (shippingAddressHash)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", shippingAddressHash, CFSTR("shippingAddressHash"));
  }
  targetDeviceSerialNumber = self->_targetDeviceSerialNumber;
  if (targetDeviceSerialNumber)
    objc_msgSend(v23, "setObject:forKeyedSubscript:", targetDeviceSerialNumber, CFSTR("targetDeviceSerialNumber"));
  PKPaymentCryptogramTypeToString(self->_cryptogramType);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, CFSTR("cryptogramType"));

  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setHTTPBody:", v32);

  objc_msgSend(v21, "HTTPBody");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "SHA256Hash");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "targetDevice");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __138__PKPaymentServiceProviderPerformPaymentRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_webService_completion___block_invoke;
  v40[3] = &unk_1E2ABDB80;
  v41 = v21;
  v42 = v13;
  v36 = v13;
  v37 = v21;
  objc_msgSend(v35, "paymentWebService:signData:signatureEntanglementMode:withCompletionHandler:", v15, v34, 0, v40);

}

uint64_t __138__PKPaymentServiceProviderPerformPaymentRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_webService_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v6, "certificates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "certificateOfType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v9, CFSTR("CASD-ECC"));

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "certificates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "certificateOfType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forHTTPHeaderField:", v12, CFSTR("CASD-RSA"));

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v7, "base64EncodedStringWithOptions:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setValue:forHTTPHeaderField:", v14, CFSTR("PayloadSignature"));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKServiceProviderOrder)serviceProviderOrder
{
  return self->_serviceProviderOrder;
}

- (void)setServiceProviderOrder:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProviderOrder, a3);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)targetDeviceSerialNumber
{
  return self->_targetDeviceSerialNumber;
}

- (void)setTargetDeviceSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(int64_t)a3
{
  self->_cryptogramType = a3;
}

- (NSString)shippingAddressHash
{
  return self->_shippingAddressHash;
}

- (void)setShippingAddressHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)deviceAssessments
{
  return self->_deviceAssessments;
}

- (void)setDeviceAssessments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceAssessments, 0);
  objc_storeStrong((id *)&self->_shippingAddressHash, 0);
  objc_storeStrong((id *)&self->_targetDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_serviceProviderOrder, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
