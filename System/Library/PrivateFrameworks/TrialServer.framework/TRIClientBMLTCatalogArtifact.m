@implementation TRIClientBMLTCatalogArtifact

- (TRIClientBMLTCatalogArtifact)initWithBmltCatalog:(id)a3 population:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIClientBMLTCatalogArtifact *v11;
  TRIClientBMLTCatalogArtifact *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2386, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bmltCatalog != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("population != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIClientBMLTCatalogArtifact;
  v11 = -[TRIClientBMLTCatalogArtifact init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bmltCatalog, a3);
    objc_storeStrong((id *)&v12->_population, a4);
  }

  return v12;
}

+ (id)artifactWithBmltCatalog:(id)a3 population:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBmltCatalog:population:", v7, v6);

  return v8;
}

- (id)copyWithReplacementBmltCatalog:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltCatalog:population:", v4, self->_population);

  return v5;
}

- (id)copyWithReplacementPopulation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBmltCatalog:population:", self->_bmltCatalog, v4);

  return v5;
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIClientBmltCatalog *bmltCatalog;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSNumber *population;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_bmltCatalog != 0;
  objc_msgSend(v4, "bmltCatalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  bmltCatalog = self->_bmltCatalog;
  if (bmltCatalog)
  {
    objc_msgSend(v5, "bmltCatalog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIClientBmltCatalog isEqual:](bmltCatalog, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_population != 0;
  objc_msgSend(v5, "population");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    population = self->_population;
    if (population)
    {
      objc_msgSend(v5, "population");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSNumber isEqual:](population, "isEqual:", v16);

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
  TRIClientBMLTCatalogArtifact *v4;
  TRIClientBMLTCatalogArtifact *v5;
  BOOL v6;

  v4 = (TRIClientBMLTCatalogArtifact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIClientBMLTCatalogArtifact isEqualToArtifact:](self, "isEqualToArtifact:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIClientBmltCatalog hash](self->_bmltCatalog, "hash");
  return -[NSNumber hash](self->_population, "hash") - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIClientBMLTCatalogArtifact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  TRIClientBMLTCatalogArtifact *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bmltCatalog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("population"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v23 = *MEMORY[0x1E0CB2D50];
        v24 = CFSTR("Retrieved nil serialized value for nonnull TRIClientBMLTCatalogArtifact.population");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTCatalogArtifactOCNTErrorDomain"), 2, v11);
        objc_msgSend(v4, "failWithError:", v12);

      }
      v7 = 0;
      goto LABEL_13;
    }
    v7 = (void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self = -[TRIClientBMLTCatalogArtifact initWithBmltCatalog:population:](self, "initWithBmltCatalog:population:", v5, v7);
      v8 = self;
LABEL_14:

      goto LABEL_15;
    }
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIClientBMLTCatalogArtifact key \"population\" (expected %@, decoded %@)"), v14, v16, 0);
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTCatalogArtifactOCNTErrorDomain"), 3, v18);
    objc_msgSend(v4, "failWithError:", v19);

LABEL_12:
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = CFSTR("Retrieved nil serialized value for nonnull TRIClientBMLTCatalogArtifact.bmltCatalog");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientBMLTCatalogArtifactOCNTErrorDomain"), 2, v7);
    objc_msgSend(v4, "failWithError:", v14);
    goto LABEL_12;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TRIClientBmltCatalog *bmltCatalog;
  NSNumber *population;
  id v7;

  v4 = a3;
  bmltCatalog = self->_bmltCatalog;
  v7 = v4;
  if (bmltCatalog)
  {
    objc_msgSend(v4, "encodeObject:forKey:", bmltCatalog, CFSTR("bmltCatalog"));
    v4 = v7;
  }
  population = self->_population;
  if (population)
  {
    objc_msgSend(v7, "encodeObject:forKey:", population, CFSTR("population"));
    v4 = v7;
  }

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIClientBMLTCatalogArtifact | bmltCatalog:%@ population:%@>"), self->_bmltCatalog, self->_population);
}

- (TRIClientBmltCatalog)bmltCatalog
{
  return self->_bmltCatalog;
}

