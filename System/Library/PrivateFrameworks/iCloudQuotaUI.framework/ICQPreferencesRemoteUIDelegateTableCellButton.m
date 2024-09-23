@implementation ICQPreferencesRemoteUIDelegateTableCellButton

- (ICQPreferencesRemoteUIDelegateTableCellButton)initWithName:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  id v9;
  ICQPreferencesRemoteUIDelegateTableCellButton *v10;
  uint64_t v11;
  UIButton *button;
  UIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ICQPreferencesRemoteUIDelegateTableCellButton;
  v10 = -[ICQPreferencesRemoteUIDelegateTableCellButton initWithFrame:](&v21, sel_initWithFrame_, 0.0, 0.0, 0.0, 70.0);
  if (v10)
  {
    +[ICQPreferencesRemoteUIDelegateBorderedButton buttonWithType:](ICQPreferencesRemoteUIDelegateBorderedButton, "buttonWithType:", 1);
    v11 = objc_claimAutoreleasedReturnValue();
    button = v10->_button;
    v10->_button = (UIButton *)v11;

    -[UIButton setFrame:](v10->_button, "setFrame:", 0.0, 26.0, 0.0, 44.0);
    -[UIButton addTarget:action:forControlEvents:](v10->_button, "addTarget:action:forControlEvents:", v9, a5, 64);
    -[UIButton setTitle:forState:](v10->_button, "setTitle:forState:", v8, 0);
    v13 = v10->_button;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 0);

    -[UIButton setAutoresizingMask:](v10->_button, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](v10->_button, "setBackgroundColor:", v15);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v10->_button, "titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    -[UIButton titleLabel](v10->_button, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextAlignment:", 1);

    -[ICQPreferencesRemoteUIDelegateTableCellButton addSubview:](v10, "addSubview:", v10->_button);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPreferencesRemoteUIDelegateTableCellButton setBackgroundColor:](v10, "setBackgroundColor:", v19);

    -[ICQPreferencesRemoteUIDelegateTableCellButton setAutoresizingMask:](v10, "setAutoresizingMask:", 2);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
