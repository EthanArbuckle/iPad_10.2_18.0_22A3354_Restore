@implementation WTWritingToolsViewController

- (WTWritingToolsViewController)initWithRequestedTool:(id)a3
{
  return -[WTWritingToolsViewController initWithRequestedTool:prompt:](self, "initWithRequestedTool:prompt:", a3, 0);
}

- (WTWritingToolsViewController)initWithRequestedTool:(id)a3 prompt:(id)a4
{
  return -[WTWritingToolsViewController initWithRequestedTool:prompt:smartReplyConfiguration:](self, "initWithRequestedTool:prompt:smartReplyConfiguration:", a3, a4, 0);
}

- (WTWritingToolsViewController)initWithRequestedTool:(id)a3 inputContextHistory:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  WTWritingToolsViewController *v10;

  v6 = (objc_class *)MEMORY[0x24BEC6278];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithInputContextHistory:", v7);

  v10 = -[WTWritingToolsViewController initWithRequestedTool:prompt:smartReplyConfiguration:](self, "initWithRequestedTool:prompt:smartReplyConfiguration:", v8, 0, v9);
  return v10;
}

- (WTWritingToolsViewController)initWithRequestedTool:(id)a3 smartReplyConfiguration:(id)a4
{
  return -[WTWritingToolsViewController initWithRequestedTool:prompt:smartReplyConfiguration:](self, "initWithRequestedTool:prompt:smartReplyConfiguration:", a3, 0, a4);
}

- (id)_initWithRequestedTool:(id)a3 baseResponse:(id)a4 entryPoint:(id)a5 inputContextHistory:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  WTWritingToolsViewController *v16;

  v10 = (objc_class *)MEMORY[0x24BEC6278];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v10 alloc], "initWithInputContextHistory:", v11);

  objc_msgSend(v15, "setBaseResponse:", v13);
  objc_msgSend(v15, "setEntryPoint:", v12);

  v16 = -[WTWritingToolsViewController initWithRequestedTool:smartReplyConfiguration:](self, "initWithRequestedTool:smartReplyConfiguration:", v14, v15);
  return v16;
}

- (WTWritingToolsViewController)initWithRequestedTool:(id)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  WTWritingToolsViewController *v15;
  _QWORD v17[13];
  _QWORD v18[14];

  v18[13] = *MEMORY[0x24BDAC8D0];
  v17[0] = CFSTR("WTUIRequestedToolNone");
  v17[1] = CFSTR("WTUIRequestedToolProofreading");
  v18[0] = &unk_251C0F558;
  v18[1] = &unk_251C0F570;
  v17[2] = CFSTR("WTUIRequestedToolRewriting");
  v17[3] = CFSTR("WTUIRequestedToolRewriteProofread");
  v18[2] = &unk_251C0F588;
  v18[3] = &unk_251C0F5A0;
  v17[4] = CFSTR("WTUIRequestedToolSmartReply");
  v17[5] = CFSTR("WTUIRequestedToolRewriteFriendly");
  v18[4] = &unk_251C0F5B8;
  v18[5] = &unk_251C0F5D0;
  v17[6] = CFSTR("WTUIRequestedToolRewriteProfessional");
  v17[7] = CFSTR("WTUIRequestedToolRewriteConcise");
  v18[6] = &unk_251C0F5E8;
  v18[7] = &unk_251C0F600;
  v17[8] = CFSTR("WTUIRequestedToolRewriteOpenEnded");
  v17[9] = CFSTR("WTUIRequestedToolSummary");
  v18[8] = &unk_251C0F618;
  v18[9] = &unk_251C0F630;
  v17[10] = CFSTR("WTUIRequestedToolTransformKeyPoints");
  v17[11] = CFSTR("WTUIRequestedToolTransformList");
  v18[10] = &unk_251C0F648;
  v18[11] = &unk_251C0F660;
  v17[12] = CFSTR("WTUIRequestedToolTransformTable");
  v18[12] = &unk_251C0F678;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v18, v17, 13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "integerValue");
  v15 = -[WTWritingToolsViewController initWithTool:prompt:smartReplyConfiguration:](self, "initWithTool:prompt:smartReplyConfiguration:", v14, v10, v9);

  return v15;
}

- (WTWritingToolsViewController)initWithTool:(int64_t)a3 prompt:(id)a4
{
  return -[WTWritingToolsViewController initWithTool:prompt:smartReplyConfiguration:](self, "initWithTool:prompt:smartReplyConfiguration:", a3, a4, 0);
}

- (WTWritingToolsViewController)initWithTool:(int64_t)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5
{
  id v9;
  id v10;
  WTWritingToolsViewController *v11;
  WTWritingToolsViewController *v12;
  void *v13;
  objc_class *v14;
  UIWTInputViewSetPlacementController_Staging *v15;
  UIWTInputViewSetPlacementController_Staging *ivsPlacementController;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WTWritingToolsViewController;
  v11 = -[WTWritingToolsViewController init](&v20, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_requestedTool = a3;
    objc_storeStrong((id *)&v11->_prompt, a4);
    objc_storeStrong((id *)&v12->_smartReplyConfig, a5);
    -[WTWritingToolsViewController setModalPresentationStyle:](v12, "setModalPresentationStyle:", 7);
    -[WTWritingToolsViewController presentationController](v12, "presentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", v12);

    v14 = NSClassFromString(CFSTR("UIWTInputViewSetPlacementController"));
    if (v14)
    {
      v15 = (UIWTInputViewSetPlacementController_Staging *)objc_alloc_init(v14);
      ivsPlacementController = v12->_ivsPlacementController;
      v12->_ivsPlacementController = v15;

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel__dismissalTransitionWillBegin_, *MEMORY[0x24BEBE630], v12);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v12, sel__dismissalTransitionDidEnd_, *MEMORY[0x24BEBE628], v12);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE640], self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEBE638], self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBE630], self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BEBE628], self);

  v7.receiver = self;
  v7.super_class = (Class)WTWritingToolsViewController;
  -[WTWritingToolsViewController dealloc](&v7, sel_dealloc);
}

+ (BOOL)iPadOSAlternateQuestionnaireEnabled
{
  return _os_feature_enabled_impl();
}

- (void)setSourceResponder:(id)a3 sourceTextInput:(id)a4
{
  BETextInput *v6;
  BETextInput *beTextInput;
  id obj;

  obj = a4;
  objc_storeWeak((id *)&self->_sourceResponder, a3);
  objc_storeWeak((id *)&self->_sourceTextInput, obj);
  if (objc_msgSend(obj, "conformsToProtocol:", &unk_25797A498))
    v6 = (BETextInput *)obj;
  else
    v6 = 0;
  beTextInput = self->_beTextInput;
  self->_beTextInput = v6;

}

- (void)startWritingTools
{
  NSObject *v3;
  WTAnalyticsDelegate *v4;
  _BOOL8 v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_DEFAULT, "startWritingTools", (uint8_t *)&v14, 2u);
  }

  v4 = objc_alloc_init(WTAnalyticsDelegate);
  -[WTWritingToolsViewController setAnalyticsDelegate:](self, "setAnalyticsDelegate:", v4);

  v5 = -[WTWritingToolsViewController requestedTool](self, "requestedTool") != 0;
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFromCandidateBar:", v5);

  -[WTWritingToolsViewController setIsWritingToolsActive:](self, "setIsWritingToolsActive:", 1);
  objc_msgSend(MEMORY[0x24BEBD6C8], "sizeForInterfaceOrientation:", 1);
  -[WTWritingToolsViewController setWTWritingToolsSmallDetentKeyboardHeight:](self, "setWTWritingToolsSmallDetentKeyboardHeight:", v7);
  _WTVCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[WTWritingToolsViewController WTWritingToolsSmallDetentKeyboardHeight](self, "WTWritingToolsSmallDetentKeyboardHeight");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_24A7CB000, v8, OS_LOG_TYPE_DEFAULT, "startWritingTools Setting SmallDetentKeyboardHeight %@", (uint8_t *)&v14, 0xCu);

  }
  v11 = -[WTWritingToolsViewController requestedTool](self, "requestedTool");
  -[WTWritingToolsViewController prompt](self, "prompt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController smartReplyConfig](self, "smartReplyConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController _setupSceneHostingWithRequestedTool:prompt:smartReplyConfiguration:](self, "_setupSceneHostingWithRequestedTool:prompt:smartReplyConfiguration:", v11, v12, v13);

  -[WTWritingToolsViewController _updateSourceView](self, "_updateSourceView");
  -[WTWritingToolsViewController setRequestedTool:](self, "setRequestedTool:", 0);
}

- (void)endWritingTools
{
  -[WTWritingToolsViewController endWritingToolsWithError:](self, "endWritingToolsWithError:", 0);
}

- (void)endWritingToolsWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t v19[16];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_DEFAULT, "endWritingToolsWithError %@", buf, 0xCu);
  }

  if (-[WTWritingToolsViewController _proofreadingSessionActive](self, "_proofreadingSessionActive"))
  {
    -[WTWritingToolsViewController session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController didEndWritingToolsSession:accepted:](self, "didEndWritingToolsSession:accepted:", v6, 1);
  }
  else
  {
    if (!-[WTWritingToolsViewController _rewritingSessionActive](self, "_rewritingSessionActive"))
      goto LABEL_8;
    -[WTWritingToolsViewController session](self, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController didEndWritingToolsSession:accepted:](self, "didEndWritingToolsSession:accepted:", v6, 0);
  }

