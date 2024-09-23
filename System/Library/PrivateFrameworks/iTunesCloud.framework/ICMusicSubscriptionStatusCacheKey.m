@implementation ICMusicSubscriptionStatusCacheKey

- (id)copyWithZone:(_NSZone *)a3
{
  ICMusicSubscriptionStatusCacheKey *v4;
  uint64_t v5;
  NSNumber *DSID;
  uint64_t v7;
  NSString *phoneNumber;
  uint64_t v9;
  NSString *storefrontIdentifier;

  v4 = objc_alloc_init(ICMusicSubscriptionStatusCacheKey);
  if (v4)
  {
    v5 = -[NSNumber copy](self->_DSID, "copy");
    DSID = v4->_DSID;
    v4->_DSID = (NSNumber *)v5;

    v7 = -[NSString copy](self->_phoneNumber, "copy");
    phoneNumber = v4->_phoneNumber;
    v4->_phoneNumber = (NSString *)v7;

    v9 = -[NSString copy](self->_storefrontIdentifier, "copy");
    storefrontIdentifier = v4->_storefrontIdentifier;
    v4->_storefrontIdentifier = (NSString *)v9;

  }
  return v4;
}

- (void)setDSID:(id)a3
{
  NSNumber *v5;
  NSNumber *DSID;
  void *v7;
  objc_class *v8;
  void *v9;

  v5 = (NSNumber *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicSubscriptionStatusCacheKey.m"), 77, CFSTR("Cannot set a nil DSID on an instance of %@"), v9);

  }
  DSID = self->_DSID;
  self->_DSID = v5;

}

- (ICMusicSubscriptionStatusCacheKey)init
{
  ICMusicSubscriptionStatusCacheKey *v2;
  ICMusicSubscriptionStatusCacheKey *v3;
  NSNumber *DSID;
  NSString *phoneNumber;
  NSString *storefrontIdentifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICMusicSubscriptionStatusCacheKey;
  v2 = -[ICMusicSubscriptionStatusCacheKey init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    DSID = v2->_DSID;
    v2->_DSID = (NSNumber *)&unk_1E43E6748;

    phoneNumber = v3->_phoneNumber;
    v3->_phoneNumber = (NSString *)&stru_1E4391778;

    storefrontIdentifier = v3->_storefrontIdentifier;
    v3->_storefrontIdentifier = (NSString *)&stru_1E4391778;

  }
  return v3;
}

