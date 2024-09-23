@implementation PGGraphPersonNode

- (int64_t)compareToPerson:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "type");
  if (v5 == objc_msgSend((id)objc_opt_class(), "type"))
  {
    v6 = v4;
    -[PGGraphPersonNode contactIdentifier](self, "contactIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    objc_msgSend(v6, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v8 || v10)
    {
      if (v8 || !v10)
        v11 = (*((uint64_t (**)(uint64_t, void *, void *))PGManagerPersonNodeComparisonBlock + 2))((uint64_t)PGManagerPersonNodeComparisonBlock, self, v6);
      else
        v11 = 1;
    }
    else
    {
      v11 = -1;
    }

  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (NSString)suggestedContactIdentifier
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__6847;
  v9 = __Block_byref_object_dispose__6848;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PGGraphPersonNode_PGPersonResult__suggestedContactIdentifier__block_invoke;
  v4[3] = &unk_1E84364A8;
  v4[4] = &v5;
  -[PGGraphPersonNode enumerateContactSuggestionsSortedByConfidenceMatchingQuery:usingBlock:](self, "enumerateContactSuggestionsSortedByConfidenceMatchingQuery:usingBlock:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (BOOL)isVerified
{
  return 1;
}

- (BOOL)isInferredChild
{
  return -[PGGraphPersonNode ageCategory](self, "ageCategory") - 1 < 2;
}

void __63__PGGraphPersonNode_PGPersonResult__suggestedContactIdentifier__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "contactIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  *a5 = 1;
}

+ (unint64_t)type
{
  return 0;
}

- (PGGraphPersonNode)initWithPerson:(id)a3
{
  id v4;
  PGGraphPersonNode *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGGraphPersonNode;
  v5 = -[PGGraphNode init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "propertiesWithPerson:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphPersonNode setLocalProperties:](v5, "setLocalProperties:", v6);

  }
  return v5;
}

- (PGGraphPersonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  PGGraphPersonNode *v7;
  PGGraphPersonNode *v8;

  v6 = a5;
  v7 = -[PGGraphNode init](self, "init");
  v8 = v7;
  if (v7)
    -[PGGraphPersonNode setLocalProperties:](v7, "setLocalProperties:", v6);

  return v8;
}

- (PGGraphPersonNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGGraphPersonNode *v14;

  v7 = a4;
  v9 = a3;
  v10 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("gender"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("gender"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("sex"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("gender"));
    v10 = v12;
  }
  v14 = -[PGGraphPersonNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v9, v7, v10);

  return v14;
}

- (int64_t)memberType
{
  return 0;
}

- (id)entityFilter
{
  id v3;
  void *v4;
  NSString *localIdentifier;
  void *v6;
  NSString **v7;
  const __CFString **v8;
  NSUInteger v9;
  NSString *contactIdentifier;
  NSString *name;
  void *v12;
  void *v13;
  const __CFString *v15;
  NSString *v16;
  const __CFString *v17;
  NSString *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_localIdentifier, "length"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D42A50]);
    -[PGGraphPersonNode label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    localIdentifier = self->_localIdentifier;
    v19 = CFSTR("id");
    v20[0] = localIdentifier;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = (NSString **)v20;
    v8 = &v19;
  }
  else
  {
    v9 = -[NSString length](self->_contactIdentifier, "length");
    v3 = objc_alloc(MEMORY[0x1E0D42A50]);
    -[PGGraphPersonNode label](self, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      contactIdentifier = self->_contactIdentifier;
      v17 = CFSTR("cnid");
      v18 = contactIdentifier;
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v18;
      v8 = &v17;
    }
    else
    {
      name = self->_name;
      v15 = CFSTR("name");
      v16 = name;
      v6 = (void *)MEMORY[0x1E0C99D80];
      v7 = &v16;
      v8 = &v15;
    }
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithLabel:domain:properties:", v4, 300, v12);

  return v13;
}

- (void)setLocalProperties:(id)a3
{
  NSString *v4;
  NSString *name;
  NSString *v6;
  NSString *localIdentifier;
  NSString *v8;
  NSString *contactIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *shareParticipantLocalIdentifier;
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
  void *v27;
  id v28;

  v28 = a3;
  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("name"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v4;

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("id"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  localIdentifier = self->_localIdentifier;
  self->_localIdentifier = v6;

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("cnid"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v8;

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sex = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("agecategory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_ageCategory = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("fav"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isFavorite = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("usercreated"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isUserCreated = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("shareparticipant"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  shareParticipantLocalIdentifier = self->_shareParticipantLocalIdentifier;
  self->_shareParticipantLocalIdentifier = v14;

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("bday"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v16, "doubleValue");
    objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  objc_storeStrong((id *)&self->_birthdayDate, v19);
  if (v17)

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("pbday"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(v22, "dateWithTimeIntervalSince1970:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  objc_storeStrong((id *)&self->_potentialBirthdayDate, v23);
  if (v21)

  objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("anniv"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    v26 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v26, "dateWithTimeIntervalSince1970:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  objc_storeStrong((id *)&self->_anniversaryDate, v27);
  if (v25)

}

- (BOOL)hasProperties:(id)a3
{
  id v4;
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
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && !objc_msgSend(v6, "isEqual:", self->_name))
      goto LABEL_25;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
    if (v8)
    {
      if (!objc_msgSend(v8, "isEqual:", self->_localIdentifier))
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cnid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      if (!objc_msgSend(v9, "isEqual:", self->_contactIdentifier))
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "unsignedIntegerValue") != self->_sex)
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("agecategory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "unsignedIntegerValue") != self->_ageCategory)
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fav"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v12)
    {
      if (self->_isFavorite != objc_msgSend(v12, "BOOLValue"))
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("usercreated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v13)
    {
      if (self->_isUserCreated != objc_msgSend(v13, "BOOLValue"))
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shareparticipant"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v14)
    {
      if (!objc_msgSend(v14, "isEqual:", self->_shareParticipantLocalIdentifier))
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bday"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      v17 = v16;
      -[NSDate timeIntervalSince1970](self->_birthdayDate, "timeIntervalSince1970");
      if (v17 != v18)
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pbday"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
      -[NSDate timeIntervalSince1970](self->_potentialBirthdayDate, "timeIntervalSince1970");
      if (v21 != v22)
        goto LABEL_25;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("anniv"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
    if (!v23
      || (objc_msgSend(v23, "doubleValue"),
          v25 = v24,
          -[NSDate timeIntervalSince1970](self->_anniversaryDate, "timeIntervalSince1970"),
          v25 == v26))
    {
      v27 = 1;
    }
    else
    {
LABEL_25:
      v27 = 0;
    }

  }
  else
  {
    v27 = 1;
  }

  return v27;
}

- (id)propertyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSDate *birthdayDate;
  void *v9;
  void *v10;
  NSDate *potentialBirthdayDate;
  void *v12;
  void *v13;
  NSDate *anniversaryDate;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localIdentifier, CFSTR("id"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_contactIdentifier, CFSTR("cnid"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFavorite);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("fav"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUserCreated);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("usercreated"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_shareParticipantLocalIdentifier, CFSTR("shareparticipant"));
  if (self->_sex)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sex"));

  }
  if (self->_ageCategory)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("agecategory"));

  }
  birthdayDate = self->_birthdayDate;
  if (birthdayDate)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](birthdayDate, "timeIntervalSince1970");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("bday"));

  }
  potentialBirthdayDate = self->_potentialBirthdayDate;
  if (potentialBirthdayDate)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](potentialBirthdayDate, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("pbday"));

  }
  anniversaryDate = self->_anniversaryDate;
  if (anniversaryDate)
  {
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](anniversaryDate, "timeIntervalSince1970");
    objc_msgSend(v15, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("anniv"));

  }
  return v3;
}

- (id)propertyForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = 40;
LABEL_7:
    v6 = *(id *)((char *)&self->super.super.super.super.isa + v5);
LABEL_8:
    v7 = v6;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("id")))
  {
    v5 = 48;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("cnid")))
  {
    v5 = 56;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sex")))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = 88;
LABEL_14:
    objc_msgSend(v9, "numberWithUnsignedInteger:", *(Class *)((char *)&self->super.super.super.super.isa + v10));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("agecategory")))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = 96;
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("fav")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = 32;
LABEL_19:
    objc_msgSend(v11, "numberWithBool:", *((unsigned __int8 *)&self->super.super.super.super.isa + v12));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("usercreated")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = 33;
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("shareparticipant")))
  {
    v5 = 104;
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("bday")))
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = 64;
LABEL_28:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v14), "timeIntervalSince1970");
    objc_msgSend(v13, "numberWithDouble:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("pbday")))
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = 72;
    goto LABEL_28;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("anniv")))
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = 80;
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v4;
    v19 = 2112;
    v20 = v16;
    _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unsupported property '%@' accessed on %@.", (uint8_t *)&v17, 0x16u);

  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *name;
  const __CFString *v6;
  NSString *localIdentifier;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)PGGraphPersonNode;
  -[PGGraphOptimizedNode description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  if (-[NSString length](name, "length"))
    v6 = CFSTR(", ");
  else
    v6 = &stru_1E8436F28;
  localIdentifier = self->_localIdentifier;
  if (-[NSString length](self->_contactIdentifier, "length"))
    v8 = CFSTR(", ");
  else
    v8 = &stru_1E8436F28;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@%@%@%@%@)"), v4, name, v6, localIdentifier, v8, self->_contactIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("People");
  return CFSTR("People");
}

