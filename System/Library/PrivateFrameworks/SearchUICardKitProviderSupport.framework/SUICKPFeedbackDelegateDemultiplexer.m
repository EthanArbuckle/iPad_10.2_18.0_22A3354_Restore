@implementation SUICKPFeedbackDelegateDemultiplexer

- (SUICKPFeedbackDelegateDemultiplexer)init
{
  SUICKPFeedbackDelegateDemultiplexer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *feedbackDelegatesByCardSectionIdentifiers;
  NSMutableDictionary *v5;
  NSMutableDictionary *feedbackDelegatesByCardSectionViewIds;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *serialInstrumentationFeedbackQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUICKPFeedbackDelegateDemultiplexer;
  v2 = -[SUICKPFeedbackDelegateDemultiplexer init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    feedbackDelegatesByCardSectionIdentifiers = v2->_feedbackDelegatesByCardSectionIdentifiers;
    v2->_feedbackDelegatesByCardSectionIdentifiers = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    feedbackDelegatesByCardSectionViewIds = v2->_feedbackDelegatesByCardSectionViewIds;
    v2->_feedbackDelegatesByCardSectionViewIds = v5;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.siri.cardKit.FeedbackDelegateDemultiplexer.serialInstrumentationFeedbackQueue", v7);
    serialInstrumentationFeedbackQueue = v2->_serialInstrumentationFeedbackQueue;
    v2->_serialInstrumentationFeedbackQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)emitInstrumentationEvent:(id)a3
{
  id v4;
  NSObject *serialInstrumentationFeedbackQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    serialInstrumentationFeedbackQueue = self->_serialInstrumentationFeedbackQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__SUICKPFeedbackDelegateDemultiplexer_emitInstrumentationEvent___block_invoke;
    block[3] = &unk_24E385FF0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(serialInstrumentationFeedbackQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __64__SUICKPFeedbackDelegateDemultiplexer_emitInstrumentationEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "snippetUIDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v7;
    if (v3)
    {
      objc_msgSend(v7, "snippetUIDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      WeakRetained = v7;
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v7, "snippetUIDelegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "emitInstrumentationEvent:", *(_QWORD *)(a1 + 32));

        WeakRetained = v7;
      }
    }
  }

}

- (id)_delegateForFeedback:(id)a3
{
  id v4;
  NSMutableDictionary *feedbackDelegatesByCardSectionIdentifiers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchUIFeedbackDelegate *v10;
  SearchUIFeedbackDelegate *defaultDelegate;
  SearchUIFeedbackDelegate *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    feedbackDelegatesByCardSectionIdentifiers = self->_feedbackDelegatesByCardSectionIdentifiers;
    v6 = (void *)MEMORY[0x24BE15518];
    objc_msgSend(v4, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSectionWithSFCardSection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cardSectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](feedbackDelegatesByCardSectionIdentifiers, "objectForKey:", v9);
    v10 = (SearchUIFeedbackDelegate *)objc_claimAutoreleasedReturnValue();
    defaultDelegate = v10;
    if (!v10)
      defaultDelegate = self->_defaultDelegate;
    v12 = defaultDelegate;

  }
  else
  {
    v12 = self->_defaultDelegate;
  }

  return v12;
}

- (id)_delegateForView:(id)a3
{
  id v4;
  NSMutableDictionary *feedbackDelegatesByCardSectionViewIds;
  void *v6;
  SearchUIFeedbackDelegate *v7;
  SearchUIFeedbackDelegate *defaultDelegate;
  SearchUIFeedbackDelegate *v9;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_255499690))
  {
    feedbackDelegatesByCardSectionViewIds = self->_feedbackDelegatesByCardSectionViewIds;
    objc_msgSend(v4, "cardSectionViewIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](feedbackDelegatesByCardSectionViewIds, "objectForKey:", v6);
    v7 = (SearchUIFeedbackDelegate *)objc_claimAutoreleasedReturnValue();
    defaultDelegate = v7;
    if (!v7)
      defaultDelegate = self->_defaultDelegate;
    v9 = defaultDelegate;

  }
  else
  {
    v9 = self->_defaultDelegate;
  }

  return v9;
}

