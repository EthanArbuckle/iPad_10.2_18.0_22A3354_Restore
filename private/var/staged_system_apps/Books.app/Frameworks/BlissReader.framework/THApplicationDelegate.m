@implementation THApplicationDelegate

+ (void)setupSurrogateDelegate
{
  if (qword_5432D8 != -1)
    dispatch_once(&qword_5432D8, &stru_42A6B0);
}

+ (id)documentDirectoryPath
{
  return +[UIApplication applicationDocumentsDirectory](UIApplication, "applicationDocumentsDirectory");
}

- (id)createCompatibilityDelegate
{
  return 0;
}

+ (id)contextDirectoryForAsset:(id)a3
{
  id v5;

  v5 = +[UIApplication contextDirectoryForAssetWithID:](UIApplication, "contextDirectoryForAssetWithID:", objc_msgSend(a3, "assetID"));
  objc_msgSend(a1, "p_upgradeContextDirectoryForAsset:newPath:", a3, v5);
  return v5;
}

+ (void)ensureContextDirectoryExists:(id)a3
{
  id v3;
  NSFileManager *v4;
  id v5;
  NSString *v6;
  NSString *v7;
  id v8;

  v3 = objc_msgSend(a1, "contextDirectoryForAsset:", a3);
  v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v3))
  {
    v8 = 0;
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v8))
    {
      v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationDelegate ensureContextDirectoryExists:]");
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationDelegate.m");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 88, CFSTR("ensureContextDirectoryExists error: %@"), objc_msgSend(v8, "description"));
    }
  }
}

+ (id)cacheDirectoryForAsset:(id)a3
{
  return objc_msgSend(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"), "stringByAppendingPathComponent:", objc_msgSend(a3, "assetID"));
}

+ (void)ensureCacheDirectory:(id)a3
{
  id v3;
  NSFileManager *v4;
  id v5;
  NSString *v6;
  NSString *v7;
  id v8;

  v3 = objc_msgSend(a1, "cacheDirectoryForAsset:", a3);
  v4 = +[NSFileManager defaultManager](NSFileManager, "defaultManager");
  if (!-[NSFileManager fileExistsAtPath:](v4, "fileExistsAtPath:", v3))
  {
    v8 = 0;
    if (!-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v8))
    {
      v5 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THApplicationDelegate ensureCacheDirectory:]");
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THApplicationDelegate.m");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 107, CFSTR("ensureCacheDirectory error: %@"), objc_msgSend(v8, "description"));
    }
  }
}

+ (void)p_upgradeContextDirectoryForAsset:(id)a3 newPath:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_188034;
  v4[3] = &unk_426E28;
  v4[4] = a3;
  v4[5] = a4;
  if (qword_5432E0 != -1)
    dispatch_once(&qword_5432E0, v4);
}

- (THApplicationDelegate)init
{
  THApplicationDelegate *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THApplicationDelegate;
  v2 = -[THApplicationDelegate init](&v4, "init");
  if (v2)
    v2->_bookDescriptionCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THApplicationDelegate;
  -[THApplicationDelegate dealloc](&v3, "dealloc");
}

- (id)applicationName
{
  return CFSTR("Thunderfish");
}

- (Class)documentRootClass
{
  return (Class)objc_opt_class(THDocumentRoot, a2);
}

- (id)nativeDocumentType
{
  return CFSTR("com.apple.ibooks");
}

- (id)templateDocumentType
{
  return 0;
}

- (id)validURLSchemes
{
  if (qword_5432F0 != -1)
    dispatch_once(&qword_5432F0, &stru_42A6D0);
  return objc_msgSend((id)qword_5432E8, "setByAddingObjectsFromSet:", -[THApplicationDelegate validStoreURLSchemes](self, "validStoreURLSchemes"));
}

- (id)validStoreURLSchemes
{
  if (qword_543300 != -1)
    dispatch_once(&qword_543300, &stru_42A6F0);
  return (id)qword_5432F8;
}

