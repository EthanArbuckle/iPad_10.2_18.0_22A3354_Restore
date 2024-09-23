@implementation RTTUIRecentMessageCell

- (int64_t)selectionStyle
{
  return 0;
}

- (void)configureWithUtterance:(id)a3 needsPrefix:(BOOL)a4 otherContactDisplayName:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
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
  id v83;
  id v84;
  _BOOL4 v85;
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[10];

  v6 = a4;
  v88[8] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v84 = a5;
  -[RTTUIRecentMessageCell label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v85 = v6;
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDF6FC8]);
    v11 = (void *)MEMORY[0x24BDF6F88];
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "effectForBlurEffect:style:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithEffect:", v13);

    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (void *)objc_opt_new();
    -[RTTUIRecentMessageCell setLabel:](self, "setLabel:", v15);

    -[RTTUIRecentMessageCell label](self, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumberOfLines:", 0);

    -[RTTUIRecentMessageCell label](self, "label");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAdjustsFontForContentSizeCategory:", 1);

    -[RTTUIRecentMessageCell label](self, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[RTTUIRecentMessageCell contentView](self, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v14);

    objc_msgSend(v14, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIRecentMessageCell label](self, "label");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v21);

    v66 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIRecentMessageCell contentView](self, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v80);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = v79;
    objc_msgSend(v14, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIRecentMessageCell contentView](self, "contentView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "topAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:", v76);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v88[1] = v75;
    objc_msgSend(v14, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIRecentMessageCell contentView](self, "contentView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "constraintEqualToAnchor:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v88[2] = v71;
    objc_msgSend(v14, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIRecentMessageCell contentView](self, "contentView");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v88[3] = v67;
    -[RTTUIRecentMessageCell label](self, "label");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v62);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v88[4] = v61;
    -[RTTUIRecentMessageCell label](self, "label");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "topAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v88[5] = v56;
    -[RTTUIRecentMessageCell label](self, "label");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v88[6] = v23;
    -[RTTUIRecentMessageCell label](self, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v83 = v8;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v88[7] = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v88, 8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "activateConstraints:", v29);

    v8 = v83;
    v6 = v85;

  }
  objc_msgSend(MEMORY[0x24BDF6858], "clearConfiguration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIRecentMessageCell setBackgroundConfiguration:](self, "setBackgroundConfiguration:", v30);

  if ((objc_msgSend(v8, "isMe") & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "_preferredFontForTextStyle:weight:", v32, *MEMORY[0x24BDF7890]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isTranscription"))
  {
    objc_msgSend(v33, "fontDescriptor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "fontDescriptorWithSymbolicTraits:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(v33, "pointSize");
    objc_msgSend(v38, "fontWithDescriptor:size:", v37);
    v39 = objc_claimAutoreleasedReturnValue();

    v33 = (void *)v39;
  }
  if (v6)
  {
    if (objc_msgSend(v8, "isMe"))
    {
      ttyLocString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v41;
    }
    else
    {
      ttyLocString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "text");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v84;
    }
    AXCFormattedString();
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "text", v52);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v43, "rangeOfString:", v44);

    if (v45 == 0x7FFFFFFFFFFFFFFFLL)
      v42 = 0;
    else
      v42 = v45;
    v35 = v43;
  }
  else
  {
    v42 = 0;
  }
  v46 = objc_alloc(MEMORY[0x24BDD1688]);
  v47 = *MEMORY[0x24BDF65F8];
  v48 = *MEMORY[0x24BDF6600];
  v86[0] = *MEMORY[0x24BDF65F8];
  v86[1] = v48;
  v87[0] = v33;
  v87[1] = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v46, "initWithString:attributes:", v35, v49);

  if (v85 && v42)
    objc_msgSend(v50, "addAttribute:value:range:", v47, v34, 0, v42);
  -[RTTUIRecentMessageCell label](self, "label");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAttributedText:", v50);

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
}

@end
