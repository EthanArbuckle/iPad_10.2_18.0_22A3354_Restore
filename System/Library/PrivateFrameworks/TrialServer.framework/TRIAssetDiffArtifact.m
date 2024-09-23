@implementation TRIAssetDiffArtifact

- (TRIAssetDiffArtifact)initWithSourceAssetId:(id)a3 destAssetId:(id)a4 diffSignature:(id)a5 diff:(id)a6 diffSize:(int64_t)a7 publicCertificate:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  TRIAssetDiffArtifact *v18;
  TRIAssetDiffArtifact *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v28;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v28 = a8;
  v17 = a8;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceAssetId != nil"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2730, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destAssetId != nil"));

  if (v15)
  {
LABEL_4:
    if (v16)
      goto LABEL_5;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2732, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("diff != nil"));

    if (v17)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2731, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("diffSignature != nil"));

  if (!v16)
    goto LABEL_12;
LABEL_5:
  if (v17)
    goto LABEL_6;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2733, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publicCertificate != nil"));

LABEL_6:
  v30.receiver = self;
  v30.super_class = (Class)TRIAssetDiffArtifact;
  v18 = -[TRIAssetDiffArtifact init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sourceAssetId, a3);
    objc_storeStrong((id *)&v19->_destAssetId, a4);
    objc_storeStrong((id *)&v19->_diffSignature, a5);
    objc_storeStrong((id *)&v19->_diff, a6);
    v19->_diffSize = a7;
    objc_storeStrong((id *)&v19->_publicCertificate, v28);
  }

  return v19;
}

+ (id)artifactWithSourceAssetId:(id)a3 destAssetId:(id)a4 diffSignature:(id)a5 diff:(id)a6 diffSize:(int64_t)a7 publicCertificate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", v18, v17, v16, v15, a7, v14);

  return v19;
}

- (id)copyWithReplacementSourceAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", v4, self->_destAssetId, self->_diffSignature, self->_diff, self->_diffSize, self->_publicCertificate);

  return v5;
}

- (id)copyWithReplacementDestAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", self->_sourceAssetId, v4, self->_diffSignature, self->_diff, self->_diffSize, self->_publicCertificate);

  return v5;
}

- (id)copyWithReplacementDiffSignature:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", self->_sourceAssetId, self->_destAssetId, v4, self->_diff, self->_diffSize, self->_publicCertificate);

  return v5;
}

- (id)copyWithReplacementDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", self->_sourceAssetId, self->_destAssetId, self->_diffSignature, v4, self->_diffSize, self->_publicCertificate);

  return v5;
}

- (id)copyWithReplacementDiffSize:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", self->_sourceAssetId, self->_destAssetId, self->_diffSignature, self->_diff, a3, self->_publicCertificate);
}

