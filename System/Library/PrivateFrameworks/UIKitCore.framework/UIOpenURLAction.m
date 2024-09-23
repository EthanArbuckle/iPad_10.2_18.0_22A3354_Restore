@implementation UIOpenURLAction

- (UIOpenURLAction)initWithURL:(id)a3 openURLOptions:(id)a4 workspaceOriginatingProcess:(id)a5 responder:(id)a6
{
  id v11;
  UIOpenURLAction *v12;
  UIOpenURLAction *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UIOpenURLAction;
  v12 = -[UISOpenURLAction initWithURL:workspaceOriginatingProcess:responder:](&v15, sel_initWithURL_workspaceOriginatingProcess_responder_, a3, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_localOpenURLOptions, a4);

  return v13;
}

- (UISceneOpenURLOptions)localOpenURLOptions
{
  return self->_localOpenURLOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localOpenURLOptions, 0);
}

@end
