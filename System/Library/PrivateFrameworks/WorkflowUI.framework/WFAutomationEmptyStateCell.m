@implementation WFAutomationEmptyStateCell

- (WFAutomationEmptyStateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  WFAutomationEmptyStateCell *v4;
  void *v5;
  void *v6;
  void *v7;
  WFAutomationTypeExplanationPlatterView *v8;
  void *v9;
  WFAutomationTypeExplanationPlatterView *automationTypeView;
  WFAutomationEmptyStateCell *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFAutomationEmptyStateCell;
  v4 = -[WFAutomationEmptyStateCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationEmptyStateCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationEmptyStateCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    -[WFAutomationEmptyStateCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v8 = (WFAutomationTypeExplanationPlatterView *)objc_opt_new();
    -[WFAutomationTypeExplanationPlatterView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFAutomationEmptyStateCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    automationTypeView = v4->_automationTypeView;
    v4->_automationTypeView = v8;

    -[WFAutomationEmptyStateCell updateLayoutConstraints](v4, "updateLayoutConstraints");
    v11 = v4;
  }

  return v4;
}

- (void)configureForAutomationType:(unint64_t)a3 buttonTarget:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a4;
  -[WFAutomationEmptyStateCell automationTypeView](self, "automationTypeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configureForAutomationType:", a3);

  -[WFAutomationEmptyStateCell automationTypeView](self, "automationTypeView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setButtonTarget:action:", v8, a5);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFAutomationEmptyStateCell;
  -[WFAutomationEmptyStateCell prepareForReuse](&v4, sel_prepareForReuse);
  -[WFAutomationEmptyStateCell automationTypeView](self, "automationTypeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

}

- (void)updateLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDD1628];
  -[WFAutomationEmptyStateCell currentConstraints](self, "currentConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  -[WFAutomationEmptyStateCell automationTypeView](self, "automationTypeView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAutomationEmptyStateCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 1)
  {
    objc_msgSend(v11, "wf_addConstraintsToFillSuperview:insets:", v7, 0.0, 0.0, 24.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationEmptyStateCell setCurrentConstraints:](self, "setCurrentConstraints:", v9);
  }
  else
  {
    objc_msgSend(v7, "readableContentGuide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_addConstraintsToFillLayoutGuide:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAutomationEmptyStateCell setCurrentConstraints:](self, "setCurrentConstraints:", v10);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFAutomationEmptyStateCell;
  v4 = a3;
  -[WFAutomationEmptyStateCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  v5 = objc_msgSend(v4, "horizontalSizeClass", v8.receiver, v8.super_class);

  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "horizontalSizeClass");

  if (v5 != v7)
    -[WFAutomationEmptyStateCell updateLayoutConstraints](self, "updateLayoutConstraints");
}

- (WFAutomationTypeExplanationPlatterView)automationTypeView
{
  return self->_automationTypeView;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_currentConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_automationTypeView, 0);
}

@end