- (void)reportFeedback:(id)a3 queryId:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_21ECF4000, v8, OS_LOG_TYPE_INFO, "Report feedback: %@ with queryId %lld", (uint8_t *)&v9, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "reportFeedback:queryId:", v6, a4);

}

- (void)cardViewDidDisappear:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Card did disappear with feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "cardViewDidDisappear:", v4);

}

- (void)cardViewDidAppear:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Card did appear with feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "cardViewDidAppear:", v4);

}

- (void)didEngageCardSection:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Card section engaged with feedback: %@  listener: %@", (uint8_t *)&v7, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didEngageCardSection:", v4);

}

- (void)didPerformCommand:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Command performed with feedback: %@  listener: %@", (uint8_t *)&v7, 0x16u);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didPerformCommand:", v4);

}

- (void)didReportUserResponseFeedback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Report user response feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didReportUserResponseFeedback:", v4);

}

- (void)didErrorOccur:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Error occured: %@", (uint8_t *)&v7, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "didErrorOccur:", v4);

}

- (void)sendCustomFeedback:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21ECF4000, v6, OS_LOG_TYPE_INFO, "Sending custom feedback: %@", (uint8_t *)&v7, 0xCu);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "sendCustomFeedback:", v4);

}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForFeedback:](self, "_delegateForFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "shouldHandleCardSectionEngagement:", v4);
  else
    v6 = 0;

  return v6;
}

- (void)cardSectionViewDidInvalidateSize:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[SUICKPFeedbackDelegateDemultiplexer _delegateForView:](self, "_delegateForView:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "cardSectionViewDidInvalidateSize:animate:", v7, v4);

}

- (void)presentViewController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SearchUIFeedbackDelegate presentViewController:](self->_defaultDelegate, "presentViewController:", v4);

}

- (void)willDismissViewController:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SearchUIFeedbackDelegate willDismissViewController:](self->_defaultDelegate, "willDismissViewController:", v4);

}

- (void)cardSectionViewDidInvalidateSize:(id)a3
{
  -[SUICKPFeedbackDelegateDemultiplexer cardSectionViewDidInvalidateSize:animate:](self, "cardSectionViewDidInvalidateSize:animate:", a3, 0);
}

- (void)cardSectionViewDidSelectPreferredPunchoutIndex:(int64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SearchUIFeedbackDelegate cardSectionViewDidSelectPreferredPunchoutIndex:](self->_defaultDelegate, "cardSectionViewDidSelectPreferredPunchoutIndex:", a3);
}

- (void)presentViewControllerForCard:(id)a3 animate:(BOOL)a4
{
  id v5;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SearchUIFeedbackDelegate presentViewControllerForCard:animate:](self->_defaultDelegate, "presentViewControllerForCard:animate:", v5, 1);

}

- (NSMutableDictionary)feedbackDelegatesByCardSectionIdentifiers
{
  return self->_feedbackDelegatesByCardSectionIdentifiers;
}

- (NSMutableDictionary)feedbackDelegatesByCardSectionViewIds
{
  return self->_feedbackDelegatesByCardSectionViewIds;
}

- (SearchUIFeedbackDelegate)defaultDelegate
{
  return self->_defaultDelegate;
}

- (void)setDefaultDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDelegate, a3);
}

- (VRXInteractionDelegate)snippetUIDelegate
{
  return (VRXInteractionDelegate *)objc_loadWeakRetained((id *)&self->_snippetUIDelegate);
}

- (void)setSnippetUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_snippetUIDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snippetUIDelegate);
  objc_storeStrong((id *)&self->_defaultDelegate, 0);
  objc_storeStrong((id *)&self->_feedbackDelegatesByCardSectionViewIds, 0);
  objc_storeStrong((id *)&self->_feedbackDelegatesByCardSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_serialInstrumentationFeedbackQueue, 0);
}

@end
