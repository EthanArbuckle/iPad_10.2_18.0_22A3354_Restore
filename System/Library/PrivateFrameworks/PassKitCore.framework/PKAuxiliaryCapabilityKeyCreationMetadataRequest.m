@implementation PKAuxiliaryCapabilityKeyCreationMetadataRequest

- (PKAuxiliaryCapabilityKeyCreationMetadataRequest)init
{

  return 0;
}

- (PKAuxiliaryCapabilityKeyCreationMetadataRequest)initWithCapabilityStates:(id)a3 pass:(id)a4
{
  id v7;
  id v8;
  PKAuxiliaryCapabilityKeyCreationMetadataRequest *v9;
  PKAuxiliaryCapabilityKeyCreationMetadataRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataRequest;
  v9 = -[PKAuxiliaryCapabilityWebServiceRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_capabilityStates, a3);
    -[PKAuxiliaryCapabilityWebServiceRequest setPass:](v10, "setPass:", v8);
  }

  return v10;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32[0] = CFSTR("devices");
  v32[1] = v9;
  v25 = v9;
  v32[2] = CFSTR("auxiliaryCapabilityKeyCreationMetadata");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  -[PKAuxiliaryCapabilityWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v8, v11, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray pk_arrayByApplyingBlock:](self->_capabilityStates, "pk_arrayByApplyingBlock:", &__block_literal_global_39);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("capabilityStates"));

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PKAuxiliaryCapabilityWebServiceRequest pass](self, "pass");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "devicePaymentApplications");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v21), "dpanIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v19);
  }

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("dpanIdentifiers"));
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPBody:", v23);

  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  return v12;
}

uint64_t __118__PKAuxiliaryCapabilityKeyCreationMetadataRequest__urlRequestWithServiceURL_deviceIdentifier_appleAccountInformation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSArray)capabilityStates
{
  return self->_capabilityStates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityStates, 0);
}

@end
