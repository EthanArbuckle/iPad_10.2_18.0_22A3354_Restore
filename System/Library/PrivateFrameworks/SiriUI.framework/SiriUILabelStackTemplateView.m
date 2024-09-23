@implementation SiriUILabelStackTemplateView

- (SiriUILabelStackTemplateView)initWithDataSource:(id)a3
{
  id v4;
  SiriUILabelStackTemplateView *v5;
  SiriUILabelStackTemplateView *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *componentsForViews;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriUILabelStackTemplateView;
  v5 = -[SiriUIBaseTemplateView initWithDataSource:](&v14, sel_initWithDataSource_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_defaultTextAlignment = 4;
    -[SiriUIBaseTemplateView dataSource](v5, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "alignmentValue");

    if (v8 == 1)
      v9 = 1;
    else
      v9 = 4;
    -[SiriUILabelStackTemplateView setDefaultTextAlignment:](v6, "setDefaultTextAlignment:", v9);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    componentsForViews = v6->_componentsForViews;
    v6->_componentsForViews = v10;

    -[SiriUILabelStackTemplateView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SiriUILabelStackTemplateView _createContentLayoutGuides](v6, "_createContentLayoutGuides");
    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 8, 1, 0, 0, 1.0, 44.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView addConstraint:](v6, "addConstraint:", v12);

    -[SiriUILabelStackTemplateView setDataSource:](v6, "setDataSource:", v4);
    -[SiriUILabelStackTemplateView setNeedsUpdateConstraints](v6, "setNeedsUpdateConstraints");
    -[SiriUILabelStackTemplateView setNeedsLayout](v6, "setNeedsLayout");
  }

  return v6;
}

- (void)_createContentLayoutGuides
{
  UILayoutGuide *v3;
  UILayoutGuide *contentBoundsGuide;
  NSDictionary *v5;
  NSDictionary *contentBoundsGuideConstraints;
  UILayoutGuide *v7;
  UILayoutGuide *stackedComponentsBoundsGuide;
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
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *stackedComponentsGuideConstraints;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[5];

  v26[4] = *MEMORY[0x24BDAC8D0];
  if (!self->_contentBoundsGuide)
  {
    v3 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    contentBoundsGuide = self->_contentBoundsGuide;
    self->_contentBoundsGuide = v3;

    -[UILayoutGuide setIdentifier:](self->_contentBoundsGuide, "setIdentifier:", CFSTR("outer margins guide"));
    -[SiriUILabelStackTemplateView addLayoutGuide:](self, "addLayoutGuide:", self->_contentBoundsGuide);
    -[UIView siriui_pinToLayoutGuide:](self, "siriui_pinToLayoutGuide:", self->_contentBoundsGuide);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    contentBoundsGuideConstraints = self->_contentBoundsGuideConstraints;
    self->_contentBoundsGuideConstraints = v5;

  }
  if (!self->_stackedComponentsBoundsGuide)
  {
    v7 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BDF6B78]);
    stackedComponentsBoundsGuide = self->_stackedComponentsBoundsGuide;
    self->_stackedComponentsBoundsGuide = v7;

    -[UILayoutGuide setIdentifier:](self->_stackedComponentsBoundsGuide, "setIdentifier:", CFSTR("inner components guide"));
    -[SiriUILabelStackTemplateView addLayoutGuide:](self, "addLayoutGuide:", self->_stackedComponentsBoundsGuide);
    -[UILayoutGuide leadingAnchor](self->_stackedComponentsBoundsGuide, "leadingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide leadingAnchor](self->_contentBoundsGuide, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide trailingAnchor](self->_stackedComponentsBoundsGuide, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide trailingAnchor](self->_contentBoundsGuide, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide topAnchor](self->_stackedComponentsBoundsGuide, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide topAnchor](self->_contentBoundsGuide, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILayoutGuide bottomAnchor](self->_stackedComponentsBoundsGuide, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide bottomAnchor](self->_contentBoundsGuide, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = &unk_24D7EF2B0;
    v25[1] = &unk_24D7EF2C8;
    v26[0] = v17;
    v26[1] = v20;
    v25[2] = &unk_24D7EF2E0;
    v25[3] = &unk_24D7EF2F8;
    v26[2] = v11;
    v26[3] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (NSMutableDictionary *)objc_msgSend(v21, "mutableCopy");
    stackedComponentsGuideConstraints = self->_stackedComponentsGuideConstraints;
    self->_stackedComponentsGuideConstraints = v22;

    -[NSMutableDictionary allValues](self->_stackedComponentsGuideConstraints, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView addConstraints:](self, "addConstraints:", v24);

  }
}

