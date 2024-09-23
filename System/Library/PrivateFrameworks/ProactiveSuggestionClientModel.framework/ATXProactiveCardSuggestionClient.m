@implementation ATXProactiveCardSuggestionClient

- (ATXProactiveCardSuggestionClient)initWithSourceId:(id)a3
{
  id v4;
  ATXProactiveCardSuggestionClient *v5;
  ATXProactiveSuggestionClientModel *v6;
  ATXProactiveSuggestionClientModel *clientModel;
  uint64_t v8;
  NSString *sourceId;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXProactiveCardSuggestionClient;
  v5 = -[ATXProactiveCardSuggestionClient init](&v11, sel_init);
  if (v5)
  {
    v6 = -[ATXProactiveSuggestionClientModel initWithClientModelId:requestDelegate:]([ATXProactiveSuggestionClientModel alloc], "initWithClientModelId:requestDelegate:", v4, 0);
    clientModel = v5->_clientModel;
    v5->_clientModel = v6;

    v8 = objc_msgSend(v4, "copy");
    sourceId = v5->_sourceId;
    v5->_sourceId = (NSString *)v8;

  }
  return v5;
}

- (void)updateSuggestions:(id)a3
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:](self->_clientModel, "updateSuggestions:", a3);
}

- (void)updateSuggestions:(id)a3 completionHandler:(id)a4
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:completionHandler:](self->_clientModel, "updateSuggestions:completionHandler:", a3, a4);
}

- (void)clearSuggestions
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:](self->_clientModel, "updateSuggestions:", MEMORY[0x1E0C9AA60]);
}

- (void)clearSuggestionsWithCompletionHandler:(id)a3
{
  -[ATXProactiveSuggestionClientModel updateSuggestions:completionHandler:](self->_clientModel, "updateSuggestions:completionHandler:", MEMORY[0x1E0C9AA60], a3);
}

- (void)retrieveCurrentSuggestionsWithReply:(id)a3
{
  -[ATXProactiveSuggestionClientModel retrieveCurrentSuggestionsWithReply:](self->_clientModel, "retrieveCurrentSuggestionsWithReply:", a3);
}

- (id)createSuggestionWithAppBundleIdentifier:(id)a3 widgetBundleIdentifier:(id)a4 widgetKind:(id)a5 criterion:(id)a6 applicableLayouts:(unint64_t)a7 suggestionIdentifier:(id)a8 startDate:(id)a9 endDate:(id)a10 intent:(id)a11 metadata:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  ATXInfoSuggestion *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v36;
  id v38;

  v38 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = a12;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 3600.0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  INIntentWithTypedIntent();
  v34 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v23;
  v25 = v38;
  v33 = v23;
  v26 = v16;
  v27 = -[ATXInfoSuggestion initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:]([ATXInfoSuggestion alloc], "initWithAppBundleIdentifier:widgetBundleIdentifier:widgetKind:criterion:applicableLayouts:suggestionIdentifier:startDate:endDate:intent:metadata:relevanceScore:", v38, v16, v17, v18, a7, v19, v20, v21, v24, v32, 0);
  -[ATXInfoSuggestion setSourceIdentifier:](v27, "setSourceIdentifier:", self->_sourceId);
  v36 = v17;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXInfoSuggestion setSuggestionIdentifier:](v27, "setSuggestionIdentifier:", v29);

    v25 = v38;
  }
  +[ATXInfoSuggestion proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:](ATXInfoSuggestion, "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", v27, self->_sourceId, CFSTR("0.1.0"), 0, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_clientModel, 0);
}

@end