LABEL_8:
  objc_initWeak((id *)buf, self);
  if (-[WTWritingToolsViewController presented](self, "presented"))
  {
    _WTVCLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_24A7CB000, v7, OS_LOG_TYPE_DEFAULT, "dismissViewController for endWritingTools", v19, 2u);
    }

    -[WTWritingToolsViewController presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __57__WTWritingToolsViewController_endWritingToolsWithError___block_invoke;
    v16 = &unk_251C07170;
    v17 = v4;
    objc_copyWeak(&v18, (id *)buf);
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, &v13);

    -[WTWritingToolsViewController setPresentedAsSheet:](self, "setPresentedAsSheet:", 0, v13, v14, v15, v16);
    -[WTWritingToolsViewController setPresented:](self, "setPresented:", 0);
    objc_destroyWeak(&v18);

  }
  else if (v4)
  {
    -[WTWritingToolsViewController presentError:](self, "presentError:", v4);
  }
  objc_msgSend(MEMORY[0x24BEBD700], "activeKeyboardSceneDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeVisibilityObserver:", self);

  -[WTWritingToolsViewController setMinimizedIntoAssistant:](self, "setMinimizedIntoAssistant:", 0);
  -[WTWritingToolsViewController _updateKBSuppression](self, "_updateKBSuppression");
  -[WTWritingToolsViewController _updateInputDashboardViewController](self, "_updateInputDashboardViewController");
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "_writingToolsDidEnd");
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endWritingTools");

  -[WTWritingToolsViewController setAnalyticsDelegate:](self, "setAnalyticsDelegate:", 0);
  -[WTWritingToolsViewController hostingController](self, "hostingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  objc_destroyWeak((id *)buf);
}

void __57__WTWritingToolsViewController_endWritingToolsWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "presentError:", *(_QWORD *)(a1 + 32));

  }
}

- (void)presentError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x24BEBD3B0];
  v5 = a3;
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_251C07D50, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v11);

  -[WTWritingToolsViewController _sourceResponderViewController](self, "_sourceResponderViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)setSuppressWritingToolsForRemoteKeyboard:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet"))
  {
    -[WTWritingToolsViewController setSuppressingSheetForRemoteKeyboardOnScreen:](self, "setSuppressingSheetForRemoteKeyboardOnScreen:", v3);
    -[WTWritingToolsViewController _updateWritingToolsUISuppression](self, "_updateWritingToolsUISuppression");
  }
}

- (id)trailingPredictiveCandidate
{
  void *v3;
  WTProofreadCandidateBarView *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  if (!-[WTWritingToolsViewController _proofreadingSessionActive](self, "_proofreadingSessionActive")
    || !-[WTWritingToolsViewController suppressSheetForKeyboardEditing](self, "suppressSheetForKeyboardEditing"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x24BEB4E20], "candidateWithCandidate:forInput:property:", &stru_251C07D50, &stru_251C07D50, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(WTProofreadCandidateBarView);
  -[WTWritingToolsViewController proofreadingSuggestions](self, "proofreadingSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTProofreadCandidateBarView setSuggestionCount:](v4, "setSuggestionCount:", objc_msgSend(v5, "count"));

  -[WTWritingToolsViewController setProofreadCandidateBarView:](self, "setProofreadCandidateBarView:", v4);
  objc_msgSend(v3, "setCustomView:", v4);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__WTWritingToolsViewController_trailingPredictiveCandidate__block_invoke;
  v7[3] = &unk_251C070A8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v3;
}

void __59__WTWritingToolsViewController_trailingPredictiveCandidate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setSuppressSheetForKeyboardEditing:", 0);

}

- (id)assistantBarButtonItemWithStyle:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  WTWritingToolsViewController *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  if (!-[WTWritingToolsViewController suppressSheetForKeyboardEditing](self, "suppressSheetForKeyboardEditing"))
    return 0;
  -[WTWritingToolsViewController session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  v6 = objc_alloc_init(MEMORY[0x24BEBD410]);
  objc_msgSend(v6, "setIsKeyboardItem:", 1);
  objc_initWeak(&location, self);
  switch(a3)
  {
    case 24:
      if (!-[WTWritingToolsViewController minimizedIntoAssistant](self, "minimizedIntoAssistant"))
      {
        -[WTWritingToolsViewController _assistantProofreadBarButton](self, "_assistantProofreadBarButton");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setCustomView:", v8);
        goto LABEL_13;
      }
      break;
    case 23:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Revert"), &stru_251C07D50, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v8);
      v17 = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __64__WTWritingToolsViewController_assistantBarButtonItemWithStyle___block_invoke_2;
      v20 = &unk_251C07198;
      v12 = &v22;
      objc_copyWeak(&v22, &location);
      v21 = self;
      -[WTWritingToolsViewController _assistantBarButtonCustomViewWithTitle:handler:](self, "_assistantBarButtonCustomViewWithTitle:handler:", v9, &v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCustomView:", v13, v17, v18, v19, v20);
      goto LABEL_11;
    case 22:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_251C07D50, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);
      objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 15.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "length");
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v10, 0, v11);

      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __64__WTWritingToolsViewController_assistantBarButtonItemWithStyle___block_invoke;
      v23[3] = &unk_251C070A8;
      v12 = &v24;
      objc_copyWeak(&v24, &location);
      -[WTWritingToolsViewController _assistantBarButtonCustomViewWithTitle:handler:](self, "_assistantBarButtonCustomViewWithTitle:handler:", v9, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCustomView:", v13);
LABEL_11:

      objc_destroyWeak(v12);
LABEL_13:

      v15 = v6;
      goto LABEL_14;
  }
  v15 = 0;
LABEL_14:
  objc_destroyWeak(&location);

  return v15;
}

void __64__WTWritingToolsViewController_assistantBarButtonItemWithStyle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endWritingTools");

}

void __64__WTWritingToolsViewController_assistantBarButtonItemWithStyle___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "didEndWritingToolsSession:accepted:", v4, 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "endWritingTools");

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)WTWritingToolsViewController;
  -[WTWritingToolsViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  _WTVCLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WTWritingToolsViewController suppressingSheetForRemoteKeyboardOnScreen](self, "suppressingSheetForRemoteKeyboardOnScreen"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WTWritingToolsViewController minimizedIntoUCB](self, "minimizedIntoUCB"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_24A7CB000, v4, OS_LOG_TYPE_DEFAULT, "viewDidDissapear suppressingSheetForRemoteKeyboardOnScreen: %@, minimizedIntoUCB: %@", buf, 0x16u);

  }
  if (!-[WTWritingToolsViewController _isTemporarilyDismissed](self, "_isTemporarilyDismissed"))
    -[WTWritingToolsViewController endWritingTools](self, "endWritingTools");
}

- (void)applicationDidResume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WTWritingToolsViewController;
  -[WTWritingToolsViewController applicationDidResume](&v3, sel_applicationDidResume);
  -[WTWritingToolsViewController _updateKBSuppression](self, "_updateKBSuppression");
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(id *, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _WTVCLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v9;
    _os_log_impl(&dword_24A7CB000, v8, OS_LOG_TYPE_DEFAULT, "willBeginWritingToolsSession: %@", buf, 0xCu);

  }
  objc_msgSend(v6, "setTextViewDelegate:", self);
  objc_initWeak((id *)buf, self);
  v29 = MEMORY[0x24BDAC760];
  v30 = 3221225472;
  v31 = __77__WTWritingToolsViewController_willBeginWritingToolsSession_requestContexts___block_invoke;
  v32 = &unk_251C071E8;
  objc_copyWeak(&v35, (id *)buf);
  v10 = v7;
  v34 = v10;
  v11 = v6;
  v33 = v11;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x24BD1ABE8](&v29);
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate", v29, v30, v31, v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "willBeginWritingToolsSession:requestContexts:", v11, v10);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "willBeginWritingToolsSession:requestContexts:", v11, v12);
  }
  else
  {
    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectedTextRange");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "attributedTextInRange:", v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", &stru_251C07D50);
    }
    else
    {
      -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "selectedTextRange");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "textInRange:", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v25 = &stru_251C07D50;
      if (v24)
        v25 = v24;
      v26 = v25;

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v26);
    }
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC6270]), "initWithAttributedText:range:", v15, 0, objc_msgSend(v15, "length"));
    v36 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v12)[2](v12, v28);

  }
  objc_destroyWeak(&v35);
  objc_destroyWeak((id *)buf);

}

void __77__WTWritingToolsViewController_willBeginWritingToolsSession_requestContexts___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __77__WTWritingToolsViewController_willBeginWritingToolsSession_requestContexts___block_invoke_2;
  v5[3] = &unk_251C071C0;
  objc_copyWeak(&v9, a1 + 6);
  v6 = v3;
  v8 = a1[5];
  v7 = a1[4];
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
}

