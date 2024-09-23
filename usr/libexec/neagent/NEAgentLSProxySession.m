@implementation NEAgentLSProxySession

- (void)fetchLSBundleProxyForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, void *, id);
  void *v6;
  id v7;
  id v8;

  v8 = 0;
  v5 = (void (**)(id, void *, id))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NELaunchServices lookupIdentifier:plugins:](NELaunchServices, "lookupIdentifier:plugins:", a3, &v8));
  v7 = v8;
  v5[2](v5, v6, v7);

}

- (void)fetchLSPluginBundleProxyWithIdentifier:(id)a3 type:(id)a4 pluginClass:(int64_t)a5 extensionPoint:(id)a6 completionHandler:(id)a7
{
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(id, id);

  v17 = (void (**)(id, id))a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NELaunchServices pluginProxyWithIdentifier:type:pluginClass:extensionPoint:](NELaunchServices, "pluginProxyWithIdentifier:type:pluginClass:extensionPoint:", a3, a4, a5, a6));
  if (v11)
  {
    v12 = objc_alloc((Class)NEBundleProxy);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "machOUUIDs"));
    v16 = objc_msgSend(v12, "initWithIdentifier:url:machOUUIDs:name:appGroups:", v13, v14, v15, 0, 0);

    v17[2](v17, v16);
  }
  else
  {
    v17[2](v17, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