- (unsigned)domain
{
  return 300;
}

- (BOOL)isMeNode
{
  void *v2;
  char v3;

  -[PGGraphPersonNode label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Me"));

  return v3;
}

- (double)personScore
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  double v6;
  unsigned int v7;
  double v8;

  -[PGGraphPersonNode name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  v5 = -[PGGraphPersonNode belongsToAnySocialGroup](self, "belongsToAnySocialGroup");
  v6 = (double)-[PGGraphPersonNode isFavorite](self, "isFavorite");
  v7 = -[PGGraphPersonNode isUserCreated](self, "isUserCreated");
  v8 = 0.0;
  if (v4)
    v8 = 1.0;
  return (v6 + (double)v7 + v8 + (double)v5) * 0.25;
}

- (BOOL)belongsToAnySocialGroup
{
  return -[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", CFSTR("BELONGSTO"), 302);
}

- (BOOL)belongsToBestSocialGroups
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[MANode hasEdgeWithLabel:domain:](self, "hasEdgeWithLabel:domain:", CFSTR("BELONGSTO"), 302))
    return 0;
  -[MANode graph](self, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestSocialGroupNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (-[MANode hasEdgeTowardNode:](self, "hasEdgeTowardNode:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12))
        {
          v10 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (unint64_t)numberOfMomentNodes
{
  return -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("PRESENT"), 300);
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("PRESENT"), 300, a3);
}

- (void)enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E84293D0;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_OWNED_BY"), 202, v6);

  _Block_object_dispose(v9, 8);
}

- (void)enumerateHomeOrWorkAddressNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E84293D0;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[PGGraphPersonNode enumerateHomeOrWorkNodesUsingBlock:](self, "enumerateHomeOrWorkNodesUsingBlock:", v6);

  _Block_object_dispose(v9, 8);
}

- (void)enumerateHomeOrWorkNodesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[3];
  char v10;

  v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphPersonNode_enumerateHomeOrWorkNodesUsingBlock___block_invoke;
  v6[3] = &unk_1E84293D0;
  v5 = v4;
  v7 = v5;
  v8 = v9;
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_OWNED_BY"), 202, v6);

  _Block_object_dispose(v9, 8);
}

- (void)enumerateBirthdayMomentNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BIRTHDAY"), 301, a3);
}

- (BOOL)_hasRelationshipLabel:(id)a3 withStatus:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MANode edgesForLabel:domain:](self, "edgesForLabel:domain:", a3, 300);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "status", (_QWORD)v12) == a4)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isMemberOfMyFamily
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("FAMILY"), 0);
}

- (BOOL)isMyPartner
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("PARTNER"), 0);
}

- (BOOL)isMyChild
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("CHILD"), 0);
}

- (BOOL)isMySon
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("SON"), 0);
}

- (BOOL)isMyDaughter
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("DAUGHTER"), 0);
}

- (BOOL)isMyParent
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("PARENT"), 0);
}

- (BOOL)isMyMother
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("MOTHER"), 0);
}

- (BOOL)isMyFather
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("FATHER"), 0);
}

- (BOOL)isMySister
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("SISTER"), 0);
}

- (BOOL)isMyBrother
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("BROTHER"), 0);
}

- (BOOL)isMySibling
{
  return -[PGGraphPersonNode isMySister](self, "isMySister") || -[PGGraphPersonNode isMyBrother](self, "isMyBrother");
}

- (BOOL)isMyCoworker
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("COWORKER"), 0);
}

- (BOOL)isMyFriend
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("FRIEND"), 0);
}

- (BOOL)isMyAcquaintance
{
  if (-[PGGraphPersonNode isMemberOfMyFamily](self, "isMemberOfMyFamily")
    || -[PGGraphPersonNode isMyPartner](self, "isMyPartner")
    || -[PGGraphPersonNode isMyChild](self, "isMyChild")
    || -[PGGraphPersonNode isMyCoworker](self, "isMyCoworker"))
  {
    return 0;
  }
  else
  {
    return !-[PGGraphPersonNode isMyFriend](self, "isMyFriend");
  }
}

- (BOOL)isInferredMemberOfMyFamily
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("FAMILY"), 1);
}

