@implementation ICMusicKitTokensResponse

- (ICMusicKitTokensResponse)initWithDeveloperToken:(id)a3 userToken:(id)a4 userTokenFetchingError:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICMusicKitTokensResponse *v11;
  uint64_t v12;
  NSString *developerToken;
  uint64_t v14;
  NSString *userToken;
  uint64_t v16;
  NSError *userTokenFetchingError;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICMusicKitTokensResponse;
  v11 = -[ICMusicKitTokensResponse init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    developerToken = v11->_developerToken;
    v11->_developerToken = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    userToken = v11->_userToken;
    v11->_userToken = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    userTokenFetchingError = v11->_userTokenFetchingError;
    v11->_userTokenFetchingError = (NSError *)v16;

  }
  return v11;
}

- (id)_descriptionOfToken:(id)a3 forDebugging:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (!a4)
  {
    v8 = objc_msgSend(v5, "length");
    v7 = v6;
    if (v8 >= 0x15)
    {
      v9 = v8;
      objc_msgSend(v6, "substringWithRange:", 0, 12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "substringWithRange:", v9 - 8, 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@…%@"), v10, v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *userToken;
  void *v11;

  v3 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("<%@: %p; {"), v7, self);

  -[ICMusicKitTokensResponse _descriptionOfToken:forDebugging:](self, "_descriptionOfToken:forDebugging:", self->_developerToken, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("\n    developerToken: \"%@\","), v9);
  userToken = self->_userToken;
  if (userToken)
  {
    -[ICMusicKitTokensResponse _descriptionOfToken:forDebugging:](self, "_descriptionOfToken:forDebugging:", userToken, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("\n    userToken: \"%@\","), v11);

  }
  if (self->_userTokenFetchingError)
    objc_msgSend(v8, "appendFormat:", CFSTR("\n    userTokenFetchingError: %@"), self->_userTokenFetchingError);
  objc_msgSend(v8, "appendString:", CFSTR("\n}>"));

  return v8;
}

- (id)description
{
  return -[ICMusicKitTokensResponse _descriptionForDebugging:](self, "_descriptionForDebugging:", 0);
}

- (id)debugDescription
{
  return -[ICMusicKitTokensResponse _descriptionForDebugging:](self, "_descriptionForDebugging:", 1);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSError *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v78 = __ROR8__(v14 + v13, 32);
  v82 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v74 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_developerToken;
  v19 = -[NSString hash](v18, "hash");
  v20 = (v17 + v74) ^ __ROR8__(v74, 51);
  v21 = v78 + (v82 ^ v19);
  v22 = __ROR8__(v82 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v74, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v79 = __ROR8__(v25, 32);
  v83 = v24;
  v71 = v23 ^ v19;
  v75 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_userToken;
  v27 = -[NSString hash](v26, "hash");
  v28 = (v71 + v75) ^ __ROR8__(v75, 51);
  v29 = v79 + (v83 ^ v27);
  v30 = __ROR8__(v83 ^ v27, 48);
  v31 = (v29 ^ v30) + __ROR8__(v71 + v75, 32);
  v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  v33 = v29 + v28;
  v80 = __ROR8__(v33, 32);
  v84 = v32;
  v72 = v31 ^ v27;
  v76 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_userTokenFetchingError;
  v35 = -[NSError hash](v34, "hash");
  v36 = (v72 + v76) ^ __ROR8__(v76, 51);
  v37 = v80 + (v84 ^ v35);
  v38 = __ROR8__(v84 ^ v35, 48);
  v39 = (v37 ^ v38) + __ROR8__(v72 + v76, 32);
  v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  v41 = v37 + v36;
  v81 = __ROR8__(v41, 32);
  v85 = v40;
  v73 = v39 ^ v35;
  v77 = v41 ^ __ROR8__(v36, 47);

  v42 = (v73 + v77) ^ __ROR8__(v77, 51);
  v43 = v81 + (v85 ^ 0x2000000000000000);
  v44 = __ROR8__(v85 ^ 0x2000000000000000, 48);
  v45 = (v43 ^ v44) + __ROR8__(v73 + v77, 32);
  v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  v47 = v43 + v42;
  v48 = v47 ^ __ROR8__(v42, 47);
  v49 = (v45 ^ 0x2000000000000000) + v48;
  v50 = v49 ^ __ROR8__(v48, 51);
  v51 = (__ROR8__(v47, 32) ^ 0xFFLL) + v46;
  v52 = __ROR8__(v46, 48);
  v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  v55 = v50 + v51;
  v56 = v55 ^ __ROR8__(v50, 47);
  v57 = v56 + v53;
  v58 = v57 ^ __ROR8__(v56, 51);
  v59 = __ROR8__(v55, 32) + v54;
  v60 = __ROR8__(v54, 48);
  v61 = __ROR8__(v57, 32) + (v59 ^ v60);
  v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
  v63 = v58 + v59;
  v64 = v63 ^ __ROR8__(v58, 47);
  v65 = v64 + v61;
  v66 = v65 ^ __ROR8__(v64, 51);
  v67 = __ROR8__(v63, 32) + v62;
  v68 = __ROR8__(v62, 48);
  v69 = __ROR8__(v65, 32) + (v67 ^ v68);
  return (v66 + v67) ^ __ROR8__(v66, 47) ^ v69 ^ __ROR8__(v66 + v67, 32) ^ v69 ^ __ROR8__(v67 ^ v68, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICMusicKitTokensResponse *v4;
  ICMusicKitTokensResponse *v5;
  NSString *developerToken;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  char v11;
  NSString *userToken;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  NSError *userTokenFetchingError;
  NSError *v18;
  NSError *v19;
  NSError *v20;

  v4 = (ICMusicKitTokensResponse *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICMusicKitTokensResponse isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      developerToken = self->_developerToken;
      v7 = v5->_developerToken;
      if (developerToken == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = developerToken;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      userToken = self->_userToken;
      v13 = v5->_userToken;
      if (userToken == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = userToken;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      userTokenFetchingError = self->_userTokenFetchingError;
      v18 = v5->_userTokenFetchingError;
      v19 = userTokenFetchingError;
      v20 = v19;
      if (v19 == v18)
        v11 = 1;
      else
        v11 = -[NSError isEqual:](v19, "isEqual:", v18);

      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (ICMusicKitTokensResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ICMusicKitTokensResponse *v8;
  NSObject *v9;
  void *v10;
  uint8_t v12[16];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("u"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("e"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = -[ICMusicKitTokensResponse initWithDeveloperToken:userToken:userTokenFetchingError:](self, "initWithDeveloperToken:userToken:userTokenFetchingError:", v5, v6, v7);
  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "Failed to decode valid developer token while initializing instance of ICMusicKitTokensResponse from decoder.", v12, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7005, CFSTR("Failed to decode valid developer token while initializing instance of ICMusicKitTokensResponse from decoder."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v10);

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *developerToken;
  id v5;
  id v6;

  developerToken = self->_developerToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", developerToken, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userToken, CFSTR("u"));
  -[NSError msv_errorByRemovingUnsafeUserInfo](self->_userTokenFetchingError, "msv_errorByRemovingUnsafeUserInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("e"));

}

- (NSString)developerToken
{
  return self->_developerToken;
}

- (NSString)userToken
{
  return self->_userToken;
}

- (NSError)userTokenFetchingError
{
  return self->_userTokenFetchingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTokenFetchingError, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_developerToken, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
