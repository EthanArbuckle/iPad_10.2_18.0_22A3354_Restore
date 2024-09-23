@implementation XBDefaultApplicationProvider

- (id)allSplashBoardApplications
{
  return -[XBDefaultApplicationProvider _allApplicationsFilteredBySystem:bySplashBoard:](self, "_allApplicationsFilteredBySystem:bySplashBoard:", 0, 1);
}

- (id)splashBoardSystemApplications
{
  return -[XBDefaultApplicationProvider _allApplicationsFilteredBySystem:bySplashBoard:](self, "_allApplicationsFilteredBySystem:bySplashBoard:", 1, 1);
}

- (id)allInstalledApplications
{
  return -[XBDefaultApplicationProvider _allApplicationsFilteredBySystem:bySplashBoard:](self, "_allApplicationsFilteredBySystem:bySplashBoard:", 0, 0);
}

- (id)recentlyUsedBundleIDs
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)_allApplicationsFilteredBySystem:(BOOL)a3 bySplashBoard:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = a4;
  v5 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("UILaunchStoryboards"), CFSTR("UILaunchScreen"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", v5);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        objc_msgSend(v11, "compatibilityObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v13 = objc_msgSend(MEMORY[0x24BDF7008], "_applicationTypeForProxy:", v12);
          if (v13 != 1 || !v4)
          {
            if (v13 == 1)
              goto LABEL_15;
            goto LABEL_16;
          }
        }
        else if (!v4)
        {
          goto LABEL_15;
        }
        objc_msgSend(v11, "infoDictionary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectsForKeys:", v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("UILaunchStoryboardName"), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16
          || (objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("UILaunchStoryboards"), objc_opt_class()),
              (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {

LABEL_15:
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF7008]), "initWithApplicationProxy:", v12);
          objc_msgSend(v6, "addObject:", v17);

          goto LABEL_16;
        }
        objc_msgSend(v15, "objectForKey:ofClass:", CFSTR("UILaunchScreen"), objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          goto LABEL_15;
LABEL_16:

        ++v10;
      }
      while (v8 != v10);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v19;
    }
    while (v19);
  }

  return v6;
}

@end
