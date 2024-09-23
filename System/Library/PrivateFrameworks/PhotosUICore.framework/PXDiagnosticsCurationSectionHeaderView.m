@implementation PXDiagnosticsCurationSectionHeaderView

- (PXDiagnosticsCurationSectionHeaderView)initWithFrame:(CGRect)a3
{
  PXDiagnosticsCurationSectionHeaderView *v3;
  PXDiagnosticsCurationSectionHeaderView *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  PXStateBadgeView *v10;
  PXStateBadgeView *stateBadgeView;
  UILabel *v12;
  UILabel *agentAndStageLabel;
  void *v14;
  UILabel *v15;
  UILabel *reasonLabel;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PXDiagnosticsCurationSectionHeaderView;
  v3 = -[PXDiagnosticsCurationSectionHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXDiagnosticsCurationSectionHeaderView bounds](v3, "bounds");
    v6 = v5;
    -[PXDiagnosticsCurationSectionHeaderView bounds](v4, "bounds");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 3.0, v6, v7 + -4.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[PXDiagnosticsCurationSectionHeaderView addSubview:](v4, "addSubview:", v8);
    v10 = -[PXStateBadgeView initWithState:]([PXStateBadgeView alloc], "initWithState:", CFSTR("Unknown"));
    stateBadgeView = v4->_stateBadgeView;
    v4->_stateBadgeView = v10;

    -[PXDiagnosticsCurationSectionHeaderView addSubview:](v4, "addSubview:", v4->_stateBadgeView);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    agentAndStageLabel = v4->_agentAndStageLabel;
    v4->_agentAndStageLabel = v12;

    -[UILabel setText:](v4->_agentAndStageLabel, "setText:", CFSTR("Agent & Stage"));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_agentAndStageLabel, "setTextColor:", v14);

    -[PXDiagnosticsCurationSectionHeaderView addSubview:](v4, "addSubview:", v4->_agentAndStageLabel);
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    reasonLabel = v4->_reasonLabel;
    v4->_reasonLabel = v15;

    -[UILabel setText:](v4->_reasonLabel, "setText:", CFSTR("Reason"));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_reasonLabel, "setTextColor:", v17);

    -[PXDiagnosticsCurationSectionHeaderView addSubview:](v4, "addSubview:", v4->_reasonLabel);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXDiagnosticsCurationSectionHeaderView;
  -[PXDiagnosticsCurationSectionHeaderView layoutSubviews](&v10, sel_layoutSubviews);
  -[PXDiagnosticsCurationSectionHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PXStateBadgeView setFrame:](self->_stateBadgeView, "setFrame:", 2.0, 5.0, 16.0, 16.0);
  v7 = v6 * 0.5 + -3.0;
  -[UILabel setFrame:](self->_agentAndStageLabel, "setFrame:", 24.0, 4.0, v4, v7);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_agentAndStageLabel, "setFont:", v8);

  -[UILabel setFrame:](self->_reasonLabel, "setFrame:", 24.0, 21.0, v4, v7);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_reasonLabel, "setFont:", v9);

}

- (void)setState:(id)a3
{
  NSString **p_state;
  id v6;

  p_state = &self->_state;
  objc_storeStrong((id *)&self->_state, a3);
  v6 = a3;
  -[PXStateBadgeView setState:](self->_stateBadgeView, "setState:", *p_state);

}

- (void)setSectionInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (v13
    && (objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("state")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("state"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDiagnosticsCurationSectionHeaderView setState:](self, "setState:", v5);

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("stateHistory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("agent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDiagnosticsCurationSectionHeaderView setAgentAndStage:](self, "setAgentAndStage:", v11);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("reason"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXDiagnosticsCurationSectionHeaderView setReason:](self, "setReason:", v12);

  }
  else
  {
    -[PXDiagnosticsCurationSectionHeaderView setState:](self, "setState:", CFSTR("Rejected"));
    -[PXDiagnosticsCurationSectionHeaderView setAgentAndStage:](self, "setAgentAndStage:", CFSTR("Not clustered"));
    -[PXDiagnosticsCurationSectionHeaderView setReason:](self, "setReason:", 0);
  }

}

- (void)setAgentAndStage:(id)a3
{
  NSString **p_agentAndStage;
  id v6;

  p_agentAndStage = &self->_agentAndStage;
  objc_storeStrong((id *)&self->_agentAndStage, a3);
  v6 = a3;
  -[UILabel setText:](self->_agentAndStageLabel, "setText:", *p_agentAndStage);

}

- (void)setReason:(id)a3
{
  NSString **p_reason;
  id v6;

  p_reason = &self->_reason;
  objc_storeStrong((id *)&self->_reason, a3);
  v6 = a3;
  -[UILabel setText:](self->_reasonLabel, "setText:", *p_reason);

}

- (NSDictionary)sectionInfo
{
  return self->_sectionInfo;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)agentAndStage
{
  return self->_agentAndStage;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_agentAndStage, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_agentAndStageLabel, 0);
  objc_storeStrong((id *)&self->_stateBadgeView, 0);
}

@end
