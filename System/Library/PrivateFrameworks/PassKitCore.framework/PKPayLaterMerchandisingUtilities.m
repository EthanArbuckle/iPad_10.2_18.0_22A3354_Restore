@implementation PKPayLaterMerchandisingUtilities

- (PKPayLaterMerchandisingUtilities)init
{
  PKPayLaterMerchandisingUtilities *v2;
  uint64_t v3;
  NSURLSession *urlSession;
  uint64_t v5;
  NSLocale *locale;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPayLaterMerchandisingUtilities;
  v2 = -[PKPayLaterMerchandisingUtilities init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C92C98], "sharedSession");
    v3 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v3;

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v5 = objc_claimAutoreleasedReturnValue();
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PKPayLaterMerchandisingUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_269 != -1)
    dispatch_once(&_MergedGlobals_269, block);
  return (id)qword_1ECF22A80;
}

void __50__PKPayLaterMerchandisingUtilities_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1ECF22A80;
  qword_1ECF22A80 = (uint64_t)v1;

}

- (void)merchandisingWidgetHTMLWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  PKPayLaterMerchandisingUtilities *v13;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", objc_msgSend(v6, "environmentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("jsapi");
    v15[1] = CFSTR("v1.1.0");
    v15[2] = CFSTR("apple-pay-sdk.merchandising.js");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPayLaterMerchandisingUtilities _urlWithBaseURL:pathComponents:queryParameters:fragment:](self, "_urlWithBaseURL:pathComponents:queryParameters:fragment:", v8, v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__PKPayLaterMerchandisingUtilities_merchandisingWidgetHTMLWithConfiguration_completion___block_invoke;
    v11[3] = &unk_1E2AD79E8;
    v14 = v7;
    v12 = v6;
    v13 = self;
    -[PKPayLaterMerchandisingUtilities _performWebRequestForURL:completion:](self, "_performWebRequestForURL:completion:", v10, v11);

  }
}

void __88__PKPayLaterMerchandisingUtilities_merchandisingWidgetHTMLWithConfiguration_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = objc_msgSend(v20, "length");
  if (a3 || !v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v20, 4);
    objc_msgSend(*(id *)(a1 + 32), "amountString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterDisplayStyleToString((__CFString *)objc_msgSend(*(id *)(a1 + 32), "displayStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterActionToString((const __CFString *)objc_msgSend(*(id *)(a1 + 32), "action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_localeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currency");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKPayLaterThemeToString((__CFString *)objc_msgSend(*(id *)(a1 + 32), "theme"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E2ADF4C0;
    if (v13)
      v15 = (__CFString *)v13;
    v16 = v15;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("    <html>      <head>        <meta name=\"viewport\"        content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">        <meta name=\"color-scheme\" content=\"dark light\">        <style>  :root { color-scheme: light dark; background: transparent; }                 * { -webkit-touch-callout: none; -webkit-user-select: none; }                 html, body { margin: 0; }        </style>        <script>%@</script>      </head>      <body>        <apple-pay-merchandising            amount=\"%@\"            type=\"%@\"            modal-type=\"%@\"            locale=\"%@\"            country-code=\"%@\"            currency-code=\"%@\"            theme=\"%@\"            merchant-identifier=\"%@\"        >        </apple-pay-merchandising>      </body>    </html>"),
      v19,
      v18,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)merchandisingModalURLWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", objc_msgSend(v4, "environmentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMerchandisingUtilities _fragmentForModalConfiguration:](self, "_fragmentForModalConfiguration:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "action");

  v8 = CFSTR("calculator.html");
  if (v7 != 1)
    v8 = 0;
  if (!v7)
    v8 = CFSTR("learn-more.html");
  v12[0] = CFSTR("jsapi");
  v12[1] = CFSTR("v1.1.0");
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterMerchandisingUtilities _urlWithBaseURL:pathComponents:queryParameters:fragment:](self, "_urlWithBaseURL:pathComponents:queryParameters:fragment:", v5, v9, 0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)merchandisingEligibilityURLWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", objc_msgSend(v4, "environmentType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "region", CFSTR("jsapi"), CFSTR("v1.1.0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterMerchandisingUtilities _dynamicMerchandisingURLWithRegionCode:](self, "_dynamicMerchandisingURLWithRegionCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterMerchandisingUtilities _urlWithBaseURL:pathComponents:queryParameters:fragment:](self, "_urlWithBaseURL:pathComponents:queryParameters:fragment:", v5, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)merchandisingBaseURLForEnviornmentType:(unint64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  -[PKPayLaterMerchandisingUtilities _baseURLComponents](self, "_baseURLComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 > 3)
    v6 = 0;
  else
    v6 = off_1E2AD7A58[a3];
  objc_msgSend(v4, "setHost:", v6);
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateJavaScriptQueryForUpdatedProperty:(id)a3 newValue:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("document.querySelector('apple-pay-merchandising').setAttributeNS(null, '%@', '%@');"),
               a3,
               a4);
}

- (void)evaluateEligibilityForConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Evaluating eligiblity for configuration: %@", buf, 0xCu);
    }

    v16 = 0;
    v17 = 0;
    v9 = -[PKPayLaterMerchandisingUtilities _evaluateLocalChecksForConfiguration:outError:invalidProperties:](self, "_evaluateLocalChecksForConfiguration:outError:invalidProperties:", v6, &v17, &v16);
    v10 = v17;
    v11 = v16;
    if (v9)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __83__PKPayLaterMerchandisingUtilities_evaluateEligibilityForConfiguration_completion___block_invoke;
      v12[3] = &unk_1E2AD7A10;
      v13 = v6;
      v14 = v11;
      v15 = v7;
      -[PKPayLaterMerchandisingUtilities _validateRemoteChecksForConfiguration:completion:](self, "_validateRemoteChecksForConfiguration:completion:", v13, v12);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Pay later widget did not pass local checks: %@. Invalid properties %@", buf, 0x16u);
      }

      (*((void (**)(id, id, id))v7 + 2))(v7, v10, v11);
    }

  }
}

