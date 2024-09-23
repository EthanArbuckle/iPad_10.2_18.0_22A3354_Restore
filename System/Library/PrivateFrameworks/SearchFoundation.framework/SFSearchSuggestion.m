@implementation SFSearchSuggestion

- (SFSearchSuggestion)initWithProtobuf:(id)a3
{
  id v4;
  SFSearchSuggestion *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  SFSearchSuggestion *v21;
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
  SFSearchSuggestion *v35;
  SFSearchSuggestion *v36;
  _QWORD v38[4];
  SFSearchSuggestion *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SFSearchSuggestion;
  v5 = -[SFSearchSuggestion init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "suggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "suggestion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setSuggestion:](v5, "setSuggestion:", v9);

    }
    objc_msgSend(v4, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "query");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setQuery:](v5, "setQuery:", v11);

    }
    objc_msgSend(v4, "score");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "score");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      -[SFSearchSuggestion setScore:](v5, "setScore:");

    }
    if (objc_msgSend(v4, "type"))
      -[SFSearchSuggestion setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "duplicateSuggestions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v15 = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v4, "duplicateSuggestions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          v21 = -[SFSearchSuggestion initWithProtobuf:]([SFSearchSuggestion alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
          if (v21)
            objc_msgSend(v15, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v18);
    }

    -[SFSearchSuggestion setDuplicateSuggestions:](v5, "setDuplicateSuggestions:", v15);
    objc_msgSend(v4, "topicIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v4, "topicIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setTopicIdentifier:](v5, "setTopicIdentifier:", v23);

    }
    objc_msgSend(v4, "bundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setBundleIdentifier:](v5, "setBundleIdentifier:", v25);

    }
    if (objc_msgSend(v4, "previouslyEngaged"))
      -[SFSearchSuggestion setPreviouslyEngaged:](v5, "setPreviouslyEngaged:", objc_msgSend(v4, "previouslyEngaged"));
    objc_msgSend(v4, "fbr");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "fbr");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setFbr:](v5, "setFbr:", v27);

    }
    objc_msgSend(v4, "scopedSearchApplicationBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "scopedSearchApplicationBundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setScopedSearchApplicationBundleIdentifier:](v5, "setScopedSearchApplicationBundleIdentifier:", v29);

    }
    objc_msgSend(v4, "utteranceText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "utteranceText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setUtteranceText:](v5, "setUtteranceText:", v31);

    }
    objc_msgSend(v4, "detailText");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "detailText");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion setDetailText:](v5, "setDetailText:", v33);

    }
    objc_msgSend(v4, "serverFeatures");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __60__SFSearchSuggestion_ProtobufInitializer__initWithProtobuf___block_invoke;
    v38[3] = &unk_1E4041678;
    v35 = v5;
    v39 = v35;
    objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v38);

    v36 = v35;
  }

  return v5;
}

void __60__SFSearchSuggestion_ProtobufInitializer__initWithProtobuf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "serverFeatures");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v5, v6);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setScore:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_score = a3;
}

- (BOOL)hasScore
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setPreviouslyEngaged:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_previouslyEngaged = a3;
}