- (void)_updateTopAndBottomViewConstraints
{
  NSLayoutConstraint **p_topViewConstraint;
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
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
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  id v50;

  p_topViewConstraint = &self->_topViewConstraint;
  WeakRetained = objc_loadWeakRetained((id *)&self->_topViewConstraint);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_topViewConstraint);
    -[SiriUILabelStackTemplateView removeConstraint:](self, "removeConstraint:", v5);

  }
  v6 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
    -[SiriUILabelStackTemplateView removeConstraint:](self, "removeConstraint:", v7);

  }
  -[SiriUILabelStackTemplateView topView](self, "topView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[SiriUILabelStackTemplateView topView](self, "topView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView bottomView](self, "bottomView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      -[SiriUILabelStackTemplateView topView](self, "topView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUILabelStackTemplateView stackedComponentsBoundsGuide](self, "stackedComponentsBoundsGuide");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "centerYAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v17) = 1132068864;
      objc_msgSend(v16, "setPriority:", v17);
      -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v16);

    }
  }
  -[SiriUILabelStackTemplateView topView](self, "topView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SiriUILabelStackTemplateView componentsForViews](self, "componentsForViews");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDD1968];
    -[SiriUILabelStackTemplateView topView](self, "topView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueWithPointer:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriUIComponentConstraintFactory sharedConstraintFactory](SiriUIComponentConstraintFactory, "sharedConstraintFactory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView topView](self, "topView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView stackedComponentsBoundsGuide](self, "stackedComponentsBoundsGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v25, v26, v23, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_topViewConstraint, v27);

    v28 = objc_loadWeakRetained((id *)p_topViewConstraint);
    if (!v28)
    {
      -[SiriUILabelStackTemplateView topView](self, "topView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUILabelStackTemplateView contentBoundsGuide](self, "contentBoundsGuide");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "templatedContentMargins");
      objc_msgSend(v29, "siriui_pinTopTo:withMargin:priority:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)p_topViewConstraint, v32);

    }
    v33 = objc_loadWeakRetained((id *)p_topViewConstraint);
    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v33);

  }
  -[SiriUILabelStackTemplateView bottomView](self, "bottomView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[SiriUILabelStackTemplateView componentsForViews](self, "componentsForViews");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x24BDD1968];
    -[SiriUILabelStackTemplateView bottomView](self, "bottomView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "valueWithPointer:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKey:", v38);
    v50 = (id)objc_claimAutoreleasedReturnValue();

    +[SiriUIComponentConstraintFactory sharedConstraintFactory](SiriUIComponentConstraintFactory, "sharedConstraintFactory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView bottomView](self, "bottomView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView stackedComponentsBoundsGuide](self, "stackedComponentsBoundsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bottomConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v40, v41, v50, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_bottomViewConstraint, v42);

    v43 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
    if (!v43)
    {
      -[SiriUILabelStackTemplateView bottomView](self, "bottomView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "templatedContentMargins");
      LODWORD(v46) = 1132003328;
      objc_msgSend(v44, "siriui_pinBottomTo:withMargin:priority:", self, v47, v46);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_bottomViewConstraint, v48);

    }
    v49 = objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v49);

  }
}

- (void)updateConstraints
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
  char v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SiriUILabelStackTemplateView;
  -[SiriUILabelStackTemplateView updateConstraints](&v25, sel_updateConstraints);
  if (!self->_constraintsUpdated)
  {
    -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SiriUILabelStackTemplateView _updateTopAndBottomViewConstraints](self, "_updateTopAndBottomViewConstraints");
      self->_constraintsUpdated = 1;
    }
  }
  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "templatedContentMargins");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[NSMutableDictionary objectForKeyedSubscript:](self->_stackedComponentsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2B0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConstant:", v7);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_stackedComponentsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2C8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setConstant:", -v11);

    -[NSDictionary objectForKeyedSubscript:](self->_contentBoundsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2E0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setConstant:", v9);

    -[NSDictionary objectForKeyedSubscript:](self->_contentBoundsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2F8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", -v13);

  }
  -[SiriUILabelStackTemplateView delegate](self, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "labelStackTemplateViewShouldLayoutCompressed:", self);

  v20 = 0.0;
  if ((v19 & 1) == 0)
  {
    -[SiriUIBaseTemplateView dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "paddingValue");

    if (v22 == 1)
      v20 = 22.0;
    else
      v20 = 0.0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stackedComponentsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2B0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setConstant:", v20);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_stackedComponentsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2C8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setConstant:", -v20);

}

