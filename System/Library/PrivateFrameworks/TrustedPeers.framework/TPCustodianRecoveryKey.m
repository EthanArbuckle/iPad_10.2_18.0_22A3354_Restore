@implementation TPCustodianRecoveryKey

- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 kind:(int)a6 data:(id)a7 sig:(id)a8 peerID:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TPCustodianRecoveryKey *v21;
  TPCustodianRecoveryKey *v22;
  uint64_t v23;
  NSData *data;
  uint64_t v25;
  NSData *sig;
  void *v27;
  uint64_t v28;
  NSString *peerID;
  id v31;
  objc_super v32;

  v31 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)TPCustodianRecoveryKey;
  v21 = -[TPCustodianRecoveryKey init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_uuid, a3);
    objc_storeStrong((id *)&v22->_signingPublicKey, a4);
    objc_storeStrong((id *)&v22->_encryptionPublicKey, a5);
    v22->_kind = a6;
    v23 = objc_msgSend(v18, "copy");
    data = v22->_data;
    v22->_data = (NSData *)v23;

    v25 = objc_msgSend(v19, "copy");
    sig = v22->_sig;
    v22->_sig = (NSData *)v25;

    +[TPStringTable defaultTable](TPStringTable, "defaultTable");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithString:", v20);
    v28 = objc_claimAutoreleasedReturnValue();
    peerID = v22->_peerID;
    v22->_peerID = (NSString *)v28;

  }
  return v22;
}

- (TPCustodianRecoveryKey)initWithUUID:(id)a3 signingPublicKey:(id)a4 encryptionPublicKey:(id)a5 signingKeyPair:(id)a6 kind:(int)a7 error:(id *)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  TPPBCustodianRecoveryKey *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  TPCustodianRecoveryKey *v25;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = objc_alloc_init(TPPBCustodianRecoveryKey);
  objc_msgSend(v14, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey setUuid:](v18, "setUuid:", v19);

  objc_msgSend(v15, "spki");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey setSigningPublicKey:](v18, "setSigningPublicKey:", v20);

  objc_msgSend(v16, "spki");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBCustodianRecoveryKey setEncryptionPublicKey:](v18, "setEncryptionPublicKey:", v21);

  -[TPPBCustodianRecoveryKey setKind:](v18, "setKind:", v9);
  -[TPPBCustodianRecoveryKey data](v18, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  typesafeSignature(v17, v22, CFSTR("TPPB.CustodianRecoveryKey"), a8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    +[TPCustodianRecoveryKey peerIDForData:sig:peerIDHashAlgo:](TPCustodianRecoveryKey, "peerIDForData:sig:peerIDHashAlgo:", v22, v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[TPCustodianRecoveryKey initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:](self, "initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:", v14, v15, v16, v9, v22, v23, v24);

    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)dictionaryRepresentation
{
  TPPBCustodianRecoveryKey *v3;
  void *v4;
  TPPBCustodianRecoveryKey *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = [TPPBCustodianRecoveryKey alloc];
  -[TPCustodianRecoveryKey data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBCustodianRecoveryKey initWithData:](v3, "initWithData:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[TPPBCustodianRecoveryKey dictionaryRepresentation](v5, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  -[TPCustodianRecoveryKey peerID](self, "peerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("peerID"));

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSUUID copyWithZone:](self->_uuid, "copyWithZone:", a3);
  objc_msgSend(v5, "setUuid:", v6);

  objc_msgSend(v5, "setSigningPublicKey:", self->_signingPublicKey);
  objc_msgSend(v5, "setEncryptionPublicKey:", self->_encryptionPublicKey);
  v7 = (void *)-[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  objc_msgSend(v5, "setPeerID:", v7);

  objc_msgSend(v5, "setKind:", self->_kind);
  return v5;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (TPPublicKey)signingPublicKey
{
  return self->_signingPublicKey;
}

- (void)setSigningPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingPublicKey, a3);
}

- (TPPublicKey)encryptionPublicKey
{
  return self->_encryptionPublicKey;
}

- (void)setEncryptionPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionPublicKey, a3);
}

- (int)kind
{
  return self->_kind;
}

- (void)setKind:(int)a3
{
  self->_kind = a3;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)sig
{
  return self->_sig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_encryptionPublicKey, 0);
  objc_storeStrong((id *)&self->_signingPublicKey, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)peerIDForData:(id)a3 sig:(id)a4 peerIDHashAlgo:(int64_t)a5
{
  id v7;
  id v8;
  TPHashBuilder *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  v9 = -[TPHashBuilder initWithAlgo:]([TPHashBuilder alloc], "initWithAlgo:", a5);
  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v8);

  -[TPHashBuilder updateWithData:](v9, "updateWithData:", v7);
  -[TPHashBuilder finalHash](v9, "finalHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)custodianRecoveryKeyWithData:(id)a3 sig:(id)a4 keyFactory:(id)a5
{
  id v7;
  id v8;
  id v9;
  TPPBCustodianRecoveryKey *v10;
  TPPBCustodianRecoveryKey *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TPCustodianRecoveryKey *v17;
  id v18;
  void *v19;
  void *v20;
  TPCustodianRecoveryKey *v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[TPPBCustodianRecoveryKey initWithData:]([TPPBCustodianRecoveryKey alloc], "initWithData:", v7);
  v11 = v10;
  if (v10)
  {
    -[TPPBCustodianRecoveryKey signingPublicKey](v10, "signingPublicKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "keyFromSPKI:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && checkTypesafeSignature(v13, v8, v7, CFSTR("TPPB.CustodianRecoveryKey")))
    {
      -[TPPBCustodianRecoveryKey encryptionPublicKey](v11, "encryptionPublicKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyFromSPKI:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        +[TPCustodianRecoveryKey peerIDForData:sig:peerIDHashAlgo:](TPCustodianRecoveryKey, "peerIDForData:sig:peerIDHashAlgo:", v7, v8, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = [TPCustodianRecoveryKey alloc];
        v18 = objc_alloc(MEMORY[0x1E0CB3A28]);
        -[TPPBCustodianRecoveryKey uuid](v11, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithUUIDString:", v19);
        v21 = -[TPCustodianRecoveryKey initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:](v17, "initWithUUID:signingPublicKey:encryptionPublicKey:kind:data:sig:peerID:", v20, v13, v15, -[TPPBCustodianRecoveryKey kind](v11, "kind"), v7, v8, v16);

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
