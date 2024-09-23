@implementation PXStoryStyleConfiguration

- (PXStoryStyleConfiguration)init
{
  return -[PXStoryStyleConfiguration initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:](self, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", 0, 0, 0, 0, 0);
}

- (PXStoryStyleConfiguration)initWithOriginalColorGradeCategory:(id)a3 customColorGradeKind:(int64_t)a4 songResource:(id)a5 autoEditDecisionList:(id)a6 isCustomized:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  PXStoryStyleConfiguration *v15;
  uint64_t v16;
  NSString *originalColorGradeCategory;
  objc_super v19;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXStoryStyleConfiguration;
  v15 = -[PXStoryStyleConfiguration init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    originalColorGradeCategory = v15->_originalColorGradeCategory;
    v15->_originalColorGradeCategory = (NSString *)v16;

    v15->_customColorGradeKind = a4;
    objc_storeStrong((id *)&v15->_songResource, a5);
    objc_storeStrong((id *)&v15->_autoEditDecisionList, a6);
    v15->_isCustomized = a7;
  }

  return v15;
}

- (id)copyWithCustomizedColorGradeKind:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = objc_alloc((Class)objc_opt_class());
  -[PXStoryStyleConfiguration originalColorGradeCategory](self, "originalColorGradeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleConfiguration songResource](self, "songResource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleConfiguration autoEditDecisionList](self, "autoEditDecisionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v6, a3, v7, v8, 1);

  return v9;
}

- (id)copyWithCustomizedSongResource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[PXStoryStyleConfiguration originalColorGradeCategory](self, "originalColorGradeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryStyleConfiguration customColorGradeKind](self, "customColorGradeKind");
  -[PXStoryStyleConfiguration autoEditDecisionList](self, "autoEditDecisionList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v6, v7, v4, v8, 1);

  return v9;
}

- (id)copyWithAutoEditDecisionList:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[PXStoryStyleConfiguration originalColorGradeCategory](self, "originalColorGradeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXStoryStyleConfiguration customColorGradeKind](self, "customColorGradeKind");
  -[PXStoryStyleConfiguration songResource](self, "songResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithOriginalColorGradeCategory:customColorGradeKind:songResource:autoEditDecisionList:isCustomized:", v6, v7, v8, v4, -[PXStoryStyleConfiguration isCustomized](self, "isCustomized"));

  return v9;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleConfiguration originalColorGradeCategory](self, "originalColorGradeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleConfiguration customColorGradeKind](self, "customColorGradeKind");
  PFStoryColorGradeKindToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleConfiguration songResource](self, "songResource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryStyleConfiguration autoEditDecisionList](self, "autoEditDecisionList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; colorGradeCategory: %@; colorGradeKind: %@; songResource: %@; EDL:%@>"),
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PXStoryStyleConfiguration *v4;
  PXStoryStyleConfiguration *v5;
  id v6;
  id v7;
  int v8;
  _BOOL4 v9;
  int64_t v10;
  id v11;
  id v12;
  int v13;
  id v14;
  id v15;
  int v16;
  _BOOL4 v17;

  v4 = (PXStoryStyleConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXStoryStyleConfiguration originalColorGradeCategory](self, "originalColorGradeCategory");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryStyleConfiguration originalColorGradeCategory](v5, "originalColorGradeCategory");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v8)
          goto LABEL_13;
      }
      v10 = -[PXStoryStyleConfiguration customColorGradeKind](self, "customColorGradeKind");
      if (v10 != -[PXStoryStyleConfiguration customColorGradeKind](v5, "customColorGradeKind"))
      {
LABEL_13:
        LOBYTE(v9) = 0;
LABEL_22:

        goto LABEL_23;
      }
      -[PXStoryStyleConfiguration songResource](self, "songResource");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryStyleConfiguration songResource](v5, "songResource");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {

      }
      else
      {
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
        {
          LOBYTE(v9) = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      -[PXStoryStyleConfiguration autoEditDecisionList](self, "autoEditDecisionList");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[PXStoryStyleConfiguration autoEditDecisionList](v5, "autoEditDecisionList");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {

      }
      else
      {
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (!v16)
        {
          LOBYTE(v9) = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      v17 = -[PXStoryStyleConfiguration isCustomized](self, "isCustomized");
      v9 = v17 ^ -[PXStoryStyleConfiguration isCustomized](v5, "isCustomized") ^ 1;
      goto LABEL_20;
    }
    LOBYTE(v9) = 0;
  }
LABEL_23:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[PXStoryStyleConfiguration originalColorGradeCategory](self, "originalColorGradeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4 ^ (2 * -[PXStoryStyleConfiguration customColorGradeKind](self, "customColorGradeKind"));
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return self->_autoEditDecisionList;
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
}

@end
