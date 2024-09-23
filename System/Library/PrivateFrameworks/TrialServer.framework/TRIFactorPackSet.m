@implementation TRIFactorPackSet

- (TRIFactorPackSet)initWithIdent:(id)a3 packs:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIFactorPackSet *v11;
  TRIFactorPackSet *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ident != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("packs != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIFactorPackSet;
  v11 = -[TRIFactorPackSet init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_ident, a3);
    objc_storeStrong((id *)&v12->_packs, a4);
  }

  return v12;
}

+ (id)setWithIdent:(id)a3 packs:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdent:packs:", v7, v6);

  return v8;
}

- (id)copyWithReplacementIdent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdent:packs:", v4, self->_packs);

  return v5;
}

- (id)copyWithReplacementPacks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdent:packs:", self->_ident, v4);

  return v5;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIFactorPackSetId *ident;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSArray *packs;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_ident != 0;
  objc_msgSend(v4, "ident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  ident = self->_ident;
  if (ident)
  {
    objc_msgSend(v5, "ident");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIFactorPackSetId isEqual:](ident, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_packs != 0;
  objc_msgSend(v5, "packs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    packs = self->_packs;
    if (packs)
    {
      objc_msgSend(v5, "packs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSArray isEqual:](packs, "isEqual:", v16);

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
  TRIFactorPackSet *v4;
  TRIFactorPackSet *v5;
  BOOL v6;

  v4 = (TRIFactorPackSet *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFactorPackSet isEqualToSet:](self, "isEqualToSet:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIFactorPackSetId hash](self->_ident, "hash");
  return -[NSArray hash](self->_packs, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIFactorPackSet | ident:%@ packs:%@>"), self->_ident, self->_packs);
}

- (TRIFactorPackSetId)ident
{
  return self->_ident;
}

- (NSArray)packs
{
  return self->_packs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packs, 0);
  objc_storeStrong((id *)&self->_ident, 0);
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0D68];
  v5[0] = *MEMORY[0x1E0DC0D70];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0DC0D78];
  v5[2] = *MEMORY[0x1E0DC0D60];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artifactFromCKRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char isKindOfClass;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  TRIFactorPackSet *v25;
  TRIFactorPackSet *v26;
  TRIFactorPackSet *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *obj;
  os_log_t log;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  NSObject *v48;
  __int16 v49;
  NSObject *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0D68], 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7
      || -[NSObject count](v7, "count")
      && (-[NSObject objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", 0),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) == 0))
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "recordID");
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v29;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt factor pack definitions.", buf, 0xCu);

      }
      v27 = 0;
      goto LABEL_50;
    }
    objc_msgSend(v6, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0D60], 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11
      || -[NSObject count](v11, "count")
      && (-[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", 0),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v14 = objc_opt_isKindOfClass(),
          v13,
          (v14 & 1) == 0))
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "recordID");
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v32;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt factor pack definition signatures.", buf, 0xCu);

      }
      v27 = 0;
      goto LABEL_49;
    }
    objc_msgSend(v6, "triDataForField:", *MEMORY[0x1E0DC0D78]);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "recordID");
        v35 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v35;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt public certificate.", buf, 0xCu);

      }
      v27 = 0;
      goto LABEL_48;
    }
    objc_msgSend(v6, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0D70], 0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      TRILogCategory_Server();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "recordID");
        v36 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v36;
        _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "FactorPackSet in CloudKit record %@ has missing or corrupt factor pack set id.", buf, 0xCu);

      }
      v27 = 0;
      goto LABEL_47;
    }
    TRIValidateFactorPackSetId();
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if ((objc_msgSend(a1, "_signatures:onItems:areValidUsingPublicCertificate:", v12, v8, v15) & 1) != 0)
      {
        v37 = v16;
        v38 = v17;
        log = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSObject count](v8, "count"));
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        obj = v8;
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v43;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v43 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
              v41 = 0;
              v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC09D8]), "initWithData:error:", v22, &v41);
              if (!v23)
              {
                TRILogCategory_Server();
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v48 = v38;
                  v49 = 2114;
                  v50 = v41;
                  _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Failed to parse factor pack contained in factor pack set %{public}@: %{public}@", buf, 0x16u);
                }

                v27 = 0;
                v16 = v37;
                v17 = v38;
                goto LABEL_46;
              }
              v24 = (void *)v23;
              -[NSObject addObject:](log, "addObject:", v23);

            }
            v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
            if (v19)
              continue;
            break;
          }
        }

        v17 = v38;
        v25 = -[TRIFactorPackSet initWithIdent:packs:]([TRIFactorPackSet alloc], "initWithIdent:packs:", v38, log);
        if (-[TRIFactorPackSet isStructurallyValid](v25, "isStructurallyValid"))
          v26 = v25;
        else
          v26 = 0;
        v27 = v26;

        v16 = v37;
        goto LABEL_46;
      }
      TRILogCategory_Server();
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
LABEL_42:
        v27 = 0;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      objc_msgSend(v4, "recordID");
      v30 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v30;
      v49 = 2114;
      v50 = v17;
      v31 = "CloudKit record %@ with factor pack set id %{public}@ does not have valid signatures.";
    }
    else
    {
      TRILogCategory_Server();
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      objc_msgSend(v4, "recordID");
      v30 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v30;
      v49 = 2114;
      v50 = v16;
      v31 = "CloudKit record %@ has factor pack set id which was rejected as unsuitable: %{public}@";
    }
    _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, v31, buf, 0x16u);

    goto LABEL_42;
  }
  TRILogCategory_Server();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "recordID");
    v28 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v28;
    _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Could not create FactorPackSet artifact from CloudKit record %@.", buf, 0xCu);

  }
  v27 = 0;
