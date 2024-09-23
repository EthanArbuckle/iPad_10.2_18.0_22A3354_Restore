@implementation SiriUICardSnippetViewController

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___SiriUICardSnippetViewController;
  objc_msgSendSuper2(&v17, sel_initialize);
  +[CRKCardSectionViewController registerCardSectionViewController](SiriUILegacyStocksChartCardSectionViewController, "registerCardSectionViewController");
  objc_msgSend(MEMORY[0x24BE15470], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_highlightColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:forState:", v3, 1);

  objc_msgSend(MEMORY[0x24BE15470], "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_highlightColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:forState:", v5, 4);

  objc_msgSend(MEMORY[0x24BE15470], "appearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_highlightColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:forState:", v7, 5);

  objc_msgSend(MEMORY[0x24BE3D040], "feedbackListenerForParsec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SFFeedbackListenerRegister();

  objc_msgSend(MEMORY[0x24BE1FA70], "sharedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SFFeedbackListenerRegister();

  +[SiriUICardProviderRegistry sharedInstance](SiriUICardProviderRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadProviders");

  v11 = (void *)MEMORY[0x24BE15478];
  v12 = objc_alloc_init(MEMORY[0x24BE08B38]);
  objc_msgSend(v11, "registerService:", v12);

  v13 = (void *)MEMORY[0x24BE15478];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v14 = (void *)getAPUICardServiceClass_softClass;
  v22 = getAPUICardServiceClass_softClass;
  if (!getAPUICardServiceClass_softClass)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __getAPUICardServiceClass_block_invoke;
    v18[3] = &unk_24D7D9460;
    v18[4] = &v19;
    __getAPUICardServiceClass_block_invoke((uint64_t)v18);
    v14 = (void *)v20[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v19, 8);
  v16 = objc_alloc_init(v15);
  objc_msgSend(v13, "registerService:", v16);

}

- (SiriUICardSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SiriUICardSnippetViewController *v4;
  SiriUICardSnippetViewController *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *referenceableCommandsByIdentifierMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *referenceableSnippetsByIdentifierMap;
  SRUIFCardLoader *v10;
  SRUIFCardLoader *cardLoader;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUICardSnippetViewController;
  v4 = -[SiriUISnippetViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SiriUISnippetViewController setLoading:](v4, "setLoading:", 1);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    referenceableCommandsByIdentifierMap = v5->_referenceableCommandsByIdentifierMap;
    v5->_referenceableCommandsByIdentifierMap = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    referenceableSnippetsByIdentifierMap = v5->_referenceableSnippetsByIdentifierMap;
    v5->_referenceableSnippetsByIdentifierMap = v8;

    v10 = (SRUIFCardLoader *)objc_alloc_init(MEMORY[0x24BEA8628]);
    cardLoader = v5->_cardLoader;
    v5->_cardLoader = v10;

    -[SRUIFCardLoader setDelegate:](v5->_cardLoader, "setDelegate:", v5);
    -[SRUIFCardLoader setActive:](v5->_cardLoader, "setActive:", 1);
    v5->_sizeClass = 0;
  }
  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  SiriUICardSnippetView *v5;

  v5 = objc_alloc_init(SiriUICardSnippetView);
  -[SiriUICardSnippetView setBackingViewController:](v5, "setBackingViewController:", self);
  -[SiriUICardSnippetView setDataSource:](v5, "setDataSource:", self);
  -[SiriUICardSnippetView setDelegate:](v5, "setDelegate:", self);
  -[SiriUICardSnippetViewController setView:](self, "setView:", v5);
  if (!-[SiriUISnippetViewController isLoading](self, "isLoading") && self->_cardViewController)
  {
    getSearchUICardViewControllerClass();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CRKCardViewControlling setThreeDTouchEnabled:](self->_cardViewController, "setThreeDTouchEnabled:", 0);
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUICardSnippetViewController _addCardViewControllerAsChildViewController:](self, "_addCardViewControllerAsChildViewController:", v3);

    -[SiriUICardSnippetViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUICardSnippetViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SiriUICardSnippetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backNavigationButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__navigationButtonTapped_, 64);

}

- (void)backgroundColorView:(id)a3 didFinishColorUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SiriUICardSnippetViewController backgroundColorView:didFinishColorUpdate:]";
    v10 = 1024;
    v11 = v5 != 0;
    _os_log_impl(&dword_21764F000, v6, OS_LOG_TYPE_DEFAULT, "%s #background SearchUI color update successful %d", (uint8_t *)&v8, 0x12u);
  }
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSnippetViewController:isBackgroundColorUpdateSuccessful:", self, v5 != 0);

}

- (void)setIsInAmbient:(BOOL)a3
{
  _BOOL8 v3;
  CRKCardViewControlling *cardViewController;
  CRKCardViewControlling *v6;
  CRKCardViewControlling *v7;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;

  if (self->_isInAmbient != a3)
  {
    v3 = a3;
    self->_isInAmbient = a3;
    cardViewController = self->_cardViewController;
    if (a3)
    {
      v6 = cardViewController;
      getSearchUICardViewControllerClass();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_8;
      v7 = v6;
      v8 = 0;
    }
    else
    {
      -[CRKCardViewControlling setCard:](cardViewController, "setCard:", self->_originalCard);
      v6 = self->_cardViewController;
      getSearchUICardViewControllerClass();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_8;
      v7 = v6;
      v8 = 1;
    }
    -[CRKCardViewControlling setRowSelectionAppearanceEnabled:](v7, "setRowSelectionAppearanceEnabled:", v8);
LABEL_8:

    -[SiriUICardSnippetViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[SiriUICardSnippetViewController view](self, "view");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setIsInAmbient:", v3);

    }
  }
}

- (void)_removeShouldHideInAmbientSectionsFromCurrentCard
{
  CRKCardViewControlling *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  CRKCardViewControlling *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  getSearchUICardViewControllerClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = self->_cardViewController;
    -[CRKCardViewControlling card](v3, "card");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cardSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)objc_msgSend(v4, "copy");
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v4, "cardSections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v10)
      {
        v11 = v10;
        v19 = v7;
        v20 = v3;
        v12 = 0;
        v13 = *(_QWORD *)v22;
        v14 = (os_log_t *)MEMORY[0x24BE08FB0];
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v16, "shouldHideInAmbientMode"))
            {
              v17 = *v14;
              if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v26 = "-[SiriUICardSnippetViewController _removeShouldHideInAmbientSectionsFromCurrentCard]";
                _os_log_impl(&dword_21764F000, v17, OS_LOG_TYPE_DEFAULT, "%s #ambient - In ambient mode and found a shouldHideInAmbientMode card section", buf, 0xCu);
              }
              v12 = 1;
            }
            else
            {
              objc_msgSend(v8, "addObject:", v16);
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v11);

        v3 = v20;
        v18 = v4;
        v7 = v19;
        if ((v12 & 1) != 0)
        {
          objc_msgSend(v19, "setCardSections:", v8);
          v18 = v19;
        }
      }
      else
      {

        v18 = v4;
      }
      -[CRKCardViewControlling setCard:](v3, "setCard:", v18);

    }
  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[SiriUICardSnippetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SiriUICardSnippetViewController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsInAmbientInteractivity:", v3);

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;
  _QWORD v9[5];

  height = a3.height;
  width = a3.width;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __86__SiriUICardSnippetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_24D7D9568;
  v9[4] = self;
  v7 = a4;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v9);
  v8.receiver = self;
  v8.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUICardSnippetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __86__SiriUICardSnippetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContentSizeAndNotifyDelegateIfNecessary:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  SiriUIModalContainerViewController *presentedModalContainerViewController;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  SiriUIModalContainerViewController *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUISnippetViewController viewDidAppear:](&v10, sel_viewDidAppear_, a3);
  -[SiriUICardSnippetViewController _updateContentSizeAndNotifyDelegateIfNecessary:](self, "_updateContentSizeAndNotifyDelegateIfNecessary:", 1);
  presentedModalContainerViewController = self->_presentedModalContainerViewController;
  if (presentedModalContainerViewController)
  {
    -[SiriUIModalContainerViewController contentViewController](presentedModalContainerViewController, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "siriui_shouldHideStatusBar");

    if (v6)
    {
      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "siriSnippetViewController:setStatusBarHidden:animated:", self, 0, 1);

    }
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriSnippetViewController:setStatusViewHidden:", self, 0);

    v9 = self->_presentedModalContainerViewController;
    self->_presentedModalContainerViewController = 0;

  }
  if (self->_isCardViewControllerLoading)
    -[SiriUISnippetViewController setUserConfirmationEnabled:](self, "setUserConfirmationEnabled:", 0);
}

