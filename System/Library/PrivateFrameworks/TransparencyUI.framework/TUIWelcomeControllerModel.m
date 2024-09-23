@implementation TUIWelcomeControllerModel

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("_symbolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_detailText, CFSTR("_detailText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_primaryButton, CFSTR(" _primaryButton"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondaryButton, CFSTR("_secondaryButton"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_helpLinkTitle, CFSTR("_helpLinkTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_helpLinkURL, CFSTR("_helpLinkURL"));

}

- (TUIWelcomeControllerModel)initWithCoder:(id)a3
{
  id v4;
  TUIWelcomeControllerModel *v5;
  uint64_t v6;
  NSString *symbolName;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *detailText;
  uint64_t v12;
  NSString *primaryButton;
  uint64_t v14;
  NSString *secondaryButton;
  uint64_t v16;
  NSString *helpLinkTitle;
  uint64_t v18;
  NSString *helpLinkURL;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUIWelcomeControllerModel;
  v5 = -[TUIWelcomeControllerModel init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_symbolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_detailText"));
    v10 = objc_claimAutoreleasedReturnValue();
    detailText = v5->_detailText;
    v5->_detailText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR(" _primaryButton"));
    v12 = objc_claimAutoreleasedReturnValue();
    primaryButton = v5->_primaryButton;
    v5->_primaryButton = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secondaryButton"));
    v14 = objc_claimAutoreleasedReturnValue();
    secondaryButton = v5->_secondaryButton;
    v5->_secondaryButton = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_helpLinkTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    helpLinkTitle = v5->_helpLinkTitle;
    v5->_helpLinkTitle = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_helpLinkURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    helpLinkURL = v5->_helpLinkURL;
    v5->_helpLinkURL = (NSString *)v18;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TUIWelcomeControllerModel *v4;
  uint64_t v5;
  NSString *symbolName;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *detailText;
  uint64_t v11;
  NSString *primaryButton;
  uint64_t v13;
  NSString *secondaryButton;
  uint64_t v15;
  NSString *helpLinkTitle;
  uint64_t v17;
  NSString *helpLinkURL;

  v4 = objc_alloc_init(TUIWelcomeControllerModel);
  v5 = -[NSString copy](self->_symbolName, "copy");
  symbolName = v4->_symbolName;
  v4->_symbolName = (NSString *)v5;

  v7 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v7;

  v9 = -[NSString copy](self->_detailText, "copy");
  detailText = v4->_detailText;
  v4->_detailText = (NSString *)v9;

  v11 = -[NSString copy](self->_primaryButton, "copy");
  primaryButton = v4->_primaryButton;
  v4->_primaryButton = (NSString *)v11;

  v13 = -[NSString copy](self->_secondaryButton, "copy");
  secondaryButton = v4->_secondaryButton;
  v4->_secondaryButton = (NSString *)v13;

  v15 = -[NSString copy](self->_helpLinkTitle, "copy");
  helpLinkTitle = v4->_helpLinkTitle;
  v4->_helpLinkTitle = (NSString *)v15;

  v17 = -[NSString copy](self->_helpLinkURL, "copy");
  helpLinkURL = v4->_helpLinkURL;
  v4->_helpLinkURL = (NSString *)v17;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TUIWelcomeControllerModel symbolName](self, "symbolName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIWelcomeControllerModel title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIWelcomeControllerModel detailText](self, "detailText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIWelcomeControllerModel primaryButton](self, "primaryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIWelcomeControllerModel secondaryButton](self, "secondaryButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIWelcomeControllerModel helpLinkTitle](self, "helpLinkTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIWelcomeControllerModel helpLinkURL](self, "helpLinkURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("symbolName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)helpLinkTitle
{
  return self->_helpLinkTitle;
}

- (void)setHelpLinkTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)helpLinkURL
{
  return self->_helpLinkURL;
}

- (void)setHelpLinkURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
  objc_storeStrong((id *)&self->_helpLinkTitle, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