- (BOOL)openURL:(id)a3 sourceDocumentRoot:(id)a4
{
  NSURL *v5;

  v5 = (NSURL *)a3;
  if (!-[UIApplication canOpenURL:](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "canOpenURL:", a3)&& -[NSString isEqualToString:](-[NSString lowercaseString](-[NSURL scheme](v5, "scheme"), "lowercaseString"), "isEqualToString:", CFSTR("itms-itunesu")))
  {
    v5 = +[NSURL URLWithString:](NSURL, "URLWithString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("http:%@"), -[NSURL resourceSpecifier](v5, "resourceSpecifier")));
  }
  return -[THApplicationDelegate _maybeOpenExternalURL:sourceDocumentRoot:](self, "_maybeOpenExternalURL:sourceDocumentRoot:", v5, a4);
}

- (id)descriptionForURL:(id)a3
{
  uint64_t v5;
  double v6;
  THBookDescription *v7;
  THBookDescription *v8;

  objc_sync_enter(self);
  v5 = objc_opt_class(THBookDescription);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, -[NSMutableDictionary objectForKey:](-[THApplicationDelegate bookDescriptionCache](self, "bookDescriptionCache"), "objectForKey:", a3)).n128_u64[0];
  v8 = v7;
  if (!v7)
  {
    if (THIsApplePubAtPath(objc_msgSend(a3, "path", v6)))
    {
      -[THApplicationDelegate clearBookDescriptionCache](self, "clearBookDescriptionCache");
      v8 = +[THBookDescription descriptionWithURL:](THBookDescription, "descriptionWithURL:", a3);
      if (v8)
        -[THApplicationDelegate cacheBookDescription:forURL:](self, "cacheBookDescription:forURL:", v8, a3);
    }
    else
    {
      v8 = 0;
    }
  }
  objc_sync_exit(self);
  return v8;
}

- (id)cachedBookDescriptionForURL:(id)a3
{
  return -[NSMutableDictionary objectForKey:](-[THApplicationDelegate bookDescriptionCache](self, "bookDescriptionCache"), "objectForKey:", a3);
}

- (void)cacheBookDescription:(id)a3 forURL:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](-[THApplicationDelegate bookDescriptionCache](self, "bookDescriptionCache"), "setObject:forKey:", a3, a4);
}

- (void)uncacheBookDescriptionForURL:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](-[THApplicationDelegate bookDescriptionCache](self, "bookDescriptionCache"), "removeObjectForKey:", a3);
}

- (void)clearBookDescriptionCache
{
  -[NSMutableDictionary removeAllObjects](-[THApplicationDelegate bookDescriptionCache](self, "bookDescriptionCache"), "removeAllObjects");
}

- (BOOL)_maybeOpenExternalURL:(id)a3 sourceDocumentRoot:(id)a4
{
  BOOL v7;
  id v8;
  _QWORD v10[7];
  objc_super v11;

  if (objc_msgSend(-[THApplicationDelegate urlSchemesNotRequiringUserPrompt](self, "urlSchemesNotRequiringUserPrompt"), "containsObject:", objc_msgSend(a3, "scheme")))
  {
    v11.receiver = self;
    v11.super_class = (Class)THApplicationDelegate;
    return -[THApplicationDelegate openURL:sourceDocumentRoot:](&v11, "openURL:sourceDocumentRoot:", a3, a4);
  }
  else
  {
    v8 = objc_msgSend(a4, "viewController");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_18867C;
    v10[3] = &unk_42A718;
    v10[4] = a3;
    v10[5] = a4;
    v10[6] = self;
    v7 = 1;
    -[BCExternalURLOpenPrompter maybePromptUserBeforeOpeningExternalURL:shouldThrottle:promptContext:completion:](-[THApplicationDelegate externalURLOpenPrompter](self, "externalURLOpenPrompter"), "maybePromptUserBeforeOpeningExternalURL:shouldThrottle:promptContext:completion:", a3, 1, v8, v10);
  }
  return v7;
}

