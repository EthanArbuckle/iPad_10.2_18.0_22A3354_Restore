@implementation SearchUIFocusModeBiomeEvent

+ (BOOL)supportsEvent:(id)a3 contextualAction:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SearchUIFocusModeBiomeEvent)initWithEvent:(id)a3 contextualAction:(id)a4
{
  id v6;
  id v7;
  SearchUIFocusModeBiomeEvent *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIFocusModeBiomeEvent;
  v8 = -[BMEventBase init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "focusMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIFocusModeBiomeEvent setObservedFocusModeIdentifier:](v8, "setObservedFocusModeIdentifier:", v10);

    -[SearchUIBiomeEvent setBiomeEvent:](v8, "setBiomeEvent:", v6);
  }

  return v8;
}

- (void)getEnabledStatusWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, uint64_t);

  v9 = (void (**)(id, uint64_t))a3;
  -[SearchUIBiomeEvent biomeEvent](self, "biomeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SearchUIBiomeEvent biomeEvent](self, "biomeEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "semanticModeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIFocusModeBiomeEvent observedFocusModeIdentifier](self, "observedFocusModeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
    {
      -[SearchUIBiomeEvent biomeEvent](self, "biomeEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, objc_msgSend(v8, "starting"));

    }
    else
    {
      v9[2](v9, 0);
    }

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (NSString)observedFocusModeIdentifier
{
  return self->_observedFocusModeIdentifier;
}

- (void)setObservedFocusModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_observedFocusModeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedFocusModeIdentifier, 0);
}

@end
