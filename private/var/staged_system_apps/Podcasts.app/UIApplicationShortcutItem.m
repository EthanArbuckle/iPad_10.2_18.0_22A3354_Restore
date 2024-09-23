@implementation UIApplicationShortcutItem

+ (id)mt_shortcutItemForStation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextEpisode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v19[0] = CFSTR("stationUuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
      v19[1] = CFSTR("episodeUuid");
      v20[0] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v20[1] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PLAY_STATION_TITLE"), &stru_1004C6D40, 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplicationShortcutIcon iconWithSystemImageName:](UIApplicationShortcutIcon, "iconWithSystemImageName:", CFSTR("dot.radiowaves.left.and.right")));
      v16 = objc_alloc((Class)UIApplicationShortcutItem);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestTitle"));
      v7 = objc_msgSend(v16, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("kMTShortcutItemTypeStation"), v14, v17, v15, v10);

    }
  }
  else
  {

    v7 = 0;
  }

  return v7;
}

@end
