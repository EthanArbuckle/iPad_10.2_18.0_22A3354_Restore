@implementation ICStoreDialogResponseHandlerConfiguration

- (void)setAllowsHandlingNonAuthenticationDialogs:(BOOL)a3
{
  self->_allowsHandlingNonAuthenticationDialogs = a3;
}

- (ICStoreDialogResponseHandlerConfiguration)init
{
  ICStoreDialogResponseHandlerConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICStoreDialogResponseHandlerConfiguration;
  result = -[ICStoreDialogResponseHandlerConfiguration init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_allowsHandlingNonAuthenticationDialogs = 1;
  return result;
}

- (BOOL)shouldRecordLastAuthenticationDialogResponseTime
{
  return self->_shouldRecordLastAuthenticationDialogResponseTime;
}

- (BOOL)allowsHandlingNonAuthenticationDialogs
{
  return self->_allowsHandlingNonAuthenticationDialogs;
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
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
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
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

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
  v17 = v14 + v13;
  v58 = __ROR8__(v17, 32);
  v59 = v16 ^ __ROR8__(v15, 43);
  v54 = v16 ^ v11;
  v56 = v17 ^ __ROR8__(v13, 47);

  v60 = self->_allowsHandlingNonAuthenticationDialogs | 0xC00000000000000;
  v18 = v60 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)self->_shouldRecordLastAuthenticationDialogResponseTime << 32);
  v19 = (v54 + v56) ^ __ROR8__(v56, 51);
  v20 = v58 + (v18 ^ v59);
  v21 = __ROR8__(v18 ^ v59, 48);
  v22 = (v20 ^ v21) + __ROR8__(v54 + v56, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v55 = v22 ^ v18;
  v57 = v24 ^ __ROR8__(v19, 47);
  v25 = ((v22 ^ v18) + v57) ^ __ROR8__(v57, 51);
  v26 = __ROR8__(v24, 32) + (v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000));
  v27 = __ROR8__(v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000), 48);
  v28 = (v26 ^ v27) + __ROR8__(v55 + v57, 32);
  v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  v30 = v26 + v25;
  v31 = v30 ^ __ROR8__(v25, 47);
  v32 = (v28 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000)) + v31;
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
  ICStoreDialogResponseHandlerConfiguration *v4;
  BOOL v5;

  v4 = (ICStoreDialogResponseHandlerConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else if (!-[ICStoreDialogResponseHandlerConfiguration isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class())|| !self->_allowsHandlingNonAuthenticationDialogs == v4->_allowsHandlingNonAuthenticationDialogs)
  {
    v5 = 0;
  }
  else
  {
    v5 = !self->_shouldRecordLastAuthenticationDialogResponseTime ^ v4->_shouldRecordLastAuthenticationDialogResponseTime;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_BYTE *)result + 8) = self->_allowsHandlingNonAuthenticationDialogs;
    *((_BYTE *)result + 9) = self->_shouldRecordLastAuthenticationDialogResponseTime;
  }
  return result;
}

- (ICStoreDialogResponseHandlerConfiguration)initWithCoder:(id)a3
{
  id v4;
  ICStoreDialogResponseHandlerConfiguration *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICStoreDialogResponseHandlerConfiguration;
  v5 = -[ICStoreDialogResponseHandlerConfiguration init](&v7, sel_init);
  if (v5)
  {
    v5->_allowsHandlingNonAuthenticationDialogs = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsHandlingNonAuthenticationDialogs"));
    v5->_shouldRecordLastAuthenticationDialogResponseTime = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldRecordLastAuthenticationDialogResponseTime"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 allowsHandlingNonAuthenticationDialogs;
  id v5;

  allowsHandlingNonAuthenticationDialogs = self->_allowsHandlingNonAuthenticationDialogs;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", allowsHandlingNonAuthenticationDialogs, CFSTR("allowsHandlingNonAuthenticationDialogs"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldRecordLastAuthenticationDialogResponseTime, CFSTR("shouldRecordLastAuthenticationDialogResponseTime"));

}

- (void)setShouldRecordLastAuthenticationDialogResponseTime:(BOOL)a3
{
  self->_shouldRecordLastAuthenticationDialogResponseTime = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
