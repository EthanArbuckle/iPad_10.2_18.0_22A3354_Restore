@implementation PAAccess

- (unint64_t)hashWithOptions:(unint64_t)a3
{
  char v3;
  unint64_t v5;
  void *v7;

  v3 = a3;
  v5 = -[PAApplication hash](self->_accessor, "hash");
  if ((v3 & 1) != 0)
  {
    if ((v3 & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v5 = -[NSUUID hash](self->_identifier, "hash") - v5 + 32 * v5;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      if ((v3 & 4) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v5 = self->_kind - v5 + 32 * v5;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    if ((v3 & 8) != 0)
      goto LABEL_5;
LABEL_11:
    v5 = -[NSSet hash](self->_assetIdentifiers, "hash") - v5 + 32 * v5;
    if ((v3 & 0x10) != 0)
      return v5;
    return self->_visibilityState - v5 + 32 * v5;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampAdjustment);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "hash") - v5 + 32 * v5;

  if ((v3 & 8) == 0)
    goto LABEL_11;
LABEL_5:
  if ((v3 & 0x10) == 0)
    return self->_visibilityState - v5 + 32 * v5;
  return v5;
}

- (int64_t)kind
{
  return self->_kind;
}

- (id)copyWithNewIdentifier:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  v6 = -[PAAccess copy](self, "copy");
  v7 = (void *)v6;
  if (v6)
    objc_storeStrong((id *)(v6 + 24), a3);

  return v7;
}

- (id)asIntervalEndEventWithTimestampAdjustment:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = -[PAAccess copy](self, "copy");
  *(_QWORD *)(v4 + 32) = 3;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v5;

  *(double *)(v4 + 48) = a3;
  return (id)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_accessor, 0);
}

- (PAAccess)initWithAccessor:(id)a3 assetIdentifiers:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  PAAccess *v10;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PAAccess initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:](self, "initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:", v8, v9, 1, v7, 0, 0, 0);

  return v10;
}

- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 assetIdentifiers:(id)a6 visibilityState:(int64_t)a7 accessEventCount:(unint64_t)a8 accessCount:(unint64_t)a9
{
  id v16;
  id v17;
  id v18;
  PAAccess *v19;
  PAAccess *v20;
  void *v21;
  void *v22;
  NSSet *v23;
  NSSet *assetIdentifiers;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PAAccess;
  v19 = -[PAAccess init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accessor, a3);
    objc_storeStrong((id *)&v20->_identifier, a4);
    v20->_kind = a5;
    v20->_timestampAdjustment = 0.0;
    v20->_visibilityState = a7;
    v21 = (void *)objc_msgSend(v18, "copy");
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    assetIdentifiers = v20->_assetIdentifiers;
    v20->_assetIdentifiers = v23;

    v20->_accessCount = a9;
    v20->_eventCount = a8;
  }

  return v20;
}