- (void)configureContentWithSizeClass:(int64_t)a3
{
  if (self->_sizeClass != a3)
    self->_sizeClass = a3;
}

- (void)_addNextCardTo:(id)a3 fullCard:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "cardSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
LABEL_20:

    goto LABEL_21;
  }
  if (objc_msgSend(v7, "type") == 2)
  {

LABEL_5:
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v6, "cardSections", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v16, "nextCard");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v16, "nextCard");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "backingCard");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "backingCard");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "afui_hasContentEqualTo:", v21))
            {
              objc_msgSend(v6, "backingCard");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "backingCard");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[SiriUICardSnippetViewController _logCardRelationshipIdentifiedForCompactCard:fullCard:snippet:](self, "_logCardRelationshipIdentifiedForCompactCard:fullCard:snippet:", v22, v23, self->_snippet);

            }
            v18 = 1;
            goto LABEL_17;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
          continue;
        break;
      }
    }
    v18 = 0;
LABEL_17:

    objc_msgSend(v6, "cardSections");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v18 & 1) == 0)
    {
      objc_msgSend(v8, "punchoutOptions");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        objc_msgSend(v8, "setNextCard:", v7);
        objc_msgSend(v6, "backingCard");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "backingCard");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriUICardSnippetViewController _logCardRelationshipIdentifiedForCompactCard:fullCard:snippet:](self, "_logCardRelationshipIdentifiedForCompactCard:fullCard:snippet:", v26, v27, self->_snippet);

      }
    }
    goto LABEL_20;
  }
  objc_msgSend(v7, "cardSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    goto LABEL_5;
LABEL_21:

}

- (void)_removeBottomKeylineFromCard:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "cardSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(v7, "cardSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setSeparatorStyle:", 1);
  }

}

- (void)setSnippet:(id)a3
{
  SACardSnippet *v5;
  SACardSnippet **p_snippet;
  SACardSnippet *snippet;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableDictionary *referenceableCommandsByIdentifierMap;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSMutableDictionary *referenceableSnippetsByIdentifierMap;
  void *v21;
  void *v22;
  int v23;
  CRKCardPresentation *v24;
  CRKCardPresentation *cardPresentation;
  void *v26;
  void *v27;
  void *v28;
  SFCard *v29;
  SFCard *originalCard;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CRKCardPresentation *v49;
  id v50;
  unsigned __int8 isKindOfClass;
  SACardSnippet *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id location;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  const char *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v5 = (SACardSnippet *)a3;
  p_snippet = &self->_snippet;
  snippet = self->_snippet;
  if (snippet != v5 && (-[SACardSnippet isEqual:](snippet, "isEqual:", v5) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = v5;
      objc_storeStrong((id *)&self->_snippet, a3);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      -[SACardSnippet referencedCommands](*p_snippet, "referencedCommands");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v65 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
            referenceableCommandsByIdentifierMap = self->_referenceableCommandsByIdentifierMap;
            objc_msgSend(v12, "aceId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](referenceableCommandsByIdentifierMap, "setObject:forKey:", v12, v14);

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
        }
        while (v9);
      }

      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      -[SACardSnippet referencedSnippets](*p_snippet, "referencedSnippets");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v61;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v61 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
            referenceableSnippetsByIdentifierMap = self->_referenceableSnippetsByIdentifierMap;
            objc_msgSend(v19, "aceId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](referenceableSnippetsByIdentifierMap, "setObject:forKey:", v19, v21);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
        }
        while (v16);
      }

      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "cardLoggingEnabled");

      if (v23)
        -[SiriUICardSnippetViewController logContentsIfApplicable](self, "logContentsIfApplicable");
      v24 = (CRKCardPresentation *)objc_alloc_init(MEMORY[0x24BE15448]);
      cardPresentation = self->_cardPresentation;
      self->_cardPresentation = v24;

      -[CRKCardPresentation setDelegate:](self->_cardPresentation, "setDelegate:", self);
      -[SACardSnippet siriui_card](*p_snippet, "siriui_card");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "interactions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "anyObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "intent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      -[SACardSnippet siriui_card_compact](*p_snippet, "siriui_card_compact");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "backingCard");
      v29 = (SFCard *)objc_claimAutoreleasedReturnValue();
      originalCard = self->_originalCard;
      self->_originalCard = v29;

      -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "backingCard");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "cardId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SACardSnippet aceId](*p_snippet, "aceId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "storeCardID:forSnippetAceID:", v33, v34);

      if (self->_sizeClass != 1
        || (objc_msgSend(v28, "backingCard"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v35, "cardSections"),
            v36 = (void *)objc_claimAutoreleasedReturnValue(),
            v37 = v36 == 0,
            v36,
            v35,
            v37))
      {
        v41 = v26;
      }
      else
      {
        v38 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v69 = "-[SiriUICardSnippetViewController setSnippet:]";
          v70 = 2112;
          v71 = v28;
          _os_log_impl(&dword_21764F000, v38, OS_LOG_TYPE_DEFAULT, "%s Compact card exists and our size class is compact. Presenting compact card : %@", buf, 0x16u);
        }
        objc_msgSend(v28, "backingCard");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "backingCard");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriUICardSnippetViewController _addNextCardTo:fullCard:](self, "_addNextCardTo:fullCard:", v39, v40);

        v41 = v28;
        -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "backingCard");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "cardId");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[SACardSnippet aceId](*p_snippet, "aceId");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "storeCardID:forSnippetAceID:", v44, v45);

      }
      objc_msgSend(v41, "backingCard");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUICardSnippetViewController _removeBottomKeylineFromCard:](self, "_removeBottomKeylineFromCard:", v46);

      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15450]), "initWithCard:", v41);
      objc_msgSend(v47, "setLoadsBundleProviders:", 0);
      objc_msgSend(v47, "cardRequest");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setLoadsBundleServices:", 0);

      objc_msgSend(v47, "setRespectsUserConsent:", (isKindOfClass ^ 1) & 1);
      self->_isCardViewControllerLoading = 1;
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, self->_cardPresentation);
      v49 = self->_cardPresentation;
      v55[0] = MEMORY[0x24BDAC760];
      v55[1] = 3221225472;
      v55[2] = __46__SiriUICardSnippetViewController_setSnippet___block_invoke;
      v55[3] = &unk_24D7D9590;
      objc_copyWeak(&v57, (id *)buf);
      objc_copyWeak(&v58, &location);
      v50 = v41;
      v56 = v50;
      -[CRKCardPresentation setConfiguration:animated:completion:](v49, "setConfiguration:animated:completion:", v47, 0, v55);

      objc_destroyWeak(&v58);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      v5 = v52;
    }
  }

}

void __46__SiriUICardSnippetViewController_setSnippet___block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  CGRect v39;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v6 = objc_loadWeakRetained(a1 + 6);
  v7 = v6;
  if (!WeakRetained || !v6)
    goto LABEL_22;
  if (!v4)
  {
    objc_msgSend(v6, "cardViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "interactions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    getSearchUICardViewControllerClass();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_17;
    v12 = v9;
    if (objc_msgSend(WeakRetained, "isInAmbient"))
      objc_msgSend(v12, "setRowSelectionAppearanceEnabled:", 0);
    objc_msgSend(v12, "card");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(WeakRetained, "isInAmbient") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "delegate");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v13, "backgroundColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v12, "setShouldDrawBackgroundColor:", 0);
        v35 = 0;
        v36 = &v35;
        v37 = 0x2050000000;
        v16 = (void *)getSearchUIBackgroundColorViewClass_softClass;
        v38 = getSearchUIBackgroundColorViewClass_softClass;
        if (!getSearchUIBackgroundColorViewClass_softClass)
        {
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __getSearchUIBackgroundColorViewClass_block_invoke;
          v34[3] = &unk_24D7D9460;
          v34[4] = &v35;
          __getSearchUIBackgroundColorViewClass_block_invoke((uint64_t)v34);
          v16 = (void *)v36[3];
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&v35, 8);
        v14 = objc_alloc_init(v17);
        objc_msgSend(v14, "updateWithSFCard:", v13);
        objc_msgSend(v14, "setDelegate:", WeakRetained);
        objc_msgSend(WeakRetained, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "siriSnippetViewController:informHostOfBackgroundView:isSnippetAsyncColored:", WeakRetained, v14, 1);

        goto LABEL_15;
      }
    }
LABEL_16:

