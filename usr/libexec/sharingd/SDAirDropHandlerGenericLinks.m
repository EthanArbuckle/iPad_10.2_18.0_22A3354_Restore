@implementation SDAirDropHandlerGenericLinks

- (BOOL)canHandleTransfer
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_semaphore_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[6];
  dispatch_semaphore_t v28;
  SEL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  if (!-[SDAirDropHandler isJustLinks](self, "isJustLinks"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

  if (v4)
    return 1;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completedURLs"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v5 = v8 != 0;
  v26 = v8;
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scheme"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lowercaseString"));

        if ((objc_msgSend(v13, "isEqual:", CFSTR("http")) & 1) != 0
          || objc_msgSend(v13, "isEqual:", CFSTR("https")))
        {
          v14 = dispatch_semaphore_create(0);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_1000BED7C;
          v27[3] = &unk_100716A58;
          v27[4] = self;
          v27[5] = v11;
          v28 = v14;
          v29 = a2;
          v15 = v14;
          +[LSAppLink getAppLinkWithURL:completionHandler:](LSAppLink, "getAppLinkWithURL:completionHandler:", v11, v27);
          v16 = dispatch_time(0, 1000000000);
          dispatch_semaphore_wait(v15, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericLinks appLink](self, "appLink"));

        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URLOverrideForURL:", v11));

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "applicationsAvailableForOpeningURL:", v15));
          v21 = v9;
          v22 = a2;
          v23 = v7;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));
          -[SDAirDropHandler setBundleProxy:](self, "setBundleProxy:", v24);

          v7 = v23;
          a2 = v22;
          v9 = v21;

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
        }

        if (!v17)
        {
          v5 = 0;
          goto LABEL_19;
        }
        v10 = (char *)v10 + 1;
      }
      while (v26 != v10);
      v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v26)
        continue;
      break;
    }
    v5 = 1;
  }
LABEL_19:

  return v5;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerGenericLinks;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x4000000;
}

- (id)suitableContentsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericLinks appLink](self, "appLink"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetApplicationProxy"));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));
  v10 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v22 = CFSTR("GENERIC_LINK");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
  v23 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v24 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler alertMessageLocalizedKeyForTypeDicts:](self, "alertMessageLocalizedKeyForTypeDicts:", v13));

  v16 = SFLocalizedStringForKey(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (v10 == 1)
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v3, v9, v21);
  else
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v3, v10, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  return v19;
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;
  void *v15;

  v14.receiver = self;
  v14.super_class = (Class)SDAirDropHandlerGenericLinks;
  -[SDAirDropHandler updatePossibleActions](&v14, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerGenericLinks appLink](self, "appLink"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "targetApplicationProxy"));
  if (v4)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));

    if (!v4)
      return;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v4));
  location = 0;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1000BF1B4;
  v11 = &unk_100714348;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "setActionHandler:", &v8);
  v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v8, v9, v10, v11));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v7, "setPossibleActions:", v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (LSAppLink)appLink
{
  return self->_appLink;
}

- (void)setAppLink:(id)a3
{
  objc_storeStrong((id *)&self->_appLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLink, 0);
}

@end