- (id)copyWithReplacementPublicCertificate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", self->_sourceAssetId, self->_destAssetId, self->_diffSignature, self->_diff, self->_diffSize, v4);

  return v5;
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIAssetId *sourceAssetId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  TRIAssetId *destAssetId;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *diffSignature;
  void *v22;
  int v23;
  int v24;
  void *v25;
  int v26;
  NSURL *diff;
  void *v28;
  int v29;
  int64_t diffSize;
  int v31;
  void *v32;
  int v33;
  NSData *publicCertificate;
  void *v35;
  char v36;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_18;
  v6 = self->_sourceAssetId != 0;
  objc_msgSend(v4, "sourceAssetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_18;
  sourceAssetId = self->_sourceAssetId;
  if (sourceAssetId)
  {
    objc_msgSend(v5, "sourceAssetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIAssetId isEqual:](sourceAssetId, "isEqual:", v10);

    if (!v11)
      goto LABEL_18;
  }
  v12 = self->_destAssetId != 0;
  objc_msgSend(v5, "destAssetId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_18;
  destAssetId = self->_destAssetId;
  if (destAssetId)
  {
    objc_msgSend(v5, "destAssetId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TRIAssetId isEqual:](destAssetId, "isEqual:", v16);

    if (!v17)
      goto LABEL_18;
  }
  v18 = self->_diffSignature != 0;
  objc_msgSend(v5, "diffSignature");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
    goto LABEL_18;
  diffSignature = self->_diffSignature;
  if (diffSignature)
  {
    objc_msgSend(v5, "diffSignature");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[NSString isEqual:](diffSignature, "isEqual:", v22);

    if (!v23)
      goto LABEL_18;
  }
  v24 = self->_diff != 0;
  objc_msgSend(v5, "diff");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (v24 == v26)
    goto LABEL_18;
  diff = self->_diff;
  if (diff)
  {
    objc_msgSend(v5, "diff");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[NSURL isEqual:](diff, "isEqual:", v28);

    if (!v29)
      goto LABEL_18;
  }
  diffSize = self->_diffSize;
  if (diffSize != objc_msgSend(v5, "diffSize")
    || (v31 = self->_publicCertificate != 0,
        objc_msgSend(v5, "publicCertificate"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = v32 == 0,
        v32,
        v31 == v33))
  {
LABEL_18:
    v36 = 0;
  }
  else
  {
    publicCertificate = self->_publicCertificate;
    if (publicCertificate)
    {
      objc_msgSend(v5, "publicCertificate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[NSData isEqual:](publicCertificate, "isEqual:", v35);

    }
    else
    {
      v36 = 1;
    }
  }

  return v36;
}

- (BOOL)isEqual:(id)a3
{
  TRIAssetDiffArtifact *v4;
  TRIAssetDiffArtifact *v5;
  BOOL v6;

  v4 = (TRIAssetDiffArtifact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIAssetDiffArtifact isEqualToArtifact:](self, "isEqualToArtifact:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  NSData *publicCertificate;
  int64_t v8;

  v3 = -[TRIAssetId hash](self->_sourceAssetId, "hash");
  v4 = -[TRIAssetId hash](self->_destAssetId, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_diffSignature, "hash") - v4 + 32 * v4;
  v6 = -[NSURL hash](self->_diff, "hash") - v5 + 32 * v5;
  publicCertificate = self->_publicCertificate;
  v8 = self->_diffSize - v6 + 32 * v6;
  return -[NSData hash](publicCertificate, "hash") - v8 + 32 * v8;
}

- (id)description
{
  id v3;
  NSString *diffSignature;
  NSURL *diff;
  void *v6;
  void *v7;
  __int128 v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = *(_OWORD *)&self->_sourceAssetId;
  diffSignature = self->_diffSignature;
  diff = self->_diff;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_diffSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIAssetDiffArtifact | sourceAssetId:%@ destAssetId:%@ diffSignature:%@ diff:%@ diffSize:%@ publicCertificate:%@>"), v9, diffSignature, diff, v6, self->_publicCertificate);

  return v7;
}

- (TRIAssetId)sourceAssetId
{
  return self->_sourceAssetId;
}

- (TRIAssetId)destAssetId
{
  return self->_destAssetId;
}

- (NSString)diffSignature
{
  return self->_diffSignature;
}

- (NSURL)diff
{
  return self->_diff;
}

- (int64_t)diffSize
{
  return self->_diffSize;
}

- (NSData)publicCertificate
{
  return self->_publicCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicCertificate, 0);
  objc_storeStrong((id *)&self->_diff, 0);
  objc_storeStrong((id *)&self->_diffSignature, 0);
  objc_storeStrong((id *)&self->_destAssetId, 0);
  objc_storeStrong((id *)&self->_sourceAssetId, 0);
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0C10];
  v6[0] = *MEMORY[0x1E0DC0C18];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0DC0BF8];
  v6[2] = *MEMORY[0x1E0DC0C00];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0DC0C20];
  v6[4] = *MEMORY[0x1E0DC0C08];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artifactFromCKRecord:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  TRIAssetDiffArtifact *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __55__TRIAssetDiffArtifact_CloudKit__artifactFromCKRecord___block_invoke;
  v32[3] = &unk_1E932F2B8;
  v5 = v4;
  v33 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v32);
  objc_msgSend(v5, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = *MEMORY[0x1E0DC0C18];
    objc_msgSend(v7, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C18], 0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = *MEMORY[0x1E0DC0C10];
      objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C10], 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v6[2](v6, v11);
        v20 = 0;
LABEL_34:

        goto LABEL_35;
      }
      v13 = *MEMORY[0x1E0DC0C00];
      objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C00], 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v6[2](v6, v13);
        v20 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v15 = (void *)*MEMORY[0x1E0DC0BF8];
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0BF8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        ((void (**)(_QWORD, void *))v6)[2](v6, v15);
        v20 = 0;
LABEL_32:

        goto LABEL_33;
      }
      v17 = *MEMORY[0x1E0DC0C08];
      objc_msgSend(v8, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0C08], 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v6[2](v6, v17);
        v20 = 0;
LABEL_31:

        goto LABEL_32;
      }
      v18 = *MEMORY[0x1E0DC0C20];
      objc_msgSend(v8, "triDataForField:", *MEMORY[0x1E0DC0C20]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        v6[2](v6, v18);
        v20 = 0;
LABEL_30:

        goto LABEL_31;
      }
      TRIValidateAssetId();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      TRIValidateAssetId();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      if (!v29 || !v19)
      {
LABEL_29:

        goto LABEL_30;
      }
      v28 = v19;
      objc_msgSend(v16, "fileURL");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v5, "recordID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(a1, "_signature:onFileURL:fromCloudKitRecordId:isValidUsingPublicCertificate:", v14, v21, v22, v30);

        if (v23)
        {
          v24 = (void *)v21;
          v20 = -[TRIAssetDiffArtifact initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:]([TRIAssetDiffArtifact alloc], "initWithSourceAssetId:destAssetId:diffSignature:diff:diffSize:publicCertificate:", v29, v28, v14, v21, objc_msgSend(v31, "longLongValue"), v30);
LABEL_28:

          v19 = v28;
          goto LABEL_29;
        }
        v24 = (void *)v21;
      }
      else
      {
        v24 = 0;
        TRILogCategory_Server();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v15;
          _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "CKAsset for %@ has no fileURL.", buf, 0xCu);
        }

      }
      v20 = 0;
      goto LABEL_28;
    }
    v6[2](v6, v9);
  }
  else
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v25;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Could not create AssetDiff artifact from CloudKit record %@.", buf, 0xCu);

    }
  }
  v20 = 0;
LABEL_35:

  return v20;
}

void __55__TRIAssetDiffArtifact_CloudKit__artifactFromCKRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "AssetDiff in CloudKit record %@ has missing or corrupt %{public}@.", (uint8_t *)&v6, 0x16u);

  }
}

+ (BOOL)_signature:(id)a3 onFileURL:(id)a4 fromCloudKitRecordId:(id)a5 isValidUsingPublicCertificate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  NSObject *v18;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v12, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIAssetDiffArtifact+CloudKit.m"), 125, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("URL.path"));

  }
  v16 = objc_msgSend(v14, "validateBase64Signature:forFile:", v11, v15);

  if ((v16 & 1) == 0)
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Unable to validate signature on assetDiff from CKRecordID %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  v17 = 1;
LABEL_10:

  return v17;
}

@end
