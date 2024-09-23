@implementation _SVXDeviceSetupFlowSceneMutation

- (_SVXDeviceSetupFlowSceneMutation)init
{
  return -[_SVXDeviceSetupFlowSceneMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SVXDeviceSetupFlowSceneMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SVXDeviceSetupFlowSceneMutation *v6;
  _SVXDeviceSetupFlowSceneMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXDeviceSetupFlowSceneMutation;
  v6 = -[_SVXDeviceSetupFlowSceneMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setSceneID:(int64_t)a3
{
  self->_sceneID = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setDisplayKeyFrames:(id)a3
{
  objc_storeStrong((id *)&self->_displayKeyFrames, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)generate
{
  SVXDeviceSetupFlowScene *baseModel;
  SVXDeviceSetupFlowScene *v4;
  SVXDeviceSetupFlowScene *v5;
  int64_t sceneID;
  NSArray *v7;
  NSArray *v8;

  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v4 = -[SVXDeviceSetupFlowScene initWithSceneID:displayKeyFrames:]([SVXDeviceSetupFlowScene alloc], "initWithSceneID:displayKeyFrames:", self->_sceneID, self->_displayKeyFrames);
    goto LABEL_5;
  }
  if ((*(_BYTE *)&self->_mutationFlags & 1) != 0)
  {
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      sceneID = self->_sceneID;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
        goto LABEL_8;
    }
    else
    {
      sceneID = -[SVXDeviceSetupFlowScene sceneID](baseModel, "sceneID");
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_8:
        v7 = self->_displayKeyFrames;
LABEL_11:
        v8 = v7;
        v5 = -[SVXDeviceSetupFlowScene initWithSceneID:displayKeyFrames:]([SVXDeviceSetupFlowScene alloc], "initWithSceneID:displayKeyFrames:", sceneID, v7);

        return v5;
      }
    }
    -[SVXDeviceSetupFlowScene displayKeyFrames](self->_baseModel, "displayKeyFrames");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = (SVXDeviceSetupFlowScene *)-[SVXDeviceSetupFlowScene copy](baseModel, "copy");
LABEL_5:
  v5 = v4;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayKeyFrames, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
