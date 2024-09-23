@implementation TPPolicyDocument

- (TPPolicyDocument)initWithHash:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TPPolicyDocument *v9;
  void *v10;
  TPPolicyDocument *v11;
  TPPolicyDocument *v12;
  void *v13;
  TPPBPolicyDocument *v14;
  TPPolicyVersion *v15;
  TPPolicyVersion *version;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v6), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v10))
    {
      v18.receiver = self;
      v18.super_class = (Class)TPPolicyDocument;
      v11 = -[TPPolicyDocument init](&v18, sel_init);
      v12 = v11;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_protobuf, a4);
        v13 = (void *)MEMORY[0x1DF0E9908]();
        v14 = -[TPPBPolicyDocument initWithData:]([TPPBPolicyDocument alloc], "initWithData:", v8);
        v15 = -[TPPolicyVersion initWithVersion:hash:]([TPPolicyVersion alloc], "initWithVersion:hash:", -[TPPBPolicyDocument policyVersion](v14, "policyVersion"), v10);
        version = v12->_version;
        v12->_version = v15;

        objc_autoreleasePoolPop(v13);
      }
      self = v12;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (TPPolicyDocument)initWithVersion:(unint64_t)a3 modelToCategory:(id)a4 categoriesByView:(id)a5 introducersByCategory:(id)a6 redactions:(id)a7 keyViewMapping:(id)a8 userControllableViewList:(id)a9 piggybackViews:(id)a10 priorityViews:(id)a11 inheritedExcludedViews:(id)a12 hashAlgo:(int64_t)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TPPolicyDocument *v25;
  TPPBPolicyDocument *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSData *protobuf;
  TPPolicyVersion *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  TPPolicyVersion *v47;
  uint64_t v48;
  TPPolicyVersion *version;
  id v52;
  id v53;
  TPPolicyDocument *v54;
  objc_super v55;

  v53 = a4;
  v52 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v55.receiver = self;
  v55.super_class = (Class)TPPolicyDocument;
  v25 = -[TPPolicyDocument init](&v55, sel_init);
  if (v25)
  {
    v26 = objc_alloc_init(TPPBPolicyDocument);
    -[TPPBPolicyDocument setPolicyVersion:](v26, "setPolicyVersion:", a3);
    v54 = v25;
    v27 = (void *)objc_msgSend(v53, "mutableCopy");
    -[TPPBPolicyDocument setModelToCategorys:](v26, "setModelToCategorys:", v27);

    v28 = (void *)objc_msgSend(v52, "mutableCopy");
    -[TPPBPolicyDocument setCategoriesByViews:](v26, "setCategoriesByViews:", v28);

    v29 = (void *)objc_msgSend(v18, "mutableCopy");
    -[TPPBPolicyDocument setIntroducersByCategorys:](v26, "setIntroducersByCategorys:", v29);

    v30 = (void *)objc_msgSend(v19, "mutableCopy");
    -[TPPBPolicyDocument setRedactions:](v26, "setRedactions:", v30);

    v31 = (void *)objc_msgSend(v20, "mutableCopy");
    -[TPPBPolicyDocument setKeyViewMappings:](v26, "setKeyViewMappings:", v31);

    v32 = (void *)objc_msgSend(v21, "mutableCopy");
    -[TPPBPolicyDocument setUserControllableViews:](v26, "setUserControllableViews:", v32);

    v33 = (void *)objc_msgSend(v22, "mutableCopy");
    -[TPPBPolicyDocument setPiggybackViews:](v26, "setPiggybackViews:", v33);

    v34 = (void *)objc_msgSend(v23, "mutableCopy");
    -[TPPBPolicyDocument setPriorityViews:](v26, "setPriorityViews:", v34);

    v35 = (void *)objc_msgSend(v24, "mutableCopy");
    -[TPPBPolicyDocument setInheritedExcludedViews:](v26, "setInheritedExcludedViews:", v35);

    -[TPPBPolicyDocument data](v26, "data");
    v36 = objc_claimAutoreleasedReturnValue();
    protobuf = v54->_protobuf;
    v54->_protobuf = (NSData *)v36;

    v38 = [TPPolicyVersion alloc];
    +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", a13, v54->_protobuf);
    v39 = v24;
    v40 = v23;
    v41 = v22;
    v42 = v21;
    v43 = v20;
    v44 = v19;
    v45 = v18;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v38;
    v25 = v54;
    v48 = -[TPPolicyVersion initWithVersion:hash:](v47, "initWithVersion:hash:", a3, v46);
    version = v54->_version;
    v54->_version = (TPPolicyVersion *)v48;

    v18 = v45;
    v19 = v44;
    v20 = v43;
    v21 = v42;
    v22 = v41;
    v23 = v40;
    v24 = v39;

  }
  return v25;
}

