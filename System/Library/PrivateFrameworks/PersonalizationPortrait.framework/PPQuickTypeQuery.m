@implementation PPQuickTypeQuery

- (PPQuickTypeQuery)initWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 options:(unsigned __int8)a8 subFields:(id)a9 label:(id)a10 people:(id)a11 localeIdentifier:(id)a12 bundleIdentifier:(id)a13 recipients:(id)a14 timeoutSeconds:(id)a15
{
  id v16;
  id v17;
  PPQuickTypeQuery *v18;
  PPQuickTypeQuery *v19;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a9;
  v30 = a10;
  v29 = a11;
  v28 = a12;
  v27 = a13;
  v16 = a14;
  v17 = a15;
  v32.receiver = self;
  v32.super_class = (Class)PPQuickTypeQuery;
  v18 = -[PPQuickTypeQuery init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_subtype = a4;
    v18->_semanticTag = a5;
    v18->_fields = a6;
    v18->_time = a7;
    v18->_options = a8;
    objc_storeStrong((id *)&v18->_subFields, a9);
    objc_storeStrong((id *)&v19->_label, a10);
    objc_storeStrong((id *)&v19->_people, a11);
    objc_storeStrong((id *)&v19->_localeIdentifier, a12);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a13);
    objc_storeStrong((id *)&v19->_recipients, a14);
    objc_storeStrong((id *)&v19->_timeoutSeconds, a15);
  }

  return v19;
}

- (PPQuickTypeQuery)init
{
  return -[PPQuickTypeQuery initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:](self, "initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPQuickTypeQuery t:%lu st:%lu sm:%lu f:%lu tm:%lu o:%lu sf:%@ l:%@ p:%@ li:%@ bi:%@ r:%@ to:%@>"), self->_type, self->_subtype, self->_semanticTag, self->_fields, self->_time, self->_options, self->_subFields, self->_label, self->_people, self->_localeIdentifier, self->_bundleIdentifier, self->_recipients, self->_timeoutSeconds);
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;

  v3 = self->_subtype - (unint64_t)self->_type + 32 * self->_type;
  v4 = self->_semanticTag - v3 + 32 * v3;
  v5 = self->_fields - v4 + 32 * v4;
  v6 = self->_time - v5 + 32 * v5;
  v7 = self->_options - v6 + 32 * v6;
  v8 = -[NSArray hash](self->_subFields, "hash") - v7 + 32 * v7;
  v9 = -[NSString hash](self->_label, "hash") - v8 + 32 * v8;
  v10 = -[NSArray hash](self->_people, "hash") - v9 + 32 * v9;
  v11 = -[NSString hash](self->_localeIdentifier, "hash") - v10 + 32 * v10;
  v12 = -[NSString hash](self->_bundleIdentifier, "hash") - v11 + 32 * v11;
  return -[NSArray hash](self->_recipients, "hash") - v12 + 32 * v12;
}

