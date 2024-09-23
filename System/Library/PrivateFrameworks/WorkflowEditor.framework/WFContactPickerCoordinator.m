@implementation WFContactPickerCoordinator

- (void)presentContactPickerWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFContactPickerCoordinator supportedContactProperties](self, "supportedContactProperties");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBAE78]);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setDisplayedPropertyKeys:", v8);
  WFPredicateForEnablingPerson();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicateForEnablingContact:", v6);

  WFPredicateForSelectionOfPerson();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicateForSelectionOfContact:", v7);

  -[WFContactPickerCoordinator presentViewController:completionHandler:](self, "presentViewController:completionHandler:", v5, v4);
}

- (void)presentHandlePickerForContact:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = (void *)MEMORY[0x24BDBAE90];
  v7 = a4;
  objc_msgSend(v6, "viewControllerForContact:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);
  -[WFContactPickerCoordinator supportedContactProperties](self, "supportedContactProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDisplayedPropertyKeys:", v8);

  objc_msgSend(v14, "setAllowsEditing:", 0);
  objc_msgSend(v14, "setAllowsActions:", 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_dismissPersonViewController);
  objc_msgSend(v14, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  WFLocalizedString(CFSTR("Choose"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTitle:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v14);
  -[WFContactPickerCoordinator presentViewController:completionHandler:](self, "presentViewController:completionHandler:", v13, v7);

}

- (void)presentViewController:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id completionHandler;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;

  v13 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  -[WFContactPickerCoordinator presentationSource](self, "presentationSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v13, "setModalPresentationStyle:", 7);
    objc_msgSend(v13, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);
    objc_msgSend(v9, "setPermittedArrowDirections:", objc_msgSend(v8, "permittedArrowDirections"));
    objc_msgSend(v9, "setCanOverlapSourceViewRect:", objc_msgSend(v8, "canOverlapSourceViewRect"));
    objc_msgSend(v8, "barButtonItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBarButtonItem:", v10);

    objc_msgSend(v8, "sourceView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceView:", v11);

    objc_msgSend(v9, "wf_forcePresentationInPresenterSceneIfNeeded");
    objc_msgSend(v8, "sourceRect");
    if (!CGRectIsNull(v14))
    {
      objc_msgSend(v8, "sourceRect");
      objc_msgSend(v9, "setSourceRect:");
    }
  }
  else
  {
    objc_msgSend(v13, "presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);
  }

  -[WFContactPickerCoordinator presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v13, 1, 0);

}

- (void)dismissPersonViewController
{
  void *v2;
  id v3;

  -[WFContactPickerCoordinator presentingViewController](self, "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)finishWithContact:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFContactPickerCoordinator completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContactPickerCoordinator completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

    -[WFContactPickerCoordinator setCompletionHandler:](self, "setCompletionHandler:", 0);
  }

}

- (id)contactWithMatchingPropertyAndMultivalueIndex:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFContactPickerCoordinator supportedPersonProperties](self, "supportedPersonProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "intValue");
        if (objc_msgSend(v4, "hasValueForPropertyID:", v10))
        {
          objc_msgSend(v4, "contactWithPropertyID:multivalueIndex:", v10, 0);
          v11 = objc_claimAutoreleasedReturnValue();

          v4 = (id)v11;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)supportedContactProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[WFContactPickerCoordinator supportedPersonProperties](self, "supportedPersonProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_compactMap:", &__block_literal_global_2174);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v12;
  WFContactPickerCoordinator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__WFContactPickerCoordinator_contactViewController_shouldPerformDefaultActionForContactProperty___block_invoke;
  block[3] = &unk_24EE25290;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  return 0;
}

- (void)contactPickerDidCancel:(id)a3
{
  -[WFContactPickerCoordinator finishWithContact:](self, "finishWithContact:", 0);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE193D0], "contactWithCNContact:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContactPickerCoordinator contactWithMatchingPropertyAndMultivalueIndex:](self, "contactWithMatchingPropertyAndMultivalueIndex:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactPickerCoordinator finishWithContact:](self, "finishWithContact:", v5);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5;

  WFContactFromCNContactProperty();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFContactPickerCoordinator finishWithContact:](self, "finishWithContact:", v5);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[WFContactPickerCoordinator finishWithContact:](self, "finishWithContact:", 0);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wf_isWidgetConfigurationExtensionBundle");

  if ((v6 & 1) != 0)
  {
    v7 = 2;
  }
  else if (objc_msgSend(v4, "horizontalSizeClass") == 1)
  {
    v7 = 2;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (NSSet)supportedPersonProperties
{
  return self->_supportedPersonProperties;
}

- (void)setSupportedPersonProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WFAlertPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSource, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentationSource, 0);
  objc_storeStrong((id *)&self->_supportedPersonProperties, 0);
}

void __97__WFContactPickerCoordinator_contactViewController_shouldPerformDefaultActionForContactProperty___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  WFContactFromCNContactProperty();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "finishWithContact:", v3);
  objc_msgSend(*(id *)(a1 + 48), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __56__WFContactPickerCoordinator_supportedContactProperties__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "intValue");
  return CNContactPropertyKeyFromWFContactPropertyID();
}

@end
