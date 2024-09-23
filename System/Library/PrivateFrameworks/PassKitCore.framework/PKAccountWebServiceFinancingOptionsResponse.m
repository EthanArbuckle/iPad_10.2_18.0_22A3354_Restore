@implementation PKAccountWebServiceFinancingOptionsResponse

- (PKAccountWebServiceFinancingOptionsResponse)initWithData:(id)a3
{
  PKAccountWebServiceFinancingOptionsResponse *v3;
  PKAccountWebServiceFinancingOptionsResponse *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  PKPayLaterProductAssessmentCollection *v8;
  PKPayLaterProductAssessmentCollection *assessmentCollection;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  PKAccountPaymentFundingSource *v19;
  uint64_t v20;
  void *v21;
  objc_class *v22;
  NSObject *v23;
  objc_class *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  objc_class *v29;
  PKAccountWebServiceFinancingOptionsResponse *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  id v39;
  PKPayLaterLastUsedFundingSource *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  PKPayLaterDynamicContent *v44;
  PKPayLaterDynamicContent *dynamicContent;
  uint64_t v46;
  NSString *sessionIdentifier;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  _BOOL8 v51;
  char v52;
  __CFString *v53;
  __CFString *v54;
  int v55;
  void *v57;
  NSObject *v58;
  PKAccountWebServiceFinancingOptionsResponse *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  NSObject *v73;
  __int16 v74;
  NSObject *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v69.receiver = self;
  v69.super_class = (Class)PKAccountWebServiceFinancingOptionsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v69, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
  {
LABEL_57:
    v30 = v4;
    goto LABEL_58;
  }
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("productAssessments"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      if (-[NSObject count](v7, "count"))
      {
        v8 = -[PKPayLaterProductAssessmentCollection initWithArray:]([PKPayLaterProductAssessmentCollection alloc], "initWithArray:", v7);
        assessmentCollection = v4->_assessmentCollection;
        v4->_assessmentCollection = v8;

      }
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "objectForKey:", CFSTR("acceptedFundingSources"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v60 = v11;
      v58 = v7;
      v59 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;
        v65 = 0u;
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v66 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = v17;
                v19 = -[PKAccountPaymentFundingSource initWithDictionary:]([PKAccountPaymentFundingSource alloc], "initWithDictionary:", v18);

                objc_msgSend(v10, "safelyAddObject:", v19);
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          }
          while (v14);
        }

        v4 = v59;
      }
      v20 = objc_msgSend(v10, "count");
      if (v20)
        v21 = (void *)objc_msgSend(v10, "copy");
      else
        v21 = 0;
      objc_storeStrong((id *)&v4->_acceptedFundingSources, v21);
      if (v20)

      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "objectForKey:", CFSTR("lastUsedFundingSources"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v57 = v5;
        v33 = v32;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v62;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v62 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = v38;
                v40 = -[PKPayLaterLastUsedFundingSource initWithDictionary:]([PKPayLaterLastUsedFundingSource alloc], "initWithDictionary:", v39);

                objc_msgSend(v31, "safelyAddObject:", v40);
              }
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
          }
          while (v35);
        }

        v7 = v58;
        v4 = v59;
        v5 = v57;
      }
      v41 = objc_msgSend(v31, "count");
      if (v41)
        v42 = (void *)objc_msgSend(v31, "copy");
      else
        v42 = 0;
      objc_storeStrong((id *)&v4->_lastUsedFundingSources, v42);
      if (v41)

      objc_msgSend(v5, "objectForKey:", CFSTR("dynamicContent"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = -[PKPayLaterDynamicContent initWithDictionary:]([PKPayLaterDynamicContent alloc], "initWithDictionary:", v43);
        dynamicContent = v4->_dynamicContent;
        v4->_dynamicContent = v44;

      }
      objc_msgSend(v5, "PKStringForKey:", CFSTR("sessionIdentifier"));
      v46 = objc_claimAutoreleasedReturnValue();
      sessionIdentifier = v4->_sessionIdentifier;
      v4->_sessionIdentifier = (NSString *)v46;

      v48 = v5;
      objc_msgSend(v5, "PKStringForKey:", CFSTR("languageDisclosureLocation"));
      v49 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      v51 = 0;
      if (v49 != CFSTR("tabAction") && v49)
      {
        v52 = objc_msgSend(CFSTR("tabAction"), "isEqualToString:", v49);

        if ((v52 & 1) != 0)
        {
          v51 = 0;
        }
        else
        {
          v53 = v50;
          v51 = 1;
          if (v53 != CFSTR("continueAction"))
          {
            v54 = v53;
            v55 = objc_msgSend(CFSTR("continueAction"), "isEqualToString:", v53);

            if (!v55)
              v51 = 0;
          }
          v4 = v59;
        }
      }

      v4->_languageDisclosureLocation = v51;
      goto LABEL_57;
    }
    PKLogFacilityTypeGetObject(0xEuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v73 = v25;
    v26 = "Malformed productAssessments array: expected array and received %{public}@";
    v27 = v23;
    v28 = 12;
LABEL_23:
    _os_log_impl(&dword_18FC92000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);

LABEL_24:
    goto LABEL_25;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v73 = v23;
    v74 = 2114;
    v75 = v25;
    v26 = "Malformed %{public}@: expected dictionary and received %{public}@";
    v27 = v6;
    v28 = 22;
    goto LABEL_23;
  }
LABEL_25:

  v30 = 0;
LABEL_58:

  return v30;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  return self->_assessmentCollection;
}

- (NSArray)acceptedFundingSources
{
  return self->_acceptedFundingSources;
}

- (NSArray)lastUsedFundingSources
{
  return self->_lastUsedFundingSources;
}

- (PKPayLaterDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (unint64_t)languageDisclosureLocation
{
  return self->_languageDisclosureLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_lastUsedFundingSources, 0);
  objc_storeStrong((id *)&self->_acceptedFundingSources, 0);
  objc_storeStrong((id *)&self->_assessmentCollection, 0);
}

@end