- (void)setStorefrontIdentifier:(id)a3
{
  NSString *v5;
  NSString *storefrontIdentifier;
  void *v7;
  objc_class *v8;
  void *v9;

  v5 = (NSString *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicSubscriptionStatusCacheKey.m"), 87, CFSTR("Cannot set a nil storefrontIdentifier on an instance of %@"), v9);

  }
  storefrontIdentifier = self->_storefrontIdentifier;
  self->_storefrontIdentifier = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

- (BOOL)isEqual:(id)a3
{
  ICMusicSubscriptionStatusCacheKey *v4;
  ICMusicSubscriptionStatusCacheKey *v5;
  NSNumber *DSID;
  NSNumber *v7;
  NSNumber *v8;
  NSNumber *v9;
  int v10;
  char v11;
  NSString *phoneNumber;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;
  NSString *storefrontIdentifier;
  NSString *v18;
  NSString *v19;
  NSString *v20;

  v4 = (ICMusicSubscriptionStatusCacheKey *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICMusicSubscriptionStatusCacheKey isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      DSID = self->_DSID;
      v7 = v5->_DSID;
      if (DSID == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = DSID;
        v10 = -[NSNumber isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      phoneNumber = self->_phoneNumber;
      v13 = v5->_phoneNumber;
      if (phoneNumber == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = phoneNumber;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      storefrontIdentifier = self->_storefrontIdentifier;
      v18 = v5->_storefrontIdentifier;
      v19 = storefrontIdentifier;
      v20 = v19;
      if (v19 == v18)
        v11 = 1;
      else
        v11 = -[NSString isEqual:](v19, "isEqual:", v18);

      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_18:

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
  NSNumber *v18;
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
  NSString *v34;
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

  v18 = self->_DSID;
  v19 = -[NSNumber hash](v18, "hash");
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

  v26 = self->_phoneNumber;
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

  v34 = self->_storefrontIdentifier;
  v35 = -[NSString hash](v34, "hash");
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

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; DSID = %@"), self->_DSID);
  if (-[NSString length](self->_phoneNumber, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; phoneNumber = \"%@\"), self->_phoneNumber);
  objc_msgSend(v6, "appendFormat:", CFSTR("; storefrontIdentifier = \"%@\"), self->_storefrontIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)setPhoneNumber:(id)a3
{
  NSString *v5;
  NSString *phoneNumber;
  void *v7;
  objc_class *v8;
  void *v9;

  v5 = (NSString *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicSubscriptionStatusCacheKey.m"), 82, CFSTR("Cannot set a nil phoneNumber on an instance of %@"), v9);

  }
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v5;

}

- (ICMusicSubscriptionStatusCacheKey)initWithDictionaryRepresentation:(id)a3 requiringDSID:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ICMusicSubscriptionStatusCacheKey *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSNumber *DSID;
  void *v12;
  uint64_t v13;
  NSString *phoneNumber;
  void *v15;
  uint64_t v16;
  NSString *storefrontIdentifier;
  NSNumber *v18;
  objc_super v20;

  v4 = a4;
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICMusicSubscriptionStatusCacheKey;
  v7 = -[ICMusicSubscriptionStatusCacheKey init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("dsid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v9 = objc_msgSend(v8, "longLongValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      DSID = v7->_DSID;
      v7->_DSID = (NSNumber *)v10;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("phoneNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v13 = objc_msgSend(v12, "copy");
      phoneNumber = v7->_phoneNumber;
      v7->_phoneNumber = (NSString *)v13;

    }
    objc_msgSend(v6, "objectForKey:", CFSTR("storefrontID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v16 = objc_msgSend(v15, "copy");
      storefrontIdentifier = v7->_storefrontIdentifier;
      v7->_storefrontIdentifier = (NSString *)v16;

    }
    v18 = v7->_DSID;
    if (v4)
    {
      if (!v18)
      {
LABEL_15:

        v7 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else if (!v18)
    {
      v7->_DSID = (NSNumber *)&unk_1E43E6748;
    }
    if (v7->_phoneNumber && v7->_storefrontIdentifier)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_17:

  return v7;
}

- (id)dictionaryRepresentationIncludingDSID:(BOOL)a3
{
  _BOOL4 v3;
  NSString *storefrontIdentifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v3 = a3;
  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("phoneNumber");
  v12[1] = CFSTR("storefrontID");
  storefrontIdentifier = self->_storefrontIdentifier;
  v13[0] = self->_phoneNumber;
  v13[1] = storefrontIdentifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lli"), -[NSNumber longLongValue](self->_DSID, "longLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("dsid"));
    v10 = objc_msgSend(v8, "copy");

    v7 = (void *)v10;
  }
  return v7;
}

- (ICMusicSubscriptionStatusCacheKey)initWithStringRepresentation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  ICMusicSubscriptionStatusCacheKey *v7;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (_NSIsNSDictionary())
    v6 = v5;
  v7 = -[ICMusicSubscriptionStatusCacheKey initWithDictionaryRepresentation:requiringDSID:](self, "initWithDictionaryRepresentation:requiringDSID:", v6, 1);

  return v7;
}

- (id)stringRepresentation
{
  void *v2;
  void *v3;
  void *v4;

  -[ICMusicSubscriptionStatusCacheKey dictionaryRepresentationIncludingDSID:](self, "dictionaryRepresentationIncludingDSID:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

@end