LABEL_17:
    objc_msgSend(v11, "intent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v11, "intent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v11, "intent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          isKindOfClass = 1;
        }
        else
        {
          objc_msgSend(v11, "intent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            isKindOfClass = 1;
          }
          else
          {
            objc_msgSend(v11, "intent");
            v29 = objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v33 = (void *)v29;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              isKindOfClass = 1;
            }
            else
            {
              objc_msgSend(v11, "intent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

            }
          }

        }
        if (v11 && (isKindOfClass & 1) == 0)
        {
          switch(objc_msgSend(v11, "intentHandlingStatus"))
          {
            case 0:
            case 1:
            case 5:
            case 6:
              v30 = 0;
              v31 = 4;
              break;
            case 2:
              v31 = 0;
              v30 = 1;
              break;
            case 3:
              v30 = 0;
              v31 = 2;
              break;
            case 4:
              v30 = 0;
              v31 = 3;
              break;
            default:
              v31 = 0;
              v30 = 0;
              break;
          }
          objc_msgSend(WeakRetained, "_forwardProgressEvent:toCardViewController:animated:", v31, v9, 0);
          objc_msgSend(WeakRetained, "_setAwaitingSuccessOrFailureEvent:", v30);
        }
        goto LABEL_21;
      }

    }
LABEL_21:
    objc_msgSend(WeakRetained, "_setCardViewController:", v9);
    objc_msgSend(WeakRetained, "setLoading:", 0);
    objc_msgSend(WeakRetained, "_addCardViewControllerAsChildViewController:", v9);
    objc_msgSend(WeakRetained, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadData");

    objc_msgSend(v9, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, CGRectGetWidth(v39), 1000.0);

    objc_msgSend(v9, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutBelowIfNeeded");

    objc_msgSend(WeakRetained, "_updateContentSizeAndNotifyDelegateIfNecessary:", 1);
    objc_msgSend(WeakRetained, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "siriSnippetViewControllerViewDidLoad:", WeakRetained);

    goto LABEL_22;
  }
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    __46__SiriUICardSnippetViewController_setSnippet___block_invoke_cold_1((uint64_t)v4, (uint64_t)a1, v8);
LABEL_22:

}

- (UIEdgeInsets)defaultViewInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)usePlatterStyle
{
  return 1;
}

- (double)desiredHeight
{
  CGSize *p_contentSize;
  double result;

  p_contentSize = &self->_contentSize;
  result = self->_contentSize.height;
  if (self->_contentSize.width == *MEMORY[0x24BDBF148] && result == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[SiriUICardSnippetViewController _updateContentSizeAndNotifyDelegateIfNecessary:](self, "_updateContentSizeAndNotifyDelegateIfNecessary:", 0, result);
    return p_contentSize->height;
  }
  return result;
}

- (BOOL)isIndicatingActivity
{
  return 0;
}

- (BOOL)logContentsIfApplicable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject **v10;
  NSObject *v11;
  SACardSnippet *snippet;
  uint64_t v13;
  NSObject *v14;
  SACardSnippet *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  SiriUICardSnippetViewController *v22;
  __int16 v23;
  SACardSnippet *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[SACardSnippet siriui_card](self->_snippet, "siriui_card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SACardSnippet siriui_card_compact](self->_snippet, "siriui_card_compact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_sizeClass == 1)
  {
    objc_msgSend(v4, "backingCard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardSections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v5;

      v3 = v8;
    }
  }
  +[SiriUICardLogger logCard:format:](SiriUICardLogger, "logCard:format:", v3, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (NSObject **)MEMORY[0x24BE08FB0];
  if (v9)
  {
    v11 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      snippet = self->_snippet;
      v17 = 136316162;
      v18 = "-[SiriUICardSnippetViewController logContentsIfApplicable]";
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = self;
      v23 = 2112;
      v24 = snippet;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_21764F000, v11, OS_LOG_TYPE_DEFAULT, "%s #cards Logged card for CardSnippetViewController\n    Card: %@\n    SnippetViewController: %@\n    Snippet: %@\n    Filename: %@", (uint8_t *)&v17, 0x34u);
    }
  }
  +[SiriUICardLogger logCard:format:](SiriUICardLogger, "logCard:format:", v3, 3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = *v10;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_snippet;
      v17 = 136316162;
      v18 = "-[SiriUICardSnippetViewController logContentsIfApplicable]";
      v19 = 2112;
      v20 = v3;
      v21 = 2112;
      v22 = self;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_21764F000, v14, OS_LOG_TYPE_DEFAULT, "%s #cards Logged card for CardSnippetViewController\n    Card: %@\n    SnippetViewController: %@\n    Snippet: %@\n    Filename: %@", (uint8_t *)&v17, 0x34u);
    }
  }

  return (v9 | v13) != 0;
}

- (id)requestContext
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v38 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[SACardSnippet siriui_card](self->_snippet, "siriui_card");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingCard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityProtobufMessages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[SACardSnippet siriui_card](self->_snippet, "siriui_card");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backingCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entityProtobufMessages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v15 = objc_alloc_init(MEMORY[0x24BE81500]);
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAceId:", v17);

          objc_msgSend(v14, "protobufMessageData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setData:", v18);

          objc_msgSend(v14, "protobufMessageName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setTypeName:", v19);

          objc_msgSend(v38, "addObject:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v11);
    }
    goto LABEL_12;
  }
  -[SACardSnippet siriui_card](self->_snippet, "siriui_card");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "backingCard");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entityIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[SACardSnippet siriui_card](self->_snippet, "siriui_card");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "backingCard");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entityIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v23, "initWithData:encoding:", v26, 4);
    objc_msgSend(v27, "stringByRemovingPercentEncoding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_alloc(MEMORY[0x24BE85158]);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithNSURL:", v29);

    v31 = objc_alloc_init(MEMORY[0x24BE81500]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "UUIDString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAceId:", v33);

    objc_msgSend(v30, "data");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setData:", v34);

    objc_msgSend(v30, "_siriui_protobufTypeName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setTypeName:", v35);

    objc_msgSend(v38, "addObject:", v31);
LABEL_12:

  }
  v36 = (void *)objc_msgSend(v38, "copy");

  return v36;
}

- (void)setNavigating:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUICardSnippetViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigating:", v3);

}

- (BOOL)isNavigating
{
  void *v2;
  char v3;

  -[SiriUICardSnippetViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNavigating");

  return v3;
}

- (void)wasAddedToTranscript
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUIBaseSnippetViewController wasAddedToTranscript](&v6, sel_wasAddedToTranscript);
  if (-[SiriUISnippetViewController isVirgin](self, "isVirgin"))
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cardEventDidOccur:withIdentifier:userInfo:", 0, 0, 0);

    }
  }
}

- (void)siriDidDeactivate
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUIBaseSnippetViewController siriDidDeactivate](&v6, sel_siriDidDeactivate);
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardEventDidOccur:withIdentifier:userInfo:", 4, 0, 0);

  }
}

- (void)willCancel
{
  void *v3;
  char v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUISnippetViewController willCancel](&v6, sel_willCancel);
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardEventDidOccur:withIdentifier:userInfo:", 3, 0, 0);

  }
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardEventDidOccur:withIdentifier:userInfo:", 1, v7, 0);

  }
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardEventDidOccur:withIdentifier:userInfo:", 2, v8, 0);

  }
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v8, CFSTR("UpdatedRecognition"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardEventDidOccur:withIdentifier:userInfo:", 7, 0, v6);

  }
}

- (void)siriWillBeginScrolling
{
  void *v3;
  char v4;
  id v5;

  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardEventDidOccur:withIdentifier:userInfo:", 5, 0, 0);

  }
}

- (void)siriDidScrollVisible:(BOOL)a3
{
  void *v4;
  char v5;
  id v6;

  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cardEventDidOccur:withIdentifier:userInfo:", 6, 0, 0);

  }
}

- (void)siriDidTapOutsideContent
{
  void *v3;
  char v4;
  id v5;

  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardEventDidOccur:withIdentifier:userInfo:", 8, 0, 0);

  }
}

- (void)siriWillStartRequest
{
  void *v3;
  char v4;
  id v5;

  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cardEventDidOccur:withIdentifier:userInfo:", 9, 0, 0);

  }
}

- (void)siriDidReceiveViewsWithDialogPhase:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if (-[SiriUISnippetViewController _isAwaitingSuccessOrFailureEvent](self, "_isAwaitingSuccessOrFailureEvent"))
  {
    -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "card");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((objc_msgSend(v9, "isCompletionDialogPhase") & 1) != 0
        || objc_msgSend(v9, "isConfirmedDialogPhase"))
      {
        if (objc_msgSend(v9, "isConfirmedDialogPhase"))
          -[SiriUISnippetViewController setConfirmed:](self, "setConfirmed:", 1);
        v8 = 2;
LABEL_13:
        -[SiriUICardSnippetViewController _forwardProgressEventToCardViewController:](self, "_forwardProgressEventToCardViewController:", v8);
        -[SiriUISnippetViewController _setAwaitingSuccessOrFailureEvent:](self, "_setAwaitingSuccessOrFailureEvent:", 0);
        goto LABEL_14;
      }
      if ((objc_msgSend(v9, "isErrorDialogPhase") & 1) != 0 || objc_msgSend(v9, "isCancelledDialogPhase"))
      {
        if (objc_msgSend(v9, "isCancelledDialogPhase"))
          -[SiriUISnippetViewController setCancelled:](self, "setCancelled:", 1);
        v8 = 3;
        goto LABEL_13;
      }
    }
  }
