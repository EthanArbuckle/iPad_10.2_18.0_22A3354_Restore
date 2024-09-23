@implementation TPVoucher

- (TPVoucher)initWithObj:(id)a3 data:(id)a4 sig:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  TPVoucher *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *beneficiaryID;
  void *v18;
  uint64_t v19;
  NSString *sponsorID;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[TPStringTable defaultTable](TPStringTable, "defaultTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)TPVoucher;
  v12 = -[TPVoucher init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "reason") - 1;
    if (v13 < 5)
      v14 = v13 + 1;
    else
      v14 = 0;
    v12->_reason = v14;
    objc_msgSend(v8, "beneficiary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    beneficiaryID = v12->_beneficiaryID;
    v12->_beneficiaryID = (NSString *)v16;

    objc_msgSend(v8, "sponsor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithString:", v18);
    v19 = objc_claimAutoreleasedReturnValue();
    sponsorID = v12->_sponsorID;
    v12->_sponsorID = (NSString *)v19;

    objc_storeStrong((id *)&v12->_data, a4);
    objc_storeStrong((id *)&v12->_sig, a5);
  }

  return v12;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[TPVoucher sig](self, "sig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPVoucher data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = checkTypesafeSignature(v4, v5, v6, CFSTR("TPPB.Voucher"));

  return v7;
}

- (id)createRecoveryECPublicKey:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v3 = (objc_class *)MEMORY[0x1E0D8C950];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C948]), "initWithCurve:", 4);
  v11 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithData:specifier:error:", v4, v6, &v11);

  v8 = v11;
  v9 = 0;
  if (!v8)
    v9 = v7;

  return v9;
}

- (id)dictionaryRepresentation
{
  TPPBVoucher *v3;
  void *v4;
  TPPBVoucher *v5;
  void *v6;

  v3 = [TPPBVoucher alloc];
  -[TPVoucher data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBVoucher initWithData:](v3, "initWithData:", v4);

  -[TPPBVoucher dictionaryRepresentation](v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPVoucher dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isEqualToVoucher:(id)a3
{
  TPVoucher *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (TPVoucher *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    -[TPVoucher data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPVoucher data](v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToData:", v6))
    {
      -[TPVoucher sig](self, "sig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPVoucher sig](v4, "sig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToData:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  TPVoucher *v4;
  BOOL v5;

  v4 = (TPVoucher *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TPVoucher isEqualToVoucher:](self, "isEqualToVoucher:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TPVoucher data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TPVoucher sig](self, "sig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  return v6;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSString)beneficiaryID
{
  return self->_beneficiaryID;
}

- (void)setBeneficiaryID:(id)a3
{
  objc_storeStrong((id *)&self->_beneficiaryID, a3);
}

- (NSString)sponsorID
{
  return self->_sponsorID;
}

- (void)setSponsorID:(id)a3
{
  objc_storeStrong((id *)&self->_sponsorID, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSData)sig
{
  return self->_sig;
}

- (void)setSig:(id)a3
{
  objc_storeStrong((id *)&self->_sig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_sponsorID, 0);
  objc_storeStrong((id *)&self->_beneficiaryID, 0);
}

+ (id)voucherWithReason:(unint64_t)a3 beneficiaryID:(id)a4 sponsorID:(id)a5 signingKeyPair:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  TPPBVoucher *v16;
  void *v17;
  void *v18;
  TPVoucher *v19;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(TPPBVoucher);
  -[TPPBVoucher setBeneficiary:](v16, "setBeneficiary:", v15);

  -[TPPBVoucher setSponsor:](v16, "setSponsor:", v14);
  if (a3 - 1 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TPVoucher.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));
    v19 = 0;
  }
  else
  {
    -[TPPBVoucher setReason:](v16, "setReason:", a3);
    -[TPPBVoucher data](v16, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    typesafeSignature(v13, v17, CFSTR("TPPB.Voucher"), a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      v19 = -[TPVoucher initWithObj:data:sig:]([TPVoucher alloc], "initWithObj:data:sig:", v16, v17, v18);
    else
      v19 = 0;

  }
  return v19;
}

+ (id)voucherInfoWithData:(id)a3 sig:(id)a4
{
  id v5;
  id v6;
  TPPBVoucher *v7;
  TPVoucher *v8;

  v5 = a3;
  v6 = a4;
  v7 = -[TPPBVoucher initWithData:]([TPPBVoucher alloc], "initWithData:", v5);
  if (v7)
    v8 = -[TPVoucher initWithObj:data:sig:]([TPVoucher alloc], "initWithObj:data:sig:", v7, v5, v6);
  else
    v8 = 0;

  return v8;
}

@end
