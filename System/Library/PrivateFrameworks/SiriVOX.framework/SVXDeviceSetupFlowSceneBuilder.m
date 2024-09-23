@implementation SVXDeviceSetupFlowSceneBuilder

- (id)build
{
  return -[SVXDeviceSetupFlowScene initWithSceneID:displayKeyFrames:]([SVXDeviceSetupFlowScene alloc], "initWithSceneID:displayKeyFrames:", self->_sceneID, 0);
}

- (int64_t)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(int64_t)a3
{
  self->_sceneID = a3;
}

@end
