@implementation OMTextFieldTableViewCell

- (void)setTextField:(id)a3
{
  id v5;
  id v6;
  void *v7;
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
  id obj;
  _QWORD v33[6];

  v33[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[OMTextFieldTableViewCell textField](self, "textField");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    obj = a3;
    -[OMTextFieldTableViewCell textField](self, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[OMTextFieldTableViewCell textField](self, "textField");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OMTextFieldTableViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v5);

    v23 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v5, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[OMTextFieldTableViewCell contentView](self, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 12.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v27;
    objc_msgSend(v5, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[OMTextFieldTableViewCell contentView](self, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v22, -12.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v21;
    objc_msgSend(v5, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OMTextFieldTableViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safeAreaLayoutGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v10, 20.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v11;
    objc_msgSend(v5, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[OMTextFieldTableViewCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaLayoutGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v15, -20.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v17);

    objc_storeStrong((id *)&self->_textField, obj);
  }

}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
