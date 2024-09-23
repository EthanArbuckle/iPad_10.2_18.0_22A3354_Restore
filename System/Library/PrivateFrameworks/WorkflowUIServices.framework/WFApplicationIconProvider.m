@implementation WFApplicationIconProvider

+ (id)applicationIconImageForBundleIdentifier:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilecal")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "applicationIconImageForCalendarDate:size:", v8, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isInstalled");

    if ((v12 & 1) != 0)
    {
      v8 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForSystemPlaceholder:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "appState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isPlaceholder");

      if (!v14)
      {
        v9 = 0;
        goto LABEL_9;
      }
      v10 = v8;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithResourceProxy:", v10);
    UIImageFromISIcon(v15, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v9;
}

+ (id)applicationIconImageForCalendarDate:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  height = a4.height;
  width = a4.width;
  v6 = (objc_class *)MEMORY[0x24BE51A90];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithDate:calendar:format:", v7, v9, 0);

  UIImageFromISIcon(v10, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