void __77__WTWritingToolsViewController_willBeginWritingToolsSession_requestContexts___block_invoke_2(uint64_t a1)
{
  WTUIAttributedStringController *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;
  NSRange v40;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = -[WTUIAttributedStringController initWithContexts:]([WTUIAttributedStringController alloc], "initWithContexts:", *(_QWORD *)(a1 + 32));
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setAttributedStringController:", v2);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v6, "setUuidContextMapping:", v5);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = a1;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        _WTVCLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attributedText");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");
          v40.location = objc_msgSend(v11, "range");
          NSStringFromRange(v40);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v33 = v13;
          v34 = 2048;
          v35 = v15;
          v36 = 2112;
          v37 = v16;
          _os_log_impl(&dword_24A7CB000, v12, OS_LOG_TYPE_DEFAULT, "context: %@, length = %lu, range = %@", buf, 0x20u);

        }
        v17 = (void *)objc_msgSend(v11, "copy");
        v18 = objc_loadWeakRetained(v3);
        objc_msgSend(v18, "uuidContextMapping");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, v20);

        v21 = objc_loadWeakRetained(v3);
        objc_msgSend(v21, "attributedStringController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "digestedAttributedStringForContext:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAttributedText:", v23);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(v26 + 48) + 16))();
  v24 = *(_QWORD *)(v26 + 40);
  v25 = objc_loadWeakRetained(v3);
  objc_msgSend(v25, "setSession:", v24);

}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;
  NSRange v51;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _WTVCLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v8;
    _os_log_impl(&dword_24A7CB000, v6, OS_LOG_TYPE_DEFAULT, "didBeginWritingToolsSession: %@", buf, 0xCu);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v40;
    *(_QWORD *)&v10 = 138412802;
    v37 = v10;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        -[WTWritingToolsViewController uuidContextMapping](self, "uuidContextMapping", v37);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "attributedText");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAttributedText:", v18);

        v19 = objc_msgSend(v14, "range");
        v21 = v20;
        -[WTWritingToolsViewController uuidContextMapping](self, "uuidContextMapping");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setRange:", v19, v21);

        _WTVCLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "attributedText");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length");
          v51.location = objc_msgSend(v14, "range");
          NSStringFromRange(v51);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v37;
          v44 = v26;
          v45 = 2048;
          v46 = v28;
          v47 = 2112;
          v48 = v29;
          _os_log_impl(&dword_24A7CB000, v25, OS_LOG_TYPE_DEFAULT, "didBegin, context: %@, length = %lu, range = %@", buf, 0x20u);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v11);
  }

  if (-[WTWritingToolsViewController _proofreadingSessionActive](self, "_proofreadingSessionActive"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController setProofreadingSuggestions:](self, "setProofreadingSuggestions:", v30);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController setUuidSuggestionMapping:](self, "setUuidSuggestionMapping:", v31);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController setContextForSuggestions:](self, "setContextForSuggestions:", v32);

  }
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "didBeginWritingToolsSession:contexts:", v34, obj);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "didBeginWritingToolsSession:contexts:", v36, obj);

}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v8;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_24A7CB000, v6, OS_LOG_TYPE_DEFAULT, "writingToolsSession:didReceiveAction: %@ [action = %ld]", (uint8_t *)&v13, 0x16u);

  }
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writingToolsSession:didReceiveAction:", v10, a4);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writingToolsSession:didReceiveAction:", v12, a4);

}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_24A7CB000, v6, OS_LOG_TYPE_DEFAULT, "didEndWritingToolsSession: %@", (uint8_t *)&v13, 0xCu);

  }
  -[WTWritingToolsViewController _dismissSuggestionViewController](self, "_dismissSuggestionViewController");
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didEndWritingToolsSession:accepted:", v10, v4);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didEndWritingToolsSession:accepted:", v12, v4);

  -[WTWritingToolsViewController setProofreadingSuggestions:](self, "setProofreadingSuggestions:", 0);
  -[WTWritingToolsViewController setUuidSuggestionMapping:](self, "setUuidSuggestionMapping:", 0);
  -[WTWritingToolsViewController setContextForSuggestions:](self, "setContextForSuggestions:", 0);
  -[WTWritingToolsViewController setSession:](self, "setSession:", 0);
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger location;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSUInteger length;
  _BOOL4 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v37 = a7;
  length = a5.length;
  location = a5.location;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  _WTVCLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v44 = v14;
    _os_log_impl(&dword_24A7CB000, v12, OS_LOG_TYPE_DEFAULT, "proofreadingSession:didReceiveSuggestions: %@", buf, 0xCu);

  }
  -[WTWritingToolsViewController uuidContextMapping](self, "uuidContextMapping");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController proofreadingSuggestions](self, "proofreadingSuggestions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObjectsFromArray:", v10);

  -[WTWritingToolsViewController proofreadCandidateBarView](self, "proofreadCandidateBarView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController proofreadingSuggestions](self, "proofreadingSuggestions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSuggestionCount:", objc_msgSend(v20, "count"));

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = v10;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v25);
        -[WTWritingToolsViewController uuidSuggestionMapping](self, "uuidSuggestionMapping", length);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

        objc_msgSend(v17, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WTWritingToolsViewController contextForSuggestions](self, "contextForSuggestions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "uuid");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v29, v31);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v23);
  }

  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v33, v21, location, length, v17, v37);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:", v35, v21, location, length, v17, v37);

}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  _WTVCLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v13;
    _os_log_impl(&dword_24A7CB000, v11, OS_LOG_TYPE_DEFAULT, "proofreadingSession:didUpdateState: %@", (uint8_t *)&v25, 0xCu);

  }
  -[WTWritingToolsViewController uuidContextMapping](self, "uuidContextMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController uuidSuggestionMapping](self, "uuidSuggestionMapping");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setState:", a4);

  -[WTWritingToolsViewController popoverSuggestionUUID](self, "popoverSuggestionUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v9, "isEqual:", v19);

  if (a4 != 1 && v20)
  {
    -[WTWritingToolsViewController setPopoverSuggestionUUID:](self, "setPopoverSuggestionUUID:", 0);
    -[WTWritingToolsViewController _updateSuggestionPopover](self, "_updateSuggestionPopover");
  }
  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v22, a4, v9, v16);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v24, a4, v9, v16);

}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  uint64_t v7;
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  unsigned int v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  NSRange v36;

  v7 = a7;
  length = a5.length;
  location = a5.location;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  _WTVCLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v28 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "length");
    v36.location = location;
    v36.length = length;
    NSStringFromRange(v36);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v30 = v16;
    v31 = 2048;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_24A7CB000, v14, OS_LOG_TYPE_DEFAULT, "compositionSession: [%@], didReceiveText: [length = %lu], range: %@", buf, 0x20u);

    v7 = v28;
  }

  -[WTWritingToolsViewController uuidContextMapping](self, "uuidContextMapping");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController attributedStringController](self, "attributedStringController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reconstitutedAttributedStringForContext:digestedAttributedString:", v21, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController analyticsDelegate](self, "analyticsDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v25, v23, location, length, v21, v7);

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController session](self, "session");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "compositionSession:didReceiveText:replacementRange:inContext:finished:", v27, v23, location, length, v21, v7);

}

- (void)showSmartReplyQuestionnaireWithRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25 = *MEMORY[0x24BDAC8D0];
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_writingToolsInputDashboardViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _WTVCLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD16E0];
    -[WTWritingToolsViewController session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    NSStringFromCGRect(v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138413058;
    v18 = v12;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_24A7CB000, v10, OS_LOG_TYPE_DEFAULT, "try -showSmartReplyQuestionnaire (sessionUUID: %@, sessionType: %@, rect: %@, inputDashboardVC: %@", (uint8_t *)&v17, 0x2Au);

  }
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "showSmartReplyQuestionnaireWithRect:", x, y, width, height);

}

- (void)undo
{
  void *v2;
  id v3;

  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undo");

}

- (void)redo
{
  void *v2;
  id v3;

  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "redo");

}

- (void)setSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  WTSession *session;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTSession uuid](self->_session, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_DEFAULT, "setSession: %@, type: %@, oldSession: %@", (uint8_t *)&v10, 0x20u);

  }
  session = self->_session;
  self->_session = (WTSession *)v4;

  if (!v4)
    -[WTWritingToolsViewController setIsWritingToolsActive:](self, "setIsWritingToolsActive:", 0);
  -[WTWritingToolsViewController _updateKBSuppression](self, "_updateKBSuppression");
  -[WTWritingToolsViewController _updateSourceView](self, "_updateSourceView");
}

- (id)itemProviderForAttributedText:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD15F0]);
  v5 = objc_msgSend(v3, "length");
  v6 = *MEMORY[0x24BEBB348];
  v24 = *MEMORY[0x24BEBB348];
  v25[0] = *MEMORY[0x24BEBB3B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    objc_msgSend((id)*MEMORY[0x24BDF83B0], "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __62__WTWritingToolsViewController_itemProviderForAttributedText___block_invoke;
    v20[3] = &unk_251C07210;
    v21 = v8;
    objc_msgSend(v4, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v10, 0, v20);

  }
  v11 = objc_msgSend(v3, "length");
  v12 = *MEMORY[0x24BEBB3B0];
  v13 = *MEMORY[0x24BEBB338];
  v22[0] = v6;
  v22[1] = v13;
  v23[0] = v12;
  v23[1] = &unk_251C0F690;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataFromRange:documentAttributes:error:", 0, v11, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend((id)*MEMORY[0x24BDF8620], "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __62__WTWritingToolsViewController_itemProviderForAttributedText___block_invoke_419;
    v18[3] = &unk_251C07210;
    v19 = v15;
    objc_msgSend(v4, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v16, 0, v18);

  }
  return v4;
}

uint64_t __62__WTWritingToolsViewController_itemProviderForAttributedText___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

uint64_t __62__WTWritingToolsViewController_itemProviderForAttributedText___block_invoke_419(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

- (void)replaceSelectionWithText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WTWritingToolsViewController attributedStringController](self, "attributedStringController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reconstitutedAttributedStringForStitchedContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController beTextInput](self, "beTextInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "conformsToProtocol:", &unk_25797AAF8);

  }
  -[WTWritingToolsViewController itemProviderForAttributedText:](self, "itemProviderForAttributedText:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) != 0)
    goto LABEL_7;
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "canPasteItemProviders:", v12);

  if (!v13)
  {
LABEL_7:
    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedTextRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController beTextInput](self, "beTextInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[WTWritingToolsViewController beTextInput](self, "beTextInput");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertText:", v19);

    }
    else if (objc_msgSend(v15, "conformsToProtocol:", &unk_25797AAF8))
    {
      objc_msgSend(v6, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "insertText:", v18);
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "replaceRange:withAttributedText:", v14, v6);
        goto LABEL_15;
      }
      objc_msgSend(v6, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceRange:withText:", v14, v18);
    }

    goto LABEL_15;
  }
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pasteItemProviders:", v15);
LABEL_15:

}

- (void)copyText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WTWritingToolsViewController attributedStringController](self, "attributedStringController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reconstitutedAttributedStringForStitchedContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController itemProviderForAttributedText:](self, "itemProviderForAttributedText:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemProviders:", v9);

}

