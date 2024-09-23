@implementation PFStoryConcreteStyle

- (PFStoryConcreteStyle)init
{
  PFStoryConcreteStyle *v2;
  SEL v3;
  id v4;
  id v5;
  int64_t v6;
  id v7;
  BOOL v8;

  v2 = (PFStoryConcreteStyle *)_PFAssertFailHandler();
  return -[PFStoryConcreteStyle initWithIdentifier:originalColorGradeCategory:customColorGradeKind:songAssetIdentifier:isCustomized:](v2, v3, v4, v5, v6, v7, v8);
}

- (PFStoryConcreteStyle)initWithIdentifier:(id)a3 originalColorGradeCategory:(id)a4 customColorGradeKind:(int64_t)a5 songAssetIdentifier:(id)a6 isCustomized:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  PFStoryConcreteStyle *v15;
  NSString *v16;
  void *identifier;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *originalColorGradeCategory;
  uint64_t v22;
  NSString *songAssetIdentifier;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PFStoryConcreteStyle;
  v15 = -[PFStoryConcreteStyle init](&v25, sel_init);
  if (v15)
  {
    if (v12)
    {
      v16 = (NSString *)v12;
      identifier = v15->_identifier;
      v15->_identifier = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v15->_identifier;
      v15->_identifier = (NSString *)v18;

    }
    v20 = objc_msgSend(v13, "copy");
    originalColorGradeCategory = v15->_originalColorGradeCategory;
    v15->_originalColorGradeCategory = (NSString *)v20;

    v15->_customColorGradeKind = a5;
    v22 = objc_msgSend(v14, "copy");
    songAssetIdentifier = v15->_songAssetIdentifier;
    v15->_songAssetIdentifier = (NSString *)v22;

    v15->_isCustomized = a7;
  }

  return v15;
}

- (NSString)diagnosticDescription
{
  PFStoryRecipeArchiver *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  -[PFStoryRecipeArchiver archivedJSONObjectWithStyle:](v3, "archivedJSONObjectWithStyle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "isEqualToStyle:", self);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToStyle:(id)a3
{
  PFStoryConcreteStyle *v4;
  id v5;
  id v6;
  int v7;
  _BOOL4 v8;
  int64_t v9;
  id v10;
  id v11;
  int v12;
  _BOOL4 v13;

  v4 = (PFStoryConcreteStyle *)a3;
  if (self != v4)
  {
    -[PFStoryConcreteStyle originalColorGradeCategory](self, "originalColorGradeCategory");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteStyle originalColorGradeCategory](v4, "originalColorGradeCategory");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {

    }
    else
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      if (!v7)
        goto LABEL_11;
    }
    v9 = -[PFStoryConcreteStyle customColorGradeKind](self, "customColorGradeKind");
    if (v9 != -[PFStoryConcreteStyle customColorGradeKind](v4, "customColorGradeKind"))
    {
LABEL_11:
      LOBYTE(v8) = 0;
LABEL_15:

      goto LABEL_16;
    }
    -[PFStoryConcreteStyle songAssetIdentifier](self, "songAssetIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PFStoryConcreteStyle songAssetIdentifier](v4, "songAssetIdentifier");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
        LOBYTE(v8) = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    v13 = -[PFStoryConcreteStyle isCustomized](self, "isCustomized");
    v8 = v13 ^ -[PFStoryConcreteStyle isCustomized](v4, "isCustomized") ^ 1;
    goto LABEL_14;
  }
  LOBYTE(v8) = 1;
LABEL_16:

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (NSString)songAssetIdentifier
{
  return self->_songAssetIdentifier;
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