- (id)encodeProtobuf
{
  TPPBPolicyDocument *v3;
  void *v4;
  TPPBPolicyDocument *v5;

  v3 = [TPPBPolicyDocument alloc];
  -[TPPolicyDocument protobuf](self, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPolicyDocument initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (id)policyWithSecrets:(id)a3 decrypter:(id)a4 error:(id *)a5
{
  id v8;
  TPPBPolicyDocument *v9;
  void *v10;
  TPPBPolicyDocument *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  TPPBPolicyDocument *v28;
  TPPBPolicyDocument *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  TPPolicyDocument *v49;
  void *v50;
  TPPBPolicyDocument *v51;
  id obj;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v55 = a4;
  v9 = [TPPBPolicyDocument alloc];
  v49 = self;
  -[TPPolicyDocument protobuf](self, "protobuf");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TPPBPolicyDocument initWithData:](v9, "initWithData:", v10);

  v51 = v11;
  -[TPPBPolicyDocument redactions](v11, "redactions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicyDocument redactionsFromPb:](TPPolicyDocument, "redactionsFromPb:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)objc_opt_new();
  v14 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(v13, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = v8;
  objc_msgSend(v8, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v58 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
        objc_msgSend(v56, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v22);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(v55, "decryptData:withKey:error:", v24, v23, a5);
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            v37 = 0;
            v50 = obj;
            goto LABEL_16;
          }
          v27 = (void *)v26;
          v28 = -[TPPBPolicyDocument initWithData:]([TPPBPolicyDocument alloc], "initWithData:", v26);
          if (!v28)
          {
            v37 = 0;
            v50 = obj;
            goto LABEL_15;
          }
          v29 = v28;
          objc_msgSend(v53, "removeObject:", v22);
          objc_msgSend(v54, "mergeFrom:", v29);

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v19)
        continue;
      break;
    }
  }

  objc_msgSend(v54, "mergeFrom:", v51);
  objc_msgSend(v54, "modelToCategorys");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicyDocument modelToCategoryFromPb:](TPPolicyDocument, "modelToCategoryFromPb:", v50);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "categoriesByViews");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicyDocument categoriesByViewFromPb:](TPPolicyDocument, "categoriesByViewFromPb:", v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "introducersByCategorys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicyDocument introducersByCategoryFromPb:](TPPolicyDocument, "introducersByCategoryFromPb:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "keyViewMappings");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v53, "count") != 0;
  v30 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v54, "userControllableViews");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setWithArray:", v46);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v54, "piggybackViews");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v45);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v54, "priorityViews");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithArray:", v42);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v54, "inheritedExcludedViews");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithArray:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPolicyDocument version](v49, "version");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPolicy policyWithModelToCategory:categoriesByView:introducersByCategory:keyViewMapping:unknownRedactions:userControllableViewList:piggybackViews:priorityViews:inheritedExcludedViews:version:](TPPolicy, "policyWithModelToCategory:categoriesByView:introducersByCategory:keyViewMapping:unknownRedactions:userControllableViewList:piggybackViews:priorityViews:inheritedExcludedViews:version:", v23, v27, v48, v44, v43, v41, v40, v39, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
LABEL_16:

  return v37;
}