- (id)urlSchemesNotRequiringUserPrompt
{
  if (qword_543310 != -1)
    dispatch_once(&qword_543310, &stru_42A738);
  return (id)qword_543308;
}

- (BOOL)shouldAuthorizeURLToLoad:(id)a3 loadContext:(id)a4 completion:(id)a5
{
  if ((objc_msgSend(-[THApplicationDelegate urlSchemesNotRequiringUserPrompt](self, "urlSchemesNotRequiringUserPrompt"), "containsObject:", objc_msgSend(a3, "scheme")) & 1) != 0)return 1;
  else
    return -[BCExternalURLOpenPrompter maybePromptUserBeforeOpeningExternalURL:shouldThrottle:promptContext:completion:](-[THApplicationDelegate externalURLLoadPrompter](self, "externalURLLoadPrompter"), "maybePromptUserBeforeOpeningExternalURL:shouldThrottle:promptContext:completion:", a3, 0, a4, a5);
}

- (BCExternalURLOpenPrompter)externalURLOpenPrompter
{
  BCExternalURLOpenPrompter *result;

  result = self->_externalURLOpenPrompter;
  if (!result)
  {
    self->_externalURLOpenPrompter = (BCExternalURLOpenPrompter *)objc_alloc_init((Class)BCExternalURLOpenPrompter);
    -[BCExternalURLOpenPrompter setPromptTitle:](self->_externalURLOpenPrompter, "setPromptTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Leave Books and open this link?"), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setCancelButtonTitle:](self->_externalURLOpenPrompter, "setCancelButtonTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setOkButtonTitle:](self->_externalURLOpenPrompter, "setOkButtonTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Open"), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setDelegate:](self->_externalURLOpenPrompter, "setDelegate:", self);
    return self->_externalURLOpenPrompter;
  }
  return result;
}

- (BCExternalURLOpenPrompter)externalURLLoadPrompter
{
  BCExternalURLOpenPrompter *result;

  result = self->_externalURLLoadPrompter;
  if (!result)
  {
    self->_externalURLLoadPrompter = (BCExternalURLOpenPrompter *)objc_alloc_init((Class)BCExternalURLOpenPrompter);
    -[BCExternalURLOpenPrompter setPromptTitle:](self->_externalURLLoadPrompter, "setPromptTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Allow Online Content?"), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setPromptMessage:](self->_externalURLLoadPrompter, "setPromptMessage:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("This book needs to access online content, or it may not display as the publisher intended."), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setCancelButtonTitle:](self->_externalURLLoadPrompter, "setCancelButtonTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Don\\U2019t Allow"), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setOkButtonTitle:](self->_externalURLLoadPrompter, "setOkButtonTitle:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Allow"), &stru_43D7D8, 0));
    -[BCExternalURLOpenPrompter setCacheResponses:](self->_externalURLLoadPrompter, "setCacheResponses:", 0);
    -[BCExternalURLOpenPrompter setDelegate:](self->_externalURLLoadPrompter, "setDelegate:", self);
    return self->_externalURLLoadPrompter;
  }
  return result;
}

- (void)presentAlertController:(id)a3 promptContext:(id)a4
{
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  double v9;

  v6 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  v7 = objc_opt_class(UIViewController);
  *(_QWORD *)&v9 = TSUDynamicCast(v7, a4).n128_u64[0];
  if (v8)
    objc_msgSend(v8, "presentViewController:animated:completion:", a3, v6, 0, v9);
  else
    objc_msgSend(+[AEAssetEngine appInfoMgr](AEAssetEngine, "appInfoMgr", v9), "presentViewControllerOverMainCanvas:animated:completion:", a3, v6, 0);
}

- (NSMutableDictionary)bookDescriptionCache
{
  return self->_bookDescriptionCache;
}

- (void)setBookDescriptionCache:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setExternalURLOpenPrompter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void)setExternalURLLoadPrompter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