- (void)beginTextPlaceholder
{
  void *v2;
  id v3;

  -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[_WTTextPlaceholderController placeholderControllerForDelegate:](_WTTextPlaceholderController, "placeholderControllerForDelegate:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPattern:", 1);
  objc_msgSend(v2, "beginPlaceholder");

}

- (void)endTextPlaceholderAndWillInsertText:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_WTTextPlaceholderController placeholderControllerForDelegate:](_WTTextPlaceholderController, "placeholderControllerForDelegate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__WTWritingToolsViewController_endTextPlaceholderAndWillInsertText___block_invoke;
  v7[3] = &unk_251C07238;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "endPlaceholderAndWillInsertText:completion:", v3, v7);

}

uint64_t __68__WTWritingToolsViewController_endTextPlaceholderAndWillInsertText___block_invoke(uint64_t a1)
{
  return +[_WTTextPlaceholderController removePlaceholderControllerForDelegate:](_WTTextPlaceholderController, "removePlaceholderControllerForDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)enableSmallDetent:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;

  v3 = a3;
  -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[WTWritingToolsViewController enableSmallDetent](self, "enableSmallDetent");
  -[WTWritingToolsViewController setEnableSmallDetent:](self, "setEnableSmallDetent:", v3);
  if (v13 != v3 && -[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet") && v3)
    -[WTWritingToolsViewController _sendKeyboardTrackingNotificationsFromStartFrame:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:", v6, v8, v10, v12);
}

- (void)enableIntelligentEntryFieldView:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_DEFAULT, "EnableIntelligentEntryFieldView: %@", (uint8_t *)&v9, 0xCu);

  }
  v7 = v3 ^ 1;
  -[WTWritingToolsViewController setEnableSmallDetent:](self, "setEnableSmallDetent:", v7);
  -[WTWritingToolsViewController sheetController](self, "sheetController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrefersGrabberVisible:", v7);

}

- (void)proofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  void *v6;
  id v7;

  +[WTUIActionHostToClient actionForProofreadingSessionWithUUID:updateState:forSuggestionWithUUID:](WTUIActionHostToClient, "actionForProofreadingSessionWithUUID:updateState:forSuggestionWithUUID:", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController hostingController](self, "hostingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAction:", v7);

}

- (void)proofreadingSessionWithUUID:(id)a3 showDetailsForSuggestionWithUUID:(id)a4 relativeToRect:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  CGRect v27;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  _WTVCLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    NSStringFromCGRect(v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138413058;
    v19 = v16;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_24A7CB000, v14, OS_LOG_TYPE_DEFAULT, "session: %@, showDetailsForSuggestion: %@, relativeToRect: %@, inView: %@", (uint8_t *)&v18, 0x2Au);

  }
  if (-[WTWritingToolsViewController _wantsUCBUI](self, "_wantsUCBUI")
    || -[WTWritingToolsViewController suppressSheetForKeyboardEditing](self, "suppressSheetForKeyboardEditing"))
  {
    -[WTWritingToolsViewController setPopoverSuggestionUUID:](self, "setPopoverSuggestionUUID:", v12);
    -[WTWritingToolsViewController setSuggestionPopoverSourceRect:](self, "setSuggestionPopoverSourceRect:", x, y, width, height);
    -[WTWritingToolsViewController setSuggestionPopoverSourceView:](self, "setSuggestionPopoverSourceView:", v13);
    -[WTWritingToolsViewController _updateSuggestionPopover](self, "_updateSuggestionPopover");
  }

}

- (void)textSystemWillBeginEditingDuringSessionWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_DEFAULT, "textSystemWillBeginEditingDuringSessionWithUUID: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 != 1 || (objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") & 1) == 0)
  {
    -[WTWritingToolsViewController setSuppressSheetForKeyboardEditing:](self, "setSuppressSheetForKeyboardEditing:", 1);
    -[WTWritingToolsViewController setMinimizedIntoAssistant:](self, "setMinimizedIntoAssistant:", 0);
  }

}

- (_UIRemoteSheet)_remoteSheet
{
  return self->_hostingController;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  unsigned int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (a4 == 2) ^ -[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet", a3);
  if (v7 == 1)
    -[WTWritingToolsViewController setPresentedAsSheet:](self, "setPresentedAsSheet:", a4 == 2);
  objc_msgSend(MEMORY[0x24BEBD700], "activeKeyboardSceneDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addVisibilityObserver:", self);

  _WTVCLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_24A7CB000, v9, OS_LOG_TYPE_DEFAULT, "presentationController:willPresentWithAdaptiveStyle: %@, presentingAsSheet: %@", (uint8_t *)&v18, 0x16u);

  }
  -[WTWritingToolsViewController _updateKBSuppression](self, "_updateKBSuppression");
  -[WTWritingToolsViewController _updateInputDashboardViewController](self, "_updateInputDashboardViewController");
  -[WTWritingToolsViewController _updateSourceView](self, "_updateSourceView");
  if (v7)
  {
    if (-[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet"))
      v12 = 2;
    else
      v12 = 7;
    +[WTUIActionHostToClient actionForChangingPresentationStyle:](WTUIActionHostToClient, "actionForChangingPresentationStyle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController hostingController](self, "hostingController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendAction:", v13);

  }
  -[WTWritingToolsViewController preferredContentSize](self, "preferredContentSize");
  v17 = v16 == *MEMORY[0x24BDBF148] && v15 == *(double *)(MEMORY[0x24BDBF148] + 8);
  if (!v17 || -[WTWritingToolsViewController enableSmallDetent](self, "enableSmallDetent"))
  {
    -[WTWritingToolsViewController _offScreenFrame](self, "_offScreenFrame");
    -[WTWritingToolsViewController _sendKeyboardTrackingNotificationsFromStartFrame:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:");
  }
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double (*v21)(uint64_t);
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[WTWritingToolsViewController setSheetController:](self, "setSheetController:", v7);
    -[WTWritingToolsViewController sheetController](self, "sheetController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrefersEdgeAttachedInCompactHeight:", 1);

    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x24BEBD950];
    v10 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __94__WTWritingToolsViewController__presentationController_prepareAdaptivePresentationController___block_invoke;
    v24[3] = &unk_251C07260;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v9, "customDetentWithIdentifier:resolver:", CFSTR("WTWritingToolsDetent"), v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BEBD950];
    v19 = v10;
    v20 = 3221225472;
    v21 = __94__WTWritingToolsViewController__presentationController_prepareAdaptivePresentationController___block_invoke_2;
    v22 = &unk_251C07260;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v12, "customDetentWithIdentifier:resolver:", CFSTR("WTWritingToolsSmallDetentIdentifier"), &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v13;
    v27[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2, v19, v20, v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController sheetController](self, "sheetController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDetents:", v14);

    -[WTWritingToolsViewController sheetController](self, "sheetController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLargestUndimmedDetentIdentifier:", CFSTR("WTWritingToolsDetent"));

    -[WTWritingToolsViewController sheetController](self, "sheetController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPrefersGrabberVisible:", 1);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = v7;
    objc_msgSend(v18, "_setBackgroundBlurDisabled:", 1);
    objc_msgSend(v18, "_setOverrideAllowsHitTestingOnBackgroundViews:", 0);

  }
}

double __94__WTWritingToolsViewController__presentationController_prepareAdaptivePresentationController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_desiredSheetHeight");
  v3 = v2;

  return v3;
}

double __94__WTWritingToolsViewController__presentationController_prepareAdaptivePresentationController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_smallDetentHeight");
  v3 = v2;

  return v3;
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "selectedDetentIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController setCurrentDetentIdentifier:](self, "setCurrentDetentIdentifier:", v13);
  -[WTWritingToolsViewController _sendKeyboardTrackingNotificationsFromStartFrame:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:", v6, v8, v10, v12);
}

- (void)remoteKeyboardChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", CFSTR("com.apple.WritingToolsUIService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v12[2] = CFSTR("com.apple.Feedback.DraftingExtension");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v4, "hostBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.WritingToolsUIService"));

    if ((v11 & 1) == 0)
      -[WTWritingToolsViewController setSuppressWritingToolsForRemoteKeyboard:](self, "setSuppressWritingToolsForRemoteKeyboard:", objc_msgSend(v4, "keyboardOnScreen"));
  }

}

- (void)remoteKeyboardVisibilityDidChange:(BOOL)a3 bundleId:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[4];

  v4 = a3;
  v12[3] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a4;
  objc_msgSend(v6, "mainBundle", CFSTR("com.apple.WritingToolsUIService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  v12[2] = CFSTR("com.apple.Feedback.DraftingExtension");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  if ((v11 & 1) == 0)
    -[WTWritingToolsViewController setSuppressWritingToolsForRemoteKeyboard:](self, "setSuppressWritingToolsForRemoteKeyboard:", v4);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  __CFString *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v27;

  v4 = a3;
  -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[WTWritingToolsViewController preferredContentSize](self, "preferredContentSize");
  v14 = v13;
  v16 = v15;
  objc_msgSend(v4, "preferredContentSize");
  v18 = v17;
  v20 = v19;

  -[WTWritingToolsViewController setPreferredContentSize:](self, "setPreferredContentSize:", v18, v20);
  -[WTWritingToolsViewController currentDetentIdentifier](self, "currentDetentIdentifier");
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v21 != CFSTR("WTWritingToolsSmallDetentIdentifier"))
  {
    -[WTWritingToolsViewController preferredContentSize](self, "preferredContentSize");
    v23 = *MEMORY[0x24BDBF148];
    v24 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (*MEMORY[0x24BDBF148] != v25 || v24 != v22)
    {
      if (!-[WTWritingToolsViewController presenting](self, "presenting")
        || (v14 == v23 ? (v27 = v16 == v24) : (v27 = 0), v27))
      {
        -[WTWritingToolsViewController _sendKeyboardTrackingNotificationsFromStartFrame:](self, "_sendKeyboardTrackingNotificationsFromStartFrame:", v6, v8, v10, v12);
      }
    }
  }
}

