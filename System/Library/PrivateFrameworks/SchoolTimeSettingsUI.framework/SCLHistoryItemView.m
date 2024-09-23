@implementation SCLHistoryItemView

- (SCLHistoryItemView)initWithFrame:(CGRect)a3
{
  SCLHistoryItemView *v3;
  id v4;
  uint64_t v5;
  UILabel *label;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  UILabel *intervalLabel;
  UILabel *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSArray *unconditionalConstraints;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSArray *verticalLayoutConstraints;
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
  objc_super v74;
  _QWORD v75[3];
  _QWORD v76[16];

  v76[14] = *MEMORY[0x24BDAC8D0];
  v74.receiver = self;
  v74.super_class = (Class)SCLHistoryItemView;
  v3 = -[SCLHistoryItemView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6B68]);
    -[SCLHistoryItemView bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    LODWORD(v7) = 1144733696;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v3->_label, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1144733696;
    -[UILabel setContentHuggingPriority:forAxis:](v3->_label, "setContentHuggingPriority:forAxis:", 0, v8);
    -[SCLHistoryItemView addSubview:](v3, "addSubview:", v3->_label);
    v9 = objc_alloc(MEMORY[0x24BDF6B68]);
    -[SCLHistoryItemView bounds](v3, "bounds");
    v10 = objc_msgSend(v9, "initWithFrame:");
    intervalLabel = v3->_intervalLabel;
    v3->_intervalLabel = (UILabel *)v10;

    v12 = v3->_intervalLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_intervalLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_intervalLabel, "setNumberOfLines:", 0);
    -[SCLHistoryItemView addSubview:](v3, "addSubview:", v3->_intervalLabel);
    v14 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    objc_msgSend(v14, "setIdentifier:", CFSTR("horizontalContentGuide"));
    -[SCLHistoryItemView addLayoutGuide:](v3, "addLayoutGuide:", v14);
    v15 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    objc_msgSend(v15, "setIdentifier:", CFSTR("textAlignmentGuide"));
    -[SCLHistoryItemView addLayoutGuide:](v3, "addLayoutGuide:", v15);
    objc_msgSend(v14, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryItemView leadingAnchor](v3, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 15.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v73, "setIdentifier:", CFSTR("contentGuide.leading"));
    objc_msgSend(v14, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryItemView trailingAnchor](v3, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -15.0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "setIdentifier:", CFSTR("contentGuide.trailing"));
    objc_msgSend(v14, "heightAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 0.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v71, "setIdentifier:", CFSTR("contentGuide.height"));
    objc_msgSend(v14, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryItemView topAnchor](v3, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v70, "setIdentifier:", CFSTR("contentGuide.top"));
    objc_msgSend(v15, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryItemView topAnchor](v3, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v69, "setIdentifier:", CFSTR("textAlignment.centerY"));
    objc_msgSend(v15, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerXAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v68, "setIdentifier:", CFSTR("textAlignment.centerX"));
    objc_msgSend(v15, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", 0.0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "setIdentifier:", CFSTR("textAlignment.height"));
    v67 = v15;
    objc_msgSend(v15, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToConstant:", 20.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "setIdentifier:", CFSTR("textAlignment.width"));
    -[UILabel leadingAnchor](v3->_intervalLabel, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "setIdentifier:", CFSTR("intervalLabel.leading"));
    -[UILabel topAnchor](v3->_intervalLabel, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryItemView topAnchor](v3, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v33, 1.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "setIdentifier:", CFSTR("intervalLabel.top"));
    -[UILabel trailingAnchor](v3->_intervalLabel, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setIdentifier:", CFSTR("intervalLabel.trailing"));
    LODWORD(v37) = 1132068864;
    v38 = v36;
    objc_msgSend(v36, "setPriority:", v37);
    -[SCLHistoryItemView bottomAnchor](v3, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_label, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v40, 1.0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v41) = 1144750080;
    objc_msgSend(v63, "setPriority:", v41);
    -[UILabel widthAnchor](v3->_intervalLabel, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widthAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v44, "setIdentifier:", CFSTR("intervalLabel.width"));
    -[UILabel widthAnchor](v3->_label, "widthAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "widthAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v47, "setIdentifier:", CFSTR("itemLabel.width"));
    v76[0] = v73;
    v76[1] = v72;
    v76[2] = v70;
    v76[3] = v71;
    v76[4] = v68;
    v76[5] = v69;
    v76[6] = v66;
    v76[7] = v65;
    v76[8] = v31;
    v76[9] = v64;
    v76[10] = v38;
    v76[11] = v63;
    v76[12] = v44;
    v76[13] = v47;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 14);
    v48 = objc_claimAutoreleasedReturnValue();
    unconditionalConstraints = v3->_unconditionalConstraints;
    v3->_unconditionalConstraints = (NSArray *)v48;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_unconditionalConstraints);
    -[UILabel leadingAnchor](v3->_label, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel trailingAnchor](v3->_label, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintLessThanOrEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v56) = 1144750080;
    objc_msgSend(v55, "setPriority:", v56);
    -[UILabel topAnchor](v3->_label, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_intervalLabel, "bottomAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v58, 1.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v75[0] = v52;
    v75[1] = v55;
    v75[2] = v59;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 3);
    v60 = objc_claimAutoreleasedReturnValue();
    verticalLayoutConstraints = v3->_verticalLayoutConstraints;
    v3->_verticalLayoutConstraints = (NSArray *)v60;

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v3->_verticalLayoutConstraints);
  }
  return v3;
}

