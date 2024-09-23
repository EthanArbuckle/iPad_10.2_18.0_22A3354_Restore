@implementation WTSmartReplyQuestionnaireViewController

- (WTSmartReplyQuestionnaireViewController)initWithSessionUUID:(id)a3
{
  id v4;
  WTSmartReplyQuestionnaireViewController *v5;
  WTSmartReplyQuestionnaireViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WTSmartReplyQuestionnaireViewController;
  v5 = -[WTSmartReplyQuestionnaireViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[WTSmartReplyQuestionnaireViewController _setupSceneHostingWithSessionUUID:](v5, "_setupSceneHostingWithSessionUUID:", v4);

  return v6;
}

- (void)invalidateConnection
{
  id v2;

  -[WTSmartReplyQuestionnaireViewController hostingController](self, "hostingController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_msgSend(a3, "preferredContentSize");
  -[WTSmartReplyQuestionnaireViewController setPreferredContentSize:](self, "setPreferredContentSize:", 300.0);
}

- (void)_setupSceneHostingWithSessionUUID:(id)a3
{
  id v4;
  void *v5;
  _TtC14WritingToolsUI16WTStartupOptions *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  WTUISceneHostingActivationController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _TtC14WritingToolsUI16WTStartupOptions *v35;
  void *v36;
  id v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WTSmartReplyQuestionnaireViewController hostingController](self, "hostingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[WTSmartReplyQuestionnaireViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_4, 3.0);
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.WritingToolsUIService"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    -[WTStartupOptions setSessionUUID:](v6, "setSessionUUID:", v4);
    v35 = v6;
    -[WTStartupOptions setIsQuestionnairePopover:](v6, "setIsQuestionnairePopover:", 1);
    v7 = objc_alloc(MEMORY[0x24BEBDCF8]);
    v37 = v4;
    v8 = objc_alloc_init(MEMORY[0x24BEBDD10]);
    v9 = (void *)objc_msgSend(v7, "initWithProcessIdentity:sceneSpecification:", v36, v8);
    -[WTSmartReplyQuestionnaireViewController setHostingController:](self, "setHostingController:", v9);

    -[WTSmartReplyQuestionnaireViewController hostingController](self, "hostingController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_eventDeferringComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaintainHostFirstResponderWhenClientWantsKeyboard:", 1);

    -[WTStartupOptions asBSActionAndReturnError:](v6, "asBSActionAndReturnError:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WTUISceneHostingActivationController initWithStartupAction:invalidationHandler:]([WTUISceneHostingActivationController alloc], "initWithStartupAction:invalidationHandler:", v34, 0);
    -[WTSmartReplyQuestionnaireViewController hostingController](self, "hostingController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActivationController:", v12);

    -[WTSmartReplyQuestionnaireViewController hostingController](self, "hostingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);

    -[WTSmartReplyQuestionnaireViewController hostingController](self, "hostingController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sceneViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v16;
    -[WTSmartReplyQuestionnaireViewController addChildViewController:](self, "addChildViewController:", v16);
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSmartReplyQuestionnaireViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v17);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v17, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v30;
    objc_msgSend(v17, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v26;
    objc_msgSend(v17, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v21;
    objc_msgSend(v17, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v25);

    v4 = v37;
    objc_msgSend(v33, "didMoveToParentViewController:", self);

  }
}

uint64_t __77__WTSmartReplyQuestionnaireViewController__setupSceneHostingWithSessionUUID___block_invoke()
{
  return 0;
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
}

@end