- (PPQuickTypeQuery)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
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
  PPQuickTypeQuery *v17;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  unsigned int v22;
  unsigned __int8 v23;
  void *v24;
  unsigned __int8 v25;
  unsigned __int8 v26;

  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v26 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("typ"));
  v25 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("stp"));
  v23 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("stg"));
  v22 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("fld"));
  v21 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("tim"));
  v6 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("opt"));
  v7 = (void *)MEMORY[0x18D7805AC]();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, v5, 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v24, CFSTR("sfd"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("lab"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x18D7805AC]();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, v5, 0);
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v20, CFSTR("pep"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("lid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v5, CFSTR("bid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x18D7805AC]();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, v5, 0);
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("rec"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tsc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PPQuickTypeQuery initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:](self, "initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:", v26, v25, v23, v22, v21, v6, v19, v8, v10, v11, v12, v15, v16);

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", type, CFSTR("typ"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_subtype, CFSTR("stp"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_semanticTag, CFSTR("stg"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_fields, CFSTR("fld"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_time, CFSTR("tim"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_options, CFSTR("opt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subFields, CFSTR("sfd"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("lab"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_people, CFSTR("pep"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeIdentifier, CFSTR("lid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("rec"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeoutSeconds, CFSTR("tsc"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  objc_opt_class();
  v4 = objc_opt_new();
  v5 = (id *)v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_type;
    *(_BYTE *)(v4 + 9) = self->_subtype;
    *(_BYTE *)(v4 + 10) = self->_semanticTag;
    *(_DWORD *)(v4 + 16) = self->_fields;
    *(_BYTE *)(v4 + 11) = self->_time;
    *(_BYTE *)(v4 + 12) = self->_options;
    objc_storeStrong((id *)(v4 + 24), self->_subFields);
    objc_storeStrong(v5 + 4, self->_label);
    objc_storeStrong(v5 + 5, self->_people);
    objc_storeStrong(v5 + 6, self->_localeIdentifier);
    objc_storeStrong(v5 + 7, self->_bundleIdentifier);
    objc_storeStrong(v5 + 8, self->_recipients);
    objc_storeStrong(v5 + 9, self->_timeoutSeconds);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PPQuickTypeQuery *v4;
  PPQuickTypeQuery *v5;
  BOOL v6;

  v4 = (PPQuickTypeQuery *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPQuickTypeQuery isEqualToQuickTypeQuery:](self, "isEqualToQuickTypeQuery:", v5);

  return v6;
}

- (BOOL)isEqualToQuickTypeQuery:(id)a3
{
  id *v4;
  NSString *bundleIdentifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  NSNumber *v12;
  NSNumber *v13;

  v4 = (id *)a3;
  if (!v4
    || !-[PPQuickTypeQuery isResultEquivelentToQuickTypeQuery:](self, "isResultEquivelentToQuickTypeQuery:", v4)
    || self->_options != *((unsigned __int8 *)v4 + 12))
  {
    goto LABEL_6;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v6 = (NSString *)v4[7];
  if (bundleIdentifier == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleIdentifier;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_6:
      v10 = 0;
      goto LABEL_7;
    }
  }
  v12 = self->_timeoutSeconds;
  v13 = v12;
  if (v12 == v4[9])
    v10 = 1;
  else
    v10 = -[NSNumber isEqual:](v12, "isEqual:");

LABEL_7:
  return v10;
}

- (BOOL)isResultEquivelentToQuickTypeQuery:(id)a3
{
  id *v4;
  id *v5;
  NSArray *subFields;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  NSString *label;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSArray *people;
  NSArray *v17;
  NSArray *v18;
  NSArray *v19;
  char v20;
  NSString *localeIdentifier;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  char v26;
  NSArray *v28;
  NSArray *v29;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4
    || self->_type != *((unsigned __int8 *)v4 + 8)
    || self->_subtype != *((unsigned __int8 *)v4 + 9)
    || self->_semanticTag != *((unsigned __int8 *)v4 + 10)
    || self->_fields != *((_DWORD *)v4 + 4)
    || self->_time != *((unsigned __int8 *)v4 + 11))
  {
    goto LABEL_21;
  }
  subFields = self->_subFields;
  v7 = (NSArray *)v4[3];
  if (subFields == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = subFields;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_21;
  }
  label = self->_label;
  v12 = (NSString *)v5[4];
  if (label == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = label;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_21;
  }
  people = self->_people;
  v17 = (NSArray *)v5[5];
  if (people == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = people;
    v20 = -[NSArray isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_21;
  }
  localeIdentifier = self->_localeIdentifier;
  v22 = (NSString *)v5[6];
  if (localeIdentifier == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = localeIdentifier;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
    {
LABEL_21:
      v26 = 0;
      goto LABEL_22;
    }
  }
  v28 = self->_recipients;
  v29 = v28;
  if (v28 == v5[8])
    v26 = 1;
  else
    v26 = -[NSArray isEqual:](v28, "isEqual:");

LABEL_22:
  return v26;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (unsigned)semanticTag
{
  return self->_semanticTag;
}

- (void)setSemanticTag:(unsigned __int8)a3
{
  self->_semanticTag = a3;
}

- (unsigned)fields
{
  return self->_fields;
}

- (void)setFields:(unsigned int)a3
{
  self->_fields = a3;
}

- (unsigned)time
{
  return self->_time;
}

- (void)setTime:(unsigned __int8)a3
{
  self->_time = a3;
}

- (unsigned)options
{
  return self->_options;
}

- (void)setOptions:(unsigned __int8)a3
{
  self->_options = a3;
}

- (NSArray)subFields
{
  return self->_subFields;
}

- (void)setSubFields:(id)a3
{
  objc_storeStrong((id *)&self->_subFields, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)people
{
  return self->_people;
}

- (void)setPeople:(id)a3
{
  objc_storeStrong((id *)&self->_people, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSNumber)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutSeconds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutSeconds, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_subFields, 0);
}

+ (id)quickTypeQueryFromLMTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  PPQuickTypeQuery *v26;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  PPQuickTypeQuery *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = *MEMORY[0x1E0D433E8];
  v38 = a6;
  v12 = a5;
  v37 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_QWORD *)MEMORY[0x1E0D432C8];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D432C8]);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v13)
  {
    v41[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_4;
    goto LABEL_3;
  }
  v17 = 0;
  if (v15)
  {
LABEL_3:
    v40 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
LABEL_4:
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D433D0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = [PPQuickTypeQuery alloc];
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D43428]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(a1, "_typeFromString:");
  v20 = (uint64_t)v13;
  if (!v13)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D43400]);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v39 = v16;
  v32 = objc_msgSend(a1, "_subtypeFromString:", v20);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("textContentTypeTag"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(a1, "_semanticTagFromString:", v21);
  v29 = objc_msgSend(a1, "_fieldsFromStrings:", v17);
  v36 = v17;
  if (v13)
  {
    v28 = objc_msgSend(a1, "_timeFromString:", v13);
    objc_msgSend(a1, "_subfieldsFromString:", v13);
    v22 = objc_claimAutoreleasedReturnValue();
    v31 = v21;
    v21 = (void *)v22;
  }
  else
  {
    v28 = 0;
    v22 = 0;
    v31 = (void *)v20;
  }
  objc_msgSend(v10, "objectForKeyedSubscript:", *v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelFromLMFieldString:qualifiers:", v23, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_peopleNamesFromLMQualifiers:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[PPQuickTypeQuery initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:](v34, "initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:", v33, v32, v30, v29, v28, 0, v22, v24, v25, v37, v38, v12, &unk_1E2284580);

  return v26;
}

+ (id)quickTypeQueryWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 subFields:(id)a8 label:(id)a9 people:(id)a10 localeIdentifier:(id)a11 bundleIdentifier:(id)a12 recipients:(id)a13
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PPQuickTypeQuery *v23;
  unsigned int v26;

  v26 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = a13;
  v18 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = -[PPQuickTypeQuery initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:]([PPQuickTypeQuery alloc], "initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:", v16, v15, v14, a6, v26, 0, v22, v21, v20, v19, v18, v17, 0);

  return v23;
}

