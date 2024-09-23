@implementation PKAppleBalanceInStoreTopUpToken

- (PKAppleBalanceInStoreTopUpToken)initWithDictionary:(id)a3 accountIdentifier:(id)a4
{
  NSObject *v6;
  id v7;
  PKAppleBalanceInStoreTopUpToken *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *p_super;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSString *token;
  uint64_t v18;
  NSDate *expirationDate;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  char v25;
  const char *v26;
  int v27;
  uint64_t v28;
  NSString *tokenIdentifier;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSArray *certificateChain;
  uint64_t v41;
  uint64_t v42;
  NSData *signature;
  uint64_t v44;
  NSURL *termsURL;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  PKAppleBalanceInStoreTopUpToken *v52;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  objc_super v68;
  uint8_t v69[128];
  uint8_t buf[4];
  NSObject *v71;
  __int16 v72;
  NSObject *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v68.receiver = self;
  v68.super_class = (Class)PKAppleBalanceInStoreTopUpToken;
  v8 = -[PKAppleBalanceInStoreTopUpToken init](&v68, sel_init);
  if (!v8)
    goto LABEL_59;
  -[NSObject PKDictionaryForKey:](v6, "PKDictionaryForKey:", CFSTR("token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "PKStringForKey:", CFSTR("payload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v10, 0);
  v67 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v67);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v67;
  if (v62)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v62, "description");
      v14 = v12;
      v15 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v71 = v15;
      _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: error decoding payload %@", buf, 0xCu);

      v12 = v14;
    }
  }
  else
  {
    objc_msgSend(v12, "PKStringForKey:", CFSTR("token"));
    v16 = objc_claimAutoreleasedReturnValue();
    token = v8->_token;
    v8->_token = (NSString *)v16;

    objc_msgSend(v12, "PKDateForKey:", CFSTR("expirationDate"));
    v18 = objc_claimAutoreleasedReturnValue();
    expirationDate = v8->_expirationDate;
    v8->_expirationDate = (NSDate *)v18;

    objc_msgSend(v11, "SHA256Hash");
    v20 = objc_claimAutoreleasedReturnValue();
    p_super = &v8->_payload->super;
    v8->_payload = (NSData *)v20;
  }

  if (!v8->_token)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v26 = "Top Up Token failed to initialize: missing token";
LABEL_20:
    _os_log_impl(&dword_18FC92000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    goto LABEL_21;
  }
  if (!v8->_expirationDate)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_WORD *)buf = 0;
    v26 = "Top Up Token failed to initialize: missing expiration date";
    goto LABEL_20;
  }
  if (!v8->_payload)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "Top Up Token failed to initialize: missing payload";
      goto LABEL_20;
    }
LABEL_21:
    v27 = 1;
    goto LABEL_57;
  }
  v61 = v12;
  objc_msgSend(v12, "PKStringForKey:", CFSTR("accountId"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  v23 = v21;
  v24 = v23;
  if (v23 == v22)
  {

    goto LABEL_23;
  }
  if (v22 && v23)
  {
    v25 = -[NSObject isEqualToString:](v22, "isEqualToString:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_41;
LABEL_23:
    -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("tokenIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    tokenIdentifier = v8->_tokenIdentifier;
    v8->_tokenIdentifier = (NSString *)v28;

    if (v8->_tokenIdentifier)
    {
      v57 = v6;
      v58 = v11;
      v56 = v10;
      v59 = v9;
      objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("header"));
      v55 = objc_claimAutoreleasedReturnValue();
      -[NSObject PKArrayContaining:forKey:](v55, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("x5c"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v32 = v30;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v64 != v35)
              objc_enumerationMutation(v32);
            v37 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v37, 0);
              if (v38)
                objc_msgSend(v31, "addObject:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        }
        while (v34);
      }

      v39 = objc_msgSend(v31, "copy");
      certificateChain = v8->_certificateChain;
      v8->_certificateChain = (NSArray *)v39;

      if (-[NSArray count](v8->_certificateChain, "count"))
      {
        v9 = v59;
        objc_msgSend(v59, "PKStringForKey:", CFSTR("signature"));
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v41, 0);
        signature = v8->_signature;
        v8->_signature = (NSData *)v42;

        v10 = v56;
        v6 = v57;
        v54 = (void *)v41;
        if (v8->_signature)
        {
          -[NSObject PKURLForKey:](v57, "PKURLForKey:", CFSTR("termsURL"));
          v44 = objc_claimAutoreleasedReturnValue();
          termsURL = v8->_termsURL;
          v8->_termsURL = (NSURL *)v44;

          -[NSObject PKStringForKey:](v57, "PKStringForKey:", CFSTR("tokenType"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v8->_tokenType = PKAppleBalanceInStoreTopUpTokenTypeFromString(v46);

          -[NSObject PKStringForKey:](v57, "PKStringForKey:", CFSTR("state"));
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47)
            v47 = PKAppleBalanceInStoreTopUpTokenStateFromString(v47);
          v27 = 0;
          v8->_state = (int64_t)v47;
        }
        else
        {
          PKLogFacilityTypeGetObject(0xEuLL);
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v57;
            _os_log_impl(&dword_18FC92000, v48, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: missing signature %@", buf, 0xCu);
          }
          v27 = 1;
        }

        v50 = v55;
      }
      else
      {
        PKLogFacilityTypeGetObject(0xEuLL);
        v51 = objc_claimAutoreleasedReturnValue();
        v10 = v56;
        v6 = v57;
        v9 = v59;
        v50 = v55;
        v54 = v51;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v57;
          _os_log_impl(&dword_18FC92000, v51, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: missing or invalid certificate data %@", buf, 0xCu);
        }
        v27 = 1;
      }

      v11 = v58;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18FC92000, v50, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: missing token identifier", buf, 2u);
      }
      v27 = 1;
    }
    v12 = v61;
    goto LABEL_56;
  }

LABEL_41:
  v60 = v9;
  PKLogFacilityTypeGetObject(0xEuLL);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v71 = v24;
    v72 = 2112;
    v73 = v22;
    _os_log_impl(&dword_18FC92000, v49, OS_LOG_TYPE_DEFAULT, "Top Up Token failed to initialize: response account ID %@ did not match device account ID %@", buf, 0x16u);
  }
  v27 = 1;
  v50 = v49;
  v9 = v60;
  v12 = v61;
LABEL_56:

LABEL_57:
  if (!v27)
  {
LABEL_59:
    v52 = v8;
    goto LABEL_60;
  }
  v52 = 0;
LABEL_60:

  return v52;
}

