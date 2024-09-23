@implementation _UIVisualEffectDescriptor

- (_UIVisualEffectDescriptor)init
{
  _UIVisualEffectDescriptor *v2;
  uint64_t v3;
  NSMutableArray *viewEffects;
  uint64_t v5;
  NSMutableArray *filterEntries;
  uint64_t v7;
  NSMutableArray *overlays;
  uint64_t v9;
  NSMutableArray *underlays;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIVisualEffectDescriptor;
  v2 = -[_UIVisualEffectDescriptor init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    viewEffects = v2->_viewEffects;
    v2->_viewEffects = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    filterEntries = v2->_filterEntries;
    v2->_filterEntries = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    overlays = v2->_overlays;
    v2->_overlays = (NSMutableArray *)v7;

    v9 = objc_opt_new();
    underlays = v2->_underlays;
    v2->_underlays = (NSMutableArray *)v9;

  }
  return v2;
}

- (void)uniqueFilterNames
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_filterEntries;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "filterType", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "containsObject:", v10))
          objc_msgSend(v9, "forceUniqueName");
        else
          objc_msgSend(v3, "addObject:", v10);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)textShouldRenderWithTintColor
{
  return self->_textShouldRenderWithTintColor;
}

- (_UIVisualEffectViewParticipating)_identityContainerView
{
  return self->_identityContainerView;
}

- (_UIVisualEffectViewParticipating)_requestedContainerView
{
  return self->_requestedContainerView;
}

- (NSArray)filterEntries
{
  return &self->_filterEntries->super;
}

- (NSArray)underlays
{
  return &self->_underlays->super;
}

- (NSArray)viewEffects
{
  return &self->_viewEffects->super;
}

- (NSArray)overlays
{
  return &self->_overlays->super;
}

- (BOOL)contentViewRequiresClipping
{
  return self->_contentViewRequiresClipping;
}

- (BOOL)allowsVibrancyInContent
{
  return self->_allowsVibrancyInContent;
}

- (BOOL)disableInPlaceFiltering
{
  return self->_disableInPlaceFiltering;
}

- (void)addUnderlay:(id)a3
{
  -[NSMutableArray addObject:](self->_underlays, "addObject:", a3);
}

- (void)addFilterEntry:(id)a3
{
  -[NSMutableArray addObject:](self->_filterEntries, "addObject:", a3);
}

- (void)setDisableInPlaceFiltering:(BOOL)a3
{
  self->_disableInPlaceFiltering = a3;
}

- (void)setLayerHitTestsAsOpaque:(BOOL)a3
{
  self->_layerHitTestsAsOpaque = a3;
}

- (void)setAllowsVibrancyInContent:(BOOL)a3
{
  self->_allowsVibrancyInContent = a3;
}

- (void)setTextShouldRenderWithTintColor:(BOOL)a3
{
  self->_textShouldRenderWithTintColor = a3;
}

- (void)addViewEffect:(id)a3
{
  -[NSMutableArray addObject:](self->_viewEffects, "addObject:", a3);
}

- (void)addOverlay:(id)a3
{
  -[NSMutableArray addObject:](self->_overlays, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedContainerView, 0);
  objc_storeStrong((id *)&self->_identityContainerView, 0);
  objc_storeStrong((id *)&self->_overlays, 0);
  objc_storeStrong((id *)&self->_underlays, 0);
  objc_storeStrong((id *)&self->_viewEffects, 0);
  objc_storeStrong((id *)&self->_filterEntries, 0);
}

- (BOOL)layerHitTestsAsOpaque
{
  return self->_layerHitTestsAsOpaque;
}

- (void)setContentViewRequiresClipping:(BOOL)a3
{
  self->_contentViewRequiresClipping = a3;
}

- (void)setFilterEntries:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *filterEntries;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  filterEntries = self->_filterEntries;
  self->_filterEntries = v4;

}

- (void)setViewEffects:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *viewEffects;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  viewEffects = self->_viewEffects;
  self->_viewEffects = v4;

}

- (_UIVisualEffectViewParticipating)containerView
{
  return self->_requestedContainerView;
}

- (void)setContainerView:(id)a3
{
  _UIVisualEffectViewParticipating *identityContainerView;
  id v6;

  objc_storeStrong((id *)&self->_requestedContainerView, a3);
  v6 = a3;
  identityContainerView = self->_identityContainerView;
  self->_identityContainerView = 0;

}

- (void)setUnderlays:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *underlays;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  underlays = self->_underlays;
  self->_underlays = v4;

}

- (void)setOverlays:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *overlays;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  overlays = self->_overlays;
  self->_overlays = v4;

}