+ (id)quickTypeQueryWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 options:(unsigned __int8)a8 subFields:(id)a9 label:(id)a10 people:(id)a11 localeIdentifier:(id)a12 bundleIdentifier:(id)a13 recipients:(id)a14
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PPQuickTypeQuery *v23;
  unsigned int v26;
  unsigned int v27;

  v26 = a7;
  v27 = a8;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = a14;
  v18 = a13;
  v19 = a12;
  v20 = a11;
  v21 = a10;
  v22 = a9;
  v23 = -[PPQuickTypeQuery initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:]([PPQuickTypeQuery alloc], "initWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:timeoutSeconds:", v16, v15, v14, a6, v26, v27, v22, v21, v20, v19, v18, v17, 0);

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unsigned)_typeFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int8 v6;

  v3 = _typeFromString__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_typeFromString__once, &__block_literal_global_139);
  objc_msgSend((id)_typeFromString__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

+ (unsigned)_subtypeFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int8 v6;

  v3 = _subtypeFromString__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_subtypeFromString__once, &__block_literal_global_84);
  objc_msgSend((id)_subtypeFromString__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

+ (unsigned)_semanticTagFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int8 v6;

  v3 = _semanticTagFromString__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_semanticTagFromString__once, &__block_literal_global_92);
  objc_msgSend((id)_semanticTagFromString__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

+ (unsigned)_fieldsFromStrings:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_fieldsFromStrings__once != -1)
    dispatch_once(&_fieldsFromStrings__once, &__block_literal_global_100);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend((id)_fieldsFromStrings__map, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v7 |= objc_msgSend(v10, "unsignedIntValue");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (unsigned)_timeFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  unsigned __int8 v6;

  v3 = _timeFromString__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_timeFromString__once, &__block_literal_global_121);
  objc_msgSend((id)_timeFromString__map, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntValue");
  return v6;
}

