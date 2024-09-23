@implementation WFAutomationSummaryIconsView

- (WFAutomationSummaryIconsView)initWithFrame:(CGRect)a3
{
  WFAutomationSummaryIconsView *v3;
  UIStackView *v4;
  UIStackView *stackView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIImageView *v14;
  UIImageView *triggerIconView;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIImageView *arrowImageView;
  void *v22;
  UIImageView *v23;
  WFRowOfIconsView *v24;
  WFRowOfIconsView *actionsIconsView;
  WFAutomationSummaryIconsView *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  objc_super v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)WFAutomationSummaryIconsView;
  v3 = -[WFAutomationSummaryIconsView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_alloc_init(MEMORY[0x24BEBD978]);
    stackView = v3->_stackView;
    v3->_stackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 3);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 12.0);
    -[WFAutomationSummaryIconsView addSubview:](v3, "addSubview:", v3->_stackView);
    v28 = (void *)MEMORY[0x24BDD1628];
    -[UIStackView topAnchor](v3->_stackView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView topAnchor](v3, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v31;
    -[UIStackView bottomAnchor](v3->_stackView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView bottomAnchor](v3, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v6;
    -[UIStackView leadingAnchor](v3->_stackView, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView leadingAnchor](v3, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v9;
    -[UIStackView trailingAnchor](v3->_stackView, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView trailingAnchor](v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v13);

    v14 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    triggerIconView = v3->_triggerIconView;
    v3->_triggerIconView = v14;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_triggerIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_triggerIconView);
    -[WFAutomationSummaryIconsView configureIconView:](v3, "configureIconView:", v3->_triggerIconView);
    v16 = objc_alloc(MEMORY[0x24BEBD668]);
    v17 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("TriggerSummaryArrow"), v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v16, "initWithImage:", v19);
    arrowImageView = v3->_arrowImageView;
    v3->_arrowImageView = (UIImageView *)v20;

    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v22, "shouldReverseLayoutDirection");

    if ((_DWORD)v19)
    {
      CGAffineTransformMakeScale(&v35, -1.0, 1.0);
      v23 = v3->_arrowImageView;
      v34 = v35;
      -[UIImageView setTransform:](v23, "setTransform:", &v34);
    }
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_arrowImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_arrowImageView);
    v24 = -[WFRowOfIconsView initWithMaxNumberOfIcons:height:]([WFRowOfIconsView alloc], "initWithMaxNumberOfIcons:height:", 6, 30.0);
    actionsIconsView = v3->_actionsIconsView;
    v3->_actionsIconsView = v24;

    -[WFRowOfIconsView setTranslatesAutoresizingMaskIntoConstraints:](v3->_actionsIconsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView addArrangedSubview:](v3->_stackView, "addArrangedSubview:", v3->_actionsIconsView);
    v26 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTriggerIcon:(id)a3 tintColor:(id)a4 withTrigger:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v8 = a5;
  v9 = a4;
  -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFAutomationSummaryIconsView stackView](self, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeArrangedSubview:", v12);

    -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[WFAutomationSummaryIconsView setHomeTriggerIconView:](self, "setHomeTriggerIconView:", 0);
  }
  -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v31);

    objc_msgSend(v8, "displayGlyphCornerRadius");
    v17 = v16;
    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 <= 0.0)
    {
      objc_msgSend(v18, "setClipsToBounds:", 0);

      -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = 0.0;
    }
    else
    {
      objc_msgSend(v18, "setClipsToBounds:", 1);

      objc_msgSend(v8, "displayGlyphCornerRadius");
      v21 = v20;
      -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v25 = v21;
    }
    objc_msgSend(v23, "setCornerRadius:", v25);

  }
  else
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v31);
    -[WFAutomationSummaryIconsView setTriggerIconView:](self, "setTriggerIconView:", v26);

    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFAutomationSummaryIconsView stackView](self, "stackView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "insertArrangedSubview:atIndex:", v29, 0);

    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView configureIconView:](self, "configureIconView:", v22);
  }

  -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setTintColor:", v9);

  -[WFAutomationSummaryIconsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTriggerIcon:(id)a3 tintColor:(id)a4 withCornerRadius:(double)a5
{
  id v8;
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
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFAutomationSummaryIconsView stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeArrangedSubview:", v11);

    -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[WFAutomationSummaryIconsView setHomeTriggerIconView:](self, "setHomeTriggerIconView:", 0);
  }
  -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v26);

    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5 <= 0.0)
    {
      objc_msgSend(v15, "setClipsToBounds:", 0);

      -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = 0.0;
    }
    else
    {
      objc_msgSend(v15, "setClipsToBounds:", 1);

      -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = a5;
    }
    objc_msgSend(v18, "setCornerRadius:", v20);

  }
  else
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v26);
    -[WFAutomationSummaryIconsView setTriggerIconView:](self, "setTriggerIconView:", v21);

    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFAutomationSummaryIconsView stackView](self, "stackView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "insertArrangedSubview:atIndex:", v24, 0);

    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView configureIconView:](self, "configureIconView:", v17);
  }

  -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTintColor:", v8);

  -[WFAutomationSummaryIconsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHomeTriggerIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAutomationSummaryIconsView stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeArrangedSubview:", v7);

    -[WFAutomationSummaryIconsView triggerIconView](self, "triggerIconView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[WFAutomationSummaryIconsView setTriggerIconView:](self, "setTriggerIconView:", 0);
  }
  -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFAutomationSummaryIconsView stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeArrangedSubview:", v11);

    -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    -[WFAutomationSummaryIconsView setHomeTriggerIconView:](self, "setHomeTriggerIconView:", 0);
  }
  v13 = (void *)objc_msgSend(objc_alloc(getHUTriggerIconViewClass()), "initWithIconDescriptor:", v4);

  -[WFAutomationSummaryIconsView setHomeTriggerIconView:](self, "setHomeTriggerIconView:", v13);
  -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[WFAutomationSummaryIconsView stackView](self, "stackView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAutomationSummaryIconsView homeTriggerIconView](self, "homeTriggerIconView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertArrangedSubview:atIndex:", v16, 0);

  -[WFAutomationSummaryIconsView setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureIconView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a3;
  LODWORD(v3) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v3);
  LODWORD(v4) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 1, v4);
  LODWORD(v5) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v5);
  LODWORD(v6) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 1, v6);

}