- (BOOL)isMyInferredPartner
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("PARTNER"), 1);
}

- (BOOL)isMyInferredChild
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("CHILD"), 1);
}

- (BOOL)isMyInferredParent
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("PARENT"), 1);
}

- (BOOL)isMyInferredMother
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("MOTHER"), 1);
}

- (BOOL)isMyInferredFather
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("FATHER"), 1);
}

- (BOOL)isMyInferredSister
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("SISTER"), 1);
}

- (BOOL)isMyInferredBrother
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("BROTHER"), 1);
}

- (BOOL)isMyInferredSon
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("SON"), 1);
}

- (BOOL)isMyInferredDaughter
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("DAUGHTER"), 1);
}

- (BOOL)isMyInferredSibling
{
  return -[PGGraphPersonNode isMyInferredSister](self, "isMyInferredSister")
      || -[PGGraphPersonNode isMyInferredBrother](self, "isMyInferredBrother");
}

- (BOOL)isMyInferredCoworker
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("COWORKER"), 1);
}

- (BOOL)isMyInferredFriend
{
  return -[PGGraphPersonNode _hasRelationshipLabel:withStatus:](self, "_hasRelationshipLabel:withStatus:", CFSTR("FRIEND"), 1);
}

- (BOOL)isMyInferredAcquaintance
{
  if (-[PGGraphPersonNode isInferredMemberOfMyFamily](self, "isInferredMemberOfMyFamily")
    || -[PGGraphPersonNode isMyInferredPartner](self, "isMyInferredPartner")
    || -[PGGraphPersonNode isMyInferredChild](self, "isMyInferredChild")
    || -[PGGraphPersonNode isMyInferredCoworker](self, "isMyInferredCoworker"))
  {
    return 0;
  }
  else
  {
    return !-[PGGraphPersonNode isMyInferredFriend](self, "isMyInferredFriend");
  }
}