- (void)_setupSceneHostingWithRequestedTool:(int64_t)a3 prompt:(id)a4 smartReplyConfiguration:(id)a5
{
  void *v8;
  _TtC14WritingToolsUI16WTStartupOptions *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  WTUISceneHostingActivationController *v18;
  WTUISceneHostingActivationController *v19;
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
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id location;
  _QWORD v48[6];

  v48[4] = *MEMORY[0x24BDAC8D0];
  v43 = a4;
  v44 = a5;
  -[WTWritingToolsViewController hostingController](self, "hostingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[WTWritingToolsViewController _beginDelayingPresentation:cancellationHandler:](self, "_beginDelayingPresentation:cancellationHandler:", &__block_literal_global_2, 3.0);
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.WritingToolsUIService"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(_TtC14WritingToolsUI16WTStartupOptions);
    -[WTStartupOptions setRequestedTool:](v9, "setRequestedTool:", a3);
    -[WTStartupOptions setPrompt:](v9, "setPrompt:", v43);
    -[WTStartupOptions setEditable:](v9, "setEditable:", -[WTWritingToolsViewController _isEditableResponder](self, "_isEditableResponder"));
    v42 = v9;
    -[WTStartupOptions setWantsInlineEditing:](v9, "setWantsInlineEditing:", -[WTWritingToolsViewController _wantsInlineEditing](self, "_wantsInlineEditing"));
    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v42;
      objc_msgSend(v42, "setAllowedResultOptions:", objc_msgSend(v11, "allowedWritingToolsResultOptions"));

    }
    else
    {
      v12 = v42;
      objc_msgSend(v42, "setAllowedResultOptions:", 0);
    }
    objc_msgSend(v12, "setSmartReplyConfiguration:", v44);
    v13 = objc_alloc(MEMORY[0x24BEBDCF8]);
    v14 = objc_alloc_init(MEMORY[0x24BEBDD10]);
    v15 = (void *)objc_msgSend(v13, "initWithProcessIdentity:sceneSpecification:", v40, v14);
    -[WTWritingToolsViewController setHostingController:](self, "setHostingController:", v15);

    -[WTWritingToolsViewController hostingController](self, "hostingController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_eventDeferringComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMaintainHostFirstResponderWhenClientWantsKeyboard:", 1);

    objc_msgSend(v42, "asBSActionAndReturnError:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v18 = [WTUISceneHostingActivationController alloc];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __99__WTWritingToolsViewController__setupSceneHostingWithRequestedTool_prompt_smartReplyConfiguration___block_invoke_2;
    v45[3] = &unk_251C070A8;
    objc_copyWeak(&v46, &location);
    v19 = -[WTUISceneHostingActivationController initWithStartupAction:invalidationHandler:](v18, "initWithStartupAction:invalidationHandler:", v39, v45);
    -[WTWritingToolsViewController hostingController](self, "hostingController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActivationController:", v19);

    -[WTWritingToolsViewController hostingController](self, "hostingController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", self);

    -[WTWritingToolsViewController hostingController](self, "hostingController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sceneViewController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    -[WTWritingToolsViewController addChildViewController:](self, "addChildViewController:", v41);
    objc_msgSend(v41, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v23);
    objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v32 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v23, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v36;
    objc_msgSend(v23, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v33;
    objc_msgSend(v23, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v27;
    objc_msgSend(v23, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v31);

    objc_msgSend(v41, "didMoveToParentViewController:", self);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);

  }
}

uint64_t __99__WTWritingToolsViewController__setupSceneHostingWithRequestedTool_prompt_smartReplyConfiguration___block_invoke()
{
  return 0;
}

void __99__WTWritingToolsViewController__setupSceneHostingWithRequestedTool_prompt_smartReplyConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endWritingTools");

}

- (double)_desiredSheetHeight
{
  double v2;

  -[WTWritingToolsViewController preferredContentSize](self, "preferredContentSize");
  return v2;
}

- (double)_smallDetentHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double result;

  -[WTWritingToolsViewController WTWritingToolsSmallDetentKeyboardHeight](self, "WTWritingToolsSmallDetentKeyboardHeight");
  v4 = v3;
  -[WTWritingToolsViewController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v4 - v7;

  v9 = -[WTWritingToolsViewController enableSmallDetent](self, "enableSmallDetent");
  result = *MEMORY[0x24BEBE740];
  if (v9)
    return v8;
  return result;
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WTWritingToolsViewController;
  -[WTWritingToolsViewController didRotateFromInterfaceOrientation:](&v17, sel_didRotateFromInterfaceOrientation_, a3);
  -[WTWritingToolsViewController onScreenFrameLastReportedToKeyboardTrackingCoordinator](self, "onScreenFrameLastReportedToKeyboardTrackingCoordinator");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
  -[WTWritingToolsViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
  -[WTWritingToolsViewController ivsPlacementController](self, "ivsPlacementController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController onScreenFrameLastReportedToKeyboardTrackingCoordinator](self, "onScreenFrameLastReportedToKeyboardTrackingCoordinator");
  objc_msgSend(v12, "animateTrackingElementsFromStart:toEnd:forShow:", 1, v5, v7, v9, v11, v13, v14, v15, v16);

}

- (double)_currentDetentHeight
{
  NSObject *v3;
  void *v4;
  void *v5;
  WTWritingToolsViewController *v6;
  __CFString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController currentDetentIdentifier](self, "currentDetentIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_DEFAULT, "The currentDetentIdentifierIs %@", (uint8_t *)&v16, 0xCu);

  }
  -[WTWritingToolsViewController currentDetentIdentifier](self, "currentDetentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self;
  if (v5)
  {
    -[WTWritingToolsViewController currentDetentIdentifier](self, "currentDetentIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7 != CFSTR("WTWritingToolsSmallDetentIdentifier"))
    {

LABEL_9:
      -[WTWritingToolsViewController preferredContentSize](self, "preferredContentSize");
      v11 = v10;
      -[WTWritingToolsViewController presentingViewController](self, "presentingViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeAreaInsets");
      v9 = v11 + v14;

      return v9;
    }
    v6 = self;
  }
  if (!-[WTWritingToolsViewController enableSmallDetent](v6, "enableSmallDetent"))
    goto LABEL_9;
  -[WTWritingToolsViewController WTWritingToolsSmallDetentKeyboardHeight](self, "WTWritingToolsSmallDetentKeyboardHeight");
  return v8;
}

- (void)_dismissalTransitionWillBegin:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  if (-[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet", a3)
    && !-[WTWritingToolsViewController suppressingSheetForRemoteKeyboardOnScreen](self, "suppressingSheetForRemoteKeyboardOnScreen"))
  {
    if (objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode"))
    {
      -[WTWritingToolsViewController _offScreenFrame](self, "_offScreenFrame");
      -[WTWritingToolsViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
      -[WTWritingToolsViewController ivsPlacementController](self, "ivsPlacementController");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      -[WTWritingToolsViewController onScreenFrameLastReportedToKeyboardTrackingCoordinator](self, "onScreenFrameLastReportedToKeyboardTrackingCoordinator");
      objc_msgSend(v16, "animateTrackingElementsFromStart:toEnd:forShow:", 0, v5, v7, v9, v11, v12, v13, v14, v15);

    }
  }
}

- (void)_dismissalTransitionDidEnd:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  double v8;
  double v9;
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
  id v20;

  v20 = a3;
  if (-[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet"))
  {
    objc_msgSend(v20, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE620]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if ((v6 & 1) == 0)
    {
      if (objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode"))
      {
        -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
        -[WTWritingToolsViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
        -[WTWritingToolsViewController ivsPlacementController](self, "ivsPlacementController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WTWritingToolsViewController _offScreenFrame](self, "_offScreenFrame");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        -[WTWritingToolsViewController onScreenFrameLastReportedToKeyboardTrackingCoordinator](self, "onScreenFrameLastReportedToKeyboardTrackingCoordinator");
        objc_msgSend(v7, "animateTrackingElementsFromStart:toEnd:forShow:", 1, v9, v11, v13, v15, v16, v17, v18, v19);

      }
    }
  }

}

- (CGRect)_onScreenFrame
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  -[WTWritingToolsViewController _sourceResponderViewController](self, "_sourceResponderViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[WTWritingToolsViewController _currentDetentHeight](self, "_currentDetentHeight");
  v15 = v14;
  objc_msgSend(v5, "screen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coordinateSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v17, v7, v9 + v13 - v15, v11, v15);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)_offScreenFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
  v6 = v5 + v4;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v2;
  return result;
}

- (void)_updateInputDashboardViewController
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WTWritingToolsViewController *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WTWritingToolsViewController _wantsUCBUI](self, "_wantsUCBUI");
  v5 = -[WTWritingToolsViewController minimizedIntoAssistant](self, "minimizedIntoAssistant");
  _WTVCLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WTWritingToolsViewController requestedTool](self, "requestedTool");
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[WTWritingToolsViewController session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "compositionSessionType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138413058;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_24A7CB000, v6, OS_LOG_TYPE_DEFAULT, "_updateInputDashboardViewController. wantsUCB %@, wantsAssistant %@, requestedTool: %ld, rewriteTpe: %@", (uint8_t *)&v19, 0x2Au);

  }
  if (!v4)
  {
    if (!v5)
    {
      objc_msgSend(v3, "_setWritingToolsInputDashboardViewController:", 0);
      goto LABEL_15;
    }
    goto LABEL_8;
  }
  objc_msgSend(v3, "_writingToolsInputDashboardViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (!v5)
      goto LABEL_15;
LABEL_8:
    objc_msgSend(v3, "_writingToolsInputDashboardViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v15 = self;
      v16 = 1;
LABEL_13:
      -[WTWritingToolsViewController _createProofreadingInputDashboardViewControllerForAssistant:](v15, "_createProofreadingInputDashboardViewControllerForAssistant:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v18 = (void *)v17;
      objc_msgSend(v3, "_setWritingToolsInputDashboardViewController:", v17);

      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (-[WTWritingToolsViewController _proofreadingSessionActiveOrRequested](self, "_proofreadingSessionActiveOrRequested"))
  {
    v15 = self;
    v16 = 0;
    goto LABEL_13;
  }
  if (-[WTWritingToolsViewController _rewritingSessionActiveOrRequested](self, "_rewritingSessionActiveOrRequested"))
  {
    -[WTWritingToolsViewController _createCompositionInputDashboardViewController](self, "_createCompositionInputDashboardViewController");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend((id)objc_opt_class(), "iPadOSAlternateQuestionnaireEnabled")
    && -[WTWritingToolsViewController _smartReplySessionActiveOrRequested](self, "_smartReplySessionActiveOrRequested"))
  {
    -[WTWritingToolsViewController _createSmartReplyInputDashboardViewController](self, "_createSmartReplyInputDashboardViewController");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:

}

- (id)_createProofreadingInputDashboardViewControllerForAssistant:(BOOL)a3
{
  _BOOL8 v3;
  WTSceneHostedInputDashboardViewController *v5;
  void *v6;
  void *v7;
  WTSceneHostedInputDashboardViewController *v8;

  v3 = a3;
  v5 = [WTSceneHostedInputDashboardViewController alloc];
  -[WTWritingToolsViewController session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WTSceneHostedInputDashboardViewController initWithWritingToolsDelegate:sessionUUID:requestedTool:forAssistant:](v5, "initWithWritingToolsDelegate:sessionUUID:requestedTool:forAssistant:", self, v7, 1, v3);

  return v8;
}

- (id)_createCompositionInputDashboardViewController
{
  WTSceneHostedInputDashboardViewController *v3;
  void *v4;
  void *v5;
  WTSceneHostedInputDashboardViewController *v6;

  v3 = [WTSceneHostedInputDashboardViewController alloc];
  -[WTWritingToolsViewController session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WTSceneHostedInputDashboardViewController initWithWritingToolsDelegate:sessionUUID:requestedTool:forAssistant:](v3, "initWithWritingToolsDelegate:sessionUUID:requestedTool:forAssistant:", self, v5, 2, 0);

  return v6;
}

- (id)_createSmartReplyInputDashboardViewController
{
  WTSceneHostedInputDashboardViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  WTSceneHostedInputDashboardViewController *v7;
  NSObject *v8;

  if ((objc_msgSend((id)objc_opt_class(), "iPadOSAlternateQuestionnaireEnabled") & 1) != 0)
  {
    v3 = [WTSceneHostedInputDashboardViewController alloc];
    -[WTWritingToolsViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController smartReplyConfig](self, "smartReplyConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WTSceneHostedInputDashboardViewController initWithWritingToolsDelegate:sessionUUID:smartReplyConfiguration:](v3, "initWithWritingToolsDelegate:sessionUUID:smartReplyConfiguration:", self, v5, v6);

  }
  else
  {
    _WTVCLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WTWritingToolsViewController _createSmartReplyInputDashboardViewController].cold.1(v8);

    v7 = 0;
  }
  return v7;
}

- (void)_updateSourceView
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (-[WTWritingToolsViewController isWritingToolsActive](self, "isWritingToolsActive"))
  {
    -[WTWritingToolsViewController setMinimizedIntoUCB:](self, "setMinimizedIntoUCB:", -[WTWritingToolsViewController _wantsUCBUI](self, "_wantsUCBUI"));
    _WTVCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WTWritingToolsViewController minimizedIntoUCB](self, "minimizedIntoUCB"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_DEFAULT, "_updateSourceView, wantsUCB: %@", (uint8_t *)&v5, 0xCu);

    }
    if (-[WTWritingToolsViewController minimizedIntoUCB](self, "minimizedIntoUCB"))
    {
      -[WTWritingToolsViewController _updateWritingToolsUISuppression](self, "_updateWritingToolsUISuppression");
      if (!-[WTWritingToolsViewController presented](self, "presented"))
      {
        -[WTWritingToolsViewController _updateKBSuppression](self, "_updateKBSuppression");
        -[WTWritingToolsViewController _updateInputDashboardViewController](self, "_updateInputDashboardViewController");
      }
    }
    else
    {
      -[WTWritingToolsViewController _dismissSuggestionViewController](self, "_dismissSuggestionViewController");
      -[WTWritingToolsViewController _updatePopoverAnchoring](self, "_updatePopoverAnchoring");
      -[WTWritingToolsViewController _updateWritingToolsUISuppression](self, "_updateWritingToolsUISuppression");
    }
  }
}

- (void)_updatePopoverAnchoring
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController popoverPresentationController](self, "popoverPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSourceView:", v4);

  -[WTWritingToolsViewController _textSelectionRectForTextInput](self, "_textSelectionRectForTextInput");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[WTWritingToolsViewController popoverPresentationController](self, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSourceRect:", v7, v9, v11, v13);

  -[WTWritingToolsViewController popoverPresentationController](self, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPermittedArrowDirections:", 15);

  -[WTWritingToolsViewController popoverPresentationController](self, "popoverPresentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCanOverlapSourceViewRect:", 1);

  -[WTWritingToolsViewController session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

LABEL_4:
    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textInputView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController popoverPresentationController](self, "popoverPresentationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPassthroughViews:", v20);

    return;
  }
  if (-[WTWritingToolsViewController requestedTool](self, "requestedTool"))
    goto LABEL_4;
  -[WTWritingToolsViewController popoverPresentationController](self, "popoverPresentationController");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPassthroughViews:", 0);

}

- (void)_revertAllSuggestions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[WTWritingToolsViewController proofreadingSuggestions](self, "proofreadingSuggestions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        -[WTWritingToolsViewController session](self, "session");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WTWritingToolsViewController proofreadingSessionWithUUID:updateState:forSuggestionWithUUID:](self, "proofreadingSessionWithUUID:updateState:forSuggestionWithUUID:", v10, 3, v11);

        -[WTWritingToolsViewController contextForSuggestions](self, "contextForSuggestions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[WTWritingToolsViewController session](self, "session");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WTWritingToolsViewController uuidContextMapping](self, "uuidContextMapping");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WTWritingToolsViewController proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:](self, "proofreadingSession:didUpdateState:forSuggestionWithUUID:inContext:", v15, 3, v16, v18);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

- (void)_updateKBSuppression
{
  _BOOL8 v3;
  _BOOL8 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[WTWritingToolsViewController _wantsUCBUI](self, "_wantsUCBUI");
  v4 = v3 || -[WTWritingToolsViewController presented](self, "presented");
  _WTVCLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WTWritingToolsViewController presented](self, "presented"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_24A7CB000, v5, OS_LOG_TYPE_DEFAULT, "_updateKBSuppression shouldSuppress: %@, shouldSuppressForUCBUI: %@, sheet/popover presented: %@", (uint8_t *)&v10, 0x20u);

  }
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setWritingToolsWantsKeyboardSuppression:suppressAssistant:", v4, -[WTWritingToolsViewController _wantsUCBUI](self, "_wantsUCBUI") ^ 1);

}

- (BOOL)_proofreadingSessionActive
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WTWritingToolsViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WTWritingToolsViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "type") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_proofreadingSessionActiveOrRequested
{
  int64_t v3;

  v3 = -[WTWritingToolsViewController requestedTool](self, "requestedTool");
  if (v3 != 1)
    LOBYTE(v3) = -[WTWritingToolsViewController _proofreadingSessionActive](self, "_proofreadingSessionActive");
  return v3;
}

- (BOOL)_rewritingSessionActive
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[WTWritingToolsViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WTWritingToolsViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 2)
    {
      -[WTWritingToolsViewController session](self, "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "compositionSessionType") != 11;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_smartReplySessionActive
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[WTWritingToolsViewController session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WTWritingToolsViewController session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "type") == 2)
    {
      -[WTWritingToolsViewController session](self, "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "compositionSessionType") == 11;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_rewritingSessionActiveOrRequested
{
  return -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 2
      || -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 3
      || -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 11
      || -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 12
      || -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 13
      || -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 23
      || -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 24
      || -[WTWritingToolsViewController _rewritingSessionActive](self, "_rewritingSessionActive");
}

- (BOOL)_smartReplySessionActiveOrRequested
{
  return -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 101
      || -[WTWritingToolsViewController _smartReplySessionActive](self, "_smartReplySessionActive");
}

- (BOOL)_wantsUCBUI
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1
    && !-[WTWritingToolsViewController suppressSheetForKeyboardEditing](self, "suppressSheetForKeyboardEditing"))
  {
    v5 = -[WTWritingToolsViewController _wantsInlineEditing](self, "_wantsInlineEditing");
    if (v5)
    {
      if (-[WTWritingToolsViewController _proofreadingSessionActiveOrRequested](self, "_proofreadingSessionActiveOrRequested")|| -[WTWritingToolsViewController requestedTool](self, "requestedTool") == 2|| objc_msgSend((id)objc_opt_class(), "iPadOSAlternateQuestionnaireEnabled")&& -[WTWritingToolsViewController _smartReplySessionActiveOrRequested](self, "_smartReplySessionActiveOrRequested"))
      {
        goto LABEL_12;
      }
      -[WTWritingToolsViewController session](self, "session");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "compositionSessionType");

      LOBYTE(v5) = 0;
      if (v7 > 0xB)
        return v5;
      if (((1 << v7) & 0x33E) != 0)
      {
LABEL_12:
        LOBYTE(v5) = 1;
      }
      else if (v7 == 11)
      {
        LOBYTE(v5) = objc_msgSend((id)objc_opt_class(), "iPadOSAlternateQuestionnaireEnabled");
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (CGRect)_textSelectionRectForTextInput
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController _cgRectForSelectionRects:](self, "_cgRectForSelectionRects:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_cgRectForSelectionRects:(id)a3
{
  id v3;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "rect");
        v29.origin.x = v12;
        v29.origin.y = v13;
        v29.size.width = v14;
        v29.size.height = v15;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_isEditableResponder
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[WTWritingToolsViewController beTextInput](self, "beTextInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditable");

  if ((v4 & 1) != 0)
    return 1;
  -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[WTWritingToolsViewController sourceTextInput](self, "sourceTextInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "isEditable");
LABEL_7:

    return v5;
  }
  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_textInteraction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_textInteraction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v11, "textInteractionMode") == 0;

    goto LABEL_7;
  }
  return 1;
}

- (BOOL)_wantsInlineEditing
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[WTWritingToolsViewController writingToolsDelegate](self, "writingToolsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    v7 = objc_msgSend(v5, "wantsWritingToolsInlineEditing");
  }
  else
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[WTWritingToolsViewController _isEditableResponder](self, "_isEditableResponder");
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (BOOL)_isTemporarilyDismissed
{
  return -[WTWritingToolsViewController suppressingSheetForRemoteKeyboardOnScreen](self, "suppressingSheetForRemoteKeyboardOnScreen")|| -[WTWritingToolsViewController minimizedIntoUCB](self, "minimizedIntoUCB")|| -[WTWritingToolsViewController suppressSheetForKeyboardEditing](self, "suppressSheetForKeyboardEditing");
}

- (id)_sourceResponderViewController
{
  void *v2;
  void *v3;

  -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_viewControllerForWritingToolsSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSuppressSheetForKeyboardEditing:(BOOL)a3
{
  if (self->_suppressSheetForKeyboardEditing != a3)
  {
    self->_suppressSheetForKeyboardEditing = a3;
    -[WTWritingToolsViewController _updateWritingToolsUISuppression](self, "_updateWritingToolsUISuppression");
    -[WTWritingToolsViewController _updateKBSuppression](self, "_updateKBSuppression");
    -[WTWritingToolsViewController _updateInputDashboardViewController](self, "_updateInputDashboardViewController");
  }
}

- (void)setMinimizedIntoAssistant:(BOOL)a3
{
  id v4;

  if (self->_minimizedIntoAssistant != a3)
  {
    self->_minimizedIntoAssistant = a3;
    -[WTWritingToolsViewController sourceResponder](self, "sourceResponder");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setWritingToolsInputDashboardViewController:", 0);
    -[WTWritingToolsViewController _updateInputDashboardViewController](self, "_updateInputDashboardViewController");

  }
}

- (void)_updateWritingToolsUISuppression
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[WTWritingToolsViewController _isTemporarilyDismissed](self, "_isTemporarilyDismissed")
    && -[WTWritingToolsViewController presented](self, "presented"))
  {
    _WTVCLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_DEFAULT, "dismissViewControllerAnimated for _updateWritingToolsSheetSuppression", buf, 2u);
    }

    -[WTWritingToolsViewController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__WTWritingToolsViewController__updateWritingToolsUISuppression__block_invoke;
    v9[3] = &unk_251C07238;
    v9[4] = self;
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v9);

    -[WTWritingToolsViewController setPresented:](self, "setPresented:", 0);
  }
  else if (!-[WTWritingToolsViewController _isTemporarilyDismissed](self, "_isTemporarilyDismissed")
         && !-[WTWritingToolsViewController presented](self, "presented"))
  {
    -[WTWritingToolsViewController _sourceResponderViewController](self, "_sourceResponderViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WTVCLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_24A7CB000, v6, OS_LOG_TYPE_DEFAULT, "presentViewController in _updateWritingToolsSheetSuppression from %@", buf, 0xCu);
    }

    -[WTWritingToolsViewController setPresented:](self, "setPresented:", 1);
    -[WTWritingToolsViewController setPresenting:](self, "setPresenting:", 1);
    objc_initWeak((id *)buf, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__WTWritingToolsViewController__updateWritingToolsUISuppression__block_invoke_503;
    v7[3] = &unk_251C070A8;
    objc_copyWeak(&v8, (id *)buf);
    objc_msgSend(v5, "presentViewController:animated:completion:", self, 1, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);

  }
}

uint64_t __64__WTWritingToolsViewController__updateWritingToolsUISuppression__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateKBSuppression");
  return objc_msgSend(*(id *)(a1 + 32), "_updateInputDashboardViewController");
}

void __64__WTWritingToolsViewController__updateWritingToolsUISuppression__block_invoke_503(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPresenting:", 0);

}

- (id)_assistantProofreadBarButton
{
  void *v3;
  void *v4;
  WTProofreadCandidateBarView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BEBD388];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__WTWritingToolsViewController__assistantProofreadBarButton__block_invoke;
  v19[3] = &unk_251C072A8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "actionWithHandler:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "systemButtonWithPrimaryAction:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(WTProofreadCandidateBarView);
  -[WTProofreadCandidateBarView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WTWritingToolsViewController proofreadingSuggestions](self, "proofreadingSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTProofreadCandidateBarView setSuggestionCount:](v5, "setSuggestionCount:", objc_msgSend(v6, "count"));

  -[WTWritingToolsViewController setProofreadCandidateBarView:](self, "setProofreadCandidateBarView:", v5);
  objc_msgSend(v4, "addSubview:", v5);
  v17 = (void *)MEMORY[0x24BDD1628];
  -[WTProofreadCandidateBarView centerXAnchor](v5, "centerXAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  -[WTProofreadCandidateBarView topAnchor](v5, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, 4.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(v4, "widthAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToConstant:", 60.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v14);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v4;
}

void __60__WTWritingToolsViewController__assistantProofreadBarButton__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setMinimizedIntoAssistant:", 1);

}

- (id)_assistantBarButtonCustomViewWithTitle:(id)a3 handler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[6];

  v40[4] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BEBDB38];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = objc_alloc(MEMORY[0x24BEBDC60]);
  objc_msgSend(MEMORY[0x24BEBDC68], "sharedLight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithLightSource:", v10);
  v12 = (void *)objc_msgSend(v8, "initWithEffect:", v11);

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)MEMORY[0x24BEBD388];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __79__WTWritingToolsViewController__assistantBarButtonCustomViewWithTitle_handler___block_invoke;
  v38[3] = &unk_251C072D0;
  v39 = v5;
  v37 = v5;
  objc_msgSend(v13, "actionWithHandler:", v38);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "systemButtonWithPrimaryAction:", v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttributedTitle:forState:", v7, 0);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setContentEdgeInsets:", 20.0, 6.0, 20.0, 6.0);
  objc_msgSend(v12, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v14);

  v28 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v12, "contentView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v32;
  objc_msgSend(v12, "contentView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v27;
  objc_msgSend(v12, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v19;
  v26 = v12;
  objc_msgSend(v12, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v24);

  return v26;
}

uint64_t __79__WTWritingToolsViewController__assistantBarButtonCustomViewWithTitle_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIWTInputViewSetPlacementController_Staging)ivsPlacementController
{
  UIWTInputViewSetPlacementController_Staging *v3;

  if (-[WTWritingToolsViewController _isEditableResponder](self, "_isEditableResponder"))
    v3 = self->_ivsPlacementController;
  else
    v3 = 0;
  return v3;
}

- (void)_sendKeyboardTrackingNotificationsFromStartFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[WTWritingToolsViewController presentedAsSheet](self, "presentedAsSheet"))
  {
    -[WTWritingToolsViewController sheetPresentationController](self, "sheetPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateDetents");

    -[WTWritingToolsViewController _onScreenFrame](self, "_onScreenFrame");
    -[WTWritingToolsViewController setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:](self, "setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:");
    -[WTWritingToolsViewController ivsPlacementController](self, "ivsPlacementController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController onScreenFrameLastReportedToKeyboardTrackingCoordinator](self, "onScreenFrameLastReportedToKeyboardTrackingCoordinator");
    objc_msgSend(v13, "animateTrackingElementsFromStart:toEnd:forShow:", 1, x, y, width, height, v9, v10, v11, v12);

  }
}

- (void)_updateSuggestionPopover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[WTWritingToolsViewController popoverSuggestionUUID](self, "popoverSuggestionUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WTWritingToolsViewController popoverSuggestionUUID](self, "popoverSuggestionUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if ((v8 & 1) != 0)
    {
      -[WTWritingToolsViewController popoverSuggestionUUID](self, "popoverSuggestionUUID");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          -[WTWritingToolsViewController _presentSuggestionViewController](self, "_presentSuggestionViewController");
      }
    }
    else
    {
      -[WTWritingToolsViewController _sourceResponderViewController](self, "_sourceResponderViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __56__WTWritingToolsViewController__updateSuggestionPopover__block_invoke;
      v13[3] = &unk_251C07238;
      v13[4] = self;
      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v13);

    }
  }
  else
  {
    -[WTWritingToolsViewController _dismissSuggestionViewController](self, "_dismissSuggestionViewController");
  }
}

