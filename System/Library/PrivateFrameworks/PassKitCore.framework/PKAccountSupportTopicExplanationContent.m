@implementation PKAccountSupportTopicExplanationContent

- (PKAccountSupportTopicExplanationContent)initWithDictionary:(id)a3
{
  id v4;
  PKAccountSupportTopicExplanationContent *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  uint64_t v10;
  NSString *systemImageName;
  PKAccountSupportTopicExplanationContent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountSupportTopicExplanationContent;
  v5 = -[PKAccountSupportTopicExplanationContent init](&v14, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentTitle"));
  v6 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentBody"));
  v8 = objc_claimAutoreleasedReturnValue();
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v8;

  objc_msgSend(v4, "PKStringForKey:", CFSTR("contentSystemImageName"));
  v10 = objc_claimAutoreleasedReturnValue();
  systemImageName = v5->_systemImageName;
  v5->_systemImageName = (NSString *)v10;

  if (v5->_title || v5->_subtitle)
LABEL_4:
    v12 = v5;
  else
    v12 = 0;

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
