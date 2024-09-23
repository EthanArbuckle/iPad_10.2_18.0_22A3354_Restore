@implementation SiriSharedUISuggestionsViewInterface

- (SiriSharedUISuggestionsViewInterface)initWithTapHandler:(id)a3
{
  id v4;
  SiriSharedUISuggestionsViewInterface *v5;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v6;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *suggestionsViewProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUISuggestionsViewInterface;
  v5 = -[SiriSharedUISuggestionsViewInterface init](&v9, sel_init);
  if (v5)
  {
    v6 = -[SiriSharedUIAssistantSuggestionsViewProvider initWithTapHandler:]([_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider alloc], "initWithTapHandler:", v4);
    suggestionsViewProvider = v5->suggestionsViewProvider;
    v5->suggestionsViewProvider = v6;

  }
  return v5;
}

- (SiriSharedUISuggestionsViewInterface)initWithPressDownHandler:(id)a3 pressUpHandler:(id)a4
{
  id v6;
  id v7;
  SiriSharedUISuggestionsViewInterface *v8;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *v9;
  _TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider *suggestionsViewProvider;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriSharedUISuggestionsViewInterface;
  v8 = -[SiriSharedUISuggestionsViewInterface init](&v12, sel_init);
  if (v8)
  {
    v9 = -[SiriSharedUIAssistantSuggestionsViewProvider initWithPressDownHandler:pressUpHandler:]([_TtC12SiriSharedUI44SiriSharedUIAssistantSuggestionsViewProvider alloc], "initWithPressDownHandler:pressUpHandler:", v6, v7);
    suggestionsViewProvider = v8->suggestionsViewProvider;
    v8->suggestionsViewProvider = v9;

  }
  return v8;
}

- (void)suggestionsWereShownForCallback
{
  -[SiriSharedUIAssistantSuggestionsViewProvider suggestionsWereShownForCallback](self->suggestionsViewProvider, "suggestionsWereShownForCallback");
}

- (void)fetchAutoCompletionSuggestionsViewsWithQuery:(id)a3 deviceLocked:(BOOL)a4 completion:(id)a5
{
  -[SiriSharedUIAssistantSuggestionsViewProvider fetchAutoCompletionViewsWithQuery:deviceLocked:completion:](self->suggestionsViewProvider, "fetchAutoCompletionViewsWithQuery:deviceLocked:completion:", a3, a4, a5);
}

- (id)getInitialSuggestionViews
{
  return -[SiriSharedUIAssistantSuggestionsViewProvider getInitialSuggestionViews](self->suggestionsViewProvider, "getInitialSuggestionViews");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->suggestionsViewProvider, 0);
}

@end
