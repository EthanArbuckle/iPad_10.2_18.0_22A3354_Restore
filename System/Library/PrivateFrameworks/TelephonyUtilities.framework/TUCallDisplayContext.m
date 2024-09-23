@implementation TUCallDisplayContext

- (TUCallDisplayContext)init
{
  TUCallDisplayContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUCallDisplayContext;
  result = -[TUCallDisplayContext init](&v3, sel_init);
  if (result)
    result->_legacyAddressBookIdentifier = -1;
  return result;
}

- (NSString)contactIdentifier
{
  void *v2;
  void *v3;

  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v4);

  if ((v7 & 1) == 0)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setContactIdentifiers:](self, "setContactIdentifiers:", v8);

  }
}

- (NSString)name
{
  NSString *name;
  void *v4;
  NSString *v5;
  NSString *v6;

  name = self->_name;
  if (!name)
  {
    TUBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_name;
    self->_name = v5;

    name = self->_name;
  }
  return name;
}

- (NSString)label
{
  NSString *label;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;

  label = self->_label;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByTrimmingCharactersInSet:](label, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    v7 = self->_label;
    self->_label = 0;

  }
  return self->_label;
}

- (NSString)firstName
{
  void *v2;
  void *v3;

  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "givenName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setFirstName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0CB3850]);
      -[TUCallDisplayContext setPersonNameComponents:](self, "setPersonNameComponents:", v5);

    }
  }
  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGivenName:", v7);

}

