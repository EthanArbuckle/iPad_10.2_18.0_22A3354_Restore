@implementation UIWebGeolocationPolicyDecider

+ (void)initialize
{
  NSObject *v2;
  NSObject *global_queue;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("com.apple.UIKit.webGeolocationCacheFileAccessQueue", 0);
    webGeolocationCacheFileAccessQueue = (uint64_t)v2;
    global_queue = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v2, global_queue);
  }
}

+ (id)sharedPolicyDecider
{
  id result;

  result = (id)sharedPolicyDecider_policyDecider;
  if (!sharedPolicyDecider_policyDecider)
  {
    result = objc_alloc_init(UIWebGeolocationPolicyDecider);
    sharedPolicyDecider_policyDecider = (uint64_t)result;
  }
  return result;
}

- (UIWebGeolocationPolicyDecider)init
{
  UIWebGeolocationPolicyDecider *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebGeolocationPolicyDecider;
  v2 = -[UIWebGeolocationPolicyDecider init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)clearGeolocationCache, CFSTR("com.apple.locationd.appreset"), 0, CFNotificationSuspensionBehaviorCoalesce);
    v2->_challenges = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2->_activeChallenges = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.locationd.appreset"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UIWebGeolocationPolicyDecider;
  -[UIWebGeolocationPolicyDecider dealloc](&v4, sel_dealloc);
}

- (id)_siteFileInContainerDirectory:(id)a3 creatingIntermediateDirectoriesIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("Library/WebKit"));
  if (v4)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v5, 0);
  return (id)objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("GeolocationSites.plist"));
}

- (id)_siteFile
{
  id result;

  result = (id)_siteFile_sSiteFile;
  if (!_siteFile_sSiteFile)
  {
    result = -[UIWebGeolocationPolicyDecider _siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:](self, "_siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:", NSHomeDirectory(), 1);
    _siteFile_sSiteFile = (uint64_t)result;
  }
  return result;
}

- (void)_load
{
  _QWORD block[5];

  if (!self->_sites)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__UIWebGeolocationPolicyDecider__load__block_invoke;
    block[3] = &unk_1E16B41B8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)webGeolocationCacheFileAccessQueue, block);
  }
}

id __38__UIWebGeolocationPolicyDecider__load__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id result;
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", objc_msgSend(*(id *)(a1 + 32), "_siteFile"), 1, 0);
  if (v1)
  {
    v21 = 200;
    v22 = 0;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, &v21, &v22);
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    v5 = result;
    if (result)
    {
      v6 = *(_QWORD *)v18;
      v7 = 0x1E0C99000uLL;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v2);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_msgSend(v2, "objectForKey:", v9);
          v11 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("ChallengeDate"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v3, "setObject:forKey:", v10, v9);
          }
          else
          {
            v12 = v7;
            v13 = *(void **)(v7 + 3432);
            objc_msgSend(v11, "doubleValue");
            v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
            v23[0] = CFSTR("ChallengeCount");
            v7 = v12;
            v15 = objc_msgSend(v10, "objectForKey:");
            v23[1] = CFSTR("ChallengeDate");
            v24[0] = v15;
            v24[1] = v14;
            objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2), v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        v5 = result;
      }
      while (result);
    }
  }
  else
  {
    result = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = result;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v3;
  return result;
}

- (void)_save
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD block[6];
  uint64_t v7;

  if (-[NSMutableDictionary count](self->_sites, "count"))
  {
    v7 = 0;
    v3 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", self->_sites, 200, 0, &v7);
    if (v3)
    {
      v4 = v3;
      v5 = -[UIWebGeolocationPolicyDecider _siteFile](self, "_siteFile");
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__UIWebGeolocationPolicyDecider__save__block_invoke;
      block[3] = &unk_1E16C3CF0;
      block[4] = v4;
      block[5] = v5;
      dispatch_async((dispatch_queue_t)webGeolocationCacheFileAccessQueue, block);
    }
  }
}

uint64_t __38__UIWebGeolocationPolicyDecider__save__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);
}

- (void)clearCache
{
  id v3;
  _QWORD block[5];

  self->_sites = 0;
  v3 = -[UIWebGeolocationPolicyDecider _siteFile](self, "_siteFile");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIWebGeolocationPolicyDecider_clearCache__block_invoke;
  block[3] = &unk_1E16B41B8;
  block[4] = v3;
  dispatch_async((dispatch_queue_t)webGeolocationCacheFileAccessQueue, block);
}

