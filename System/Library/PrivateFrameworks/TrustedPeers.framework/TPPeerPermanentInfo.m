@implementation TPPeerPermanentInfo

- (TPPeerPermanentInfo)initWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingPubKey:(id)a6 encryptionPubKey:(id)a7 creationTime:(unint64_t)a8 data:(id)a9 sig:(id)a10 peerID:(id)a11
{
  id v17;
  id v18;
  TPPeerPermanentInfo *v19;
  TPPeerPermanentInfo *v20;
  void *v21;
  uint64_t v22;
  NSString *peerID;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a6;
  v27 = a7;
  v26 = a9;
  v17 = a10;
  v18 = a11;
  v31.receiver = self;
  v31.super_class = (Class)TPPeerPermanentInfo;
  v19 = -[TPPeerPermanentInfo init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_machineID, a3);
    objc_storeStrong((id *)&v20->_modelID, a4);
    v20->_epoch = a5;
    objc_storeStrong((id *)&v20->_signingPubKey, a6);
    objc_storeStrong((id *)&v20->_encryptionPubKey, a7);
    v20->_creationTime = a8;
    objc_storeStrong((id *)&v20->_data, a9);
    objc_storeStrong((id *)&v20->_sig, a10);
    +[TPStringTable defaultTable](TPStringTable, "defaultTable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithString:", v18);
    v22 = objc_claimAutoreleasedReturnValue();
    peerID = v20->_peerID;
    v20->_peerID = (NSString *)v22;

  }
  return v20;
}

- (id)dictionaryRepresentation
{
  TPPBPeerPermanentInfo *v3;
  void *v4;
  TPPBPeerPermanentInfo *v5;
  void *v6;

  v3 = [TPPBPeerPermanentInfo alloc];
  -[TPPeerPermanentInfo data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPeerPermanentInfo initWithData:](v3, "initWithData:", v4);

  -[TPPBPeerPermanentInfo dictionaryRepresentation](v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerPermanentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (TPPublicKey)signingPubKey
{
  return self->_signingPubKey;
}

- (TPPublicKey)encryptionPubKey
{
  return self->_encryptionPubKey;
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (NSData)data
{
  return self->_data;
}

- (NSData)sig
{
  return self->_sig;
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_sig, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_encryptionPubKey, 0);
  objc_storeStrong((id *)&self->_signingPubKey, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
}

+ (id)mungeModelID:(id)a3
{
  return a3;
}

+ (id)permanentInfoWithMachineID:(id)a3 modelID:(id)a4 epoch:(unint64_t)a5 signingKeyPair:(id)a6 encryptionKeyPair:(id)a7 creationTime:(unint64_t)a8 peerIDHashAlgo:(int64_t)a9 error:(id *)a10
{
  id *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  TPPBPeerPermanentInfo *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  TPPeerPermanentInfo *v35;
  void *v37;
  id v38;
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v15 = a10;
  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a6;
  objc_msgSend(v19, "publicKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "publicKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (TPBecomeiProdOverride())
  {
    v38 = 0;
    v22 = a8;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^[^0-9,]*"), 0, &v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v38;
    if (v23)
    {
      objc_msgSend(v23, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, -[NSObject length](v17, "length"), CFSTR("iProd"));
      v25 = v17;
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TPModelLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v24;
        _os_log_impl(&dword_1DE1BE000, v25, OS_LOG_TYPE_DEFAULT, "Failed to make regex; cannot change modelID: %{public}@",
          buf,
          0xCu);
      }
    }

    a8 = v22;
    v15 = a10;
  }
  +[TPPeerPermanentInfo mungeModelID:](TPPeerPermanentInfo, "mungeModelID:", v17);
  v26 = objc_claimAutoreleasedReturnValue();

  v27 = objc_alloc_init(TPPBPeerPermanentInfo);
  -[TPPBPeerPermanentInfo setMachineId:](v27, "setMachineId:", v16);
  v37 = (void *)v26;
  -[TPPBPeerPermanentInfo setModelId:](v27, "setModelId:", v26);
  -[TPPBPeerPermanentInfo setEpoch:](v27, "setEpoch:", a5);
  objc_msgSend(v20, "spki");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerPermanentInfo setSigningPubKey:](v27, "setSigningPubKey:", v28);

  objc_msgSend(v21, "spki");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerPermanentInfo setEncryptionPubKey:](v27, "setEncryptionPubKey:", v29);

  -[TPPBPeerPermanentInfo setCreationTime:](v27, "setCreationTime:", a8);
  -[TPPBPeerPermanentInfo data](v27, "data");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  typesafeSignature(v19, v30, CFSTR("TPPB.PeerPermanentInfo"), v15);
  v31 = v16;
  v32 = a8;
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    +[TPPeerPermanentInfo peerIDForData:sig:peerIDHashAlgo:](TPPeerPermanentInfo, "peerIDForData:sig:peerIDHashAlgo:", v30, v33, a9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[TPPeerPermanentInfo initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:]([TPPeerPermanentInfo alloc], "initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:", v31, v37, a5, v20, v21, v32, v30, v33, v34);

  }
  else
  {
    v35 = 0;
  }

  return v35;
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

+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6
{
  return +[TPPeerPermanentInfo permanentInfoWithPeerID:data:sig:keyFactory:checkSig:](TPPeerPermanentInfo, "permanentInfoWithPeerID:data:sig:keyFactory:checkSig:", a3, a4, a5, a6, 1);
}

+ (id)permanentInfoWithPeerID:(id)a3 data:(id)a4 sig:(id)a5 keyFactory:(id)a6 checkSig:(BOOL)a7
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  TPPBPeerPermanentInfo *v15;
  TPPBPeerPermanentInfo *v16;
  void *v17;
  TPPeerPermanentInfo *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  TPPeerPermanentInfo *v29;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[TPPBPeerPermanentInfo initWithData:]([TPPBPeerPermanentInfo alloc], "initWithData:", v12);
  v16 = v15;
  if (v15)
  {
    -[TPPBPeerPermanentInfo signingPubKey](v15, "signingPubKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (TPPeerPermanentInfo *)objc_msgSend(v17, "length");

    if (v18)
    {
      -[TPPBPeerPermanentInfo encryptionPubKey](v16, "encryptionPubKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (TPPeerPermanentInfo *)objc_msgSend(v19, "length");

      if (v18)
      {
        -[TPPBPeerPermanentInfo signingPubKey](v16, "signingPubKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "keyFromSPKI:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21
          || v7 && !checkTypesafeSignature(v21, v13, v12, CFSTR("TPPB.PeerPermanentInfo"))
          || (v22 = +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v11), v22 == -1))
        {
          v18 = 0;
        }
        else
        {
          +[TPPeerPermanentInfo peerIDForData:sig:peerIDHashAlgo:](TPPeerPermanentInfo, "peerIDForData:sig:peerIDHashAlgo:", v12, v13, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "isEqualToString:", v11))
          {
            -[TPPBPeerPermanentInfo encryptionPubKey](v16, "encryptionPubKey");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "keyFromSPKI:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v29 = [TPPeerPermanentInfo alloc];
              -[TPPBPeerPermanentInfo machineId](v16, "machineId");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPPBPeerPermanentInfo modelId](v16, "modelId");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[TPPeerPermanentInfo initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:](v29, "initWithMachineID:modelID:epoch:signingPubKey:encryptionPubKey:creationTime:data:sig:peerID:", v28, v26, -[TPPBPeerPermanentInfo epoch](v16, "epoch"), v21, v25, -[TPPBPeerPermanentInfo creationTime](v16, "creationTime"), v12, v13, v11);

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
      }
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