- (BOOL)isTaggedWithRelationship:(unint64_t)a3 withConfidence:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  +[PGGraphPersonNode relationshipTagOfPersonWithConfidence:](PGGraphPersonNode, "relationshipTagOfPersonWithConfidence:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonNode collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonRelationshipTagNodeCollection, "nodesRelatedToNodes:withRelation:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (void)enumerateContactSuggestionsSortedByConfidenceMatchingQuery:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[PGGraphPersonNode _contactSuggestionEdgesSortedByConfidence](self, "_contactSuggestionEdgesSortedByConfidence");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__PGGraphPersonNode_enumerateContactSuggestionsSortedByConfidenceMatchingQuery_usingBlock___block_invoke;
  v9[3] = &unk_1E8429420;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v7 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

- (BOOL)_contactSuggestionEdge:(id)a3 fitsQuery:(unint64_t)a4
{
  unsigned int v4;
  double v5;
  BOOL v6;
  _BOOL4 v7;

  v4 = a4;
  objc_msgSend(a3, "confidence");
  if ((v4 & 1) != 0 && v5 == 1.0 || (v4 & 2) != 0 && (v5 > 0.0 ? (v6 = v5 < 1.0) : (v6 = 0), v6))
    LOBYTE(v7) = 1;
  else
    return (v5 == 0.0) & (v4 >> 2);
  return v7;
}

- (id)_contactSuggestionEdgesSortedByConfidence
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PGGraphPersonNode__contactSuggestionEdgesSortedByConfidence__block_invoke;
  v9[3] = &unk_1E8429448;
  v10 = v3;
  v4 = v3;
  -[MANode enumerateEdgesWithLabel:domain:usingBlock:](self, "enumerateEdgesWithLabel:domain:usingBlock:", CFSTR("PEOPLE_CONTACT_SUGGESTION"), 303, v9);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("confidence"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)stringDescription
{
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  PGGraphPersonNode *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PGGraphPersonNode name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    return v3;
  -[PGGraphPersonNode localIdentifier](self, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    -[PGGraphPersonNode contactIdentifier](self, "contactIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (objc_msgSend(v5, "length"))
  {
    if ((unint64_t)objc_msgSend(v5, "length") < 9)
    {
      return v5;
    }
    else
    {
      objc_msgSend(v5, "substringToIndex:", 8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  else
  {

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = self;
      _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "No identifiers for personNode %@", (uint8_t *)&v10, 0xCu);
    }

    return CFSTR("unknown");
  }
}

- (BOOL)isIdentifiedByProperties:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && -[NSString length](self->_localIdentifier, "length"))
  {
    v6 = objc_msgSend(v5, "isEqualToString:", self->_localIdentifier);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cnid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length") && -[NSString length](self->_contactIdentifier, "length"))
      v6 = objc_msgSend(v7, "isEqualToString:", self->_contactIdentifier);
    else
      v6 = 0;

  }
  return v6;
}

- (id)changingPropertiesWithProperties:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDate *birthdayDate;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSDate *potentialBirthdayDate;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSDate *anniversaryDate;
  NSString *shareParticipantLocalIdentifier;
  void *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  PGGraphPersonNode *v46;
  __int16 v47;
  NSString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGGraphPersonNode propertyDictionary](self, "propertyDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (-[NSString length](self->_localIdentifier, "length")
        && objc_msgSend(v9, "length")
        && !-[NSString isEqualToString:](self->_localIdentifier, "isEqualToString:", v9))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v9;
          v45 = 2112;
          v46 = self;
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Trying to merge local identifier %@ into person node %@", buf, 0x16u);
        }
        v7 = (id)MEMORY[0x1E0C9AA70];
        goto LABEL_62;
      }
      if (-[NSString length](self->_localIdentifier, "length") || !objc_msgSend(v9, "length"))
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("id"));
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cnid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (-[NSString length](self->_contactIdentifier, "length")
        && objc_msgSend(v10, "length")
        && !-[NSString isEqualToString:](self->_contactIdentifier, "isEqualToString:", v10)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v44 = v10;
        v45 = 2112;
        v46 = self;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Trying to merge ContactIdentifier %@ into person node %@", buf, 0x16u);
      }
      if (-[NSString length](self->_contactIdentifier, "length") || !objc_msgSend(v10, "length"))
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("cnid"));
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shareparticipant"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "length")
        && -[NSString length](self->_shareParticipantLocalIdentifier, "length")
        && !-[NSString isEqualToString:](self->_shareParticipantLocalIdentifier, "isEqualToString:", v12)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        shareParticipantLocalIdentifier = self->_shareParticipantLocalIdentifier;
        *(_DWORD *)buf = 138412802;
        v44 = v12;
        v45 = 2112;
        v46 = self;
        v47 = 2112;
        v48 = shareParticipantLocalIdentifier;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Trying to merge ShareParticipantIdentifier %@ into person node %@ with share participant identifier %@", buf, 0x20u);
      }
      if (-[NSString length](self->_shareParticipantLocalIdentifier, "length") || !objc_msgSend(v12, "length"))
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("shareparticipant"));
    }
    v41 = v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v40, "length");
    if (v13 <= -[NSString length](self->_name, "length"))
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("name"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    if (self->_sex || !v15)
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("sex"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("agecategory"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    if (self->_ageCategory || !v17)
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("agecategory"));
    if (self->_isFavorite
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fav")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "BOOLValue"),
          v18,
          (v19 & 1) == 0))
    {
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("fav"));
    }
    if (self->_isUserCreated
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("usercreated")),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "BOOLValue"),
          v20,
          (v21 & 1) == 0))
    {
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("usercreated"));
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bday"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v42 = v10;
    if (v22)
    {
      v24 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v22, "doubleValue");
      objc_msgSend(v24, "dateWithTimeIntervalSince1970:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      birthdayDate = self->_birthdayDate;
      if (birthdayDate && v25 && -[NSDate isEqualToDate:](birthdayDate, "isEqualToDate:", v25))
      {
        v27 = v9;
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("bday"));
      }
      else
      {
        v27 = v9;
      }
    }
    else
    {
      v27 = v9;
      v25 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pbday"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v28, "doubleValue");
      objc_msgSend(v30, "dateWithTimeIntervalSince1970:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      potentialBirthdayDate = self->_potentialBirthdayDate;
      if (potentialBirthdayDate && v31 && -[NSDate isEqualToDate:](potentialBirthdayDate, "isEqualToDate:", v31))
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("pbday"));
    }
    else
    {
      v31 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("anniv"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v33, "doubleValue");
      objc_msgSend(v35, "dateWithTimeIntervalSince1970:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      anniversaryDate = self->_anniversaryDate;
      if (anniversaryDate && v36 && -[NSDate isEqualToDate:](anniversaryDate, "isEqualToDate:", v36))
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("anniv"));
    }
    else
    {
      v36 = 0;
    }
    v7 = v8;

    v9 = v27;
LABEL_62:

    goto LABEL_63;
  }
  v7 = (id)MEMORY[0x1E0C9AA70];
LABEL_63:

  return v7;
}

