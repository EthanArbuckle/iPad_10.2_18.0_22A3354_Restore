@implementation UIWindowScene(SBUISystemAperture)

- (BOOL)SBUI_isHostedBySystemAperture
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "systemApertureElementSource");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "layoutMode") != 0;

  return v2;
}

- (id)systemApertureElementContext
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "systemApertureElementContextPrivate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    +[SBUISystemApertureElementUnassociatedContext unassociatedContext](SBUISystemApertureElementUnassociatedContext, "unassociatedContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)systemApertureHostedElementContext
{
  void *v2;

  if (SBUIIsSystemApertureEnabled())
  {
    objc_msgSend(a1, "systemApertureElementSource");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (SBUISystemApertureElementSource)systemApertureElementSource
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  SBUISystemApertureElementSource *v6;

  objc_msgSend(a1, "_sceneComponentForKey:", CFSTR("SBUISystemApertureElementSourceKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    v6 = objc_alloc_init(SBUISystemApertureElementSource);
    -[SBUISystemApertureElementSource registerWithScene:](v6, "registerWithScene:", a1);
  }
  return v6;
}

- (id)systemApertureElementViewControllerProvider
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "systemApertureElementContextPrivate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "systemApertureElementViewControllerProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setSystemApertureElementViewControllerProvider:()SBUISystemAperture
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "systemApertureElementContextPrivate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSystemApertureElementViewControllerProvider:", v4);

}

@end