uint64_t __43__UIWebGeolocationPolicyDecider_clearCache__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "_web_removeFileOnlyAtPath:", *(_QWORD *)(a1 + 32));
}

- (void)clearSafariCache
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, &v5);
  if (v5)
  {
    NSLog(CFSTR("Unable to clear the Safari geolocation policy cache: Failed to find bundle record for Safari with error %@"), objc_msgSend(v5, "localizedDescription"));
  }
  else
  {
    v4 = objc_msgSend((id)objc_msgSend(v3, "dataContainerURL"), "path");
    if (v4)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "_web_removeFileOnlyAtPath:", -[UIWebGeolocationPolicyDecider _siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:](self, "_siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:", v4, 0));
    else
      NSLog(CFSTR("Unable to clear the Safari geolocation policy cache: Failed to find the container path for Safari."));
  }
}

- (void)clearAllCaches
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *global_queue;
  _QWORD v10[8];
  _QWORD v11[6];

  v3 = UIApp;
  v4 = objc_msgSend((id)UIApp, "_beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.UIKit.ClearAllGeolocationPolicyCaches"), &__block_literal_global_689);
  -[UIWebGeolocationPolicyDecider clearCache](self, "clearCache");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v6 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CPSharedResourcesDirectory());
  v7 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_2;
  v11[3] = &unk_1E16ED360;
  v11[4] = v6;
  v11[5] = v7;
  objc_msgSend(v5, "enumerateBundlesOfType:block:", 1, v11);
  global_queue = dispatch_get_global_queue(-2, 0);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_3;
  v10[3] = &unk_1E16ED388;
  v10[4] = v7;
  v10[5] = self;
  v10[6] = v3;
  v10[7] = v4;
  dispatch_async(global_queue, v10);
}

void __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke()
{
  NSLog(CFSTR("Background task expired while clearing all WebKit geolocation policy caches."));
}

uint64_t __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "dataContainerURL");
  if (result)
  {
    v4 = result;
    result = objc_msgSend((id)result, "isEqual:", *(_QWORD *)(a1 + 32));
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  return result;
}

uint64_t __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "_web_removeFileOnlyAtPath:", objc_msgSend(*(id *)(a1 + 40), "_siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "path"), 0));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return objc_msgSend(*(id *)(a1 + 48), "_endBackgroundTask:", *(_QWORD *)(a1 + 56));
}

- (BOOL)_isAuthorizationDate:(id)a3 inclusivelyBetweenDate:(id)a4 andDate:(id)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(a4, "compare:");
  v8 = objc_msgSend(a3, "compare:", a5);
  return v7 <= 0 && v8 < 1 || (v7 | v8) >= 0;
}

- (void)clearAuthorizationForDomain:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("www.%@"), a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)-[NSMutableDictionary allKeys](self->_sites, "allKeys");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11), "host");
        if ((objc_msgSend(v12, "isEqualToString:", a3) & 1) != 0
          || objc_msgSend(v12, "isEqualToString:", v5))
        {
          -[NSMutableDictionary removeObjectForKey:](self->_sites, "removeObjectForKey:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  -[UIWebGeolocationPolicyDecider _save](self, "_save");
}

- (void)clearAuthorizationsAddedBetween:(id)a3 and:(id)a4
{
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (NSMutableDictionary *)-[NSMutableDictionary mutableCopy](self->_sites, "mutableCopy");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSMutableDictionary allKeys](v7, "allKeys", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[UIWebGeolocationPolicyDecider _isAuthorizationDate:inclusivelyBetweenDate:andDate:](self, "_isAuthorizationDate:inclusivelyBetweenDate:andDate:", objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v13), "objectForKey:", CFSTR("ChallengeDate")), a3, a4))
        {
          -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  self->_sites = v7;
  -[UIWebGeolocationPolicyDecider _save](self, "_save");
}

