@implementation PPSource

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)language
{
  return self->_language;
}

- (PPSource)initWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 date:(id)a6 relevanceDate:(id)a7 contactHandles:(id)a8 language:(id)a9 metadata:(id)a10
{
  id v17;
  PPSource *v18;
  PPSource *v19;
  id v21;
  id v22;
  id v23;

  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v18 = -[PPSource initWithBundleId:groupId:documentId:date:](self, "initWithBundleId:groupId:documentId:date:", a3, a4, a5, a6);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_relevanceDate, a7);
    objc_storeStrong((id *)&v19->_language, a9);
    objc_storeStrong((id *)&v19->_metadata, a10);
    objc_storeStrong((id *)&v19->_contactHandles, a8);
  }

  return v19;
}

- (PPSource)initWithBundleId:(id)a3 groupId:(id)a4 documentId:(id)a5 date:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  NSObject *v16;
  PPSource *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSString *v22;
  NSString *bundleId;
  NSString *v24;
  uint64_t v25;
  NSString *groupId;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  objc_super v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSource.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("documentId"));

    if (v14)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSource.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  if (!v13)
    goto LABEL_14;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSource.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_4:
  objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  if (fabs(v15) == INFINITY)
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v11;
      _os_log_fault_impl(&dword_18BE3A000, v16, OS_LOG_TYPE_FAULT, "Constructing PPSource with Inf date associated with bundleId: %@", buf, 0xCu);
    }

  }
  v33.receiver = self;
  v33.super_class = (Class)PPSource;
  v17 = -[PPSource init](&v33, sel_init);
  if (v17)
  {
    v32 = v13;
    v18 = a6;
    v19 = v12;
    PPGetStringInternPool();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    objc_msgSend(v20, "intern:", v11);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("PPSource.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("internedBundleId"));

    }
    bundleId = v17->_bundleId;
    v17->_bundleId = v22;
    v24 = v22;

    v12 = v19;
    objc_msgSend(v20, "intern:", v19);
    v25 = objc_claimAutoreleasedReturnValue();
    groupId = v17->_groupId;
    v17->_groupId = (NSString *)v25;

    objc_storeStrong((id *)&v17->_documentId, a5);
    objc_storeStrong((id *)&v17->_date, v18);

    v13 = v32;
    v11 = v21;
  }

  return v17;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[PPSource bundleId](self, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSource groupId](self, "groupId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSource documentId](self, "documentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSource date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPSource bi:%@ gi:%@ di:%@ da:%@>"), v4, v5, v6, v7);

  return v8;
}

- (PPSource)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  PPSource *v19;
  PPSource *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint8_t buf[16];

  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("bid"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("gid"));
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reld"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x18D7805AC]();
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("cnh"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, CFSTR("lan"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("met"));
  v15 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v5;
  if (v5 && v6 && v7)
  {
    v16 = (void *)v15;
    v17 = v5;
    v18 = (void *)v26;
    v19 = -[PPSource initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:](self, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v17, v26, v6, v7, v8, v13, v14, v15);
    v20 = v19;
  }
  else
  {
    v23 = (void *)v15;
    v24 = v13;
    pp_default_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18BE3A000, v21, OS_LOG_TYPE_ERROR, "PPSource:initWithCoder: decoded illegal nil property", buf, 2u);
    }

    v20 = 0;
    v18 = (void *)v26;
    v19 = self;
    v13 = v24;
    v16 = v23;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupId, CFSTR("gid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentId, CFSTR("did"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relevanceDate, CFSTR("reld"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactHandles, CFSTR("cnh"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_language, CFSTR("lan"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("met"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_groupId, "hash") ^ v3;
  v5 = -[NSString hash](self->_documentId, "hash");
  v6 = v4 ^ v5 ^ -[NSDate hash](self->_date, "hash");
  v7 = -[NSDate hash](self->_relevanceDate, "hash");
  v8 = v7 ^ -[NSString hash](self->_language, "hash");
  return v6 ^ v8 ^ -[PPSourceMetadata hash](self->_metadata, "hash");
}

