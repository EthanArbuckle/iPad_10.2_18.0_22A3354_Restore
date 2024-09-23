@implementation CLPlacemark(PPMLHelpers)

- (void)pp_addressSpecificity
{
  objc_msgSend(a1, "name");

  objc_msgSend(a1, "thoroughfare");
  objc_msgSend(a1, "subThoroughfare");

  objc_msgSend(a1, "locality");
  objc_msgSend(a1, "subLocality");

  objc_msgSend(a1, "administrativeArea");
  objc_msgSend(a1, "subAdministrativeArea");

  objc_msgSend(a1, "postalCode");
  objc_msgSend(a1, "ISOcountryCode");

}

- (id)pp_featureNames
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x18D7805AC]();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("name"), CFSTR("inlandWater"), CFSTR("areasOfInterest"), CFSTR("timezone"), CFSTR("region"), CFSTR("subAdministrativeArea"), CFSTR("administrativeArea"), CFSTR("countryCode"), CFSTR("thoroughfare"), CFSTR("specificity"), 0);
  objc_autoreleasePoolPop(v0);
  return v1;
}

- (id)pp_featureValueForName:()PPMLHelpers
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("name")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "name");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (__CFString *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E226D4B0;
    v9 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("inlandWater")))
  {
    v10 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "inlandWater");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v7 = (__CFString *)v11;
    v9 = v10;
    v8 = v7;
LABEL_9:
    objc_msgSend(v9, "featureValueWithString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("areasOfInterest")))
  {
    v14 = (void *)MEMORY[0x1E0C9E918];
    v15 = (void *)MEMORY[0x1E0C9E9C0];
    objc_msgSend(a1, "areasOfInterest");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = v16;
    else
      v18 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v15, "sequenceWithStringArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "featureValueWithSequence:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("timezone")))
  {
    v20 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "timeZone");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString abbreviation](v7, "abbreviation");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v22 = (void *)v21;
    objc_msgSend(v20, "featureValueWithString:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("region")))
  {
    v20 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "region");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString identifier](v7, "identifier");
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("subAdministrativeArea")))
  {
    v10 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "subAdministrativeArea");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("administrativeArea")))
  {
    v10 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "administrativeArea");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("thoroughfare")))
  {
    v10 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "thoroughfare");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("countryCode")))
  {
    v10 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "ISOcountryCode");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("specificity")))
  {
    v23 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend(a1, "pp_addressSpecificity");
    objc_msgSend(v23, "featureValueWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_11:

  return v12;
}

@end
