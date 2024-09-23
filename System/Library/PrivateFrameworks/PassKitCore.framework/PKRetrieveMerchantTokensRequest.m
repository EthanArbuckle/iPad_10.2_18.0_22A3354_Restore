@implementation PKRetrieveMerchantTokensRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSString *merchantTokenId;
  void *v18;
  void *v19;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v21[0] = CFSTR("passes");
  -[PKPass passTypeIdentifier](self->_pass, "passTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  -[PKPass serialNumber](self->_pass, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v10;
  v21[3] = CFSTR("merchantTokens");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumber stringValue](self->_pageNumber, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("pageNumber"));

  -[NSNumber stringValue](self->_pageSize, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("pageSize"));

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKSecureElementPass primaryAccountIdentifier](self->_pass, "primaryAccountIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("fpanId"));

  merchantTokenId = self->_merchantTokenId;
  if (merchantTokenId)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", merchantTokenId, CFSTR("merchantTokenId"));
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:version:endpointComponents:queryParameters:appleAccountInformation:", v7, CFSTR("1"), v11, v12, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHTTPBody:", v19);

  return v18;
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (NSString)merchantTokenId
{
  return self->_merchantTokenId;
}

- (void)setMerchantTokenId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)pageSize
{
  return self->_pageSize;
}

- (void)setPageSize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageSize, 0);
  objc_storeStrong((id *)&self->_pageNumber, 0);
  objc_storeStrong((id *)&self->_merchantTokenId, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