LABEL_14:

}

- (void)_setCardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardViewController, a3);
  if (self->_isInAmbient)
    -[SiriUICardSnippetViewController _removeShouldHideInAmbientSectionsFromCurrentCard](self, "_removeShouldHideInAmbientSectionsFromCurrentCard");
  -[SiriUISnippetViewController setLoading:](self, "setLoading:", 0);
}

- (void)_removeCardViewControllerFromParentViewController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "didMoveToParentViewController:", 0);
    objc_msgSend(v5, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v5, "removeFromParentViewController");
  }

}

- (void)_addCardViewControllerAsChildViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SiriUICardSnippetViewController childViewControllers](self, "childViewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v8);

  if ((v5 & 1) == 0)
  {
    -[SiriUICardSnippetViewController _removeCardViewControllerFromParentViewController:](self, "_removeCardViewControllerFromParentViewController:", self->_cardViewController);
    -[SiriUICardSnippetViewController addChildViewController:](self, "addChildViewController:", v8);
    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUICardSnippetViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCardView:", v6);

    objc_msgSend(v8, "didMoveToParentViewController:", self);
  }

}

- (void)_updateContentSizeAndNotifyDelegateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  CGSize *p_contentSize;
  double width;
  double height;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  id v14;

  v3 = a3;
  p_contentSize = &self->_contentSize;
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  -[SiriUICardSnippetViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriViewControllerExpectedWidth:", self);
  objc_msgSend(v8, "sizeThatFits:", v10 + 8.0 + 8.0, 1.79769313e308);
  p_contentSize->width = v11;
  p_contentSize->height = v12;

  if (v3 && (width != p_contentSize->width || height != p_contentSize->height))
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "siriViewControllerHeightDidChange:", self);

  }
}

- (void)_beginMonitoringForNextCardWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id cardLoadingCompletionhandler;
  void *v8;
  NSTimer *v9;
  NSTimer *cardLoadingTimer;
  _QWORD v11[5];
  id v12;
  id location;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
  if (self->_isCardLoading)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
  }
  else
  {
    self->_isCardLoading = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
    objc_msgSend(MEMORY[0x24BEA8630], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", self);

    v6 = (void *)MEMORY[0x219A0F948](v4);
    cardLoadingCompletionhandler = self->_cardLoadingCompletionhandler;
    self->_cardLoadingCompletionhandler = v6;

    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x24BDBCF40];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke;
    v11[3] = &unk_24D7D95B8;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 10.0);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    cardLoadingTimer = self->_cardLoadingTimer;
    self->_cardLoadingTimer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEA8630], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", *(_QWORD *)(a1 + 32));

    v4 = WeakRetained[154];
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE15488], 401, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

      v6 = (void *)WeakRetained[154];
      WeakRetained[154] = 0;

    }
    os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
    *((_BYTE *)WeakRetained + 1248) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke_cold_1(v7);
  }

}

- (void)_validateCardForParsecFeedbackDelivery:(id)a3 validHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[CRKCardViewControlling card](self->_cardViewController, "card");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "backingCard");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v13 = 136315394;
    v14 = "-[SiriUICardSnippetViewController _validateCardForParsecFeedbackDelivery:validHandler:]";
    v15 = 1024;
    v16 = objc_msgSend(v9, "source");
    _os_log_impl(&dword_21764F000, v11, OS_LOG_TYPE_DEFAULT, "%s #cards Card source for backing card is %d", (uint8_t *)&v13, 0x12u);

  }
  if (v9)
  {
    if (objc_msgSend(v9, "source") == 1)
    {
      v12 = objc_msgSend(v8, "isEqual:", v6);
      if (v7)
      {
        if (v12)
          v7[2](v7);
      }
    }
  }

}

- (void)_validateCardSectionForParsecFeedbackDelivery:(id)a3 validHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[CRKCardViewControlling card](self->_cardViewController, "card");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "backingCard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (objc_msgSend(v8, "source") == 1)
      {
        objc_msgSend(v7, "cardSections");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v12);

        if (v6)
        {
          if (v11)
            v6[2](v6);
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

}

- (id)_metricsContextOfEventsForCard:(id)a3
{
  id v4;
  id v5;
  void *v6;
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

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("cardSectionCount"));

  -[SiriUICardSnippetViewController snippet](self, "snippet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aceId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("snippetAceId"));
  objc_msgSend(v4, "interactions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("interactionId"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "backingCard");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = v14;
      objc_msgSend(v14, "cardId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("cardId"));
      objc_msgSend(v15, "resultIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("resultId"));

    }
  }
  v18 = (void *)objc_msgSend(v5, "copy");

  return v18;
}

- (id)_metricsContextOfEventsForCardSection:(id)a3 inCard:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "cardSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "indexOfObject:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("ordinalCardSectionPosition"));

  objc_msgSend(v7, "cardSections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("cardSectionCount"));

  -[SiriUICardSnippetViewController snippet](self, "snippet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "aceId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("snippetAceId"));
  objc_msgSend(v7, "interactions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "anyObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v8, "setObject:forKey:", v19, CFSTR("interactionId"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "backingCardSection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, "cardSectionId");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v8, "setObject:forKey:", v22, CFSTR("cardSectionId"));
      objc_msgSend(v21, "resultIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v8, "setObject:forKey:", v23, CFSTR("resultId"));
      v30 = (void *)v22;
      objc_msgSend(v21, "nextCard");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "cardId");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
        objc_msgSend(v8, "setObject:forKey:", v25, CFSTR("nextCardId"));
      objc_msgSend(v21, "nextCard");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "resultIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v8, "setObject:forKey:", v27, CFSTR("nextCardResultId"));

    }
  }
  v28 = (void *)objc_msgSend(v8, "copy");

  return v28;
}

- (void)_insertCardViewController:(id)a3
{
  void *v4;
  id v5;

  -[SiriUICardSnippetViewController _addCardViewControllerAsChildViewController:](self, "_addCardViewControllerAsChildViewController:", a3);
  -[SiriUICardSnippetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[SiriUICardSnippetViewController _updateContentSizeAndNotifyDelegateIfNecessary:](self, "_updateContentSizeAndNotifyDelegateIfNecessary:", 1);
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriSnippetViewControllerViewDidLoad:", self);

}

- (void)willConfirm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUICardSnippetViewController;
  -[SiriUISnippetViewController willConfirm](&v7, sel_willConfirm);
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "card");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SiriUICardSnippetViewController _forwardProgressEventToCardViewController:](self, "_forwardProgressEventToCardViewController:", 0);
    -[SiriUISnippetViewController _setAwaitingSuccessOrFailureEvent:](self, "_setAwaitingSuccessOrFailureEvent:", 1);
  }
}

- (void)_forwardProgressEventToCardViewController:(unint64_t)a3
{
  id v5;

  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:](self, "_forwardProgressEvent:toCardViewController:animated:", a3, v5, 1);

}

- (void)_forwardProgressEvent:(unint64_t)a3 toCardViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v5 = a5;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE15520]);
  objc_msgSend(v8, "setEvent:", a3);
  objc_msgSend(v8, "setAnimatesProgress:", v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke;
    v10[3] = &unk_24D7D95E0;
    v11 = v7;
    objc_msgSend(v11, "handleCardCommand:reply:", v8, v10);

  }
  else
  {
    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:].cold.1((uint64_t)v7, v9);
  }

}

void __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }

}