- (void)setActionIcons:(id)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutomationSummaryIconsView.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIcons"));

  }
  -[WFAutomationSummaryIconsView actionsIconsView](self, "actionsIconsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcons:", v9);

  v6 = objc_msgSend(v9, "count") == 0;
  -[WFAutomationSummaryIconsView arrowImageView](self, "arrowImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

}

- (void)setHomeActionIcons:(id)a3
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAutomationSummaryIconsView.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeActionIcons"));

  }
  -[WFAutomationSummaryIconsView actionsIconsView](self, "actionsIconsView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHomeIcons:", v9);

  v6 = objc_msgSend(v9, "count") == 0;
  -[WFAutomationSummaryIconsView arrowImageView](self, "arrowImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (UIImageView)triggerIconView
{
  return self->_triggerIconView;
}

- (void)setTriggerIconView:(id)a3
{
  objc_storeStrong((id *)&self->_triggerIconView, a3);
}

- (HUTriggerIconView)homeTriggerIconView
{
  return self->_homeTriggerIconView;
}

- (void)setHomeTriggerIconView:(id)a3
{
  objc_storeStrong((id *)&self->_homeTriggerIconView, a3);
}

- (UIImageView)arrowImageView
{
  return self->_arrowImageView;
}

- (WFRowOfIconsView)actionsIconsView
{
  return self->_actionsIconsView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsIconsView, 0);
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_homeTriggerIconView, 0);
  objc_storeStrong((id *)&self->_triggerIconView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
