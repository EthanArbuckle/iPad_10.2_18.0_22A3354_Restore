@implementation PKAccountPostProvisioningContent

- (PKAccountPostProvisioningContent)initWithDictionary:(id)a3
{
  id v4;
  PKAccountPostProvisioningContent *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *subTitle;
  uint64_t v12;
  NSString *body;
  uint64_t v14;
  NSString *primaryButtonTitle;
  uint64_t v16;
  NSString *secondaryButtonTitle;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountPostProvisioningContent;
  v5 = -[PKAccountPostProvisioningContent init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("makeDefaultCard")))
    {
      v7 = 1;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("applePayEducation")))
    {
      v7 = 2;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("orderPhysicalCard")))
      {
        v5->_type = 0;
        goto LABEL_9;
      }
      v7 = 3;
    }
    v5->_type = v7;
LABEL_9:
    objc_msgSend(v4, "PKStringForKey:", CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("subTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    subTitle = v5->_subTitle;
    v5->_subTitle = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("body"));
    v12 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("primaryButtonTitle"));
    v14 = objc_claimAutoreleasedReturnValue();
    primaryButtonTitle = v5->_primaryButtonTitle;
    v5->_primaryButtonTitle = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("secondaryButtonTitle"));
    v16 = objc_claimAutoreleasedReturnValue();
    secondaryButtonTitle = v5->_secondaryButtonTitle;
    v5->_secondaryButtonTitle = (NSString *)v16;

  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)primaryButtonTitle
{
  return self->_primaryButtonTitle;
}

- (NSString)secondaryButtonTitle
{
  return self->_secondaryButtonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_primaryButtonTitle, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