uint64_t __56__WTWritingToolsViewController__updateSuggestionPopover__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "currentSuggestionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateConnection");

  objc_msgSend(*(id *)(a1 + 32), "setCurrentSuggestionViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_presentSuggestionViewController");
}

- (void)_presentSuggestionViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WTSuggestionViewController *v9;
  void *v10;
  WTSuggestionViewController *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[WTWritingToolsViewController uuidSuggestionMapping](self, "uuidSuggestionMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController popoverSuggestionUUID](self, "popoverSuggestionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WTWritingToolsViewController contextForSuggestions](self, "contextForSuggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [WTSuggestionViewController alloc];
  -[WTWritingToolsViewController session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WTSuggestionViewController initWithSuggestion:inContextWithUUID:inSession:](v9, "initWithSuggestion:inContextWithUUID:inSession:", v5, v8, v10);

  -[WTSuggestionViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 7);
  -[WTWritingToolsViewController suggestionPopoverSourceView](self, "suggestionPopoverSourceView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTSuggestionViewController popoverPresentationController](v11, "popoverPresentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSourceView:", v12);

  -[WTWritingToolsViewController suggestionPopoverSourceRect](self, "suggestionPopoverSourceRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[WTSuggestionViewController popoverPresentationController](v11, "popoverPresentationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSourceRect:", v15, v17, v19, v21);

  -[WTSuggestionViewController popoverPresentationController](v11, "popoverPresentationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPermittedArrowDirections:", 3);

  -[WTWritingToolsViewController setCurrentSuggestionViewController:](self, "setCurrentSuggestionViewController:", v11);
  _WTVCLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412290;
    v29 = v25;
    _os_log_impl(&dword_24A7CB000, v24, OS_LOG_TYPE_DEFAULT, "present suggestionViewController: %@", (uint8_t *)&v28, 0xCu);

  }
  -[WTWritingToolsViewController _sourceResponderViewController](self, "_sourceResponderViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "presentViewController:animated:completion:", v27, 1, 0);

}

- (void)_dismissSuggestionViewController
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _WTVCLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_24A7CB000, v3, OS_LOG_TYPE_DEFAULT, "_dismissSuggestionViewController, %@", buf, 0xCu);

  }
  -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "dismissed"))
    {

    }
    else
    {
      -[WTWritingToolsViewController currentSuggestionViewController](self, "currentSuggestionViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "dismissing");

      if ((v11 & 1) != 0)
        return;
      -[WTWritingToolsViewController _sourceResponderViewController](self, "_sourceResponderViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __64__WTWritingToolsViewController__dismissSuggestionViewController__block_invoke;
      v12[3] = &unk_251C07238;
      v12[4] = self;
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v12);
    }

  }
}

