@implementation UIAlertController(AlertPresenter)

- (uint64_t)dismissAlert:()AlertPresenter completionHandler:
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:", 1);
}

- (void)setButtons:()AlertPresenter forAlert:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE19420], "processContentAlertButtonSubtitles:", v6);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v6;
  v9 = 0;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v13, "isPreferred"))
        {
          v14 = v13;

          v9 = v14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __57__UIAlertController_AlertPresenter__setButtons_forAlert___block_invoke;
  v17[3] = &unk_24EF608A0;
  v17[4] = a1;
  v15 = v7;
  v18 = v15;
  v19 = &v20;
  objc_msgSend(v8, "if_map:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setActions:", v16);
  objc_msgSend(a1, "setPreferredAction:", v21[5]);

  _Block_object_dispose(&v20, 8);
}

- (void)replaceButtonAtIndex:()AlertPresenter withButton:forAlert:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a1, "actionForButton:inAlert:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "count") > a3)
  {
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", a3, v6);
    objc_msgSend(a1, "_setActions:", v8);
  }
  if (objc_msgSend(v9, "isPreferred"))
    objc_msgSend(a1, "setPreferredAction:", v6);

}

- (id)actionForButton:()AlertPresenter inAlert:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  WFRichContentItemCellView *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  id v33;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "style");
  if (v8 == 1)
    v9 = 1;
  else
    v9 = 2 * (v8 == 2);
  objc_initWeak(&location, a1);
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke;
  aBlock[3] = &unk_24EF60908;
  objc_copyWeak(&v33, &location);
  v11 = v7;
  v31 = v11;
  v12 = v6;
  v32 = v12;
  v13 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __61__UIAlertController_AlertPresenter__actionForButton_inAlert___block_invoke_3;
    v28[3] = &unk_24EF60930;
    v14 = v12;
    v29 = v14;
    v27 = _Block_copy(v28);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = objc_alloc_init(WFRichContentItemCellView);
      -[WFRichContentItemCellView setSelectableAlertButton:](v15, "setSelectableAlertButton:", v14);
      if (objc_msgSend(v14, "isSelected"))
        v16 = 25.0;
      else
        v16 = 0.0;
      +[WFUIAlertControllerAlertPresenter contentViewControllerForContentView:padding:](WFUIAlertControllerAlertPresenter, "contentViewControllerForContentView:padding:", v15, 0.0, 0.0, 0.0, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3A8], "_actionWithContentViewController:style:handler:", v17, v9, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = _Block_copy(v27);
      objc_msgSend(v18, "setValue:forKey:", v19, CFSTR("shouldDismissHandler"));
    }
    else
    {
      objc_msgSend(v14, "subtitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {

      }
      else
      {
        objc_msgSend(v14, "image");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          v25 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(v14, "title");
          v15 = (WFRichContentItemCellView *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v15, 0, 0, v9, v13, v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
      }
      v26 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(v14, "title");
      v15 = (WFRichContentItemCellView *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "image");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UIImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_actionWithTitle:descriptiveText:image:style:handler:shouldDismissHandler:", v15, v17, v23, v9, v13, v27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_17:

    objc_msgSend(v18, "_setChecked:", objc_msgSend(v14, "isSelected"));
    goto LABEL_18;
  }
  v20 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(v12, "title");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actionWithTitle:style:handler:", v14, v9, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v18;
}

@end