void __83__PKPayLaterMerchandisingUtilities_evaluateEligibilityForConfiguration_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v9 = "Pay later widget did not pass remote checks: %@. Invalid properties %@";
      v10 = v7;
      v11 = 22;
LABEL_6:
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
    }
  }
  else if (v8)
  {
    v12 = (void *)a1[4];
    v15 = 138412290;
    v16 = v12;
    v9 = "Pay later widget is eligble for configuration: %@.";
    v10 = v7;
    v11 = 12;
    goto LABEL_6;
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v13, "unionSet:", a1[5]);
  objc_msgSend(v13, "unionSet:", v6);
  (*(void (**)(_QWORD, id, id, uint64_t))(a1[6] + 16))(a1[6], v5, v13, v14);

}

- (void)clearWebRequestCache
{
  void *v2;
  id v3;

  -[NSURLSession configuration](self->_urlSession, "configuration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllCachedResponses");

}

- (void)_performWebRequestForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSURLSession *urlSession;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingUtilities requesting contents of URL %@", buf, 0xCu);
    }

    urlSession = self->_urlSession;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PKPayLaterMerchandisingUtilities__performWebRequestForURL_completion___block_invoke;
    v11[3] = &unk_1E2AC5308;
    v12 = v7;
    -[NSURLSession dataTaskWithURL:completionHandler:](urlSession, "dataTaskWithURL:completionHandler:", v6, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

void __72__PKPayLaterMerchandisingUtilities__performWebRequestForURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  PKLogFacilityTypeGetObject(6uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218498;
    v13 = objc_msgSend(v7, "length");
    v14 = 2048;
    v15 = objc_msgSend(v9, "code");
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "PKPayLaterMerchandisingUtilities received response data %ld bytes, error code %ld, and error %@", (uint8_t *)&v12, 0x20u);
  }

  if (v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (objc_msgSend(v8, "statusCode") == 200)
      v11 = v7;
    else
      v11 = 0;
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v11, 0);
  }

}

