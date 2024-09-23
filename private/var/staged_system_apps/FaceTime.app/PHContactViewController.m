@implementation PHContactViewController

- (id)primaryPropertyKey
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id *v13;
  id v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PHContactViewController;
  v3 = -[PHContactViewController primaryPropertyKey](&v16, "primaryPropertyKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController recentCall](self, "recentCall"));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "handleType");
    if ((unint64_t)v7 < 2)
    {
      v9 = 0;
    }
    else
    {
      if (v7 == (id)2)
      {
        v8 = (id *)&CNContactPhoneNumbersKey;
      }
      else
      {
        if (v7 != (id)3)
          goto LABEL_10;
        v8 = (id *)&CNContactEmailAddressesKey;
      }
      v9 = *v8;
    }

    v4 = v9;
  }
LABEL_10:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController handle](self, "handle"));
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "type");
    if ((unint64_t)v12 < 2)
    {
      v14 = 0;
LABEL_18:

      v4 = v14;
      goto LABEL_19;
    }
    if (v12 == (id)2)
    {
      v13 = (id *)&CNContactPhoneNumbersKey;
      goto LABEL_17;
    }
    if (v12 == (id)3)
    {
      v13 = (id *)&CNContactEmailAddressesKey;
LABEL_17:
      v14 = *v13;
      goto LABEL_18;
    }
  }
LABEL_19:

  return v4;
}

- (void)setRecentCall:(id)a3
{
  CHRecentCall *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  NSString *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  CHRecentCall *v18;

  v5 = (CHRecentCall *)a3;
  if (self->_recentCall != v5)
  {
    v18 = v5;
    objc_storeStrong((id *)&self->_recentCall, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall callerId](v18, "callerId"));
    if (!objc_msgSend(v6, "length"))
    {
LABEL_13:

      v5 = v18;
      goto LABEL_14;
    }
    v7 = -[CHRecentCall handleType](v18, "handleType");
    if (v7 == (id)3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController contact](self, "contact"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "labeledValueForEmailAddress:", v6));

      v10 = (id *)&CNContactEmailAddressesKey;
    }
    else
    {
      if (v7 == (id)2)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall isoCountryCode](v18, "isoCountryCode"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithDigits:countryCode:](CNPhoneNumber, "phoneNumberWithDigits:countryCode:", v6, v15));

        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController contact](self, "contact"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "labeledValueForPhoneNumber:", v16));

          v11 = CNContactPhoneNumbersKey;
        }
        else
        {
          v11 = 0;
          v9 = 0;
        }

        if (!v9)
          goto LABEL_12;
        goto LABEL_11;
      }
      if (v7 != (id)1 || !v6)
      {
        v9 = 0;
        v11 = 0;
        goto LABEL_12;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController contact](self, "contact"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "labeledValueForSocialProfileWithUsername:", v6));

      v10 = (id *)&CNContactSocialProfilesKey;
    }
    v11 = (NSString *)*v10;
    if (v9)
    {
LABEL_11:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v14 = -[CHRecentCall callStatus](v18, "callStatus");
      -[PHContactViewController highlightPropertyWithKey:identifier:important:](self, "highlightPropertyWithKey:identifier:important:", v11, v13, v14 == kCHCallStatusMissed);

    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:

}

- (void)setHandle:(id)a3
{
  CHHandle *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  CHHandle *v17;

  v5 = (CHHandle *)a3;
  if (self->_handle != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->_handle, a3);
    v6 = -[CHHandle type](v17, "type");
    if (v6 == (id)3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController contact](self, "contact"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](v17, "value"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "labeledValueForEmailAddress:", v12));

      v13 = CNContactEmailAddressesKey;
      if (!v9)
        goto LABEL_16;
      goto LABEL_15;
    }
    if (v6 == (id)2)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](v17, "value"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v14));

      if (v7)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController contact](self, "contact"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "labeledValueForPhoneNumber:", v7));

        v10 = (id *)&CNContactPhoneNumbersKey;
        goto LABEL_11;
      }
    }
    else
    {
      if (v6 != (id)1)
      {
        v9 = 0;
        v13 = 0;
        goto LABEL_16;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHHandle value](v17, "value"));
      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHContactViewController contact](self, "contact"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "labeledValueForSocialProfileWithUsername:", v7));

        v10 = (id *)&CNContactSocialProfilesKey;
LABEL_11:
        v13 = (NSString *)*v10;
        goto LABEL_14;
      }
    }
    v13 = 0;
    v9 = 0;
LABEL_14:

    if (v9)
    {
LABEL_15:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      -[PHContactViewController highlightPropertyWithKey:identifier:important:](self, "highlightPropertyWithKey:identifier:important:", v13, v16, 0);

    }
LABEL_16:

    v5 = v17;
  }

}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (CHHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end
