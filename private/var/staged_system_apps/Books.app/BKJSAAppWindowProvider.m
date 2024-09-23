@implementation BKJSAAppWindowProvider

- (UIWindow)keyWindow
{
  return (UIWindow *)+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
}

- (BKJSAAppWindowProvider)initWithSceneManager:(id)a3
{
  id v4;
  BKJSAAppWindowProvider *v5;
  BKJSAAppWindowProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKJSAAppWindowProvider;
  v5 = -[BKJSAAppWindowProvider init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sceneManager, v4);

  return v6;
}

- (id)windowFromOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", BCTransactionOptionsTransactionKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originatingSceneController"));
  v7 = BUProtocolCast(&OBJC_PROTOCOL___BKSceneControlling, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneControllerUtilities sceneTypeKey](BKSceneControllerUtilities, "sceneTypeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v9));

  if (v5)
    v11 = 1;
  else
    v11 = v10 == 0;
  if (v11)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_window"));
  }
  else
  {
    v12 = +[BKSceneControllerUtilities sceneTypeFrom:](BKSceneControllerUtilities, "sceneTypeFrom:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKJSAAppWindowProvider sceneManager](self, "sceneManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKSceneControllerUtilities assetIDKey](BKSceneControllerUtilities, "assetIDKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "windowFromSceneType:assetID:", v12, v15));

  }
  return v16;
}

- (BKAppSceneManager)sceneManager
{
  return (BKAppSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (void)setSceneManager:(id)a3
{
  objc_storeWeak((id *)&self->_sceneManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneManager);
}

@end
