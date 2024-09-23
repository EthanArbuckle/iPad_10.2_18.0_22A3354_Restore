@implementation OBUtilities

+ (id)localizedString:(id)a3 forTable:(id)a4 inBundle:(id)a5 forLanguage:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length") && objc_msgSend(v12, "length"))
  {
    v13 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v11, "localizations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "localizedStringForKey:value:table:localization:", v9, 0, v10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  if (!objc_msgSend(v18, "length"))
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_1E37AB0D0, v10);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }

  return v18;
}

+ (id)stringWithFormat:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, &v7);

  return v5;
}

@end