- (BOOL)hasPreviouslyEngaged
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFSearchSuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSearchSuggestion *v6;
  SFSearchSuggestion *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBSearchSuggestion initWithData:]([_SFPBSearchSuggestion alloc], "initWithData:", v5);
  v7 = -[SFSearchSuggestion initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBSearchSuggestion *v6;

  v4 = a3;
  v6 = -[_SFPBSearchSuggestion initWithFacade:]([_SFPBSearchSuggestion alloc], "initWithFacade:", self);
  -[_SFPBSearchSuggestion data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBSearchSuggestion *v2;
  void *v3;

  v2 = -[_SFPBSearchSuggestion initWithFacade:]([_SFPBSearchSuggestion alloc], "initWithFacade:", self);
  -[_SFPBSearchSuggestion dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBSearchSuggestion *v2;
  void *v3;

  v2 = -[_SFPBSearchSuggestion initWithFacade:]([_SFPBSearchSuggestion alloc], "initWithFacade:", self);
  -[_SFPBSearchSuggestion jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFSearchSuggestion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SFSearchSuggestion suggestion](self, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSuggestion:", v8);

  -[SFSearchSuggestion query](self, "query");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setQuery:", v10);

  -[SFSearchSuggestion score](self, "score");
  objc_msgSend(v4, "setScore:");
  objc_msgSend(v4, "setType:", -[SFSearchSuggestion type](self, "type"));
  -[SFSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setDuplicateSuggestions:", v12);

  -[SFSearchSuggestion topicIdentifier](self, "topicIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setTopicIdentifier:", v14);

  -[SFSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setBundleIdentifier:", v16);

  objc_msgSend(v4, "setPreviouslyEngaged:", -[SFSearchSuggestion previouslyEngaged](self, "previouslyEngaged"));
  -[SFSearchSuggestion fbr](self, "fbr");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setFbr:", v18);

  -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setScopedSearchApplicationBundleIdentifier:", v20);

  -[SFSearchSuggestion utteranceText](self, "utteranceText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setUtteranceText:", v22);

  -[SFSearchSuggestion detailText](self, "detailText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setDetailText:", v24);

  -[SFSearchSuggestion serverFeatures](self, "serverFeatures");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setServerFeatures:", v26);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  SFSearchSuggestion *v6;
  SFSearchSuggestion *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  SFSearchSuggestion *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  SFSearchSuggestion *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  _BYTE v99[36];
  _QWORD v100[4];
  int v101;
  int v102;
  id v103;
  id v104;
  _QWORD v105[3];

  v6 = (SFSearchSuggestion *)a3;
  if (self == v6)
  {
    v16 = 1;
    goto LABEL_80;
  }
  if (!-[SFSearchSuggestion isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
  {
    v16 = 0;
    goto LABEL_80;
  }
  v7 = v6;
  -[SFSearchSuggestion identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSearchSuggestion identifier](v7, "identifier");
  v103 = (id)objc_claimAutoreleasedReturnValue();
  v104 = v8;
  v101 = v103 != 0;
  v102 = v8 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    v10 = 0;
    memset(v99, 0, sizeof(v99));
    v98 = 0;
    v11 = 0;
    memset(v105, 0, sizeof(v105));
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_15;
  }
  -[SFSearchSuggestion identifier](self, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;
  v97 = (void *)v3;
  if (!v3
    || (-[SFSearchSuggestion identifier](self, "identifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SFSearchSuggestion identifier](v7, "identifier"),
        v93 = (void *)objc_claimAutoreleasedReturnValue(),
        v94 = v9,
        objc_msgSend(v9, "isEqual:")))
  {
    -[SFSearchSuggestion suggestion](self, "suggestion");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchSuggestion suggestion](v7, "suggestion");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v100[3]) = v3 != 0;
    if ((v96 == 0) == (v95 != 0))
    {
      *(_QWORD *)((char *)v100 + 4) = 0;
      LODWORD(v100[0]) = 0;
      v10 = 0;
      memset(v99, 0, sizeof(v99));
      v98 = 0;
      v11 = 0;
      memset(v105, 0, sizeof(v105));
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_OWORD *)((char *)&v100[1] + 4) = 1uLL;
      goto LABEL_15;
    }
    -[SFSearchSuggestion suggestion](self, "suggestion");
    v17 = objc_claimAutoreleasedReturnValue();
    HIDWORD(v105[2]) = v17 != 0;
    v92 = (void *)v17;
    if (v17)
    {
      -[SFSearchSuggestion suggestion](self, "suggestion");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion suggestion](v7, "suggestion");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v18;
      if (!objc_msgSend(v18, "isEqual:"))
      {
        v100[0] = 0;
        *(_QWORD *)((char *)&v100[2] + 4) = 0;
        v10 = 0;
        memset(v99, 0, sizeof(v99));
        v98 = 0;
        v11 = 0;
        v12 = 0;
        memset(v105, 0, 20);
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        LODWORD(v100[2]) = 0;
        v100[1] = 0x100000001;
        HIDWORD(v105[2]) = 1;
        goto LABEL_15;
      }
    }
    -[SFSearchSuggestion query](self, "query");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchSuggestion query](v7, "query");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v91 == 0) == (v90 != 0))
    {
      *(_QWORD *)((char *)&v100[2] + 4) = 0;
      v10 = 0;
      memset(v99, 0, sizeof(v99));
      v98 = 0;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 20);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      LODWORD(v100[2]) = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000000;
      goto LABEL_15;
    }
    -[SFSearchSuggestion query](self, "query");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24 != 0;
    v87 = (void *)v24;
    if (v24)
    {
      -[SFSearchSuggestion query](self, "query");
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v7;
      v28 = (void *)v26;
      v46 = v27;
      -[SFSearchSuggestion query](v27, "query");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v28;
      if (!objc_msgSend(v28, "isEqual:"))
      {
        v100[2] = 0;
        v10 = 0;
        memset(v99, 0, 32);
        v98 = 0;
        v11 = 0;
        v12 = 0;
        memset(v105, 0, 20);
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000000;
        *(_DWORD *)&v99[32] = 1;
        LODWORD(v100[3]) = 1;
        goto LABEL_94;
      }
      v7 = v46;
    }
    -[SFSearchSuggestion score](self, "score");
    v30 = v29;
    -[SFSearchSuggestion score](v7, "score");
    LODWORD(v100[3]) = v25;
    if (vabdd_f64(v30, v31) >= 2.22044605e-16
      || (v3 = -[SFSearchSuggestion type](self, "type"), (_DWORD)v3 != -[SFSearchSuggestion type](v7, "type")))
    {
      v100[2] = 0;
      v10 = 0;
      memset(v99, 0, 32);
      v98 = 0;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 20);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000000;
      *(_DWORD *)&v99[32] = 1;
      goto LABEL_15;
    }
    -[SFSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchSuggestion duplicateSuggestions](v7, "duplicateSuggestions");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v84 == 0) == (v83 != 0))
    {
      v100[2] = 0;
      v10 = 0;
      memset(v99, 0, 28);
      v98 = 0;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 20);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000000;
      *(_QWORD *)&v99[28] = 0x100000001;
      goto LABEL_15;
    }
    -[SFSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
    v32 = objc_claimAutoreleasedReturnValue();
    v3 = v32 != 0;
    v82 = (void *)v32;
    if (v32)
    {
      -[SFSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion duplicateSuggestions](v7, "duplicateSuggestions");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v33;
      if (!objc_msgSend(v33, "isEqual:"))
      {
        v10 = 0;
        memset(v99, 0, 28);
        v98 = 0;
        v11 = 0;
        v12 = 0;
        memset(v105, 0, 20);
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v100[2] = 0x100000000;
        v100[1] = 0x100000001;
        *(_QWORD *)&v99[28] = 0x100000001;
        v100[0] = 0x100000001;
        goto LABEL_15;
      }
    }
    -[SFSearchSuggestion topicIdentifier](self, "topicIdentifier");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchSuggestion topicIdentifier](v7, "topicIdentifier");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v100[2]) = v3;
    if ((v81 == 0) == (v80 != 0))
    {
      memset(v99, 0, 28);
      v98 = 0;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 20);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      *(_QWORD *)((char *)&v100[1] + 4) = 1;
      LODWORD(v100[1]) = 1;
      *(_QWORD *)&v99[28] = 0x100000001;
      v100[0] = 0x100000001;
      v10 = 1;
      goto LABEL_15;
    }
    -[SFSearchSuggestion topicIdentifier](self, "topicIdentifier");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v34 != 0;
    v77 = (void *)v34;
    if (v34)
    {
      -[SFSearchSuggestion topicIdentifier](self, "topicIdentifier");
      v3 = objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion topicIdentifier](v7, "topicIdentifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = (void *)v3;
      if (!objc_msgSend((id)v3, "isEqual:"))
      {
        memset(v99, 0, 24);
        v98 = 0;
        v11 = 0;
        v12 = 0;
        memset(v105, 0, 20);
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000001;
        *(_QWORD *)&v99[28] = 0x100000001;
        v10 = 1;
        *(_DWORD *)&v99[24] = 1;
        LODWORD(v100[2]) = 1;
        goto LABEL_15;
      }
      LODWORD(v100[2]) = v35;
    }
    else
    {
      LODWORD(v100[2]) = 0;
    }
    -[SFSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSearchSuggestion bundleIdentifier](v7, "bundleIdentifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v76 == 0) == (v75 != 0))
    {
      memset(&v99[4], 0, 20);
      v98 = 0;
      v11 = 0;
      v12 = 0;
      memset(v105, 0, 20);
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000001;
      *(_QWORD *)&v99[28] = 0x100000001;
      v10 = 1;
      *(_DWORD *)&v99[24] = 1;
      *(_DWORD *)v99 = 1;
      goto LABEL_15;
    }
    -[SFSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
    v36 = objc_claimAutoreleasedReturnValue();
    LODWORD(v105[2]) = v36 != 0;
    v72 = (void *)v36;
    if (v36)
    {
      -[SFSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSearchSuggestion bundleIdentifier](v7, "bundleIdentifier");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v37;
      if (!objc_msgSend(v37, "isEqual:"))
      {
        v98 = 0;
        *(_QWORD *)&v99[16] = 0;
        v105[0] = 0;
        v105[1] = 0;
        v11 = 0;
        *(_QWORD *)&v99[8] = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000001;
        *(_QWORD *)&v99[28] = 0x100000001;
        v10 = 1;
        *(_DWORD *)&v99[24] = 1;
        *(_QWORD *)v99 = 0x100000001;
        LODWORD(v105[2]) = 1;
        goto LABEL_15;
      }
    }
    v3 = -[SFSearchSuggestion previouslyEngaged](self, "previouslyEngaged");
    if ((_DWORD)v3 != -[SFSearchSuggestion previouslyEngaged](v7, "previouslyEngaged"))
    {
      v98 = 0;
      *(_QWORD *)&v99[16] = 0;
      v105[0] = 0;
      v105[1] = 0;
      v11 = 0;
      *(_QWORD *)&v99[8] = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000001;
      *(_QWORD *)&v99[28] = 0x100000001;
      v10 = 1;
      *(_DWORD *)&v99[24] = 1;
      *(_QWORD *)v99 = 0x100000001;
      goto LABEL_15;
    }
    -[SFSearchSuggestion fbr](self, "fbr");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v7;
    -[SFSearchSuggestion fbr](v7, "fbr");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v69 == 0) == (v68 != 0))
    {
      *(_QWORD *)&v99[16] = 0;
      v105[0] = 0;
      v105[1] = 0;
      v11 = 0;
      *(_QWORD *)&v99[8] = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v100[1] = 0x100000001;
      v100[0] = 0x100000001;
      *(_QWORD *)&v99[28] = 0x100000001;
      v10 = 1;
      *(_DWORD *)&v99[24] = 1;
      *(_QWORD *)v99 = 0x100000001;
      v98 = 0x100000000;
    }
    else
    {
      -[SFSearchSuggestion fbr](self, "fbr");
      v38 = objc_claimAutoreleasedReturnValue();
      HIDWORD(v105[1]) = v38 != 0;
      v67 = (void *)v38;
      if (!v38
        || (-[SFSearchSuggestion fbr](self, "fbr"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFSearchSuggestion fbr](v46, "fbr"),
            v63 = (void *)objc_claimAutoreleasedReturnValue(),
            v64 = v39,
            objc_msgSend(v39, "isEqual:")))
      {
        -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](v46, "scopedSearchApplicationBundleIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v66 == 0) == (v65 != 0))
        {
          *(_QWORD *)&v99[8] = 0;
          *(_QWORD *)((char *)v105 + 4) = 0;
          v12 = 0;
          LODWORD(v105[0]) = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v16 = 0;
          v100[1] = 0x100000001;
          v100[0] = 0x100000001;
          *(_QWORD *)&v99[28] = 0x100000001;
          v10 = 1;
          *(_DWORD *)&v99[24] = 1;
          *(_QWORD *)v99 = 0x100000001;
          v98 = 0x100000000;
          *(_QWORD *)&v99[16] = 1;
          v11 = 1;
        }
        else
        {
          -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
          v40 = objc_claimAutoreleasedReturnValue();
          LODWORD(v105[1]) = v40 != 0;
          v62 = (void *)v40;
          if (!v40
            || (-[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier"), v41 = (void *)objc_claimAutoreleasedReturnValue(), -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](v46, "scopedSearchApplicationBundleIdentifier"), v58 = (void *)objc_claimAutoreleasedReturnValue(), v59 = v41, objc_msgSend(v41, "isEqual:")))
          {
            -[SFSearchSuggestion utteranceText](self, "utteranceText");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFSearchSuggestion utteranceText](v46, "utteranceText");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v61 == 0) == (v60 != 0))
            {
              v105[0] = 0;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v16 = 0;
              v100[1] = 0x100000001;
              v100[0] = 0x100000001;
              *(_QWORD *)&v99[28] = 0x100000001;
              v10 = 1;
              *(_DWORD *)&v99[24] = 1;
              *(_QWORD *)v99 = 0x100000001;
              *(_QWORD *)&v99[16] = 1;
              v11 = 1;
              *(_QWORD *)&v99[8] = 1;
              v98 = 0x100000001;
            }
            else
            {
              -[SFSearchSuggestion utteranceText](self, "utteranceText");
              v42 = objc_claimAutoreleasedReturnValue();
              HIDWORD(v105[0]) = v42 != 0;
              v57 = (void *)v42;
              if (!v42
                || (-[SFSearchSuggestion utteranceText](self, "utteranceText"),
                    v43 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[SFSearchSuggestion utteranceText](v46, "utteranceText"),
                    v53 = (void *)objc_claimAutoreleasedReturnValue(),
                    v54 = v43,
                    objc_msgSend(v43, "isEqual:")))
              {
                -[SFSearchSuggestion detailText](self, "detailText");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFSearchSuggestion detailText](v46, "detailText");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v56 == 0) == (v55 != 0))
                {
                  v12 = 0;
                  LODWORD(v105[0]) = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v16 = 0;
                  v100[1] = 0x100000001;
                  v100[0] = 0x100000001;
                  *(_QWORD *)&v99[28] = 0x100000001;
                  v10 = 1;
                  *(_DWORD *)&v99[24] = 1;
                  *(_QWORD *)v99 = 0x100000001;
                  v98 = 0x100000001;
                  *(_QWORD *)&v99[16] = 0x100000001;
                  v11 = 1;
                  *(_QWORD *)&v99[8] = 0x100000001;
                }
                else
                {
                  -[SFSearchSuggestion detailText](self, "detailText");
                  v44 = objc_claimAutoreleasedReturnValue();
                  LODWORD(v105[0]) = v44 != 0;
                  v52 = (void *)v44;
                  if (!v44
                    || (-[SFSearchSuggestion detailText](self, "detailText"),
                        v45 = (void *)objc_claimAutoreleasedReturnValue(),
                        -[SFSearchSuggestion detailText](v46, "detailText"),
                        v48 = (void *)objc_claimAutoreleasedReturnValue(),
                        v49 = v45,
                        objc_msgSend(v45, "isEqual:")))
                  {
                    -[SFSearchSuggestion serverFeatures](self, "serverFeatures");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFSearchSuggestion serverFeatures](v46, "serverFeatures");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((v51 == 0) == (v50 != 0))
                    {
                      v14 = 0;
                      v15 = 0;
                      v16 = 0;
                      v100[1] = 0x100000001;
                      v100[0] = 0x100000001;
                      *(_QWORD *)&v99[28] = 0x100000001;
                      v10 = 1;
                      *(_DWORD *)&v99[24] = 1;
                      *(_QWORD *)v99 = 0x100000001;
                      v98 = 0x100000001;
                      *(_QWORD *)&v99[16] = 0x100000001;
                      v11 = 1;
                      *(_QWORD *)&v99[8] = 0x100000001;
                      v12 = 1;
                      v13 = 1;
                    }
                    else
                    {
                      -[SFSearchSuggestion serverFeatures](self, "serverFeatures");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v47)
                      {
                        -[SFSearchSuggestion serverFeatures](self, "serverFeatures");
                        v3 = objc_claimAutoreleasedReturnValue();
                        v7 = v46;
                        -[SFSearchSuggestion serverFeatures](v46, "serverFeatures");
                        v4 = objc_claimAutoreleasedReturnValue();
                        v16 = objc_msgSend((id)v3, "isEqual:", v4);
                        v15 = 1;
                        v100[1] = 0x100000001;
                        v100[0] = 0x100000001;
                        *(_QWORD *)&v99[28] = 0x100000001;
                        v10 = 1;
                        *(_DWORD *)&v99[24] = 1;
                        *(_QWORD *)v99 = 0x100000001;
                        v98 = 0x100000001;
                        *(_QWORD *)&v99[16] = 0x100000001;
                        v11 = 1;
                        *(_QWORD *)&v99[8] = 0x100000001;
                        v12 = 1;
                        v13 = 1;
                        v14 = 1;
                        goto LABEL_15;
                      }
                      v47 = 0;
                      v15 = 0;
                      v100[1] = 0x100000001;
                      v100[0] = 0x100000001;
                      *(_QWORD *)&v99[28] = 0x100000001;
                      v10 = 1;
                      *(_DWORD *)&v99[24] = 1;
                      *(_QWORD *)v99 = 0x100000001;
                      v98 = 0x100000001;
                      *(_QWORD *)&v99[16] = 0x100000001;
                      v11 = 1;
                      *(_QWORD *)&v99[8] = 0x100000001;
                      v12 = 1;
                      v13 = 1;
                      v14 = 1;
                      v16 = 1;
                    }
                  }
                  else
                  {
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v16 = 0;
                    v100[1] = 0x100000001;
                    v100[0] = 0x100000001;
                    *(_QWORD *)&v99[28] = 0x100000001;
                    v10 = 1;
                    *(_DWORD *)&v99[24] = 1;
                    *(_QWORD *)v99 = 0x100000001;
                    v98 = 0x100000001;
                    *(_QWORD *)&v99[16] = 0x100000001;
                    v11 = 1;
                    *(_QWORD *)&v99[8] = 0x100000001;
                    v12 = 1;
                    LODWORD(v105[0]) = 1;
                  }
                }
              }
              else
              {
                v12 = 0;
                v105[0] = 0x100000000;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v16 = 0;
                v100[1] = 0x100000001;
                v100[0] = 0x100000001;
                *(_QWORD *)&v99[28] = 0x100000001;
                v10 = 1;
                *(_DWORD *)&v99[24] = 1;
                *(_QWORD *)v99 = 0x100000001;
                v98 = 0x100000001;
                *(_QWORD *)&v99[16] = 0x100000001;
                v11 = 1;
                *(_QWORD *)&v99[8] = 1;
              }
            }
          }
          else
          {
            v105[0] = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v100[1] = 0x100000001;
            v100[0] = 0x100000001;
            *(_QWORD *)&v99[28] = 0x100000001;
            v10 = 1;
            *(_DWORD *)&v99[24] = 1;
            *(_QWORD *)v99 = 0x100000001;
            v98 = 0x100000000;
            *(_QWORD *)&v99[16] = 1;
            v11 = 1;
            *(_QWORD *)&v99[8] = 1;
            LODWORD(v105[1]) = 1;
          }
        }
      }
      else
      {
        v11 = 0;
        *(_QWORD *)&v99[8] = 0;
        *(_QWORD *)((char *)v105 + 4) = 0;
        v12 = 0;
        LODWORD(v105[0]) = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v100[1] = 0x100000001;
        v100[0] = 0x100000001;
        *(_QWORD *)&v99[28] = 0x100000001;
        v10 = 1;
        *(_DWORD *)&v99[24] = 1;
        *(_QWORD *)v99 = 0x100000001;
        v98 = 0x100000000;
        *(_QWORD *)&v99[16] = 1;
        HIDWORD(v105[1]) = 1;
      }
    }
