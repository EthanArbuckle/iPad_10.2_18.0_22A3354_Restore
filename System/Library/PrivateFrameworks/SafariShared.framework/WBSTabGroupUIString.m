@implementation WBSTabGroupUIString

+ (id)uniqueTabGroupTitleWithExisting:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", v4) && objc_msgSend(v3, "count"))
  {
    v5 = 1;
    while (1)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v3, "containsObject:", v8))
        break;

      if (++v5 > (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v8 = v4;
  }

  return v8;
}

+ (id)menuTitleCreateGroupWithTheseTabs:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;

  if (a3 == 1)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)accessiblityLabelForTabGroupWithTitle:(id)a3 andTheseTabs:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
