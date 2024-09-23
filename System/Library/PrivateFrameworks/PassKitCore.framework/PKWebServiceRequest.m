@implementation PKWebServiceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKWebServiceRequest)initWithCoder:(id)a3
{
  id v4;
  PKWebServiceRequest *v5;
  uint64_t v6;
  NSString *boundInterfaceIdentifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *diagnosticReasonsList;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKWebServiceRequest;
  v5 = -[PKWebServiceRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boundInterfaceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    boundInterfaceIdentifier = v5->_boundInterfaceIdentifier;
    v5->_boundInterfaceIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("diagnosticReasonsList"));
    v11 = objc_claimAutoreleasedReturnValue();
    diagnosticReasonsList = v5->_diagnosticReasonsList;
    v5->_diagnosticReasonsList = (NSMutableArray *)v11;

    v5->_cachePolicyOverride = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cachePolicyOverride"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeoutOverride"));
    v5->_timeoutOverride = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *boundInterfaceIdentifier;
  id v5;

  boundInterfaceIdentifier = self->_boundInterfaceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", boundInterfaceIdentifier, CFSTR("boundInterfaceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diagnosticReasonsList, CFSTR("diagnosticReasonsList"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cachePolicyOverride, CFSTR("cachePolicyOverride"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeoutOverride"), self->_timeoutOverride);

}

+ (id)_HTTPBodyWithDictionary:(id)a3
{
  void *v3;
  id v4;
  id v6;

  if (a3)
  {
    v6 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (!v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Could not create ; data for %@: %@"),
        objc_opt_class(),
        v4);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)addDiagnosticReason:(id)a3
{
  id v4;
  NSMutableArray *diagnosticReasonsList;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    diagnosticReasonsList = self->_diagnosticReasonsList;
    v8 = v4;
    if (!diagnosticReasonsList)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_diagnosticReasonsList;
      self->_diagnosticReasonsList = v6;

      diagnosticReasonsList = self->_diagnosticReasonsList;
    }
    -[NSMutableArray addObject:](diagnosticReasonsList, "addObject:", v8);
    v4 = v8;
  }

}

- (void)setDiagnosticReasons:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *diagnosticReasonsList;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  diagnosticReasonsList = self->_diagnosticReasonsList;
  self->_diagnosticReasonsList = v4;

}

- (NSArray)diagnosticReasons
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_diagnosticReasonsList, "copy");
}

- (id)_murlRequestWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *sourceApplicationIdentifier;
  uint8_t v12[16];

  v4 = a3;
  if (!v4)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_18FC92000, v5, OS_LOG_TYPE_ERROR, "Warning: No url passed when creating NSMutableURLRequest. The NSURLRequest should not be performed while the URL remains nil.", v12, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C92C28], "requestWithURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPaymentDevice clientInfoHTTPHeader](PKPaymentDevice, "clientInfoHTTPHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forHTTPHeaderField:", v7, CFSTR("X-Apple-Client-Info"));

  +[PKPaymentDevice clientHardwarePlatformInfoHTTPHeader](PKPaymentDevice, "clientHardwarePlatformInfoHTTPHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", v8, CFSTR("x-apple-soc-type"));
  if (os_variant_has_internal_ui())
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", CFSTR("true"), CFSTR("X-Apple-Internal-Install"));
  if (-[NSMutableArray count](self->_diagnosticReasonsList, "count"))
  {
    -[NSMutableArray componentsJoinedByString:](self->_diagnosticReasonsList, "componentsJoinedByString:", CFSTR(", "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "setValue:forHTTPHeaderField:", v9, CFSTR("X-Apple-Diagnostic-Reasons"));

  }
  if (self->_cachePolicyOverride)
    objc_msgSend(v6, "setCachePolicy:");
  if (self->_timeoutOverride > 0.0)
    objc_msgSend(v6, "setTimeoutInterval:");
  sourceApplicationIdentifier = self->_sourceApplicationIdentifier;
  if (sourceApplicationIdentifier)
    objc_msgSend(v6, "setValue:forHTTPHeaderField:", sourceApplicationIdentifier, CFSTR("x-apple-forwarded-for-application-identifier"));
  objc_msgSend(v6, "setBoundInterfaceIdentifier:", self->_boundInterfaceIdentifier);

  return v6;
}

- (id)_murlRequestWithURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a4;
  -[PKWebServiceRequest _murlRequestWithURL:](self, "_murlRequestWithURL:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "authorizationHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v7, "setValue:forHTTPHeaderField:", v8, CFSTR("Authorization"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "pk_deviceLanguage");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v9, "length"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Error: No device language returned. Defaulting to en", v12, 2u);
    }

    v9 = CFSTR("en");
  }
  objc_msgSend(v7, "setValue:forHTTPHeaderField:", v9, CFSTR("Accept-Language"));

  return v7;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  void *v38;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v40 = a5;
  v36 = a6;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v46;
    do
    {
      v14 = 0;
      v15 = v9;
      do
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByAddingPercentEncodingWithAllowedCharacters:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLByAppendingPathComponent:", v18);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v9;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v12);
  }
  v38 = v10;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(v40, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v42;
    v24 = CFSTR("?");
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v26, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "appendFormat:", CFSTR("%@%@=%@"), v24, v27, v29);
        v24 = CFSTR("&");
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v22);
  }

  objc_msgSend(v9, "absoluteString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v30, "stringByAppendingString:", v19);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLWithString:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKWebServiceRequest _murlRequestWithURL:appleAccountInformation:](self, "_murlRequestWithURL:appleAccountInformation:", v33, v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (NSString)boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)cachePolicyOverride
{
  return self->_cachePolicyOverride;
}

- (void)setCachePolicyOverride:(unint64_t)a3
{
  self->_cachePolicyOverride = a3;
}

- (double)timeoutOverride
{
  return self->_timeoutOverride;
}

- (void)setTimeoutOverride:(double)a3
{
  self->_timeoutOverride = a3;
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_boundInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_diagnosticReasonsList, 0);
}

@end
