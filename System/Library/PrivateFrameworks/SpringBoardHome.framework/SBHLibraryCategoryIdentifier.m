@implementation SBHLibraryCategoryIdentifier

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  result = self->_hash;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategoryIdentifier localizedDisplayName](self, "localizedDisplayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategoryIdentifier localizedDisplayNameKey](self, "localizedDisplayNameKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendUnsignedInteger:", -[SBHLibraryCategoryIdentifier predictionCategoryID](self, "predictionCategoryID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hash = objc_msgSend(v9, "hash");

    return self->_hash;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBHLibraryCategoryIdentifier *v4;
  SBHLibraryCategoryIdentifier *v5;
  BOOL v6;

  v4 = (SBHLibraryCategoryIdentifier *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[SBHLibraryCategoryIdentifier isEqualToCategoryIdentifier:](self, "isEqualToCategoryIdentifier:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToCategoryIdentifier:(id)a3
{
  SBHLibraryCategoryIdentifier *v4;
  SBHLibraryCategoryIdentifier *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (SBHLibraryCategoryIdentifier *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4
         && (v6 = -[SBHLibraryCategoryIdentifier predictionCategoryID](self, "predictionCategoryID"),
             v6 == -[SBHLibraryCategoryIdentifier predictionCategoryID](v5, "predictionCategoryID")))
  {
    -[SBHLibraryCategoryIdentifier localizedDisplayName](self, "localizedDisplayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryCategoryIdentifier localizedDisplayName](v5, "localizedDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)predictionCategoryID
{
  return self->_predictionCategoryID;
}

- (NSString)localizedDisplayName
{
  void *v3;
  NSString *v4;

  if (self->_localizedDisplayNameKey)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", self->_localizedDisplayNameKey, self->_localizedDisplayNameKey, CFSTR("SpringBoard"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = self->_localizedDisplayName;
  }
  return v4;
}

- (NSString)localizedDisplayNameKey
{
  return self->_localizedDisplayNameKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayNameKey, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredictionCategoryID:localizedDisplayNameKey:", self->_predictionCategoryID, self->_localizedDisplayNameKey);
  v4[5] = self->_predictionCategoryIndex;
  v5 = -[NSString copy](self->_localizedDisplayName, "copy");
  v6 = (void *)v4[3];
  v4[3] = v5;

  v7 = -[NSString copy](self->_localizedDisplayNameKey, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  return v4;
}

- (SBHLibraryCategoryIdentifier)initWithPredictionCategoryID:(unint64_t)a3 localizedDisplayNameKey:(id)a4
{
  return -[SBHLibraryCategoryIdentifier initWithPredictionCategoryID:categoryIndex:localizedDisplayName:localizedDisplayNameKey:](self, "initWithPredictionCategoryID:categoryIndex:localizedDisplayName:localizedDisplayNameKey:", a3, -1, 0, a4);
}

- (SBHLibraryCategoryIdentifier)initWithPredictionCategoryID:(unint64_t)a3 categoryIndex:(unint64_t)a4 localizedDisplayName:(id)a5 localizedDisplayNameKey:(id)a6
{
  id v10;
  id v11;
  SBHLibraryCategoryIdentifier *v12;
  SBHLibraryCategoryIdentifier *v13;
  uint64_t v14;
  NSString *localizedDisplayName;
  uint64_t v16;
  NSString *localizedDisplayNameKey;
  objc_super v19;

  v10 = a5;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBHLibraryCategoryIdentifier;
  v12 = -[SBHLibraryCategoryIdentifier init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_predictionCategoryID = a3;
    v12->_predictionCategoryIndex = a4;
    v14 = objc_msgSend(v10, "copy");
    localizedDisplayName = v13->_localizedDisplayName;
    v13->_localizedDisplayName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    localizedDisplayNameKey = v13->_localizedDisplayNameKey;
    v13->_localizedDisplayNameKey = (NSString *)v16;

  }
  return v13;
}

+ (id)categoryWithLocalizedDisplayName:(id)a3 categoryID:(unint64_t)a4 categoryIndex:(int64_t)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPredictionCategoryID:categoryIndex:localizedDisplayName:localizedDisplayNameKey:", a4, a5, v8, 0);

  return v9;
}

- (id)description
{
  return -[SBHLibraryCategoryIdentifier descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[SBHLibraryCategoryIdentifier predictionCategoryIndex](self, "predictionCategoryIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("predictionCategoryIndexNumber"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SBHLibraryCategoryIdentifier predictionCategoryID](self, "predictionCategoryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("predictionCategoryIDNumber"));

  -[SBHLibraryCategoryIdentifier localizedDisplayName](self, "localizedDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("localizedDisplayName"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_localizedDisplayNameKey, CFSTR("localizedDisplayNameKey"));
}

- (SBHLibraryCategoryIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBHLibraryCategoryIdentifier *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionCategoryIDNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionCategoryIndexNumber"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("localizedDisplayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, CFSTR("localizedDisplayNameKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SBHLibraryCategoryIdentifier initWithPredictionCategoryID:categoryIndex:localizedDisplayName:localizedDisplayNameKey:](self, "initWithPredictionCategoryID:categoryIndex:localizedDisplayName:localizedDisplayNameKey:", v6, v8, v10, v12);
  return v13;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHLibraryCategoryIdentifier descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t predictionCategoryIndex;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryIdentifier localizedDisplayName](self, "localizedDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("localizedDisplayName"));

  v6 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_predictionCategoryID, CFSTR("predictionCategoryID"));
  predictionCategoryIndex = self->_predictionCategoryIndex;
  if (predictionCategoryIndex != -1)
    v8 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", predictionCategoryIndex, CFSTR("predictionCategoryIndex"));
  return v4;
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  -[SBHLibraryCategoryIdentifier succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryIdentifier localizedDisplayName](self, "localizedDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("localizedDisplayName"));

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (unint64_t)predictionCategoryIndex
{
  return self->_predictionCategoryIndex;
}

@end
