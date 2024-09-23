@implementation SceneSessionRestorationArbiter

+ (id)activityForSceneSession:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateRestorationActivity"));

  if (!v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "role"));
    v7 = objc_msgSend(v6, "isEqualToString:", UIWindowSceneSessionRoleApplication);

    if (v7)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.Restore"));
      v19 = CFSTR("MapsActivity");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsActivity mapsActivityPerDefault](MapsActivity, "mapsActivityPerDefault"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "data"));
      v20 = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      objc_msgSend(v5, "setUserInfo:", v10);

LABEL_5:
      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "role"));
    if ((objc_msgSend(v11, "isEqualToString:", _UIWindowSceneSessionRoleCarPlay) & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scene"));

      if (!v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("NavigationUserActivityPendingDeletion"));

        if ((v14 & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("NavigationUserActivityDefault")));

          if (v8)
          {
            v5 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.Maps.Restore"));
            v17 = CFSTR("MapsActivity");
            v18 = v8;
            v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
            objc_msgSend(v5, "setUserInfo:", v9);
            goto LABEL_5;
          }
        }
      }
    }
    else
    {

    }
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateRestorationActivity"));
LABEL_13:

  return v5;
}

@end
