@implementation ICURLResponseAuthenticationProvider

+ (id)defaultProvider
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUserInteractionLevel:", 0);
}

- (ICURLResponseAuthenticationProvider)initWithUserInteractionLevel:(int64_t)a3
{
  ICURLResponseAuthenticationProvider *result;

  result = -[ICURLResponseAuthenticationProvider init](self, "init");
  if (result)
    result->_interactionLevel = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_interactionLevel, CFSTR("interactionLevel"));
}

- (ICURLResponseAuthenticationProvider)initWithCoder:(id)a3
{
  id v4;
  ICURLResponseAuthenticationProvider *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICURLResponseAuthenticationProvider;
  v5 = -[ICURLResponseAuthenticationProvider init](&v7, sel_init);
  if (v5)
    v5->_interactionLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interactionLevel"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)performAuthenticationToHandleResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)performAuthenticationUsingRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
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
  int64_t interactionLevel;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
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
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v3 ^ 0x6C7967656E657261;
  v8 = v4 ^ 0x646F72616E646F6DLL;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v8) ^ __ROR8__(v8, 51);
  v14 = v7 + v12;
  v15 = (v7 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v8, 32);
  v57 = __ROR8__(v14 + v13, 32);
  v58 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v55 = (v14 + v13) ^ __ROR8__(v13, 47);

  interactionLevel = self->_interactionLevel;
  v19 = (v17 + v55) ^ __ROR8__(v55, 51);
  v20 = v57 + (v58 ^ interactionLevel);
  v21 = __ROR8__(v58 ^ interactionLevel, 48);
  v22 = (v20 ^ v21) + __ROR8__(v17 + v55, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v54 = v22 ^ interactionLevel;
  v56 = v24 ^ __ROR8__(v19, 47);
  v25 = ((v22 ^ interactionLevel) + v56) ^ __ROR8__(v56, 51);
  v26 = __ROR8__(v24, 32) + (v23 ^ 0x1000000000000000);
  v27 = __ROR8__(v23 ^ 0x1000000000000000, 48);
  v28 = (v26 ^ v27) + __ROR8__(v54 + v56, 32);
  v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  v30 = v26 + v25;
  v31 = v30 ^ __ROR8__(v25, 47);
  v32 = (v28 ^ 0x1000000000000000) + v31;
  v33 = v32 ^ __ROR8__(v31, 51);
  v34 = (__ROR8__(v30, 32) ^ 0xFFLL) + v29;
  v35 = __ROR8__(v29, 48);
  v36 = __ROR8__(v32, 32) + (v34 ^ v35);
  v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  v38 = v33 + v34;
  v39 = v38 ^ __ROR8__(v33, 47);
  v40 = v39 + v36;
  v41 = v40 ^ __ROR8__(v39, 51);
  v42 = __ROR8__(v38, 32) + v37;
  v43 = __ROR8__(v37, 48);
  v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  v46 = v41 + v42;
  v47 = v46 ^ __ROR8__(v41, 47);
  v48 = v47 + v44;
  v49 = v48 ^ __ROR8__(v47, 51);
  v50 = __ROR8__(v46, 32) + v45;
  v51 = __ROR8__(v45, 48);
  v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  return (v49 + v50) ^ __ROR8__(v49, 47) ^ v52 ^ __ROR8__(v49 + v50, 32) ^ v52 ^ __ROR8__(v50 ^ v51, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICURLResponseAuthenticationProvider *v4;
  BOOL v5;

  v4 = (ICURLResponseAuthenticationProvider *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (-[ICURLResponseAuthenticationProvider isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = self->_interactionLevel == v4->_interactionLevel;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)interactionLevel
{
  return self->_interactionLevel;
}

@end