LABEL_94:
    v7 = v46;
    goto LABEL_15;
  }
  memset(v100, 0, 28);
  v10 = 0;
  memset(v99, 0, sizeof(v99));
  v98 = 0;
  v11 = 0;
  memset(v105, 0, sizeof(v105));
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  HIDWORD(v100[3]) = 1;
LABEL_15:
  if (v15)
  {
    v19 = v10;
    v20 = v12;
    v21 = v13;
    v22 = v14;

    v14 = v22;
    v13 = v21;
    v12 = v20;
    v10 = v19;
  }
  if (v14)

  if (v13)
  {

  }
  if (LODWORD(v105[0]))
  {

  }
  if (v12)

  if (*(_DWORD *)&v99[12])
  {

  }
  if (HIDWORD(v105[0]))
  {

  }
  if (*(_DWORD *)&v99[20])

  if ((_DWORD)v98)
  {

  }
  if (LODWORD(v105[1]))
  {

  }
  if (*(_DWORD *)&v99[8])

  if (v11)
  {

  }
  if (HIDWORD(v105[1]))
  {

  }
  if (*(_DWORD *)&v99[16])

  if (HIDWORD(v98))
  {

  }
  if (LODWORD(v105[2]))
  {

  }
  if (*(_DWORD *)&v99[4])

  if (*(_DWORD *)v99)
  {

  }
  if (LODWORD(v100[2]))
  {

  }
  if (*(_DWORD *)&v99[24])

  if (v10)
  {

  }
  if (HIDWORD(v100[2]))
  {

  }
  if (LODWORD(v100[0]))

  if (*(_DWORD *)&v99[28])
  {

  }
  if (LODWORD(v100[3]))
  {

  }
  if (*(_DWORD *)&v99[32])

  if (HIDWORD(v100[0]))
  {

  }
  if (HIDWORD(v105[2]))
  {

  }
  if (LODWORD(v100[1]))

  if (HIDWORD(v100[1]))
  {

  }
  if (HIDWORD(v100[3]))
  {

  }
  if (v102 != v101)

