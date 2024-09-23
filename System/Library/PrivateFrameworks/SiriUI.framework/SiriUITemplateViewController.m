@implementation SiriUITemplateViewController

+ (id)templateViewControllerForTemplateModel:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "templateViewControllerClass")), "_initWithTemplateModel:", v3);

  return v4;
}

- (id)_initWithTemplateModel:(id)a3
{
  id v5;
  SiriUITemplateViewController *v6;
  SiriUITemplateViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SiriUITemplateViewController;
  v6 = -[SiriUITemplateViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templateModel, a3);
    v7->_active = 1;
  }

  return v7;
}

- (void)loadView
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUITemplateViewController;
  -[SiriUITemplateViewController loadView](&v7, sel_loadView);
  -[SiriUITemplateViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_254F164A0);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SiriUITemplateViewController.m"), 32, CFSTR("The 'view' property of this class must conform to SiriUITemplateView."));

  }
}

- (SiriUITemplateModelPrivate)templateModelPrivate
{
  SiriUITemplateModel *v3;

  if (-[SiriUITemplateModel conformsToProtocol:](self->_templateModel, "conformsToProtocol:", &unk_254F586C8))v3 = self->_templateModel;
  else
    v3 = 0;
  return v3;
}

- (void)setCompressed:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_compressed != a3)
  {
    self->_compressed = a3;
    -[SiriUITemplateViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[SiriUITemplateViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNeedsUpdateConstraints");

  }
}

- (SiriUITemplateModel)templateModel
{
  return self->_templateModel;
}

- (void)setTemplateModel:(id)a3
{
  objc_storeStrong((id *)&self->_templateModel, a3);
}

- (SiriUITemplateViewControllerDelegate)delegate
{
  return (SiriUITemplateViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isCompressed
{
  return self->_compressed;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_templateModel, 0);
}

@end