- (NSArray)keyViewMapping
{
  void *v3;
  TPPBPolicyDocument *v4;
  void *v5;
  TPPBPolicyDocument *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  v4 = [TPPBPolicyDocument alloc];
  -[TPPolicyDocument protobuf](self, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TPPBPolicyDocument initWithData:](v4, "initWithData:", v5);

  -[TPPBPolicyDocument keyViewMappings](v6, "keyViewMappings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSArray *)v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[TPPolicyDocument version](self, "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<TPPolicyDocument: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqualToPolicyDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3 == self)
    return 1;
  v4 = a3;
  -[TPPolicyDocument encodeProtobuf](self, "encodeProtobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeProtobuf");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (id)cloneWithVersionNumber:(unint64_t)a3
{
  return -[TPPolicyDocument cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:](self, "cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:", a3, 0, 0, 0);
}

- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5
{
  return -[TPPolicyDocument cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:](self, "cloneWithVersionNumber:prependingCategoriesByView:prependingKeyViewMapping:prependingRedactions:", a3, a4, a5, 0);
}

- (id)cloneWithVersionNumber:(unint64_t)a3 prependingCategoriesByView:(id)a4 prependingKeyViewMapping:(id)a5 prependingRedactions:(id)a6
{
  id v10;
  id v11;
  id v12;
  TPPBPolicyDocument *v13;
  void *v14;
  TPPBPolicyDocument *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  TPPBPolicyCategoriesByView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  TPPolicyDocument *v41;
  void *v42;
  TPPolicyDocument *v43;
  TPPolicyDocument *v45;
  id v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = [TPPBPolicyDocument alloc];
  -[TPPolicyDocument protobuf](self, "protobuf");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TPPBPolicyDocument initWithData:](v13, "initWithData:", v14);

  -[TPPBPolicyDocument setPolicyVersion:](v15, "setPolicyVersion:", a3);
  v48 = v10;
  if (v10)
  {
    v45 = self;
    v46 = v12;
    v47 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v10, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v50 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          v23 = objc_alloc_init(TPPBPolicyCategoriesByView);
          -[TPPBPolicyCategoriesByView setView:](v23, "setView:", v22);
          objc_msgSend(v48, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "allObjects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "mutableCopy");
          -[TPPBPolicyCategoriesByView setCategories:](v23, "setCategories:", v26);

          objc_msgSend(v16, "addObject:", v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v19);
    }

    -[TPPBPolicyDocument categoriesByViews](v15, "categoriesByViews");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");
    -[TPPBPolicyDocument setCategoriesByViews:](v15, "setCategoriesByViews:", v29);

    v12 = v46;
    v11 = v47;
    self = v45;
  }
  if (v11)
  {
    -[TPPBPolicyDocument keyViewMappings](v15, "keyViewMappings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");
    -[TPPBPolicyDocument setKeyViewMappings:](v15, "setKeyViewMappings:", v32);

  }
  if (v12)
  {
    -[TPPBPolicyDocument redactions](v15, "redactions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "mutableCopy");
    -[TPPBPolicyDocument setRedactions:](v15, "setRedactions:", v35);

  }
  -[TPPolicyDocument version](self, "version");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "policyHash");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = +[TPHashBuilder algoOfHash:](TPHashBuilder, "algoOfHash:", v37);
  -[TPPBPolicyDocument data](v15, "data");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPHashBuilder hashWithAlgo:ofData:](TPHashBuilder, "hashWithAlgo:ofData:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = [TPPolicyDocument alloc];
  -[TPPBPolicyDocument data](v15, "data");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[TPPolicyDocument initWithHash:data:](v41, "initWithHash:data:", v40, v42);

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  TPPolicyDocument *v4;
  BOOL v5;

  v4 = (TPPolicyDocument *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPPolicyDocument isEqualToPolicyDocument:](self, "isEqualToPolicyDocument:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[TPPolicyDocument version](self, "version");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "policyHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (TPPolicyVersion)version
{
  return self->_version;
}

- (NSData)protobuf
{
  return self->_protobuf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protobuf, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

+ (id)modelToCategoryFromPb:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "prefix", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "category");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[TPCategoryRule ruleWithPrefix:category:](TPCategoryRule, "ruleWithPrefix:category:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)categoriesByViewFromPb:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "view", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        if (v13)
        {
          objc_msgSend(v10, "categories");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v14);

          v15 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v10, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v10, "categories");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWithArray:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "view");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v18);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)introducersByCategoryFromPb:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "category", (_QWORD)v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        if (v13)
        {
          objc_msgSend(v10, "introducers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObjectsFromArray:", v14);

          v15 = (void *)objc_msgSend(v13, "copy");
          objc_msgSend(v10, "category");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v16);
        }
        else
        {
          v17 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v10, "introducers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWithArray:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "category");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v18);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)redactionsFromPb:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "ciphertext", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)addModelToCategory:(id)a3 toPB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  TPPBPolicyModelToCategory *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("prefix"), 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        v15 = objc_alloc_init(TPPBPolicyModelToCategory);
        objc_msgSend(v14, "prefix");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPPBPolicyModelToCategory setPrefix:](v15, "setPrefix:", v16);

        objc_msgSend(v14, "category");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPPBPolicyModelToCategory setCategory:](v15, "setCategory:", v17);

        objc_msgSend(v6, "addModelToCategory:", v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

}

