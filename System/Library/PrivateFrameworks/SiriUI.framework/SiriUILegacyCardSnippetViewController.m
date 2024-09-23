@implementation SiriUILegacyCardSnippetViewController

+ (void)initialize
{
  +[CRKCardSectionViewController registerCardSectionViewController](SiriUILegacyCardSectionViewController, "registerCardSectionViewController");
}

- (SiriUILegacyCardSnippetViewController)initWithSnippet:(id)a3
{
  id v4;
  SiriUILegacyCardSnippetViewController *v5;
  SiriUILegacyCardSnippetViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriUILegacyCardSnippetViewController;
  v5 = -[SiriUICardSnippetViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
    -[SiriUILegacyCardSnippetViewController setSnippet:](v5, "setSnippet:", v4);

  return v6;
}

- (void)configureContentWithSizeClass:(int64_t)a3
{
  void *v5;
  int v6;
  id v7;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_254F220D8);

  if (v6)
  {
    -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureContentWithSizeClass:", a3);

  }
}

- (id)_legacyCardSectionViewController
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "_legacyCardSectionViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SiriUILegacyCardSnippetViewController _legacyCardSectionViewController].cold.1(v4);
    v3 = 0;
  }

  return v3;
}

- (id)_backingSnippetViewController
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _legacyCardSectionViewController](self, "_legacyCardSectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSnippet:(id)a3
{
  SAUISnippet *v6;
  id v7;
  id v8;
  void *v9;
  SiriUILegacyCardSection *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = (SAUISnippet *)a3;
  if (self->_snippet != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_snippet, a3);
      v7 = objc_alloc(MEMORY[0x24BDD9DF0]);
      v8 = objc_alloc_init(MEMORY[0x24BDD9DC0]);
      v9 = (void *)objc_msgSend(v7, "initWithIntent:response:", v8, 0);

      objc_msgSend(v9, "_setSnippet:", self->_snippet);
      v10 = objc_alloc_init(SiriUILegacyCardSection);
      v11 = objc_alloc_init(MEMORY[0x24BE154B0]);
      v18[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCardSections:", v12);

      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setInteractions:", v13);

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15460]), "_initWithCard:delegate:loadProvidersImmediately:", v11, self, 1);
      objc_msgSend(v14, "_legacyCardSectionViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriUILegacyCardSnippetViewController.m"), 110, CFSTR("The legacy card section view controller must exist after initialization."));

      }
      objc_msgSend(v15, "setContainingSnippetViewController:", self);
      objc_msgSend(v15, "backingSnippetViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSnippet:", v6);

      -[SiriUICardSnippetViewController _setCardViewController:](self, "_setCardViewController:", v14);
    }
  }

}

- (void)setDelegate:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUIBaseSnippetViewController setDelegate:](&v6, sel_setDelegate_, a3);
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILegacyCardSnippetViewController _legacyCardSectionViewController](self, "_legacyCardSectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v4);

}

- (id)subtitle
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAttributedSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedSubtitle:", v4);

}

- (id)attributedSubtitle
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedSubtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setNavigationTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationTitle:", v4);

}

- (id)navigationTitle
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setRequestContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestContext:", v4);

}

- (id)requestContext
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setHeaderPunchOut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderPunchOut:", v4);

}

- (id)headerPunchOut
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headerPunchOut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSnippetPunchOut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSnippetPunchOut:", v4);

}

- (id)snippetPunchOut
{
  void *v2;
  void *v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snippetPunchOut");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setWantsConfirmationInsets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWantsConfirmationInsets:", v3);

}

- (BOOL)wantsConfirmationInsets
{
  void *v2;
  char v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsConfirmationInsets");

  return v3;
}

- (void)setIsFullPadWidth:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsFullPadWidth:", v3);

}

- (BOOL)isFullPadWidth
{
  void *v2;
  char v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFullPadWidth");

  return v3;
}

- (void)setConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfirmed:", v3);

}

- (BOOL)isConfirmed
{
  void *v2;
  char v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConfirmed");

  return v3;
}

- (void)setCancelled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCancelled:", v3);

}

- (BOOL)isCancelled
{
  void *v2;
  char v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  return v3;
}

- (void)willConfirm
{
  void *v3;
  objc_super v4;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willConfirm");

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUICardSnippetViewController willConfirm](&v4, sel_willConfirm);
}

- (void)willCancel
{
  void *v3;
  objc_super v4;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "willCancel");

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUICardSnippetViewController willCancel](&v4, sel_willCancel);
}

- (void)_setVirgin:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setVirgin:", v3);

}

- (void)siriWillLayoutSnippetView
{
  void *v3;
  objc_super v4;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriWillLayoutSnippetView");

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUISnippetViewController siriWillLayoutSnippetView](&v4, sel_siriWillLayoutSnippetView);
}

- (void)siriDidLayoutSnippetView
{
  void *v3;
  objc_super v4;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriDidLayoutSnippetView");

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUISnippetViewController siriDidLayoutSnippetView](&v4, sel_siriDidLayoutSnippetView);
}

- (BOOL)removedAfterDialogProgresses
{
  void *v2;
  char v3;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "removedAfterDialogProgresses");

  return v3;
}

- (BOOL)usePlatterStyle
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usePlatterStyle");

  return v6;
}

- (BOOL)wantsToManageBackgroundColor
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  objc_super v8;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "wantsToManageBackgroundColor");

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SiriUILegacyCardSnippetViewController;
    return -[SiriUISnippetViewController wantsToManageBackgroundColor](&v8, sel_wantsToManageBackgroundColor);
  }
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endEditingAndCorrect:", v3);

  }
}

- (id)sashItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUIBaseSnippetViewController sashItem](&v9, sel_sashItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || objc_msgSend(v3, "isDefault"))
  {
    -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sashItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;

      v4 = v7;
    }

  }
  return v4;
}

- (void)siriDidDeactivate
{
  void *v3;
  objc_super v4;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "siriDidDeactivate");

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUICardSnippetViewController siriDidDeactivate](&v4, sel_siriDidDeactivate);
}

- (void)wasAddedToTranscript
{
  void *v3;
  objc_super v4;

  -[SiriUILegacyCardSnippetViewController _backingSnippetViewController](self, "_backingSnippetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wasAddedToTranscript");

  v4.receiver = self;
  v4.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUICardSnippetViewController wasAddedToTranscript](&v4, sel_wasAddedToTranscript);
}

- (Class)transparentHeaderViewClass
{
  return 0;
}

- (BOOL)cardViewController:(id)a3 shouldLoadIdentifiedCardSectionViewProvidersWithProviderManager:(id)a4
{
  return 0;
}

- (void)cardViewControllerDidLoad:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[SiriUICardSnippetViewController _cardViewController](self, "_cardViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[SiriUICardSnippetViewController _setCardViewController:](self, "_setCardViewController:", v4);
  v6.receiver = self;
  v6.super_class = (Class)SiriUILegacyCardSnippetViewController;
  -[SiriUICardSnippetViewController cardViewControllerDidLoad:](&v6, sel_cardViewControllerDidLoad_, v4);

}

- (id)snippet
{
  return self->_snippet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippet, 0);
}

- (void)_legacyCardSectionViewController
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[SiriUILegacyCardSnippetViewController _legacyCardSectionViewController]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_21764F000, v1, OS_LOG_TYPE_ERROR, "%s #cards The card view controller in this legacy snippet is not a CRKCardViewController, but instead a %@. This is a bug and we can't get a legacy card section view controller in this case.", (uint8_t *)&v4, 0x16u);

}

@end
