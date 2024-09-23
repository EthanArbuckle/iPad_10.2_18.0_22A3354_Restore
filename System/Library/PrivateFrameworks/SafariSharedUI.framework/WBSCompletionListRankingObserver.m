@implementation WBSCompletionListRankingObserver

- (void)didBeginRanking
{
  _CompletionListRankingObserverFeedbackGenerator *v3;
  _CompletionListRankingObserverFeedbackGenerator *feedbackGenerator;

  -[WBSCompletionListRankingObserver _createFeedbackGenerator](self, "_createFeedbackGenerator");
  v3 = (_CompletionListRankingObserverFeedbackGenerator *)objc_claimAutoreleasedReturnValue();
  feedbackGenerator = self->_feedbackGenerator;
  self->_feedbackGenerator = v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_CompletionListRankingObserverFeedbackGenerator didBeginRanking](self->_feedbackGenerator, "didBeginRanking");
}

- (void)didEndRanking
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_CompletionListRankingObserverFeedbackGenerator didEndRanking](self->_feedbackGenerator, "didEndRanking");
}

- (void)didBeginSectionWithBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_CompletionListRankingObserverFeedbackGenerator didBeginSectionWithBundleIdentifier:](self->_feedbackGenerator, "didBeginSectionWithBundleIdentifier:", v4);

}

- (void)didAddItem:(id)a3
{
  -[WBSCompletionListRankingObserver didAddItem:hidingOutrankedResults:hidingDuplicateResults:](self, "didAddItem:hidingOutrankedResults:hidingDuplicateResults:", a3, 0, 0);
}

- (void)didAddItem:(id)a3 hidingOutrankedResults:(id)a4 hidingDuplicateResults:(id)a5
{
  -[_CompletionListRankingObserverFeedbackGenerator didAddItem:hidingOutrankedResults:hidingDuplicateResults:](self->_feedbackGenerator, "didAddItem:hidingOutrankedResults:hidingDuplicateResults:", a3, a4, a5);
}

- (void)didEncounterHiddenIgnoredSiriSuggestedSite:(id)a3
{
  -[_CompletionListRankingObserverFeedbackGenerator didEncounterHiddenIgnoredSiriSuggestedSite:](self->_feedbackGenerator, "didEncounterHiddenIgnoredSiriSuggestedSite:", a3);
}

- (void)removeAllSectionsAndItems
{
  -[_CompletionListRankingObserverFeedbackGenerator removeAllSectionsAndItems](self->_feedbackGenerator, "removeAllSectionsAndItems");
}

- (SFRankingFeedback)rankingFeedback
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_CompletionListRankingObserverFeedbackGenerator rankingFeedback](self->_feedbackGenerator, "rankingFeedback");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (SFRankingFeedback *)v3;
}

- (id)_createFeedbackGenerator
{
  _WBSSearchFoundationFeedbackGenerator *v3;

  v3 = objc_alloc_init(_WBSSearchFoundationFeedbackGenerator);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[_WBSSearchFoundationFeedbackGenerator setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (unint64_t)completionListRankingObserverFeedbackGenerator:(id)a3 frequentlyVisitedSitesIndexOfItem:(id)a4 hidingItem:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  unint64_t v10;

  v7 = a4;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = objc_msgSend(WeakRetained, "completionListRankingObserver:frequentlyVisitedSitesIndexOfItem:hidingItem:", self, v7, v8);
  else
    v10 = 0x7FFFFFFFFFFFFFFFLL;

  return v10;
}

- (WBSCompletionListRankingObserverDelegate)delegate
{
  return (WBSCompletionListRankingObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
}

@end