- (void)_navigationButtonTapped:(id)a3
{
  id v3;
  id v4;

  -[SiriUICardSnippetViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (id)localeForCardSnippetView:(id)a3
{
  void *v4;
  void *v5;

  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeForSiriViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)preferredContentHeight
{
  double v2;

  -[CRKCardViewControlling preferredContentSize](self->_cardViewController, "preferredContentSize");
  return v2;
}

- (void)cardSnippetViewSashWasTapped:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SiriUIBaseSnippetViewController sashItem](self, "sashItem", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriUICardSnippetViewController cardSnippetViewSashWasTapped:]";
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_21764F000, v5, OS_LOG_TYPE_DEFAULT, "%s #cards Card snippet's sash %@ tapped", buf, 0x16u);
  }
  objc_msgSend(v4, "commands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commands");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v9 & 1) != 0)
      objc_msgSend(v10, "siriSnippetViewController:performAceCommands:sashItem:", self, v11, v4);
    else
      objc_msgSend(v10, "siriViewController:performAceCommands:", self, v11);
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v4, "applicationBundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(v4, "canPunchout");

    if (v14)
    {
      v10 = objc_alloc_init(MEMORY[0x24BE81860]);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAceId:", v16);

      objc_msgSend(v10, "setAppAvailableInStorefront:", 1);
      objc_msgSend(v4, "applicationBundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBundleId:", v17);

      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_opt_respondsToSelector();

      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 & 1) != 0)
      {
        v21 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "siriSnippetViewController:performAceCommands:sashItem:", self, v19, v4);
      }
      else
      {
        v20 = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "siriViewController:performAceCommands:", self, v19);
      }

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)cardViewControllerDidLoad:(id)a3
{
  id v4;

  v4 = a3;
  if (-[SiriUISnippetViewController isLoading](self, "isLoading"))
  {
    -[SiriUISnippetViewController setLoading:](self, "setLoading:", 0);
    -[SiriUICardSnippetViewController _insertCardViewController:](self, "_insertCardViewController:", v4);
  }
  self->_isCardViewControllerLoading = 0;
  -[SiriUISnippetViewController setUserConfirmationEnabled:](self, "setUserConfirmationEnabled:", 1);

}

- (void)cardViewControllerBoundsDidChange:(id)a3
{
  -[SiriUICardSnippetViewController _updateContentSizeAndNotifyDelegateIfNecessary:](self, "_updateContentSizeAndNotifyDelegateIfNecessary:", 1);
}

- (void)cardViewController:(id)a3 requestsHandlingOfIntent:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__SiriUICardSnippetViewController_cardViewController_requestsHandlingOfIntent___block_invoke;
  block[3] = &unk_24D7D91F8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __79__SiriUICardSnippetViewController_cardViewController_requestsHandlingOfIntent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "confirmSnippet");
}

- (BOOL)performReferentialCommand:(id)a3 forCardViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SiriUICardSnippetViewController performReferentialCommand:forCardViewController:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Perform referential command %@", buf, 0x16u);
  }
  objc_msgSend(v6, "referenceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_referenceableCommandsByIdentifierMap, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_siriui_applyUserInfoDictionary:", v11);

  }
  if (v10)
  {
    SRUIFPopulateSendCommandWithInstrumentationTurn();
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "siriViewController:performAceCommands:", self, v13);
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_referenceableSnippetsByIdentifierMap, "objectForKey:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v16 = 0;
      goto LABEL_10;
    }
    v12 = (void *)v14;
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "siriSnippetViewController:pushSirilandSnippets:", self, v15);

  }
  v16 = 1;
LABEL_10:

  return v16;
}

- (BOOL)performNextCardCommand:(id)a3 forCardViewController:(id)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  SACardSnippet *v8;
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
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[SiriUICardSnippetViewController performNextCardCommand:forCardViewController:]";
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_21764F000, v6, OS_LOG_TYPE_DEFAULT, "%s #cards Perform next card command %@", buf, 0x16u);
  }
  v7 = (objc_class *)MEMORY[0x24BE811A0];
  v8 = self->_snippet;
  v9 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAceId:", v11);

  v12 = (void *)MEMORY[0x24BE154F8];
  objc_msgSend(v5, "nextCard");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "originalDataForCard:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCardData:", v14);

  -[SACardSnippet referencedCommands](v8, "referencedCommands");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReferencedCommands:", v15);

  -[SACardSnippet referencedSnippets](v8, "referencedSnippets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReferencedSnippets:", v16);

  -[SACardSnippet sash](v8, "sash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSash:", v17);

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "siriSnippetViewController:pushSirilandSnippets:", self, v19);

  return 1;
}

- (BOOL)performPunchoutCommand:(id)a3 forCardViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "-[SiriUICardSnippetViewController performPunchoutCommand:forCardViewController:]";
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Perform punch out command %@", buf, 0x16u);
  }
  objc_msgSend(v6, "punchout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "punchout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "urls");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  getSearchUICardViewControllerClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v7, "setThreeDTouchEnabled:", 0);
  if (v10)
  {
    v13 = objc_alloc_init(MEMORY[0x24BE81860]);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAceId:", v15);

    objc_msgSend(v13, "setAppAvailableInStorefront:", 1);
    objc_msgSend(v13, "setBundleId:", v10);
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPunchOutUri:", v16);

    }
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "siriViewController:performAceCommands:", self, v18);

  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v6, "punchout");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "urls");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v20)
    {
      v21 = v20;
      v27 = v9;
      v28 = v7;
      v22 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v13);
          v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[SiriUIBaseSnippetViewController delegate](self, "delegate", v27, v28);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "siriViewController:openURL:completion:", self, v24, 0);

        }
        v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v21);
      v9 = v27;
      v7 = v28;
    }
  }

  return 1;
}

- (BOOL)performInvocationPayloadCommand:(id)a3 forCardViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315394;
    v24 = "-[SiriUICardSnippetViewController performInvocationPayloadCommand:forCardViewController:]";
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Perform invocation payload command %@", (uint8_t *)&v23, 0x16u);
  }
  -[SiriUICardSnippetViewController _inspectPayloadForMetricsEvents:](self, "_inspectPayloadForMetricsEvents:", v6);
  v9 = objc_alloc(MEMORY[0x24BE99168]);
  objc_msgSend(v6, "invocationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithIdentifier:", v10);

  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserData:", v12);

  v13 = objc_alloc_init(MEMORY[0x24BE99160]);
  objc_msgSend(v13, "setInputOrigin:", *MEMORY[0x24BE821C0]);
  objc_msgSend(v13, "setInteractionType:", *MEMORY[0x24BE82230]);
  objc_msgSend(MEMORY[0x24BE99158], "runSiriKitExecutorCommandWithContext:payload:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE99158], "wrapCommandInStartLocalRequest:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentInstrumentationTurnContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "turnIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "siriSnippetViewController:handleStartLocalRequest:turnIdentifier:", self, v15, v21);

  }
  return 1;
}

- (void)_inspectPayloadForMetricsEvents:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "invocationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE99228]);

  if (v5)
    -[SiriUICardSnippetViewController _emitInstrumentationEventWithInvocationSource:](self, "_emitInstrumentationEventWithInvocationSource:", 59);
}

- (BOOL)performBeganEditingCommand:(id)a3 forCardViewController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SiriUICardSnippetViewController performBeganEditingCommand:forCardViewController:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21764F000, v6, OS_LOG_TYPE_DEFAULT, "%s #cards CRBeganEditingCommand received for %@. Hiding status view and alerting our delegate", (uint8_t *)&v10, 0x16u);
  }
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSnippetViewController:setStatusViewHidden:", self, 1);

  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriViewControllerWillBeginEditing:", self);

  -[SiriUICardSnippetViewController _emitInstrumentationEventForKeyboardInvocation](self, "_emitInstrumentationEventForKeyboardInvocation");
  return 1;
}

- (BOOL)performFinishedEditingCommand:(id)a3 forCardViewController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[SiriUICardSnippetViewController performFinishedEditingCommand:forCardViewController:]";
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21764F000, v6, OS_LOG_TYPE_DEFAULT, "%s #cards CRFinishedEditingCommand received for %@. Showing status view and alerting our delegate", (uint8_t *)&v10, 0x16u);
  }
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "siriSnippetViewController:setStatusViewHidden:", self, 0);

  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "siriViewControllerDidEndEditing:", self);

  return 1;
}