+ (void)addCategoriesByView:(id)a3 toPB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TPPBPolicyCategoriesByView *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = objc_alloc_init(TPPBPolicyCategoriesByView);
        -[TPPBPolicyCategoriesByView setView:](v14, "setView:", v13);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");
        -[TPPBPolicyCategoriesByView setCategories:](v14, "setCategories:", v17);

        objc_msgSend(v6, "addCategoriesByView:", v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

+ (void)addIntroducersByCategory:(id)a3 toPB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TPPBPolicyIntroducersByCategory *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = objc_alloc_init(TPPBPolicyIntroducersByCategory);
        -[TPPBPolicyIntroducersByCategory setCategory:](v14, "setCategory:", v13);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "allObjects");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");
        -[TPPBPolicyIntroducersByCategory setIntroducers:](v14, "setIntroducers:", v17);

        objc_msgSend(v6, "addIntroducersByCategory:", v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

}

+ (void)addKeyViewMapping:(id)a3 toPB:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(v6, "addKeyViewMapping:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }

}

+ (id)policyDocWithHash:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  TPPolicyDocument *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TPPolicyDocument initWithHash:data:]([TPPolicyDocument alloc], "initWithHash:data:", v6, v5);

  return v7;
}

+ (id)redactionWithEncrypter:(id)a3 redactionName:(id)a4 encryptionKey:(id)a5 modelToCategory:(id)a6 categoriesByView:(id)a7 introducersByCategory:(id)a8 keyViewMapping:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  TPPBPolicyRedaction *v24;
  void *v25;
  id v27;

  v27 = a4;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v21 = (void *)objc_opt_new();
  +[TPPolicyDocument addModelToCategory:toPB:](TPPolicyDocument, "addModelToCategory:toPB:", v18, v21);

  +[TPPolicyDocument addCategoriesByView:toPB:](TPPolicyDocument, "addCategoriesByView:toPB:", v17, v21);
  +[TPPolicyDocument addIntroducersByCategory:toPB:](TPPolicyDocument, "addIntroducersByCategory:toPB:", v16, v21);

  +[TPPolicyDocument addKeyViewMapping:toPB:](TPPolicyDocument, "addKeyViewMapping:toPB:", v15, v21);
  objc_msgSend(v21, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encryptData:withKey:error:", v22, v19, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_alloc_init(TPPBPolicyRedaction);
    v25 = v27;
    -[TPPBPolicyRedaction setName:](v24, "setName:", v27);
    -[TPPBPolicyRedaction setCiphertext:](v24, "setCiphertext:", v23);
  }
  else
  {
    v24 = 0;
    v25 = v27;
  }

  return v24;
}

+ (BOOL)isEqualKeyViewMapping:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") || objc_msgSend(v6, "count"))
    v7 = objc_msgSend(v5, "isEqual:", v6);
  else
    v7 = 1;

  return v7;
}

@end
