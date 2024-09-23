@implementation SearchUICommandEnvironment

- (void)setSelectableGridPunchoutIndex:(int64_t)a3
{
  self->_selectableGridPunchoutIndex = a3;
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  self->_threeDTouchEnabled = a3;
}

- (void)setShouldUseStandardSectionInsets:(BOOL)a3
{
  self->_shouldUseStandardSectionInsets = a3;
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  self->_shouldUseInsetRoundedSections = a3;
}

- (void)setRowModelViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_rowModelViewDelegate, a3);
}

- (void)setResultsViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsViewDelegate, a3);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (void)setCommandDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_commandDelegate, a3);
}

- (void)setCardViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewDelegate, a3);
}

- (SearchUICommandEnvironment)init
{
  SearchUICommandEnvironment *v2;
  SearchUICommandEnvironment *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUICommandEnvironment;
  v2 = -[SearchUICommandEnvironment init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SearchUICommandEnvironment setSelectableGridPunchoutIndex:](v2, "setSelectableGridPunchoutIndex:", -1);
  return v3;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lastEngagedSection);
  objc_destroyWeak((id *)&self->_resultsViewDelegate);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_destroyWeak((id *)&self->_watchListDelegate);
  objc_destroyWeak((id *)&self->_cardViewDelegate);
  objc_destroyWeak((id *)&self->_rowModelViewDelegate);
  objc_destroyWeak((id *)&self->_commandDelegate);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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
  void *v16;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  -[SearchUICommandEnvironment feedbackDelegate](self, "feedbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFeedbackDelegate:", v5);

  -[SearchUICommandEnvironment commandDelegate](self, "commandDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCommandDelegate:", v6);

  -[SearchUICommandEnvironment cardViewDelegate](self, "cardViewDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCardViewDelegate:", v7);

  -[SearchUICommandEnvironment watchListDelegate](self, "watchListDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWatchListDelegate:", v8);

  objc_msgSend(v4, "setShouldUseInsetRoundedSections:", -[SearchUICommandEnvironment shouldUseInsetRoundedSections](self, "shouldUseInsetRoundedSections"));
  objc_msgSend(v4, "setShouldUseStandardSectionInsets:", -[SearchUICommandEnvironment shouldUseStandardSectionInsets](self, "shouldUseStandardSectionInsets"));
  objc_msgSend(v4, "setThreeDTouchEnabled:", -[SearchUICommandEnvironment threeDTouchEnabled](self, "threeDTouchEnabled"));
  objc_msgSend(v4, "setSelectableGridPunchoutIndex:", -[SearchUICommandEnvironment selectableGridPunchoutIndex](self, "selectableGridPunchoutIndex"));
  -[SearchUICommandEnvironment searchString](self, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSearchString:", v9);

  -[SearchUICommandEnvironment sectionTitle](self, "sectionTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSectionTitle:", v10);

  -[SearchUICommandEnvironment presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentingViewController:", v11);

  -[SearchUICommandEnvironment sourceView](self, "sourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceView:", v12);

  -[SearchUICommandEnvironment rowModelViewDelegate](self, "rowModelViewDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRowModelViewDelegate:", v13);

  objc_msgSend(v4, "setQueryId:", -[SearchUICommandEnvironment queryId](self, "queryId"));
  -[SearchUICommandEnvironment section](self, "section");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSection:", v14);

  -[SearchUICommandEnvironment resultsViewDelegate](self, "resultsViewDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResultsViewDelegate:", v15);

  -[SearchUICommandEnvironment lastEngagedSection](self, "lastEngagedSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastEngagedSection:", v16);

  objc_msgSend(v4, "setModifierFlags:", -[SearchUICommandEnvironment modifierFlags](self, "modifierFlags"));
  return v4;
}

- (SearchUICommandDelegate)commandDelegate
{
  void *WeakRetained;
  void *v4;
  char v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandDelegate);
  if (!WeakRetained)
  {
    -[SearchUICommandEnvironment feedbackDelegate](self, "feedbackDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[SearchUICommandEnvironment feedbackDelegate](self, "feedbackDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "commandDelegate");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      WeakRetained = 0;
    }
  }
  return (SearchUICommandDelegate *)WeakRetained;
}

- (SearchUIFeedbackDelegate)feedbackDelegate
{
  return (SearchUIFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (SearchUIRowModelViewDelegate)rowModelViewDelegate
{
  return (SearchUIRowModelViewDelegate *)objc_loadWeakRetained((id *)&self->_rowModelViewDelegate);
}

- (SearchUICardViewDelegate)cardViewDelegate
{
  return (SearchUICardViewDelegate *)objc_loadWeakRetained((id *)&self->_cardViewDelegate);
}

- (SearchUIWatchListDelegate)watchListDelegate
{
  return (SearchUIWatchListDelegate *)objc_loadWeakRetained((id *)&self->_watchListDelegate);
}

- (void)setWatchListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_watchListDelegate, a3);
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (BOOL)shouldUseStandardSectionInsets
{
  return self->_shouldUseStandardSectionInsets;
}

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (int64_t)selectableGridPunchoutIndex
{
  return self->_selectableGridPunchoutIndex;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (SFResultSection)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (SearchUIResultsViewDelegate)resultsViewDelegate
{
  return (SearchUIResultsViewDelegate *)objc_loadWeakRetained((id *)&self->_resultsViewDelegate);
}

- (SearchUISectionModel)lastEngagedSection
{
  return (SearchUISectionModel *)objc_loadWeakRetained((id *)&self->_lastEngagedSection);
}

- (void)setLastEngagedSection:(id)a3
{
  objc_storeWeak((id *)&self->_lastEngagedSection, a3);
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

@end