- (CGSize)cardViewController:(id)a3 boundingSizeForCardSectionViewController:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SiriUIBaseSnippetViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriViewControllerExpectedWidth:", self);
  v7 = v6 - 8.0 - 8.0;

  v8 = 1.79769313e308;
  v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (unint64_t)navigationIndexOfCardViewController:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[SiriUIBaseSnippetViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "navigationIndexOfSnippetViewController:", self);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)presentViewController:(id)a3 forCardViewController:(id)a4
{
  SiriUIModalContainerViewController *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  SiriUIModalContainerViewController *v10;
  char v11;
  SiriUIModalContainerViewController *v12;
  SiriUIModalContainerViewController *v13;
  SiriUIModalContainerViewController *v14;
  SiriUIModalContainerViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  _QWORD v23[4];
  SiriUIModalContainerViewController *v24;
  SiriUICardSnippetViewController *v25;
  SiriUIModalContainerViewController *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  SiriUIModalContainerViewController *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = (SiriUIModalContainerViewController *)a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[SiriUICardSnippetViewController presentViewController:forCardViewController:]";
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Presenting view controller: %@ for card view controller: %@", buf, 0x20u);
  }
  v9 = -[SiriUIModalContainerViewController modalPresentationStyle](v6, "modalPresentationStyle");
  v10 = 0;
  v11 = v9 + 2;
  if ((unint64_t)(v9 + 2) > 0xA)
  {
    v13 = 0;
    goto LABEL_6;
  }
  v12 = v6;
  if (((1 << v11) & 0x73B) == 0)
  {
    if (((1 << v11) & 0x84) != 0)
    {
      v12 = -[SiriUIModalContainerViewController initWithContentViewController:]([SiriUIModalContainerViewController alloc], "initWithContentViewController:", v6);
      -[SiriUIModalContainerViewController setDelegate:](v12, "setDelegate:", self);
      -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "siriSnippetViewController:willPresentViewController:", self, v6);

      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "siriSnippetViewController:setStatusViewHidden:", self, 1);

      if (!-[UIViewController siriui_shouldHideStatusBar](v6, "siriui_shouldHideStatusBar"))
      {
        v10 = v12;
        goto LABEL_5;
      }
      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "siriSnippetViewController:setStatusBarHidden:animated:", self, 1, 1);
      v10 = v12;
    }
    else
    {
      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "siriSnippetViewController:setStatusViewHidden:", self, 1);

      if (-[UIViewController siriui_shouldHideStatusBar](v6, "siriui_shouldHideStatusBar"))
      {
        -[SiriUIBaseSnippetViewController delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "siriSnippetViewController:setStatusBarHidden:animated:", self, 1, 1);

      }
      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_opt_respondsToSelector();

      if ((v22 & 1) == 0)
      {
        v10 = 0;
        v12 = v6;
        goto LABEL_5;
      }
      -[SiriUIBaseSnippetViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "siriViewController:setTypeToSiriViewHidden:", self, 1);
      v10 = 0;
      v12 = v6;
    }

  }
LABEL_5:
  v13 = v10;
  v10 = v12;
LABEL_6:
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __79__SiriUICardSnippetViewController_presentViewController_forCardViewController___block_invoke;
  v23[3] = &unk_24D7D9540;
  v24 = v13;
  v25 = self;
  v26 = v6;
  v14 = v6;
  v15 = v13;
  -[SiriUICardSnippetViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, v23);

}

void __79__SiriUICardSnippetViewController_presentViewController_forCardViewController___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1288), v2);
  objc_msgSend(*(id *)(a1 + 40), "_privateDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriSnippetViewController:didPresentViewController:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)cardViewController:(id)a3 willDismissViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315650;
    v15 = "-[SiriUICardSnippetViewController cardViewController:willDismissViewController:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Card view controller %@ dismissing view controller %@", (uint8_t *)&v14, 0x20u);
  }
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "siriSnippetViewController:setStatusViewHidden:", self, 0);

  if (objc_msgSend(v6, "siriui_shouldHideStatusBar"))
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "siriSnippetViewController:setStatusBarHidden:animated:", self, 0, 1);

  }
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "siriViewController:setTypeToSiriViewHidden:", self, 0);

  }
}

- (void)modalContainerViewControllerViewWillDisappear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "siriSnippetViewController:setStatusViewHidden:", self, 0);

  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "siriSnippetViewController:willDismissViewController:", self, v7);

  objc_msgSend(v4, "contentViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v8, "siriui_shouldHideStatusBar");
  if ((_DWORD)v4)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "siriSnippetViewController:setStatusBarHidden:animated:", self, 0, 1);

  }
}

- (void)modalContainerViewControllerViewDidDisappear:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SiriUISnippetViewController _privateDelegate](self, "_privateDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "siriSnippetViewController:didDismissViewController:", self, v5);
}

- (void)cardSectionView:(id)a3 willProcessEngagementFeedback:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SiriUIBaseSnippetViewController instrumentationTurnIdentifier](self, "instrumentationTurnIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _instrumentCardSectionInteractionForCardSection:previousTurn:](self, "_instrumentCardSectionInteractionForCardSection:previousTurn:", v5, v6);

}

- (void)userDidEngageCardSection:(id)a3 withEngagementFeedback:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  os_log_t *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  os_log_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(a4, "backingFeedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "actionTarget") == 1 || objc_msgSend(v7, "actionTarget") == 2)
  {
    if (objc_msgSend(v7, "actionTarget") == 1)
      v8 = 3;
    else
      v8 = 4 * (objc_msgSend(v7, "actionTarget") == 2);
    -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destination");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "urls");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emitPunchOutEventWithURL:appID:punchoutOrigin:", v12, v14, v8);

  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __83__SiriUICardSnippetViewController_userDidEngageCardSection_withEngagementFeedback___block_invoke;
  v35[3] = &unk_24D7D91F8;
  v15 = v7;
  v36 = v15;
  -[SiriUICardSnippetViewController _validateCardSectionForParsecFeedbackDelivery:validHandler:](self, "_validateCardSectionForParsecFeedbackDelivery:validHandler:", v6, v35);
  -[CRKCardViewControlling card](self->_cardViewController, "card");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCardSection:inCard:](self, "_metricsContextOfEventsForCardSection:inCard:", v6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("cardSectionId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", CFSTR("ordinalCardSectionPosition"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");
  objc_msgSend(v17, "objectForKey:", CFSTR("snippetAceId"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "emitUUFRCasinoCardSelectedEventWithCardSectionID:ordinalCardSectionPosition:snippetAceId:", v19, v21, v22);

  v23 = (os_log_t *)MEMORY[0x24BE08FB0];
  v24 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v25 = v24;
    AFAnalyticsEventTypeGetName();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[SiriUICardSnippetViewController userDidEngageCardSection:withEngagementFeedback:]";
    v39 = 2112;
    v40 = v26;
    _os_log_impl(&dword_21764F000, v25, OS_LOG_TYPE_DEFAULT, "%s Sending event to AFAnalytics: %@", buf, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "logEventWithType:context:", 3905, v17);

  v28 = *v23;
  if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
  {
    v29 = v28;
    AFAnalyticsEventTypeGetName();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v38 = "-[SiriUICardSnippetViewController userDidEngageCardSection:withEngagementFeedback:]";
    v39 = 2112;
    v40 = v30;
    _os_log_impl(&dword_21764F000, v29, OS_LOG_TYPE_DEFAULT, "%s Sending event to AFAnalytics: %@", buf, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCard:](self, "_metricsContextOfEventsForCard:", v16);
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "logEventWithType:context:", 3904, v32);

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    -[SiriUIBaseSnippetViewController delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "userTouchedSnippet");

  }
}

uint64_t __83__SiriUICardSnippetViewController_userDidEngageCardSection_withEngagementFeedback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SiriUICardSnippetViewController userDidEngageCardSection:withEngagementFeedback:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_21764F000, v2, OS_LOG_TYPE_DEFAULT, "%s #cards Sending feedback to registered feedbackListeners: %@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "queryId");
  return SFFeedbackNotify();
}

- (void)_instrumentCardSectionInteractionForCardSection:(id)a3 previousTurn:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *feedbackEngagementInstrumentationIdentifier;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE95B28]);
  objc_msgSend(v8, "setInvocationSource:", 11);
  v9 = objc_alloc_init(MEMORY[0x24BE95C98]);
  objc_msgSend(v6, "cardSectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setViewID:", v10);

  objc_msgSend(v8, "setViewContainer:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "backingCardSection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resultIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v12)
    {
      v13 = objc_alloc_init(MEMORY[0x24BE95C90]);
      objc_msgSend(v13, "setResultIdentifier:", v12);
      objc_msgSend(v8, "setCardInvocationContext:", v13);

    }
  }
  v14 = (void *)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v7);
  v15 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v14, "turnIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136315650;
    v24 = "-[SiriUICardSnippetViewController _instrumentCardSectionInteractionForCardSection:previousTurn:]";
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_21764F000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v23, 0x20u);

  }
  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storeCurrentInstrumentationTurnContext:", v14);

  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "emitInstrumentation:", v8);

  objc_msgSend(v14, "turnIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "UUIDString");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  feedbackEngagementInstrumentationIdentifier = self->_feedbackEngagementInstrumentationIdentifier;
  self->_feedbackEngagementInstrumentationIdentifier = v21;

}

