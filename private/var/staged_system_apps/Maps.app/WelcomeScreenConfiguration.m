@implementation WelcomeScreenConfiguration

+ (id)configurationForCountryCode:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  WelcomeScreenConfiguration *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(a1), "_allPossibleBulletTypesForCountryCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend((id)objc_opt_class(a1), "_supportedBulletTypesFrom:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend((id)objc_opt_class(a1), "_createBulletsFromBulletTypes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_alloc_init(WelcomeScreenConfiguration);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Welcome Screen] What’s new"), CFSTR("localized string not found"), 0));
  -[WelcomeScreenConfiguration setTitle:](v11, "setTitle:", v13);

  -[WelcomeScreenConfiguration setBullets:](v11, "setBullets:", v10);
  return v11;
}

+ (id)_allPossibleBulletTypesForCountryCode:(id)a3
{
  void *v3;
  _UNKNOWN **v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  if ((objc_msgSend(CFSTR("us"), "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(CFSTR("gb"), "isEqualToString:", v3) & 1) != 0
    || (objc_msgSend(CFSTR("ie"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = &off_101273C38;
  }
  else if ((objc_msgSend(CFSTR("cn"), "isEqualToString:", v3) & 1) != 0)
  {
    v4 = &off_101273C50;
  }
  else if (objc_msgSend(CFSTR("jp"), "isEqualToString:", v3))
  {
    v4 = &off_101273C68;
  }
  else
  {
    v4 = &off_101273C80;
  }

  return v4;
}

+ (id)_supportedBulletTypesFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  char IsEnabled_DrivingMultiWaypointRoutes;
  _UNKNOWN **v15;
  char IsEnabled_TransitPay;
  void *v17;
  unsigned int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "integerValue", (_QWORD)v20);
        if (v12 == (id)2)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
          v18 = objc_msgSend(v17, "supportsAdvancedMap");

          v15 = &off_10126EC98;
          if (!v18)
            goto LABEL_16;
LABEL_15:
          objc_msgSend(v4, "addObject:", v15);
          goto LABEL_16;
        }
        if (v12 == (id)1)
        {
          if (!v6)
          {
            IsEnabled_TransitPay = MapsFeature_IsEnabled_TransitPay();
            v15 = &off_10126EC80;
            if ((IsEnabled_TransitPay & 1) != 0)
              goto LABEL_15;
          }
        }
        else if (!v12)
        {
          IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(0, v13);
          v15 = &off_10126EC68;
          if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0)
            goto LABEL_15;
        }
LABEL_16:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v4;
}

+ (id)_createBulletsFromBulletTypes:(id)a3
{
  return objc_msgSend(a3, "_maps_compactMap:", &stru_1011C6140);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)bullets
{
  return self->_bullets;
}

- (void)setBullets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bullets, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
