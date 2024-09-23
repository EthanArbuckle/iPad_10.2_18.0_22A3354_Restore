@implementation WFWidgetConfigurationCardView

- (WFWidgetConfigurationCardView)initWithRequest:(id)a3 contentView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WFWidgetConfigurationCardView *v12;
  MTStylingProvidingSolidColorView *v13;
  MTStylingProvidingSolidColorView *backgroundView;
  void *v15;
  uint64_t v16;
  MTVisualStylingProvider *strokeProvider;
  void *v18;
  uint64_t v19;
  MTVisualStylingProvider *fillProvider;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  WFWidgetConfigurationCardHeaderView *v28;
  void *v29;
  WFWidgetConfigurationCardHeaderView *headerView;
  WFWidgetConfigurationCardHeaderView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UILayoutGuide *v41;
  UILayoutGuide *contentViewGuide;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  WFWidgetConfigurationCardView *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  WFWidgetConfigurationCardHeaderView *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  objc_super v94;
  _QWORD v95[13];

  v95[11] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v6, "defaultCardSize");
  v94.receiver = self;
  v94.super_class = (Class)WFWidgetConfigurationCardView;
  v12 = -[WFWidgetConfigurationCardView initWithFrame:](&v94, sel_initWithFrame_, v8, v9, v10, v11);
  if (v12)
  {
    v92 = v7;
    v13 = (MTStylingProvidingSolidColorView *)objc_alloc_init(MEMORY[0x24BE64068]);
    backgroundView = v12->_backgroundView;
    v12->_backgroundView = v13;

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visualStylingProviderForCategory:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    strokeProvider = v12->_strokeProvider;
    v12->_strokeProvider = (MTVisualStylingProvider *)v16;

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "visualStylingProviderForCategory:", 2);
    v19 = objc_claimAutoreleasedReturnValue();
    fillProvider = v12->_fillProvider;
    v12->_fillProvider = (MTVisualStylingProvider *)v19;

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUserInteractionEnabled:", 1);

    if (objc_msgSend(v6, "resolvedWidgetConfigurationStyle") == 1)
    {
      -[WFWidgetConfigurationCardView layer](v12, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCornerRadius:", 21.0);

      v23 = *MEMORY[0x24BDE58E8];
      -[WFWidgetConfigurationCardView layer](v12, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCornerCurve:", v23);

      -[WFWidgetConfigurationCardView setClipsToBounds:](v12, "setClipsToBounds:", 1);
      v25 = 14.0;
      v26 = 17.0;
      v27 = 14.0;
    }
    else
    {
      v26 = 20.0;
      v25 = 20.0;
      v27 = 20.0;
    }
    -[WFWidgetConfigurationCardView setLayoutMargins:](v12, "setLayoutMargins:", v26, v25, v26, v27);
    v28 = -[WFWidgetConfigurationCardHeaderView initWithRequest:]([WFWidgetConfigurationCardHeaderView alloc], "initWithRequest:", v6);
    -[WFWidgetConfigurationCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFWidgetConfigurationCardHeaderView setPreservesSuperviewLayoutMargins:](v28, "setPreservesSuperviewLayoutMargins:", 1);
    -[WFWidgetConfigurationCardHeaderView setDelegate:](v28, "setDelegate:", v12);
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v28);

    v93 = v6;
    headerView = v12->_headerView;
    v12->_headerView = v28;
    v31 = v28;

    -[WFWidgetConfigurationCardView strokeProvider](v12, "strokeProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView titleLabel](v31, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "automaticallyUpdateView:withStyle:", v33, 0);

    -[WFWidgetConfigurationCardView strokeProvider](v12, "strokeProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView subtitleLabel](v31, "subtitleLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "automaticallyUpdateView:withStyle:", v35, 2);

    -[WFWidgetConfigurationCardView strokeProvider](v12, "strokeProvider");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView closeButton](v31, "closeButton");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "automaticallyUpdateView:withStyle:andObserverBlock:", v37, 2, &__block_literal_global_725);

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView addSubview:](v12, "addSubview:", v38);

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setPreservesSuperviewLayoutMargins:", 1);

    v41 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x24BEBD718]);
    contentViewGuide = v12->_contentViewGuide;
    v12->_contentViewGuide = v41;

    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addLayoutGuide:", v12->_contentViewGuide);

    v72 = (void *)MEMORY[0x24BDD1628];
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "leadingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView leadingAnchor](v12, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "constraintEqualToAnchor:", v89);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v88;
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView trailingAnchor](v12, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:", v85);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v84;
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "topAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView topAnchor](v12, "topAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintEqualToAnchor:", v81);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v80;
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "bottomAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView bottomAnchor](v12, "bottomAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v76;
    -[WFWidgetConfigurationCardHeaderView topAnchor](v31, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v95[4] = v71;
    v59 = v31;
    -[WFWidgetConfigurationCardHeaderView leadingAnchor](v31, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v95[5] = v67;
    -[WFWidgetConfigurationCardHeaderView trailingAnchor](v31, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "trailingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:", v64);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v95[6] = v63;
    -[UILayoutGuide topAnchor](v12->_contentViewGuide, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardHeaderView bottomAnchor](v12->_headerView, "bottomAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v95[7] = v60;
    -[UILayoutGuide leadingAnchor](v12->_contentViewGuide, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v95[8] = v55;
    -[UILayoutGuide trailingAnchor](v12->_contentViewGuide, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v95[9] = v47;
    -[UILayoutGuide bottomAnchor](v12->_contentViewGuide, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView backgroundView](v12, "backgroundView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v95[10] = v51;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 11);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "activateConstraints:", v52);

    v6 = v93;
    v7 = v92;
    -[WFWidgetConfigurationCardView setContentView:](v12, "setContentView:", v92);
    v53 = v12;
  }

  return v12;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWidgetConfigurationCardView;
  v4 = a3;
  -[WFWidgetConfigurationCardView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[WFWidgetConfigurationCardView backgroundView](self, "backgroundView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setContentView:(id)a3
{
  -[WFWidgetConfigurationCardView setContentView:stretchToFit:](self, "setContentView:stretchToFit:", a3, 1);
}

- (void)setContentView:(id)a3 stretchToFit:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  UIView *contentView;
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
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v4 = a4;
  v31[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  contentView = self->_contentView;
  if (contentView)
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_contentView, a3);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v7)
  {
    -[WFWidgetConfigurationCardView bounds](self, "bounds");
    objc_msgSend(v7, "setFrame:");
    -[WFWidgetConfigurationCardView backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWidgetConfigurationCardView headerView](self, "headerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertSubview:belowSubview:", v7, v10);

    v27 = (void *)MEMORY[0x24BDD1628];
    if (v4)
    {
      objc_msgSend(v7, "leadingAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide leadingAnchor](self->_contentViewGuide, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11;
      objc_msgSend(v11, "constraintEqualToAnchor:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v26;
      objc_msgSend(v7, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide trailingAnchor](self->_contentViewGuide, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v12;
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v14;
      objc_msgSend(v7, "topAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide topAnchor](self->_contentViewGuide, "topAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v17;
      objc_msgSend(v7, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide bottomAnchor](self->_contentViewGuide, "bottomAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[3] = v20;
      v21 = v31;
    }
    else
    {
      objc_msgSend(v7, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerXAnchor](self->_contentViewGuide, "centerXAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v22;
      objc_msgSend(v22, "constraintEqualToAnchor:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v26;
      objc_msgSend(v7, "centerYAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide centerYAnchor](self->_contentViewGuide, "centerYAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWidgetConfigurationCardView widgetDescriptionTallScriptCompensatedSpacing](self, "widgetDescriptionTallScriptCompensatedSpacing");
      v25 = v23;
      objc_msgSend(v23, "constraintEqualToAnchor:constant:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v14;
      objc_msgSend(v7, "widthAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide widthAnchor](self->_contentViewGuide, "widthAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v17;
      objc_msgSend(v7, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILayoutGuide heightAnchor](self->_contentViewGuide, "heightAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v20;
      v21 = v30;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v24);

  }
}

- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3
{
  id v4;

  self->_widgetDescriptionTallScriptCompensatedSpacing = a3;
  -[WFWidgetConfigurationCardView headerView](self, "headerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWidgetDescriptionTallScriptCompensatedSpacing:", a3);

}

- (void)widgetConfigurationCardHeaderViewDidRequestToClose:(id)a3
{
  id v4;

  -[WFWidgetConfigurationCardView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetConfigurationCardViewDidRequestToClose:", self);

}

- (WFWidgetConfigurationCardHeaderView)headerView
{
  return self->_headerView;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (WFWidgetConfigurationCardViewDelegate)delegate
{
  return (WFWidgetConfigurationCardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)widgetDescriptionTallScriptCompensatedSpacing
{
  return self->_widgetDescriptionTallScriptCompensatedSpacing;
}

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (MTStylingProvidingSolidColorView)backgroundView
{
  return self->_backgroundView;
}

- (UILayoutGuide)contentViewGuide
{
  return self->_contentViewGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewGuide, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

void *__61__WFWidgetConfigurationCardView_initWithRequest_contentView___block_invoke()
{
  return &__block_literal_global_36;
}

void __61__WFWidgetConfigurationCardView_initWithRequest_contentView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a2, "_visualStylingForContinuallyUpdatedView:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v7, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setImageColor:forState:", v6, 0);

}

@end
