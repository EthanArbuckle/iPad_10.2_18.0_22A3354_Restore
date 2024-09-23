@implementation THWSCNCameraControlEventHandler

- (THWSCNCameraControlEventHandler)initWithSceneController:(id)a3
{
  THWSCNCameraControlEventHandler *v4;
  THWSCNCameraControlEventHandler *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWSCNCameraControlEventHandler;
  v4 = -[THWSCNCameraControlEventHandler init](&v7, "init");
  v5 = v4;
  if (v4)
    -[THWSCNCameraControlEventHandler setSceneController:](v4, "setSceneController:", a3);
  return v5;
}

- (THWSceneController)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
  self->_sceneController = (THWSceneController *)a3;
}

- (BOOL)mouseWasDragged
{
  return self->_mouseWasDragged;
}

- (void)setMouseWasDragged:(BOOL)a3
{
  self->_mouseWasDragged = a3;
}

@end
