@implementation _WBSSearchFoundationFeedbackGenerator

- (_WBSSearchFoundationFeedbackGenerator)init
{
  _WBSSearchFoundationFeedbackGenerator *v2;
  uint64_t v3;
  NSMutableArray *sectionRankingFeedbackObjects;
  uint64_t v5;
  NSMutableArray *currentSectionResultRankingFeedbackObjects;
  _WBSSearchFoundationFeedbackGenerator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WBSSearchFoundationFeedbackGenerator;
  v2 = -[_WBSSearchFoundationFeedbackGenerator init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    sectionRankingFeedbackObjects = v2->_sectionRankingFeedbackObjects;
    v2->_sectionRankingFeedbackObjects = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    currentSectionResultRankingFeedbackObjects = v2->_currentSectionResultRankingFeedbackObjects;
    v2->_currentSectionResultRankingFeedbackObjects = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)didBeginRanking
{
  NSDate *v3;
  NSDate *rankingStartDate;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  rankingStartDate = self->_rankingStartDate;
  self->_rankingStartDate = v3;

}

- (void)didEndRanking
{
  id v3;
  NSMutableArray *sectionRankingFeedbackObjects;
  double v5;
  SFRankingFeedback *v6;
  SFRankingFeedback *rankingFeedback;
  void *v8;
  SFSearchResult *hiddenIgnoredSiriSuggestedWebsite;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[_WBSSearchFoundationFeedbackGenerator _commitPreviousSectionIfNecessary](self, "_commitPreviousSectionIfNecessary");
  v3 = objc_alloc(MEMORY[0x1E0D8C600]);
  sectionRankingFeedbackObjects = self->_sectionRankingFeedbackObjects;
  -[NSDate timeIntervalSinceNow](self->_rankingStartDate, "timeIntervalSinceNow");
  v6 = (SFRankingFeedback *)objc_msgSend(v3, "initWithSections:blendingDuration:", sectionRankingFeedbackObjects, -v5);
  rankingFeedback = self->_rankingFeedback;
  self->_rankingFeedback = v6;

  if ((objc_opt_respondsToSelector() & 1) != 0 && self->_hiddenIgnoredSiriSuggestedWebsite)
  {
    v10[0] = self->_hiddenIgnoredSiriSuggestedWebsite;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRankingFeedback setHiddenResults:](self->_rankingFeedback, "setHiddenResults:", v8);

  }
  hiddenIgnoredSiriSuggestedWebsite = self->_hiddenIgnoredSiriSuggestedWebsite;
  self->_hiddenIgnoredSiriSuggestedWebsite = 0;

}

- (void)didBeginSectionWithBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *currentSectionBundleIdentifier;

  v4 = (NSString *)a3;
  -[_WBSSearchFoundationFeedbackGenerator _commitPreviousSectionIfNecessary](self, "_commitPreviousSectionIfNecessary");
  currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
  self->_currentSectionBundleIdentifier = v4;

}

- (void)didEncounterHiddenIgnoredSiriSuggestedSite:(id)a3
{
  id v4;
  id v5;
  SFSearchResult *hiddenIgnoredSiriSuggestedWebsite;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0D8C680]);
    objc_msgSend(v5, "setHideReason:", 1);
    objc_msgSend(v4, "setSafariAttributes:", v5);

  }
  hiddenIgnoredSiriSuggestedWebsite = self->_hiddenIgnoredSiriSuggestedWebsite;
  self->_hiddenIgnoredSiriSuggestedWebsite = (SFSearchResult *)v4;

}

- (void)didAddItem:(id)a3 hidingOutrankedResults:(id)a4 hidingDuplicateResults:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *currentSectionBundleIdentifier;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = a5;
  objc_msgSend(a3, "sfSearchResultValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v10, "sectionBundleIdentifier");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    currentSectionBundleIdentifier = v12;
    if (!v12)
      currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
    objc_msgSend(v11, "setSectionBundleIdentifier:", currentSectionBundleIdentifier);

    objc_msgSend(v17, "safari_mapObjectsUsingBlock:", &__block_literal_global_7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_86);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C648]), "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v11, v14, v15, -[NSMutableArray count](self->_currentSectionResultRankingFeedbackObjects, "count"));
    if (v16)
      -[NSMutableArray addObject:](self->_currentSectionResultRankingFeedbackObjects, "addObject:", v16);

  }
}

- (void)removeAllSectionsAndItems
{
  NSString *currentSectionBundleIdentifier;
  SFSearchResult *hiddenIgnoredSiriSuggestedWebsite;

  -[NSMutableArray removeAllObjects](self->_sectionRankingFeedbackObjects, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_currentSectionResultRankingFeedbackObjects, "removeAllObjects");
  currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
  self->_currentSectionBundleIdentifier = 0;

  hiddenIgnoredSiriSuggestedWebsite = self->_hiddenIgnoredSiriSuggestedWebsite;
  self->_hiddenIgnoredSiriSuggestedWebsite = 0;

}

- (void)_commitPreviousSectionIfNecessary
{
  NSString *currentSectionBundleIdentifier;
  void *v4;
  NSString *v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;

  currentSectionBundleIdentifier = self->_currentSectionBundleIdentifier;
  if (currentSectionBundleIdentifier)
  {
    v9 = currentSectionBundleIdentifier;
    v4 = (void *)-[NSMutableArray copy](self->_currentSectionResultRankingFeedbackObjects, "copy");
    v5 = self->_currentSectionBundleIdentifier;
    self->_currentSectionBundleIdentifier = 0;

    -[NSMutableArray removeAllObjects](self->_currentSectionResultRankingFeedbackObjects, "removeAllObjects");
    v6 = objc_alloc_init(MEMORY[0x1E0D8C650]);
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "setBundleIdentifier:", v9);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6D8]), "initWithResults:section:localSectionPosition:personalizationScore:", v4, v7, -[NSMutableArray count](self->_sectionRankingFeedbackObjects, "count"), 0.0);
      if (v8)
        -[NSMutableArray addObject:](self->_sectionRankingFeedbackObjects, "addObject:", v8);

    }
  }
}

- (SFRankingFeedback)rankingFeedback
{
  return self->_rankingFeedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingFeedback, 0);
  objc_storeStrong((id *)&self->_hiddenIgnoredSiriSuggestedWebsite, 0);
  objc_storeStrong((id *)&self->_currentSectionResultRankingFeedbackObjects, 0);
  objc_storeStrong((id *)&self->_currentSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionRankingFeedbackObjects, 0);
  objc_storeStrong((id *)&self->_rankingStartDate, 0);
}

@end
