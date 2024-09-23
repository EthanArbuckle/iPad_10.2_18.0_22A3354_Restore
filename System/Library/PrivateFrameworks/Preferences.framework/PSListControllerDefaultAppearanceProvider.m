@implementation PSListControllerDefaultAppearanceProvider

- (double)estimatedHeightOfRowForCellWithIndexPath:(id)a3 inController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v15;
  double v16;
  double v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "indexForIndexPath:", v5);
  objc_msgSend(v6, "unprotectedSpecifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v7);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if ((v9[7] & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    v10 = 66.0;
  }
  else
  {
    objc_msgSend(v6, "table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("height"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v9[7] == 14 && v12 == 0)
    {
      v15 = (id)objc_msgSend(v6, "tableView:cellForRowAtIndexPath:", v11, v5);
      objc_msgSend(v9, "propertyForKey:", CFSTR("height"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v13)
    {
      v10 = (double)objc_msgSend(v13, "integerValue");
    }
    else
    {
      objc_msgSend(v11, "estimatedRowHeight");
      if (v16 <= 0.0)
      {
        v10 = *MEMORY[0x1E0CEBC10];
      }
      else
      {
        objc_msgSend(v11, "estimatedRowHeight");
        v10 = v17;
      }
    }

  }
  return v10;
}

- (id)cellForSpecifier:(id)a3 inController:(id)a4
{
  id v4;
  objc_class *v5;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = +[PSTableCell cellClassForSpecifier:](PSTableCell, "cellClassForSpecifier:", v4);
  v6 = -[objc_class isSubclassOfClass:](v5, "isSubclassOfClass:", objc_opt_class());
  v7 = [v5 alloc];
  v8 = -[objc_class cellStyle](v5, "cellStyle");
  if (v6)
  {
    +[PSTableCell reuseIdentifierForSpecifier:](PSTableCell, "reuseIdentifierForSpecifier:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithStyle:reuseIdentifier:specifier:", v8, v9, v4);

  }
  else
  {
    v10 = (void *)objc_msgSend(v7, "initWithStyle:reuseIdentifier:", v8, 0);
  }

  return v10;
}

- (void)listController:(id)a3 updateSectionContentInsetAnimated:(BOOL)a4 isRegularWidth:(BOOL)a5 contentInsetInitialized:(BOOL)a6 contentInsetInitializedApplicator:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  void (**v10)(_QWORD);
  void *v11;
  int v12;
  double *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v20;
  char v21;
  void *v22;
  double v23;
  double v24;
  BOOL v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v8 = a6;
  v9 = a4;
  v34 = a3;
  v10 = (void (**)(_QWORD))a7;
  objc_msgSend(v34, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = PSShouldInsetListView(v11);
  v13 = (double *)MEMORY[0x1E0CEBC10];
  if (!v12 || (objc_msgSend(v34, "edgeToEdgeCells") & 1) != 0)
  {

LABEL_4:
    v14 = *v13;
    v15 = *v13;
    goto LABEL_5;
  }
  v21 = PSIsRunningInAssistant();

  if ((v21 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v34, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaInsets");
  v24 = v23;

  v14 = 0.0;
  v25 = v24 <= 0.0;
  v15 = 0.0;
  if (v25)
  {
    objc_msgSend(v34, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layoutMargins");
    v15 = v27;

  }
  objc_msgSend(v34, "view", v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaInsets");
  v30 = v29;

  if (v30 <= 0.0)
  {
    objc_msgSend(v34, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutMargins");
    v14 = v32;

  }
LABEL_5:
  objc_msgSend(v34, "table", v34);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_sectionContentInset");
  if (v15 != v18 || v14 != v17)
  {
    v20 = *v13;
    if (v9 && v8)
    {
      objc_msgSend(v16, "_setSectionContentInset:", *v13, v15, *v13, v14);
    }
    else
    {
      v33 = (void *)MEMORY[0x1E0CEABB0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __167__PSListControllerDefaultAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke;
      v36[3] = &unk_1E4A664C8;
      v37 = v16;
      v38 = v20;
      v39 = v15;
      v40 = v20;
      v41 = v14;
      objc_msgSend(v33, "performWithoutAnimation:", v36);
      v10[2](v10);

    }
  }

}

- (void)customizeTableView:(id)a3 inContainerView:(id)a4 hostedInSetupController:(BOOL)a5 forListController:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v9, "setCellLayoutMarginsFollowReadableWidth:", 1);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "setLayoutMarginsFollowReadableWidth:", 0);
  objc_msgSend(v9, "setEstimatedSectionHeaderHeight:", 0.0);
  objc_msgSend(v9, "setEstimatedSectionFooterHeight:", 0.0);
  if (PSIsRunningInAssistant())
  {
    objc_msgSend(v9, "setBackgroundView:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v12);
  }
  else
  {
    +[PSListController appearance](PSListController, "appearance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_6;
    +[PSListController appearance](PSListController, "appearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v15);

  }
LABEL_6:
  +[PSListController appearance](PSListController, "appearance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "separatorColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    +[PSListController appearance](PSListController, "appearance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "separatorColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSeparatorColor:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "sf_isiPad"))
  {

    goto LABEL_15;
  }
  v21 = PSIsRunningInAssistant();

  if (!v21)
  {
LABEL_15:
    objc_msgSend(v10, "setAutoresizingMask:", objc_msgSend(v9, "autoresizingMask"));
    objc_msgSend(MEMORY[0x1E0CEA478], "groupTableViewBackgroundColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v29);

    +[PSListController appearance](PSListController, "appearance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "usesDarkTheme");

    if ((v31 & 1) != 0)
    {
      +[PSListController appearance](PSListController, "appearance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "backgroundColor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v33);

    }
    else
    {
      objc_msgSend(v10, "backgroundColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v32);
    }

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v22);

  objc_msgSend(v9, "panGestureRecognizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addGestureRecognizer:", v23);

  if (!a5)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v24 = (void *)getBFFStyleClass_softClass_0;
    v38 = getBFFStyleClass_softClass_0;
    if (!getBFFStyleClass_softClass_0)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __getBFFStyleClass_block_invoke_0;
      v34[3] = &unk_1E4A65650;
      v34[4] = &v35;
      __getBFFStyleClass_block_invoke_0((uint64_t)v34);
      v24 = (void *)v36[3];
    }
    v25 = objc_retainAutorelease(v24);
    _Block_object_dispose(&v35, 8);
    objc_msgSend(v25, "sharedStyle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "edgeInsetsForTable:", v9);
    v28 = v27;

    objc_msgSend(v9, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -v28);
  }
LABEL_19:
  objc_msgSend(v10, "setLayoutMarginsFollowReadableWidth:", 1);
  objc_msgSend(v9, "setClipsToBounds:", 0);

}

- (int64_t)tableViewStyleForListController:(id)a3
{
  return 1;
}

uint64_t __167__PSListControllerDefaultAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSectionContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