+ (id)_subfieldsFromString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_subfieldsFromString__once != -1)
    dispatch_once(&_subfieldsFromString__once, &__block_literal_global_122);
  objc_msgSend((id)_subfieldsFromString__map, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_labelFromLMFieldString:(id)a3 qualifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (_labelFromLMFieldString_qualifiers__once != -1)
    dispatch_once(&_labelFromLMFieldString_qualifiers__once, &__block_literal_global_123);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D43380]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend((id)_labelFromLMFieldString_qualifiers__map, "objectForKeyedSubscript:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)_peopleNamesFromLMQualifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D43330]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D43340]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
LABEL_12:
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D43410]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v29 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v13 = 0;
            v9 = 0;
            if (!v10)
            {
LABEL_31:

              goto LABEL_32;
            }
            goto LABEL_29;
          }
          v12 = v11;
        }
        v13 = v12;
        if (v10 && v12)
        {
          v26 = v11;
          v27 = v7;
          v28 = v3;
          v14 = objc_msgSend(v12, "count");
          v15 = objc_msgSend(v10, "count");
          if (v14 >= v15)
            v16 = v15;
          else
            v16 = v14;
          v17 = v4;
          if (v16)
          {
            for (i = 0; i != v16; ++i)
            {
              v19 = (void *)MEMORY[0x18D7805AC]();
              objc_msgSend(v10, "objectAtIndexedSubscript:", i);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "stringByAppendingString:", CFSTR(" "));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", i);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "stringByAppendingString:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v23);

              objc_autoreleasePoolPop(v19);
            }
          }
          v9 = v17;
          v5 = 0;
          v3 = v28;
          v4 = v17;
          v11 = v26;
          v7 = v27;
          goto LABEL_31;
        }
        if (!v10)
        {
          if (!v12)
          {
            v9 = 0;
            goto LABEL_31;
          }
          v24 = v12;
          v13 = v24;
          goto LABEL_30;
        }
LABEL_29:
        v24 = v10;
LABEL_30:
        v9 = v24;
        goto LABEL_31;
      }
      v8 = v7;
    }
    v10 = v8;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
  }
  else
  {
    v31[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;
LABEL_32:

  return v9;
}

void __55__PPQuickTypeQuery__labelFromLMFieldString_qualifiers___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C97028];
  v1 = *MEMORY[0x1E0D43360];
  v10[0] = *MEMORY[0x1E0D43388];
  v10[1] = v1;
  v2 = *MEMORY[0x1E0C96FF8];
  v11[0] = v0;
  v11[1] = v2;
  v3 = *MEMORY[0x1E0C97070];
  v4 = *MEMORY[0x1E0D43318];
  v10[2] = *MEMORY[0x1E0D43448];
  v10[3] = v4;
  v5 = *MEMORY[0x1E0C97010];
  v11[2] = v3;
  v11[3] = v5;
  v6 = *MEMORY[0x1E0D43438];
  v10[4] = *MEMORY[0x1E0D43350];
  v10[5] = v6;
  v11[4] = v2;
  v11[5] = v3;
  v7 = *MEMORY[0x1E0D43440];
  v10[6] = *MEMORY[0x1E0D43358];
  v10[7] = v7;
  v11[6] = v2;
  v11[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)_labelFromLMFieldString_qualifiers__map;
  _labelFromLMFieldString_qualifiers__map = v8;

}

void __41__PPQuickTypeQuery__subfieldsFromString___block_invoke()
{
  void *v0;

  v0 = (void *)_subfieldsFromString__map;
  _subfieldsFromString__map = MEMORY[0x1E0C9AA70];

}

void __36__PPQuickTypeQuery__timeFromString___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D433B0];
  v5[0] = *MEMORY[0x1E0D433A8];
  v5[1] = v0;
  v6[0] = &unk_1E22845B0;
  v6[1] = &unk_1E22845B0;
  v1 = *MEMORY[0x1E0D43368];
  v5[2] = *MEMORY[0x1E0D432D8];
  v5[3] = v1;
  v6[2] = &unk_1E22845B0;
  v6[3] = &unk_1E22845C8;
  v2 = *MEMORY[0x1E0D43370];
  v5[4] = *MEMORY[0x1E0D43420];
  v5[5] = v2;
  v6[4] = &unk_1E22845B0;
  v6[5] = &unk_1E22845B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_timeFromString__map;
  _timeFromString__map = v3;

}