uint64_t __64__WTWritingToolsViewController__dismissSuggestionViewController__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "currentSuggestionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateConnection");

  return objc_msgSend(*(id *)(a1 + 32), "setCurrentSuggestionViewController:", 0);
}

- (WTWritingToolsDelegate)writingToolsDelegate
{
  return (WTWritingToolsDelegate *)objc_loadWeakRetained((id *)&self->_writingToolsDelegate);
}

- (void)setWritingToolsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_writingToolsDelegate, a3);
}

- (_UISceneHostingController)hostingController
{
  return self->_hostingController;
}

- (void)setHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_hostingController, a3);
}

- (int64_t)requestedTool
{
  return self->_requestedTool;
}

- (void)setRequestedTool:(int64_t)a3
{
  self->_requestedTool = a3;
}

- (BOOL)enableSmallDetent
{
  return self->_enableSmallDetent;
}

- (void)setEnableSmallDetent:(BOOL)a3
{
  self->_enableSmallDetent = a3;
}

- (UISheetPresentationController)sheetController
{
  return (UISheetPresentationController *)objc_getProperty(self, a2, 1008, 1);
}

- (void)setSheetController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (NSString)currentDetentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setCurrentDetentIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (double)WTWritingToolsSmallDetentKeyboardHeight
{
  return self->_WTWritingToolsSmallDetentKeyboardHeight;
}