- (NSSet)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (id)JSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("access");
  v10[0] = CFSTR("type");
  v10[1] = CFSTR("accessor");
  -[PAApplication JSONObject](self->_accessor, "JSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("category");
  -[PAAccess descriptionForCategory](self, "descriptionForCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("identifier");
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  v10[4] = CFSTR("kind");
  -[PAAccess descriptionForKind](self, "descriptionForKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  v10[5] = CFSTR("accessCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PAAccess accessCount](self, "accessCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForKind
{
  unint64_t v2;

  v2 = self->_kind - 1;
  if (v2 > 3)
    return CFSTR("unknown");
  else
    return off_1E4FA4D70[v2];
}

- (unint64_t)accessCount
{
  return self->_accessCount;
}

- (id)asIntervalEventWithAssetIdentifiers:(id)a3 visibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5
{
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = (_QWORD *)-[PAAccess copy](self, "copy");
  v9[4] = 4;
  v10 = (void *)objc_msgSend(v8, "copy");

  if (v10)
  {
    v11 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9[5];
  v9[5] = v11;

  v9[1] = a4;
  v9[8] = a5;
  return v9;
}

- (id)asIntervalBeginEvent
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)-[PAAccess copy](self, "copy");
  v2[4] = 2;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[5];
  v2[5] = v3;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = -[PAApplication copyWithZone:](self->_accessor, "copyWithZone:", a3);
  v7 = (void *)-[NSUUID copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:", v6, v7, self->_kind, self->_assetIdentifiers, self->_visibilityState, self->_eventCount, self->_accessCount);

  return v8;
}

- (unint64_t)hash
{
  return -[PAAccess hashWithOptions:](self, "hashWithOptions:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  PAApplication *accessor;
  id v5;

  accessor = self->_accessor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessor, CFSTR("accessor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assetIdentifiers, CFSTR("assetIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_visibilityState, CFSTR("visibilityState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventCount, CFSTR("eventCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_accessCount, CFSTR("accessCount"));

}

- (id)copyWithNewAccessor:(id)a3
{
  PAApplication *v5;
  PAApplication *accessor;
  PAAccess *v7;
  uint64_t v8;

  v5 = (PAApplication *)a3;
  accessor = self->_accessor;
  if (accessor == v5 || -[PAApplication isEqual:](accessor, "isEqual:", v5))
  {
    v7 = self;
  }
  else
  {
    v8 = -[PAAccess copy](self, "copy");
    v7 = (PAAccess *)v8;
    if (v8)
      objc_storeStrong((id *)(v8 + 16), a3);
  }

  return v7;
}

- (BOOL)isEqualToAccess:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  PAAccess *v6;
  PAApplication *accessor;
  void *v8;
  NSUUID *identifier;
  void *v10;
  int64_t kind;
  double timestampAdjustment;
  double v13;
  NSSet *assetIdentifiers;
  uint64_t v15;
  void *v16;
  NSSet *v17;
  void *v18;
  int64_t visibilityState;
  BOOL v20;

  v4 = a4;
  v6 = (PAAccess *)a3;
  if (v6 != self)
  {
    if (!-[PAAccess isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
      goto LABEL_18;
    accessor = self->_accessor;
    -[PAAccess accessor](v6, "accessor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(accessor) = -[PAApplication isEqual:](accessor, "isEqual:", v8);

    if (!(_DWORD)accessor)
      goto LABEL_18;
    if ((v4 & 1) == 0)
    {
      identifier = self->_identifier;
      -[PAAccess identifier](v6, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(identifier) = -[NSUUID isEqual:](identifier, "isEqual:", v10);

      if (!(_DWORD)identifier)
        goto LABEL_18;
    }
    if ((v4 & 2) == 0)
    {
      kind = self->_kind;
      if (kind != -[PAAccess kind](v6, "kind"))
        goto LABEL_18;
    }
    if ((v4 & 4) == 0)
    {
      timestampAdjustment = self->_timestampAdjustment;
      -[PAAccess timestampAdjustment](v6, "timestampAdjustment");
      if (timestampAdjustment != v13)
        goto LABEL_18;
    }
    if ((v4 & 8) == 0)
    {
      assetIdentifiers = self->_assetIdentifiers;
      -[PAAccess assetIdentifiers](v6, "assetIdentifiers");
      v15 = objc_claimAutoreleasedReturnValue();
      if (assetIdentifiers == (NSSet *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        v17 = self->_assetIdentifiers;
        -[PAAccess assetIdentifiers](v6, "assetIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v17) = -[NSSet isEqual:](v17, "isEqual:", v18);

        if (!(_DWORD)v17)
        {
LABEL_18:
          v20 = 0;
          goto LABEL_19;
        }
      }
    }
    if ((v4 & 0x10) == 0)
    {
      visibilityState = self->_visibilityState;
      if (visibilityState != -[PAAccess visibilityState](v6, "visibilityState"))
        goto LABEL_18;
    }
  }
  v20 = 1;
LABEL_19:

  return v20;
}

- (PAApplication)accessor
{
  return self->_accessor;
}

- (PAAccess)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PAAccess *v13;

  v4 = initWithCoder__once;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&initWithCoder__once, &__block_literal_global_1);
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("kind"));
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", initWithCoder__allowedIdentifierClasses, CFSTR("assetIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("visibilityState"));
  v11 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("eventCount"));
  v12 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("accessCount"));

  v13 = -[PAAccess initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:](self, "initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:", v6, v7, v8, v9, v10, v11, v12);
  return v13;
}

+ (NSArray)allAccessClasses
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)eventStreamIdentifier
{
  return (NSString *)CFSTR("com.apple.privacy.accounting.stream");
}

- (PAAccess)initWithAccessor:(id)a3
{
  return -[PAAccess initWithAccessor:assetIdentifiers:](self, "initWithAccessor:assetIdentifiers:", a3, 0);
}

- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5
{
  return -[PAAccess initWithAccessor:identifier:kind:assetIdentifiers:](self, "initWithAccessor:identifier:kind:assetIdentifiers:", a3, a4, a5, 0);
}

- (PAAccess)initWithAccessor:(id)a3 identifier:(id)a4 kind:(int64_t)a5 assetIdentifiers:(id)a6
{
  return -[PAAccess initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:](self, "initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:", a3, a4, a5, a6, 0, 0, 0);
}

- (id)copyWithNewKind:(int64_t)a3
{
  id result;

  result = (id)-[PAAccess copy](self, "copy");
  if (result)
    *((_QWORD *)result + 4) = a3;
  return result;
}

- (id)copyWithNewAssetIdentifiers:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = (_QWORD *)-[PAAccess copy](self, "copy");
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "copy");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v5[5];
    v5[5] = v8;

  }
  return v5;
}

