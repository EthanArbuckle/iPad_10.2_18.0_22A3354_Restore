@implementation AddShortcutsRowCellModel

- (id)_maps_diffableDataSourceIdentifier
{
  return CFSTR("AddShortcut");
}

- (id)title
{
  unsigned int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = CFSTR("[Proactive Tray] Add Pin");
  else
    v5 = CFSTR("[Proactive Tray] Add Shortcut");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

  return v6;
}

- (id)image
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus"));
}

- (int64_t)contentMode
{
  return 4;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AddShortcutsRowCellModel title](self, "title"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;

  if (a3 == self)
  {
    isKindOfClass = 1;
  }
  else
  {
    v4 = a3;
    v6 = objc_opt_class(self, v5);
    isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  }
  return isKindOfClass & 1;
}

- (BOOL)vibrantBackground
{
  return 1;
}

@end
