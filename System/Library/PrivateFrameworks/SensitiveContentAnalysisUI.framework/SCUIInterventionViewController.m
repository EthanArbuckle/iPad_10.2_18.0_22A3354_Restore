@implementation SCUIInterventionViewController

- (SCUIInterventionViewController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v8;
  SCUIInterventionViewController *v9;

  v8 = a4;
  v9 = -[SCUIInterventionViewController initWithWorkflow:contextDictionary:options:type:](self, "initWithWorkflow:contextDictionary:options:type:", a3, v8, a5, SCUICurrentInterventionType());

  return v9;
}

- (SCUIInterventionViewController)initWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5 type:(int64_t)a6
{
  NSDictionary *v9;
  NSDictionary *contextDictionary;
  void *v11;
  SCUIInterventionViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  self->_workflow = a3;
  v9 = (NSDictionary *)objc_msgSend(a4, "copy");
  contextDictionary = self->_contextDictionary;
  self->_contextDictionary = v9;

  self->_options = a5;
  self->_type = a6;
  -[SCUIInterventionViewController rootScreenWithContainer:](self, "rootScreenWithContainer:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)SCUIInterventionViewController;
  v12 = -[SCUIInterventionViewController initWithRootViewController:](&v20, sel_initWithRootViewController_, v11);

  if (v12)
  {
    -[SCUIInterventionViewController navigationBar](v12, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "standardAppearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    objc_msgSend(v15, "configureWithTransparentBackground");
    -[SCUIInterventionViewController navigationBar](v12, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setScrollEdgeAppearance:", v15);

    -[SCUIInterventionViewController navigationBar](v12, "navigationBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStandardAppearance:", v15);

    -[SCUIInterventionViewController navigationBar](v12, "navigationBar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCompactAppearance:", v15);

  }
  return v12;
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4
{
  return (id)objc_msgSend(a1, "viewControllerWithWorkflow:contextDictionary:options:", a3, a4, 0);
}

+ (id)viewControllerWithWorkflow:(int64_t)a3 contextDictionary:(id)a4 options:(int64_t)a5
{
  id v7;
  void *v8;

  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithWorkflow:contextDictionary:options:", a3, v7, a5);

  return v8;
}

- (id)rootScreenWithContainer:(id)a3
{
  return -[SCUIInterventionScreenViewController initWithContainer:contentScreen:options:]([SCUIInterventionScreenViewController alloc], "initWithContainer:contentScreen:options:", self, 0, -[SCUIInterventionViewController options](self, "options") | 1);
}

- (int64_t)workflow
{
  return self->_workflow;
}

- (SCUIInterventionViewControllerDelegate)interventionDelegate
{
  return (SCUIInterventionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_interventionDelegate);
}

- (void)setInterventionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interventionDelegate, a3);
}

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDictionary, 0);
  objc_destroyWeak((id *)&self->_interventionDelegate);
}

@end
