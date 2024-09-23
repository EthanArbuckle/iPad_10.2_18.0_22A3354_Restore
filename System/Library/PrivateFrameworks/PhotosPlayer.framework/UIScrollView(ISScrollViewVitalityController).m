@implementation UIScrollView(ISScrollViewVitalityController)

- (uint64_t)is_vitalityController
{
  return objc_msgSend(a1, "is_vitalityControllerCreateIfNeeded:", 1);
}

- (ISUIScrollViewVitalityController)is_vitalityControllerCreateIfNeeded:()ISScrollViewVitalityController
{
  ISUIScrollViewVitalityController *v5;
  BOOL v6;

  objc_getAssociatedObject(a1, (const void *)ISScrollViewVitalityControllerAssociationKey);
  v5 = (ISUIScrollViewVitalityController *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = a3 == 0;
  if (!v6)
  {
    if (objc_msgSend(a1, "canDriveVitality"))
    {
      v5 = objc_alloc_init(ISUIScrollViewVitalityController);
      -[ISUIScrollViewVitalityController _setScrollView:](v5, "_setScrollView:", a1);
      objc_setAssociatedObject(a1, (const void *)ISScrollViewVitalityControllerAssociationKey, v5, (void *)1);
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (uint64_t)canDriveVitality
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_getAssociatedObject(a1, (const void *)ISScrollViewCanDriveVitalityAssociationKey);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = (void *)MEMORY[0x1E0C9AAB0];
  if (v1)
    v3 = (void *)v1;
  v4 = v3;

  v5 = objc_msgSend(v4, "BOOLValue");
  return v5;
}

- (void)setCanDriveVitality:()ISScrollViewVitalityController
{
  const void *v5;
  void *v6;

  if (objc_msgSend(a1, "canDriveVitality") != (_DWORD)a3)
  {
    v5 = (const void *)ISScrollViewCanDriveVitalityAssociationKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, v5, v6, (void *)1);

    if ((a3 & 1) == 0)
      objc_setAssociatedObject(a1, (const void *)ISScrollViewVitalityControllerAssociationKey, 0, (void *)1);
  }
}

- (void)is_didLayoutPlayerViews
{
  id v1;

  objc_msgSend(a1, "is_vitalityController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didLayoutPlayerViews");

}

@end