- (void)insertLeadingView:(id)a3 withMargins:(UIEdgeInsets)a4
{
  double right;
  double left;
  id v7;
  UIStackView *leadingViews;
  UIStackView *v9;
  UIStackView *v10;
  double v11;
  double v12;
  UIStackView *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  right = a4.right;
  left = a4.left;
  v7 = a3;
  leadingViews = self->_leadingViews;
  v28 = v7;
  if (!leadingViews)
  {
    v9 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
    v10 = self->_leadingViews;
    self->_leadingViews = v9;

    -[SiriUILabelStackTemplateView addSubview:](self, "addSubview:", self->_leadingViews);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_leadingViews, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](self->_leadingViews, "setAlignment:", 0);
    -[UIStackView setAxis:](self->_leadingViews, "setAxis:", 0);
    LODWORD(v11) = 1144750080;
    -[UIStackView setContentHuggingPriority:forAxis:](self->_leadingViews, "setContentHuggingPriority:forAxis:", 0, v11);
    LODWORD(v12) = 1132068864;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_leadingViews, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    v13 = self->_leadingViews;
    -[SiriUILabelStackTemplateView contentBoundsGuide](self, "contentBoundsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[UIStackView siriui_pinLeadingToLeadingEdgeOf:withMargin:](v13, "siriui_pinLeadingToLeadingEdgeOf:withMargin:", v14, 0.0);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_stackedComponentsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2E0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView removeConstraint:](self, "removeConstraint:", v16);

    -[UIStackView siriui_pinTrailingToLeadingEdgeOf:withMargin:](self->_leadingViews, "siriui_pinTrailingToLeadingEdgeOf:withMargin:", self->_stackedComponentsBoundsGuide, -12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stackedComponentsGuideConstraints, "setObject:forKeyedSubscript:", v17, &unk_24D7EF2E0);
    -[UIStackView centerYAnchor](self->_leadingViews, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide centerYAnchor](self->_stackedComponentsBoundsGuide, "centerYAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v21) = 1132068864;
    objc_msgSend(v20, "setPriority:", v21);
    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v20);

    v7 = v28;
    leadingViews = self->_leadingViews;
  }
  -[UIStackView addArrangedSubview:](leadingViews, "addArrangedSubview:", v7);
  +[SiriUIComponentConstraintFactory sharedConstraintFactory](SiriUIComponentConstraintFactory, "sharedConstraintFactory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILabelStackTemplateView contentBoundsGuide](self, "contentBoundsGuide");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "topConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v28, v23, 0, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v24);
  +[SiriUIComponentConstraintFactory sharedConstraintFactory](SiriUIComponentConstraintFactory, "sharedConstraintFactory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUILabelStackTemplateView contentBoundsGuide](self, "contentBoundsGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bottomConstraintForView:fromLayoutGuide:templateComponent:layoutStyle:", v28, v26, 0, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v27);
  -[UIStackView setSpacing:](self->_leadingViews, "setSpacing:", fabs(left) + fabs(right));

}

- (void)insertTrailingView:(id)a3 withMargins:(UIEdgeInsets)a4
{
  double right;
  double left;
  id v7;
  UIStackView *trailingViews;
  UIStackView *v9;
  UIStackView *v10;
  double v11;
  double v12;
  UIStackView *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  right = a4.right;
  left = a4.left;
  v7 = a3;
  trailingViews = self->_trailingViews;
  v22 = v7;
  if (!trailingViews)
  {
    v9 = (UIStackView *)objc_alloc_init(MEMORY[0x24BDF6DD0]);
    v10 = self->_trailingViews;
    self->_trailingViews = v9;

    -[SiriUILabelStackTemplateView addSubview:](self, "addSubview:", self->_trailingViews);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_trailingViews, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAlignment:](self->_trailingViews, "setAlignment:", 0);
    -[UIStackView setAxis:](self->_trailingViews, "setAxis:", 0);
    LODWORD(v11) = 1144750080;
    -[UIStackView setContentHuggingPriority:forAxis:](self->_trailingViews, "setContentHuggingPriority:forAxis:", 0, v11);
    LODWORD(v12) = 1132068864;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](self->_trailingViews, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    v13 = self->_trailingViews;
    -[SiriUILabelStackTemplateView contentBoundsGuide](self, "contentBoundsGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[UIStackView siriui_pinTrailingToTrailingEdgeOf:withMargin:](v13, "siriui_pinTrailingToTrailingEdgeOf:withMargin:", v14, 0.0);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_stackedComponentsGuideConstraints, "objectForKeyedSubscript:", &unk_24D7EF2F8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView removeConstraint:](self, "removeConstraint:", v16);

    -[UIStackView siriui_pinLeadingToTrailingEdgeOf:withMargin:](self->_trailingViews, "siriui_pinLeadingToTrailingEdgeOf:withMargin:", self->_stackedComponentsBoundsGuide, 12.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_stackedComponentsGuideConstraints, "setObject:forKeyedSubscript:", v17, &unk_24D7EF2F8);
    -[UIStackView centerYAnchor](self->_trailingViews, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView stackedComponentsBoundsGuide](self, "stackedComponentsBoundsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v21);

    v7 = v22;
    trailingViews = self->_trailingViews;
  }
  -[UIStackView addArrangedSubview:](trailingViews, "addArrangedSubview:", v7);
  -[UIStackView setSpacing:](self->_trailingViews, "setSpacing:", fabs(left) + fabs(right));

}

- (void)insertTopView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SiriUILabelStackTemplateView addSubview:](self, "addSubview:", v4);
  -[SiriUILabelStackTemplateView topView](self, "topView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SiriUILabelStackTemplateView topView](self, "topView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUILabelStackTemplateView componentsForViews](self, "componentsForViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[SiriUIComponentConstraintFactory sharedConstraintFactory](SiriUIComponentConstraintFactory, "sharedConstraintFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "verticalConstraintFromUpperView:lowerView:upperTemplateComponent:lowerTemplateComponent:layoutStyle:", v4, v6, 0, v9, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v11);
  }
  else
  {
    -[SiriUILabelStackTemplateView setBottomView:](self, "setBottomView:", v4);
  }
  -[SiriUILabelStackTemplateView setTopView:](self, "setTopView:", v4);

  -[SiriUILabelStackTemplateView _updateTopAndBottomViewConstraints](self, "_updateTopAndBottomViewConstraints");
  -[SiriUILabelStackTemplateView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (double)desiredHeight
{
  CGRect v3;

  -[UILayoutGuide layoutFrame](self->_contentBoundsGuide, "layoutFrame");
  return CGRectGetMaxY(v3);
}

- (void)removeFromTemplatedSuperview
{
  id v3;

  -[SiriUIBaseTemplateView templatedSuperview](self, "templatedSuperview");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateSubviewWantsToBeRemovedFromHierarchy:", self);

}

- (void)populateStack
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SiriUILabelStackTemplateView topView](self, "topView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SiriUIBaseTemplateView dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      v11 = v3;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        +[SiriUILabelComponentView viewForComponent:](SiriUILabelComponentView, "viewForComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SiriUILabelStackTemplateView componentsForViews](self, "componentsForViews");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v13, v16);

        -[SiriUILabelStackTemplateView addSubview:](self, "addSubview:", v14);
        if (v11)
        {
          +[SiriUIComponentConstraintFactory sharedConstraintFactory](SiriUIComponentConstraintFactory, "sharedConstraintFactory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "verticalConstraintFromUpperView:lowerView:upperTemplateComponent:lowerTemplateComponent:layoutStyle:", v11, v14, v12, v13, -[SiriUILabelStackTemplateView layoutStyle](self, "layoutStyle"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[SiriUILabelStackTemplateView addConstraint:](self, "addConstraint:", v18);
        }
        else
        {
          -[SiriUILabelStackTemplateView setTopView:](self, "setTopView:", v14);
        }
        v19 = (id)objc_msgSend(v14, "siriui_pinLeadingToLeadingEdgeOf:withMargin:", self->_stackedComponentsBoundsGuide, 0.0);
        v20 = (id)objc_msgSend(v14, "siriui_pinTrailingToTrailingEdgeOf:withMargin:", self->_stackedComponentsBoundsGuide, 0.0);
        v8 = v13;

        v3 = v14;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v3;
          objc_msgSend(v21, "setTextAlignment:", -[SiriUILabelStackTemplateView defaultTextAlignment](self, "defaultTextAlignment"));

        }
        -[SiriUILabelStackTemplateView setBottomView:](self, "setBottomView:", v3);

        ++v10;
        v11 = v3;
        v12 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);

  }
}