- (void)_emitInstrumentationEventWithInvocationSource:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v3 = *(_QWORD *)&a3;
  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BE95B28]);
  objc_msgSend(v5, "setInvocationSource:", v3);
  v6 = (void *)MEMORY[0x24BE090D0];
  -[SiriUIBaseSnippetViewController instrumentationTurnIdentifier](self, "instrumentationTurnIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "newTurnBasedContextWithPreviousTurnID:", v7);

  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v8, "turnIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIBaseSnippetViewController instrumentationTurnIdentifier](self, "instrumentationTurnIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315650;
    v16 = "-[SiriUICardSnippetViewController _emitInstrumentationEventWithInvocationSource:]";
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_21764F000, v10, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v15, 0x20u);

  }
  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "storeCurrentInstrumentationTurnContext:", v8);

  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "emitInstrumentation:", v5);

}

- (void)_emitInstrumentationEventForKeyboardInvocation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = objc_alloc_init(MEMORY[0x24BE95AC8]);
  v3 = (void *)MEMORY[0x24BE95CA8];
  -[SiriUICardSnippetViewController textInputMode](self, "textInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "convertLanguageCodeToSchemaLocale:", v5);

  objc_msgSend(v8, "setKeyboardLocale:", v6);
  objc_msgSend(v8, "setKeyboardPresented:", 1);
  v7 = objc_alloc_init(MEMORY[0x24BE95B28]);
  objc_msgSend(v7, "setInvocationSource:", 11);
  objc_msgSend(v7, "setKeyboardInvocationContext:", v8);
  -[SiriUICardSnippetViewController _emitInstrumentationEvent:requiresNewTurn:](self, "_emitInstrumentationEvent:requiresNewTurn:", v7, 1);

}

- (void)_emitInstrumentationEvent:(id)a3 requiresNewTurn:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (v4)
  {
    -[SiriUIBaseSnippetViewController instrumentationTurnIdentifier](self, "instrumentationTurnIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:", v7);
    v9 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      objc_msgSend(v8, "turnIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315650;
      v15 = "-[SiriUICardSnippetViewController _emitInstrumentationEvent:requiresNewTurn:]";
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_21764F000, v10, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", (uint8_t *)&v14, 0x20u);

    }
    -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storeCurrentInstrumentationTurnContext:", v8);

  }
  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitInstrumentation:", v6);

}

- (id)_instrumentationManager
{
  return (id)objc_msgSend(MEMORY[0x24BEA8640], "sharedManager");
}

- (void)userDidReportFeedback:(id)a3 fromCardSection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE84F90]);
  -[CRKCardViewControlling card](self->_cardViewController, "card");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "backingCard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v11 = 0;
    if (!v10)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v7, "backingCardSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_8:
    objc_msgSend(v10, "fbr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFbr:", v12);

  }
LABEL_9:
  if (v11)
  {
    objc_msgSend(v11, "resultIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIdentifier:", v13);

  }
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__SiriUICardSnippetViewController_userDidReportFeedback_fromCardSection___block_invoke;
  v16[3] = &unk_24D7D9518;
  v17 = v6;
  v18 = v8;
  v14 = v8;
  v15 = v6;
  -[SiriUICardSnippetViewController _validateCardSectionForParsecFeedbackDelivery:validHandler:](self, "_validateCardSectionForParsecFeedbackDelivery:validHandler:", v7, v16);

}

void __73__SiriUICardSnippetViewController_userDidReportFeedback_fromCardSection___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "backingFeedback");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setResult:", *(_QWORD *)(a1 + 40));
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315394;
      v5 = "-[SiriUICardSnippetViewController userDidReportFeedback:fromCardSection:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_impl(&dword_21764F000, v3, OS_LOG_TYPE_DEFAULT, "%s #cards Sending user response feedback to registered feedbackListeners: %@", (uint8_t *)&v4, 0x16u);
    }
    objc_msgSend(v2, "queryId");
    SFFeedbackNotify();

  }
}

- (void)cardViewWillAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[CRKCardViewControlling card](self->_cardViewController, "card", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    AFAnalyticsEventTypeGetName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SiriUICardSnippetViewController cardViewWillAppearForCard:withAppearanceFeedback:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_21764F000, v7, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v11, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCard:](self, "_metricsContextOfEventsForCard:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 3900, v10);

}

- (void)cardViewDidAppearForCard:(id)a3 withAppearanceFeedback:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __83__SiriUICardSnippetViewController_cardViewDidAppearForCard_withAppearanceFeedback___block_invoke;
  v14[3] = &unk_24D7D91F8;
  v7 = v6;
  v15 = v7;
  -[SiriUICardSnippetViewController _validateCardForParsecFeedbackDelivery:validHandler:](self, "_validateCardForParsecFeedbackDelivery:validHandler:", a3, v14);
  -[CRKCardViewControlling card](self->_cardViewController, "card");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    AFAnalyticsEventTypeGetName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[SiriUICardSnippetViewController cardViewDidAppearForCard:withAppearanceFeedback:]";
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_21764F000, v10, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", buf, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCard:](self, "_metricsContextOfEventsForCard:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logEventWithType:context:", 3901, v13);

}

void __83__SiriUICardSnippetViewController_cardViewDidAppearForCard_withAppearanceFeedback___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "backingFeedback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[SiriUICardSnippetViewController cardViewDidAppearForCard:withAppearanceFeedback:]_block_invoke";
    v5 = 2112;
    v6 = v1;
    _os_log_impl(&dword_21764F000, v2, OS_LOG_TYPE_DEFAULT, "%s #cards Sending feedback to registered feedbackListeners: %@", (uint8_t *)&v3, 0x16u);
  }
  objc_msgSend(v1, "queryId");
  SFFeedbackNotify();

}

- (void)cardViewDidDisappearForCard:(id)a3 withDisappearanceFeedback:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __89__SiriUICardSnippetViewController_cardViewDidDisappearForCard_withDisappearanceFeedback___block_invoke;
  v8[3] = &unk_24D7D91F8;
  v9 = v6;
  v7 = v6;
  -[SiriUICardSnippetViewController _validateCardForParsecFeedbackDelivery:validHandler:](self, "_validateCardForParsecFeedbackDelivery:validHandler:", a3, v8);

}

void __89__SiriUICardSnippetViewController_cardViewDidDisappearForCard_withDisappearanceFeedback___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "backingFeedback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[SiriUICardSnippetViewController cardViewDidDisappearForCard:withDisappearanceFeedback:]_block_invoke";
    v5 = 2112;
    v6 = v1;
    _os_log_impl(&dword_21764F000, v2, OS_LOG_TYPE_DEFAULT, "%s #cards Sending feedback to registered feedbackListeners: %@", (uint8_t *)&v3, 0x16u);
  }
  objc_msgSend(v1, "queryId");
  SFFeedbackNotify();

}

- (void)cardSectionViewWillAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  CRKCardViewControlling *cardViewController;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  cardViewController = self->_cardViewController;
  v6 = a3;
  -[CRKCardViewControlling card](cardViewController, "card");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    AFAnalyticsEventTypeGetName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[SiriUICardSnippetViewController cardSectionViewWillAppearForCardSection:withAppearanceFeedback:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_21764F000, v9, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v13, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCardSection:inCard:](self, "_metricsContextOfEventsForCardSection:inCard:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "logEventWithType:context:", 3902, v12);
}

- (void)cardSectionViewDidAppearForCardSection:(id)a3 withAppearanceFeedback:(id)a4
{
  CRKCardViewControlling *cardViewController;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  cardViewController = self->_cardViewController;
  v6 = a3;
  -[CRKCardViewControlling card](cardViewController, "card");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    AFAnalyticsEventTypeGetName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[SiriUICardSnippetViewController cardSectionViewDidAppearForCardSection:withAppearanceFeedback:]";
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_21764F000, v9, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v13, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCardSection:inCard:](self, "_metricsContextOfEventsForCardSection:inCard:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "logEventWithType:context:", 3903, v12);
}

- (void)controllerForCard:(id)a3 didRequestAsyncCard:(id)a4 withAsyncCardRequestFeedback:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    AFAnalyticsEventTypeGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SiriUICardSnippetViewController controllerForCard:didRequestAsyncCard:withAsyncCardRequestFeedback:]";
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v12, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCard:](self, "_metricsContextOfEventsForCard:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEventWithType:context:", 3906, v11);

}

- (void)controllerForCard:(id)a3 didReceiveAsyncCard:(id)a4 withAsyncCardReceiptFeedback:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    AFAnalyticsEventTypeGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315394;
    v13 = "-[SiriUICardSnippetViewController controllerForCard:didReceiveAsyncCard:withAsyncCardReceiptFeedback:]";
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_21764F000, v8, OS_LOG_TYPE_DEFAULT, "%s #cards Sending event to AFAnalytics: %@", (uint8_t *)&v12, 0x16u);

  }
  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUICardSnippetViewController _metricsContextOfEventsForCard:](self, "_metricsContextOfEventsForCard:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEventWithType:context:", 3907, v11);

}