- (BOOL)isExpired
{
  NSDate *expirationDate;
  void *v3;

  expirationDate = self->_expirationDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(expirationDate) = -[NSDate compare:](expirationDate, "compare:", v3) == NSOrderedAscending;

  return (char)expirationDate;
}

- (id)displayableToken
{
  void *v3;
  NSString *token;
  uint64_t v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  token = self->_token;
  v5 = -[NSString length](token, "length");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PKAppleBalanceInStoreTopUpToken_displayableToken__block_invoke;
  v8[3] = &unk_1E2ABD858;
  v6 = v3;
  v9 = v6;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](token, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v8);

  return v6;
}

void __51__PKAppleBalanceInStoreTopUpToken_displayableToken__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = v5;
  if ((a3 & 3) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));
    v5 = v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceInStoreTopUpToken)initWithCoder:(id)a3
{
  id v4;
  PKAppleBalanceInStoreTopUpToken *v5;
  uint64_t v6;
  NSString *token;
  uint64_t v8;
  NSString *tokenIdentifier;
  uint64_t v10;
  NSDate *expirationDate;
  uint64_t v12;
  NSURL *termsURL;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *certificateChain;
  uint64_t v19;
  NSData *payload;
  uint64_t v21;
  NSData *signature;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PKAppleBalanceInStoreTopUpToken init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tokenIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    tokenIdentifier = v5->_tokenIdentifier;
    v5->_tokenIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v10;

    v5->_tokenType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("tokenType"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("termsURL"));
    v12 = objc_claimAutoreleasedReturnValue();
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("certificateChain"));
    v17 = objc_claimAutoreleasedReturnValue();
    certificateChain = v5->_certificateChain;
    v5->_certificateChain = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v19 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSData *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v21 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSData *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *token;
  id v5;

  token = self->_token;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", token, CFSTR("token"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenIdentifier, CFSTR("tokenIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_tokenType, CFSTR("tokenType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_termsURL, CFSTR("termsURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificateChain, CFSTR("certificateChain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("payload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *token;
  NSString *v6;
  NSString *tokenIdentifier;
  NSString *v8;
  NSDate *expirationDate;
  NSDate *v10;
  NSURL *termsURL;
  NSURL *v12;
  NSArray *certificateChain;
  NSArray *v14;
  NSData *payload;
  NSData *v16;
  NSData *signature;
  NSData *v18;
  char v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_36;
  token = self->_token;
  v6 = (NSString *)v4[1];
  if (token && v6)
  {
    if ((-[NSString isEqual:](token, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (token != v6)
  {
    goto LABEL_36;
  }
  tokenIdentifier = self->_tokenIdentifier;
  v8 = (NSString *)v4[3];
  if (tokenIdentifier && v8)
  {
    if ((-[NSString isEqual:](tokenIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (tokenIdentifier != v8)
  {
    goto LABEL_36;
  }
  expirationDate = self->_expirationDate;
  v10 = (NSDate *)v4[4];
  if (expirationDate && v10)
  {
    if ((-[NSDate isEqual:](expirationDate, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (expirationDate != v10)
  {
    goto LABEL_36;
  }
  if (self->_tokenType != v4[2] || self->_state != v4[5])
    goto LABEL_36;
  termsURL = self->_termsURL;
  v12 = (NSURL *)v4[6];
  if (termsURL && v12)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (termsURL != v12)
  {
    goto LABEL_36;
  }
  certificateChain = self->_certificateChain;
  v14 = (NSArray *)v4[7];
  if (certificateChain && v14)
  {
    if ((-[NSArray isEqual:](certificateChain, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (certificateChain != v14)
  {
    goto LABEL_36;
  }
  payload = self->_payload;
  v16 = (NSData *)v4[8];
  if (!payload || !v16)
  {
    if (payload == v16)
      goto LABEL_32;
LABEL_36:
    v19 = 0;
    goto LABEL_37;
  }
  if ((-[NSData isEqual:](payload, "isEqual:") & 1) == 0)
    goto LABEL_36;
LABEL_32:
  signature = self->_signature;
  v18 = (NSData *)v4[9];
  if (signature && v18)
    v19 = -[NSData isEqual:](signature, "isEqual:");
  else
    v19 = signature == v18;
LABEL_37:

  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_token);
  objc_msgSend(v3, "safelyAddObject:", self->_tokenIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  objc_msgSend(v3, "safelyAddObject:", self->_termsURL);
  objc_msgSend(v3, "safelyAddObject:", self->_certificateChain);
  objc_msgSend(v3, "safelyAddObject:", self->_payload);
  objc_msgSend(v3, "safelyAddObject:", self->_signature);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_tokenType - v4 + 32 * v4;
  v6 = self->_state - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  int64_t state;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("token: '%@'; "), self->_token);
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_tokenIdentifier);
  if (self->_tokenType)
    v4 = CFSTR("unknown");
  else
    v4 = CFSTR("barcode");
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);
  -[NSDate description](self->_expirationDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("expirationDate: '%@'; "), v5);

  state = self->_state;
  v7 = CFSTR("valid");
  if (state == 1)
    v7 = CFSTR("invalid");
  if (state == 2)
    v8 = CFSTR("unknown");
  else
    v8 = v7;
  objc_msgSend(v3, "appendFormat:", CFSTR("state: '%@'; "), v8);
  -[NSURL description](self->_termsURL, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("termsURL: '%@'; "), v9);

  -[NSArray description](self->_certificateChain, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("certificateChain: '%@'; "), v10);

  objc_msgSend(v3, "appendFormat:", CFSTR("payload: '%@'; "), self->_payload);
  objc_msgSend(v3, "appendFormat:", CFSTR("signature: '%@'; "), self->_signature);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleBalanceInStoreTopUpToken *v5;
  uint64_t v6;
  NSString *token;
  uint64_t v8;
  NSString *tokenIdentifier;
  uint64_t v10;
  NSDate *expirationDate;
  uint64_t v12;
  NSURL *termsURL;
  uint64_t v14;
  NSArray *certificateChain;
  uint64_t v16;
  NSData *payload;
  uint64_t v18;
  NSData *signature;

  v5 = -[PKAppleBalanceInStoreTopUpToken init](+[PKAppleBalanceInStoreTopUpToken allocWithZone:](PKAppleBalanceInStoreTopUpToken, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  token = v5->_token;
  v5->_token = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_tokenIdentifier, "copyWithZone:", a3);
  tokenIdentifier = v5->_tokenIdentifier;
  v5->_tokenIdentifier = (NSString *)v8;

  v10 = -[NSDate copyWithZone:](self->_expirationDate, "copyWithZone:", a3);
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v10;

  v5->_tokenType = self->_tokenType;
  v5->_state = self->_state;
  v12 = -[NSURL copyWithZone:](self->_termsURL, "copyWithZone:", a3);
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v12;

  v14 = -[NSArray copyWithZone:](self->_certificateChain, "copyWithZone:", a3);
  certificateChain = v5->_certificateChain;
  v5->_certificateChain = (NSArray *)v14;

  v16 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  payload = v5->_payload;
  v5->_payload = (NSData *)v16;

  v18 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  signature = v5->_signature;
  v5->_signature = (NSData *)v18;

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(int64_t)a3
{
  self->_tokenType = a3;
}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

- (void)setTokenIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
