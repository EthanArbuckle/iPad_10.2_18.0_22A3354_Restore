@implementation _BKBookSceneControllerProvider

- (_BKBookSceneControllerProvider)initWithSceneManager:(id)a3 requestAssetID:(id)a4
{
  id v6;
  id v7;
  _BKBookSceneControllerProvider *v8;
  _BKBookSceneControllerProvider *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BKBookSceneControllerProvider;
  v8 = -[_BKBookSceneControllerProvider init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_sceneManager, v6);
    objc_storeStrong((id *)&v9->_requestAssetID, a4);
  }

  return v9;
}

- (void)provideSceneController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBookSceneControllerProvider sceneManager](self, "sceneManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBookSceneControllerProvider requestAssetID](self, "requestAssetID"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10019A5A4;
  v8[3] = &unk_1008EDBF0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "requestBookSceneWithAssetID:completion:", v6, v8);

}

- (BOOL)sceneSupportsMinifiedPresenting
{
  return 0;
}

- (BKAppSceneManager)sceneManager
{
  return (BKAppSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (void)setSceneManager:(id)a3
{
  objc_storeWeak((id *)&self->_sceneManager, a3);
}

- (NSString)requestAssetID
{
  return self->_requestAssetID;
}

- (void)setRequestAssetID:(id)a3
{
  objc_storeStrong((id *)&self->_requestAssetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAssetID, 0);
  objc_destroyWeak((id *)&self->_sceneManager);
}

@end
