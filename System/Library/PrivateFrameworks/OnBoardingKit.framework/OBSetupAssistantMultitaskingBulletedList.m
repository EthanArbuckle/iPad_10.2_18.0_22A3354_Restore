@implementation OBSetupAssistantMultitaskingBulletedList

- (double)bulletedListItemSpacing
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double result;
  objc_super v8;

  +[OBDevice currentDevice](OBDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "templateType");

  if (v4 == 6)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isMiniPad");

    result = 22.0;
    if (v6)
      return 16.0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)OBSetupAssistantMultitaskingBulletedList;
    -[OBBulletedList bulletedListItemSpacing](&v8, sel_bulletedListItemSpacing);
  }
  return result;
}

- (void)addItemWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5
{
  id v8;
  id v9;
  id v10;
  OBBulletedListItem *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[OBBulletedListItem initWithTitle:description:symbolName:tintColor:]([OBBulletedListItem alloc], "initWithTitle:description:symbolName:tintColor:", v10, v9, v8, 0);

  -[OBBulletedListItem setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[OBBulletedList addBulletedListItem:](self, "addBulletedListItem:", v11);

}

@end
