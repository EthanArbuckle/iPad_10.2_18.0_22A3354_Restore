@implementation PRSFeedbackProxy

- (void)didRankSections:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

void __41__PRSFeedbackProxy_sendFeedback_queryId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "listener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5 = v2;
  if (!v3)
  {
    v3 = objc_msgSend(v4, "queryId");
    v2 = v5;
  }
  objc_msgSend(v2, "reportFeedback:queryId:", v4, v3);

}

- (PARSession)listener
{
  return (PARSession *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PRSFeedbackProxy sendFeedback:queryId:](self, "sendFeedback:queryId:", v7, a4);
    }
  }

}

- (void)sendFeedback:(id)a3 queryId:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[PRSFeedbackProxy feedbackQueue](self, "feedbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PRSFeedbackProxy_sendFeedback_queryId___block_invoke;
  block[3] = &unk_1E6E44B90;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (OS_dispatch_queue)feedbackQueue
{
  return self->_feedbackQueue;
}

- (PRSFeedbackProxy)init
{
  PRSFeedbackProxy *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRSFeedbackProxy;
  v2 = -[PRSFeedbackProxy init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.spotlight.PRSFeedbackProxy", v4);
    -[PRSFeedbackProxy setFeedbackQueue:](v2, "setFeedbackQueue:", v5);

  }
  return v2;
}

- (void)searchViewDidAppear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)searchViewDidDisappear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)cardViewDidDisappear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didStartSearch:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PRSFeedbackProxy sendFeedback:](self, "sendFeedback:", v5);

}

- (void)didEndSearch:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PRSFeedbackProxy sendFeedback:](self, "sendFeedback:", v5);

}

- (void)didEngageResult:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didEngageSuggestion:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didEngageCardSection:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didErrorOccur:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PRSFeedbackProxy sendFeedback:](self, "sendFeedback:", v5);

}

- (void)sendCustomFeedback:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[PRSFeedbackProxy sendFeedback:](self, "sendFeedback:", v5);

}

- (void)resultsDidBecomeVisible:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)suggestionsDidBecomeVisible:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didReceiveResultsAfterTimeout:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didAppendLateSections:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didClearInput:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)sectionHeaderDidBecomeVisible:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)cardViewDidAppear:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didPerformCommand:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)sendFeedback:(id)a3
{
  -[PRSFeedbackProxy sendFeedback:queryId:](self, "sendFeedback:queryId:", a3, 0);
}

- (void)sendCustomFeedback:(id)a3 clientID:(id)a4
{
  id v5;

  v5 = a3;
  -[PRSFeedbackProxy reportFeedback:queryId:](self, "reportFeedback:queryId:", v5, objc_msgSend(v5, "queryId"));

}

- (void)didReportUserResponseFeedback:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didGradeResultRelevancy:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)didEngageSection:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  objc_opt_respondsToSelector();

}

- (void)setListener:(id)a3
{
  objc_storeWeak((id *)&self->_listener, a3);
}

- (void)setFeedbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_destroyWeak((id *)&self->_listener);
}

@end