- (NSDateComponents)birthdayDateComponents
{
  void *v2;

  if (self->_birthdayDate)
  {
    +[PGGraphPersonNode _specialDateComponentsForDate:](PGGraphPersonNode, "_specialDateComponentsForDate:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (NSDateComponents)potentialBirthdayDateComponents
{
  void *v2;

  if (self->_potentialBirthdayDate)
  {
    +[PGGraphPersonNode _specialDateComponentsForDate:](PGGraphPersonNode, "_specialDateComponentsForDate:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (NSDateComponents)anniversaryDateComponents
{
  void *v2;

  if (self->_anniversaryDate)
  {
    +[PGGraphPersonNode _specialDateComponentsForDate:](PGGraphPersonNode, "_specialDateComponentsForDate:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDateComponents *)v2;
}

- (id)associatedNodesForRemoval
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphPersonNode collection](self, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "socialGroupNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PGGraphPersonNode_associatedNodesForRemoval__block_invoke;
  v8[3] = &unk_1E8429470;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v8);

  return v6;
}

- (PGGraphPersonNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphPersonNodeCollection alloc], "initWithNode:", self);
}

- (unint64_t)featureType
{
  return 3;
}

- (NSString)featureIdentifier
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
  -[PGGraphPersonNode localIdentifier](self, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    -[PGGraphPersonNode localIdentifier](self, "localIdentifier");
  else
    -[PGGraphPersonNode contactIdentifier](self, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)birthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)potentialBirthdayDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (NSDate)anniversaryDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)sex
{
  return self->_sex;
}

- (unint64_t)ageCategory
{
  return self->_ageCategory;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isUserCreated
{
  return self->_isUserCreated;
}

- (NSString)shareParticipantLocalIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipantLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_anniversaryDate, 0);
  objc_storeStrong((id *)&self->_potentialBirthdayDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __46__PGGraphPersonNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "countOfEdgesWithLabel:domain:", CFSTR("BELONGSTO"), 302) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __62__PGGraphPersonNode__contactSuggestionEdgesSortedByConfidence__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __91__PGGraphPersonNode_enumerateContactSuggestionsSortedByConfidenceMatchingQuery_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_contactSuggestionEdge:fitsQuery:"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "targetNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id, uint64_t, uint64_t))(v7 + 16))(v7, v8, v9, a3, a4);

  }
}

uint64_t __56__PGGraphPersonNode_enumerateHomeOrWorkNodesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

void __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E84293F8;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = a3;
  v7 = v5;
  objc_msgSend(v7, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_HOME_WORK"), 202, v8);

}

uint64_t __63__PGGraphPersonNode_enumerateHomeOrWorkAddressNodesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a3 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
  return result;
}

void __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke_2;
  v8[3] = &unk_1E84293A8;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 40);
  v12 = a3;
  v7 = v5;
  objc_msgSend(v7, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("IS_HOME_WORK"), 202, v8);

}

uint64_t __71__PGGraphPersonNode_enumerateHomeOrWorkAddressEdgesAndNodesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
  return result;
}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", 0, 300);
}

+ (MANodeFilter)filterExcludingMe
{
  return (MANodeFilter *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("People"), 300);
}

+ (MANodeFilter)filterIncludingMe
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0D42A50]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("People"), CFSTR("Me"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithLabels:domain:properties:", v3, 300, MEMORY[0x1E0C9AA70]);

  return (MANodeFilter *)v4;
}

+ (MANodeFilter)filterNameNotEmpty
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("name");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &stru_1E8436F28);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v5;
}

+ (MANodeFilter)filterNameEmpty
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("name");
  v7[0] = &stru_1E8436F28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v4;
}

+ (id)filterWithShareParticipantIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("shareparticipant");
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "filterBySettingProperties:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (MANodeFilter)filterShareParticipantIdentifierNotEmpty
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("shareparticipant");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 2, &stru_1E8436F28);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterBySettingProperties:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MANodeFilter *)v5;
}

