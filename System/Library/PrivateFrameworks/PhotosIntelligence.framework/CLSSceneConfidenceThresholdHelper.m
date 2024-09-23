@implementation CLSSceneConfidenceThresholdHelper

- (CLSSceneConfidenceThresholdHelper)initWithSceneNames:(id)a3 thresholdType:(unint64_t)a4
{
  id v6;
  CLSSceneConfidenceThresholdHelper *v7;
  CLSSceneConfidenceThresholdHelper *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSSceneConfidenceThresholdHelper;
  v7 = -[CLSSceneConfidenceThresholdHelper init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CLSSceneConfidenceThresholdHelper _commonInitWithSceneNames:thresholdType:](v7, "_commonInitWithSceneNames:thresholdType:", v6, a4);
    v8->_useEntityNet = 0;
  }

  return v8;
}

- (id)initForEntityNetWithSceneNames:(id)a3 thresholdType:(unint64_t)a4
{
  id v6;
  CLSSceneConfidenceThresholdHelper *v7;
  CLSSceneConfidenceThresholdHelper *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSSceneConfidenceThresholdHelper;
  v7 = -[CLSSceneConfidenceThresholdHelper init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CLSSceneConfidenceThresholdHelper _commonInitWithSceneNames:thresholdType:](v7, "_commonInitWithSceneNames:thresholdType:", v6, a4);
    v8->_useEntityNet = 1;
  }

  return v8;
}

- (void)_commonInitWithSceneNames:(id)a3 thresholdType:(unint64_t)a4
{
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *confidenceThresholdBySceneIdentifierBySceneModelIdentifier;

  objc_storeStrong((id *)&self->_sceneNames, a3);
  v7 = a3;
  self->_thresholdType = a4;
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  confidenceThresholdBySceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier = v8;

  self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock._os_unfair_lock_opaque = 0;
}

- (id)confidenceThresholdBySceneIdentifierWithCurationModel:(id)a3
{
  os_unfair_lock_s *p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock = &self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock;
  v5 = a3;
  os_unfair_lock_lock(p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock);
  if (self->_useEntityNet)
    objc_msgSend(v5, "entityNetModel");
  else
    objc_msgSend(v5, "sceneModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v6, "confidenceThresholdBySceneIdentifierForSceneNames:withThresholdType:", self->_sceneNames, self->_thresholdType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier, "setObject:forKeyedSubscript:", v8, v7);
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBD1B8];
  }
  os_unfair_lock_unlock(p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneNames, 0);
}

@end
