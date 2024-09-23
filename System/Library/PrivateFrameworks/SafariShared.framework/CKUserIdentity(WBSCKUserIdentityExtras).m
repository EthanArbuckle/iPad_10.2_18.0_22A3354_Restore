@implementation CKUserIdentity(WBSCKUserIdentityExtras)

- (id)safari_handle
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "lookupInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "emailAddress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "phoneNumber");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)safari_contactIdentifier
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v2 = 0;
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    objc_msgSend(a1, "contactIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      v2 = v4;
    }
    else
    {
      +[WBSContactStoreManager sharedContactStoreManager](WBSContactStoreManager, "sharedContactStoreManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "lookupInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "emailAddress");
      v7 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "lookupInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "phoneNumber");
      v9 = objc_claimAutoreleasedReturnValue();

      if (v7 | v9)
      {
        objc_msgSend(v5, "contactForHandle:error:", v7, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(v5, "contactForHandle:error:", v9, 0);
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        objc_msgSend(v13, "identifier");
        v2 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v2 = 0;
      }

    }
  }
  return v2;
}

@end
