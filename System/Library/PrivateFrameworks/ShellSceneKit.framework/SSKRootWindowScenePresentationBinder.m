@implementation SSKRootWindowScenePresentationBinder

- (SSKRootWindowScenePresentationBinder)initWithIdentifier:(id)a3 priority:(int64_t)a4 appearanceStyle:(unint64_t)a5 rootWindow:(id)a6
{
  id v11;
  SSKRootWindowScenePresentationBinder *v12;
  SSKRootWindowScenePresentationBinder *v13;
  uint64_t v14;
  FBSDisplayConfiguration *displayConfiguration;
  objc_super v17;

  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SSKRootWindowScenePresentationBinder;
  v12 = -[UIRootWindowScenePresentationBinder initWithIdentifier:priority:appearanceStyle:rootWindow:](&v17, sel_initWithIdentifier_priority_appearanceStyle_rootWindow_, a3, a4, a5, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rootWindow, a6);
    objc_msgSend(v11, "displayConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    displayConfiguration = v13->_displayConfiguration;
    v13->_displayConfiguration = (FBSDisplayConfiguration *)v14;

  }
  return v13;
}

- (UIRootSceneWindow)rootWindow
{
  return self->_rootWindow;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_rootWindow, 0);
}

@end
