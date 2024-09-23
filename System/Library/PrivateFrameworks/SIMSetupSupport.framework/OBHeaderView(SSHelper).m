@implementation OBHeaderView(SSHelper)

- (void)addDetailLabel:()SSHelper withErrorCodeSubstr:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
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
  double v22;
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
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BEBD708];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(a1, "_detailFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v12);

  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setColor:toSubstring:", v13, v7);

  objc_msgSend(a1, "addSubview:", v9);
  v14 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "detailLabelConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deactivateConstraints:", v15);

  objc_msgSend(v9, "widthAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v30;
  objc_msgSend(v9, "leftAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v27;
  objc_msgSend(v9, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "headerLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelToDetailPadding");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v19;
  objc_msgSend(v9, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bottomPadding");
  objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, -v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDetailLabelConstraints:", v24);

  v25 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "detailLabelConstraints");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v26);

}

- (uint64_t)_labelToDetailPadding
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "headerLabelToDetailLabelPadding");
  else
    return objc_msgSend(a1, "headerLabelToDetailAndSubtitleLabelPadding");
}

- (void)addDetailLabel:()SSHelper withPhoneNumber:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
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
  double v21;
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
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BEBD708];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setTextAlignment:", 1);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTextColor:", v10);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(a1, "_detailFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v12);

  objc_msgSend(v9, "setNumberOfLines:", 0);
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v9, "setBoldSubString:", v7);
  objc_msgSend(a1, "addSubview:", v9);
  v13 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "detailLabelConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deactivateConstraints:", v14);

  objc_msgSend(v9, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v29;
  objc_msgSend(v9, "leftAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leftAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  objc_msgSend(v9, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "headerLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_labelToDetailPadding");
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v18;
  objc_msgSend(v9, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bottomPadding");
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDetailLabelConstraints:", v23);

  v24 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(a1, "detailLabelConstraints");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activateConstraints:", v25);

}

@end
