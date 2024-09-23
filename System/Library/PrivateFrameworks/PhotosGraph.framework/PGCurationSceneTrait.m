@implementation PGCurationSceneTrait

- (PGCurationSceneTrait)initWithSceneNames:(id)a3
{
  id v5;
  PGCurationSceneTrait *v6;
  PGCurationSceneTrait *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CLSSceneConfidenceThresholdHelper *helper;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGCurationSceneTrait;
  v6 = -[PGCurationTrait init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneNames, a3);
    v8 = objc_alloc(MEMORY[0x1E0D77E28]);
    -[NSSet allObjects](v7->_sceneNames, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithSceneNames:thresholdType:", v9, 5);
    helper = v7->_helper;
    v7->_helper = (CLSSceneConfidenceThresholdHelper *)v10;

  }
  return v7;
}

- (BOOL)isActive
{
  return 1;
}

- (id)confidenceThresholdBySceneIdentifierWithCurationModel:(id)a3
{
  return (id)-[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_helper, "confidenceThresholdBySceneIdentifierWithCurationModel:", a3);
}

- (NSSet)sceneNames
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)targetNumberOfMatches
{
  return self->_targetNumberOfMatches;
}

- (void)setTargetNumberOfMatches:(unint64_t)a3
{
  self->_targetNumberOfMatches = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneNames, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

@end