LABEL_80:
  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  double v4;
  double v5;
  long double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;

  -[SFSearchSuggestion identifier](self, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v31, "hash");
  -[SFSearchSuggestion suggestion](self, "suggestion");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v30, "hash") ^ v3;
  -[SFSearchSuggestion query](self, "query");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v29, "hash");
  -[SFSearchSuggestion score](self, "score");
  v5 = -v4;
  if (v4 >= 0.0)
    v5 = v4;
  v6 = round(v5);
  v24 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  v23 = -[SFSearchSuggestion type](self, "type");
  -[SFSearchSuggestion duplicateSuggestions](self, "duplicateSuggestions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v27, "hash");
  -[SFSearchSuggestion topicIdentifier](self, "topicIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v25, "hash");
  -[SFSearchSuggestion bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v7, "hash");
  v19 = -[SFSearchSuggestion previouslyEngaged](self, "previouslyEngaged");
  -[SFSearchSuggestion fbr](self, "fbr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFSearchSuggestion scopedSearchApplicationBundleIdentifier](self, "scopedSearchApplicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SFSearchSuggestion utteranceText](self, "utteranceText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[SFSearchSuggestion detailText](self, "detailText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFSearchSuggestion serverFeatures](self, "serverFeatures");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28 ^ v26 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v9 ^ v11 ^ v13 ^ v15 ^ objc_msgSend(v16, "hash") ^ v24;

  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)score
{
  return self->_score;
}

- (int)type
{
  return self->_type;
}

- (NSArray)duplicateSuggestions
{
  return self->_duplicateSuggestions;
}

- (void)setDuplicateSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (void)setTopicIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)previouslyEngaged
{
  return self->_previouslyEngaged;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)scopedSearchApplicationBundleIdentifier
{
  return self->_scopedSearchApplicationBundleIdentifier;
}

