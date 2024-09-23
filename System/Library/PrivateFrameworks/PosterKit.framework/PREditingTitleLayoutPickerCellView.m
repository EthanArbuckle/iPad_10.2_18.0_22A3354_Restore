@implementation PREditingTitleLayoutPickerCellView

- (PREditingTitleLayoutPickerCellView)initWithFrame:(CGRect)a3
{
  PREditingTitleLayoutPickerCellView *v3;
  PRIncomingCallTextViewAdapter *v4;
  PRIncomingCallTextViewAdapter *textViewAdapter;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PREditingTitleLayoutPickerCellView;
  v3 = -[PREditingPickerCellView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[PRIncomingCallTextViewAdapter initWithName:]([PRIncomingCallTextViewAdapter alloc], "initWithName:", &stru_1E2186E08);
    textViewAdapter = v3->_textViewAdapter;
    v3->_textViewAdapter = v4;

    -[PRIncomingCallTextViewAdapter viewController](v3->_textViewAdapter, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setUserInteractionEnabled:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PREditingTitleLayoutPickerCellView addSubview:](v3, "addSubview:", v7);
    v17 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v7, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTitleLayoutPickerCellView topAnchor](v3, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 9.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v8;
    objc_msgSend(v7, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTitleLayoutPickerCellView centerXAnchor](v3, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(v7, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingTitleLayoutPickerCellView bottomAnchor](v3, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -9.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

  }
  return v3;
}

- (void)setFont:(id)a3
{
  -[PRIncomingCallTextViewAdapter setEmphasizedNameFont:](self->_textViewAdapter, "setEmphasizedNameFont:", a3);
}

- (void)setLayout:(unint64_t)a3
{
  -[PRIncomingCallTextViewAdapter overrideTitleLayoutWith:](self->_textViewAdapter, "overrideTitleLayoutWith:", a3);
}

- (void)setText:(id)a3
{
  -[PRIncomingCallTextViewAdapter setDisplayNameText:](self->_textViewAdapter, "setDisplayNameText:", a3);
}

- (PRIncomingCallTextViewAdapter)textViewAdapter
{
  return self->_textViewAdapter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewAdapter, 0);
}

@end
