@implementation _UIIntelligenceBaseSceneSpecification

- (id)uiSceneSessionRole
{
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIIntelligenceLightSourceSceneSpecification.m"), 22, CFSTR("Subclass must override uiSceneSessionRole"));

  v6.receiver = self;
  v6.super_class = (Class)_UIIntelligenceBaseSceneSpecification;
  -[UIApplicationSceneSpecification uiSceneSessionRole](&v6, sel_uiSceneSessionRole);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultExtensions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)_UIIntelligenceBaseSceneSpecification;
  -[UIApplicationSceneSpecification defaultExtensions](&v7, sel_defaultExtensions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
