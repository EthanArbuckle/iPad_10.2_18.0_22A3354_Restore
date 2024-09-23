@implementation ICQInternetPrivacyBannerModel

- (ICQInternetPrivacyBannerModel)initWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 status:(unint64_t)a6 networkName:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ICQInternetPrivacyBannerModel *v17;
  ICQInternetPrivacyBannerModel *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ICQInternetPrivacyBannerModel;
  v17 = -[ICQInternetPrivacyBannerModel init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_message, a4);
    objc_storeStrong((id *)&v18->_buttonTitle, a5);
    v18->_status = a6;
    objc_storeStrong((id *)&v18->_networkName, a7);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ICQInternetPrivacyBannerModel buttonTitle](self, "buttonTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[ICQInternetPrivacyBannerModel buttonTitle](self, "buttonTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "buttonTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      objc_msgSend(v5, "buttonTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7 == 0;
    }

    -[ICQInternetPrivacyBannerModel networkName](self, "networkName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICQInternetPrivacyBannerModel networkName](self, "networkName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "networkName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      objc_msgSend(v5, "networkName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v12 == 0;
    }

    if ((v9 & v14) == 1)
    {
      -[ICQInternetPrivacyBannerModel title](self, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "title");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", v16))
      {
        -[ICQInternetPrivacyBannerModel message](self, "message");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "message");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqualToString:", v18))
        {
          v19 = -[ICQInternetPrivacyBannerModel status](self, "status");
          v10 = v19 == objc_msgSend(v5, "status");
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
