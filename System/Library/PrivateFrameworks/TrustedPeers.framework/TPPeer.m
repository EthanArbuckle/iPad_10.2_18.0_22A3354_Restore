@implementation TPPeer

- (NSString)peerID
{
  void *v2;
  void *v3;

  -[TPPeer permanentInfo](self, "permanentInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "peerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (TPPeer)initWithPermanentInfo:(id)a3
{
  id v5;
  TPPeer *v6;
  TPPeer *v7;
  TPPeerStableInfo *stableInfo;
  TPPeerDynamicInfo *dynamicInfo;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPPeer;
  v6 = -[TPPeer init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_permanentInfo, a3);
    stableInfo = v7->_stableInfo;
    v7->_stableInfo = 0;

    dynamicInfo = v7->_dynamicInfo;
    v7->_dynamicInfo = 0;

  }
  return v7;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  TPPeer *v12;
  TPPeer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPPeer;
  v12 = -[TPPeer init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_permanentInfo, a3);
    objc_storeStrong((id *)&v13->_stableInfo, a4);
    objc_storeStrong((id *)&v13->_dynamicInfo, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TPPeer *v4;
  void *v5;
  void *v6;
  void *v7;
  TPPeer *v8;

  v4 = [TPPeer alloc];
  -[TPPeer permanentInfo](self, "permanentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer stableInfo](self, "stableInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:](v4, "initWithPermanentInfo:stableInfo:dynamicInfo:", v5, v6, v7);

  return v8;
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 error:(id *)a6
{
  return -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:checkSig:error:](self, "initWithPermanentInfo:stableInfo:dynamicInfo:checkSig:error:", a3, a4, a5, 1, a6);
}

- (TPPeer)initWithPermanentInfo:(id)a3 stableInfo:(id)a4 dynamicInfo:(id)a5 checkSig:(BOOL)a6 error:(id *)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  TPPeer *v18;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = v14;
  if (!(_DWORD)v8)
    goto LABEL_10;
  if (v13)
  {
    objc_msgSend(v12, "signingPubKey");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "checkSignatureWithKey:", v8) & 1) == 0)
    {

      goto LABEL_13;
    }
    if (!v15)
    {

LABEL_10:
      self = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:](self, "initWithPermanentInfo:stableInfo:dynamicInfo:", v12, v13, v15);
      v18 = self;
      goto LABEL_11;
    }
  }
  else if (!v14)
  {
    goto LABEL_10;
  }
  objc_msgSend(v12, "signingPubKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "checkSignatureWithKey:", v16);

  if (v13)
  if ((v17 & 1) != 0)
    goto LABEL_10;
LABEL_13:
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", TPResultErrorDomain, 1, 0);
    v18 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_11:

  return v18;
}

