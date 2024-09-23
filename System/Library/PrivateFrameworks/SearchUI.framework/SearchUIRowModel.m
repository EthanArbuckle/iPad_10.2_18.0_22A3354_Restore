@implementation SearchUIRowModel

- (SFSearchResult)identifyingResult
{
  void *v2;
  void *v3;

  -[SearchUIRowModel results](self, "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFSearchResult *)v3;
}

- (NSArray)results
{
  return self->_results;
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)hasCustomCornerRounding
{
  return self->_hasCustomCornerRounding;
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setIsTopHit:(BOOL)a3
{
  self->_isTopHit = a3;
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (SearchUIRowModel)initWithResult:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  SearchUIRowModel *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SearchUIRowModel initWithResult:cardSection:queryId:itemIdentifier:](self, "initWithResult:cardSection:queryId:itemIdentifier:", v7, 0, objc_msgSend(v7, "queryId"), v6);

  return v8;
}

- (SearchUIRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SearchUIRowModel *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SearchUIRowModel initWithResults:cardSection:queryId:itemIdentifier:](self, "initWithResults:cardSection:queryId:itemIdentifier:", v7, 0, objc_msgSend(v8, "queryId"), v6);

  return v9;
}

- (SearchUIRowModel)initWithResult:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  SearchUIRowModel *v16;
  SearchUIRowModel *v17;
  id v18;
  id v19;
  SearchUIRowModel *v20;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (v10)
  {
    v22 = v10;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = a6;
    v14 = a4;
    objc_msgSend(v12, "arrayWithObjects:count:", &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SearchUIRowModel initWithResults:cardSection:queryId:itemIdentifier:](self, "initWithResults:cardSection:queryId:itemIdentifier:", v15, v14, a5, v13, v22, v23);

    v17 = v16;
  }
  else
  {
    v18 = a6;
    v19 = a4;
    v20 = -[SearchUIRowModel initWithResults:cardSection:queryId:itemIdentifier:](self, "initWithResults:cardSection:queryId:itemIdentifier:", 0, v19, a5, v18);

    v17 = v20;
  }

  return v17;
}