+ (id)changedPropertyNamesForContactsChange
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("cnid");
  v6[1] = CFSTR("bday");
  v6[2] = CFSTR("pbday");
  v6[3] = CFSTR("anniv");
  v6[4] = CFSTR("sex");
  v6[5] = CFSTR("agecategory");
  v6[6] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (NSArray)personScoreSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("personScore"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (NSArray)personSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("contactIdentifier"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)propertiesWithPerson:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
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
  void *v38;
  __CFString *v40;
  __CFString *v41;
  _QWORD v42[8];
  _QWORD v43[10];

  v43[8] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "fullName");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_1E8436F28;
  v7 = v6;

  objc_msgSend(v3, "localIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (__CFString *)v8;
  else
    v10 = &stru_1E8436F28;
  v11 = v10;

  objc_msgSend(v3, "contactID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = &stru_1E8436F28;
  v15 = v14;

  objc_msgSend(v3, "shareParticipantLocalIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (__CFString *)v16;
  else
    v18 = &stru_1E8436F28;
  v19 = v18;

  v20 = objc_msgSend(v3, "isFavorite");
  v21 = objc_msgSend(v3, "isUserCreated");
  v22 = objc_msgSend(v3, "sex");
  v23 = objc_msgSend(v3, "ageCategory");
  v41 = v7;
  v42[0] = CFSTR("name");
  v43[0] = v7;
  v42[1] = CFSTR("fav");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v24;
  v43[2] = v11;
  v40 = v11;
  v25 = v19;
  v42[2] = CFSTR("id");
  v42[3] = CFSTR("usercreated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v26;
  v43[4] = v15;
  v42[4] = CFSTR("cnid");
  v42[5] = CFSTR("shareparticipant");
  v43[5] = v19;
  v42[6] = CFSTR("sex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v27;
  v42[7] = CFSTR("agecategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "mutableCopy");

  objc_msgSend(v3, "birthdayDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)MEMORY[0x1E0CB37E8];
    +[PGGraphPersonNode _specialDateTimeIntervalForDate:](PGGraphPersonNode, "_specialDateTimeIntervalForDate:", v31);
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v33, CFSTR("bday"));
  }
  else
  {
    objc_msgSend(v3, "potentialBirthdayDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = (void *)MEMORY[0x1E0CB37E8];
      +[PGGraphPersonNode _specialDateTimeIntervalForDate:](PGGraphPersonNode, "_specialDateTimeIntervalForDate:", v33);
      objc_msgSend(v34, "numberWithDouble:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v35, CFSTR("pbday"));

    }
  }

  objc_msgSend(v3, "anniversaryDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)MEMORY[0x1E0CB37E8];
    +[PGGraphPersonNode _specialDateTimeIntervalForDate:](PGGraphPersonNode, "_specialDateTimeIntervalForDate:", v36);
    objc_msgSend(v37, "numberWithDouble:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v38, CFSTR("anniv"));

  }
  return v30;
}

+ (id)propertiesWithBiologicalSex:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("sex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)propertiesWithAgeCategory:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("agecategory");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setName:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  if (a3)
    objc_msgSend(a5, "persistModelProperty:forKey:forNodeWithIdentifier:", a3, CFSTR("name"), a4);
  else
    objc_msgSend(a5, "removeModelPropertyForKey:forNodeWithIdentifier:", CFSTR("name"), a4);
}

+ (void)setBirthdayDateComponents:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  +[PGGraphPersonNode _specialDateForDateComponents:](PGGraphPersonNode, "_specialDateForDateComponents:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNode _specialDateTimeIntervalForDate:](PGGraphPersonNode, "_specialDateTimeIntervalForDate:", v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forNodeWithIdentifier:", v8, CFSTR("bday"), a4);

}

+ (void)setAnniversaryDateComponents:(id)a3 onPersonNodeForIdentifier:(unint64_t)a4 inGraph:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  +[PGGraphPersonNode _specialDateForDateComponents:](PGGraphPersonNode, "_specialDateForDateComponents:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNode _specialDateTimeIntervalForDate:](PGGraphPersonNode, "_specialDateTimeIntervalForDate:", v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistModelProperty:forKey:forNodeWithIdentifier:", v8, CFSTR("anniv"), a4);

}

+ (double)_specialDateTimeIntervalForDate:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a1, "_specialDateComponentsForDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPersonNode _specialDateForDateComponents:](PGGraphPersonNode, "_specialDateForDateComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  return v6;
}

+ (id)_specialDateForDateComponents:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D4B130], "dateFromComponents:inTimeZone:", a3, 0);
}

