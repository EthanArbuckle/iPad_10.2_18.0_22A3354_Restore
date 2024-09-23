@implementation CNMutableContact(PKAdditions)

- (void)populateNamesFromComponents:()PKAdditions
{
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
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v16, "givenName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setGivenName:", v5);

  }
  objc_msgSend(v16, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v16, "familyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setFamilyName:", v7);

  }
  objc_msgSend(v16, "phoneticRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v16, "phoneticRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPhoneticGivenName:", v11);

  }
  objc_msgSend(v16, "phoneticRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v16, "phoneticRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "familyName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setPhoneticFamilyName:", v15);

  }
}

@end
