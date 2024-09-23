@implementation UIView(SBUISystemAperturePrivate)

- (SBUISystemApertureLayoutGuide)SBUISA_systemApertureLayoutGuideWithIdentifier:()SBUISystemAperturePrivate
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  SBUISystemApertureLayoutGuide *v9;
  SBUISystemApertureLayoutGuide *v10;
  SBUISystemApertureLayoutGuide *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(a1, "layoutGuides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__UIView_SBUISystemAperturePrivate__SBUISA_systemApertureLayoutGuideWithIdentifier___block_invoke;
  v13[3] = &unk_1E4C40088;
  v6 = v4;
  v14 = v6;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_opt_class();
    v9 = v7;
    if (v8)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v11 = v10;

    -[SBUISystemApertureLayoutGuide activateConstraintsIfNeeded](v11, "activateConstraintsIfNeeded");
  }
  else
  {
    v11 = objc_alloc_init(SBUISystemApertureLayoutGuide);
    -[SBUISystemApertureLayoutGuide setIdentifier:](v11, "setIdentifier:", v6);
    objc_msgSend(a1, "addLayoutGuide:", v11);
    -[SBUISystemApertureLayoutGuide prepareIfNeeded](v11, "prepareIfNeeded");
    v9 = v11;
  }

  return v9;
}

- (uint64_t)SBUISA_systemApertureMaximumContentSizeLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("SBUISystemApertureMaximumContentSizeLayoutMarginsGuideIdentifier"));
}

- (uint64_t)SBUISA_systemApertureMinimumContentSizeLayoutGuide
{
  return objc_msgSend(a1, "SBUISA_systemApertureLayoutGuideWithIdentifier:", CFSTR("kSBUISystemApertureMinimumContentSizeLayoutMarginsGuideIdentifier"));
}

@end
