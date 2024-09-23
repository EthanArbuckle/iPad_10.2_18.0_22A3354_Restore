@implementation PPNamedEntity

- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6 mostRelevantRecord:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  PPNamedEntityWithRecord *v18;
  PPNamedEntity *v19;
  PPNamedEntity *v20;
  uint64_t v21;
  NSString *clusterIdentifier;
  PPNamedEntity *p_super;
  void *v25;
  void *v26;
  objc_super v27;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (v14)
  {
    if (v16)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntity.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("language"));

    if (v17)
      goto LABEL_4;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNamedEntity.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  if (!v16)
    goto LABEL_6;
LABEL_3:
  if (v17)
  {
LABEL_4:
    v18 = -[PPNamedEntityWithRecord initWithName:category:dynamicCategory:language:mostRelevantRecord:]([PPNamedEntityWithRecord alloc], "initWithName:category:dynamicCategory:language:mostRelevantRecord:", v14, a4, v15, v16, v17);
    goto LABEL_10;
  }
LABEL_7:
  v27.receiver = self;
  v27.super_class = (Class)PPNamedEntity;
  v19 = -[PPNamedEntity init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    v20->_category = a4;
    objc_storeStrong((id *)&v20->_dynamicCategory, a5);
    objc_storeStrong((id *)&v20->_bestLanguage, a6);
    +[PPNamedEntity clusterIdentifierFromName:](PPNamedEntity, "clusterIdentifierFromName:", v14);
    v21 = objc_claimAutoreleasedReturnValue();
    clusterIdentifier = v20->_clusterIdentifier;
    v20->_clusterIdentifier = (NSString *)v21;

  }
  v18 = v20;
  self = &v18->super;
LABEL_10:
  p_super = &v18->super;

  return p_super;
}

- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 language:(id)a5
{
  return -[PPNamedEntity initWithName:category:dynamicCategory:language:mostRelevantRecord:](self, "initWithName:category:dynamicCategory:language:mostRelevantRecord:", a3, a4, 0, a5, 0);
}

- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6
{
  return -[PPNamedEntity initWithName:category:dynamicCategory:language:mostRelevantRecord:](self, "initWithName:category:dynamicCategory:language:mostRelevantRecord:", a3, a4, a5, a6, 0);
}

- (PPNamedEntityRecord)mostRelevantRecord
{
  return 0;
}

- (PPNamedEntity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  PPNamedEntity *v12;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cat"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("dcat"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("lang"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rec"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[PPNamedEntity initWithName:category:dynamicCategory:language:mostRelevantRecord:](self, "initWithName:category:dynamicCategory:language:mostRelevantRecord:", v6, v7, v8, v9, v10);
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;
  id v6;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_category), CFSTR("cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dynamicCategory, CFSTR("dcat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bestLanguage, CFSTR("lang"));
  -[PPNamedEntity mostRelevantRecord](self, "mostRelevantRecord");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("rec"));

}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = self->_category ^ -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_bestLanguage, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_dynamicCategory, "hash");
}