+ (id)_specialDateComponentsForDate:(id)a3
{
  void *v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "components:fromDate:", 28, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "year") == 1)
      objc_msgSend(v3, "setYear:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (MARelation)partnerOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge partnerFilter](PGGraphRelationshipEdge, "partnerFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredPartnerOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredPartnerFilter](PGGraphRelationshipEdge, "inferredPartnerFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)fatherOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge fatherFilter](PGGraphRelationshipEdge, "fatherFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredFatherOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredFatherFilter](PGGraphRelationshipEdge, "inferredFatherFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)motherOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge motherFilter](PGGraphRelationshipEdge, "motherFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredMotherOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredMotherFilter](PGGraphRelationshipEdge, "inferredMotherFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)brotherOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge brotherFilter](PGGraphRelationshipEdge, "brotherFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredBrotherOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredBrotherFilter](PGGraphRelationshipEdge, "inferredBrotherFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)sisterOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge sisterFilter](PGGraphRelationshipEdge, "sisterFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredSisterOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredSisterFilter](PGGraphRelationshipEdge, "inferredSisterFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)daughterOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge daughterFilter](PGGraphRelationshipEdge, "daughterFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredDaughterOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredDaughterFilter](PGGraphRelationshipEdge, "inferredDaughterFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)sonOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge sonFilter](PGGraphRelationshipEdge, "sonFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredSonOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredSonFilter](PGGraphRelationshipEdge, "inferredSonFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)parentOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge parentFilter](PGGraphRelationshipEdge, "parentFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredParentOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredParentFilter](PGGraphRelationshipEdge, "inferredParentFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)familyOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge familyFilter](PGGraphRelationshipEdge, "familyFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredFamilyOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredFamilyFilter](PGGraphRelationshipEdge, "inferredFamilyFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)familySocialGroupOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge familySocialGroupFilter](PGGraphRelationshipEdge, "familySocialGroupFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredFamilySocialGroupOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredFamilySocialGroupFilter](PGGraphRelationshipEdge, "inferredFamilySocialGroupFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)childOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge childFilter](PGGraphRelationshipEdge, "childFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredChildOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredChildFilter](PGGraphRelationshipEdge, "inferredChildFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)friendOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge friendFilter](PGGraphRelationshipEdge, "friendFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredFriendOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredFriendFilter](PGGraphRelationshipEdge, "inferredFriendFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)coworkerOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge coworkerFilter](PGGraphRelationshipEdge, "coworkerFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredCoworkerOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredCoworkerFilter](PGGraphRelationshipEdge, "inferredCoworkerFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)coworkerSocialGroupOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge coworkerSocialGroupFilter](PGGraphRelationshipEdge, "coworkerSocialGroupFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredCoworkerSocialGroupOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredCoworkerSocialGroupFilter](PGGraphRelationshipEdge, "inferredCoworkerSocialGroupFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)acquaintanceOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge acquaintanceFilter](PGGraphRelationshipEdge, "acquaintanceFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredAcquaintanceOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredAcquaintanceFilter](PGGraphRelationshipEdge, "inferredAcquaintanceFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)vipOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge vipFilter](PGGraphRelationshipEdge, "vipFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)inferredVipOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipEdge inferredVipFilter](PGGraphRelationshipEdge, "inferredVipFilter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyDirectionRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphPersonPresentEdge filter](PGGraphPersonPresentEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentAuthoredByPerson
{
  void *v2;
  void *v3;

  +[PGGraphAuthorEdge filter](PGGraphAuthorEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)momentWithPhysicallyPresentPerson
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphPersonProximityEdge filter](PGGraphPersonProximityEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  +[PGGraphPeoplePersonIsAroundEdge filter](PGGraphPeoplePersonIsAroundEdge, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outRelation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  +[PGGraphPersonPresentEdge filter](PGGraphPersonPresentEdge, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outRelation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  +[PGGraphAuthorEdge filter](PGGraphAuthorEdge, "filter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outRelation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "union:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v12;
}

+ (MARelation)birthdayMomentOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphBirthdayEventEdge filter](PGGraphBirthdayEventEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)anniversaryMomentOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphAnniversaryEventEdge filter](PGGraphAnniversaryEventEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)socialGroupOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphBelongsToEdge filter](PGGraphBelongsToEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)homeOrWorkOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphIsOwnedByEdge filter](PGGraphIsOwnedByEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)homeOfPerson
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "homeOrWorkOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[PGGraphHomeWorkNode homeFilter](PGGraphHomeWorkNode, "homeFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v7;
}

+ (MARelation)workOfPerson
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D42A68];
  objc_msgSend(a1, "homeOrWorkOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[PGGraphHomeWorkNode workFilter](PGGraphHomeWorkNode, "workFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chain:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v7;
}

+ (MARelation)personActivityMeaningOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphPracticesActivityEdge filter](PGGraphPracticesActivityEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (MARelation)relationshipTagOfPerson
{
  void *v2;
  void *v3;

  +[PGGraphRelationshipTagEdge filter](PGGraphRelationshipTagEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

+ (id)relationshipTagOfPersonWithConfidence:(double)a3
{
  void *v3;
  void *v4;

  +[PGGraphRelationshipTagEdge filterWithConfidence:](PGGraphRelationshipTagEdge, "filterWithConfidence:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)filterForAgeCategories:(id)a3 includingMe:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a4)
    +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  else
    +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("agecategory");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filterBySettingProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)filterForBiologicalSex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("sex");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
