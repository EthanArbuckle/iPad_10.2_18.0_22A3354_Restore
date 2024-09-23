@implementation SearchUIShortcutsUtilities

+ (id)commandForSettingTogglesFromRowModel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v4 = v3;
  objc_msgSend(v4, "buttonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
    goto LABEL_6;
  objc_msgSend(v4, "buttonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "buttonItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v5, "command");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
LABEL_6:

  }
LABEL_8:
  objc_msgSend(v3, "cardSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "command");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
    v12 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v3, "cardSection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "command");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

LABEL_12:
  return v12;
}

@end
