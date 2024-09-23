@implementation ICLiveLinkIdentity

- (id)_initWithBlock:(id)a3
{
  void (**v4)(id, ICLiveLinkIdentity *);
  ICLiveLinkIdentity *v5;
  objc_super v7;

  v4 = (void (**)(id, ICLiveLinkIdentity *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICLiveLinkIdentity;
  v5 = -[ICLiveLinkIdentity init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p serverID=%ld participantID=%@ externalID=%@>"), objc_opt_class(), self, self->_serverID, self->_identifier, self->_externalIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  ICLiveLinkIdentity *v4;
  ICLiveLinkIdentity *v5;
  ICLiveLinkIdentity *v6;
  NSUUID *identifier;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;
  int v11;
  char v12;
  NSString *externalIdentifier;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  int v17;
  NSPersonNameComponents *nameComponents;
  NSPersonNameComponents *v19;
  NSPersonNameComponents *v20;
  NSPersonNameComponents *v21;
  int v22;
  NSURL *imageURL;
  NSURL *v25;
  NSURL *v26;
  NSURL *v27;

  v4 = (ICLiveLinkIdentity *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_serverID == v5->_serverID)
      {
        identifier = self->_identifier;
        v8 = v5->_identifier;
        if (identifier == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = identifier;
          v11 = -[NSUUID isEqual:](v10, "isEqual:", v9);

          if (!v11)
            goto LABEL_16;
        }
        externalIdentifier = self->_externalIdentifier;
        v14 = v6->_externalIdentifier;
        if (externalIdentifier == v14)
        {

        }
        else
        {
          v15 = v14;
          v16 = externalIdentifier;
          v17 = -[NSString isEqual:](v16, "isEqual:", v15);

          if (!v17)
            goto LABEL_16;
        }
        nameComponents = self->_nameComponents;
        v19 = v6->_nameComponents;
        if (nameComponents == v19)
        {

        }
        else
        {
          v20 = v19;
          v21 = nameComponents;
          v22 = -[NSPersonNameComponents isEqual:](v21, "isEqual:", v20);

          if (!v22)
            goto LABEL_16;
        }
        imageURL = self->_imageURL;
        v25 = v6->_imageURL;
        v26 = imageURL;
        v27 = v26;
        if (v26 == v25)
          v12 = 1;
        else
          v12 = -[NSURL isEqual:](v26, "isEqual:", v25);

        goto LABEL_17;
      }
LABEL_16:
      v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  int64_t serverID;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSPersonNameComponents *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSURL *v38;
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
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
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
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v3 = MSVHasherSharedSeed();
  serverID = self->_serverID;
  v6 = v4 ^ 0x7465646279746573 ^ serverID;
  v7 = (v3 ^ 0x736F6D6570736575) + (v4 ^ 0x646F72616E646F6DLL);
  v8 = __ROR8__(v7, 32);
  v9 = v7 ^ __ROR8__(v4 ^ 0x646F72616E646F6DLL, 51);
  v10 = ((v3 ^ 0x6C7967656E657261) + v6) ^ __ROR8__(v6, 48);
  v11 = (v10 + v8) ^ __ROR8__(v10, 43);
  v12 = (v3 ^ 0x6C7967656E657261) + v6 + v9;
  v13 = v12 ^ __ROR8__(v9, 47);
  v14 = __ROR8__(v12, 32);
  v15 = (v10 + v8) ^ serverID;
  v16 = -[NSUUID hash](self->_identifier, "hash");
  v17 = (v15 + v13) ^ __ROR8__(v13, 51);
  v18 = v14 + (v11 ^ v16);
  v19 = __ROR8__(v11 ^ v16, 48);
  v20 = (v18 ^ v19) + __ROR8__(v15 + v13, 32);
  v82 = __ROR8__(v18 + v17, 32);
  v86 = v20 ^ __ROR8__(v18 ^ v19, 43);
  v21 = v20 ^ v16;
  v78 = (v18 + v17) ^ __ROR8__(v17, 47);
  v22 = self->_externalIdentifier;
  v23 = -[NSString hash](v22, "hash");
  v24 = (v21 + v78) ^ __ROR8__(v78, 51);
  v25 = v82 + (v86 ^ v23);
  v26 = __ROR8__(v86 ^ v23, 48);
  v27 = (v25 ^ v26) + __ROR8__(v21 + v78, 32);
  v28 = v27 ^ __ROR8__(v25 ^ v26, 43);
  v29 = v25 + v24;
  v83 = __ROR8__(v29, 32);
  v87 = v28;
  v75 = v27 ^ v23;
  v79 = v29 ^ __ROR8__(v24, 47);

  v30 = self->_nameComponents;
  v31 = -[NSPersonNameComponents hash](v30, "hash");
  v32 = (v75 + v79) ^ __ROR8__(v79, 51);
  v33 = v83 + (v87 ^ v31);
  v34 = __ROR8__(v87 ^ v31, 48);
  v35 = (v33 ^ v34) + __ROR8__(v75 + v79, 32);
  v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  v37 = v33 + v32;
  v84 = __ROR8__(v37, 32);
  v88 = v36;
  v76 = v35 ^ v31;
  v80 = v37 ^ __ROR8__(v32, 47);

  v38 = self->_imageURL;
  v39 = -[NSURL hash](v38, "hash");
  v40 = (v76 + v80) ^ __ROR8__(v80, 51);
  v41 = v84 + (v88 ^ v39);
  v42 = __ROR8__(v88 ^ v39, 48);
  v43 = (v41 ^ v42) + __ROR8__(v76 + v80, 32);
  v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  v45 = v41 + v40;
  v85 = __ROR8__(v45, 32);
  v89 = v44;
  v77 = v43 ^ v39;
  v81 = v45 ^ __ROR8__(v40, 47);

  v46 = (v77 + v81) ^ __ROR8__(v81, 51);
  v47 = v85 + (v89 ^ 0x2800000000000000);
  v48 = __ROR8__(v89 ^ 0x2800000000000000, 48);
  v49 = (v47 ^ v48) + __ROR8__(v77 + v81, 32);
  v50 = v49 ^ __ROR8__(v47 ^ v48, 43);
  v51 = v47 + v46;
  v52 = v51 ^ __ROR8__(v46, 47);
  v53 = (v49 ^ 0x2800000000000000) + v52;
  v54 = v53 ^ __ROR8__(v52, 51);
  v55 = (__ROR8__(v51, 32) ^ 0xFFLL) + v50;
  v56 = __ROR8__(v50, 48);
  v57 = __ROR8__(v53, 32) + (v55 ^ v56);
  v58 = v57 ^ __ROR8__(v55 ^ v56, 43);
  v59 = v54 + v55;
  v60 = v59 ^ __ROR8__(v54, 47);
  v61 = v60 + v57;
  v62 = v61 ^ __ROR8__(v60, 51);
  v63 = __ROR8__(v59, 32) + v58;
  v64 = __ROR8__(v58, 48);
  v65 = __ROR8__(v61, 32) + (v63 ^ v64);
  v66 = v65 ^ __ROR8__(v63 ^ v64, 43);
  v67 = v62 + v63;
  v68 = v67 ^ __ROR8__(v62, 47);
  v69 = v68 + v65;
  v70 = v69 ^ __ROR8__(v68, 51);
  v71 = __ROR8__(v67, 32) + v66;
  v72 = __ROR8__(v66, 48);
  v73 = __ROR8__(v69, 32) + (v71 ^ v72);
  return (v70 + v71) ^ __ROR8__(v70, 47) ^ v73 ^ __ROR8__(v70 + v71, 32) ^ v73 ^ __ROR8__(v71 ^ v72, 43);
}

- (ICLiveLinkIdentity)initWithCoder:(id)a3
{
  id v4;
  ICLiveLinkIdentity *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *externalIdentifier;
  uint64_t v10;
  NSPersonNameComponents *nameComponents;
  uint64_t v12;
  NSURL *imageURL;

  v4 = a3;
  v5 = -[ICLiveLinkIdentity init](self, "init");
  if (v5)
  {
    v5->_serverID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iid"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eid"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nc"));
    v10 = objc_claimAutoreleasedReturnValue();
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iurl"));
    v12 = objc_claimAutoreleasedReturnValue();
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t serverID;
  id v5;

  serverID = self->_serverID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", serverID, CFSTR("sid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("iid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("eid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameComponents, CFSTR("nc"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageURL, CFSTR("iurl"));

}

- (int64_t)serverID
{
  return self->_serverID;
}

- (void)setServerID:(int64_t)a3
{
  self->_serverID = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (ICLiveLinkIdentity)identityWithIdentifier:(id)a3
{
  return objc_alloc_init(ICLiveLinkIdentity);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