- (id)displayContextByMergingWithDisplayContext:(id)a3
{
  id v4;
  TUCallDisplayContext *v5;
  void *v6;

  v4 = a3;
  if (-[TUCallDisplayContext isEqual:](self, "isEqual:", v4))
  {
    v5 = self;
  }
  else
  {
    v6 = (void *)-[TUCallDisplayContext mutableCopy](self, "mutableCopy");
    objc_msgSend(v6, "mergeValuesFromDisplayContext:", v4);
    v5 = (TUCallDisplayContext *)objc_msgSend(v6, "copy");

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  int v28;
  BOOL v29;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TUCallDisplayContext name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v7))
    {
      -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "personNameComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9))
      {
        -[TUCallDisplayContext suggestedName](self, "suggestedName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "suggestedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUStringsAreEqualOrNil((unint64_t)v10, (uint64_t)v11))
        {
          -[TUCallDisplayContext label](self, "label");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "label");
          v13 = objc_claimAutoreleasedReturnValue();
          v54 = (void *)v12;
          v14 = v12;
          v15 = (void *)v13;
          if (TUStringsAreEqualOrNil(v14, v13))
          {
            v53 = v15;
            -[TUCallDisplayContext companyName](self, "companyName");
            v16 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "companyName");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)v16;
            if (TUStringsAreEqualOrNil(v16, (uint64_t)v51))
            {
              -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
              v17 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "companyDepartment");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = (void *)v17;
              if (TUStringsAreEqualOrNil(v17, (uint64_t)v49))
              {
                -[TUCallDisplayContext contactName](self, "contactName");
                v18 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "contactName");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (void *)v18;
                if (TUStringsAreEqualOrNil(v18, (uint64_t)v47))
                {
                  -[TUCallDisplayContext contactLabel](self, "contactLabel");
                  v19 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "contactLabel");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = (void *)v19;
                  if (TUStringsAreEqualOrNil(v19, (uint64_t)v45))
                  {
                    -[TUCallDisplayContext mapName](self, "mapName");
                    v20 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v5, "mapName");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = (void *)v20;
                    v21 = TUStringsAreEqualOrNil(v20, (uint64_t)v43);
                    v15 = v53;
                    if (v21)
                    {
                      -[TUCallDisplayContext location](self, "location");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "location");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      if (TUStringsAreEqualOrNil((unint64_t)v42, (uint64_t)v41))
                      {
                        -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
                        v40 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v5, "callDirectoryLabel");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        if (TUStringsAreEqualOrNil((unint64_t)v40, (uint64_t)v39))
                        {
                          -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v5, "callDirectoryLocalizedExtensionContainingAppName");
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          if (TUStringsAreEqualOrNil((unint64_t)v38, (uint64_t)v37))
                          {
                            -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
                            v22 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v5, "callDirectoryExtensionIdentifier");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            v36 = (void *)v22;
                            if (TUStringsAreEqualOrNil(v22, (uint64_t)v35))
                            {
                              -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
                              v23 = objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v5, "contactIdentifiers");
                              v33 = (void *)objc_claimAutoreleasedReturnValue();
                              v34 = (void *)v23;
                              if (TUObjectsAreEqualOrNil(v23, (uint64_t)v33))
                              {
                                -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
                                v24 = objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v5, "companyLogoURL");
                                v25 = objc_claimAutoreleasedReturnValue();
                                v32 = (void *)v24;
                                v26 = v24;
                                v27 = (void *)v25;
                                if (TUObjectsAreEqualOrNil(v26, v25)
                                  && (v31 = -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"), v31 == objc_msgSend(v5, "callDirectoryIdentityType")))
                                {
                                  v28 = -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier");
                                  v29 = v28 == objc_msgSend(v5, "legacyAddressBookIdentifier");
                                }
                                else
                                {
                                  v29 = 0;
                                }

                              }
                              else
                              {
                                v29 = 0;
                              }

                            }
                            else
                            {
                              v29 = 0;
                            }

                            v15 = v53;
                          }
                          else
                          {
                            v29 = 0;
                          }

                        }
                        else
                        {
                          v29 = 0;
                        }

                      }
                      else
                      {
                        v29 = 0;
                      }

                    }
                    else
                    {
                      v29 = 0;
                    }

                  }
                  else
                  {
                    v29 = 0;
                    v15 = v53;
                  }

                }
                else
                {
                  v29 = 0;
                  v15 = v53;
                }

              }
              else
              {
                v29 = 0;
                v15 = v53;
              }

            }
            else
            {
              v29 = 0;
              v15 = v53;
            }

          }
          else
          {
            v29 = 0;
          }

        }
        else
        {
          v29 = 0;
        }

      }
      else
      {
        v29 = 0;
      }

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  -[TUCallDisplayContext name](self, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v35, "hash");
  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v34, "hash") ^ v3;
  -[TUCallDisplayContext suggestedName](self, "suggestedName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v33, "hash");
  -[TUCallDisplayContext label](self, "label");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ v5 ^ objc_msgSend(v32, "hash");
  -[TUCallDisplayContext companyName](self, "companyName");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v31, "hash");
  -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 ^ objc_msgSend(v30, "hash");
  -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v8 ^ objc_msgSend(v29, "hash");
  -[TUCallDisplayContext contactName](self, "contactName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v28, "hash");
  -[TUCallDisplayContext contactLabel](self, "contactLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");
  -[TUCallDisplayContext mapName](self, "mapName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  -[TUCallDisplayContext location](self, "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9 ^ v14 ^ objc_msgSend(v15, "hash");
  -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");
  -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v18 ^ objc_msgSend(v19, "hash");
  -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20 ^ objc_msgSend(v21, "hash");
  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22 ^ objc_msgSend(v23, "hash");
  v25 = v16 ^ v24 ^ -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType");
  v26 = v25 ^ -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier");

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TUCallDisplayContext name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPersonNameComponents:", v6);

  -[TUCallDisplayContext suggestedName](self, "suggestedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuggestedName:", v7);

  -[TUCallDisplayContext label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v8);

  -[TUCallDisplayContext companyName](self, "companyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompanyName:", v9);

  -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompanyDepartment:", v10);

  -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompanyLogoURL:", v11);

  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactIdentifiers:", v12);

  -[TUCallDisplayContext contactName](self, "contactName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactName:", v13);

  -[TUCallDisplayContext contactLabel](self, "contactLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactLabel:", v14);

  -[TUCallDisplayContext mapName](self, "mapName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMapName:", v15);

  -[TUCallDisplayContext location](self, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocation:", v16);

  -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallDirectoryLabel:", v17);

  -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallDirectoryLocalizedExtensionContainingAppName:", v18);

  -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCallDirectoryExtensionIdentifier:", v19);

  objc_msgSend(v4, "setCallDirectoryIdentityType:", -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"));
  objc_msgSend(v4, "setLegacyAddressBookIdentifier:", -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier"));
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TUMutableCallDisplayContext *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = -[TUCallDisplayContext init](+[TUMutableCallDisplayContext allocWithZone:](TUMutableCallDisplayContext, "allocWithZone:", a3), "init");
  -[TUCallDisplayContext name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setName:](v4, "setName:", v5);

  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setPersonNameComponents:](v4, "setPersonNameComponents:", v6);

  -[TUCallDisplayContext suggestedName](self, "suggestedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setSuggestedName:](v4, "setSuggestedName:", v7);

  -[TUCallDisplayContext label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setLabel:](v4, "setLabel:", v8);

  -[TUCallDisplayContext companyName](self, "companyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCompanyName:](v4, "setCompanyName:", v9);

  -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCompanyDepartment:](v4, "setCompanyDepartment:", v10);

  -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCompanyLogoURL:](v4, "setCompanyLogoURL:", v11);

  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactIdentifiers:](v4, "setContactIdentifiers:", v12);

  -[TUCallDisplayContext contactName](self, "contactName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactName:](v4, "setContactName:", v13);

  -[TUCallDisplayContext contactLabel](self, "contactLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setContactLabel:](v4, "setContactLabel:", v14);

  -[TUCallDisplayContext mapName](self, "mapName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setMapName:](v4, "setMapName:", v15);

  -[TUCallDisplayContext location](self, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setLocation:](v4, "setLocation:", v16);

  -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCallDirectoryLabel:](v4, "setCallDirectoryLabel:", v17);

  -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCallDirectoryLocalizedExtensionContainingAppName:](v4, "setCallDirectoryLocalizedExtensionContainingAppName:", v18);

  -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setCallDirectoryExtensionIdentifier:](v4, "setCallDirectoryExtensionIdentifier:", v19);

  -[TUCallDisplayContext setCallDirectoryIdentityType:](v4, "setCallDirectoryIdentityType:", -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType"));
  -[TUCallDisplayContext setLegacyAddressBookIdentifier:](v4, "setLegacyAddressBookIdentifier:", -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCallDisplayContext)initWithCoder:(id)a3
{
  id v4;
  TUCallDisplayContext *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSPersonNameComponents *personNameComponents;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *suggestedName;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *label;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSString *companyName;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSString *companyDepartment;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSURL *companyLogoURL;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSString *contactName;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSString *contactLabel;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  NSString *mapName;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSString *location;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  NSString *callDirectoryLabel;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSString *callDirectoryLocalizedExtensionContainingAppName;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  NSString *callDirectoryExtensionIdentifier;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSArray *contactIdentifiers;
  void *v68;
  void *v69;
  objc_super v71;

  v4 = a3;
  v71.receiver = self;
  v71.super_class = (Class)TUCallDisplayContext;
  v5 = -[TUCallDisplayContext init](&v71, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_personNameComponents);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    personNameComponents = v5->_personNameComponents;
    v5->_personNameComponents = (NSPersonNameComponents *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_suggestedName);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    suggestedName = v5->_suggestedName;
    v5->_suggestedName = (NSString *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_label);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_companyName);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_companyDepartment);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    companyDepartment = v5->_companyDepartment;
    v5->_companyDepartment = (NSString *)v28;

    v30 = objc_opt_class();
    NSStringFromSelector(sel_companyLogoURL);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    companyLogoURL = v5->_companyLogoURL;
    v5->_companyLogoURL = (NSURL *)v32;

    v34 = objc_opt_class();
    NSStringFromSelector(sel_contactName);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    contactName = v5->_contactName;
    v5->_contactName = (NSString *)v36;

    v38 = objc_opt_class();
    NSStringFromSelector(sel_contactLabel);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, v39);
    v40 = objc_claimAutoreleasedReturnValue();
    contactLabel = v5->_contactLabel;
    v5->_contactLabel = (NSString *)v40;

    v42 = objc_opt_class();
    NSStringFromSelector(sel_mapName);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v42, v43);
    v44 = objc_claimAutoreleasedReturnValue();
    mapName = v5->_mapName;
    v5->_mapName = (NSString *)v44;

    v46 = objc_opt_class();
    NSStringFromSelector(sel_location);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (NSString *)v48;

    v50 = objc_opt_class();
    NSStringFromSelector(sel_callDirectoryLabel);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v50, v51);
    v52 = objc_claimAutoreleasedReturnValue();
    callDirectoryLabel = v5->_callDirectoryLabel;
    v5->_callDirectoryLabel = (NSString *)v52;

    v54 = objc_opt_class();
    NSStringFromSelector(sel_callDirectoryLocalizedExtensionContainingAppName);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v54, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    callDirectoryLocalizedExtensionContainingAppName = v5->_callDirectoryLocalizedExtensionContainingAppName;
    v5->_callDirectoryLocalizedExtensionContainingAppName = (NSString *)v56;

    v58 = objc_opt_class();
    NSStringFromSelector(sel_callDirectoryExtensionIdentifier);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v58, v59);
    v60 = objc_claimAutoreleasedReturnValue();
    callDirectoryExtensionIdentifier = v5->_callDirectoryExtensionIdentifier;
    v5->_callDirectoryExtensionIdentifier = (NSString *)v60;

    v62 = (void *)MEMORY[0x1E0C99E60];
    v63 = objc_opt_class();
    objc_msgSend(v62, "setWithObjects:", v63, objc_opt_class(), 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_contactIdentifiers);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v64, v65);
    v66 = objc_claimAutoreleasedReturnValue();
    contactIdentifiers = v5->_contactIdentifiers;
    v5->_contactIdentifiers = (NSArray *)v66;

    NSStringFromSelector(sel_callDirectoryIdentityType);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_callDirectoryIdentityType = objc_msgSend(v4, "decodeIntegerForKey:", v68);

    NSStringFromSelector(sel_legacyAddressBookIdentifier);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_legacyAddressBookIdentifier = objc_msgSend(v4, "decodeInt32ForKey:", v69);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v35;
  void *v36;
  uint64_t v37;
  id v38;

  v4 = a3;
  -[TUCallDisplayContext name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_name);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_personNameComponents);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUCallDisplayContext suggestedName](self, "suggestedName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_suggestedName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[TUCallDisplayContext label](self, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_label);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[TUCallDisplayContext companyName](self, "companyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companyName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companyDepartment);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companyLogoURL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  -[TUCallDisplayContext contactName](self, "contactName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactName);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  -[TUCallDisplayContext contactLabel](self, "contactLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactLabel);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[TUCallDisplayContext mapName](self, "mapName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mapName);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[TUCallDisplayContext location](self, "location");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_location);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callDirectoryLabel);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callDirectoryLocalizedExtensionContainingAppName);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_callDirectoryExtensionIdentifier);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, v32);

  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contactIdentifiers);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, v34);

  v35 = -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType");
  NSStringFromSelector(sel_callDirectoryIdentityType);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v35, v36);

  v37 = -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier");
  NSStringFromSelector(sel_legacyAddressBookIdentifier);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v37, v38);

}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSPersonNameComponents)personNameComponents
{
  return self->_personNameComponents;
}