void __39__PPQuickTypeQuery__fieldsFromStrings___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[28];
  _QWORD v17[29];

  v17[28] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D43388];
  v16[0] = *MEMORY[0x1E0D433C0];
  v16[1] = v0;
  v17[0] = &unk_1E2284778;
  v17[1] = &unk_1E2284778;
  v1 = *MEMORY[0x1E0D43448];
  v16[2] = *MEMORY[0x1E0D43360];
  v16[3] = v1;
  v17[2] = &unk_1E2284778;
  v17[3] = &unk_1E2284778;
  v2 = *MEMORY[0x1E0D432F8];
  v16[4] = *MEMORY[0x1E0D43318];
  v16[5] = v2;
  v17[4] = &unk_1E2284778;
  v17[5] = &unk_1E2284790;
  v3 = *MEMORY[0x1E0D43350];
  v16[6] = *MEMORY[0x1E0D432A8];
  v16[7] = v3;
  v17[6] = &unk_1E22847A8;
  v17[7] = &unk_1E22847A8;
  v4 = *MEMORY[0x1E0D43338];
  v16[8] = *MEMORY[0x1E0D43438];
  v16[9] = v4;
  v17[8] = &unk_1E22847A8;
  v17[9] = &unk_1E22847F0;
  v5 = *MEMORY[0x1E0D43328];
  v16[10] = *MEMORY[0x1E0D43408];
  v16[11] = v5;
  v17[10] = &unk_1E2284808;
  v17[11] = &unk_1E2284820;
  v6 = *MEMORY[0x1E0D43440];
  v16[12] = *MEMORY[0x1E0D43358];
  v16[13] = v6;
  v17[12] = &unk_1E22847C0;
  v17[13] = &unk_1E22847C0;
  v7 = *MEMORY[0x1E0D432B8];
  v16[14] = *MEMORY[0x1E0D433C8];
  v16[15] = v7;
  v17[14] = &unk_1E22847D8;
  v17[15] = &unk_1E2284838;
  v8 = *MEMORY[0x1E0D433A8];
  v16[16] = *MEMORY[0x1E0D432B0];
  v16[17] = v8;
  v17[16] = &unk_1E2284850;
  v17[17] = &unk_1E2284880;
  v9 = *MEMORY[0x1E0D432D8];
  v16[18] = *MEMORY[0x1E0D433B0];
  v16[19] = v9;
  v17[18] = &unk_1E22848B0;
  v17[19] = &unk_1E22848C8;
  v10 = *MEMORY[0x1E0D43420];
  v16[20] = *MEMORY[0x1E0D43368];
  v16[21] = v10;
  v17[20] = &unk_1E22848B0;
  v17[21] = &unk_1E22848B0;
  v11 = *MEMORY[0x1E0D433F8];
  v16[22] = *MEMORY[0x1E0D43370];
  v16[23] = v11;
  v17[22] = &unk_1E2284898;
  v17[23] = &unk_1E2284868;
  v12 = *MEMORY[0x1E0D432F0];
  v16[24] = *MEMORY[0x1E0D432E8];
  v16[25] = v12;
  v17[24] = &unk_1E22848F8;
  v17[25] = &unk_1E22848E0;
  v13 = *MEMORY[0x1E0D432A0];
  v16[26] = *MEMORY[0x1E0D432E0];
  v16[27] = v13;
  v17[26] = &unk_1E2284910;
  v17[27] = &unk_1E2284928;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 28);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)_fieldsFromStrings__map;
  _fieldsFromStrings__map = v14;

}