LABEL_51:

  return v27;
}

+ (BOOL)_signatures:(id)a3 onItems:(id)a4 areValidUsingPublicCertificate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "count");
  if (v10 == objc_msgSend(v8, "count"))
  {
    +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (objc_msgSend(v7, "count"))
      {
        v12 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "validateBase64Signature:data:", v13, v14);

          if ((v15 & 1) == 0)
            break;
          ++v12;
        }
        while (v12 < objc_msgSend(v7, "count"));
      }
      else
      {
        v15 = 1;
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isStructurallyValid
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  NSObject *v31;
  void *v33;
  TRIFactorPackSet *v34;
  void *v35;
  id obj;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[4];
  id v45;
  TRIFactorPackSet *v46;
  id v47;
  _BYTE *v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE buf[24];
  char v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  v34 = self;
  -[TRIFactorPackSet packs](self, "packs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[TRIFactorPackSet packs](v34, "packs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v52;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v52 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D8232A5C]();
        if ((objc_msgSend(v8, "hasFactorPackId") & 1) == 0)
        {
          TRILogCategory_Server();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            -[TRIFactorPackSet ident](v34, "ident");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v33;
            _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Factor pack set %{public}@ contains factor pack with missing id", buf, 0xCu);

          }
LABEL_34:
          objc_autoreleasePoolPop(v9);
LABEL_35:
          v30 = 0;
          goto LABEL_36;
        }
        objc_msgSend(v8, "factorPackId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        TRIValidateFactorPackId();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_34;
        objc_msgSend(v8, "selectedNamespace");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "hasSelectedNamespace")
          && objc_msgSend(v12, "hasName")
          && (objc_msgSend(v12, "name"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "triIsPathSafe"),
              v13,
              (v14 & 1) != 0))
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v60 = 0;
          objc_msgSend(v12, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v16 = (void *)objc_opt_new();
            objc_msgSend(v12, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v16, v17);

          }
          v18 = (void *)objc_opt_new();
          objc_msgSend(v12, "compatibilityVersionArray");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke;
          v49[3] = &unk_1E93306F0;
          v20 = v18;
          v50 = v20;
          objc_msgSend(v19, "enumerateValuesWithBlock:", v49);

          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_2;
          v44[3] = &unk_1E9333868;
          v21 = v16;
          v45 = v21;
          v46 = v34;
          v22 = v12;
          v47 = v22;
          v48 = buf;
          objc_msgSend(v20, "enumerateObjectsUsingBlock:", v44);
          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            v23 = 1;
          }
          else
          {
            v40 = 0;
            v41 = &v40;
            v42 = 0x2020000000;
            v43 = 0;
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_7;
            v37[3] = &unk_1E9331060;
            v26 = v22;
            v38 = v26;
            v39 = &v40;
            objc_msgSend(v8, "enumerateFactorLevelsWithBlock:", v37);
            if (*((_BYTE *)v41 + 24))
            {
              TRILogCategory_Server();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v26, "name");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v55 = 138543618;
                v56 = v11;
                v57 = 2114;
                v58 = v28;
                _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "FactorPack %{public}@ has selectedNamespace %{public}@ which does not match all contained factors.", v55, 0x16u);

              }
              v23 = 1;
            }
            else
            {
              v23 = 0;
            }

            _Block_object_dispose(&v40, 8);
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          TRILogCategory_Server();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v11;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v25;
            _os_log_error_impl(&dword_1D207F000, v24, OS_LOG_TYPE_ERROR, "FactorPack %{public}@ has invalid selectedNamespace.name: \"%{public}@\", buf, 0x16u);

          }
          v23 = 1;
        }

        objc_autoreleasePoolPop(v9);
        if (v23)
          goto LABEL_35;
        ++v7;
      }
      while (v5 != v7);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      v5 = v29;
      v30 = 1;
    }
    while (v29);
  }
  else
  {
    v30 = 1;
  }
LABEL_36:

  return v30;
}

void __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "ident");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "compatibilityVersionArray");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544386;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Factor pack set %{public}@ contains multiple factor packs with NCV (%{public}@, %@). Selected namespace %{public}@ -> %{public}@", (uint8_t *)&v11, 0x34u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

void __46__TRIFactorPackSet_Utils__isStructurallyValid__block_invoke_7(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "hasFactor"))
  {
    objc_msgSend(v10, "factor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasNamespaceName") & 1) != 0)
    {
      objc_msgSend(v10, "factor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "namespaceName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if ((v9 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  *a3 = 1;
LABEL_7:

}

@end
