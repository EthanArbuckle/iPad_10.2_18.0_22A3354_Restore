@implementation STUConcreteFBSPrimitives_iOS

- (void)openApplication:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationService serviceWithDefaultShellEndpoint](FBSOpenApplicationService, "serviceWithDefaultShellEndpoint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteFBSPrimitives_iOS optionsFromSTUOptions:](self, "optionsFromSTUOptions:", v9));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100054F30;
  v14[3] = &unk_1000CB458;
  v15 = v8;
  v13 = v8;
  objc_msgSend(v11, "openApplication:withOptions:completion:", v10, v12, v14);

}

- (id)optionsFromSTUOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteFBSPrimitives_iOS makeOptionsDictionary](self, "makeOptionsDictionary"));
  v7 = objc_msgSend(v5, "initWithDictionary:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activities"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activities"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteFBSPrimitives_iOS actionsFromSTUActivities:](self, "actionsFromSTUActivities:", v9));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, FBSOpenApplicationOptionKeyActions);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FBSOpenApplicationOptions optionsWithDictionary:](FBSOpenApplicationOptions, "optionsWithDictionary:", v7));

  return v11;
}

- (id)makeOptionsDictionary
{
  NSMutableDictionary *v2;
  id v3;

  v2 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyUnlockDevice);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, FBSOpenApplicationOptionKeyPromptUnlockDevice);
  v3 = -[NSMutableDictionary copy](v2, "copy");

  return v3;
}

- (id)actionsFromSTUActivities:(id)a3
{
  return objc_msgSend(a3, "crk_mapUsingBlock:", &stru_1000CB498);
}

@end