- (id)copyForTransitionToDescriptor:(id)a3
{
  id v4;
  _UIVisualEffectDescriptor *v5;
  _UIVisualEffectDifferenceEngine *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _UIVisualEffectAlphaEntry *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *filterEntries;
  void *v18;
  void *v19;
  NSMutableArray *viewEffects;
  _UIVisualEffectAlphaEntry *v21;
  void *v22;
  NSMutableArray *underlays;
  void *v24;
  void *v25;
  NSMutableArray *overlays;
  void *v27;
  void *v28;

  v4 = a3;
  v5 = objc_alloc_init(_UIVisualEffectDescriptor);
  v6 = objc_alloc_init(_UIVisualEffectDifferenceEngine);
  -[_UIVisualEffectDescriptor set_identityContainerView:](v5, "set_identityContainerView:", self->_requestedContainerView);
  objc_msgSend(v4, "_requestedContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDescriptor set_requestedContainerView:](v5, "set_requestedContainerView:", v7);

  -[_UIVisualEffectDescriptor setTextShouldRenderWithTintColor:](v5, "setTextShouldRenderWithTintColor:", objc_msgSend(v4, "textShouldRenderWithTintColor"));
  -[_UIVisualEffectDescriptor setAllowsVibrancyInContent:](v5, "setAllowsVibrancyInContent:", objc_msgSend(v4, "allowsVibrancyInContent"));
  if (self->_disableInPlaceFiltering)
    v8 = 1;
  else
    v8 = objc_msgSend(v4, "disableInPlaceFiltering");
  -[_UIVisualEffectDescriptor setDisableInPlaceFiltering:](v5, "setDisableInPlaceFiltering:", v8);
  if (!self->_requestAlphaTransition)
  {
    if (!objc_msgSend(v4, "requestAlphaTransition")
      || -[NSMutableArray count](self->_filterEntries, "count")
      || -[NSMutableArray count](self->_viewEffects, "count"))
    {
      goto LABEL_12;
    }
    -[_UIVisualEffectDescriptor setAlphaTransition:](v5, "setAlphaTransition:", 1);
    objc_msgSend(v4, "filterEntries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectDescriptor setFilterEntries:](v5, "setFilterEntries:", v10);

    objc_msgSend(v4, "viewEffects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIVisualEffectDescriptor setViewEffects:](v5, "setViewEffects:", v11);

    v12 = [_UIVisualEffectAlphaEntry alloc];
    v13 = 0.0;
    v14 = 1.0;
    goto LABEL_15;
  }
  objc_msgSend(v4, "filterEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(v4, "viewEffects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
      goto LABEL_12;
    -[_UIVisualEffectDescriptor setAlphaTransition:](v5, "setAlphaTransition:", 2);
    -[_UIVisualEffectDescriptor setFilterEntries:](v5, "setFilterEntries:", self->_filterEntries);
    -[_UIVisualEffectDescriptor setViewEffects:](v5, "setViewEffects:", self->_viewEffects);
    v12 = [_UIVisualEffectAlphaEntry alloc];
    v13 = 1.0;
    v14 = 0.0;
LABEL_15:
    v21 = -[_UIVisualEffectAlphaEntry initWithInitialAlpha:finalAlpha:](v12, "initWithInitialAlpha:finalAlpha:", v13, v14);
    -[_UIVisualEffectDescriptor addViewEffect:](v5, "addViewEffect:", v21);
    goto LABEL_13;
  }

LABEL_12:
  -[_UIVisualEffectDescriptor setAlphaTransition:](v5, "setAlphaTransition:", 0);
  filterEntries = self->_filterEntries;
  objc_msgSend(v4, "filterEntries");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDifferenceEngine mergeSource:andDestination:](v6, "mergeSource:andDestination:", filterEntries, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDescriptor setFilterEntries:](v5, "setFilterEntries:", v19);

  viewEffects = self->_viewEffects;
  objc_msgSend(v4, "viewEffects");
  v21 = (_UIVisualEffectAlphaEntry *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDifferenceEngine mergeSource:andDestination:](v6, "mergeSource:andDestination:", viewEffects, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDescriptor setViewEffects:](v5, "setViewEffects:", v22);

LABEL_13:
  underlays = self->_underlays;
  objc_msgSend(v4, "underlays");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDifferenceEngine mergeSource:andDestination:](v6, "mergeSource:andDestination:", underlays, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDescriptor setUnderlays:](v5, "setUnderlays:", v25);

  overlays = self->_overlays;
  objc_msgSend(v4, "overlays");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDifferenceEngine mergeSource:andDestination:](v6, "mergeSource:andDestination:", overlays, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIVisualEffectDescriptor setOverlays:](v5, "setOverlays:", v28);

  return v5;
}

+ (id)newTransitionDescriptorForStops:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 == 2)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "copyForTransitionToDescriptor:", v9);

  }
  else if (v6 == 1)
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIVisualEffectModel.m"), 702, CFSTR("We don't handle this yet, sorry"));

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p>:"), v5, self);

  if (self->_textShouldRenderWithTintColor)
    objc_msgSend(v6, "appendString:", CFSTR(" textShouldRenderWithTintColor"));
  if (self->_allowsVibrancyInContent)
    objc_msgSend(v6, "appendString:", CFSTR(" allowsVibrancyInContent"));
  if (self->_disableInPlaceFiltering)
    objc_msgSend(v6, "appendString:", CFSTR(" disableInPlaceFiltering"));
  _UIFilterEntryAppendArrayDescription(v6, CFSTR("filters"), self->_filterEntries);
  _UIFilterEntryAppendArrayDescription(v6, CFSTR("viewEffects"), self->_viewEffects);
  _UIFilterEntryAppendArrayDescription(v6, CFSTR("underlays"), self->_underlays);
  _UIFilterEntryAppendArrayDescription(v6, CFSTR("overlays"), self->_overlays);
  return v6;
}

- (void)set_identityContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_identityContainerView, a3);
}

- (void)set_requestedContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_requestedContainerView, a3);
}

- (BOOL)requestAlphaTransition
{
  return self->_requestAlphaTransition;
}

- (void)setRequestAlphaTransition:(BOOL)a3
{
  self->_requestAlphaTransition = a3;
}

- (int64_t)alphaTransition
{
  return self->_alphaTransition;
}

- (void)setAlphaTransition:(int64_t)a3
{
  self->_alphaTransition = a3;
}

@end