void __43__PPQuickTypeQuery__semanticTagFromString___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[22];
  _QWORD v3[23];

  v3[22] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("name");
  v2[1] = CFSTR("honorifix-prefix");
  v3[0] = &unk_1E22846A0;
  v3[1] = &unk_1E22846E8;
  v2[2] = CFSTR("given-name");
  v2[3] = CFSTR("additional-name");
  v3[2] = &unk_1E22846D0;
  v3[3] = &unk_1E2284760;
  v2[4] = CFSTR("family-name");
  v2[5] = CFSTR("nickname");
  v3[4] = &unk_1E22846B8;
  v3[5] = &unk_1E2284760;
  v2[6] = CFSTR("honorifix-suffix");
  v2[7] = CFSTR("organization-title");
  v3[6] = &unk_1E2284700;
  v3[7] = &unk_1E2284760;
  v2[8] = CFSTR("organization");
  v2[9] = CFSTR("location");
  v3[8] = &unk_1E22845C8;
  v3[9] = &unk_1E22845E0;
  v2[10] = CFSTR("street-address");
  v2[11] = CFSTR("address-line1");
  v3[10] = &unk_1E22845B0;
  v3[11] = &unk_1E22845F8;
  v2[12] = CFSTR("address-line2");
  v2[13] = CFSTR("address-level2");
  v3[12] = &unk_1E2284760;
  v3[13] = &unk_1E2284610;
  v2[14] = CFSTR("address-level1+2");
  v2[15] = CFSTR("address-level1");
  v3[14] = &unk_1E2284670;
  v3[15] = &unk_1E2284640;
  v2[16] = CFSTR("address-level3");
  v2[17] = CFSTR("country-name");
  v3[16] = &unk_1E2284688;
  v3[17] = &unk_1E2284658;
  v2[18] = CFSTR("postal-code");
  v2[19] = CFSTR("tel");
  v3[18] = &unk_1E2284628;
  v3[19] = &unk_1E2284730;
  v2[20] = CFSTR("email");
  v2[21] = CFSTR("url");
  v3[20] = &unk_1E2284718;
  v3[21] = &unk_1E2284748;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 22);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_semanticTagFromString__map;
  _semanticTagFromString__map = v0;

}

void __39__PPQuickTypeQuery__subtypeFromString___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[18];
  _QWORD v12[19];

  v12[18] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D433F0];
  v11[0] = *MEMORY[0x1E0D43320];
  v11[1] = v0;
  v12[0] = &unk_1E22845B0;
  v12[1] = &unk_1E22845C8;
  v1 = *MEMORY[0x1E0D433A8];
  v11[2] = *MEMORY[0x1E0D43418];
  v11[3] = v1;
  v12[2] = &unk_1E22845C8;
  v12[3] = &unk_1E22845E0;
  v2 = *MEMORY[0x1E0D43370];
  v11[4] = *MEMORY[0x1E0D43420];
  v11[5] = v2;
  v12[4] = &unk_1E22845E0;
  v12[5] = &unk_1E22845E0;
  v3 = *MEMORY[0x1E0D432D8];
  v11[6] = *MEMORY[0x1E0D433B0];
  v11[7] = v3;
  v12[6] = &unk_1E22845F8;
  v12[7] = &unk_1E22845F8;
  v4 = *MEMORY[0x1E0D433E0];
  v11[8] = *MEMORY[0x1E0D43368];
  v11[9] = v4;
  v12[8] = &unk_1E22845F8;
  v12[9] = &unk_1E2284628;
  v5 = *MEMORY[0x1E0D432E8];
  v11[10] = *MEMORY[0x1E0D433D8];
  v11[11] = v5;
  v12[10] = &unk_1E2284640;
  v12[11] = &unk_1E2284658;
  v6 = *MEMORY[0x1E0D432F0];
  v11[12] = *MEMORY[0x1E0D432E0];
  v11[13] = v6;
  v12[12] = &unk_1E2284658;
  v12[13] = &unk_1E2284658;
  v7 = *MEMORY[0x1E0D43390];
  v11[14] = *MEMORY[0x1E0D432D0];
  v11[15] = v7;
  v12[14] = &unk_1E2284670;
  v12[15] = &unk_1E2284688;
  v8 = *MEMORY[0x1E0D43310];
  v11[16] = *MEMORY[0x1E0D43398];
  v11[17] = v8;
  v12[16] = &unk_1E22846A0;
  v12[17] = &unk_1E22846B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 18);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_subtypeFromString__map;
  _subtypeFromString__map = v9;

}

void __36__PPQuickTypeQuery__typeFromString___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D43300];
  v4[0] = *MEMORY[0x1E0D433B8];
  v4[1] = v0;
  v5[0] = &unk_1E22845B0;
  v5[1] = &unk_1E22845C8;
  v1 = *MEMORY[0x1E0D433A0];
  v4[2] = *MEMORY[0x1E0D43378];
  v4[3] = v1;
  v5[2] = &unk_1E22845E0;
  v5[3] = &unk_1E22845F8;
  v4[4] = *MEMORY[0x1E0D43430];
  v5[4] = &unk_1E2284610;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_typeFromString__map;
  _typeFromString__map = v2;

}

@end
