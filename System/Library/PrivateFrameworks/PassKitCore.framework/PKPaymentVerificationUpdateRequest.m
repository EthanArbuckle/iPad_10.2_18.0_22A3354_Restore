@implementation PKPaymentVerificationUpdateRequest

- (void)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5 deviceData:(id)a6 webService:(id)a7 certChain:(id)a8 devSigned:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSString *stepIdentifier;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *context;
  id v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  _QWORD v69[8];

  v69[6] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v60 = a7;
  v20 = a8;
  v59 = a10;
  v69[0] = CFSTR("devices");
  v69[1] = v17;
  v62 = v17;
  v69[2] = CFSTR("passes");
  -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v21;
  -[PKPass serialNumber](self->_pass, "serialNumber");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v69[4] = v22;
  v69[5] = CFSTR("activation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v16;
  v61 = v18;
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v16, v23, 0, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v24, "setValue:forHTTPHeaderField:", CFSTR("application/binary"), CFSTR("Content-Type"));
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = v25;
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier)
    objc_msgSend(v25, "setObject:forKey:", stepIdentifier, CFSTR("stepIdentifier"));
  -[PKVerificationChannel identifier](self->_channel, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[PKVerificationChannel identifier](self->_channel, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("methodIdentifier"));

    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHTTPBody:", v30);

    v31 = (void *)objc_msgSend(v24, "copy");
    v32 = v59;
    (*((void (**)(id, void *))v59 + 2))(v59, v31);

    v33 = v19;
    v34 = v60;
    v35 = v20;
    goto LABEL_28;
  }
  if (-[PKOverlayableWebServiceRequest hasOverlayParameters](self, "hasOverlayParameters"))
  {
    v36 = (void *)MEMORY[0x19400CFE8]();
    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[PKOverlayableWebServiceRequest _applySecureOverlayToDictionary:](self, "_applySecureOverlayToDictionary:", v37);
    v33 = v19;
    if (objc_msgSend(v37, "count"))
    {
      context = v36;
      objc_msgSend(v19, "primaryJSBLSequenceCounter");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v20;
      v40 = v39;
      if (v39)
      {
        objc_msgSend(v39, "dataUsingEncoding:", 4);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "hexEncoding");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v42, CFSTR("jsblSequenceCounter"));

      }
      -[PKSecureElementPass deviceAccountIdentifier](self->_pass, "deviceAccountIdentifier");
      v43 = objc_claimAutoreleasedReturnValue();
      if (v43)
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v43, CFSTR("DPANIdentifier"));
      v55 = (void *)v43;
      v56 = v40;
      PKLogFacilityTypeGetObject(6uLL);
      v44 = objc_claimAutoreleasedReturnValue();
      v34 = v60;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v37, "allKeys");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v68 = v45;
        _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Encrypted Activation Fields: %@", buf, 0xCu);

      }
      objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v37);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      PKPaymentEncryptDataWithCertChain(v46, v35, a9, &v66);
      v47 = objc_claimAutoreleasedReturnValue();
      v58 = v66;

      if (v47)
      {

        objc_autoreleasePoolPop(context);
        v48 = (void *)v47;
        v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v47, 4);
        objc_msgSend(v26, "setValue:forKey:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
        objc_msgSend(v26, "setValue:forKey:", v49, CFSTR("encryptedCardData"));
        v50 = v58;
        objc_msgSend(v58, "hexEncoding");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setValue:forKey:", v51, CFSTR("publicKeyHash"));

        -[PKOverlayableWebServiceRequest _applyOverlayToDictionary:](self, "_applyOverlayToDictionary:", v26);
        objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v26);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setHTTPBody:", v52);

        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __158__PKPaymentVerificationUpdateRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_deviceData_webService_certChain_devSigned_completion___block_invoke;
        v64[3] = &unk_1E2AD44F0;
        v32 = v59;
        v65 = v59;
        -[PKPaymentWebServiceRequest _signRequest:webService:completion:](self, "_signRequest:webService:completion:", v24, v60, v64);

        goto LABEL_25;
      }
      v36 = context;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v44, OS_LOG_TYPE_DEFAULT, "Error: Failed to generate activation request encryptedCardData. This is bad!", buf, 2u);
      }

    }
    else
    {
      v58 = 0;
      v34 = v60;
      v35 = v20;
    }

    objc_autoreleasePoolPop(v36);
    -[PKOverlayableWebServiceRequest _applyOverlayToDictionary:](self, "_applyOverlayToDictionary:", v26);
    objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v26);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setHTTPBody:", v54);

    v32 = v59;
    if (!v59)
    {
      v50 = v58;
      goto LABEL_27;
    }
    v48 = (void *)objc_msgSend(v24, "copy");
    (*((void (**)(id, void *))v59 + 2))(v59, v48);
    v50 = v58;
LABEL_25:

LABEL_27:
    goto LABEL_28;
  }
  PKLogFacilityTypeGetObject(0);
  v53 = objc_claimAutoreleasedReturnValue();
  v33 = v19;
  v34 = v60;
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FC92000, v53, OS_LOG_TYPE_ERROR, "Could not generate request, no overlay, no channel identifier. Returning nil", buf, 2u);
  }

  v35 = v20;
  v32 = v59;
  if (v59)
    (*((void (**)(id, _QWORD))v59 + 2))(v59, 0);
LABEL_28:

}

void __158__PKPaymentVerificationUpdateRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation_deviceData_webService_certChain_devSigned_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (id)objc_msgSend(a2, "copy");
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (PKVerificationChannel)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
}

@end
