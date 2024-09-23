@implementation UIPrintingMessageView

- (id)initInView:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  UIPrintingMessageView *v8;
  id *p_isa;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  objc_super v33;
  _QWORD v34[2];
  _QWORD v35[2];
  const __CFString *v36;
  id v37;
  const __CFString *v38;
  id v39;
  _QWORD v40[3];
  _QWORD v41[4];

  v41[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bounds");
  v33.receiver = self;
  v33.super_class = (Class)UIPrintingMessageView;
  v8 = -[UIPrintingMessageView initWithFrame:](&v33, sel_initWithFrame_);
  p_isa = (id *)&v8->super.super.super.isa;
  if (v8)
  {
    -[UIPrintingMessageView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    objc_msgSend(p_isa, "setHidden:", 1);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v11 = p_isa[52];
    p_isa[52] = v10;

    objc_msgSend(p_isa[52], "setBackgroundColor:", 0);
    objc_msgSend(p_isa[52], "setOpaque:", 0);
    objc_msgSend(p_isa[52], "setNumberOfLines:", 0);
    objc_msgSend(p_isa[52], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_alloc_init(MEMORY[0x1E0DC33B0]);
    objc_msgSend(v12, "setLineBreakMode:", 0);
    objc_msgSend(v12, "setAlignment:", 1);
    objc_msgSend(v12, "setMinimumLineHeight:", 28.0);
    v13 = objc_alloc(MEMORY[0x1E0CB3498]);
    v40[0] = *MEMORY[0x1E0DC32A0];
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 20.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v14;
    v40[1] = *MEMORY[0x1E0DC32A8];
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = *MEMORY[0x1E0DC32C0];
    v41[1] = v15;
    v41[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v7, v16);
    objc_msgSend(p_isa[52], "setAttributedText:", v17);

    objc_msgSend(p_isa, "addSubview:", p_isa[52]);
    v18 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v19 = p_isa[53];
    p_isa[53] = v18;

    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 17.5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[53], "setFont:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[53], "setTextColor:", v21);

    objc_msgSend(p_isa[53], "setBackgroundColor:", 0);
    objc_msgSend(p_isa[53], "setOpaque:", 0);
    objc_msgSend(p_isa[53], "setTextAlignment:", 1);
    objc_msgSend(p_isa[53], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(p_isa, "addSubview:", p_isa[53]);
    objc_msgSend(v6, "addSubview:", p_isa);
    v22 = (void *)MEMORY[0x1E0CB3718];
    v38 = CFSTR("title");
    v39 = p_isa[52];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[title]-|"), 0, 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "addConstraints:", v24);

    v25 = (void *)MEMORY[0x1E0CB3718];
    v36 = CFSTR("message");
    v37 = p_isa[53];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[message]-|"), 0, 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "addConstraints:", v27);

    v28 = (void *)MEMORY[0x1E0CB3718];
    v34[0] = CFSTR("title");
    v29 = p_isa[52];
    v34[1] = CFSTR("message");
    v35[0] = v29;
    v35[1] = p_isa[53];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-114-[title]-22-[message]"), 0, 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "addConstraints:", v31);

  }
  return p_isa;
}

- (void)setMessage:(id)a3
{
  -[UILabel setText:](self->_message, "setText:", a3);
  -[UIPrintingMessageView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
