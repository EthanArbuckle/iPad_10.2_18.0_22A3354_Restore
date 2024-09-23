@implementation UITableViewCell(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "foregroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v4);

  objc_msgSend(a1, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKAppearanceApplyToContainer(v11, v5);

  objc_msgSend(a1, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v7);

  if (objc_msgSend(a1, "style") == 1000)
  {
    objc_msgSend(a1, "editableTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v11, v8);
  }
  else
  {
    objc_msgSend(a1, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKAppearanceApplyToContainer(v11, v9);

    objc_msgSend(a1, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "altTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v10);

  }
}

@end
