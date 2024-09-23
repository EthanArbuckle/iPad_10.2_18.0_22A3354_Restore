@implementation MTTheme(Library)

+ (uint64_t)createOrUpdateTheme:()Library forUuid:inMOC:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "themeForUuid:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v15 = (id)objc_msgSend(MEMORY[0x1E0D7F268], "insertNewTheme:forUuid:inMOC:", v7, v8, v9);
LABEL_6:
    v14 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v10, "convertToColorTheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v7);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v11, "populateWithColorTheme:", v7);
    goto LABEL_6;
  }
  v14 = 0;
LABEL_7:

  return v14;
}

+ (id)insertNewTheme:()Library forUuid:inMOC:
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0C97B20];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("MTTheme"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUuid:", v8);

  objc_msgSend(v10, "populateWithColorTheme:", v9);
  return v10;
}

- (id)convertToColorTheme
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(a1, "primaryTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPrimaryTextColor:", v4);

  objc_msgSend(a1, "secondaryTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSecondaryTextColor:", v5);

  objc_msgSend(v2, "setIsBackgroundLight:", objc_msgSend(a1, "isBackgroundLight"));
  return v2;
}

- (uint64_t)populateWithColorTheme:()Library
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v5);

  objc_msgSend(v4, "primaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setPrimaryTextColor:", v6);

  objc_msgSend(v4, "secondaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSecondaryTextColor:", v7);

  v8 = objc_msgSend(v4, "isBackgroundLight");
  return objc_msgSend(a1, "setIsBackgroundLight:", v8);
}

@end
