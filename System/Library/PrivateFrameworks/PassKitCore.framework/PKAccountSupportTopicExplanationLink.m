@implementation PKAccountSupportTopicExplanationLink

- (PKAccountSupportTopicExplanationLink)initWithDictionary:(id)a3
{
  id v4;
  PKAccountSupportTopicExplanationLink *v5;
  uint64_t v6;
  NSString *text;
  void *v8;
  unint64_t v9;
  void *v10;
  PKAccountSupportTopicExplanationLink *v11;
  NSURL *url;
  uint64_t v13;
  NSString *confirmationTitle;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccountSupportTopicExplanationLink;
  v5 = -[PKAccountSupportTopicExplanationLink init](&v16, sel_init);
  if (!v5)
    goto LABEL_10;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("linkTitle"));
  v6 = objc_claimAutoreleasedReturnValue();
  text = v5->_text;
  v5->_text = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("linkAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("openURL")) & 1) != 0)
    v9 = 0;
  else
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("showMerchantDetails"));
  v5->_action = v9;

  if (v5->_action)
  {
LABEL_9:
    objc_msgSend(v4, "PKStringForKey:", CFSTR("linkConfirmationTitle"));
    v13 = objc_claimAutoreleasedReturnValue();
    confirmationTitle = v5->_confirmationTitle;
    v5->_confirmationTitle = (NSString *)v13;

LABEL_10:
    v11 = v5;
    goto LABEL_11;
  }
  objc_msgSend(v4, "PKStringForKey:", CFSTR("linkURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKAccountSupportTopicURLFromActionString(v10);
  v11 = (PKAccountSupportTopicExplanationLink *)objc_claimAutoreleasedReturnValue();

  if (v11
    || (objc_msgSend(v4, "PKURLForKey:", CFSTR("linkURL")),
        (v11 = (PKAccountSupportTopicExplanationLink *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    url = v5->_url;
    v5->_url = (NSURL *)v11;

    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)confirmationTitle
{
  return self->_confirmationTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmationTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
