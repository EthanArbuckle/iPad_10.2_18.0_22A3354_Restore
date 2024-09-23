@implementation SDBetaProgram

+ (id)betaProgramWithID:(int64_t)a3 title:(id)a4 program:(id)a5 catalog:(id)a6 assetUpdate:(id)a7 assetBrain:(id)a8 assetAudience:(id)a9 legalDocs:(id)a10 platform:(unint64_t)a11 buildPrefix:(id)a12 accountID:(int64_t)a13 betaEnrollmentToken:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  SDBetaProgram *v28;

  v19 = a14;
  v20 = a12;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = -[SDBetaProgram initWithID:title:program:catalog:assetUpdate:assetBrain:assetAudience:legalDocs:platform:buildPrefix:accountID:betaEnrollmentToken:]([SDBetaProgram alloc], "initWithID:title:program:catalog:assetUpdate:assetBrain:assetAudience:legalDocs:platform:buildPrefix:accountID:betaEnrollmentToken:", a3, v27, v26, v25, v24, v23, v22, v21, a11, v20, a13, v19);

  return v28;
}

+ (id)betaProgramWithJSON:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
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
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t v84[128];
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  void *v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catalog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("catalog"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "isPad"))
    {
      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("iOS"), CFSTR("iPadOS"));
      v17 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v17;
    }
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("program"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("program"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NilIfNSNull(v20);
    v21 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset_update_url"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset_update_url"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URLWithString:", v25);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v79 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset_brain_url"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset_brain_url"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "URLWithString:", v29);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v78 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset_audience"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("asset_audience"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v77 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legal_id"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legal_id"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("legal"));
    v36 = v21;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[SDLegalDoc legalDocWithID:title:content:](SDLegalDoc, "legalDocWithID:title:content:", v35, CFSTR("Legal"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 1);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v36;
  }
  else
  {
    v76 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = SDPlatformFromString(v41);
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v86 = v13;
      v87 = 2114;
      v88 = v16;
      _os_log_impl(&dword_1D4F89000, v41, OS_LOG_TYPE_DEFAULT, "No platform specified for beta program [%ld: %{public}@], falling back to TV", buf, 0x16u);
    }
    v42 = 4;
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("program"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("program"));
    v45 = objc_claimAutoreleasedReturnValue();
    +[SDSeedProgramManager _seedProgramForString:](SDSeedProgramManager, "_seedProgramForString:", v45);
  }
  else
  {
    +[SDSeedingLogging fwHandle](SDSeedingLogging, "fwHandle");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v86 = v13;
      v87 = 2114;
      v88 = v16;
      _os_log_impl(&dword_1D4F89000, v45, OS_LOG_TYPE_DEFAULT, "No programType specified for beta program [%ld: %{public}@], falling back to None", buf, 0x16u);
    }
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build_prefix"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build_prefix"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v75 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("account_id"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("account_id"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = (id)objc_msgSend(v50, "integerValue");

  }
  else
  {
    v73 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("provided_by"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  NilIfNSNull(v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = v52;
  if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v70 = v16;
    v71 = v13;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v53 = v52;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    if (v54)
    {
      v55 = v54;
      v68 = v42;
      v69 = (void *)v9;
      v56 = *(_QWORD *)v81;
      while (2)
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v81 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v59 = v58;
            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("type"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            NilIfNSNull(v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("token"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            NilIfNSNull(v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && objc_msgSend(v61, "isEqualToString:", CFSTR("BetaEnrollmentToken"))
                && objc_msgSend(v63, "length"))
              {

                goto LABEL_59;
              }
            }

          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
        if (v55)
          continue;
        break;
      }
      v63 = 0;
LABEL_59:
      v66 = v69;
      v42 = v68;
      v64 = (void *)v21;
    }
    else
    {
      v64 = (void *)v21;
      v66 = (void *)v9;
      v63 = 0;
    }

    v65 = v70;
    v13 = v71;
  }
  else
  {
    v64 = (void *)v21;
    v65 = v16;
    v66 = (void *)v9;
    v63 = 0;
  }
  +[SDBetaProgram betaProgramWithID:title:program:catalog:assetUpdate:assetBrain:assetAudience:legalDocs:platform:buildPrefix:accountID:betaEnrollmentToken:](SDBetaProgram, "betaProgramWithID:title:program:catalog:assetUpdate:assetBrain:assetAudience:legalDocs:platform:buildPrefix:accountID:betaEnrollmentToken:", v13, v65, v64, v66, v79, v78, v77, v76, v42, v75, v73, v63);
  v74 = (id)objc_claimAutoreleasedReturnValue();

  return v74;
}

- (SDBetaProgram)initWithID:(int64_t)a3 title:(id)a4 program:(id)a5 catalog:(id)a6 assetUpdate:(id)a7 assetBrain:(id)a8 assetAudience:(id)a9 legalDocs:(id)a10 platform:(unint64_t)a11 buildPrefix:(id)a12 accountID:(int64_t)a13 betaEnrollmentToken:(id)a14
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  SDBetaProgram *v26;
  SDBetaProgram *v27;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a4;
  v30 = a5;
  v29 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v25 = a14;
  v32.receiver = self;
  v32.super_class = (Class)SDBetaProgram;
  v26 = -[SDBetaProgram init](&v32, sel_init);
  v27 = v26;
  if (v26)
  {
    -[SDBetaProgram setProgramID:](v26, "setProgramID:", a3);
    -[SDBetaProgram setTitle:](v27, "setTitle:", v31);
    -[SDBetaProgram setProgram:](v27, "setProgram:", +[SDSeedProgramManager _seedProgramForString:](SDSeedProgramManager, "_seedProgramForString:", v30));
    -[SDBetaProgram setCatalog:](v27, "setCatalog:", v29);
    -[SDBetaProgram setAssetUpdate:](v27, "setAssetUpdate:", v20);
    -[SDBetaProgram setAssetBrain:](v27, "setAssetBrain:", v21);
    -[SDBetaProgram setAssetAudience:](v27, "setAssetAudience:", v22);
    -[SDBetaProgram setLegalDocs:](v27, "setLegalDocs:", v23);
    -[SDBetaProgram setPlatform:](v27, "setPlatform:", a11);
    -[SDBetaProgram setBuildPrefix:](v27, "setBuildPrefix:", v24);
    -[SDBetaProgram setAccountID:](v27, "setAccountID:", a13);
    -[SDBetaProgram setBetaEnrollmentToken:](v27, "setBetaEnrollmentToken:", v25);
  }

  return v27;
}

- (BOOL)isMDMProgram
{
  void *v2;
  BOOL v3;

  -[SDBetaProgram betaEnrollmentToken](self, "betaEnrollmentToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SDBetaProgram)initWithCoder:(id)a3
{
  id v4;
  SDBetaProgram *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDBetaProgram;
  v5 = -[SDBetaProgram init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("programID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setProgramID:](v5, "setProgramID:", objc_msgSend(v6, "integerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("program"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setProgram:](v5, "setProgram:", +[SDSeedProgramManager _seedProgramForString:](SDSeedProgramManager, "_seedProgramForString:", v8));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("catalog"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setCatalog:](v5, "setCatalog:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetUpdate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setAssetUpdate:](v5, "setAssetUpdate:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetBrain"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setAssetBrain:](v5, "setAssetBrain:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetAudience"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setAssetAudience:](v5, "setAssetAudience:", v12);

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("legalDocs"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setLegalDocs:](v5, "setLegalDocs:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("platform"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setPlatform:](v5, "setPlatform:", objc_msgSend(v17, "integerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildPrefix"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setBuildPrefix:](v5, "setBuildPrefix:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setAccountID:](v5, "setAccountID:", objc_msgSend(v19, "integerValue"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("betaEnrollmentToken"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SDBetaProgram setBetaEnrollmentToken:](v5, "setBetaEnrollmentToken:", v20);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SDBetaProgram programID](self, "programID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v4, CFSTR("programID"));

  -[SDBetaProgram title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, CFSTR("title"));

  +[SDSeedProgramManager stringForSeedProgram:](SDSeedProgramManager, "stringForSeedProgram:", -[SDBetaProgram program](self, "program"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v6, CFSTR("program"));

  -[SDBetaProgram catalog](self, "catalog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v7, CFSTR("catalog"));

  -[SDBetaProgram assetUpdate](self, "assetUpdate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v8, CFSTR("assetUpdate"));

  -[SDBetaProgram assetBrain](self, "assetBrain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v9, CFSTR("assetBrain"));

  -[SDBetaProgram assetAudience](self, "assetAudience");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v10, CFSTR("assetAudience"));

  -[SDBetaProgram legalDocs](self, "legalDocs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v11, CFSTR("legalDocs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SDBetaProgram platform](self, "platform"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v12, CFSTR("platform"));

  -[SDBetaProgram buildPrefix](self, "buildPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("buildPrefix"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SDBetaProgram accountID](self, "accountID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v14, CFSTR("accountID"));

  -[SDBetaProgram betaEnrollmentToken](self, "betaEnrollmentToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SDBetaProgram betaEnrollmentToken](self, "betaEnrollmentToken");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("betaEnrollmentToken"));

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SDBetaProgram title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SDBetaProgram: %@, ID: %ld MDM? %i>"), v4, -[SDBetaProgram programID](self, "programID"), -[SDBetaProgram isMDMProgram](self, "isMDMProgram"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  SDStringArrayFromPlatforms(-[SDBetaProgram platform](self, "platform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[SDBetaProgram title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SDBetaProgram programID](self, "programID");
  -[SDBetaProgram assetAudience](self, "assetAudience");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDBetaProgram buildPrefix](self, "buildPrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SDBetaProgram accountID](self, "accountID");
  -[SDBetaProgram betaEnrollmentToken](self, "betaEnrollmentToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<SDBetaProgram:\n\tTitle: %@\n\tID: %ld\n\tAssetAudience: %@\n\tPlatform: %@\n\tBuildPrefix: %@\n\tAccountID: %ld\n\tBetaEnrollmentToken: %@\n>"), v6, v7, v8, v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isPad
{
  if (isPad_onceToken != -1)
    dispatch_once(&isPad_onceToken, &__block_literal_global_4);
  return isPad_isPad;
}

uint64_t __22__SDBetaProgram_isPad__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  isPad_isPad = result;
  return result;
}

- (int64_t)programID
{
  return self->_programID;
}

- (void)setProgramID:(int64_t)a3
{
  self->_programID = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)program
{
  return self->_program;
}

- (void)setProgram:(int64_t)a3
{
  self->_program = a3;
}

- (NSURL)catalog
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCatalog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURL)assetUpdate
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURL)assetBrain
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetBrain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)assetAudience
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAssetAudience:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)legalDocs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLegalDocs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)buildPrefix
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBuildPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(int64_t)a3
{
  self->_accountID = a3;
}

- (NSString)betaEnrollmentToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBetaEnrollmentToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betaEnrollmentToken, 0);
  objc_storeStrong((id *)&self->_buildPrefix, 0);
  objc_storeStrong((id *)&self->_legalDocs, 0);
  objc_storeStrong((id *)&self->_assetAudience, 0);
  objc_storeStrong((id *)&self->_assetBrain, 0);
  objc_storeStrong((id *)&self->_assetUpdate, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
