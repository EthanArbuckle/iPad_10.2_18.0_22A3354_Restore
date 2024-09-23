@implementation MTShareUtilActivityViewController

- (MTShareUtilActivityViewController)initWithDataSource:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTShareUtilActivityViewController *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[MTShareUtilActivityViewController setDataSource:](self, "setDataSource:", v7);
  -[MTShareUtilActivityViewController setApplicationActivities:](self, "setApplicationActivities:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTShareUtil shareActivityItems:](MTShareUtil, "shareActivityItems:", v7));

  v11.receiver = self;
  v11.super_class = (Class)MTShareUtilActivityViewController;
  v9 = -[MTShareUtilActivityViewController initWithActivityItems:applicationActivities:](&v11, "initWithActivityItems:applicationActivities:", v8, v6);

  return v9;
}

- (id)_titleForActivity:(id)a3
{
  id v3;
  void *v5;
  void *v6;
  objc_super v7;

  if (UIActivityTypeCopyToPasteboard == a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Copy Link"), &stru_1004C6D40, 0));

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTShareUtilActivityViewController;
    v3 = -[MTShareUtilActivityViewController _titleForActivity:](&v7, "_titleForActivity:");
    return (id)objc_claimAutoreleasedReturnValue(v3);
  }
}

- (id)customLocalizedActionTitleForActivityViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilActivityViewController dataSource](self, "dataSource", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilActivityViewController titleForShareFromMode:](self, "titleForShareFromMode:", -[MTShareUtilActivityViewController shareFromModeForShareMode:](self, "shareFromModeForShareMode:", objc_msgSend(v4, "currentShareMode"))));

  return v5;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  void *v19;

  if (!-[MTShareUtilActivityViewController canShareFromTimestamp](self, "canShareFromTimestamp", a3))
    return 0;
  v4 = objc_alloc((Class)NSArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilActivityViewController titleForShareFromMode:](self, "titleForShareFromMode:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilActivityViewController titleForShareFromMode:](self, "titleForShareFromMode:", 1));
  v7 = objc_msgSend(v4, "initWithObjects:", v5, v6, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTShareUtilActivityViewController dataSource](self, "dataSource"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B5128;
  v17[3] = &unk_1004A96A0;
  v17[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_UIActivityItemCustomization pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:](_UIActivityItemCustomization, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", CFSTR("PodcastsShareFromPicker"), v7, -[MTShareUtilActivityViewController shareFromModeForShareMode:](self, "shareFromModeForShareMode:", objc_msgSend(v8, "currentShareMode")), 0, v17));

  v10 = objc_alloc((Class)_UIActivityItemCustomizationGroup);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Share From"), &stru_1004C6D40, 0));
  v19 = v9;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v14 = objc_msgSend(v10, "_initGroupWithName:identifier:customizations:", v12, CFSTR("PodcastsShareFromPickerGroup"), v13);

  v18 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));

  return v15;
}

- (id)titleForShareFromMode:(int64_t)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  MTShareUtilDataSource *dataSource;
  void *v15;

  v5 = objc_alloc_init((Class)AVTimeFormatter);
  objc_msgSend(v5, "setStyle:", 1);
  if (a3 == 1)
  {
    -[MTShareUtilDataSource selectedPlayerTime](self->_dataSource, "selectedPlayerTime");
    if (v8 <= 0.0)
    {
      -[MTShareUtilDataSource selectedReferenceTime](self->_dataSource, "selectedReferenceTime");
      v12 = v11;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("From %@"), &stru_1004C6D40, 0));
      dataSource = self->_dataSource;
      if (v12 <= 0.0)
        -[MTShareUtilDataSource currentPlayerTime](dataSource, "currentPlayerTime");
      else
        -[MTShareUtilDataSource selectedReferenceTime](dataSource, "selectedReferenceTime");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromSeconds:"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v15));

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("From %@"), &stru_1004C6D40, 0));
      -[MTShareUtilDataSource selectedPlayerTime](self->_dataSource, "selectedPlayerTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringFromSeconds:"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10));

    }
    goto LABEL_11;
  }
  if (!a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("From Start"), &stru_1004C6D40, 0));
LABEL_11:

    goto LABEL_12;
  }
  v7 = &stru_1004C6D40;
LABEL_12:

  return v7;
}

- (BOOL)canShareFromTimestamp
{
  return (id)-[MTShareUtilDataSource supportedShareModes](self->_dataSource, "supportedShareModes") == (id)4
      || (id)-[MTShareUtilDataSource supportedShareModes](self->_dataSource, "supportedShareModes") == (id)7;
}

- (int64_t)shareModeForShareFromMode:(int64_t)a3
{
  if (a3)
    return 4;
  else
    return 2;
}

- (int64_t)shareFromModeForShareMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 1;
  else
    return qword_1003C8128[a3 - 1];
}

- (MTShareUtilDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
  objc_storeStrong((id *)&self->_applicationActivities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
