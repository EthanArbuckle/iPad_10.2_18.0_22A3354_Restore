@implementation PUIStyleTitleLayoutPickerButton

- (PUIStyleTitleLayoutPickerButton)initWithFrame:(CGRect)a3
{
  PUIStyleTitleLayoutPickerButton *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  PUIIncomingCallTextViewAdapter *textViewAdapter;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)PUIStyleTitleLayoutPickerButton;
  v3 = -[PUIStylePickerButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2050000000;
    v4 = (void *)getPRIncomingCallTextViewAdapterWrapperClass_softClass;
    v27 = getPRIncomingCallTextViewAdapterWrapperClass_softClass;
    if (!getPRIncomingCallTextViewAdapterWrapperClass_softClass)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke;
      v23[3] = &unk_25154B958;
      v23[4] = &v24;
      __getPRIncomingCallTextViewAdapterWrapperClass_block_invoke((uint64_t)v23);
      v4 = (void *)v25[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v24, 8);
    v6 = objc_msgSend([v5 alloc], "initWithName:", &stru_25154D128);
    textViewAdapter = v3->_textViewAdapter;
    v3->_textViewAdapter = (PUIIncomingCallTextViewAdapter *)v6;

    -[PUIIncomingCallTextViewAdapter viewController](v3->_textViewAdapter, "viewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setUserInteractionEnabled:", 0);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUIStyleTitleLayoutPickerButton addSubview:](v3, "addSubview:", v9);
    v19 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v9, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleTitleLayoutPickerButton topAnchor](v3, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 9.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    objc_msgSend(v9, "centerXAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleTitleLayoutPickerButton centerXAnchor](v3, "centerXAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    objc_msgSend(v9, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIStyleTitleLayoutPickerButton bottomAnchor](v3, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, -9.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v17);

  }
  return v3;
}

- (void)setFont:(id)a3
{
  -[PUIIncomingCallTextViewAdapter setEmphasizedNameFont:](self->_textViewAdapter, "setEmphasizedNameFont:", a3);
}

- (void)setLayout:(unint64_t)a3
{
  -[PUIIncomingCallTextViewAdapter overrideTitleLayoutWith:](self->_textViewAdapter, "overrideTitleLayoutWith:", a3);
}

- (void)setText:(id)a3
{
  -[PUIIncomingCallTextViewAdapter setDisplayNameText:](self->_textViewAdapter, "setDisplayNameText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewAdapter, 0);
}

@end