- (void)setTemplatedSuperview:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SiriUILabelStackTemplateView;
  -[SiriUIBaseTemplateView setTemplatedSuperview:](&v7, sel_setTemplatedSuperview_, v4);
  if (v4)
  {
    v5 = -[UIView siriui_pinLeadingTo:withMargin:](self, "siriui_pinLeadingTo:withMargin:", v4, 0.0);
    v6 = -[UIView siriui_pinTrailingTo:withMargin:](self, "siriui_pinTrailingTo:withMargin:", v4, 0.0);
    -[SiriUILabelStackTemplateView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (int64_t)layoutStyle
{
  return 0;
}

- (void)reloadData
{
  -[SiriUILabelStackTemplateView populateStack](self, "populateStack");
  -[SiriUILabelStackTemplateView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void)setDataSource:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUILabelStackTemplateView;
  -[SiriUIBaseTemplateView setDataSource:](&v4, sel_setDataSource_, a3);
  -[SiriUILabelStackTemplateView reloadData](self, "reloadData");
}

- (SiriUILabelStackTemplateViewDelegate)delegate
{
  return (SiriUILabelStackTemplateViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)defaultTextAlignment
{
  return self->_defaultTextAlignment;
}

- (void)setDefaultTextAlignment:(int64_t)a3
{
  self->_defaultTextAlignment = a3;
}

- (UIView)topView
{
  return self->_topView;
}

- (void)setTopView:(id)a3
{
  objc_storeStrong((id *)&self->_topView, a3);
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (void)setBottomView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomView, a3);
}

- (BOOL)constraintsUpdated
{
  return self->_constraintsUpdated;
}

- (void)setConstraintsUpdated:(BOOL)a3
{
  self->_constraintsUpdated = a3;
}

- (NSLayoutConstraint)topViewConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_topViewConstraint);
}

