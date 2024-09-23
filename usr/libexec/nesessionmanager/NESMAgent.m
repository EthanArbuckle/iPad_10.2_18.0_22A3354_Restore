@implementation NESMAgent

- (NESMAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NESMAgent;
  return -[NEAgent initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:](&v8, "initWithPluginType:pluginVersion:pluginClass:pluginInfo:userID:", a3, a4, a5, a6, a7);
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  id v7;
  NESMAgent *v8;
  void ***v9;
  int64_t pluginClass;
  void *v11;
  NSObject *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, char, void *, void *);
  void *v16;
  NESMAgent *v17;
  id v18;
  _QWORD block[5];
  NESMAgent *v20;
  id v21;
  void ***v22;

  v4 = a3;
  v5 = sub_10000C1FC();
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(v5);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100005C64;
  v16 = &unk_1000BD428;
  v17 = self;
  v18 = v4;
  v7 = v4;
  v8 = self;
  v9 = &v13;
  if (v6)
  {
    if (v8)
      pluginClass = v8->super._pluginClass;
    else
      pluginClass = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NELaunchServices pluginClassToExtensionPoint:](NELaunchServices, "pluginClassToExtensionPoint:", pluginClass, v13, v14));
    if (v11)
    {
      v12 = v6[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D150;
      block[3] = &unk_1000BD560;
      block[4] = v6;
      v20 = v8;
      v21 = v11;
      v22 = v9;
      dispatch_async(v12, block);

    }
    else
    {
      v15((uint64_t)v9, 0, 0, 0);
    }

  }
}

- (BOOL)isPerUser
{
  return 0;
}

- (BOOL)isLocal
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);
}

@end