- (BOOL)isEqualToSource:(id)a3
{
  PPSource *v4;
  id *p_isa;
  NSDate *v6;
  unint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v4 = (PPSource *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else if (v4)
  {
    v6 = self->_bundleId;
    v7 = (unint64_t)p_isa[5];
    if (!((unint64_t)v6 | v7))
      goto LABEL_46;
    v8 = (void *)v7;
    LOBYTE(v9) = 0;
    if (!v6 || !v7)
      goto LABEL_42;
    v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v7);

    if (v9)
    {
LABEL_46:
      v6 = self->_groupId;
      v10 = (unint64_t)p_isa[6];
      if (!((unint64_t)v6 | v10))
        goto LABEL_11;
      v8 = (void *)v10;
      LOBYTE(v9) = 0;
      if (!v6 || !v10)
        goto LABEL_42;
      v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v10);

      if (v9)
      {
LABEL_11:
        v6 = self->_documentId;
        v11 = (unint64_t)p_isa[7];
        if ((unint64_t)v6 | v11)
        {
          v8 = (void *)v11;
          LOBYTE(v9) = 0;
          if (!v6 || !v11)
            goto LABEL_42;
          v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v11);

          if (!v9)
            goto LABEL_43;
        }
        v6 = self->_date;
        v12 = (unint64_t)p_isa[8];
        if (!((unint64_t)v6 | v12))
          goto LABEL_16;
        v8 = (void *)v12;
        LOBYTE(v9) = 0;
        if (!v6 || !v12)
          goto LABEL_42;
        v9 = -[NSDate isEqualToDate:](v6, "isEqualToDate:", v12);

        if (v9)
        {
LABEL_16:
          v6 = self->_relevanceDate;
          v13 = (unint64_t)p_isa[2];
          if ((unint64_t)v6 | v13)
          {
            v8 = (void *)v13;
            LOBYTE(v9) = 0;
            if (!v6 || !v13)
              goto LABEL_42;
            v9 = -[NSDate isEqualToDate:](v6, "isEqualToDate:", v13);

            if (!v9)
              goto LABEL_43;
          }
          v6 = self->_contactHandles;
          v14 = (unint64_t)p_isa[3];
          if ((unint64_t)v6 | v14)
          {
            v8 = (void *)v14;
            LOBYTE(v9) = 0;
            if (!v6 || !v14)
              goto LABEL_42;
            v9 = -[NSDate isEqualToArray:](v6, "isEqualToArray:", v14);

            if (!v9)
              goto LABEL_43;
          }
          v6 = self->_language;
          v15 = (unint64_t)p_isa[4];
          if (!((unint64_t)v6 | v15))
          {
LABEL_19:
            v6 = self->_metadata;
            v16 = (unint64_t)p_isa[1];
            if ((unint64_t)v6 | v16)
            {
              v8 = (void *)v16;
              LOBYTE(v9) = 0;
              if (v6 && v16)
                LOBYTE(v9) = -[NSDate isEqualToSourceMetadata:](v6, "isEqualToSourceMetadata:", v16);
            }
            else
            {
              v8 = 0;
              v6 = 0;
              LOBYTE(v9) = 1;
            }
            goto LABEL_42;
          }
          v8 = (void *)v15;
          LOBYTE(v9) = 0;
          if (v6 && v15)
          {
            v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v15);

            if (!v9)
              goto LABEL_43;
            goto LABEL_19;
          }
LABEL_42:

        }
      }
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_43:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PPSource *v4;
  BOOL v5;

  v4 = (PPSource *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[PPSource isEqualToSource:](self, "isEqualToSource:", v4);
  }

  return v5;
}

