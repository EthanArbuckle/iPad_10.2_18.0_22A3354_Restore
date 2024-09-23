@implementation PKAuxiliaryCapabilityRegisterRequest

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
  void *v16;
  NSDictionary *deviceOwnedKeyMaterials;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  id v25;
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PKAuxiliaryCapabilityWebServiceRequest pass](self, "pass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("devices");
  v26[1] = v9;
  v26[2] = CFSTR("passes");
  objc_msgSend(v11, "passTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v12;
  objc_msgSend(v11, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v13;
  v26[5] = CFSTR("register");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAuxiliaryCapabilityWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v10, v14, 0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", self->_validCertificatesOnDevice, CFSTR("validCertificatesOnDevice"));
  objc_msgSend(v16, "setObject:forKey:", self->_dpanIdentifiers, CFSTR("dpanIdentifiers"));
  deviceOwnedKeyMaterials = self->_deviceOwnedKeyMaterials;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __107__PKAuxiliaryCapabilityRegisterRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke;
  v24 = &unk_1E2AC6168;
  v25 = v16;
  v18 = v16;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](deviceOwnedKeyMaterials, "enumerateKeysAndObjectsUsingBlock:", &v21);
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v18, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHTTPBody:", v19);

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  PKUpdateURLRequestWithSignatureDataAndInfo(v15, self->_signatureData, self->_signatureInfo);

  return v15;
}

void __107__PKAuxiliaryCapabilityRegisterRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  PKAuxiliaryCapabilityRoleToString(objc_msgSend(v5, "role"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v11, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v5, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("requirement"));
  objc_msgSend(v7, "addObject:", v9);

}

- (id)_dataToSign
{
  id v3;
  NSArray *dpanIdentifiers;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  dpanIdentifiers = self->_dpanIdentifiers;
  v5 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke;
  v27[3] = &unk_1E2AC6190;
  v6 = v3;
  v28 = v6;
  -[NSArray enumerateObjectsUsingBlock:](dpanIdentifiers, "enumerateObjectsUsingBlock:", v27);
  objc_msgSend(CFSTR("-"), "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_2;
  aBlock[3] = &unk_1E2AC61B8;
  v8 = v6;
  v25 = v8;
  v26 = v7;
  v17 = v5;
  v18 = 3221225472;
  v19 = __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_3;
  v20 = &unk_1E2AC61E0;
  v21 = v8;
  v22 = v7;
  v23 = _Block_copy(aBlock);
  v9 = v23;
  v10 = v8;
  v11 = (void (**)(void *, void *))_Block_copy(&v17);
  -[PKAuxiliaryCapabilityRegisterRequest _groupedKeyMaterial](self, "_groupedKeyMaterial", v17, v18, v19, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("deviceDecryptions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v13);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("deviceSignatures"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v14);

  objc_msgSend(v10, "SHA256Hash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dataUsingEncoding:", 4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendData:", v3);

}

void __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "appendData:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendData:", *(_QWORD *)(a1 + 40));
  }

}

void __51__PKAuxiliaryCapabilityRegisterRequest__dataToSign__block_invoke_3(_QWORD *a1, void *a2)
{
  uint64_t i;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  obj = a2;
  if (obj)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "contents");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "count"))
          {
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v5 = v4;
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v6)
            {
              v7 = v6;
              v8 = *(_QWORD *)v28;
              do
              {
                for (j = 0; j != v7; ++j)
                {
                  if (*(_QWORD *)v28 != v8)
                    objc_enumerationMutation(v5);
                  v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
                  v11 = (void *)a1[4];
                  objc_msgSend(v10, "publicKey");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  v13 = v12;
                  if (!v12)
                    v13 = (void *)a1[5];
                  objc_msgSend(v11, "appendData:", v13);

                  v14 = a1[6];
                  objc_msgSend(v10, "attestation");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

                  v16 = a1[6];
                  objc_msgSend(v10, "secondaryAttestation");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

                  v18 = (void *)a1[4];
                  objc_msgSend(v10, "authorization");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = v19;
                  if (!v19)
                    v20 = (void *)a1[5];
                  objc_msgSend(v18, "appendData:", v20);

                  v21 = (void *)a1[4];
                  objc_msgSend(v10, "signature");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = v22;
                  if (!v22)
                    v23 = (void *)a1[5];
                  objc_msgSend(v21, "appendData:", v23);

                }
                v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              }
              while (v7);
            }

          }
          else
          {
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
            (*(void (**)(void))(a1[6] + 16))();
          }

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v26);
    }
  }

}

- (id)_groupedKeyMaterial
{
  id v3;
  NSDictionary *deviceOwnedKeyMaterials;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  deviceOwnedKeyMaterials = self->_deviceOwnedKeyMaterials;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PKAuxiliaryCapabilityRegisterRequest__groupedKeyMaterial__block_invoke;
  v8[3] = &unk_1E2AC6168;
  v9 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](deviceOwnedKeyMaterials, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

void __59__PKAuxiliaryCapabilityRegisterRequest__groupedKeyMaterial__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  PKAuxiliaryCapabilityRoleToString(objc_msgSend(a2, "role"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(v6, "addObject:", v7);

}

- (NSArray)dpanIdentifiers
{
  return self->_dpanIdentifiers;
}

- (void)setDpanIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)validCertificatesOnDevice
{
  return self->_validCertificatesOnDevice;
}

- (void)setValidCertificatesOnDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDictionary)deviceOwnedKeyMaterials
{
  return self->_deviceOwnedKeyMaterials;
}

- (void)setDeviceOwnedKeyMaterials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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
  objc_storeStrong((id *)&self->_deviceOwnedKeyMaterials, 0);
  objc_storeStrong((id *)&self->_validCertificatesOnDevice, 0);
  objc_storeStrong((id *)&self->_dpanIdentifiers, 0);
}

@end
