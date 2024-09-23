@implementation SDSeedingConfiguration

- (SDSeedingConfiguration)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SDSeedingConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SDSeedingConfiguration;
  v5 = -[SDSeedingConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seedProgram"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setSeedProgram:](v5, "setSeedProgram:", +[SDSeedProgramManager _seedProgramForString:](SDSeedProgramManager, "_seedProgramForString:", v6));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetAudience"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setAssetAudience:](v5, "setAssetAudience:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catalog"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setCatalog:](v5, "setCatalog:", v8);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setAccountID:](v5, "setAccountID:", v9);

  }
  return v5;
}

- (SDSeedingConfiguration)initWithBetaProgram:(id)a3
{
  id v4;
  SDSeedingConfiguration *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SDSeedingConfiguration;
  v5 = -[SDSeedingConfiguration init](&v16, sel_init);
  if (v5)
  {
    -[SDSeedingConfiguration setSeedProgram:](v5, "setSeedProgram:", objc_msgSend(v4, "program"));
    objc_msgSend(v4, "assetAudience");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E98D0E68;
    -[SDSeedingConfiguration setAssetAudience:](v5, "setAssetAudience:", v8);

    objc_msgSend(v4, "catalog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = &stru_1E98D0E68;
    -[SDSeedingConfiguration setCatalog:](v5, "setCatalog:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "programID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setSeedProgramID:](v5, "setSeedProgramID:", v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "accountID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setAccountID:](v5, "setAccountID:", v14);

  }
  return v5;
}

- (SDSeedingConfiguration)initWithCoder:(id)a3
{
  id v4;
  SDSeedingConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SDSeedingConfiguration;
  v5 = -[SDSeedingConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seedProgram"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setSeedProgram:](v5, "setSeedProgram:", +[SDSeedProgramManager _seedProgramForString:](SDSeedProgramManager, "_seedProgramForString:", v6));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetAudience"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setAssetAudience:](v5, "setAssetAudience:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalog"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setCatalog:](v5, "setCatalog:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seedProgramID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setSeedProgramID:](v5, "setSeedProgramID:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDSeedingConfiguration setAccountID:](v5, "setAccountID:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", -[SDSeedingConfiguration seedProgram](self, "seedProgram"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("seedProgram"));

  -[SDSeedingConfiguration assetAudience](self, "assetAudience");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetAudience"));

  -[SDSeedingConfiguration catalog](self, "catalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("catalog"));

  -[SDSeedingConfiguration seedProgramID](self, "seedProgramID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("seedProgramID"));

  -[SDSeedingConfiguration accountID](self, "accountID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("accountID"));

}

+ (id)currentConfiguration
{
  SDSeedingConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  v2 = objc_alloc_init(SDSeedingConfiguration);
  +[SDBetaManager _currentBetaProgram](SDBetaManager, "_currentBetaProgram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "program");
  else
    v5 = 0;
  -[SDSeedingConfiguration setSeedProgram:](v2, "setSeedProgram:", v5);
  +[SDCatalogUtilities _currentAssetAudience](SDCatalogUtilities, "_currentAssetAudience");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E98D0E68;
  -[SDSeedingConfiguration setAssetAudience:](v2, "setAssetAudience:", v8);

  +[SDBetaManager sharedManager](SDBetaManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_assetServerURLString");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E98D0E68;
  -[SDSeedingConfiguration setCatalog:](v2, "setCatalog:", v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "programID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDSeedingConfiguration setSeedProgramID:](v2, "setSeedProgramID:", v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "accountID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDSeedingConfiguration setAccountID:](v2, "setAccountID:", v14);

  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("seedProgram");
  +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", -[SDSeedingConfiguration seedProgram](self, "seedProgram"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E98D0E68;
  v22[0] = v5;
  v21[1] = CFSTR("assetAudience");
  -[SDSeedingConfiguration assetAudience](self, "assetAudience");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = &stru_1E98D0E68;
  v22[1] = v8;
  v21[2] = CFSTR("catalog");
  -[SDSeedingConfiguration catalog](self, "catalog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E98D0E68;
  v22[2] = v11;
  v21[3] = CFSTR("seedProgramID");
  -[SDSeedingConfiguration seedProgramID](self, "seedProgramID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = &stru_1E98D0E68;
  v22[3] = v15;
  v21[4] = CFSTR("accountID");
  -[SDSeedingConfiguration accountID](self, "accountID");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &unk_1E98D6640;
  if (v16)
    v18 = (void *)v16;
  v22[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v19;
}

- (NSDictionary)enrollmentMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDSeedingConfiguration assetAudience](self, "assetAudience");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AssetAudience"));

  -[SDSeedingConfiguration seedProgramID](self, "seedProgramID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ProgramID"));

  +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", -[SDSeedingConfiguration seedProgram](self, "seedProgram"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("SeedProgram"));

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[SDSeedingConfiguration seedProgram](self, "seedProgram");
    if (v6 == objc_msgSend(v5, "seedProgram"))
    {
      -[SDSeedingConfiguration assetAudience](self, "assetAudience");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "assetAudience");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[SDSeedingConfiguration catalog](self, "catalog");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "catalog");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          -[SDSeedingConfiguration seedProgramID](self, "seedProgramID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "seedProgramID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SDSeedingConfiguration)nullConfiguration
{
  SDSeedingConfiguration *v2;

  v2 = objc_alloc_init(SDSeedingConfiguration);
  -[SDSeedingConfiguration setSeedProgram:](v2, "setSeedProgram:", 0);
  -[SDSeedingConfiguration setAssetAudience:](v2, "setAssetAudience:", &stru_1E98D0E68);
  -[SDSeedingConfiguration setCatalog:](v2, "setCatalog:", &stru_1E98D0E68);
  -[SDSeedingConfiguration setSeedProgramID:](v2, "setSeedProgramID:", &unk_1E98D6658);
  -[SDSeedingConfiguration setAccountID:](v2, "setAccountID:", &unk_1E98D6658);
  return v2;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", -[SDSeedingConfiguration seedProgram](self, "seedProgram"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDSeedingConfiguration assetAudience](self, "assetAudience");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ - %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)seedProgram
{
  return self->_seedProgram;
}

- (void)setSeedProgram:(int64_t)a3
{
  self->_seedProgram = a3;
}

- (NSString)assetAudience
{
  return self->_assetAudience;
}

- (void)setAssetAudience:(id)a3
{
  objc_storeStrong((id *)&self->_assetAudience, a3);
}

- (NSString)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_catalog, a3);
}

- (NSNumber)seedProgramID
{
  return self->_seedProgramID;
}

- (void)setSeedProgramID:(id)a3
{
  objc_storeStrong((id *)&self->_seedProgramID, a3);
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_seedProgramID, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_assetAudience, 0);
}

@end
