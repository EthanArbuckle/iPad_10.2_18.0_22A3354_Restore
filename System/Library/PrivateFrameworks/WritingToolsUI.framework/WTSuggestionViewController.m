@implementation WTSuggestionViewController

- (WTSuggestionViewController)initWithSuggestion:(id)a3 inContextWithUUID:(id)a4 inSession:(id)a5
{
  id v9;
  id v10;
  id v11;
  WTSuggestionViewController *v12;
  WTSuggestionViewController *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WTSuggestionViewController;
  v12 = -[WTSuggestionViewController init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_suggestion, a3);
    objc_msgSend(v11, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSuggestionViewController _setupSceneHostingWithSessionUUID:contextUUID:suggestionUUID:](v13, "_setupSceneHostingWithSessionUUID:contextUUID:suggestionUUID:", v14, v10, v15);

  }
  return v13;
}

- (void)invalidateConnection
{
  id v2;

  -[WTSuggestionViewController hostingController](self, "hostingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_msgSend(a3, "preferredContentSize");
  -[WTSuggestionViewController setPreferredContentSize:](self, "setPreferredContentSize:", 300.0);
}

- (void)_setupSceneHostingWithSessionUUID:(id)a3 contextUUID:(id)a4 suggestionUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _TtC14WritingToolsUI16WTStartupOptions *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  WTUISceneHostingActivationController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _TtC14WritingToolsUI16WTStartupOptions *v43;
  void *v44;
  id v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WTSuggestionViewController hostingController](self, "hostingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[WTSuggestionViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_3, 3.0);
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.WritingToolsUIService"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    -[WTStartupOptions setSessionUUID:](v12, "setSessionUUID:", v8);
    -[WTStartupOptions setSuggestionUUID:](v12, "setSuggestionUUID:", v10);
    v43 = v12;
    -[WTStartupOptions setContextUUID:](v12, "setContextUUID:", v9);
    v13 = objc_alloc(MEMORY[0x24BEBDCF8]);
    v45 = v9;
    v14 = objc_alloc_init(MEMORY[0x24BEBDD10]);
    v15 = (void *)objc_msgSend(v13, "initWithProcessIdentity:sceneSpecification:", v44, v14);
    -[WTSuggestionViewController setHostingController:](self, "setHostingController:", v15);

    -[WTSuggestionViewController hostingController](self, "hostingController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_eventDeferringComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMaintainHostFirstResponderWhenClientWantsKeyboard:", 1);

    -[WTStartupOptions asBSActionAndReturnError:](v12, "asBSActionAndReturnError:", 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[WTUISceneHostingActivationController initWithStartupAction:invalidationHandler:]([WTUISceneHostingActivationController alloc], "initWithStartupAction:invalidationHandler:", v42, 0);
    -[WTSuggestionViewController hostingController](self, "hostingController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActivationController:", v18);

    -[WTSuggestionViewController hostingController](self, "hostingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[WTSuggestionViewController hostingController](self, "hostingController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sceneViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v22;
    -[WTSuggestionViewController addChildViewController:](self, "addChildViewController:", v22);
    objc_msgSend(v22, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSuggestionViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v23);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v35 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v23, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v38;
    objc_msgSend(v23, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v34;
    objc_msgSend(v23, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v25;
    objc_msgSend(v23, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = v10;
    v29 = v8;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v31);

    v8 = v29;
    v10 = v28;

    v9 = v45;
    objc_msgSend(v41, "didMoveToParentViewController:", self);

  }
}

uint64_t __91__WTSuggestionViewController__setupSceneHostingWithSessionUUID_contextUUID_suggestionUUID___block_invoke()
{
  return 0;
}

- (WTTextSuggestion)suggestion
{
  return (WTTextSuggestion *)objc_getProperty(self, a2, 968, 1);
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