- (SearchUIRowModel)initWithResults:(id)a3 cardSection:(id)a4 queryId:(unint64_t)a5 itemIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  SearchUIRowModel *v13;
  SearchUIRowModel *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SearchUIRowModel;
  v13 = -[SearchUIRowModel init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    -[SearchUIRowModel setResults:](v13, "setResults:", v10);
    objc_msgSend(v10, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIRowModel setIdentifyingResult:](v14, "setIdentifyingResult:", v15);

    -[SearchUIRowModel setCardSection:](v14, "setCardSection:", v11);
    -[SearchUIRowModel setItemIdentifier:](v14, "setItemIdentifier:", v12);
    v14->_queryId = a5;
  }

  return v14;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (void)setIdentifyingResult:(id)a3
{
  objc_storeStrong((id *)&self->_identifyingResult, a3);
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (id)requestAppClipObjects
{
  return 0;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SearchUIRowModel itemIdentifier](self, "itemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SearchUIRowModel itemIdentifier](self, "itemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)reuseIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  NSStringFromClass(-[SearchUIRowModel cellViewClass](self, "cellViewClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    NSStringFromClass(-[SearchUIRowModel collectionViewCellClass](self, "collectionViewCellClass"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (SFCard)nextCard
{
  return self->_nextCard;
}

- (SearchUIRowModel)initWithCardSection:(id)a3 queryId:(unint64_t)a4 itemIdentifier:(id)a5
{
  return -[SearchUIRowModel initWithResults:cardSection:queryId:itemIdentifier:](self, "initWithResults:cardSection:queryId:itemIdentifier:", 0, a3, a4, a5);
}

- (int)separatorStyle
{
  return 0;
}

- (BOOL)fillsBackgroundWithContent
{
  void *v2;
  BOOL v3;

  -[SearchUIRowModel backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)allowBackgroundColor
{
  void *v3;
  int v4;

  if (allowBackgroundColor_onceToken != -1)
    dispatch_once(&allowBackgroundColor_onceToken, &__block_literal_global_18);
  if (-[SearchUIRowModel isTopHit](self, "isTopHit"))
  {
    -[SearchUIRowModel identifyingResult](self, "identifyingResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "usesCompactDisplay");

    if (!v4)
      return 1;
  }
  if (allowBackgroundColor_isSafariProcess)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0DBDA48], "isSiri");
}

void __40__SearchUIRowModel_allowBackgroundColor__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 14);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  allowBackgroundColor_isSafariProcess = objc_msgSend(v0, "isEqualToString:", v1);

}

- (BOOL)isQuerySuggestion
{
  return 0;
}

- (NSString)accessibilityIdentifier
{
  void *v2;
  int v3;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if ((v3 - 16) > 0x13)
    return (NSString *)CFSTR("ResultCell");
  else
    return &off_1EA1F75E0[v3 - 16]->isa;
}

- (BOOL)isEqualToModel:(id)a3
{
  void *v3;
  void *v4;
  SearchUIRowModel *v6;
  SearchUIRowModel *v7;
  SFSearchResult *identifyingResult;
  SFSearchResult *v9;
  SFSearchResult *v10;
  char v11;
  SFCardSection *cardSection;
  SFCardSection *v13;
  SFCardSection *v14;
  NSArray *results;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  void *v19;

  v6 = (SearchUIRowModel *)a3;
  v7 = v6;
  if (v6 != self)
  {
    identifyingResult = self->_identifyingResult;
    -[SearchUIRowModel identifyingResult](v6, "identifyingResult");
    v9 = (SFSearchResult *)objc_claimAutoreleasedReturnValue();
    if (identifyingResult != v9)
    {
      v10 = self->_identifyingResult;
      -[SearchUIRowModel identifyingResult](v7, "identifyingResult");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[SFSearchResult isEqual:](v10, "isEqual:", v3))
      {
        v11 = 0;
        goto LABEL_15;
      }
    }
    cardSection = self->_cardSection;
    -[SearchUIRowModel cardSection](v7, "cardSection");
    v13 = (SFCardSection *)objc_claimAutoreleasedReturnValue();
    if (cardSection == v13
      || (v14 = self->_cardSection,
          -[SearchUIRowModel cardSection](v7, "cardSection"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          -[SFCardSection isEqual:](v14, "isEqual:", v4)))
    {
      results = self->_results;
      -[SearchUIRowModel results](v7, "results");
      v16 = objc_claimAutoreleasedReturnValue();
      if (results == (NSArray *)v16)
      {

        v11 = 1;
      }
      else
      {
        v17 = (void *)v16;
        v18 = self->_results;
        -[SearchUIRowModel results](v7, "results");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[NSArray isEqual:](v18, "isEqual:", v19);

      }
      if (cardSection == v13)
      {
LABEL_14:

        if (identifyingResult == v9)
        {
LABEL_16:

          goto LABEL_17;
        }
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      v11 = 0;
    }

    goto LABEL_14;
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SearchUIRowModel results](self, "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResults:", v5);

  -[SearchUIRowModel cardSection](self, "cardSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardSection:", v6);

  objc_msgSend(v4, "setQueryId:", -[SearchUIRowModel queryId](self, "queryId"));
  -[SearchUIRowModel itemIdentifier](self, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setItemIdentifier:", v7);

  objc_msgSend(v4, "setCornerMask:", -[SearchUIRowModel cornerMask](self, "cornerMask"));
  objc_msgSend(v4, "setHasCustomCornerRounding:", -[SearchUIRowModel hasCustomCornerRounding](self, "hasCustomCornerRounding"));
  objc_msgSend(v4, "setHasValidCommandHandler:", -[SearchUIRowModel hasValidCommandHandler](self, "hasValidCommandHandler"));
  -[SearchUIRowModel contextualAction](self, "contextualAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextualAction:", v8);

  objc_msgSend(v4, "setContextualActionLoaded:", -[SearchUIRowModel contextualActionLoaded](self, "contextualActionLoaded"));
  return v4;
}

- (NSString)applicationBundleIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    v8 = v7;

    objc_msgSend(v8, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[SearchUIRowModel cardSection](self, "cardSection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "command");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      objc_msgSend(v12, "fileProviderIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(v12, "coreSpotlightIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 6);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v4 = 0;
        }
      }

    }
  }
  return (NSString *)v4;
}

- (NSString)coreSpotlightIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
    v8 = v7;

    objc_msgSend(v8, "coreSpotlightIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[SearchUIRowModel cardSection](self, "cardSection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "command");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      objc_msgSend(v12, "coreSpotlightIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return (NSString *)v4;
}

- (NSString)displayTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)fileProviderIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SearchUIRowModel identifyingResult](self, "identifyingResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileProviderIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[SearchUIRowModel cardSection](self, "cardSection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "command");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "fileProviderIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (BOOL)allowsAppEntityAnnotation
{
  return 0;
}

