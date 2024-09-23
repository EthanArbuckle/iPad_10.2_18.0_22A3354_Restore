@implementation IMThemeBlissClassic

- (IMThemeBlissClassic)init
{
  IMThemeBlissClassic *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMThemeBlissClassic;
  v2 = -[IMThemePage init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[IMTheme setToolbarTitleColor:](v2, "setToolbarTitleColor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.909803922, 1.0));
    -[IMTheme setTableViewCellSelectedColor:](v2, "setTableViewCellSelectedColor:", v4);

    -[IMTheme setTextHighlightType:](v2, "setTextHighlightType:", 2);
  }
  return v2;
}

- (BOOL)isNight:(id)a3
{
  return -[IMThemeBlissClassic forceNightTheme](self, "forceNightTheme", a3);
}

- (int64_t)epubTheme
{
  return 0;
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  return -[IMThemeBlissClassic backgroundColorForTraitCollection:](self, "backgroundColorForTraitCollection:", 0);
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  return +[UIColor whiteColor](UIColor, "whiteColor", a3);
}

- (id)headerTextColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)primaryBackgroundColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)secondaryBackgroundColor
{
  return +[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground");
}

- (id)groupedBackgroundColor
{
  return +[UIColor bc_booksGroupedBackground](UIColor, "bc_booksGroupedBackground");
}

- (id)secondaryGroupedBackgroundColor
{
  return +[UIColor bc_booksSecondaryGroupedBackground](UIColor, "bc_booksSecondaryGroupedBackground");
}

- (id)primaryTextColor
{
  return +[UIColor bc_booksLabelColor](UIColor, "bc_booksLabelColor");
}

- (id)secondaryTextColor
{
  return +[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor");
}

- (id)tertiaryTextColor
{
  return +[UIColor bc_booksTertiaryLabelColor](UIColor, "bc_booksTertiaryLabelColor");
}

- (id)quarternaryTextColor
{
  return +[UIColor bc_booksQuaternaryLabelColor](UIColor, "bc_booksQuaternaryLabelColor");
}

- (id)separatorColor
{
  return +[UIColor bc_booksSeparatorColor](UIColor, "bc_booksSeparatorColor");
}

- (id)chevronColor
{
  return +[UIColor bc_booksChevronColor](UIColor, "bc_booksChevronColor");
}

- (id)switchColor
{
  return +[UIColor bc_booksGreen](UIColor, "bc_booksGreen");
}

- (id)linkColor
{
  return +[UIColor bc_booksCyan](UIColor, "bc_booksCyan");
}

- (id)keyColor
{
  return +[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor");
}

- (id)HUDBackgroundColor
{
  return +[UIColor whiteColor](UIColor, "whiteColor");
}

- (id)HUDTextColor
{
  return +[UIColor blackColor](UIColor, "blackColor");
}

- (id)tableViewHeaderViewColor
{
  return +[UIColor bc_booksSecondaryBackground](UIColor, "bc_booksSecondaryBackground");
}

- (id)searchBackgroundColor
{
  return +[UIColor bc_booksBackground](UIColor, "bc_booksBackground");
}

- (BOOL)forceNightTheme
{
  return self->_forceNightTheme;
}

- (void)setForceNightTheme:(BOOL)a3
{
  self->_forceNightTheme = a3;
}

@end
