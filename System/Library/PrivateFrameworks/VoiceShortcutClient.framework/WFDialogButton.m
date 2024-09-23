@implementation WFDialogButton

- (WFDialogButton)initWithIdentifier:(id)a3 title:(id)a4 style:(int64_t)a5
{
  id v8;
  id v9;
  WFDialogButton *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *title;
  WFDialogButton *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFDialogButton;
  v10 = -[WFDialogButton init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v10->_style = a5;
    v15 = v10;
  }

  return v10;
}

- (WFDialogButton)initWithTitle:(id)a3 style:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WFDialogButton *v10;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a3;
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFDialogButton initWithIdentifier:title:style:](self, "initWithIdentifier:title:style:", v9, v7, a4);

  return v10;
}

- (WFDialogButton)initWithCoder:(id)a3
{
  id v4;
  WFDialogButton *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *title;
  WFDialogButton *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFDialogButton;
  v5 = -[WFDialogButton init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFDialogButton identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[WFDialogButton title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("title"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[WFDialogButton style](self, "style"), CFSTR("style"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)defaultButtonWithTitle:(id)a3
{
  id v3;
  WFDialogButton *v4;

  v3 = a3;
  v4 = -[WFDialogButton initWithTitle:style:]([WFDialogButton alloc], "initWithTitle:style:", v3, 0);

  return v4;
}

+ (id)doneButton
{
  WFDialogButton *v2;
  void *v3;
  WFDialogButton *v4;

  v2 = [WFDialogButton alloc];
  WFLocalizedString(CFSTR("Done"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFDialogButton initWithTitle:style:](v2, "initWithTitle:style:", v3, 0);

  return v4;
}

+ (id)startButton
{
  WFDialogButton *v2;
  void *v3;
  WFDialogButton *v4;

  v2 = [WFDialogButton alloc];
  WFLocalizedString(CFSTR("Start"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFDialogButton initWithTitle:style:](v2, "initWithTitle:style:", v3, 0);

  return v4;
}

+ (id)okButton
{
  WFDialogButton *v2;
  void *v3;
  WFDialogButton *v4;

  v2 = [WFDialogButton alloc];
  WFLocalizedString(CFSTR("OK"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFDialogButton initWithTitle:style:](v2, "initWithTitle:style:", v3, 0);

  return v4;
}

+ (id)selectButton
{
  WFDialogButton *v2;
  void *v3;
  WFDialogButton *v4;

  v2 = [WFDialogButton alloc];
  WFLocalizedString(CFSTR("Select"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFDialogButton initWithTitle:style:](v2, "initWithTitle:style:", v3, 0);

  return v4;
}

+ (id)cancelButton
{
  WFDialogButton *v2;
  void *v3;
  WFDialogButton *v4;

  v2 = [WFDialogButton alloc];
  WFLocalizedString(CFSTR("Cancel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WFDialogButton initWithTitle:style:](v2, "initWithTitle:style:", v3, 1);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
