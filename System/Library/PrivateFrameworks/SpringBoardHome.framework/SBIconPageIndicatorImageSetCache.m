@implementation SBIconPageIndicatorImageSetCache

- (void)setLegibilitySettings:(id)a3
{
  SBIconPageIndicatorImageSetResult *v5;
  SBIconPageIndicatorImageSetResult *indicatorImageSetResults;
  SBIconPageIndicatorImageSetResult *v7;
  SBIconPageIndicatorImageSetResult *searchImageSetResults;
  SBIconPageIndicatorImageSetResult *v9;
  SBIconPageIndicatorImageSetResult *cameraImageSetResults;
  id v11;

  v11 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBIconPageIndicatorImageSetCache _emptyPageIndicatorSet](self, "_emptyPageIndicatorSet");
    v5 = (SBIconPageIndicatorImageSetResult *)objc_claimAutoreleasedReturnValue();
    indicatorImageSetResults = self->_indicatorImageSetResults;
    self->_indicatorImageSetResults = v5;

    -[SBIconPageIndicatorImageSetCache _emptyPageIndicatorSet](self, "_emptyPageIndicatorSet");
    v7 = (SBIconPageIndicatorImageSetResult *)objc_claimAutoreleasedReturnValue();
    searchImageSetResults = self->_searchImageSetResults;
    self->_searchImageSetResults = v7;

    -[SBIconPageIndicatorImageSetCache _emptyPageIndicatorSet](self, "_emptyPageIndicatorSet");
    v9 = (SBIconPageIndicatorImageSetResult *)objc_claimAutoreleasedReturnValue();
    cameraImageSetResults = self->_cameraImageSetResults;
    self->_cameraImageSetResults = v9;

  }
}

- (id)pageIndicatorImageSetForLegibilitySettings:(id)a3
{
  _UILegibilitySettings *legibilitySettings;

  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings == a3 && legibilitySettings != 0)
    return self->_indicatorImageSetResults;
  -[SBIconPageIndicatorImageSetCache _emptyPageIndicatorSet](self, "_emptyPageIndicatorSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)searchIndicatorImageSetForLegibilitySettings:(id)a3
{
  _UILegibilitySettings *legibilitySettings;

  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings == a3 && legibilitySettings != 0)
    return self->_searchImageSetResults;
  -[SBIconPageIndicatorImageSetCache _emptyPageIndicatorSet](self, "_emptyPageIndicatorSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)cameraIndicatorImageSetForLegibilitySettings:(id)a3
{
  _UILegibilitySettings *legibilitySettings;

  legibilitySettings = self->_legibilitySettings;
  if (legibilitySettings == a3 && legibilitySettings != 0)
    return self->_cameraImageSetResults;
  -[SBIconPageIndicatorImageSetCache _emptyPageIndicatorSet](self, "_emptyPageIndicatorSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_emptyPageIndicatorSet
{
  void *v2;
  void *v3;
  SBIconPageIndicatorImageSetResult *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4268]), "initWithImage:shadowImage:", 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4268]), "initWithImage:shadowImage:", 0, 0);
  v4 = -[SBIconPageIndicatorImageSetResult initWithIndicatorSet:enabledIndicatorSet:]([SBIconPageIndicatorImageSetResult alloc], "initWithIndicatorSet:enabledIndicatorSet:", v2, v3);

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraImageSetResults, 0);
  objc_storeStrong((id *)&self->_searchImageSetResults, 0);
  objc_storeStrong((id *)&self->_indicatorImageSetResults, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
