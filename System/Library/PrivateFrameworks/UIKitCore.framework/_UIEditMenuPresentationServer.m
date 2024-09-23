@implementation _UIEditMenuPresentationServer

+ (id)sharedPresentationServer
{
  if (_MergedGlobals_1213 != -1)
    dispatch_once(&_MergedGlobals_1213, &__block_literal_global_479);
  return (id)qword_1ECD80280;
}

- (_UIEditMenuPresentationServer)init
{
  _UIEditMenuPresentationServer *v2;
  uint64_t v3;
  NSMutableDictionary *configurations;
  uint64_t v5;
  NSMutableDictionary *presentations;
  uint64_t v7;
  NSMutableDictionary *connections;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIEditMenuPresentationServer;
  v2 = -[_UIEditMenuPresentationServer init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    configurations = v2->_configurations;
    v2->_configurations = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    presentations = v2->_presentations;
    v2->_presentations = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableDictionary *)v7;

    +[UIEditMenuInteraction _registerPlatformMetrics]();
  }
  return v2;
}

- (void)presentEditMenuWithConfiguration:(id)a3 originContext:(id)a4 inDisplayDelegate:(id)a5 forConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _UIEditMenuOverlayUIServerPresentation *v16;
  void *v17;
  void *v18;
  _UIEditMenuOverlayUIServerPresentation *v19;
  void *v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "identifier");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuPresentationServer configurations](self, "configurations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v13, v21);

  -[_UIEditMenuPresentationServer connections](self, "connections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v10, v21);

  v16 = [_UIEditMenuOverlayUIServerPresentation alloc];
  objc_msgSend(v11, "rootViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_UIEditMenuPresentation initWithDelegate:sourceView:](v16, "initWithDelegate:sourceView:", self, v18);

  -[_UIEditMenuPresentation setEnforcesMenuControllerLifecycle:](v19, "setEnforcesMenuControllerLifecycle:", objc_msgSend(v13, "enforcesMenuControllerLifecycle"));
  -[_UIEditMenuOverlayUIServerPresentation displayMenuForConfiguration:originContext:inDisplayDelegate:](v19, "displayMenuForConfiguration:originContext:inDisplayDelegate:", v13, v12, v11);

  -[_UIEditMenuPresentationServer presentations](self, "presentations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v19, v21);

}

- (void)dismissEditMenuForIdentifier:(id)a3 hideReason:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[_UIEditMenuPresentationServer presentations](self, "presentations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hideMenuWithReason:", a4);
}

- (void)replaceEditMenuForIdentifier:(id)a3 updatedMenu:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a4;
  v9 = a3;
  -[_UIEditMenuPresentationServer presentations](self, "presentations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "replaceVisibleMenuWithMenu:reason:", v8, a5);
}

- (void)updateUserInterfaceStyleForMenuWithIdentifier:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[_UIEditMenuPresentationServer presentations](self, "presentations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setUserInterfaceStyle:", a4);
}

- (void)_sendLifecycleEvent:(int64_t)a3 forMenuWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _UIOEditMenuLifecycleEventUpdateAction *v9;

  v6 = a4;
  v9 = -[_UIOEditMenuLifecycleEventUpdateAction initWithMenuIdentifier:event:]([_UIOEditMenuLifecycleEventUpdateAction alloc], "initWithMenuIdentifier:event:", v6, a3);
  -[_UIEditMenuPresentationServer connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sendAction:", v9);
}

- (void)_editMenuPresentation:(id)a3 didSelectMenuLeaf:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "presentationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIEditMenuPresentationServer connections](self, "connections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v8;
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke;
  aBlock[3] = &unk_1E16E06D0;
  v16 = v9;
  v26 = v16;
  v17 = v13;
  v25 = v17;
  v18 = _Block_copy(aBlock);
  if (objc_msgSend(v14, "_acceptBoolMenuVisit:commandVisit:actionVisit:", 0, &__block_literal_global_110_4, &__block_literal_global_113_1))
  {
    +[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "pid");
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_4;
    v21[3] = &unk_1E16E06F8;
    v23 = v18;
    v22 = v14;
    objc_msgSend(v19, "_requestSecurePasteAuthenticationMessageWithContext:forClientVersionedPID:completionBlock:", 0x51A2F5DDCA075EA1, v20, v21);

  }
  else
  {
    (*((void (**)(void *, id, _QWORD))v18 + 2))(v18, v14, 0);
  }

}

- (void)_editMenuPresentation:(id)a3 preparedMenuForDisplay:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIOMenuPreparationAction *v14;
  id v15;
  _UIOMenuPreparationAction *v16;
  _QWORD v17[4];
  id v18;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "presentationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIEditMenuPresentationServer connections](self, "connections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [_UIOMenuPreparationAction alloc];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke;
  v17[3] = &unk_1E16E0720;
  v18 = v8;
  v15 = v8;
  v16 = -[_UIOMenuPreparationAction initWithMenu:responseHandler:](v14, "initWithMenu:responseHandler:", v9, v17);

  objc_msgSend(v13, "sendAction:", v16);
}

- (id)_editMenuPresentation:(id)a3 titleViewForMenu:(id)a4 configuration:(id)a5
{
  return 0;
}

- (CGRect)_editMenuPresentation:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  CGRect result;

  v6 = a3;
  objc_msgSend(v6, "presentationConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIEditMenuPresentationServer.m"), 163, CFSTR("Cannot present a menu without a presentation configuration"));

  }
  objc_msgSend(v6, "originContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "translatedReferencePointForDestinationView:", v9);
  v11 = v10;
  v13 = v12;

  objc_msgSend(v7, "sourceRect");
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_editMenuPresentation:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  objc_msgSend(a3, "presentationConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIEditMenuPresentationServer _sendLifecycleEvent:forMenuWithIdentifier:](self, "_sendLifecycleEvent:forMenuWithIdentifier:", 0, v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96___UIEditMenuPresentationServer__editMenuPresentation_willPresentMenuForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v7, "addCompletion:", v11);

}

- (void)_editMenuPresentation:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v7 = a5;
  objc_msgSend(a3, "presentationConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIEditMenuPresentationServer _sendLifecycleEvent:forMenuWithIdentifier:](self, "_sendLifecycleEvent:forMenuWithIdentifier:", 2, v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96___UIEditMenuPresentationServer__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke;
  v11[3] = &unk_1E16B1B50;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v7, "addCompletion:", v11);

}

- (NSMutableDictionary)configurations
{
  return self->_configurations;
}

- (void)setConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_configurations, a3);
}

- (NSMutableDictionary)presentations
{
  return self->_presentations;
}

- (void)setPresentations:(id)a3
{
  objc_storeStrong((id *)&self->_presentations, a3);
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_presentations, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
