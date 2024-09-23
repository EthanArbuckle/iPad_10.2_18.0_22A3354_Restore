@implementation ICLocalStoreAccountProperties

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
}

- (void)_copyLocalStoreAccountPropertiesToOtherInstance:(id)a3 withZone:(_NSZone *)a4
{
  NSString *storefrontIdentifier;
  _QWORD *v6;
  uint64_t v7;
  id v8;

  storefrontIdentifier = self->_storefrontIdentifier;
  v6 = a3;
  v7 = -[NSString copyWithZone:](storefrontIdentifier, "copyWithZone:", a4);
  v8 = (id)v6[1];
  v6[1] = v7;

}

- (NSString)storefrontIdentifier
{
  if (self->_storefrontIdentifier)
    return self->_storefrontIdentifier;
  else
    return (NSString *)&stru_1E4391778;
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

  if (-[NSString length](self->_storefrontIdentifier, "length"))
    objc_msgSend(v6, "appendFormat:", CFSTR("; storefrontIdentifier = \"%@\"), self->_storefrontIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
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
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

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
  v58 = __ROR8__(v14 + v13, 32);
  v60 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v56 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_storefrontIdentifier;
  v19 = -[NSString hash](v18, "hash");
  v20 = (v17 + v56) ^ __ROR8__(v56, 51);
  v21 = v58 + (v60 ^ v19);
  v22 = __ROR8__(v60 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v56, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v59 = __ROR8__(v25, 32);
  v61 = v24;
  v55 = v23 ^ v19;
  v57 = v25 ^ __ROR8__(v20, 47);

  v26 = (v55 + v57) ^ __ROR8__(v57, 51);
  v27 = v59 + (v61 ^ 0x1000000000000000);
  v28 = __ROR8__(v61 ^ 0x1000000000000000, 48);
  v29 = (v27 ^ v28) + __ROR8__(v55 + v57, 32);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v32 = v31 ^ __ROR8__(v26, 47);
  v33 = (v29 ^ 0x1000000000000000) + v32;
  v34 = v33 ^ __ROR8__(v32, 51);
  v35 = (__ROR8__(v31, 32) ^ 0xFFLL) + v30;
  v36 = __ROR8__(v30, 48);
  v37 = __ROR8__(v33, 32) + (v35 ^ v36);
  v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  v39 = v34 + v35;
  v40 = v39 ^ __ROR8__(v34, 47);
  v41 = v40 + v37;
  v42 = v41 ^ __ROR8__(v40, 51);
  v43 = __ROR8__(v39, 32) + v38;
  v44 = __ROR8__(v38, 48);
  v45 = __ROR8__(v41, 32) + (v43 ^ v44);
  v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  v47 = v42 + v43;
  v48 = v47 ^ __ROR8__(v42, 47);
  v49 = v48 + v45;
  v50 = v49 ^ __ROR8__(v48, 51);
  v51 = __ROR8__(v47, 32) + v46;
  v52 = __ROR8__(v46, 48);
  v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  return (v50 + v51) ^ __ROR8__(v50, 47) ^ v53 ^ __ROR8__(v50 + v51, 32) ^ v53 ^ __ROR8__(v51 ^ v52, 43);
}

- (BOOL)isEqual:(id)a3
{
  ICLocalStoreAccountProperties *v4;
  NSString *storefrontIdentifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;

  v4 = (ICLocalStoreAccountProperties *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (-[ICLocalStoreAccountProperties isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    storefrontIdentifier = self->_storefrontIdentifier;
    v6 = v4->_storefrontIdentifier;
    v7 = storefrontIdentifier;
    v8 = v7;
    if (v7 == v6)
      v9 = 1;
    else
      v9 = -[NSString isEqual:](v7, "isEqual:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  ICMutableLocalStoreAccountProperties *v5;

  v5 = -[ICMutableLocalStoreAccountProperties init](+[ICMutableLocalStoreAccountProperties allocWithZone:](ICMutableLocalStoreAccountProperties, "allocWithZone:"), "init");
  if (v5)
    -[ICLocalStoreAccountProperties _copyLocalStoreAccountPropertiesToOtherInstance:withZone:](self, "_copyLocalStoreAccountPropertiesToOtherInstance:withZone:", v5, a3);
  return v5;
}

- (ICLocalStoreAccountProperties)initWithCoder:(id)a3
{
  id v4;
  ICLocalStoreAccountProperties *v5;
  void *v6;
  uint64_t v7;
  NSString *storefrontIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLocalStoreAccountProperties;
  v5 = -[ICLocalStoreAccountProperties init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storefrontID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    storefrontIdentifier = v5->_storefrontIdentifier;
    v5->_storefrontIdentifier = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_storefrontIdentifier, CFSTR("storefrontID"));
}

- (ICLocalStoreAccountProperties)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  ICLocalStoreAccountProperties *v5;
  void *v6;
  uint64_t v7;
  NSString *storefrontIdentifier;

  v4 = a3;
  v5 = -[ICLocalStoreAccountProperties init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("storefrontIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v7 = objc_msgSend(v6, "copy");
      storefrontIdentifier = v5->_storefrontIdentifier;
      v5->_storefrontIdentifier = (NSString *)v7;

    }
  }

  return v5;
}

- (NSDictionary)propertyListRepresentation
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("storefrontIdentifier");
  -[ICLocalStoreAccountProperties storefrontIdentifier](self, "storefrontIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