- (void)setScopedSearchApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)utteranceText
{
  return self->_utteranceText;
}

- (void)setUtteranceText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSMutableDictionary)serverFeatures
{
  return self->_serverFeatures;
}

- (void)setServerFeatures:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverFeatures, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_utteranceText, 0);
  objc_storeStrong((id *)&self->_scopedSearchApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
  objc_storeStrong((id *)&self->_duplicateSuggestions, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SFSearchSuggestion)initWithIdentifier:(id)a3 suggestion:(id)a4 query:(id)a5 score:(double)a6 type:(int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  SFSearchSuggestion *v15;
  SFSearchSuggestion *v16;
  SFSearchSuggestion *v17;
  objc_super v19;

  v7 = *(_QWORD *)&a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFSearchSuggestion;
  v15 = -[SFSearchSuggestion init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    -[SFSearchSuggestion setIdentifier:](v15, "setIdentifier:", v12);
    -[SFSearchSuggestion setSuggestion:](v16, "setSuggestion:", v13);
    -[SFSearchSuggestion setQuery:](v16, "setQuery:", v14);
    -[SFSearchSuggestion setScore:](v16, "setScore:", a6);
    -[SFSearchSuggestion setType:](v16, "setType:", v7);
    v17 = v16;
  }

  return v16;
}

- (SFSearchSuggestion)initWithSuggestion:(id)a3 query:(id)a4 score:(double)a5 type:(int)a6
{
  uint64_t v6;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SFSearchSuggestion *v15;

  v6 = *(_QWORD *)&a6;
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SFSearchSuggestion initWithIdentifier:suggestion:query:score:type:](self, "initWithIdentifier:suggestion:query:score:type:", v14, v12, v11, v6, a5);

  return v15;
}

@end
