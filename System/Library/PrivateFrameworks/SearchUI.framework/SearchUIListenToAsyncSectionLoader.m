@implementation SearchUIListenToAsyncSectionLoader

+ (BOOL)supportsSectionModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v3 = a3;
  objc_msgSend(v3, "rowModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v3, "rowModels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)placeholderCardSections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[SearchUIListenToAsyncSectionLoader listenToCardSection](self, "listenToCardSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fallbackCardSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUIListenToAsyncSectionLoader listenToCardSection](self, "listenToCardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fallbackCardSection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIListenToAsyncSectionLoader;
    -[SearchUIAsyncSectionLoader placeholderCardSections](&v9, sel_placeholderCardSections);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (SearchUIListenToAsyncSectionLoader)initWithSectionModel:(id)a3 result:(id)a4 queryId:(unint64_t)a5
{
  id v8;
  SearchUIListenToAsyncSectionLoader *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SearchUIListenToAsyncSectionLoader;
  v9 = -[SearchUIAsyncSectionLoader initWithSectionModel:result:queryId:](&v14, sel_initWithSectionModel_result_queryId_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "rowModels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cardSection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIListenToAsyncSectionLoader setListenToCardSection:](v9, "setListenToCardSection:", v12);

  }
  return v9;
}

- (id)cacheIdentifier
{
  void *v2;
  void *v3;

  -[SearchUIListenToAsyncSectionLoader listenToCardSection](self, "listenToCardSection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fetchCardSectionsWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, id))a3;
  v7 = (id)objc_opt_new();
  -[SearchUIListenToAsyncSectionLoader listenToCardSection](self, "listenToCardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIMediaUtilities cardSectionsForListenToCardSection:](SearchUIMediaUtilities, "cardSectionsForListenToCardSection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCardSection:", v6);

  objc_msgSend(v7, "setAnimated:", 1);
  v4[2](v4, v7);

}

- (SFListenToCardSection)listenToCardSection
{
  return (SFListenToCardSection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setListenToCardSection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenToCardSection, 0);
}

@end
