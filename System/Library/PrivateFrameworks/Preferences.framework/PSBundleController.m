@implementation PSBundleController

- (id)specifiersWithSpecifier:(id)a3
{
  return 0;
}

- (PSBundleController)init
{
  return -[PSBundleController initWithParentListController:](self, "initWithParentListController:", 0);
}

- (PSBundleController)initWithParentListController:(id)a3
{
  id v4;
  PSBundleController *v5;
  PSBundleController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSBundleController;
  v5 = -[PSBundleController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_parent, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

@end
