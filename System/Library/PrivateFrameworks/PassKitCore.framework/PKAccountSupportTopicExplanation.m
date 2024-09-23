@implementation PKAccountSupportTopicExplanation

- (PKAccountSupportTopicExplanation)initWithDictionary:(id)a3
{
  id v4;
  PKAccountSupportTopicExplanation *v5;
  uint64_t v6;
  NSString *headerTitle;
  uint64_t v8;
  NSString *headerSubtitle;
  uint64_t v10;
  NSString *primaryActionTitle;
  uint64_t v12;
  NSString *secondaryActionTitle;
  PKAccountSupportTopicExplanationContent *v14;
  PKAccountSupportTopicExplanationContent *content;
  PKAccountSupportTopicExplanationLink *v16;
  PKAccountSupportTopicExplanationLink *link;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountSupportTopicExplanation;
  v5 = -[PKAccountSupportTopicExplanation init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("headerTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    headerTitle = v5->_headerTitle;
    v5->_headerTitle = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("headerSubtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    headerSubtitle = v5->_headerSubtitle;
    v5->_headerSubtitle = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryActionTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    primaryActionTitle = v5->_primaryActionTitle;
    v5->_primaryActionTitle = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("secondaryActionTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    secondaryActionTitle = v5->_secondaryActionTitle;
    v5->_secondaryActionTitle = (NSString *)v12;

    v14 = -[PKAccountSupportTopicExplanationContent initWithDictionary:]([PKAccountSupportTopicExplanationContent alloc], "initWithDictionary:", v4);
    content = v5->_content;
    v5->_content = v14;

    v16 = -[PKAccountSupportTopicExplanationLink initWithDictionary:]([PKAccountSupportTopicExplanationLink alloc], "initWithDictionary:", v4);
    link = v5->_link;
    v5->_link = v16;

  }
  return v5;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (NSString)primaryActionTitle
{
  return self->_primaryActionTitle;
}

- (NSString)secondaryActionTitle
{
  return self->_secondaryActionTitle;
}

- (PKAccountSupportTopicExplanationContent)content
{
  return self->_content;
}

- (PKAccountSupportTopicExplanationLink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_secondaryActionTitle, 0);
  objc_storeStrong((id *)&self->_primaryActionTitle, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end
