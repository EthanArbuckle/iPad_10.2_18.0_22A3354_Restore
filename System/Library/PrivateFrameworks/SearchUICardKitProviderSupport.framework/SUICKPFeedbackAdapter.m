@implementation SUICKPFeedbackAdapter

- (id)feedbackListener
{
  return objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v4;
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    v9 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v4, "cardSection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardSectionWithSFCardSection:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "shouldHandleEngagement:forCardSection:", v4, v11);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)didEngageCardSection:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    v8 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v17, "cardSection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSectionWithSFCardSection:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionView:willProcessEngagementFeedback:", v10, v17);

  }
  v11 = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    v14 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v17, "cardSection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cardSectionWithSFCardSection:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userDidEngageCardSection:withEngagementFeedback:", v16, v17);

  }
}

- (void)didPerformCommand:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v7, "commandWasPerformed:", v8);

  }
}

- (void)cardViewDidAppear:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v9, "card");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardViewDidAppearForCard:withAppearanceFeedback:", v8, v9);

  }
}

- (void)cardViewDidDisappear:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v9, "card");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardViewDidDisappearForCard:withDisappearanceFeedback:", v8, v9);

  }
}

- (void)didReportUserResponseFeedback:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v9, "cardSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidReportFeedback:fromCardSection:", v9, v8);

  }
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v7, "cardSectionViewDidInvalidateSizeForCardSection:", 0);

  }
}

- (void)presentViewController:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v7, "presentViewController:", v8);

  }
}

- (void)willDismissViewController:(id)a3
{
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v7, "willDismissViewController:", v8);

  }
}

- (void)presentViewControllerForCard:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  CRKFeedbackDelegate **p_feedbackDelegate;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v4 = a4;
  v10 = a3;
  p_feedbackDelegate = &self->_feedbackDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_feedbackDelegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_feedbackDelegate);
    objc_msgSend(v9, "presentViewControllerForCard:animate:", v10, v4);

  }
}

- (CRKFeedbackDelegate)feedbackDelegate
{
  return (CRKFeedbackDelegate *)objc_loadWeakRetained((id *)&self->_feedbackDelegate);
}

- (void)setFeedbackDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_feedbackDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
}

@end
