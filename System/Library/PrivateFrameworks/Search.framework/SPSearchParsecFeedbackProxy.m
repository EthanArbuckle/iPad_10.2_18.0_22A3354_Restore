@implementation SPSearchParsecFeedbackProxy

- (void)searchViewDidAppear:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener searchViewDidAppear:](listener, "searchViewDidAppear:", v4);

}

- (void)searchViewDidDisappear:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener searchViewDidDisappear:](listener, "searchViewDidDisappear:", v4);

}

- (void)cardViewDidDisappear:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener cardViewDidDisappear:](listener, "cardViewDidDisappear:", v4);

}

- (void)didStartSearch:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didStartSearch:](listener, "didStartSearch:", v4);

}

- (void)didEndSearch:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didEndSearch:](listener, "didEndSearch:", v4);

}

- (void)didRankSections:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didRankSections:](listener, "didRankSections:", v4);

}

- (void)didEngageResult:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didEngageResult:](listener, "didEngageResult:", v4);

}

- (void)didEngageSuggestion:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didEngageSuggestion:](listener, "didEngageSuggestion:", v4);

}

- (void)didEngageCardSection:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didEngageCardSection:](listener, "didEngageCardSection:", v4);

}

- (void)didErrorOccur:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didErrorOccur:](listener, "didErrorOccur:", v4);

}

- (void)sendCustomFeedback:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener sendCustomFeedback:](listener, "sendCustomFeedback:", v4);

}

- (void)resultsDidBecomeVisible:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener resultsDidBecomeVisible:](listener, "resultsDidBecomeVisible:", v4);

}

- (void)suggestionsDidBecomeVisible:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  xpc_object_t v7;
  void *v8;
  id v9;

  v4 = a3;
  listener = self->_listener;
  v9 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v9;
    listener = self->_listener;
  }
  -[SFFeedbackListener suggestionsDidBecomeVisible:](listener, "suggestionsDidBecomeVisible:", v4);
  v7 = xpc_BOOL_create(self->_listener != 0);
  one_member_dict("suggestionsDidBecomeVisible", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  analytics_send_event();

}

- (void)didReceiveResultsAfterTimeout:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didReceiveResultsAfterTimeout:](listener, "didReceiveResultsAfterTimeout:", v4);

}

- (void)didAppendLateSections:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  xpc_object_t v7;
  void *v8;
  id v9;

  v4 = a3;
  listener = self->_listener;
  v9 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v9;
    listener = self->_listener;
  }
  -[SFFeedbackListener didAppendLateSections:](listener, "didAppendLateSections:", v4);
  v7 = xpc_BOOL_create(self->_listener != 0);
  one_member_dict("didAppendLateSections", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  analytics_send_event();

}

- (void)didClearInput:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didClearInput:](listener, "didClearInput:", v4);

}

- (void)sectionHeaderDidBecomeVisible:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener sectionHeaderDidBecomeVisible:](listener, "sectionHeaderDidBecomeVisible:", v4);

}

- (void)cardViewDidAppear:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener cardViewDidAppear:](listener, "cardViewDidAppear:", v4);

}

- (void)didPerformCommand:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didPerformCommand:](listener, "didPerformCommand:", v4);

}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id v6;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v9;

  v6 = a3;
  listener = self->_listener;
  v9 = v6;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v6 = v9;
    listener = self->_listener;
  }
  -[SFFeedbackListener reportFeedback:queryId:](listener, "reportFeedback:queryId:", v6, a4);

}

- (void)didGradeResultRelevancy:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didGradeResultRelevancy:](listener, "didGradeResultRelevancy:", v4);

}

- (void)didEngageSection:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didEngageSection:](listener, "didEngageSection:", v4);

}

- (void)didReportUserResponseFeedback:(id)a3
{
  id v4;
  SFFeedbackListener *listener;
  id WeakRetained;
  id v7;

  v4 = a3;
  listener = self->_listener;
  v7 = v4;
  if (!listener)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interface);
    objc_msgSend(WeakRetained, "setupSearchSession");

    v4 = v7;
    listener = self->_listener;
  }
  -[SFFeedbackListener didReportUserResponseFeedback:](listener, "didReportUserResponseFeedback:", v4);

}

- (SFFeedbackListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (SPCoreParsecInterface)interface
{
  return (SPCoreParsecInterface *)objc_loadWeakRetained((id *)&self->_interface);
}

- (void)setInterface:(id)a3
{
  objc_storeWeak((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interface);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
