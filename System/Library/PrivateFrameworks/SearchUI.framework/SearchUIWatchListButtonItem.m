@implementation SearchUIWatchListButtonItem

- (id)untoggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("ADD_TO_UP_NEXT"));
}

- (id)toggledTitle
{
  return +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("IN_UP_NEXT"));
}

- (id)offStateSymbolName
{
  return CFSTR("plus");
}

- (id)onStateSymbolName
{
  return CFSTR("checkmark");
}

- (id)commandForStatus:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_new();
  -[SearchUIButtonItem sfButtonItem](self, "sfButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "watchListItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWatchListItem:", v7);

  objc_msgSend(v5, "setShouldAddToWatchList:", a3 == 0);
  return v5;
}

@end
