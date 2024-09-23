@implementation _TUIRenderReferenceCollector

- (_TUIRenderReferenceCollector)initWithViewState:(id)a3
{
  id v4;
  _TUIRenderReferenceCollector *v5;
  TUIViewState *v6;
  TUIViewState *viewState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIRenderReferenceCollector;
  v5 = -[_TUIRenderReferenceCollector init](&v9, "init");
  if (v5)
  {
    v6 = (TUIViewState *)objc_msgSend(v4, "copy");
    viewState = v5->_viewState;
    v5->_viewState = v6;

  }
  return v5;
}

- (id)viewStateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_identifierUUID"));
  if (v5)
    goto LABEL_4;
  if (self->_sectionUUID)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tui_identifierByPrependingUUID:"));
    v5 = v4;
    v4 = (id)v6;
LABEL_4:

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIViewState viewStateForIdentifier:](self->_viewState, "viewStateForIdentifier:", v4));

  return v7;
}

- (void)appendReference:(id)a3 withIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *collectedReferences;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableArray *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && v6)
  {
    collectedReferences = self->_collectedReferences;
    if (!collectedReferences)
    {
      v8 = objc_opt_new(NSMutableDictionary);
      v9 = self->_collectedReferences;
      self->_collectedReferences = v8;

      collectedReferences = self->_collectedReferences;
    }
    v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](collectedReferences, "objectForKeyedSubscript:", v6));
    if (!v10)
    {
      v10 = objc_opt_new(NSMutableArray);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_collectedReferences, "setObject:forKeyedSubscript:", v10, v6);
    }
    -[NSMutableArray addObject:](v10, "addObject:", v11);

  }
}

- (id)renderReferences
{
  return self->_collectedReferences;
}

- (NSUUID)sectionUUID
{
  return self->_sectionUUID;
}

- (void)setSectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (TUIViewState)viewState
{
  return self->_viewState;
}

- (NSMutableDictionary)collectedReferences
{
  return self->_collectedReferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedReferences, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_sectionUUID, 0);
}

@end
