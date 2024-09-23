@implementation HomeSection

- (HomeSection)initWithType:(int64_t)a3 contents:(id)a4 showsSectionButton:(BOOL)a5 customLocalizedName:(id)a6
{
  id v10;
  id v11;
  HomeSection *v12;
  HomeSection *v13;
  NSArray *v14;
  NSArray *contents;
  NSString *v16;
  NSString *customLocalizedName;
  objc_super v19;

  v10 = a4;
  v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HomeSection;
  v12 = -[HomeSection init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v14 = (NSArray *)objc_msgSend(v10, "copy");
    contents = v13->_contents;
    v13->_contents = v14;

    v13->_showsSectionButton = a5;
    v16 = (NSString *)objc_msgSend(v11, "copy");
    customLocalizedName = v13->_customLocalizedName;
    v13->_customLocalizedName = v16;

  }
  return v13;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 5)
    return 0;
  else
    return &off_1011ADDB8[v2]->isa;
}

- (NSString)localizedButtonName
{
  unint64_t type;
  BOOL v3;
  uint64_t v4;
  void *v6;
  void *v7;

  type = self->_type;
  v3 = type > 5;
  v4 = (1 << type) & 0x2C;
  if (v3 || v4 == 0)
  {
    v7 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Proactive Tray] More Button"), CFSTR("localized string not found"), 0));

  }
  return (NSString *)v7;
}

- (NSString)localizedName
{
  NSString *customLocalizedName;
  __CFString *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  customLocalizedName = self->_customLocalizedName;
  if (customLocalizedName)
    return customLocalizedName;
  v4 = &stru_1011EB268;
  switch(self->_type)
  {
    case 1:
      v5 = +[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      if (v5)
        v8 = CFSTR("[Proactive Tray] Suggestion Section");
      else
        v8 = CFSTR("[Proactive Tray] Shared Trip Section");
      goto LABEL_11;
    case 2:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("[Proactive Tray] Favorites Section");
      goto LABEL_11;
    case 3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("[Proactive Tray] Guides Section");
      goto LABEL_11;
    case 5:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = v6;
      v8 = CFSTR("[Proactive Tray] Recents Section");
LABEL_11:
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

      break;
    default:
      return (NSString *)v4;
  }
  return (NSString *)v4;
}

- (BOOL)hasOrthogonalLayout
{
  return ((self->_type - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (UIKeyCommand)keyCommand
{
  void *v2;
  int64_t type;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v2 = 0;
  type = self->_type;
  switch(type)
  {
    case 0:
    case 1:
    case 4:
    case 6:
      return (UIKeyCommand *)v2;
    case 2:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[Proactive Tray] See All Favorites Command");
      goto LABEL_5;
    case 3:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[Proactive Tray] See All My Guides Command");
      goto LABEL_5;
    case 5:
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      v7 = CFSTR("[Proactive Tray] See All Recents Command");
LABEL_5:
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

      type = self->_type;
      break;
    default:
      break;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", type));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v10 = objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v2, 0, "handleHomeSectionKeyCommand:", v9, 1572864, 0));

  v2 = (void *)v10;
  return (UIKeyCommand *)v2;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)contents
{
  return self->_contents;
}

- (BOOL)showsSectionButton
{
  return self->_showsSectionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_customLocalizedName, 0);
}

@end
