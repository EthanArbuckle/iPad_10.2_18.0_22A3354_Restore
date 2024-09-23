@implementation SBHLibraryOverscrollViewController

- (BOOL)shouldBeIndicatedInPageControl
{
  return 0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->legibilitySettings, a3);
}

- (unint64_t)contentVisibility
{
  return self->contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  self->contentVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->legibilitySettings, 0);
}

@end
