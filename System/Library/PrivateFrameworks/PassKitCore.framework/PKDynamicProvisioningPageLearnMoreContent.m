@implementation PKDynamicProvisioningPageLearnMoreContent

- (PKDynamicProvisioningPageLearnMoreContent)initWithDictionary:(id)a3
{
  id v4;
  PKDynamicProvisioningPageLearnMoreContent *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *buttonTitle;
  void *v10;
  void *v11;
  NSURL *v12;
  NSURL *buttonURL;
  uint64_t v14;
  NSString *termsIdentifier;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *title;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *subtitle;
  void *v24;
  void *v25;
  NSString *v26;
  NSString *body;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *businessChatButtonTitle;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *businessChatIntentName;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKDynamicProvisioningPageLearnMoreContent;
  v5 = -[PKDynamicProvisioningPageLearnMoreContent init](&v37, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("buttonTitle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("learnMoreButtonTitle"));
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    buttonTitle = v5->_buttonTitle;
    v5->_buttonTitle = v8;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("buttonURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v4, "PKURLForKey:", CFSTR("learnMoreButtonURL"));
      v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    buttonURL = v5->_buttonURL;
    v5->_buttonURL = v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("termsIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("learnMoreTitle"));
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    title = v5->_title;
    v5->_title = v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("subtitle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v22 = v20;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("learnMoreSubtitle"));
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    subtitle = v5->_subtitle;
    v5->_subtitle = v22;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("body"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("learnMoreBody"));
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    body = v5->_body;
    v5->_body = v26;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatButtonTitle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("learnMoreBusinessChatButtonTitle"));
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    businessChatButtonTitle = v5->_businessChatButtonTitle;
    v5->_businessChatButtonTitle = v30;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("businessChatIntentName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      objc_msgSend(v4, "PKStringForKey:", CFSTR("learnMoreBusinessChatIntentName"));
      v34 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    businessChatIntentName = v5->_businessChatIntentName;
    v5->_businessChatIntentName = v34;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDynamicProvisioningPageLearnMoreContent *v5;
  uint64_t v6;
  NSString *buttonTitle;
  uint64_t v8;
  NSURL *buttonURL;
  uint64_t v10;
  NSString *termsIdentifier;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *subtitle;
  uint64_t v16;
  NSString *body;
  uint64_t v18;
  NSString *businessChatButtonTitle;
  uint64_t v20;
  NSString *businessChatIntentName;

  v5 = -[PKDynamicProvisioningPageLearnMoreContent init](+[PKDynamicProvisioningPageLearnMoreContent allocWithZone:](PKDynamicProvisioningPageLearnMoreContent, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_buttonTitle, "copyWithZone:", a3);
  buttonTitle = v5->_buttonTitle;
  v5->_buttonTitle = (NSString *)v6;

  v8 = -[NSURL copyWithZone:](self->_buttonURL, "copyWithZone:", a3);
  buttonURL = v5->_buttonURL;
  v5->_buttonURL = (NSURL *)v8;

  v10 = -[NSString copyWithZone:](self->_termsIdentifier, "copyWithZone:", a3);
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  title = v5->_title;
  v5->_title = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_body, "copyWithZone:", a3);
  body = v5->_body;
  v5->_body = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_businessChatButtonTitle, "copyWithZone:", a3);
  businessChatButtonTitle = v5->_businessChatButtonTitle;
  v5->_businessChatButtonTitle = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_businessChatIntentName, "copyWithZone:", a3);
  businessChatIntentName = v5->_businessChatIntentName;
  v5->_businessChatIntentName = (NSString *)v20;

  return v5;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)buttonURL
{
  return self->_buttonURL;
}

- (void)setButtonURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)businessChatButtonTitle
{
  return self->_businessChatButtonTitle;
}

- (void)setBusinessChatButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)businessChatIntentName
{
  return self->_businessChatIntentName;
}

- (void)setBusinessChatIntentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_buttonURL, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end
