@implementation CNContact(TUAdditions)

- (id)personNameComponents
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(a1, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "givenName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setGivenName:", v4);

  }
  else
  {
    objc_msgSend(v2, "setGivenName:", 0);
  }

  objc_msgSend(a1, "middleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "middleName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setMiddleName:", v6);

  }
  else
  {
    objc_msgSend(v2, "setMiddleName:", 0);
  }

  objc_msgSend(a1, "familyName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(a1, "familyName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFamilyName:", v8);

  }
  else
  {
    objc_msgSend(v2, "setFamilyName:", 0);
  }

  objc_msgSend(a1, "namePrefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(a1, "namePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNamePrefix:", v10);

  }
  else
  {
    objc_msgSend(v2, "setNamePrefix:", 0);
  }

  objc_msgSend(a1, "nameSuffix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(a1, "nameSuffix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNameSuffix:", v12);

  }
  else
  {
    objc_msgSend(v2, "setNameSuffix:", 0);
  }

  objc_msgSend(a1, "nickname");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    objc_msgSend(a1, "nickname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNickname:", v14);

  }
  else
  {
    objc_msgSend(v2, "setNickname:", 0);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(a1, "phoneticGivenName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(a1, "phoneticGivenName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setGivenName:", v17);

  }
  else
  {
    objc_msgSend(v15, "setGivenName:", 0);
  }

  objc_msgSend(a1, "phoneticMiddleName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {
    objc_msgSend(a1, "phoneticMiddleName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMiddleName:", v19);

  }
  else
  {
    objc_msgSend(v15, "setMiddleName:", 0);
  }

  objc_msgSend(a1, "phoneticFamilyName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
  {
    objc_msgSend(a1, "phoneticFamilyName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFamilyName:", v21);

  }
  else
  {
    objc_msgSend(v15, "setFamilyName:", 0);
  }

  objc_msgSend(v2, "setPhoneticRepresentation:", v15);
  return v2;
}

@end
