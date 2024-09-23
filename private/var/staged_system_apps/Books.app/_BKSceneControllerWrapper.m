@implementation _BKSceneControllerWrapper

- (_BKSceneControllerWrapper)initWithSceneController:(id)a3
{
  id v4;
  _BKSceneControllerWrapper *v5;
  _BKSceneControllerWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_BKSceneControllerWrapper;
  v5 = -[_BKSceneControllerWrapper init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_sceneController, v4);

  return v6;
}

- (BKSceneControlling)sceneController
{
  return (BKSceneControlling *)objc_loadWeakRetained((id *)&self->_sceneController);
}

- (void)setSceneController:(id)a3
{
  objc_storeWeak((id *)&self->_sceneController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneController);
}

@end
