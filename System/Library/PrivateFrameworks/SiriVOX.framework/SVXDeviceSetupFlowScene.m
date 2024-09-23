@implementation SVXDeviceSetupFlowScene

- (SVXDeviceSetupFlowScene)initWithSceneID:(int64_t)a3 displayKeyFrames:(id)a4
{
  id v6;
  SVXDeviceSetupFlowScene *v7;
  SVXDeviceSetupFlowScene *v8;
  uint64_t v9;
  NSArray *displayKeyFrames;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXDeviceSetupFlowScene;
  v7 = -[SVXDeviceSetupFlowScene init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_sceneID = a3;
    v9 = objc_msgSend(v6, "copy");
    displayKeyFrames = v8->_displayKeyFrames;
    v8->_displayKeyFrames = (NSArray *)v9;

  }
  return v8;
}

- (id)description
{
  return -[SVXDeviceSetupFlowScene _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t sceneID;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v11.receiver = self;
  v11.super_class = (Class)SVXDeviceSetupFlowScene;
  -[SVXDeviceSetupFlowScene description](&v11, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sceneID = self->_sceneID;
  if (sceneID > 9)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_24D24E738[sceneID];
  v8 = v7;
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {sceneID = %@, displayKeyFrames = %@}"), v5, v8, self->_displayKeyFrames);

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sceneID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSArray hash](self->_displayKeyFrames, "hash") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeviceSetupFlowScene *v4;
  SVXDeviceSetupFlowScene *v5;
  int64_t sceneID;
  NSArray *v7;
  NSArray *displayKeyFrames;
  BOOL v9;

  v4 = (SVXDeviceSetupFlowScene *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sceneID = self->_sceneID;
      if (sceneID == -[SVXDeviceSetupFlowScene sceneID](v5, "sceneID"))
      {
        -[SVXDeviceSetupFlowScene displayKeyFrames](v5, "displayKeyFrames");
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
        displayKeyFrames = self->_displayKeyFrames;
        v9 = displayKeyFrames == v7 || -[NSArray isEqual:](displayKeyFrames, "isEqual:", v7);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (SVXDeviceSetupFlowScene)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SVXDeviceSetupFlowScene *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceSetupFlowScene::sceneID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("SVXDeviceSetupFlowScene::displayKeyFrames"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SVXDeviceSetupFlowScene initWithSceneID:displayKeyFrames:](self, "initWithSceneID:displayKeyFrames:", v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t sceneID;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  sceneID = self->_sceneID;
  v7 = a3;
  objc_msgSend(v4, "numberWithInteger:", sceneID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("SVXDeviceSetupFlowScene::sceneID"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_displayKeyFrames, CFSTR("SVXDeviceSetupFlowScene::displayKeyFrames"));
}

- (int64_t)sceneID
{
  return self->_sceneID;
}

- (NSArray)displayKeyFrames
{
  return self->_displayKeyFrames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayKeyFrames, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeviceSetupFlowSceneMutation *);
  _SVXDeviceSetupFlowSceneMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeviceSetupFlowSceneMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeviceSetupFlowSceneMutation initWithBaseModel:]([_SVXDeviceSetupFlowSceneMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeviceSetupFlowSceneMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeviceSetupFlowScene copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeviceSetupFlowSceneMutation *);
  _SVXDeviceSetupFlowSceneMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeviceSetupFlowSceneMutation *))a3;
  v4 = objc_alloc_init(_SVXDeviceSetupFlowSceneMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeviceSetupFlowSceneMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