- (NSNumber)population
{
  return self->_population;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_population, 0);
  objc_storeStrong((id *)&self->_bmltCatalog, 0);
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0C50];
  v5[0] = *MEMORY[0x1E0DC0C60];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0DC0C68];
  v5[2] = *MEMORY[0x1E0DC0C58];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artifactFromCKRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  TRIClientBMLTCatalogArtifact *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0C60], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "recordID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v72 = v52;
        _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt population value.", buf, 0xCu);

      }
      if (!a4)
      {
        v9 = 0;
        v17 = 0;
LABEL_55:

        goto LABEL_56;
      }
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("CloudKit record %@ for BMLT catalog has missing or corrupt population value."), v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v83 = *MEMORY[0x1E0CB2D50];
      v84 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v26, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v11);
      v17 = 0;
      v12 = *a4;
      *a4 = v27;
      goto LABEL_52;
    }
    objc_msgSend(v8, "triDataForField:", *MEMORY[0x1E0DC0C50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      TRILogCategory_Server();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "recordID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v72 = v61;
        _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition.", buf, 0xCu);

      }
      if (!a4)
      {
        v10 = 0;
        v17 = 0;
LABEL_54:

        goto LABEL_55;
      }
      v29 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "recordID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition."), v30);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v81 = *MEMORY[0x1E0CB2D50];
      v82 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v12);
      v17 = 0;
      v14 = *a4;
      *a4 = v32;
      goto LABEL_51;
    }
    objc_msgSend(v8, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0C58], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "triDataForField:", *MEMORY[0x1E0DC0C68]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        TRILogCategory_Server();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "recordID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v72 = v64;
          _os_log_error_impl(&dword_1D207F000, v46, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt public certificate.", buf, 0xCu);

        }
        if (!a4)
        {
          v12 = 0;
          v17 = 0;
LABEL_52:

          goto LABEL_53;
        }
        v47 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "recordID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", CFSTR("CloudKit record %@ for BMLT catalog has missing or corrupt public certificate."), v48);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v77 = *MEMORY[0x1E0CB2D50];
        v78 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
        v67 = (id)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(v49, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
        v17 = 0;
        v15 = *a4;
        *a4 = v50;
        goto LABEL_49;
      }
      +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && (objc_msgSend(v13, "validateBase64Signature:data:", v11, v10) & 1) != 0)
      {
        v68 = 0;
        objc_msgSend(MEMORY[0x1E0DC0E80], "parseFromData:error:", v10, &v68);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v68;
        if (v15)
        {
          if (objc_msgSend(a1, "_hasStructurallyValidBMLTs:population:", v15, v9))
          {
            TRILogCategory_Server();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEBUG, "Decoded valid and device-compatible BMLT catalog notification. This means we are ack’ing the CK notification, not acting on it.", buf, 2u);
            }

            v17 = -[TRIClientBMLTCatalogArtifact initWithBmltCatalog:population:]([TRIClientBMLTCatalogArtifact alloc], "initWithBmltCatalog:population:", v15, v9);
            goto LABEL_49;
          }
        }
        else
        {
          TRILogCategory_Server();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "recordID");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v72 = v65;
            v73 = 2114;
            v74 = v67;
            _os_log_error_impl(&dword_1D207F000, v53, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has unparseable BMLT catalog definition: %{public}@", buf, 0x16u);

          }
          if (a4)
          {
            v54 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "recordID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringWithFormat:", CFSTR("CloudKit record %@ for BMLT catalog has unparseable BMLT catalog definition: %@"), v55, v67);
            v66 = (void *)objc_claimAutoreleasedReturnValue();

            v56 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v69 = *MEMORY[0x1E0CB2D50];
            v70 = v66;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)objc_msgSend(v56, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v57);
            v59 = *a4;
            *a4 = v58;

          }
          v15 = 0;
        }
      }
      else
      {
        TRILogCategory_Server();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "recordID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v72 = v63;
          _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog does not have a valid signature.", buf, 0xCu);

        }
        if (!a4)
        {
          v17 = 0;
LABEL_51:

          goto LABEL_52;
        }
        v40 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "recordID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("CloudKit record %@ for BMLT catalog does not have a valid signature."), v41);
        v42 = objc_claimAutoreleasedReturnValue();

        v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v75 = *MEMORY[0x1E0CB2D50];
        v76 = v42;
        v67 = (id)v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v43, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v15);
        v45 = *a4;
        *a4 = v44;

      }
      v17 = 0;
LABEL_49:

      v38 = v67;
      goto LABEL_50;
    }
    TRILogCategory_Server();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "recordID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v72 = v62;
      _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition signature.", buf, 0xCu);

    }
    if (a4)
    {
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "recordID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("CloudKit record %@ for BMLT catalog has missing or corrupt encoded catalog definition signature."), v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v79 = *MEMORY[0x1E0CB2D50];
      v80 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v14);
      v17 = 0;
      v38 = *a4;
      *a4 = v37;
LABEL_50:

      goto LABEL_51;
    }
    v11 = 0;
    v17 = 0;
LABEL_53:

    goto LABEL_54;
  }
  TRILogCategory_Server();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "recordID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v51;
    _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Could not create BMLT catalog artifact from CloudKit record %@.", buf, 0xCu);

  }
  if (a4)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "recordID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("Could not create BMLT catalog artifact from CloudKit record %@."), v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v85 = *MEMORY[0x1E0CB2D50];
    v86[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v10);
    v17 = 0;
    v11 = *a4;
    *a4 = v22;
    goto LABEL_53;
  }
  v17 = 0;
LABEL_56:

  return v17;
}

+ (BOOL)_hasStructurallyValidBMLTs:(id)a3 population:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "bmltDeploymentIdArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__TRIClientBMLTCatalogArtifact_CloudKit___hasStructurallyValidBMLTs_population___block_invoke;
  v10[3] = &unk_1E9335E70;
  v10[4] = &v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __80__TRIClientBMLTCatalogArtifact_CloudKit___hasStructurallyValidBMLTs_population___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "taskId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "triIsPathSafePlausibleUniqueId");

  if ((v8 & 1) == 0)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "taskId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 1024;
      v14 = objc_msgSend(v6, "id_p");
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "BMLT catalog artifact has backgroundMLTaskId %{public}@.%d which is not a plausible uniqueId.", (uint8_t *)&v11, 0x12u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

@end
