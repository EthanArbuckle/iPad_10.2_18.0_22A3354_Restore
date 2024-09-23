@implementation SearchUISportsFollowButtonItem

- (id)untoggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("FOLLOW"));
}

- (id)toggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("FOLLOWING"));
}

- (id)commandForStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_new();
  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sportsItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSportsItem:", v7);

  objc_msgSend(v5, "setFollow:", a3 == 0);
  return v5;
}

- (id)offStateSymbolName
{
  return CFSTR("star.circle");
}

- (id)onStateSymbolName
{
  return CFSTR("star.circle.fill");
}

- (BOOL)useDefaultSymbolFillStyle
{
  return 0;
}

- (BOOL)allowsContextMenu
{
  return 0;
}

@end
