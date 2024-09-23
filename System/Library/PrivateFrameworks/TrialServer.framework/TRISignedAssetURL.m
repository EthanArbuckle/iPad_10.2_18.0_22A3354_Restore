@implementation TRISignedAssetURL

- (TRISignedAssetURL)initWithUrl:(id)a3 signature:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRISignedAssetURL *v11;
  TRISignedAssetURL *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 970, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 971, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("signature != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRISignedAssetURL;
  v11 = -[TRISignedAssetURL init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_signature, a4);
  }

  return v12;
}

+ (id)assetURLWithUrl:(id)a3 signature:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUrl:signature:", v7, v6);

  return v8;
}

- (id)copyWithReplacementUrl:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUrl:signature:", v4, self->_signature);

  return v5;
}

- (id)copyWithReplacementSignature:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUrl:signature:", self->_url, v4);

  return v5;
}

- (BOOL)isEqualToAssetURL:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSURL *url;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *signature;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_url != 0;
  objc_msgSend(v4, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  url = self->_url;
  if (url)
  {
    objc_msgSend(v5, "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSURL isEqual:](url, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_signature != 0;
  objc_msgSend(v5, "signature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    signature = self->_signature;
    if (signature)
    {
      objc_msgSend(v5, "signature");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSString isEqual:](signature, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRISignedAssetURL *v4;
  TRISignedAssetURL *v5;
  BOOL v6;

  v4 = (TRISignedAssetURL *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRISignedAssetURL isEqualToAssetURL:](self, "isEqualToAssetURL:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSURL hash](self->_url, "hash");
  return -[NSString hash](self->_signature, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRISignedAssetURL | url:%@ signature:%@>"), self->_url, self->_signature);
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0C28];
  v5[0] = *MEMORY[0x1E0DC0C30];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0DC0C40];
  v5[2] = *MEMORY[0x1E0DC0C38];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)assetURLFromCKRecord:(id)a3 assetId:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  char v18;
  TRISignedAssetURL *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "values");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C30], 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || !-[NSObject length](v10, "length"))
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v20 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Asset in CloudKit record %@ has missing or corrupt assetId.", buf, 0xCu);

      }
      v19 = 0;
      goto LABEL_41;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0DC0C28]);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        v39 = 2112;
        v40 = v24;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing or corrupt asset.", buf, 0x16u);

      }
      v19 = 0;
      goto LABEL_40;
    }
    -[NSObject fileURL](v12, "fileURL");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v29 = v14;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        v39 = 2112;
        v40 = v30;
        _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing fileURL.", buf, 0x16u);

        v14 = v29;
      }
      v19 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v9, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C38], 0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v9, "triDataForField:", *MEMORY[0x1E0DC0C40]);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = v15;
        +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v35 = v14;
          -[NSObject path](v13, "path");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRISignedAssetURL+CloudKit.m"), 90, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

          }
          v18 = objc_msgSend(v36, "validateBase64Signature:forFile:", v35, v17);

          if ((v18 & 1) != 0)
          {

            objc_storeStrong(a4, v11);
            v14 = v35;
            v19 = -[TRISignedAssetURL initWithUrl:signature:]([TRISignedAssetURL alloc], "initWithUrl:signature:", v13, v35);
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
            goto LABEL_42;
          }
          TRILogCategory_Server();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "recordID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v11;
            v39 = 2112;
            v40 = v33;
            _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Asset %{public}@ from CloudKit record %@ has an invalid signature.", buf, 0x16u);

          }
          v14 = v35;
        }
        else
        {
          TRILogCategory_Server();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "recordID");
            v26 = v14;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v38 = v11;
            v39 = 2112;
            v40 = v27;
            _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has public certificate which cannot be loaded.", buf, 0x16u);

            v14 = v26;
          }
        }

      }
      else
      {
        TRILogCategory_Server();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v7, "recordID");
          v31 = v14;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v11;
          v39 = 2112;
          v40 = v32;
          _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing or corrupt public certificate.", buf, 0x16u);

          v14 = v31;
        }

        v16 = 0;
      }
    }
    else
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "recordID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v11;
        v39 = 2112;
        v40 = v22;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Asset %{public}@ in CloudKit record %@ has missing or corrupt asset signature.", buf, 0x16u);

        v14 = 0;
      }
    }
    v19 = 0;
    goto LABEL_38;
  }
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v7, "recordID");
    v21 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v21;
    _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Could not create Asset artifact from CloudKit record %@.", buf, 0xCu);

  }
  v19 = 0;
LABEL_42:

  return v19;
}

@end
