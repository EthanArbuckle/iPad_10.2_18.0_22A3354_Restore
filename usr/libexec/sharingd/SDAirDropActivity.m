@implementation SDAirDropActivity

- (SDAirDropActivity)init
{
  SDAirDropActivity *v2;
  uint64_t v3;
  NSMutableArray *activeSecurityContexts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAirDropActivity;
  v2 = -[SDAirDropActivity init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    activeSecurityContexts = v2->_activeSecurityContexts;
    v2->_activeSecurityContexts = (NSMutableArray *)v3;

  }
  return v2;
}

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 0;
}

- (id)activityType
{
  return UIActivityTypeAirDrop;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (CGSize)_thumbnailSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v3 = SFSuggestedAirDropThumbnailSize(objc_msgSend(v2, "scale"));
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)_allowsAutoCancelOnDismiss
{
  return 0;
}

- (void)prepareWithActivityItemData:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "securityContexts", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SDAirDropActivity startAccessingSecurityScopedResourcesInContext:](self, "startAccessingSecurityScopedResourcesInContext:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)startAccessingSecurityScopedResourcesInContext:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "activate");
    -[NSMutableArray addObject:](self->_activeSecurityContexts, "addObject:", v4);

  }
}

- (void)stopAccessingSecurityScopedResources
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_activeSecurityContexts;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "deactivate", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_activeSecurityContexts, "removeAllObjects");
}

- (void)dealloc
{
  objc_super v3;

  -[SDAirDropActivity stopAccessingSecurityScopedResources](self, "stopAccessingSecurityScopedResources");
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropActivity;
  -[SDAirDropActivity dealloc](&v3, "dealloc");
}

- (NSString)sendingAppBundleID
{
  return self->_sendingAppBundleID;
}

- (void)setSendingAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_sendingAppBundleID, a3);
}

- (NSMutableArray)activeSecurityContexts
{
  return self->_activeSecurityContexts;
}

- (void)setActiveSecurityContexts:(id)a3
{
  objc_storeStrong((id *)&self->_activeSecurityContexts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSecurityContexts, 0);
  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
}

@end