- (BOOL)_evaluateLocalChecksForConfiguration:(id)a3 outError:(id *)a4 invalidProperties:(id *)a5
{
  id v7;
  id v8;
  char isKindOfClass;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSLocale *v26;
  NSLocale *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v36;
  char v38;
  id v39;
  id v40;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
    -[PKPayLaterMerchandisingUtilities _formValidationError:underlyingError:](self, "_formValidationError:underlyingError:", a4, 0);
  objc_msgSend(v7, "amount");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if ((objc_msgSend(v11, "pk_isNotANumber") & 1) != 0)
    {
      v12 = CFSTR("amount must be a number");
    }
    else if ((objc_msgSend(v11, "pk_isNegativeNumber") & 1) != 0 || (objc_msgSend(v11, "pk_isZeroNumber") & 1) != 0)
    {
      v12 = CFSTR("amount must be greater than zero");
    }
    else if (PKIsCurrencyDecimalTooLarge(v11))
    {
      v12 = CFSTR("amount too large");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported value for amount"), v10);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v38 = isKindOfClass;
  if (a4 && v12)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    v43[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {

    if (!v12)
      goto LABEL_19;
  }
  objc_msgSend(v8, "addObject:", &unk_1E2C3F3D0);
  -[PKPayLaterMerchandisingUtilities _formValidationError:underlyingError:](self, "_formValidationError:underlyingError:", a4, 0);
LABEL_19:
  objc_msgSend(v7, "currency");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "ISOCurrencyCodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  v19 = v18;
  v40 = v8;
  v39 = v7;
  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0;
      v21 = 1;
      goto LABEL_24;
    }
  }
  else
  {
    objc_msgSend(v18, "containsObject:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported value for %@"), v17, CFSTR("currency"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0CB2D50];
  v43[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v24);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v40;
  v21 = 0;
LABEL_24:

  v25 = v20;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(v8, "addObject:", &unk_1E2C3F3E8);
    -[PKPayLaterMerchandisingUtilities _formValidationError:underlyingError:](self, "_formValidationError:underlyingError:", a4, v25);
  }
  v26 = self->_locale;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported value for locale"), v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      goto LABEL_33;
LABEL_35:

    v34 = v39;
    if (!v31)
      goto LABEL_37;
    goto LABEL_36;
  }
  v27 = v26;
  objc_msgSend(MEMORY[0x1E0C99DC8], "availableLocaleIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLocale localeIdentifier](v27, "localeIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "containsObject:", v29);

  if ((v30 & 1) != 0)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a valid locale"), v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v8 = v40;
  if (!a4)
    goto LABEL_35;
LABEL_33:
  if (!v31)
    goto LABEL_35;
  v32 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0CB2D50];
  v43[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v33);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v40;
  v34 = v39;
LABEL_36:
  objc_msgSend(v8, "addObject:", &unk_1E2C3F400);
  -[PKPayLaterMerchandisingUtilities _formValidationError:underlyingError:](self, "_formValidationError:underlyingError:", a4, v25);
LABEL_37:
  if (a5)
    *a5 = objc_retainAutorelease(v8);
  if (v31)
    v35 = 0;
  else
    v35 = v21;
  if (v12)
    v36 = 0;
  else
    v36 = v35;

  return v38 & v36;
}

- (void)_validateRemoteChecksForConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[PKPayLaterMerchandisingUtilities merchandisingEligibilityURLWithConfiguration:](self, "merchandisingEligibilityURLWithConfiguration:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__PKPayLaterMerchandisingUtilities__validateRemoteChecksForConfiguration_completion___block_invoke;
    v11[3] = &unk_1E2AD7A38;
    v11[4] = self;
    v14 = v7;
    v12 = v6;
    v13 = v8;
    v10 = v8;
    -[PKPayLaterMerchandisingUtilities _performWebRequestForURL:completion:](self, "_performWebRequestForURL:completion:", v9, v11);

  }
}