- (void)setWTWritingToolsSmallDetentKeyboardHeight:(double)a3
{
  self->_WTWritingToolsSmallDetentKeyboardHeight = a3;
}

- (NSString)prompt
{
  return (NSString *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (WTSmartReplyConfiguration)smartReplyConfig
{
  return (WTSmartReplyConfiguration *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setSmartReplyConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (NSMutableDictionary)uuidContextMapping
{
  return self->_uuidContextMapping;
}

- (void)setUuidContextMapping:(id)a3
{
  objc_storeStrong((id *)&self->_uuidContextMapping, a3);
}

- (NSMutableArray)proofreadingSuggestions
{
  return self->_proofreadingSuggestions;
}

- (void)setProofreadingSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_proofreadingSuggestions, a3);
}

- (NSMutableDictionary)uuidSuggestionMapping
{
  return self->_uuidSuggestionMapping;
}

- (void)setUuidSuggestionMapping:(id)a3
{
  objc_storeStrong((id *)&self->_uuidSuggestionMapping, a3);
}

- (NSMutableDictionary)contextForSuggestions
{
  return self->_contextForSuggestions;
}

- (void)setContextForSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_contextForSuggestions, a3);
}

- (BOOL)isWritingToolsActive
{
  return self->_isWritingToolsActive;
}

- (void)setIsWritingToolsActive:(BOOL)a3
{
  self->_isWritingToolsActive = a3;
}

- (WTSession)session
{
  return self->_session;
}

- (void)setIvsPlacementController:(id)a3
{
  objc_storeStrong((id *)&self->_ivsPlacementController, a3);
}

- (BOOL)presented
{
  return self->_presented;
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
}

- (BOOL)presentedAsSheet
{
  return self->_presentedAsSheet;
}

- (void)setPresentedAsSheet:(BOOL)a3
{
  self->_presentedAsSheet = a3;
}

- (BOOL)presenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (BOOL)suppressingSheetForRemoteKeyboardOnScreen
{
  return self->_suppressingSheetForRemoteKeyboardOnScreen;
}

- (void)setSuppressingSheetForRemoteKeyboardOnScreen:(BOOL)a3
{
  self->_suppressingSheetForRemoteKeyboardOnScreen = a3;
}

- (BOOL)minimizedIntoUCB
{
  return self->_minimizedIntoUCB;
}

- (void)setMinimizedIntoUCB:(BOOL)a3
{
  self->_minimizedIntoUCB = a3;
}

- (BOOL)minimizedIntoAssistant
{
  return self->_minimizedIntoAssistant;
}

- (BOOL)suppressSheetForKeyboardEditing
{
  return self->_suppressSheetForKeyboardEditing;
}

- (CGRect)onScreenFrameLastReportedToKeyboardTrackingCoordinator
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.origin.x;
  y = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.origin.y;
  width = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.size.width;
  height = self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOnScreenFrameLastReportedToKeyboardTrackingCoordinator:(CGRect)a3
{
  self->_onScreenFrameLastReportedToKeyboardTrackingCoordinator = a3;
}

- (WTUIAttributedStringController)attributedStringController
{
  return (WTUIAttributedStringController *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setAttributedStringController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (UIResponder)sourceResponder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_sourceResponder);
}

- (void)setSourceResponder:(id)a3
{
  objc_storeWeak((id *)&self->_sourceResponder, a3);
}

- (UITextInput)sourceTextInput
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->_sourceTextInput);
}

- (void)setSourceTextInput:(id)a3
{
  objc_storeWeak((id *)&self->_sourceTextInput, a3);
}

- (BETextInput)beTextInput
{
  return self->_beTextInput;
}

- (void)setBeTextInput:(id)a3
{
  objc_storeStrong((id *)&self->_beTextInput, a3);
}

- (WTSuggestionViewController)currentSuggestionViewController
{
  return (WTSuggestionViewController *)objc_loadWeakRetained((id *)&self->_currentSuggestionViewController);
}

- (void)setCurrentSuggestionViewController:(id)a3
{
  objc_storeWeak((id *)&self->_currentSuggestionViewController, a3);
}

- (NSUUID)popoverSuggestionUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setPopoverSuggestionUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (CGRect)suggestionPopoverSourceRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_suggestionPopoverSourceRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSuggestionPopoverSourceRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_suggestionPopoverSourceRect, &v3, 32, 1, 0);
}

- (UIView)suggestionPopoverSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_suggestionPopoverSourceView);
}

- (void)setSuggestionPopoverSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_suggestionPopoverSourceView, a3);
}

- (WTProofreadCandidateBarView)proofreadCandidateBarView
{
  return (WTProofreadCandidateBarView *)objc_loadWeakRetained((id *)&self->_proofreadCandidateBarView);
}

- (void)setProofreadCandidateBarView:(id)a3
{
  objc_storeWeak((id *)&self->_proofreadCandidateBarView, a3);
}

- (WTAnalyticsDelegate)analyticsDelegate
{
  return (WTAnalyticsDelegate *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsDelegate, 0);
  objc_destroyWeak((id *)&self->_proofreadCandidateBarView);
  objc_destroyWeak((id *)&self->_suggestionPopoverSourceView);
  objc_storeStrong((id *)&self->_popoverSuggestionUUID, 0);
  objc_destroyWeak((id *)&self->_currentSuggestionViewController);
  objc_storeStrong((id *)&self->_beTextInput, 0);
  objc_destroyWeak((id *)&self->_sourceTextInput);
  objc_destroyWeak((id *)&self->_sourceResponder);
  objc_storeStrong((id *)&self->_attributedStringController, 0);
  objc_storeStrong((id *)&self->_ivsPlacementController, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_contextForSuggestions, 0);
  objc_storeStrong((id *)&self->_uuidSuggestionMapping, 0);
  objc_storeStrong((id *)&self->_proofreadingSuggestions, 0);
  objc_storeStrong((id *)&self->_uuidContextMapping, 0);
  objc_storeStrong((id *)&self->_smartReplyConfig, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_currentDetentIdentifier, 0);
  objc_storeStrong((id *)&self->_sheetController, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_destroyWeak((id *)&self->_writingToolsDelegate);
}

+ (BOOL)isAvailable
{
  return sub_24A7E6860() & 1;
}

- (void)_createSmartReplyInputDashboardViewController
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24A7CB000, log, OS_LOG_TYPE_ERROR, "Attempt to create InputDashboardVC for SmartReply, but input dashboard configuration is not enabled", v1, 2u);
}

@end
