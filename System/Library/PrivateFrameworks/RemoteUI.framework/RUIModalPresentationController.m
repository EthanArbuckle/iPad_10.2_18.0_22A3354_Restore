@implementation RUIModalPresentationController

- (RUIModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 modalPresentationStyle:(unint64_t)a5
{
  return -[RUIModalPresentationController initWithPresentedViewController:presentingViewController:modalPresentationStyle:style:](self, "initWithPresentedViewController:presentingViewController:modalPresentationStyle:style:", a3, a4, a5, 0);
}

- (RUIModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 modalPresentationStyle:(unint64_t)a5 style:(id)a6
{
  id v11;
  RUIModalPresentationController *v12;
  RUIModalPresentationController *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)RUIModalPresentationController;
  v12 = -[RUIModalPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  v13 = v12;
  if (v12)
  {
    -[RUIModalPresentationController setRUIModalPresentationStyle:](v12, "setRUIModalPresentationStyle:", a5);
    objc_storeStrong((id *)&v13->_style, a6);
  }

  return v13;
}

- (void)setRUIModalPresentationStyle:(unint64_t)a3
{
  RUIHalfSheetDetent *v4;
  void *v5;
  void *v6;
  void *v7;
  RUIModalPresentationController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  self->_ruiModalPresentationStyle = a3;
  if (a3 == 2)
  {
    -[RUIModalPresentationController _setShouldDismissWhenTappedOutside:](self, "_setShouldDismissWhenTappedOutside:", 1);
    -[RUIModalPresentationController _setWantsFloatingInRegularWidthCompactHeight:](self, "_setWantsFloatingInRegularWidthCompactHeight:", 1);
  }
  else
  {
    if (a3 == 1)
    {
      -[RUIModalPresentationController _setShouldDismissWhenTappedOutside:](self, "_setShouldDismissWhenTappedOutside:");
      v4 = objc_alloc_init(RUIHalfSheetDetent);
      v13[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIModalPresentationController setDetents:](self, "setDetents:", v5);

      -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "traitCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = +[RUIHalfSheetDetent shouldUsePadHeightForTraitCollection:](RUIHalfSheetDetent, "shouldUsePadHeightForTraitCollection:", v7);

      if ((v4 & 1) != 0)
        return;
      -[RUIModalPresentationController _setWantsFloatingInRegularWidthCompactHeight:](self, "_setWantsFloatingInRegularWidthCompactHeight:", 1);
      v8 = self;
      v9 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD950], "largeDetent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RUIModalPresentationController setDetents:](self, "setDetents:", v11);

      -[RUIModalPresentationController _setShouldDismissWhenTappedOutside:](self, "_setShouldDismissWhenTappedOutside:", 0);
      -[RUIModalPresentationController _setWantsFloatingInRegularWidthCompactHeight:](self, "_setWantsFloatingInRegularWidthCompactHeight:", 0);
      v8 = self;
      v9 = 0;
    }
    -[RUIModalPresentationController setWidthFollowsPreferredContentSizeWhenEdgeAttached:](v8, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", v9);
  }
}

- (void)presentationTransitionWillBegin
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  RUIModalPresentationController **v34;
  RUIModalPresentationController *v35;
  RUIModalPresentationController *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  if (self->_ruiModalPresentationStyle == 2)
  {
    -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadViewIfNeeded");

    -[RUIModalPresentationController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBounds:", v7, v9, v11, v13);

    -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutIfNeeded");

    -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_opt_isKindOfClass();

    if ((v14 & 1) != 0)
    {
      -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "topViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v20, "topViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "loadViewIfNeeded");
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "layoutIfNeeded");

        objc_msgSend(v24, "updatePreferredContentSize");
      }

    }
    -[RUIModalPresentationController presentedViewController](self, "presentedViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "preferredContentSize");
    v28 = v27;
    v30 = v29;

    v31 = (void *)MEMORY[0x24BEBD950];
    -[RUIModalPresentationController _sheetHeightWithSize:](self, "_sheetHeightWithSize:", v28, v30);
    objc_msgSend(v31, "_detentWithIdentifier:constant:", CFSTR("RUIAdaptiveSheetDetent"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIModalPresentationController setDetents:](self, "setDetents:", v33);

    v36 = self;
    v34 = &v36;
  }
  else
  {
    v35 = self;
    v34 = &v35;
  }
  v34[1] = (RUIModalPresentationController *)RUIModalPresentationController;
  objc_msgSendSuper2((objc_super *)v34, sel_presentationTransitionWillBegin, v35);
}

- (double)_sheetHeightWithSize:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  height = a3.height;
  -[RUIStyle minimumHeightOfAdaptiveSheet](self->_style, "minimumHeightOfAdaptiveSheet", a3.width);
  if (height >= v5)
    v6 = height;
  else
    v6 = v5;
  -[RUIModalPresentationController containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  if (v6 >= v9)
    return v9;
  else
    return v6;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  _QWORD v9[6];

  v4 = a3;
  v5 = v4;
  if (self->_ruiModalPresentationStyle == 2)
  {
    objc_msgSend(v4, "preferredContentSize");
    -[RUIModalPresentationController _sheetHeightWithSize:](self, "_sheetHeightWithSize:");
    v7 = round(v6);
    if (v7 > 0.0 && v7 != self->_sheetHeight)
    {
      self->_sheetHeight = v7;
      objc_msgSend(v5, "transitionCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
      v9[3] = &unk_24C298170;
      v9[4] = self;
      *(double *)&v9[5] = v7;
      objc_msgSend(v8, "animateAlongsideTransition:completion:", &__block_literal_global_5, v9);

    }
  }

}

uint64_t __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[6];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
  v3[3] = &unk_24C297920;
  v3[4] = v1;
  v3[5] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "animateChanges:", v3);
}

uint64_t __88__RUIModalPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD950], "_detentWithIdentifier:constant:", CFSTR("RUIAdaptiveSheetDetent"), *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDetents:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "invalidateDetents");
}

- (unint64_t)modalPresentationStyle
{
  return self->_ruiModalPresentationStyle;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "preferredContentSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "preferredContentSize");
  if (v8 != v12 || v10 != v11)
  {
    objc_msgSend(v6, "preferredContentSize");
    objc_msgSend(v14, "setPreferredContentSize:");
  }

}

- (unint64_t)ruiModalPresentationStyle
{
  return self->_ruiModalPresentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
}

@end
