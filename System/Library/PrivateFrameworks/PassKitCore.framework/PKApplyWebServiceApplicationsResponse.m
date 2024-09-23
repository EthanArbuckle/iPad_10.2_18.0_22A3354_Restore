@implementation PKApplyWebServiceApplicationsResponse

- (PKApplyWebServiceApplicationsResponse)initWithData:(id)a3
{
  PKApplyWebServiceApplicationsResponse *v3;
  PKApplyWebServiceApplicationsResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *lastUpdated;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PKFeatureApplication *v16;
  PKFeatureApplication *v17;
  uint64_t v18;
  NSArray *allFeatureApplications;
  void *v20;
  PKFeatureFailureCollection *v21;
  PKFeatureFailureCollection *featureFailures;
  PKApplyWebServiceApplicationsResponse *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)PKApplyWebServiceApplicationsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v39, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("applications"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "PKStringForKey:", CFSTR("lastUpdated"));
        v7 = objc_claimAutoreleasedReturnValue();
        lastUpdated = v4->_lastUpdated;
        v4->_lastUpdated = (NSString *)v7;

        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v10 = v6;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v36;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v36 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v14);
              v16 = [PKFeatureApplication alloc];
              v17 = -[PKFeatureApplication initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v35);
              if (v17)
                objc_msgSend(v9, "addObject:", v17);

              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v12);
        }

        v18 = objc_msgSend(v9, "copy");
        allFeatureApplications = v4->_allFeatureApplications;
        v4->_allFeatureApplications = (NSArray *)v18;

        objc_msgSend(v5, "objectForKey:", CFSTR("featureFailures"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = -[PKFeatureFailureCollection initWithArray:]([PKFeatureFailureCollection alloc], "initWithArray:", v20);
            featureFailures = v4->_featureFailures;
            v4->_featureFailures = v21;

          }
        }

        goto LABEL_17;
      }
      PKLogFacilityTypeGetObject(0xDuLL);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v31;
        v43 = 2114;
        v44 = v33;
        _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0xDuLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v26;
        v43 = 2114;
        v44 = v28;
        _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

    v23 = 0;
    goto LABEL_25;
  }
LABEL_17:
  v23 = v4;
LABEL_25:

  return v23;
}

- (PKApplyWebServiceApplicationsResponse)initWithCoder:(id)a3
{
  id v4;
  PKApplyWebServiceApplicationsResponse *v5;
  uint64_t v6;
  NSString *lastUpdated;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *allFeatureApplications;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyWebServiceApplicationsResponse;
  v5 = -[PKWebServiceResponse initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("allFeatureApplications"));
    v11 = objc_claimAutoreleasedReturnValue();
    allFeatureApplications = v5->_allFeatureApplications;
    v5->_allFeatureApplications = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplicationsResponse;
  v4 = a3;
  -[PKWebServiceResponse encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allFeatureApplications, CFSTR("allFeatureApplications"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastUpdated, CFSTR("allFeatureApplications"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)allFeatureApplications
{
  return self->_allFeatureApplications;
}

- (PKFeatureFailureCollection)featureFailures
{
  return self->_featureFailures;
}

- (NSString)lastUpdated
{
  return self->_lastUpdated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_featureFailures, 0);
  objc_storeStrong((id *)&self->_allFeatureApplications, 0);
}

@end
