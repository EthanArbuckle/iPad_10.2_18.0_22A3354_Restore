@implementation PKPaymentRemoteContentPassActionGroupResponse

- (PKPaymentRemoteContentPassActionGroupResponse)initWithExistingActionGroup:(id)a3 data:(id)a4 pass:(id)a5
{
  id v7;
  PKPaymentRemoteContentPassActionGroupResponse *v8;
  PKPaymentRemoteContentPassActionGroupResponse *v9;
  void *v10;
  PKPaymentRemoteContentPassActionGroupResponse *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  PKPaymentPassActionGroup *v15;
  PKPaymentPassActionGroup *updatedActionGroup;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  PKPaymentPassAction *v23;
  PKPaymentPassActionGroup *v24;
  void *v25;
  NSObject *v26;
  PKPaymentRemoteContentPassActionGroupResponse *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PKPaymentRemoteContentPassActionGroupResponse;
  v8 = -[PKWebServiceResponse initWithData:](&v39, sel_initWithData_, a4);
  v9 = v8;
  if (v8)
  {
    -[PKWebServiceResponse JSONObject](v8, "JSONObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v10;
      v11 = v10;
      -[PKPaymentRemoteContentPassActionGroupResponse PKDictionaryForKey:](v11, "PKDictionaryForKey:", CFSTR("actionGroup"));
      v12 = objc_claimAutoreleasedReturnValue();
      -[PKPaymentRemoteContentPassActionGroupResponse PKArrayForKey:](v11, "PKArrayForKey:", CFSTR("actions"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionLocalizations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v12;
      v15 = -[PKPaymentPassActionGroup initWithDictionary:localizations:]([PKPaymentPassActionGroup alloc], "initWithDictionary:localizations:", v12, v14);
      updatedActionGroup = v9->_updatedActionGroup;
      v9->_updatedActionGroup = v15;

      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v36 != v21)
              objc_enumerationMutation(v18);
            v23 = -[PKPaymentPassAction initWithDictionary:localizations:]([PKPaymentPassAction alloc], "initWithDictionary:localizations:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), v14);
            objc_msgSend(v17, "safelyAddObject:", v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
        }
        while (v20);
      }

      v24 = v9->_updatedActionGroup;
      v25 = (void *)objc_msgSend(v17, "copy");
      -[PKPaymentPassActionGroup setActions:](v24, "setActions:", v25);

      v10 = v34;
      v27 = v11;
      v26 = v33;
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v41 = v29;
        v42 = 2112;
        v43 = v30;
        v31 = v30;
        _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v27 = v9;
      v9 = 0;
    }

  }
  return v9;
}

- (PKPaymentPassActionGroup)updatedActionGroup
{
  return self->_updatedActionGroup;
}

- (void)setUpdatedActionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_updatedActionGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedActionGroup, 0);
}

@end
