@implementation _BKBaseSceneInfo

- (NSDictionary)userData
{
  return self->_userData;
}

- (NSString)openBookAssetID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneInfo userData](self, "userData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", BCContinuationActivityAssetIDKey));

  return (NSString *)v3;
}

- (_BKBaseSceneInfo)initWithSceneSession:(id)a3 userData:(id)a4
{
  id v7;
  id v8;
  _BKBaseSceneInfo *v9;
  uint64_t v10;
  NSString *sceneIdentifier;

  v7 = a3;
  v8 = a4;
  v9 = -[_BKBaseSceneInfo init](self, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentIdentifier"));
    sceneIdentifier = v9->_sceneIdentifier;
    v9->_sceneIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_sceneSession, a3);
    objc_storeStrong((id *)&v9->_userData, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_destroyWeak((id *)&self->_sceneController);
  objc_storeStrong((id *)&self->_sceneSession, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

- (BOOL)supportsOpeningToAuxiliaryScene
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  char v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneInfo userData](self, "userData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BKSceneInfoIsAudiobookKey")));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BKBaseSceneInfo openBookAssetID](self, "openBookAssetID"));
  if (v6)
    v7 = v5 ^ 1;
  else
    v7 = 0;

  return v7;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UISceneSession)sceneSession
{
  return self->_sceneSession;
}

- (void)setSceneSession:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSession, a3);
}

- (BKSceneControlling)sceneController
{
  return (BKSceneControlling *)objc_loadWeakRetained((id *)&self->_sceneController);
}

- (void)setSceneController:(id)a3
{
  objc_storeWeak((id *)&self->_sceneController, a3);
}

- (void)setUserData:(id)a3
{
  objc_storeStrong((id *)&self->_userData, a3);
}

@end
