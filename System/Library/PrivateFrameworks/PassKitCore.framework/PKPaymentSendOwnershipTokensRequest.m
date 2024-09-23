@implementation PKPaymentSendOwnershipTokensRequest

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 deviceMetadata:(id)a5 appleAccountInformation:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  unint64_t reason;
  const __CFString *v19;
  id v20;
  NSSet *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39[0] = CFSTR("devices");
  v39[1] = v11;
  v32 = v11;
  v39[2] = CFSTR("ownershipTokens");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v10;
  v31 = v13;
  -[PKPaymentWebServiceRequest _murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:](self, "_murlRequestWithServiceURL:endpointComponents:queryParameters:appleAccountInformation:", v10, v14, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("deviceMetadata"));

  }
  reason = self->_reason;
  if (reason > 2)
    v19 = CFSTR("unknown");
  else
    v19 = off_1E2AD4678[reason];
  objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("reason"));
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v21 = self->_passOwnershipTokens;
  v22 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v35;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v25), "dictionaryRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v20, "count"))
  {
    v27 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(v16, "setObject:forKey:", v27, CFSTR("ownershipTokens"));

  }
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHTTPBody:", v28);

  v29 = (void *)objc_msgSend(v15, "copy");
  return v29;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSSet)passOwnershipTokens
{
  return self->_passOwnershipTokens;
}

- (void)setPassOwnershipTokens:(id)a3
{
  objc_storeStrong((id *)&self->_passOwnershipTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passOwnershipTokens, 0);
}

@end
