@implementation ICUserIdentityContext

- (ICUserIdentity)identity
{
  return self->_identity;
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (BOOL)isEqual:(id)a3
{
  ICUserIdentityContext *v4;
  ICUserIdentityContext *v5;
  ICUserIdentityStore *identityStore;
  ICUserIdentityStore *v7;
  ICUserIdentityStore *v8;
  ICUserIdentityStore *v9;
  _BOOL4 v10;
  char v11;
  ICUserIdentity *identity;
  ICUserIdentityStore *v13;
  ICUserIdentity *v14;
  ICUserIdentity *v15;
  ICUserIdentityStore *v16;

  v4 = (ICUserIdentityContext *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICUserIdentityContext isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      identityStore = self->_identityStore;
      v7 = v5->_identityStore;
      if (identityStore == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identityStore;
        v10 = -[ICUserIdentityStore isEqual:](v9, "isEqual:", v8);

        if (!v10)
        {
          v11 = 0;
LABEL_15:

          goto LABEL_16;
        }
      }
      identity = v5->_identity;
      v13 = self->_identityStore;
      v14 = self->_identity;
      v15 = identity;
      v16 = v13;
      if (v14 == v15)
      {
        v11 = 1;
      }
      else
      {
        v11 = 0;
        if (v14 && v15)
          v11 = -[ICUserIdentity isEqualToIdentity:inStore:](v14, "isEqualToIdentity:inStore:", v15, v16);
      }

      goto LABEL_15;
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  ICUserIdentityStore *v25;
  unint64_t v26;
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t data;

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
  v66 = __ROR8__(v14 + v13, 32);
  v69 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = -[ICUserIdentity hashInStore:](self->_identity, "hashInStore:", self->_identityStore);
  v19 = (v17 + v63) ^ __ROR8__(v63, 51);
  v20 = v66 + (v69 ^ v18);
  v21 = __ROR8__(v69 ^ v18, 48);
  v22 = (v20 ^ v21) + __ROR8__(v17 + v63, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v67 = __ROR8__(v24, 32);
  v70 = v23;
  v61 = v22 ^ v18;
  v64 = v24 ^ __ROR8__(v19, 47);
  v25 = self->_identityStore;
  data = -[ICUserIdentityStore hash](v25, "hash");
  v26 = (v61 + v64) ^ __ROR8__(v64, 51);
  v27 = v67 + (v70 ^ data);
  v28 = __ROR8__(v70 ^ data, 48);
  v29 = (v27 ^ v28) + __ROR8__(v61 + v64, 32);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v68 = __ROR8__(v31, 32);
  v71 = v30;
  v62 = v29 ^ data;
  v65 = v31 ^ __ROR8__(v26, 47);

  v32 = (v62 + v65) ^ __ROR8__(v65, 51);
  v33 = v68 + (v71 ^ 0x1800000000000000);
  v34 = __ROR8__(v71 ^ 0x1800000000000000, 48);
  v35 = (v33 ^ v34) + __ROR8__(v62 + v65, 32);
  v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  v37 = v33 + v32;
  v38 = v37 ^ __ROR8__(v32, 47);
  v39 = (v35 ^ 0x1800000000000000) + v38;
  v40 = v39 ^ __ROR8__(v38, 51);
  v41 = (__ROR8__(v37, 32) ^ 0xFFLL) + v36;
  v42 = __ROR8__(v36, 48);
  v43 = __ROR8__(v39, 32) + (v41 ^ v42);
  v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  v45 = v40 + v41;
  v46 = v45 ^ __ROR8__(v40, 47);
  v47 = v46 + v43;
  v48 = v47 ^ __ROR8__(v46, 51);
  v49 = __ROR8__(v45, 32) + v44;
  v50 = __ROR8__(v44, 48);
  v51 = __ROR8__(v47, 32) + (v49 ^ v50);
  v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  v53 = v48 + v49;
  v54 = v53 ^ __ROR8__(v48, 47);
  v55 = v54 + v51;
  v56 = v55 ^ __ROR8__(v54, 51);
  v57 = __ROR8__(v53, 32) + v52;
  v58 = __ROR8__(v52, 48);
  v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  return (v56 + v57) ^ __ROR8__(v56, 47) ^ v59 ^ __ROR8__(v56 + v57, 32) ^ v59 ^ __ROR8__(v57 ^ v58, 43);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityStore, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (ICUserIdentityContext)initWithIdentity:(id)a3 identityStore:(id)a4
{
  id v7;
  id v8;
  ICUserIdentityContext *v9;
  ICUserIdentityContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICUserIdentityContext;
  v9 = -[ICUserIdentityContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_identityStore, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identity = %@; identityStore = %@>"),
    v5,
    self,
    self->_identity,
    self->_identityStore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ICUserIdentityContext)initWithCoder:(id)a3
{
  id v4;
  ICUserIdentityContext *v5;
  uint64_t v6;
  ICUserIdentity *identity;
  uint64_t v8;
  ICUserIdentityStore *identityStore;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICUserIdentityContext;
  v5 = -[ICUserIdentityContext init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("i"));
    v6 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (ICUserIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
    v8 = objc_claimAutoreleasedReturnValue();
    identityStore = v5->_identityStore;
    v5->_identityStore = (ICUserIdentityStore *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ICUserIdentity *identity;
  id v5;

  identity = self->_identity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identity, CFSTR("i"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identityStore, CFSTR("s"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