void __85__PKPayLaterMerchandisingUtilities__validateRemoteChecksForConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v44 = v5;
  v7 = objc_msgSend(v5, "length");
  if (v6 || !v7)
  {
    v14 = *(void **)(a1 + 32);
    v46 = 0;
    objc_msgSend(v14, "_formValidationError:underlyingError:", &v46, v6);
    v8 = v46;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_33;
  }
  v45 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v45);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v45;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(v8, "PKDictionaryForKey:", CFSTR("method"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "PKDictionaryForKey:", CFSTR("bnpl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PKDecimalNumberForKey:", CFSTR("minAmount"));
  v40 = objc_claimAutoreleasedReturnValue();
  v36 = v9;
  objc_msgSend(v9, "PKDecimalNumberForKey:", CFSTR("maxAmount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "PKStringForKey:", CFSTR("currencyCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("nativeContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("text"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;

  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v15;
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "currency");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  v19 = v17;
  v41 = v18;
  v38 = v16;
  if (v18 == v19)
  {

  }
  else
  {
    v20 = v19;
    if (!v18 || !v19)
    {

      v21 = v18;
LABEL_20:
      objc_msgSend(*(id *)(a1 + 48), "addObject:", &unk_1E2C3F3E8);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported value for currency"), v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v21 = v18;
    v22 = objc_msgSend(v18, "isEqualToString:", v19);

    if ((v22 & 1) == 0)
      goto LABEL_20;
  }
  v23 = 0;
LABEL_21:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "languageCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v42, "containsObject:", v24) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", &unk_1E2C3F400);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported language code"), v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v25;
  }
  v26 = (void *)v40;
  objc_msgSend(*(id *)(a1 + 40), "amount");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v40 && objc_msgSend(v27, "compare:", v40) == -1)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", &unk_1E2C3F3D0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported amount"), v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v29;
  }
  if (v43 && objc_msgSend(v28, "compare:") == 1)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", &unk_1E2C3F3D0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" is not a supported amount"), v28);
    v30 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v30;
  }
  if (v23)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v32 = v23;
    v33 = v24;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v40;
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v33;
    v23 = v32;
  }
  else
  {
    v35 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_33:
}

- (BOOL)_formValidationError:(id *)a3 underlyingError:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;

  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x1E0C99E08];
    v6 = a4;
    v7 = objc_alloc_init(v5);
    objc_msgSend(v7, "safelySetObject:forKey:", CFSTR("Invalid pay later merchandising configuration"), *MEMORY[0x1E0CB2D50]);
    objc_msgSend(v7, "safelySetObject:forKey:", v6, *MEMORY[0x1E0CB3388]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), 1, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)_baseURLComponents
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v2, "setScheme:", CFSTR("https"));
  return v2;
}

- (id)_fragmentForModalConfiguration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((unint64_t)objc_msgSend(v4, "action") <= 1)
  {
    objc_msgSend(v4, "amountString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safelySetObject:forKey:", v6, CFSTR("amount"));

    objc_msgSend(v5, "safelySetObject:forKey:", CFSTR("4"), CFSTR("frequency"));
    PKPayLaterThemeToString((__CFString *)objc_msgSend(v4, "theme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safelySetObject:forKey:", v7, CFSTR("theme"));

    -[PKPayLaterMerchandisingUtilities _localeString](self, "_localeString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safelySetObject:forKey:", v8, CFSTR("locale"));

    -[PKPayLaterMerchandisingUtilities merchandisingBaseURLForEnviornmentType:](self, "merchandisingBaseURLForEnviornmentType:", objc_msgSend(v4, "environmentType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safelySetObject:forKey:", v10, CFSTR("referralUrl"));
  }
  if (objc_msgSend(v5, "count"))
  {
    PKLogFacilityTypeGetObject(6uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Using fragment dictionary for pay later merchandising modal: %@", buf, 0xCu);
    }

    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v5, 4, &v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Pay Later Merchandising - failed to serialize data: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(v12, "base64EncodedStringWithOptions:", 16);
      v11 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v11, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("data=%@"), v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
    v14 = 0;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)_dynamicMerchandisingURLWithRegionCode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("merchandising-%@.json"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_urlWithBaseURL:(id)a3 pathComponents:(id)a4 queryParameters:(id)a5 fragment:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v36 = a6;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v45;
    do
    {
      v15 = 0;
      v16 = v9;
      do
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v15);
        objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAddingPercentEncodingWithAllowedCharacters:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URLByAppendingPathComponent:", v19);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        ++v15;
        v16 = v9;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v13);
  }
  v37 = v10;
  v39 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v11;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v41;
    v24 = CFSTR("?");
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v41 != v23)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v26, "name");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "value");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAddingPercentEncodingWithAllowedCharacters:", v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "appendFormat:", CFSTR("%@%@=%@"), v24, v29, v30);

        v24 = CFSTR("&");
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v22);
  }

  if (objc_msgSend(v36, "length"))
    objc_msgSend(v39, "appendFormat:", CFSTR("#%@"), v36);
  v31 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "absoluteString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringByAppendingString:", v39);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLWithString:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_localeString
{
  void *v2;
  void *v3;

  -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
