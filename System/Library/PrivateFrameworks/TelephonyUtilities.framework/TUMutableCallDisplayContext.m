@implementation TUMutableCallDisplayContext

- (void)mergeValuesFromDisplayContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  TUMutableCallDisplayContext *v8;
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
  void *v35;
  void *v36;
  void *v37;
  TUMutableCallDisplayContext *v38;
  TUMutableCallDisplayContext *v39;
  TUMutableCallDisplayContext *v40;

  v40 = (TUMutableCallDisplayContext *)a3;
  -[TUCallDisplayContext name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TUBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6) == 0;
  v8 = v40;
  if (v7)
    v8 = self;
  -[TUCallDisplayContext name](v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCallDisplayContext setName:](self, "setName:", v9);

  -[TUCallDisplayContext personNameComponents](self, "personNameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[TUCallDisplayContext setPersonNameComponents:](self, "setPersonNameComponents:", v10);
  }
  else
  {
    -[TUCallDisplayContext personNameComponents](v40, "personNameComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setPersonNameComponents:](self, "setPersonNameComponents:", v11);

  }
  -[TUCallDisplayContext suggestedName](self, "suggestedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[TUCallDisplayContext setSuggestedName:](self, "setSuggestedName:", v12);
  }
  else
  {
    -[TUCallDisplayContext suggestedName](v40, "suggestedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setSuggestedName:](self, "setSuggestedName:", v13);

  }
  -[TUCallDisplayContext label](self, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[TUCallDisplayContext setLabel:](self, "setLabel:", v14);
  }
  else
  {
    -[TUCallDisplayContext label](v40, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setLabel:](self, "setLabel:", v15);

  }
  -[TUCallDisplayContext companyName](self, "companyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[TUCallDisplayContext setCompanyName:](self, "setCompanyName:", v16);
  }
  else
  {
    -[TUCallDisplayContext companyName](v40, "companyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCompanyName:](self, "setCompanyName:", v17);

  }
  -[TUCallDisplayContext companyDepartment](self, "companyDepartment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[TUCallDisplayContext setCompanyDepartment:](self, "setCompanyDepartment:", v18);
  }
  else
  {
    -[TUCallDisplayContext companyDepartment](v40, "companyDepartment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCompanyDepartment:](self, "setCompanyDepartment:", v19);

  }
  -[TUCallDisplayContext companyLogoURL](self, "companyLogoURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[TUCallDisplayContext setCompanyLogoURL:](self, "setCompanyLogoURL:", v20);
  }
  else
  {
    -[TUCallDisplayContext companyLogoURL](v40, "companyLogoURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCompanyLogoURL:](self, "setCompanyLogoURL:", v21);

  }
  -[TUCallDisplayContext contactName](self, "contactName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    -[TUCallDisplayContext setContactName:](self, "setContactName:", v22);
  }
  else
  {
    -[TUCallDisplayContext contactName](v40, "contactName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setContactName:](self, "setContactName:", v23);

  }
  -[TUCallDisplayContext contactLabel](self, "contactLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[TUCallDisplayContext setContactLabel:](self, "setContactLabel:", v24);
  }
  else
  {
    -[TUCallDisplayContext contactLabel](v40, "contactLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setContactLabel:](self, "setContactLabel:", v25);

  }
  -[TUCallDisplayContext mapName](self, "mapName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[TUCallDisplayContext setMapName:](self, "setMapName:", v26);
  }
  else
  {
    -[TUCallDisplayContext mapName](v40, "mapName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setMapName:](self, "setMapName:", v27);

  }
  -[TUCallDisplayContext location](self, "location");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    -[TUCallDisplayContext setLocation:](self, "setLocation:", v28);
  }
  else
  {
    -[TUCallDisplayContext location](v40, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setLocation:](self, "setLocation:", v29);

  }
  -[TUCallDisplayContext callDirectoryLabel](self, "callDirectoryLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    -[TUCallDisplayContext setCallDirectoryLabel:](self, "setCallDirectoryLabel:", v30);
  }
  else
  {
    -[TUCallDisplayContext callDirectoryLabel](v40, "callDirectoryLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCallDirectoryLabel:](self, "setCallDirectoryLabel:", v31);

  }
  -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](self, "callDirectoryLocalizedExtensionContainingAppName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[TUCallDisplayContext setCallDirectoryLocalizedExtensionContainingAppName:](self, "setCallDirectoryLocalizedExtensionContainingAppName:", v32);
  }
  else
  {
    -[TUCallDisplayContext callDirectoryLocalizedExtensionContainingAppName](v40, "callDirectoryLocalizedExtensionContainingAppName");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCallDirectoryLocalizedExtensionContainingAppName:](self, "setCallDirectoryLocalizedExtensionContainingAppName:", v33);

  }
  -[TUCallDisplayContext contactIdentifiers](self, "contactIdentifiers");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[TUCallDisplayContext setContactIdentifiers:](self, "setContactIdentifiers:", v34);
  }
  else
  {
    -[TUCallDisplayContext contactIdentifiers](v40, "contactIdentifiers");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setContactIdentifiers:](self, "setContactIdentifiers:", v35);

  }
  -[TUCallDisplayContext callDirectoryExtensionIdentifier](self, "callDirectoryExtensionIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    -[TUCallDisplayContext setCallDirectoryExtensionIdentifier:](self, "setCallDirectoryExtensionIdentifier:", v36);
  }
  else
  {
    -[TUCallDisplayContext callDirectoryExtensionIdentifier](v40, "callDirectoryExtensionIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCallDisplayContext setCallDirectoryExtensionIdentifier:](self, "setCallDirectoryExtensionIdentifier:", v37);

  }
  v7 = -[TUCallDisplayContext callDirectoryIdentityType](self, "callDirectoryIdentityType") == 0;
  v38 = v40;
  if (!v7)
    v38 = self;
  -[TUCallDisplayContext setCallDirectoryIdentityType:](self, "setCallDirectoryIdentityType:", -[TUCallDisplayContext callDirectoryIdentityType](v38, "callDirectoryIdentityType"));
  v7 = -[TUCallDisplayContext legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier") == -1;
  v39 = v40;
  if (!v7)
    v39 = self;
  -[TUCallDisplayContext setLegacyAddressBookIdentifier:](self, "setLegacyAddressBookIdentifier:", -[TUCallDisplayContext legacyAddressBookIdentifier](v39, "legacyAddressBookIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
