@implementation ICDelegateAccountStoreOptions

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
  NSXPCListenerEndpoint *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSString *v33;
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
  v78 = __ROR8__(v14 + v13, 32);
  v82 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v74 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_databasePath;
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

  v26 = self->_listenerEndpoint;
  data = -[NSXPCListenerEndpoint hash](v26, "hash");
  v27 = (v71 + v75) ^ __ROR8__(v75, 51);
  v28 = v79 + (v83 ^ data);
  v29 = __ROR8__(v83 ^ data, 48);
  v30 = (v28 ^ v29) + __ROR8__(v71 + v75, 32);
  v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  v32 = v28 + v27;
  v80 = __ROR8__(v32, 32);
  v84 = v31;
  v72 = v30 ^ data;
  v76 = v32 ^ __ROR8__(v27, 47);

  v33 = self->_serviceName;
  v34 = -[NSString hash](v33, "hash");
  v35 = (v72 + v76) ^ __ROR8__(v76, 51);
  v36 = v80 + (v84 ^ v34);
  v37 = __ROR8__(v84 ^ v34, 48);
  v38 = (v36 ^ v37) + __ROR8__(v72 + v76, 32);
  v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
  v40 = v36 + v35;
  v81 = __ROR8__(v40, 32);
  v85 = v39;
  v73 = v38 ^ v34;
  v77 = v40 ^ __ROR8__(v35, 47);

  v41 = self->_singleWriter | 0x2000000000000000;
  v42 = (v73 + v77) ^ __ROR8__(v77, 51);
  v43 = v81 + (v85 ^ (v41 + 0x400000000000000));
  v44 = __ROR8__(v85 ^ (v41 + 0x400000000000000), 48);
  v45 = (v43 ^ v44) + __ROR8__(v73 + v77, 32);
  v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  v47 = v43 + v42;
  v48 = v47 ^ __ROR8__(v42, 47);
  v49 = (v45 ^ (v41 + 0x400000000000000)) + v48;
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

- (void)encodeWithCoder:(id)a3
{
  NSString *databasePath;
  id v5;

  databasePath = self->_databasePath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", databasePath, CFSTR("dp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_listenerEndpoint, CFSTR("le"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceName, CFSTR("sn"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_singleWriter, CFSTR("sw"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_databasePath, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v6;

    objc_storeStrong((id *)(v5 + 16), self->_listenerEndpoint);
    v8 = -[NSString copyWithZone:](self->_serviceName, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    *(_BYTE *)(v5 + 32) = self->_singleWriter;
  }
  return (id)v5;
}

+ (id)defaultOptionsWithServiceName:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[3];
    v5[3] = v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDelegateAccountStoreOptions)initWithCoder:(id)a3
{
  id v4;
  ICDelegateAccountStoreOptions *v5;
  uint64_t v6;
  NSString *databasePath;
  uint64_t v8;
  NSXPCListenerEndpoint *listenerEndpoint;
  uint64_t v10;
  NSString *serviceName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDelegateAccountStoreOptions;
  v5 = -[ICDelegateAccountStoreOptions init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dp"));
    v6 = objc_claimAutoreleasedReturnValue();
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("le"));
    v8 = objc_claimAutoreleasedReturnValue();
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sn"));
    v10 = objc_claimAutoreleasedReturnValue();
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v10;

    v5->_singleWriter = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sw"));
  }

  return v5;
}

- (NSString)databasePath
{
  if (self->_databasePath)
    return self->_databasePath;
  else
    return (NSString *)&stru_1E4391778;
}

- (NSString)XPCServiceName
{
  if (self->_serviceName)
    return self->_serviceName;
  else
    return (NSString *)&stru_1E4391778;
}

- (BOOL)isEqual:(id)a3
{
  ICDelegateAccountStoreOptions *v4;
  ICDelegateAccountStoreOptions *v5;
  NSString *databasePath;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;
  NSXPCListenerEndpoint *listenerEndpoint;
  NSXPCListenerEndpoint *v13;
  NSXPCListenerEndpoint *v14;
  NSXPCListenerEndpoint *v15;
  int v16;
  NSString *serviceName;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  int v21;

  v4 = (ICDelegateAccountStoreOptions *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICDelegateAccountStoreOptions isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      databasePath = self->_databasePath;
      v7 = v5->_databasePath;
      if (databasePath == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = databasePath;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_15;
      }
      listenerEndpoint = self->_listenerEndpoint;
      v13 = v5->_listenerEndpoint;
      if (listenerEndpoint == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = listenerEndpoint;
        v16 = -[NSXPCListenerEndpoint isEqual:](v15, "isEqual:", v14);

        if (!v16)
          goto LABEL_15;
      }
      serviceName = self->_serviceName;
      v18 = v5->_serviceName;
      if (serviceName == v18)
      {

      }
      else
      {
        v19 = v18;
        v20 = serviceName;
        v21 = -[NSString isEqual:](v20, "isEqual:", v19);

        if (!v21)
        {
LABEL_15:
          v11 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      v11 = !self->_singleWriter ^ v5->_singleWriter;
      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_19:

  return v11;
}

- (void)setDatabasePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (BOOL)isSingleWriter
{
  return self->_singleWriter;
}

- (void)setSingleWriter:(BOOL)a3
{
  self->_singleWriter = a3;
}

- (NSXPCListenerEndpoint)XPCEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setXPCEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (void)setXPCServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)defaultOptionsWithServiceEndpoint:(id)a3
{
  id v5;
  id *v6;
  id *v7;

  v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

+ (id)singleWriterOptionsWithDatabasePath:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    *((_BYTE *)v5 + 32) = 1;
  }

  return v5;
}

@end