- (id)sha256
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  double v5;
  id v6;
  unsigned __int8 *v7;
  unsigned int data;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  const char *v14;
  CC_SHA256_CTX v15;

  v3 = (void *)MEMORY[0x18D7805AC](self, a2);
  v11 = 0;
  v12 = &v11;
  v13 = 0x8810000000;
  v14 = "";
  memset(&v15, 0, sizeof(v15));
  CC_SHA256_Init(&v15);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __18__PPSource_sha256__block_invoke;
  v10[3] = &unk_1E226AA68;
  v10[4] = &v11;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D780768](v10);
  ((void (**)(_QWORD, NSString *))v4)[2](v4, self->_bundleId);
  ((void (**)(_QWORD, NSString *))v4)[2](v4, self->_groupId);
  ((void (**)(_QWORD, NSString *))v4)[2](v4, self->_documentId);
  -[NSDate timeIntervalSince1970](self->_date, "timeIntervalSince1970");
  if (v5 < 0.0)
    v5 = 0.0;
  data = fmin(v5, 4294967300.0);
  CC_SHA256_Update((CC_SHA256_CTX *)(v12 + 4), &data, 4u);
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32));
  v7 = (unsigned __int8 *)objc_msgSend(v6, "mutableBytes");
  CC_SHA256_Final(v7, (CC_SHA256_CTX *)(v12 + 4));

  _Block_object_dispose(&v11, 8);
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (NSSet)featureNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__PPSource_featureNames__block_invoke;
  block[3] = &unk_1E226C130;
  block[4] = self;
  if (featureNames__pasOnceToken12 != -1)
    dispatch_once(&featureNames__pasOnceToken12, block);
  return (NSSet *)(id)featureNames__pasExprOnceResult_3880;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  NSString *groupId;
  uint64_t v7;
  void *v8;
  void *v10;
  NSDate *date;
  void *v12;
  void *v13;
  void *v14;
  PPSourceMetadata *metadata;
  void *v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("bundleId")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("groupId")))
    {
      v5 = (void *)MEMORY[0x1E0C9E918];
      groupId = self->_groupId;
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("documentId")))
    {
      v5 = (void *)MEMORY[0x1E0C9E918];
      groupId = self->_documentId;
      goto LABEL_7;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("date")))
    {
      v10 = (void *)MEMORY[0x1E0C9E918];
      date = self->_date;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("relevanceDate")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("contactHandles")))
        {
          v13 = (void *)MEMORY[0x1E0C9E918];
          objc_msgSend(MEMORY[0x1E0C9E9C0], "sequenceWithStringArray:", self->_contactHandles);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "featureValueWithSequence:", v14);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("language")))
        {
          v5 = (void *)MEMORY[0x1E0C9E918];
          groupId = self->_language;
          goto LABEL_7;
        }
        if (!objc_msgSend(v4, "hasPrefix:", CFSTR("meta_")))
        {
          v8 = 0;
          goto LABEL_9;
        }
        metadata = self->_metadata;
        if (metadata)
        {
          objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("meta_"), "length"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PPSourceMetadata featureValueForName:](metadata, "featureValueForName:", v16);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
        v12 = (void *)MEMORY[0x1E0C9E918];
LABEL_15:
        objc_msgSend(v12, "featureValueWithDouble:");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      v10 = (void *)MEMORY[0x1E0C9E918];
      date = self->_relevanceDate;
    }
    -[NSDate timeIntervalSince1970](date, "timeIntervalSince1970");
    v12 = v10;
    goto LABEL_15;
  }
  v5 = (void *)MEMORY[0x1E0C9E918];
  groupId = self->_bundleId;
LABEL_7:
  objc_msgSend(v5, "featureValueWithString:", groupId);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)documentId
{
  return self->_documentId;
}

- (NSDate)date
{
  return self->_date;
}

- (PPSourceMetadata)metadata
{
  return self->_metadata;
}

- (NSDate)relevanceDate
{
  return self->_relevanceDate;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_documentId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_relevanceDate, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

void __24__PPSource_featureNames__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "featureNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_3881);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x18D7805AC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("bundleId"), CFSTR("groupId"), CFSTR("documentId"), CFSTR("date"), CFSTR("relevanceDate"), CFSTR("contactHandles"), CFSTR("language"), 0);
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v7, "setByAddingObjectsFromArray:", v5);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)featureNames__pasExprOnceResult_3880;
  featureNames__pasExprOnceResult_3880 = v8;

  objc_autoreleasePoolPop(v2);
}

uint64_t __24__PPSource_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("meta_"), "stringByAppendingString:", a2);
}

void __18__PPSource_sha256__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CC_SHA256_CTX *v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x18D7805AC]();
    objc_msgSend(v3, "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (CC_SHA256_CTX *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
      v8 = objc_retainAutorelease(v5);
      CC_SHA256_Update(v7, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
    }
    else
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18BE3A000, v9, OS_LOG_TYPE_DEFAULT, "Unable to hash bad string ivar on PPSource", v10, 2u);
      }

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
