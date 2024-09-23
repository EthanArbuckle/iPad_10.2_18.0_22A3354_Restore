@implementation WFUIAlertControllerAlertPresenter

+ (void)presentAlert:(id)a3 withUserInterface:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;
  CGRect v57;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "preferredStyle") != 1
    || (objc_msgSend(v5, "textFieldConfigurationHandlers"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    v9 = 1;
    goto LABEL_4;
  }
  objc_msgSend(v5, "presentationSource");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "barButtonItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {

    v9 = 0;
LABEL_31:

    goto LABEL_4;
  }
  objc_msgSend(v5, "presentationSource");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sourceView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v41)
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v38, "modalPresentationStyle") == 7;
    goto LABEL_31;
  }
  v9 = 0;
LABEL_4:
  v10 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(v5, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v11, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v5, "textFieldConfigurationHandlers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  v16 = MEMORY[0x24BDAC760];
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v51;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v51 != v18)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v19);
        v49[0] = v16;
        v49[1] = 3221225472;
        v49[2] = __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke;
        v49[3] = &unk_24EF60850;
        v49[4] = v20;
        objc_msgSend(v13, "addTextFieldWithConfigurationHandler:", v49);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v17);
  }

  objc_msgSend(v5, "buttons");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setButtons:forAlert:", v21, v5);

  objc_msgSend(v5, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v5, "contentViewPadding");
    +[WFUIAlertControllerAlertPresenter contentViewControllerForContentView:padding:](WFUIAlertControllerAlertPresenter, "contentViewControllerForContentView:padding:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentViewController:", v23);

  }
  objc_msgSend(v5, "keyCommands");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v46;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v46 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v13, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v28++));
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v26);
  }
  objc_msgSend(v5, "presentationSource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "popoverPresentationController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setPermittedArrowDirections:", objc_msgSend(v29, "permittedArrowDirections"));
  objc_msgSend(v30, "setCanOverlapSourceViewRect:", objc_msgSend(v29, "canOverlapSourceViewRect"));
  objc_msgSend(v29, "barButtonItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBarButtonItem:", v31);

  objc_msgSend(v29, "sourceView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSourceView:", v32);

  objc_msgSend(v30, "wf_forcePresentationInPresenterSceneIfNeeded");
  objc_msgSend(v29, "sourceRect");
  if (!CGRectIsNull(v57))
  {
    objc_msgSend(v29, "sourceRect");
    objc_msgSend(v30, "setSourceRect:");
  }
  objc_msgSend(v6, "viewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "overrideUserInterfaceStyle"))
    objc_msgSend(v13, "setOverrideUserInterfaceStyle:", objc_msgSend(v33, "overrideUserInterfaceStyle"));
  objc_msgSend(v33, "presentedViewController", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    do
    {
      objc_msgSend(v33, "presentedViewController");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "presentedViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v35;
    }
    while (v36);
  }
  else
  {
    v35 = v33;
  }
  v43[0] = v16;
  v43[1] = 3221225472;
  v43[2] = __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke_2;
  v43[3] = &unk_24EF60878;
  v44 = v22;
  v37 = v22;
  objc_msgSend(v35, "presentViewController:animated:completion:", v13, 1, v43);
  objc_msgSend(v5, "setPresenter:", v13);

}

+ (id)contentViewControllerForContentView:(id)a3 padding:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v26[4] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v25 = (void *)objc_opt_new();
  v9 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addSubview:", v8);
  v20 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v8, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, top);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  objc_msgSend(v8, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v10, -bottom);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(v8, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, left);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v14;
  objc_msgSend(v8, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -right);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v18);

  objc_msgSend(v25, "setView:", v9);
  return v25;
}

uint64_t __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canBecomeFirstResponder");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  return result;
}

@end
