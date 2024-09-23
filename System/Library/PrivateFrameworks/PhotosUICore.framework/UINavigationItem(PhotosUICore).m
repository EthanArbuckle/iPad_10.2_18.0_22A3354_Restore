@implementation UINavigationItem(PhotosUICore)

- (uint64_t)px_setPreferredLargeTitleDisplayMode:()PhotosUICore
{
  uint64_t result;
  void *v6;

  result = objc_msgSend(a1, "px_preferredLargeTitleDisplayMode");
  if (result != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, sel_px_preferredLargeTitleDisplayMode, v6, (void *)3);

    return objc_msgSend(a1, "_updateFinalLargeTitleDisplayMode");
  }
  return result;
}

- (uint64_t)_updateFinalLargeTitleDisplayMode
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "px_preferredLargeTitleDisplayMode");
  if (objc_msgSend(a1, "px_disableLargeTitle"))
    v3 = 2;
  else
    v3 = v2;
  return objc_msgSend(a1, "setLargeTitleDisplayMode:", v3);
}

- (uint64_t)px_preferredLargeTitleDisplayMode
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_px_preferredLargeTitleDisplayMode);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (uint64_t)px_disableLargeTitle
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_px_disableLargeTitle);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)px_setBackButtonDisplayMode:()PhotosUICore
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(a1, "setBackButtonDisplayMode:", a3);
  return result;
}

- (void)px_updateBackButtonVisibilityForTraitCollection:()PhotosUICore
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_getAssociatedObject(a1, sel_px_hidesBackButtonInRegularWidth);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (objc_msgSend(v6, "horizontalSizeClass") == 2)
      v5 = objc_msgSend(v4, "BOOLValue");
    else
      v5 = 0;
    objc_msgSend(a1, "setHidesBackButton:", v5);
  }

}

- (uint64_t)px_setDisableLargeTitle:()PhotosUICore
{
  uint64_t result;
  void *v6;

  result = objc_msgSend(a1, "px_disableLargeTitle");
  if ((_DWORD)result != (_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, sel_px_disableLargeTitle, v6, (void *)3);

    return objc_msgSend(a1, "_updateFinalLargeTitleDisplayMode");
  }
  return result;
}

- (uint64_t)px_hidesBackButtonInRegularWidth
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_px_hidesBackButtonInRegularWidth);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)px_setHidesBackButtonInRegularWidth:()PhotosUICore
{
  id v5;

  if (objc_msgSend(a1, "px_hidesBackButtonInRegularWidth") != (_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, sel_px_hidesBackButtonInRegularWidth, v5, (void *)3);

  }
}

- (uint64_t)px_backButtonDisplayMode
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "backButtonDisplayMode");
  else
    return 0;
}

@end