- (BOOL)supportsSameMinuteAccessCountLogging
{
  void *v3;
  char v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  -[PAAccess category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("contacts"));

  return v4;
}

- (NSString)category
{
  return (NSString *)CFSTR("unknown");
}

- (NSString)descriptionForCategory
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[PAAccess category](self, "category");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("unknown");
  v4 = v2;

  return v4;
}

- (id)copyWithNewTimestampAdjustment:(double)a3
{
  id result;

  result = (id)-[PAAccess copy](self, "copy");
  if (result)
    *((double *)result + 6) = a3;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  PAApplication *accessor;
  NSUUID *identifier;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  accessor = self->_accessor;
  identifier = self->_identifier;
  -[PAAccess descriptionForKind](self, "descriptionForKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampAdjustment);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> accessor:<%@> identifier:%@ kind:%@ timestampAdjustment:%@ visibilityState:%lu assetIdentifierCount:%lu accessCount:%lu"), v4, self, accessor, identifier, v7, v8, self->_visibilityState, -[NSSet count](self->_assetIdentifiers, "count"), self->_accessCount);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  return -[PAAccess isEqualToAccess:withOptions:](self, "isEqualToAccess:withOptions:", a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __26__PAAccess_initWithCoder___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithCoder__allowedIdentifierClasses;
  initWithCoder__allowedIdentifierClasses = v2;

}

- (unsigned)dataVersion
{
  return 3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  void *v4;
  id v6;

  if (a4 >= 3)
  {
    v6 = a3;
    v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[PAAccess JSONObject](self, "JSONObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[PAAccess proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PAAccess)initWithProto:(id)a3
{
  id v4;
  id v5;
  PAApplication *v6;
  void *v7;
  PAApplication *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PAAccess *v20;
  double v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = [PAApplication alloc];
    objc_msgSend(v5, "accessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PAApplication initWithProto:](v6, "initWithProto:", v7);

    if (v8
      && (objc_msgSend(v5, "identifier"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "length"),
          v9,
          v10 == 16))
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v5, "identifier");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (void *)objc_msgSend(v11, "initWithUUIDBytes:", objc_msgSend(v12, "bytes"));

      if (v13 && (v14 = objc_msgSend(v5, "kind") - 1, v14 <= 3))
      {
        v15 = v14 + 1;
        objc_msgSend(v5, "assetIdentifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0C99E60];
        if (v16)
        {
          objc_msgSend(v5, "assetIdentifiers");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setWithArray:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }

        self = -[PAAccess initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:](self, "initWithAccessor:identifier:kind:assetIdentifiers:visibilityState:accessEventCount:accessCount:", v8, v13, v15, v19, 0, 0, 0);
        if (self)
        {
          objc_msgSend(v5, "timestampAdjustment");
          self->_timestampAdjustment = v21;
          self->_accessCount = (int)objc_msgSend(v5, "accessCount");
        }

        v20 = self;
      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (PAAccess)initWithProtoData:(id)a3
{
  id v4;
  PAPBAccess *v5;
  PAAccess *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[PAPBAccess initWithData:]([PAPBAccess alloc], "initWithData:", v4);

    v6 = -[PAAccess initWithProto:](self, "initWithProto:", v5);
    self = v6;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PAApplication proto](self->_accessor, "proto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessor:", v4);

  v11[0] = 0;
  v11[1] = 0;
  -[NSUUID getUUIDBytes:](self->_identifier, "getUUIDBytes:", v11);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v11, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v5);

  v6 = 0;
  if ((unint64_t)(self->_kind - 1) <= 3)
  {
    objc_msgSend(v3, "setKind:", LODWORD(self->_kind));
    if (self->_timestampAdjustment != 0.0)
      objc_msgSend(v3, "setTimestampAdjustment:");
    if (self->_accessCount)
      objc_msgSend(v3, "setAccessCount:");
    -[PAAccess assetIdentifiers](self, "assetIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v3, "setAssetIdentifiers:", v9);

    v6 = v3;
  }

  return v6;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)timestampAdjustment
{
  return self->_timestampAdjustment;
}

- (void)setAccessCount:(unint64_t)a3
{
  self->_accessCount = a3;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

@end
