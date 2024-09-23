@implementation TRIClientTreatmentArtifact

- (TRIClientTreatmentArtifact)initWithEncodedTreatmentDefinition:(id)a3 encodedTreatmentDefinitionSignature:(id)a4 publicCertificate:(id)a5
{
  id v10;
  id v11;
  id v12;
  TRIClientTreatmentArtifact *v13;
  TRIClientTreatmentArtifact *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("encodedTreatmentDefinitionSignature != nil"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("encodedTreatmentDefinition != nil"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("publicCertificate != nil"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIClientTreatmentArtifact;
  v13 = -[TRIClientTreatmentArtifact init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_encodedTreatmentDefinition, a3);
    objc_storeStrong((id *)&v14->_encodedTreatmentDefinitionSignature, a4);
    objc_storeStrong((id *)&v14->_publicCertificate, a5);
  }

  return v14;
}

+ (id)artifactWithEncodedTreatmentDefinition:(id)a3 encodedTreatmentDefinitionSignature:(id)a4 publicCertificate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEncodedTreatmentDefinition:encodedTreatmentDefinitionSignature:publicCertificate:", v10, v9, v8);

  return v11;
}

- (id)copyWithReplacementEncodedTreatmentDefinition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEncodedTreatmentDefinition:encodedTreatmentDefinitionSignature:publicCertificate:", v4, self->_encodedTreatmentDefinitionSignature, self->_publicCertificate);

  return v5;
}

- (id)copyWithReplacementEncodedTreatmentDefinitionSignature:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEncodedTreatmentDefinition:encodedTreatmentDefinitionSignature:publicCertificate:", self->_encodedTreatmentDefinition, v4, self->_publicCertificate);

  return v5;
}

- (id)copyWithReplacementPublicCertificate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEncodedTreatmentDefinition:encodedTreatmentDefinitionSignature:publicCertificate:", self->_encodedTreatmentDefinition, self->_encodedTreatmentDefinitionSignature, v4);

  return v5;
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSData *encodedTreatmentDefinition;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *encodedTreatmentDefinitionSignature;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSData *publicCertificate;
  void *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = self->_encodedTreatmentDefinition != 0;
  objc_msgSend(v4, "encodedTreatmentDefinition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_11;
  encodedTreatmentDefinition = self->_encodedTreatmentDefinition;
  if (encodedTreatmentDefinition)
  {
    objc_msgSend(v5, "encodedTreatmentDefinition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSData isEqual:](encodedTreatmentDefinition, "isEqual:", v10);

    if (!v11)
      goto LABEL_11;
  }
  v12 = self->_encodedTreatmentDefinitionSignature != 0;
  objc_msgSend(v5, "encodedTreatmentDefinitionSignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_11;
  encodedTreatmentDefinitionSignature = self->_encodedTreatmentDefinitionSignature;
  if (encodedTreatmentDefinitionSignature)
  {
    objc_msgSend(v5, "encodedTreatmentDefinitionSignature");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](encodedTreatmentDefinitionSignature, "isEqual:", v16);

    if (!v17)
      goto LABEL_11;
  }
  v18 = self->_publicCertificate != 0;
  objc_msgSend(v5, "publicCertificate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    v23 = 0;
  }
  else
  {
    publicCertificate = self->_publicCertificate;
    if (publicCertificate)
    {
      objc_msgSend(v5, "publicCertificate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSData isEqual:](publicCertificate, "isEqual:", v22);

    }
    else
    {
      v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  TRIClientTreatmentArtifact *v4;
  TRIClientTreatmentArtifact *v5;
  BOOL v6;

  v4 = (TRIClientTreatmentArtifact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIClientTreatmentArtifact isEqualToArtifact:](self, "isEqualToArtifact:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSData hash](self->_encodedTreatmentDefinition, "hash");
  v4 = -[NSString hash](self->_encodedTreatmentDefinitionSignature, "hash") - v3 + 32 * v3;
  return -[NSData hash](self->_publicCertificate, "hash") - v4 + 32 * v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIClientTreatmentArtifact | encodedTreatmentDefinition:%@ encodedTreatmentDefinitionSignature:%@ publicCertificate:%@>"), self->_encodedTreatmentDefinition, self->_encodedTreatmentDefinitionSignature, self->_publicCertificate);
}

- (NSData)encodedTreatmentDefinition
{
  return self->_encodedTreatmentDefinition;
}

- (NSString)encodedTreatmentDefinitionSignature
{
  return self->_encodedTreatmentDefinitionSignature;
}

- (NSData)publicCertificate
{
  return self->_publicCertificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicCertificate, 0);
  objc_storeStrong((id *)&self->_encodedTreatmentDefinitionSignature, 0);
  objc_storeStrong((id *)&self->_encodedTreatmentDefinition, 0);
}

- (BOOL)isValidWithTreatmentId:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  BOOL v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v7 = (void *)MEMORY[0x1E0DC0EA8];
  -[TRIClientTreatmentArtifact encodedTreatmentDefinition](self, "encodedTreatmentDefinition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v7, "parseFromData:error:", v8, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v25;

  if (v9)
  {
    if (objc_msgSend(v9, "hasTreatmentId"))
    {
      objc_msgSend(v9, "treatmentId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
        -[TRIClientTreatmentArtifact publicCertificate](self, "publicCertificate");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTreatmentArtifact+Util.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pubCert"));

        }
        +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          -[TRIClientTreatmentArtifact encodedTreatmentDefinitionSignature](self, "encodedTreatmentDefinitionSignature");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TRIClientTreatmentArtifact encodedTreatmentDefinition](self, "encodedTreatmentDefinition");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v14, "validateBase64Signature:data:", v15, v16);

          if ((v17 & 1) != 0)
          {
            v18 = 1;
LABEL_18:

            goto LABEL_13;
          }
          TRILogCategory_Server();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v5;
            _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Invalid treatment record signature with id %@", buf, 0xCu);
          }

        }
        v18 = 0;
        goto LABEL_18;
      }
    }
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "TRIClientTreatment has nil or mismatched treatmentId";
      v20 = v13;
      v21 = 2;
LABEL_20:
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    }
  }
  else
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      v19 = "Unable to parse TRIClientTreatment from encoded definition: %@";
      v20 = v13;
      v21 = 12;
      goto LABEL_20;
    }
  }
  v18 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v6);
  return v18;
}

@end