- (BOOL)cardLoader:(id)a3 shouldLoadCard:(id)a4
{
  return objc_msgSend(a4, "type", a3) == 3;
}

- (BOOL)cardLoader:(id)a3 loadCard:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v7, "entityIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);
  objc_msgSend(v11, "stringByRemovingPercentEncoding");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("&"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v14)
  {
    v15 = v14;
    v29 = v12;
    v30 = v8;
    v31 = v7;
    v16 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v33 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "rangeOfString:", CFSTR("="));
        objc_msgSend(v18, "substringToIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "substringFromIndex:", v19 + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("utterance")))
        {

          goto LABEL_11;
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v15)
        continue;
      break;
    }
    v21 = 0;
LABEL_11:
    v8 = v30;
    v7 = v31;
    v12 = v29;
  }
  else
  {
    v21 = 0;
  }

  v22 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[SiriUICardSnippetViewController cardLoader:loadCard:withCompletionHandler:]";
    v39 = 2112;
    v40 = v21;
    _os_log_impl(&dword_21764F000, v22, OS_LOG_TYPE_DEFAULT, "%s #cards Machine utterance %@ for card loading", buf, 0x16u);
  }
  v23 = objc_alloc_init(MEMORY[0x24BE817B0]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAceId:", v25);

  objc_msgSend(v23, "setUtterance:", v21);
  -[SiriUICardSnippetViewController _beginMonitoringForNextCardWithBlock:](self, "_beginMonitoringForNextCardWithBlock:", v8);
  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "siriViewController:performAceCommands:", self, v27);

  return 1;
}

- (void)cardLoadingMonitor:(id)a3 didReceiveCardSnippet:(id)a4
{
  id v7;
  SACardSnippet **p_newlyLoadedCardSnippet;
  id v9;
  NSTimer *cardLoadingTimer;
  void *v11;
  void *v12;
  NSObject *v13;
  void (**cardLoadingCompletionhandler)(id, void *, _QWORD);
  id v15;
  SACardSnippet *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  p_newlyLoadedCardSnippet = &self->_newlyLoadedCardSnippet;
  objc_storeStrong((id *)&self->_newlyLoadedCardSnippet, a4);
  v9 = a3;
  -[NSTimer invalidate](self->_cardLoadingTimer, "invalidate");
  cardLoadingTimer = self->_cardLoadingTimer;
  self->_cardLoadingTimer = 0;

  objc_msgSend(v9, "removeObserver:", self);
  if (self->_newlyLoadedCardSnippet)
  {
    -[SACardSnippet siriui_card](self->_newlyLoadedCardSnippet, "siriui_card");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "backingCard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[SiriUICardSnippetViewController cardLoadingMonitor:didReceiveCardSnippet:]";
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_21764F000, v13, OS_LOG_TYPE_DEFAULT, "%s #cards CardLoadingMonitor received next card %@", (uint8_t *)&v17, 0x16u);
    }
    cardLoadingCompletionhandler = (void (**)(id, void *, _QWORD))self->_cardLoadingCompletionhandler;
    if (cardLoadingCompletionhandler)
    {
      cardLoadingCompletionhandler[2](cardLoadingCompletionhandler, v12, 0);
      v15 = self->_cardLoadingCompletionhandler;
      self->_cardLoadingCompletionhandler = 0;

    }
    v16 = *p_newlyLoadedCardSnippet;
    *p_newlyLoadedCardSnippet = 0;

  }
  os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
  self->_isCardLoading = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);

}

- (void)cardLoadingMonitor:(id)a3 didReceiveVisualResponseSnippet:(id)a4
{
  NSTimer *cardLoadingTimer;
  id v7;
  id v8;
  NSTimer *v9;
  id cardLoadingCompletionhandler;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  cardLoadingTimer = self->_cardLoadingTimer;
  v7 = a4;
  v8 = a3;
  -[NSTimer invalidate](cardLoadingTimer, "invalidate");
  v9 = self->_cardLoadingTimer;
  self->_cardLoadingTimer = 0;

  objc_msgSend(v8, "removeObserver:", self);
  cardLoadingCompletionhandler = self->_cardLoadingCompletionhandler;
  self->_cardLoadingCompletionhandler = 0;

  -[SiriUIBaseSnippetViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "siriSnippetViewController:pushSirilandSnippets:", self, v12);
  os_unfair_lock_lock((os_unfair_lock_t)&cardLoadingLock);
  self->_isCardLoading = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&cardLoadingLock);
}

- (Class)transparentHeaderViewClass
{
  void *v2;
  void *v3;

  -[SACardSnippet title](self->_snippet, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (Class)v3;
}

- (void)configureReusableTransparentHeaderView:(id)a3
{
  SACardSnippet *snippet;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    snippet = self->_snippet;
    v5 = v7;
    -[SACardSnippet title](snippet, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureWithTitle:", v6);

  }
}

- (double)desiredHeightForTransparentHeaderView
{
  double result;

  -[objc_class defaultHeight](-[SiriUICardSnippetViewController transparentHeaderViewClass](self, "transparentHeaderViewClass"), "defaultHeight");
  return result;
}

- (double)boundingWidthForPresentation:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SiriUIBaseSnippetViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingWidthForSnippetViewController:", self);
  v6 = v5;

  return v6;
}

- (id)_analytics
{
  return (id)objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
}

- (void)_logCardRelationshipIdentifiedForCompactCard:(id)a3 fullCard:(id)a4 snippet:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "cardId");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "aceId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v12, "setValue:forKey:", v15, CFSTR("compactId"));
  objc_msgSend(v12, "setValue:forKey:", v10, CFSTR("regularId"));
  objc_msgSend(v12, "setValue:forKey:", v11, CFSTR("snippetAceId"));
  -[SiriUICardSnippetViewController _instrumentationManager](self, "_instrumentationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "emitCasinoRelationshipEventWithViewIDFrom:ViewIDTo:casinoFromType:", v15, v10, 1);

  -[SiriUICardSnippetViewController _analytics](self, "_analytics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logEventWithType:context:", 3908, v12);

}

- (id)snippet
{
  return self->_snippet;
}

- (CRKCardViewControlling)_cardViewController
{
  return self->_cardViewController;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isPresentedWithSmartDialogText
{
  return self->_isPresentedWithSmartDialogText;
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  self->_isPresentedWithSmartDialogText = a3;
}

- (CRKCardPresentation)_cardPresentation
{
  return self->_cardPresentation;
}

- (void)_setCardPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_cardPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardPresentation, 0);
  objc_storeStrong((id *)&self->_cardViewController, 0);
  objc_storeStrong((id *)&self->_presentedModalContainerViewController, 0);
  objc_storeStrong((id *)&self->_feedbackEngagementInstrumentationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersProcessedWithNewTurn, 0);
  objc_storeStrong((id *)&self->_originalCard, 0);
  objc_storeStrong((id *)&self->_cardLoadingTimer, 0);
  objc_storeStrong(&self->_cardLoadingCompletionhandler, 0);
  objc_storeStrong((id *)&self->_cardLoader, 0);
  objc_storeStrong((id *)&self->_newlyLoadedCardSnippet, 0);
  objc_storeStrong((id *)&self->_cardLoadingGroup, 0);
  objc_storeStrong((id *)&self->_referenceableSnippetsByIdentifierMap, 0);
  objc_storeStrong((id *)&self->_referenceableCommandsByIdentifierMap, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
}

void __46__SiriUICardSnippetViewController_setSnippet___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[SiriUICardSnippetViewController setSnippet:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0_0(&dword_21764F000, a2, a3, "%s #cards Error %@ in attempting to configure CRKCardPresentation with card %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(a2 + 32));
}

void __72__SiriUICardSnippetViewController__beginMonitoringForNextCardWithBlock___block_invoke_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SiriUICardSnippetViewController _beginMonitoringForNextCardWithBlock:]_block_invoke";
  _os_log_error_impl(&dword_21764F000, log, OS_LOG_TYPE_ERROR, "%s #cards Failed to load second level card", (uint8_t *)&v1, 0xCu);
}

- (void)_forwardProgressEvent:(uint64_t)a1 toCardViewController:(NSObject *)a2 animated:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21764F000, a2, OS_LOG_TYPE_ERROR, "%s Card view controller %@ is unable to handle card command", (uint8_t *)&v2, 0x16u);
}

void __87__SiriUICardSnippetViewController__forwardProgressEvent_toCardViewController_animated___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[SiriUICardSnippetViewController _forwardProgressEvent:toCardViewController:animated:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0_0(&dword_21764F000, a2, a3, "%s Failed to handle progress undate command for card view controller %@ with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], a2);
}

@end
