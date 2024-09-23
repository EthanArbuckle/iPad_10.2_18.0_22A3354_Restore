@implementation SiriUIDetailLabelComponentView

+ (id)viewForComponent:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubviewsForComponentModel:", v4);

  return v6;
}

- (void)addSubviewsForComponentModel:(id)a3
{
  UILabel *v4;
  UILabel *mainLabel;
  UILabel *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  UILabel *detailLabel;
  double v11;
  UILabel *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v19 = a3;
  switch(objc_msgSend(v19, "style"))
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredHeadlineLabel");
      v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredBodyLabel");
      v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredSubheadLabel");
      v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredCaptionLabel");
      v4 = (UILabel *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      mainLabel = self->_mainLabel;
      self->_mainLabel = v4;

      break;
    default:
      break;
  }
  v6 = self->_mainLabel;
  if (v6)
  {
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = self->_mainLabel;
    objc_msgSend(v19, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v8);

    -[SiriUIDetailLabelComponentView addSubview:](self, "addSubview:", self->_mainLabel);
  }
  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredBodyLabel");
  v9 = (UILabel *)objc_claimAutoreleasedReturnValue();
  detailLabel = self->_detailLabel;
  self->_detailLabel = v9;

  -[UILabel setUseSecondaryTextColor](self->_detailLabel, "setUseSecondaryTextColor");
  -[SiriUIDetailLabelComponentView addSubview:](self, "addSubview:", self->_detailLabel);
  LODWORD(v11) = 1132068864;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_mainLabel, "setContentCompressionResistancePriority:forAxis:", 0, v11);
  v12 = self->_detailLabel;
  objc_msgSend(v19, "detailText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v12, "setText:", v13);

  if (self->_detailLabel)
  {
    -[SiriUIDetailLabelComponentView addSubview:](self, "addSubview:");
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_detailLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = (id)-[UILabel siriui_centerVerticallyWithItem:withMargin:](self->_detailLabel, "siriui_centerVerticallyWithItem:withMargin:", self->_mainLabel, 0.0);
  }
  -[UILabel siriui_pinToSuperviewWithEdgeInsets:](self->_mainLabel, "siriui_pinToSuperviewWithEdgeInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", &unk_24D7EF4D8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIDetailLabelComponentView removeConstraint:](self, "removeConstraint:", v16);

  v17 = (id)-[UILabel siriui_pinTrailingToLeadingEdgeOf:withMargin:](self->_mainLabel, "siriui_pinTrailingToLeadingEdgeOf:withMargin:", self->_detailLabel, 0.0);
  v18 = (id)-[UILabel siriui_pinTrailingToTrailingEdgeOf:withMargin:](self->_detailLabel, "siriui_pinTrailingToTrailingEdgeOf:withMargin:", self, 0.0);

}

- (UILabel)mainLabel
{
  return self->_mainLabel;
}

- (void)setMainLabel:(id)a3
{
  objc_storeStrong((id *)&self->_mainLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
}

@end