- (void)setPersonNameComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)companyDepartment
{
  return self->_companyDepartment;
}

- (void)setCompanyDepartment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSURL)companyLogoURL
{
  return self->_companyLogoURL;
}

- (void)setCompanyLogoURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)mapName
{
  return self->_mapName;
}

- (void)setMapName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)callDirectoryLabel
{
  return self->_callDirectoryLabel;
}

- (void)setCallDirectoryLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)callDirectoryLocalizedExtensionContainingAppName
{
  return self->_callDirectoryLocalizedExtensionContainingAppName;
}

- (void)setCallDirectoryLocalizedExtensionContainingAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)callDirectoryExtensionIdentifier
{
  return self->_callDirectoryExtensionIdentifier;
}

- (void)setCallDirectoryExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)callDirectoryIdentityType
{
  return self->_callDirectoryIdentityType;
}

- (void)setCallDirectoryIdentityType:(int64_t)a3
{
  self->_callDirectoryIdentityType = a3;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int)legacyAddressBookIdentifier
{
  return self->_legacyAddressBookIdentifier;
}

- (void)setLegacyAddressBookIdentifier:(int)a3
{
  self->_legacyAddressBookIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_callDirectoryExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_callDirectoryLocalizedExtensionContainingAppName, 0);
  objc_storeStrong((id *)&self->_callDirectoryLabel, 0);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_mapName, 0);
  objc_storeStrong((id *)&self->_companyLogoURL, 0);
  objc_storeStrong((id *)&self->_companyDepartment, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_personNameComponents, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
