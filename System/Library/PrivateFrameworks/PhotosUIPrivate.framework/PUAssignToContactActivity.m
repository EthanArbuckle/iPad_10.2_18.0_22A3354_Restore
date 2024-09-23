@implementation PUAssignToContactActivity

- (id)_systemImageName
{
  return CFSTR("person.crop.circle");
}

- (id)_embeddedActivityViewController
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAssignToContactActivity;
  -[UIAssignToContactActivity _embeddedActivityViewController](&v5, sel__embeddedActivityViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (id)activityViewController
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAssignToContactActivity;
  -[UIAssignToContactActivity activityViewController](&v5, sel_activityViewController);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setDelegate:", self);
  return v3;
}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (PXActivityItemSourceController)itemSourceController
{
  return (PXActivityItemSourceController *)objc_loadWeakRetained((id *)&self->_itemSourceController);
}

- (void)setItemSourceController:(id)a3
{
  objc_storeWeak((id *)&self->_itemSourceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_itemSourceController);
}

@end