- (WFContextualAction)contextualAction
{
  WFContextualAction *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[SearchUIRowModel contextualActionLoaded](self, "contextualActionLoaded"))
  {
    v3 = self->_contextualAction;
  }
  else
  {
    +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:](SearchUIShortcutsUtilities, "commandForSettingTogglesFromRowModel:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIRowModel setContextualActionLoaded:](self, "setContextualActionLoaded:", 1);
    objc_msgSend(v4, "intentMessageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_7;
    v6 = (void *)MEMORY[0x1DF0A856C]();
    objc_msgSend(v4, "intentMessageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WFSpotlightResultRunnableFromData();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "settingBiomeStreamIdentifier");
      v3 = (WFContextualAction *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        v3 = v5;
        objc_storeStrong((id *)&self->_contextualAction, v5);
        v5 = v3;
      }
    }
    else
    {
LABEL_7:
      v3 = 0;
    }

  }
  return v3;
}

- (void)updateWithEnvironment:(id)a3
{
  -[SearchUIRowModel setHasValidCommandHandler:](self, "setHasValidCommandHandler:", +[SearchUICommandHandler hasValidHandlerForRowModel:environment:](SearchUICommandHandler, "hasValidHandlerForRowModel:environment:", self, a3));
}

- (NSArray)punchouts
{
  return self->_punchouts;
}

- (Class)cellViewClass
{
  return self->_cellViewClass;
}

- (Class)collectionViewCellClass
{
  return self->_collectionViewCellClass;
}

- (BOOL)isTappable
{
  return self->_isTappable;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (BOOL)isDraggable
{
  return self->_isDraggable;
}

- (NSString)dragTitle
{
  return self->_dragTitle;
}

- (NSString)dragSubtitle
{
  return self->_dragSubtitle;
}

- (NSString)dragText
{
  return self->_dragText;
}

- (NSURL)dragURL
{
  return self->_dragURL;
}

- (NSString)dragAppBundleID
{
  return self->_dragAppBundleID;
}

- (BOOL)supportsCustomUserReportRequestAfforance
{
  return self->_supportsCustomUserReportRequestAfforance;
}

- (BOOL)hasLeadingImage
{
  return self->_hasLeadingImage;
}

- (BOOL)prefersNoSeparatorAbove
{
  return self->_prefersNoSeparatorAbove;
}

- (NSString)previewItemTitle
{
  return self->_previewItemTitle;
}

- (void)setPreviewItemTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSUserActivity)launchActivity
{
  return self->_launchActivity;
}

- (void)setLaunchActivity:(id)a3
{
  objc_storeStrong((id *)&self->_launchActivity, a3);
}

- (NSString)launchActivityAppBundleId
{
  return self->_launchActivityAppBundleId;
}

- (void)setLaunchActivityAppBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (SFImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (void)setCornerMask:(unint64_t)a3
{
  self->_cornerMask = a3;
}

- (void)setHasCustomCornerRounding:(BOOL)a3
{
  self->_hasCustomCornerRounding = a3;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)hasValidCommandHandler
{
  return self->_hasValidCommandHandler;
}

- (void)setHasValidCommandHandler:(BOOL)a3
{
  self->_hasValidCommandHandler = a3;
}

- (void)setContextualAction:(id)a3
{
  objc_storeStrong((id *)&self->_contextualAction, a3);
}

- (BOOL)contextualActionLoaded
{
  return self->_contextualActionLoaded;
}

- (void)setContextualActionLoaded:(BOOL)a3
{
  self->_contextualActionLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_launchActivityAppBundleId, 0);
  objc_storeStrong((id *)&self->_launchActivity, 0);
  objc_storeStrong((id *)&self->_previewItemTitle, 0);
  objc_storeStrong((id *)&self->_dragAppBundleID, 0);
  objc_storeStrong((id *)&self->_dragURL, 0);
  objc_storeStrong((id *)&self->_dragText, 0);
  objc_storeStrong((id *)&self->_dragSubtitle, 0);
  objc_storeStrong((id *)&self->_dragTitle, 0);
  objc_storeStrong((id *)&self->_nextCard, 0);
  objc_storeStrong((id *)&self->_collectionViewCellClass, 0);
  objc_storeStrong((id *)&self->_cellViewClass, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_punchouts, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_identifyingResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