- (id)calculateHmacWithHmacKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[TPPeer permanentInfo](self, "permanentInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer permanentInfo](self, "permanentInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer stableInfo](self, "stableInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer stableInfo](self, "stableInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPeer calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:](TPPeer, "calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:", v4, v5, v6, v7, v9, v11, v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (TPPeer)peerWithUpdatedStableInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  TPPeer *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  TPPeer *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  -[TPPeer stableInfo](self, "stableInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToPeerStableInfo:", v6);

  if (!v8)
  {
    -[TPPeer permanentInfo](self, "permanentInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingPubKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "checkSignatureWithKey:", v11);

    if ((v12 & 1) != 0)
    {
      -[TPPeer stableInfo](self, "stableInfo");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13
        || (v14 = (void *)v13,
            v15 = objc_msgSend(v6, "clock"),
            -[TPPeer stableInfo](self, "stableInfo"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "clock"),
            v16,
            v14,
            v15 > v17))
      {
        v18 = [TPPeer alloc];
        -[TPPeer permanentInfo](self, "permanentInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPPeer dynamicInfo](self, "dynamicInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:](v18, "initWithPermanentInfo:stableInfo:dynamicInfo:", v19, v6, v20);

        goto LABEL_13;
      }
      if (a4)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = TPResultErrorDomain;
        v23 = 2;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = TPResultErrorDomain;
      v23 = 1;
LABEL_11:
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = (TPPeer *)-[TPPeer copy](self, "copy");
LABEL_13:

  return v9;
}

- (TPPeer)peerWithUpdatedDynamicInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  TPPeer *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  TPPeer *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToPeerDynamicInfo:", v6);

  if (!v8)
  {
    -[TPPeer permanentInfo](self, "permanentInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signingPubKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "checkSignatureWithKey:", v11);

    if ((v12 & 1) != 0)
    {
      -[TPPeer dynamicInfo](self, "dynamicInfo");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13
        || (v14 = (void *)v13,
            v15 = objc_msgSend(v6, "clock"),
            -[TPPeer dynamicInfo](self, "dynamicInfo"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "clock"),
            v16,
            v14,
            v15 > v17))
      {
        v18 = [TPPeer alloc];
        -[TPPeer permanentInfo](self, "permanentInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPPeer stableInfo](self, "stableInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[TPPeer initWithPermanentInfo:stableInfo:dynamicInfo:](v18, "initWithPermanentInfo:stableInfo:dynamicInfo:", v19, v20, v6);

        goto LABEL_13;
      }
      if (a4)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = TPResultErrorDomain;
        v23 = 2;
        goto LABEL_11;
      }
    }
    else if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = TPResultErrorDomain;
      v23 = 1;
LABEL_11:
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v9 = 0;
    goto LABEL_13;
  }
  v9 = (TPPeer *)-[TPPeer copy](self, "copy");
LABEL_13:

  return v9;
}

- (NSSet)trustedPeerIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TPPeer dynamicInfo](self, "dynamicInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TPPeer dynamicInfo](self, "dynamicInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "includedPeerIDs");
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[TPPeer peerID](self, "peerID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObject:", v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  v13[0] = CFSTR("permanentInfo");
  -[TPPeer permanentInfo](self, "permanentInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("stableInfo");
  -[TPPeer stableInfo](self, "stableInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("dynamicInfo");
  -[TPPeer dynamicInfo](self, "dynamicInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (TPPeerPermanentInfo)permanentInfo
{
  return self->_permanentInfo;
}

- (TPPeerStableInfo)stableInfo
{
  return self->_stableInfo;
}

- (TPPeerDynamicInfo)dynamicInfo
{
  return self->_dynamicInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicInfo, 0);
  objc_storeStrong((id *)&self->_stableInfo, 0);
  objc_storeStrong((id *)&self->_permanentInfo, 0);
}

+ (id)calculateHmacWithHmacKey:(id)a3 permanentInfoData:(id)a4 permanentInfoSig:(id)a5 stableInfoData:(id)a6 stableInfoSig:(id)a7 dynamicInfoData:(id)a8 dynamicInfoSig:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_class *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;

  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = (objc_class *)MEMORY[0x1E0C99DF0];
  v20 = a5;
  v21 = a4;
  v22 = objc_alloc_init(v19);
  objc_msgSend(CFSTR("TPPeer"), "dataUsingEncoding:", 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendData:", v23);

  objc_msgSend(v22, "appendData:", v21);
  objc_msgSend(v22, "appendData:", v20);

  if (v15 && v16)
  {
    objc_msgSend(v22, "appendData:", v15);
    objc_msgSend(v22, "appendData:", v16);
  }
  if (v17 && v18)
  {
    objc_msgSend(v22, "appendData:", v17);
    objc_msgSend(v22, "appendData:", v18);
  }
  +[TPHashBuilder keyedHashWithAlgo:key:data:](TPHashBuilder, "keyedHashWithAlgo:key:data:", 4, v14, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (BOOL)verifyHMACWithPermanentInfoData:(id)a3 permanentInfoSig:(id)a4 stableInfoData:(id)a5 stableInfoSig:(id)a6 dynamicInfoData:(id)a7 dynamicInfoSig:(id)a8 hmacKey:(id)a9 hmacSig:(id)a10
{
  id v16;
  void *v17;

  v16 = a10;
  +[TPPeer calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:](TPPeer, "calculateHmacWithHmacKey:permanentInfoData:permanentInfoSig:stableInfoData:stableInfoSig:dynamicInfoData:dynamicInfoSig:", a9, a3, a4, a5, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v17, "isEqualToData:", v16);

  return (char)a7;
}

@end
