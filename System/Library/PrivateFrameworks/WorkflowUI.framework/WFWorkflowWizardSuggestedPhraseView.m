@implementation WFWorkflowWizardSuggestedPhraseView

- (WFWorkflowWizardSuggestedPhraseView)initWithSuggestedPhrase:(id)a3
{
  id v4;
  WFWorkflowWizardSuggestedPhraseView *v5;
  uint64_t v6;
  NSString *suggestedPhrase;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  WFWorkflowWizardSuggestedPhraseView *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD v45[9];

  v45[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  v5 = -[WFWorkflowWizardSuggestedPhraseView init](&v44, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    suggestedPhrase = v5->_suggestedPhrase;
    v5->_suggestedPhrase = (NSString *)v6;

    v8 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@”"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v11);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v12);

    -[WFWorkflowWizardSuggestedPhraseView tintColor](v5, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v13);

    -[WFWorkflowWizardSuggestedPhraseView addSubview:](v5, "addSubview:", v8);
    objc_storeWeak((id *)&v5->_label, v8);
    v14 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "separatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    -[WFWorkflowWizardSuggestedPhraseView addSubview:](v5, "addSubview:", v14);
    v33 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardSuggestedPhraseView leadingAnchor](v5, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0);
    v40 = v8;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v41;
    objc_msgSend(v8, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardSuggestedPhraseView trailingAnchor](v5, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -16.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v37;
    objc_msgSend(v8, "centerYAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardSuggestedPhraseView centerYAnchor](v5, "centerYAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v34;
    objc_msgSend(v14, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scale");
    objc_msgSend(v31, "constraintEqualToConstant:", 1.0 / v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v30;
    objc_msgSend(v14, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardSuggestedPhraseView leadingAnchor](v5, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45[4] = v27;
    objc_msgSend(v14, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardSuggestedPhraseView trailingAnchor](v5, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[5] = v19;
    objc_msgSend(v14, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWorkflowWizardSuggestedPhraseView bottomAnchor](v5, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = v4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[6] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v24);

    v4 = v22;
    v25 = v5;

  }
  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 44.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  -[WFWorkflowWizardSuggestedPhraseView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[WFWorkflowWizardSuggestedPhraseView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardSuggestedPhraseView label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v3);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  -[WFWorkflowWizardSuggestedPhraseView touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[WFWorkflowWizardSuggestedPhraseView highlight](self, "highlight");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  -[WFWorkflowWizardSuggestedPhraseView touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[WFWorkflowWizardSuggestedPhraseView unhighlight](self, "unhighlight");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWorkflowWizardSuggestedPhraseView;
  -[WFWorkflowWizardSuggestedPhraseView touchesEnded:withEvent:](&v7, sel_touchesEnded_withEvent_, a3, a4);
  -[WFWorkflowWizardSuggestedPhraseView fadeOutHighlight](self, "fadeOutHighlight");
  -[WFWorkflowWizardSuggestedPhraseView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardSuggestedPhraseView suggestedPhrase](self, "suggestedPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflowWizardSuggestedPhraseViewDidSelectSuggestedPhrase:", v6);

}

- (void)highlight
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "wf_tableCellDefaultSelectionTintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardSuggestedPhraseView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)unhighlight
{
  id v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowWizardSuggestedPhraseView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)fadeOutHighlight
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__WFWorkflowWizardSuggestedPhraseView_fadeOutHighlight__block_invoke;
  v2[3] = &unk_24E604D88;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 65538, v2, 0, 0.5, 0.0);
}

- (WFWorkflowWizardSuggestedPhraseViewDelegate)delegate
{
  return (WFWorkflowWizardSuggestedPhraseViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)suggestedPhrase
{
  return self->_suggestedPhrase;
}

- (UILabel)label
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_label);
}

- (void)setLabel:(id)a3
{
  objc_storeWeak((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_label);
  objc_storeStrong((id *)&self->_suggestedPhrase, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __55__WFWorkflowWizardSuggestedPhraseView_fadeOutHighlight__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unhighlight");
}

@end
