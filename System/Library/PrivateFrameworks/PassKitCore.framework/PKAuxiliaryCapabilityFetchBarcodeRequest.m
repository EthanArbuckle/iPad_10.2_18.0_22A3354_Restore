@implementation PKAuxiliaryCapabilityFetchBarcodeRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  unint64_t fetchReason;
  void *v20;
  NSString *lastUsedBarcodeIdentifier;
  void *v22;
  void *v23;
  _QWORD v25[8];

  v25[7] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[PKAuxiliaryCapabilityWebServiceRequest pass](self, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passTypeIdentifier", CFSTR("devices"), v8, CFSTR("passes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v12;
  objc_msgSend(v11, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v25[5] = CFSTR("barcodes");
  v25[6] = CFSTR("fetchBarcodes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAuxiliaryCapabilityWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v10, v14, 0, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;
  v18 = 0;
  fetchReason = self->_fetchReason;
  if (fetchReason <= 3)
    v18 = off_1E2AC6240[fetchReason];
  objc_msgSend(v16, "setObject:forKey:", self->_dpanIdentifier, CFSTR("dpanIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_barcodeCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v20, CFSTR("barcodeCount"));

  lastUsedBarcodeIdentifier = self->_lastUsedBarcodeIdentifier;
  if (lastUsedBarcodeIdentifier)
    objc_msgSend(v17, "setObject:forKey:", lastUsedBarcodeIdentifier, CFSTR("lastUsedBarcodeIdentifier"));
  -[NSArray pk_arrayByApplyingBlock:](self->_encryptionCertificateChain, "pk_arrayByApplyingBlock:", &__block_literal_global_137_0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", v22, CFSTR("encryptionCertificateChain"));
  objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("fetchReason"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHTTPBody:", v23);

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", v18, CFSTR("X-Apple-Barcode-Fetch-Reason"));
  PKUpdateURLRequestWithSignatureDataAndInfo(v15, self->_signatureData, self->_signatureInfo);

  return v15;
}

uint64_t __111__PKAuxiliaryCapabilityFetchBarcodeRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

- (id)_dataToSign
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[NSString dataUsingEncoding:](self->_dpanIdentifier, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), self->_barcodeCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v6);

  objc_msgSend(v3, "SHA256Hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)barcodeCount
{
  return self->_barcodeCount;
}

- (void)setBarcodeCount:(int64_t)a3
{
  self->_barcodeCount = a3;
}

- (NSString)lastUsedBarcodeIdentifier
{
  return self->_lastUsedBarcodeIdentifier;
}

- (void)setLastUsedBarcodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)encryptionCertificateChain
{
  return self->_encryptionCertificateChain;
}

- (void)setEncryptionCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)fetchReason
{
  return self->_fetchReason;
}

- (void)setFetchReason:(int64_t)a3
{
  self->_fetchReason = a3;
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (PKSecureElementSignatureInfo)signatureInfo
{
  return self->_signatureInfo;
}

- (void)setSignatureInfo:(id)a3
{
  objc_storeStrong((id *)&self->_signatureInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureInfo, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_encryptionCertificateChain, 0);
  objc_storeStrong((id *)&self->_lastUsedBarcodeIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end
