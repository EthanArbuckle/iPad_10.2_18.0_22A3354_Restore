@implementation STUFrontBoardBackedAppLauncher

- (void)openBundleIdentifier:(id)a3 primitives:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  STULaunchAppConfiguration *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[STULaunchAppConfiguration initWithBundleIdentifier:]([STULaunchAppConfiguration alloc], "initWithBundleIdentifier:", v10);

  -[STUFrontBoardBackedAppLauncher openConfiguration:primitives:completion:](self, "openConfiguration:primitives:completion:", v11, v9, v8);
}

- (void)openConfiguration:(id)a3 primitives:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  STUOpenAppUsingFrontBoardOperation *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v13 = -[STUOpenAppUsingFrontBoardOperation initWithConfiguration:primitives:]([STUOpenAppUsingFrontBoardOperation alloc], "initWithConfiguration:primitives:", v10, v9);

  v11 = objc_retainBlock(v8);
  -[STUOpenAppUsingFrontBoardOperation addTarget:selector:forOperationEvents:userInfo:](v13, "addTarget:selector:forOperationEvents:userInfo:", self, "openOperationDidFinish:completion:", 6, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v12, "addOperation:", v13);

}

- (void)openOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "error"));
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

@end