- (int64_t)_getChallengeCountFromHistoryForToken:(id)a3 requestingURL:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = -[NSMutableDictionary objectForKey:](self->_sites, "objectForKey:", a3);
  if (!v5)
    return 0;
  v6 = (void *)v5;
  if ((objc_msgSend((id)objc_msgSend(a4, "scheme"), "isEqualToString:", CFSTR("data")) & 1) != 0)
    return 0;
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("ChallengeDate")), "dateByAddingTimeInterval:", 86400.0);
  if (objc_msgSend(v7, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "date")) == -1)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("ChallengeCount")), "integerValue");
}

- (void)_addChallengeCount:(int64_t)a3 forToken:(id)a4 requestingURL:(id)a5
{
  int64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = -[UIWebGeolocationPolicyDecider _getChallengeCountFromHistoryForToken:requestingURL:](self, "_getChallengeCountFromHistoryForToken:requestingURL:", a4, a5);
  v9[0] = CFSTR("ChallengeCount");
  v9[1] = CFSTR("ChallengeDate");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 + a3);
  v10[1] = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  -[NSMutableDictionary setObject:forKey:](self->_sites, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), a4);
  -[UIWebGeolocationPolicyDecider _save](self, "_save");
}

- (void)_executeNextChallenge
{
  id v3;
  _BOOL4 v4;
  UIAlertController *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[6];
  id v11;

  if (-[NSMutableArray count](self->_challenges, "count") && !-[NSMapTable count](self->_activeChallenges, "count"))
  {
    v3 = (id)-[NSMutableArray objectAtIndex:](self->_challenges, "objectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_challenges, "removeObjectAtIndex:", 0);
    v11 = 0;
    v4 = -[UIWebGeolocationPolicyDecider _getAuthorizationStatusForToken:userVisibleDomain:requestingURL:promptInfo:](self, "_getAuthorizationStatusForToken:userVisibleDomain:requestingURL:promptInfo:", objc_msgSend(v3, "token"), objc_msgSend(v3, "userVisibleDomain"), objc_msgSend(v3, "requestingURL"), &v11);
    if (v11)
    {
      v5 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("title")), 0, 1);
      -[UIAlertController _setTitleMaximumLineCount:](v5, "_setTitleMaximumLineCount:", 0);
      -[NSMapTable setObject:forKey:](self->_activeChallenges, "setObject:forKey:", v3, v5);
      v6 = objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("denyButtonTitle"));
      v7 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke;
      v10[3] = &unk_1E16ED3B0;
      v10[4] = self;
      v10[5] = v5;
      -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v6, 1, v10));
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2;
      v9[3] = &unk_1E16ED3B0;
      v9[4] = self;
      v9[5] = v5;
      -[UIAlertController addAction:](v5, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("allowButtonTitle")), 0, v9));
      objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", objc_msgSend(v3, "view")), "presentViewController:animated:completion:", v5, 1, 0);
    }
    else
    {
      v8 = (void *)objc_msgSend(v3, "listener");
      if (v4)
        objc_msgSend(v8, "allow");
      else
        objc_msgSend(v8, "deny");
    }

  }
}

