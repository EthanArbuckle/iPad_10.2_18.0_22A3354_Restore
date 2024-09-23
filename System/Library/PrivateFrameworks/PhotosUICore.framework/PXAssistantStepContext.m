@implementation PXAssistantStepContext

- (PXAssistantStepContext)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantStepContext.m"), 21, CFSTR("%s is not available as initializer"), "-[PXAssistantStepContext init]");

  abort();
}

- (PXAssistantStepContext)initWithIdentifier:(id)a3 viewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXAssistantStepContext *v10;
  uint64_t v11;
  NSString *identifier;
  NSString *firstButtonTitle;
  NSString *customSecondButtonTitle;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantStepContext.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantStepContext.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)PXAssistantStepContext;
  v10 = -[PXAssistantStepContext init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_viewController, a4);
    v10->_firstButtonType = 0;
    firstButtonTitle = v10->_firstButtonTitle;
    v10->_firstButtonTitle = (NSString *)&stru_1E5149688;

    v10->_firstButtonEnabled = 1;
    v10->_secondButtonType = 0;
    customSecondButtonTitle = v10->_customSecondButtonTitle;
    v10->_customSecondButtonTitle = (NSString *)&stru_1E5149688;

    v10->_secondButtonEnabled = 1;
    v10->_useTransparentBarAppearance = 1;
  }

  return v10;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssistantStepContext;
  -[PXAssistantStepContext performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setFirstButtonType:(int64_t)a3
{
  if (self->_firstButtonType != a3)
  {
    self->_firstButtonType = a3;
    -[PXAssistantStepContext signalChange:](self, "signalChange:", 1);
  }
}

- (void)setFirstButtonTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *firstButtonTitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantStepContext.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstButtonTitle"));

  }
  v5 = self->_firstButtonTitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      firstButtonTitle = self->_firstButtonTitle;
      self->_firstButtonTitle = v8;

      -[PXAssistantStepContext signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setFirstButtonEnabled:(BOOL)a3
{
  if (self->_firstButtonEnabled != a3)
  {
    self->_firstButtonEnabled = a3;
    -[PXAssistantStepContext signalChange:](self, "signalChange:", 4);
  }
}

- (void)setSecondButtonType:(int64_t)a3
{
  if (self->_secondButtonType != a3)
  {
    self->_secondButtonType = a3;
    -[PXAssistantStepContext signalChange:](self, "signalChange:", 8);
  }
}

- (void)setCustomSecondButtonTitle:(id)a3
{
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *customSecondButtonTitle;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssistantStepContext.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customSecondButtonTitle"));

  }
  v5 = self->_customSecondButtonTitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v11);

    if (!v7)
    {
      v8 = (NSString *)-[NSString copy](v11, "copy");
      customSecondButtonTitle = self->_customSecondButtonTitle;
      self->_customSecondButtonTitle = v8;

      -[PXAssistantStepContext signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setSecondButtonEnabled:(BOOL)a3
{
  if (self->_secondButtonEnabled != a3)
  {
    self->_secondButtonEnabled = a3;
    -[PXAssistantStepContext signalChange:](self, "signalChange:", 16);
  }
}

- (void)setUseTransparentBarAppearance:(BOOL)a3
{
  if (self->_useTransparentBarAppearance != a3)
  {
    self->_useTransparentBarAppearance = a3;
    -[PXAssistantStepContext signalChange:](self, "signalChange:", 512);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (int64_t)firstButtonType
{
  return self->_firstButtonType;
}

- (NSString)firstButtonTitle
{
  return self->_firstButtonTitle;
}

- (BOOL)firstButtonEnabled
{
  return self->_firstButtonEnabled;
}

- (int64_t)secondButtonType
{
  return self->_secondButtonType;
}

- (NSString)customSecondButtonTitle
{
  return self->_customSecondButtonTitle;
}

- (BOOL)secondButtonEnabled
{
  return self->_secondButtonEnabled;
}

- (BOOL)useTransparentBarAppearance
{
  return self->_useTransparentBarAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSecondButtonTitle, 0);
  objc_storeStrong((id *)&self->_firstButtonTitle, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
