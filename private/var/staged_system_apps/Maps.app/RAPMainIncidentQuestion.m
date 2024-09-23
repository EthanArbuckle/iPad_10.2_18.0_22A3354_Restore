@implementation RAPMainIncidentQuestion

- (id)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Report an Incident [Title]"), CFSTR("localized string not found"), 0));

  return v3;
}

+ (id)localizedHeaderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Incident Type [Report a Problem prompt]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (id)menuItems
{
  NSArray *menuItems;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *allMenuItems;

  menuItems = self->super.super._menuItems;
  if (!menuItems)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMainQuestion incidentMenuItems](self, "incidentMenuItems"));
    if (objc_msgSend(v5, "count"))
      objc_msgSend(v4, "addObject:", v5);
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    v7 = self->super.super._menuItems;
    self->super.super._menuItems = v6;

    allMenuItems = self->super.super._allMenuItems;
    self->super.super._allMenuItems = 0;

    menuItems = self->super.super._menuItems;
  }
  return menuItems;
}

@end