void *__54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke(uint64_t a1)
{
  void *result;
  void *v3;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    v3 = result;
    objc_msgSend((id)objc_msgSend(result, "listener"), "deny");
    objc_msgSend(*(id *)(a1 + 32), "_addChallengeCount:forToken:requestingURL:", -1, objc_msgSend(v3, "token"), objc_msgSend(v3, "requestingURL"));
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void *__54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2(uint64_t a1)
{
  void *result;
  void *v3;

  result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (result)
  {
    v3 = result;
    objc_msgSend((id)objc_msgSend(result, "listener"), "allow");
    objc_msgSend(*(id *)(a1 + 32), "_addChallengeCount:forToken:requestingURL:", 1, objc_msgSend(v3, "token"), objc_msgSend(v3, "requestingURL"));
    return (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)_decidePolicyForGeolocationRequestFromOrigin:(id)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6
{
  _UIWebGeolocationChallengeData *v11;
  uint64_t v12;

  v11 = objc_alloc_init(_UIWebGeolocationChallengeData);
  if (objc_msgSend(a4, "isFileURL"))
    v12 = objc_msgSend(a4, "path");
  else
    v12 = objc_msgSend((id)objc_msgSend(a3, "host"), "_web_decodeHostName");
  -[_UIWebGeolocationChallengeData setUserVisibleDomain:](v11, "setUserVisibleDomain:", v12);
  -[_UIWebGeolocationChallengeData setToken:](v11, "setToken:", getToken(a3, a4));
  -[_UIWebGeolocationChallengeData setRequestingURL:](v11, "setRequestingURL:", a4);
  -[_UIWebGeolocationChallengeData setView:](v11, "setView:", a5);
  -[_UIWebGeolocationChallengeData setListener:](v11, "setListener:", a6);
  -[NSMutableArray addObject:](self->_challenges, "addObject:", v11);
  -[UIWebGeolocationPolicyDecider _executeNextChallenge](self, "_executeNextChallenge");
}

- (BOOL)getAuthorizationStatusForOrigin:(id)a3 requestingURL:(id)a4 promptInfo:(id *)a5
{
  uint64_t Token;
  uint64_t v10;

  Token = getToken(a3, a4);
  if (objc_msgSend(a4, "isFileURL"))
    v10 = objc_msgSend(a4, "path");
  else
    v10 = objc_msgSend((id)objc_msgSend(a3, "host"), "_web_decodeHostName");
  return -[UIWebGeolocationPolicyDecider _getAuthorizationStatusForToken:userVisibleDomain:requestingURL:promptInfo:](self, "_getAuthorizationStatusForToken:userVisibleDomain:requestingURL:promptInfo:", Token, v10, a4, a5);
}

- (BOOL)_getAuthorizationStatusForToken:(id)a3 userVisibleDomain:(id)a4 requestingURL:(id)a5 promptInfo:(id *)a6
{
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  -[UIWebGeolocationPolicyDecider _load](self, "_load");
  v11 = -[UIWebGeolocationPolicyDecider _getChallengeCountFromHistoryForToken:requestingURL:](self, "_getChallengeCountFromHistoryForToken:requestingURL:", a3, a5);
  v12 = v11;
  if (a6 && (unint64_t)(v11 - 2) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", _UINSLocalizedStringWithDefaultValue(CFSTR("“%@” Would Like To Use Your Current Location"), CFSTR("“%@” Would Like To Use Your Current Location")), a4);
    v14 = _UINSLocalizedStringWithDefaultValue(CFSTR("Don’t Allow"), CFSTR("Don’t Allow"));
    v18[0] = CFSTR("title");
    v18[1] = CFSTR("allowButtonTitle");
    v19[0] = v13;
    v19[1] = objc_msgSend(_UIKitBundle(), "localizedStringForKey:value:table:", CFSTR("OK (Geolocation)"), CFSTR("OK"), CFSTR("Localizable"));
    v18[2] = CFSTR("denyButtonTitle");
    v18[3] = CFSTR("token");
    v19[2] = v14;
    v19[3] = a3;
    v15 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4), "mutableCopy");
    v16 = v15;
    if (a5)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", a5, CFSTR("requestingURL"));
    *a6 = (id)objc_msgSend(v16, "copy");

  }
  return v12 > 1;
}

- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  if (objc_msgSend(a6, "shouldClearCache", a3))
    -[UIWebGeolocationPolicyDecider clearCache](self, "clearCache");
  -[UIWebGeolocationPolicyDecider _decidePolicyForGeolocationRequestFromOrigin:requestingURL:view:listener:](self, "_decidePolicyForGeolocationRequestFromOrigin:requestingURL:view:listener:", a4, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "dataSource"), "request"), "URL"), +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", a5), a6);
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(id)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6
{
  if (objc_msgSend(a6, "shouldClearCache"))
    -[UIWebGeolocationPolicyDecider clearCache](self, "clearCache");
  -[UIWebGeolocationPolicyDecider _decidePolicyForGeolocationRequestFromOrigin:requestingURL:view:listener:](self, "_decidePolicyForGeolocationRequestFromOrigin:requestingURL:view:listener:", a3, a4, a5, a6);
}

- (void)didAuthorizeGeolocationForPromptInfo:(id)a3
{
  -[UIWebGeolocationPolicyDecider _addChallengeCount:forToken:requestingURL:](self, "_addChallengeCount:forToken:requestingURL:", 1, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("token")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requestingURL")));
}

- (void)didDenyGeolocationForPromptInfo:(id)a3
{
  -[UIWebGeolocationPolicyDecider _addChallengeCount:forToken:requestingURL:](self, "_addChallengeCount:forToken:requestingURL:", -1, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("token")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("requestingURL")));
}

@end
