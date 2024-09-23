@implementation PKPeerPaymentPendingRequestsResponse

- (PKPeerPaymentPendingRequestsResponse)initWithData:(id)a3
{
  PKPeerPaymentPendingRequestsResponse *v3;
  PKPeerPaymentPendingRequestsResponse *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKPeerPaymentPendingRequestSummary *v13;
  uint64_t v14;
  NSArray *requestSummaries;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentPendingRequestsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v24, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[NSObject PKArrayForKey:](v6, "PKArrayForKey:", CFSTR("requests"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(v8);
            v13 = -[PKPeerPaymentPendingRequestSummary initWithDictionary:]([PKPeerPaymentPendingRequestSummary alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12));
            objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
        }
        while (v10);
      }

      v14 = objc_msgSend(v7, "copy");
      requestSummaries = v4->_requestSummaries;
      v4->_requestSummaries = (NSArray *)v14;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        return v4;
      }
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v7;
      v27 = 2114;
      v28 = v18;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  return v4;
}

- (NSArray)requestSummaries
{
  return self->_requestSummaries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestSummaries, 0);
}

@end