- (void)updateConstraints
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SCLHistoryItemView;
  -[SCLHistoryItemView updateConstraints](&v2, sel_updateConstraints);
}

- (id)viewForFirstBaselineLayout
{
  return self->_intervalLabel;
}

- (SCLUnlockHistoryItemFormatter)historyItemFormatter
{
  SCLUnlockHistoryItemFormatter *historyItemFormatter;
  SCLUnlockHistoryItemFormatter *v4;
  SCLUnlockHistoryItemFormatter *v5;

  historyItemFormatter = self->_historyItemFormatter;
  if (!historyItemFormatter)
  {
    v4 = objc_alloc_init(SCLUnlockHistoryItemFormatter);
    v5 = self->_historyItemFormatter;
    self->_historyItemFormatter = v4;

    historyItemFormatter = self->_historyItemFormatter;
  }
  return historyItemFormatter;
}

- (SCLTimeIntervalsFormatter)intervalsFormatter
{
  SCLTimeIntervalsFormatter *intervalsFormatter;
  SCLTimeIntervalsFormatter *v4;
  SCLTimeIntervalsFormatter *v5;

  intervalsFormatter = self->_intervalsFormatter;
  if (!intervalsFormatter)
  {
    v4 = (SCLTimeIntervalsFormatter *)objc_alloc_init(MEMORY[0x24BE84220]);
    v5 = self->_intervalsFormatter;
    self->_intervalsFormatter = v4;

    intervalsFormatter = self->_intervalsFormatter;
  }
  return intervalsFormatter;
}

- (void)setHistoryGroup:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  SCLHistoryItemView *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  SCLHistoryItemView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_historyGroup, a3);
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = 0x24BDD1000uLL;
  v8 = objc_alloc_init(MEMORY[0x24BDD1688]);
  objc_msgSend(v8, "beginEditing");
  v44 = v5;
  objc_msgSend(v5, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x24BDD1000uLL;
  v42 = v9;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UNLOCK_HISTORY_UNLOCKED_SECTION_TITLE"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("\n"));
    v14 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BEBB360];
    v53[0] = v6;
    v17 = *MEMORY[0x24BEBB368];
    v43 = v16;
    v52[0] = v16;
    v52[1] = v17;
    v41 = v17;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v13, "initWithString:attributes:", v15, v20);

    self = v19;
    objc_msgSend(v8, "appendAttributedString:", v21);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __38__SCLHistoryItemView_setHistoryGroup___block_invoke;
    v45[3] = &unk_24E711FF8;
    v45[4] = v19;
    v46 = v8;
    v22 = v14;
    v10 = 0x24BDD1000;
    v47 = v22;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v45);

    v7 = 0x24BDD1000;
  }
  else
  {
    v43 = *MEMORY[0x24BEBB360];
    v41 = *MEMORY[0x24BEBB368];
  }
  objc_msgSend(v8, "endEditing");
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v8);
  v23 = objc_alloc_init(*(Class *)(v7 + 1672));
  v24 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(*(id *)(v10 + 1160), "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("UNLOCK_HISTORY_SCHEDULE_SECTION_TITLE"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v6;
  v51[0] = v6;
  v50[0] = v43;
  v50[1] = v41;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v27 = self;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v24, "initWithString:attributes:", v26, v29);
  objc_msgSend(v23, "appendAttributedString:", v30);

  objc_msgSend(v23, "mutableString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendString:", CFSTR("\n"));

  -[SCLHistoryItemView intervalsFormatter](v27, "intervalsFormatter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "effectiveSchedule");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "uniformTimeIntervals");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringFromTimeIntervals:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = objc_alloc(MEMORY[0x24BDD1458]);
  v48[1] = v41;
  v49[0] = v40;
  v48[0] = v43;
  objc_msgSend(MEMORY[0x24BDF6950], "tableCellGrayTextColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v36, "initWithString:attributes:", v35, v38);
  objc_msgSend(v23, "appendAttributedString:", v39);

  -[UILabel setAttributedText:](v27->_intervalLabel, "setAttributedText:", v23);
  -[SCLHistoryItemView setNeedsUpdateConstraints](v27, "setNeedsUpdateConstraints");
  -[SCLHistoryItemView setNeedsLayout](v27, "setNeedsLayout");

}

void __38__SCLHistoryItemView_setHistoryGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "historyItemFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedStringForObjectValue:withDefaultAttributes:", v6, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "appendAttributedString:", v9);
  if (a3 + 1 < (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "mutableString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", CFSTR("\n"));

  }
}

- (void)setHistoryItemFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_historyItemFormatter, a3);
}

- (void)setIntervalsFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_intervalsFormatter, a3);
}

- (SCLHistoryGroup)historyGroup
{
  return self->_historyGroup;
}

- (NSArray)verticalLayoutConstraints
{
  return self->_verticalLayoutConstraints;
}

- (void)setVerticalLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, a3);
}

- (NSArray)unconditionalConstraints
{
  return self->_unconditionalConstraints;
}

- (void)setUnconditionalConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_unconditionalConstraints, a3);
}

- (UILabel)intervalLabel
{
  return self->_intervalLabel;
}

- (void)setIntervalLabel:(id)a3
{
  objc_storeStrong((id *)&self->_intervalLabel, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_intervalLabel, 0);
  objc_storeStrong((id *)&self->_unconditionalConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_historyGroup, 0);
  objc_storeStrong((id *)&self->_intervalsFormatter, 0);
  objc_storeStrong((id *)&self->_historyItemFormatter, 0);
}

@end