- (BOOL)isEqualToNamedEntity:(id)a3
{
  PPNamedEntity *v4;
  PPNamedEntity *v5;
  NSString *v6;
  uint64_t v7;
  unint64_t category;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;

  v4 = (PPNamedEntity *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      v6 = self->_name;
      -[PPNamedEntity name](v5, "name");
      v7 = objc_claimAutoreleasedReturnValue();
      if ((unint64_t)v6 | v7)
      {
        v11 = (void *)v7;
        LOBYTE(v12) = 0;
        if (!v6 || !v7)
          goto LABEL_21;
        v12 = -[NSString isEqualToString:](v6, "isEqualToString:", v7);

        if (!v12)
          goto LABEL_22;
      }
      category = self->_category;
      if (category == -[PPNamedEntity category](v5, "category"))
      {
        v6 = self->_dynamicCategory;
        -[PPNamedEntity dynamicCategory](v5, "dynamicCategory");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!((unint64_t)v6 | v9))
        {
LABEL_6:
          v6 = self->_bestLanguage;
          -[PPNamedEntity bestLanguage](v5, "bestLanguage");
          v10 = objc_claimAutoreleasedReturnValue();
          if ((unint64_t)v6 | v10)
          {
            v11 = (void *)v10;
            LOBYTE(v12) = 0;
            if (v6 && v10)
              LOBYTE(v12) = -[NSString isEqualToString:](v6, "isEqualToString:", v10);
          }
          else
          {
            v11 = 0;
            v6 = 0;
            LOBYTE(v12) = 1;
          }
          goto LABEL_21;
        }
        v11 = (void *)v9;
        LOBYTE(v12) = 0;
        if (v6 && v9)
        {
          v12 = -[NSString isEqualToString:](v6, "isEqualToString:", v9);

          if (!v12)
            goto LABEL_22;
          goto LABEL_6;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_22:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  PPNamedEntity *v4;
  BOOL v5;

  v4 = (PPNamedEntity *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPNamedEntity isEqualToNamedEntity:](self, "isEqualToNamedEntity:", v4);
  }

  return v5;
}

- (id)description
{
  id v3;
  NSString *name;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  name = self->_name;
  +[PPNamedEntity describeCategory:](PPNamedEntity, "describeCategory:", self->_category);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPNamedEntity n:'%@' c:'%@' l:%@>"), name, v5, self->_bestLanguage);

  return v6;
}

- (double)sentimentScore
{
  return 0.0;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken6 != -1)
    dispatch_once(&featureNames__pasOnceToken6, &__block_literal_global_227);
  return (NSSet *)(id)featureNames__pasExprOnceResult_228;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  NSString *name;
  uint64_t v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    name = self->_name;
LABEL_3:
    objc_msgSend(v5, "featureValueWithString:", name);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("category")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithInt64:", self->_category);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("dynamicCategory")))
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("bestLanguage")))
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("sentimentScore")))
      {
        v8 = 0;
        goto LABEL_7;
      }
      v14 = (void *)MEMORY[0x1E0C9E918];
      -[PPNamedEntity sentimentScore](self, "sentimentScore");
      objc_msgSend(v14, "featureValueWithDouble:");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    name = self->_bestLanguage;
    goto LABEL_3;
  }
  v10 = (void *)MEMORY[0x1E0C9E918];
  -[PPNamedEntity dynamicCategory](self, "dynamicCategory");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E226D4B0;
  objc_msgSend(v10, "featureValueWithString:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)dynamicCategory
{
  return self->_dynamicCategory;
}

- (NSString)bestLanguage
{
  return self->_bestLanguage;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_bestLanguage, 0);
  objc_storeStrong((id *)&self->_dynamicCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __29__PPNamedEntity_featureNames__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)MEMORY[0x18D7805AC]();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("name"), CFSTR("bestLanguage"), CFSTR("category"), CFSTR("dynamicCategory"), CFSTR("sentimentScore"), 0);
  objc_autoreleasePoolPop(v1);
  v3 = (void *)featureNames__pasExprOnceResult_228;
  featureNames__pasExprOnceResult_228 = v2;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeCategory:(unint64_t)a3
{
  __CFString *v3;
  void *v4;

  if (a3 - 1 >= 0x15)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown (%lu)"), a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = off_1E2269998[a3 - 1];
  }
  return v3;
}

+ (unint64_t)categoryForDescription:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[21];
  _QWORD v10[22];

  v10[21] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("person");
  v9[1] = CFSTR("organization");
  v10[0] = &unk_1E2284940;
  v10[1] = &unk_1E2284958;
  v9[2] = CFSTR("location");
  v9[3] = CFSTR("restaurant");
  v10[2] = &unk_1E2284970;
  v10[3] = &unk_1E2284988;
  v9[4] = CFSTR("activity location");
  v9[5] = CFSTR("media");
  v10[4] = &unk_1E22849A0;
  v10[5] = &unk_1E22849B8;
  v9[6] = CFSTR("artist");
  v9[7] = CFSTR("street address");
  v10[6] = &unk_1E22849D0;
  v10[7] = &unk_1E22849E8;
  v9[8] = CFSTR("city");
  v9[9] = CFSTR("state");
  v10[8] = &unk_1E2284A00;
  v10[9] = &unk_1E2284A18;
  v9[10] = CFSTR("country");
  v9[11] = CFSTR("full address");
  v10[10] = &unk_1E2284A30;
  v10[11] = &unk_1E2284A48;
  v9[12] = CFSTR("tourist attraction");
  v9[13] = CFSTR("event title");
  v10[12] = &unk_1E2284A60;
  v10[13] = &unk_1E2284A78;
  v9[14] = CFSTR("sports team");
  v9[15] = CFSTR("professional athlete");
  v10[14] = &unk_1E2284A90;
  v10[15] = &unk_1E2284AA8;
  v9[16] = CFSTR("musician");
  v9[17] = CFSTR("movie");
  v10[16] = &unk_1E2284AC0;
  v10[17] = &unk_1E2284AD8;
  v9[18] = CFSTR("dynamic");
  v9[19] = CFSTR("politician");
  v10[18] = &unk_1E2284AF0;
  v10[19] = &unk_1E2284B08;
  v9[20] = CFSTR("tv show");
  v10[20] = &unk_1E2284B20;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v10, v9, 21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "unsignedIntValue");
  else
    v7 = 0;

  return v7;
}

+ (id)clusterIdentifierFromName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(v3, "isEqualToString:", v5))
  {
    v6 = v3;

    v5 = v6;
  }
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

@end
