@implementation TPPeerDynamicInfo

- (TPPeerDynamicInfo)initWithObj:(id)a3 tsd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TPPeerDynamicInfo *v9;
  void *v10;
  uint64_t v11;
  NSSet *includedPeerIDs;
  void *v13;
  uint64_t v14;
  NSSet *excludedPeerIDs;
  void *v16;
  uint64_t v17;
  NSSet *preapprovals;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  +[TPStringTable defaultTable](TPStringTable, "defaultTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)TPPeerDynamicInfo;
  v9 = -[TPPeerDynamicInfo init](&v20, sel_init);
  if (v9)
  {
    v9->_clock = objc_msgSend(v6, "clock");
    objc_msgSend(v6, "includeds");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    includedPeerIDs = v9->_includedPeerIDs;
    v9->_includedPeerIDs = (NSSet *)v11;

    objc_msgSend(v6, "excludeds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    excludedPeerIDs = v9->_excludedPeerIDs;
    v9->_excludedPeerIDs = (NSSet *)v14;

    objc_msgSend(v6, "preapprovals");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    preapprovals = v9->_preapprovals;
    v9->_preapprovals = (NSSet *)v17;

    objc_storeStrong((id *)&v9->_tsd, a4);
  }

  return v9;
}

- (id)pb
{
  TPPBPeerDynamicInfo *v3;
  void *v4;
  TPPBPeerDynamicInfo *v5;

  v3 = [TPPBPeerDynamicInfo alloc];
  -[TPPeerDynamicInfo data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPeerDynamicInfo initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (NSDictionary)dispositions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  +[TPStringTable defaultTable](TPStringTable, "defaultTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)MEMORY[0x1DF0E9908]();
  -[TPPeerDynamicInfo pb](self, "pb");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispositions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__TPPeerDynamicInfo_dispositions__block_invoke;
  v11[3] = &unk_1EA8BF0E8;
  v8 = v4;
  v12 = v8;
  v9 = v3;
  v13 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  objc_autoreleasePoolPop(v5);
  return (NSDictionary *)v8;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TPPeerDynamicInfo tsd](self, "tsd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkSignatureWithKey:", v4);

  return v6;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[TPPeerDynamicInfo tsd](self, "tsd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sig
{
  void *v2;
  void *v3;

  -[TPPeerDynamicInfo tsd](self, "tsd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)isEqualToPeerDynamicInfo:(id)a3
{
  TPPeerDynamicInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (TPPeerDynamicInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    -[TPPeerDynamicInfo data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPeerDynamicInfo data](v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToData:", v6))
    {
      -[TPPeerDynamicInfo sig](self, "sig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPPeerDynamicInfo sig](v4, "sig");
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

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerDynamicInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerDynamicInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  TPPeerDynamicInfo *v4;
  BOOL v5;

  v4 = (TPPeerDynamicInfo *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPPeerDynamicInfo isEqualToPeerDynamicInfo:](self, "isEqualToPeerDynamicInfo:", v4);
  }

  return v5;
}

- (unint64_t)clock
{
  return self->_clock;
}

- (NSSet)includedPeerIDs
{
  return self->_includedPeerIDs;
}

- (NSSet)excludedPeerIDs
{
  return self->_excludedPeerIDs;
}

- (NSSet)preapprovals
{
  return self->_preapprovals;
}

- (TPTypedSignedData)tsd
{
  return self->_tsd;
}

- (void)setTsd:(id)a3
{
  objc_storeStrong((id *)&self->_tsd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tsd, 0);
  objc_storeStrong((id *)&self->_preapprovals, 0);
  objc_storeStrong((id *)&self->_excludedPeerIDs, 0);
  objc_storeStrong((id *)&self->_includedPeerIDs, 0);
}

void __33__TPPeerDynamicInfo_dispositions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "peerID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v11, "disposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v11, "disposition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 32);
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v11, "peerID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v10);

    }
  }

}

+ (id)dynamicInfoPBWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  TPPBPeerDynamicInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  TPPBPeerDynamicInfo *v23;
  _QWORD v25[4];
  TPPBPeerDynamicInfo *v26;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = objc_alloc_init(TPPBPeerDynamicInfo);
  -[TPPBPeerDynamicInfo setClock:](v15, "setClock:", a3);
  objc_msgSend(v14, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v16, "mutableCopy");
  -[TPPBPeerDynamicInfo setIncludeds:](v15, "setIncludeds:", v17);

  objc_msgSend(v13, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  -[TPPBPeerDynamicInfo setExcludeds:](v15, "setExcludeds:", v19);

  objc_msgSend(v11, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  -[TPPBPeerDynamicInfo setPreapprovals:](v15, "setPreapprovals:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[TPPBPeerDynamicInfo setDispositions:](v15, "setDispositions:", v22);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __102__TPPeerDynamicInfo_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals___block_invoke;
  v25[3] = &unk_1EA8BF0C0;
  v23 = v15;
  v26 = v23;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v25);

  return v23;
}

+ (id)dynamicInfoWithClock:(unint64_t)a3 includedPeerIDs:(id)a4 excludedPeerIDs:(id)a5 dispositions:(id)a6 preapprovals:(id)a7 signingKeyPair:(id)a8 error:(id *)a9
{
  TPPeerDynamicInfo *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  TPTypedSignedData *v23;
  id v24;
  TPPeerDynamicInfo *v26;
  id v27;

  v15 = (TPPeerDynamicInfo *)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)MEMORY[0x1DF0E9908]();
  v26 = v15;
  objc_msgSend(a1, "dynamicInfoPBWithClock:includedPeerIDs:excludedPeerIDs:dispositions:preapprovals:", a3, v15, v16, v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v23 = -[TPTypedSignedData initWithData:key:signatureTypeName:error:]([TPTypedSignedData alloc], "initWithData:key:signatureTypeName:error:", v22, v19, CFSTR("TPPB.PeerDynamicInfo"), &v27);
  v24 = v27;
  if (v23)
    v15 = -[TPPeerDynamicInfo initWithObj:tsd:]([TPPeerDynamicInfo alloc], "initWithObj:tsd:", v21, v23);

  objc_autoreleasePoolPop(v20);
  if (!v23)
  {
    v15 = 0;
    if (a9)
    {
      if (v24)
      {
        v15 = 0;
        *a9 = objc_retainAutorelease(v24);
      }
    }
  }

  return v15;
}

+ (id)dynamicInfoWithData:(id)a3 sig:(id)a4
{
  id v5;
  id v6;
  void *v7;
  TPPBPeerDynamicInfo *v8;
  TPPeerDynamicInfo *v9;
  TPTypedSignedData *v10;
  TPPeerDynamicInfo *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1DF0E9908]();
  v8 = -[TPPBPeerDynamicInfo initWithData:]([TPPBPeerDynamicInfo alloc], "initWithData:", v5);
  if (v8)
  {
    v9 = [TPPeerDynamicInfo alloc];
    v10 = -[TPTypedSignedData initWithData:sig:signatureTypeName:]([TPTypedSignedData alloc], "initWithData:sig:signatureTypeName:", v5, v6, CFSTR("TPPB.PeerDynamicInfo"));
    v11 = -[TPPeerDynamicInfo initWithObj:tsd:](v9, "initWithObj:tsd:", v8, v10);

  }
  else
  {
    v11 = 0;
  }

  objc_autoreleasePoolPop(v7);
  return v11;
}

void __102__TPPeerDynamicInfo_dynamicInfoPBWithClock_includedPeerIDs_excludedPeerIDs_dispositions_preapprovals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  TPPBDispositionEntry *v8;

  v5 = a3;
  v6 = a2;
  v8 = objc_alloc_init(TPPBDispositionEntry);
  -[TPPBDispositionEntry setPeerID:](v8, "setPeerID:", v6);

  -[TPPBDispositionEntry setDisposition:](v8, "setDisposition:", v5);
  objc_msgSend(*(id *)(a1 + 32), "dispositions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

@end
