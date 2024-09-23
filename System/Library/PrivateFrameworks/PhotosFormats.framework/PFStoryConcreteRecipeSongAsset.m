@implementation PFStoryConcreteRecipeSongAsset

- (PFStoryConcreteRecipeSongAsset)initWithIdentifier:(id)a3 category:(int64_t)a4 subcategory:(int64_t)a5 catalog:(id)a6 songID:(id)a7 title:(id)a8 subtitle:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  PFStoryConcreteRecipeSongAsset *v22;
  uint64_t v23;
  NSString *songID;
  uint64_t v25;
  NSString *catalog;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *subtitle;
  NSString *colorGradeCategory;
  objc_super v33;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a3;
  +[PFStoryConcreteRecipeSongAsset URLWithCatalog:songID:](PFStoryConcreteRecipeSongAsset, "URLWithCatalog:songID:", v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v21 = v19;
  else
    v21 = v16;
  v33.receiver = self;
  v33.super_class = (Class)PFStoryConcreteRecipeSongAsset;
  v22 = -[PFStoryConcreteRecipeAsset initWithIdentifier:kind:url:](&v33, sel_initWithIdentifier_kind_url_, v21, 2, v20);

  if (v22)
  {
    v22->_category = a4;
    v22->_subcategory = a5;
    v23 = objc_msgSend(v16, "copy");
    songID = v22->_songID;
    v22->_songID = (NSString *)v23;

    v25 = objc_msgSend(v15, "copy");
    catalog = v22->_catalog;
    v22->_catalog = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    title = v22->_title;
    v22->_title = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    subtitle = v22->_subtitle;
    v22->_subtitle = (NSString *)v29;

    colorGradeCategory = v22->_colorGradeCategory;
    v22->_colorGradeCategory = 0;

  }
  return v22;
}

- (PFStoryConcreteRecipeSongAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5
{
  id v6;
  id v7;
  PFStoryConcreteRecipeSongAsset *v8;
  SEL v9;
  id v10;

  v6 = a3;
  v7 = a5;
  v8 = (PFStoryConcreteRecipeSongAsset *)_PFAssertFailHandler();
  return (PFStoryConcreteRecipeSongAsset *)-[PFStoryConcreteRecipeSongAsset isEqualToAsset:](v8, v9, v10);
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  id v7;
  id v8;
  int v9;
  char v10;
  id v12;
  id v13;
  int v14;
  id v15;
  id v16;
  int v17;
  id v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PFStoryConcreteRecipeSongAsset;
  if (-[PFStoryConcreteRecipeAsset isEqualToAsset:](&v25, sel_isEqualToAsset_, v4))
  {
    v5 = -[PFStoryConcreteRecipeSongAsset category](self, "category");
    if (v5 == objc_msgSend(v4, "category"))
    {
      v6 = -[PFStoryConcreteRecipeSongAsset subcategory](self, "subcategory");
      if (v6 == objc_msgSend(v4, "subcategory"))
      {
        -[PFStoryConcreteRecipeSongAsset songID](self, "songID");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "songID");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {

        }
        else
        {
          v9 = objc_msgSend(v7, "isEqual:", v8);

          if (!v9)
          {
            v10 = 0;
LABEL_29:

            goto LABEL_8;
          }
        }
        -[PFStoryConcreteRecipeSongAsset catalog](self, "catalog");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "catalog");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v12 == v13)
        {

        }
        else
        {
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (!v14)
          {
            v10 = 0;
LABEL_28:

            goto LABEL_29;
          }
        }
        -[PFStoryConcreteRecipeSongAsset title](self, "title");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "title");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {

        }
        else
        {
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (!v17)
          {
            v10 = 0;
LABEL_27:

            goto LABEL_28;
          }
        }
        -[PFStoryConcreteRecipeSongAsset subtitle](self, "subtitle");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "subtitle");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v24 = v18;
        if (v18 == v19)
        {

        }
        else
        {
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (!v20)
          {
            v10 = 0;
LABEL_26:

            goto LABEL_27;
          }
        }
        -[PFStoryConcreteRecipeSongAsset colorGradeCategory](self, "colorGradeCategory", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "colorGradeCategory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 == v22)
          v10 = 1;
        else
          v10 = objc_msgSend(v21, "isEqual:", v22);

        v15 = v23;
        goto LABEL_26;
      }
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
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
  unint64_t v11;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipeSongAsset catalog](self, "catalog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipeSongAsset songID](self, "songID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipeSongAsset title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipeSongAsset subtitle](self, "subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryConcreteRecipeSongAsset colorGradeCategory](self, "colorGradeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PFStoryConcreteRecipeSongAsset category](self, "category");
  if (v11 > 2)
    v12 = CFSTR("??");
  else
    v12 = off_1E45A3A30[v11];
  v13 = -[PFStoryConcreteRecipeSongAsset subcategory](self, "subcategory");
  if (v13 > 5)
    v14 = CFSTR("??");
  else
    v14 = off_1E45A3A48[v13];
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; catalog: %@; identifier: %@; title: %@; subtitle: %@; colorGrade: %@; category: %@; subcategory: %@>"),
                  v5,
                  self,
                  v6,
                  v7,
                  v8,
                  v9,
                  v10,
                  v12,
                  v14);

  return v15;
}

- (int64_t)category
{
  return self->_category;
}

- (int64_t)subcategory
{
  return self->_subcategory;
}

- (NSString)songID
{
  return self->_songID;
}

- (NSString)catalog
{
  return self->_catalog;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)colorGradeCategory
{
  return self->_colorGradeCategory;
}

- (void)setColorGradeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_colorGradeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorGradeCategory, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_songID, 0);
}

+ (id)URLWithCatalog:(id)a3 songID:(id)a4
{
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@://song?songID=%@"), v8, v7);

  objc_msgSend(v5, "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)decomposeURL:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD, void *, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  void (**v26)(_QWORD, void *, void *);
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD, void *, void *))a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 1);
  objc_msgSend(v7, "host");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("song")) & 1) == 0)
  {

    goto LABEL_17;
  }
  objc_msgSend(v7, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 != 1)
  {
LABEL_17:
    v24 = 0;
    goto LABEL_23;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v26 = v6;
    v27 = v5;
    v14 = 0;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "name", v26, v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("songID"));

        if (v19)
        {
          objc_msgSend(v17, "value");
          v20 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v20;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);

    if (!v14)
    {
      v24 = 0;
      v6 = v26;
      v5 = v27;
      goto LABEL_23;
    }
    objc_msgSend(v7, "scheme");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v26;
    v5 = v27;
    if (v21
      && (v32[0] = CFSTR("applemusic"),
          v32[1] = CFSTR("flexmusic"),
          v32[2] = CFSTR("mock"),
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "containsObject:", v21),
          v22,
          v23))
    {
      v26[2](v26, v21, v14);
      v24 = 1;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
    v14 = v11;
  }

LABEL_23:
  return v24;
}

@end