- (void)setTopViewConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_topViewConstraint, a3);
}

- (NSLayoutConstraint)bottomViewConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_bottomViewConstraint);
}

- (void)setBottomViewConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_bottomViewConstraint, a3);
}

- (UIStackView)trailingViews
{
  return self->_trailingViews;
}

- (void)setTrailingViews:(id)a3
{
  objc_storeStrong((id *)&self->_trailingViews, a3);
}

- (UIStackView)leadingViews
{
  return self->_leadingViews;
}

- (void)setLeadingViews:(id)a3
{
  objc_storeStrong((id *)&self->_leadingViews, a3);
}

- (NSMutableDictionary)componentsForViews
{
  return self->_componentsForViews;
}

- (void)setComponentsForViews:(id)a3
{
  objc_storeStrong((id *)&self->_componentsForViews, a3);
}

- (UILayoutGuide)contentBoundsGuide
{
  return self->_contentBoundsGuide;
}

- (void)setContentBoundsGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentBoundsGuide, a3);
}

- (NSDictionary)contentBoundsGuideConstraints
{
  return self->_contentBoundsGuideConstraints;
}

- (void)setContentBoundsGuideConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_contentBoundsGuideConstraints, a3);
}

- (UILayoutGuide)stackedComponentsBoundsGuide
{
  return self->_stackedComponentsBoundsGuide;
}

- (void)setStackedComponentsBoundsGuide:(id)a3
{
  objc_storeStrong((id *)&self->_stackedComponentsBoundsGuide, a3);
}

- (NSMutableDictionary)stackedComponentsGuideConstraints
{
  return self->_stackedComponentsGuideConstraints;
}

- (void)setStackedComponentsGuideConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_stackedComponentsGuideConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackedComponentsGuideConstraints, 0);
  objc_storeStrong((id *)&self->_stackedComponentsBoundsGuide, 0);
  objc_storeStrong((id *)&self->_contentBoundsGuideConstraints, 0);
  objc_storeStrong((id *)&self->_contentBoundsGuide, 0);
  objc_storeStrong((id *)&self->_componentsForViews, 0);
  objc_storeStrong((id *)&self->_leadingViews, 0);
  objc_storeStrong((id *)&self->_trailingViews, 0);
  objc_destroyWeak((id *)&self->_bottomViewConstraint);
  objc_destroyWeak((id *)&self->_topViewConstraint);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
