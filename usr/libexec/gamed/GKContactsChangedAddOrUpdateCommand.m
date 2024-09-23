@implementation GKContactsChangedAddOrUpdateCommand

- (GKContactsChangedAddOrUpdateCommand)initWithContact:(id)a3 meContactID:(id)a4
{
  id v7;
  id v8;
  GKContactsChangedAddOrUpdateCommand *v9;
  GKContactsChangedAddOrUpdateCommand *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GKContactsChangedAddOrUpdateCommand;
  v9 = -[GKContactsChangedAddOrUpdateCommand init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_meContactID, a4);
  }

  return v10;
}

- (BOOL)isValidContact:(id)a3 meContactID:(id)a4
{
  void *v4;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "contactType"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    if ((objc_msgSend(v9, "isEqualToString:", v7) & 1) != 0)
    {
      v8 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "givenName"));
    v11 = objc_msgSend(v10, "length");
    if (v11)
    {
      v12 = 0;
    }
    else
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "familyName"));
      if (objc_msgSend(v4, "length"))
      {
        v12 = 0;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nickname"));
        if (!objc_msgSend(v16, "length"))
        {

          v8 = 0;
          goto LABEL_13;
        }
        v17 = v16;
        v12 = 1;
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddresses"));
    if (objc_msgSend(v13, "count"))
    {

      v8 = 1;
      if (!v12)
        goto LABEL_12;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumbers"));
      v8 = objc_msgSend(v15, "count") != 0;

      if ((v12 & 1) == 0)
      {
LABEL_12:
        if (v11)
        {
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:

        goto LABEL_14;
      }
    }

    goto LABEL_12;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (id)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedAddOrUpdateCommand contact](self, "contact"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedAddOrUpdateCommand meContactID](self, "meContactID"));
  v7 = -[GKContactsChangedAddOrUpdateCommand isValidContact:meContactID:](self, "isValidContact:meContactID:", v5, v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKContactsChangedAddOrUpdateCommand contact](self, "contact"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkUpdateWithContact:withContext:](GKCDContactInfo, "_gkUpdateWithContact:withContext:", v8, v4));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)meContactID
{
  return self->_meContactID;
}

- (void)setMeContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContactID, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
