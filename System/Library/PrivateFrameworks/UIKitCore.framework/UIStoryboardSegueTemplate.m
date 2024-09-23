@implementation UIStoryboardSegueTemplate

- (UIStoryboardSegueTemplate)init
{
  UIStoryboardSegueTemplate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStoryboardSegueTemplate;
  result = -[UIStoryboardSegueTemplate init](&v3, sel_init);
  if (result)
  {
    result->_animates = 1;
    result->_prepareForChildViewControllerSelector = 0;
  }
  return result;
}

- (UIStoryboardSegueTemplate)initWithCoder:(id)a3
{
  id v4;
  UIStoryboardSegueTemplate *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *segueClassName;
  void *v12;
  uint64_t v13;
  NSString *destinationViewControllerIdentifier;
  char v15;
  NSString *v16;
  NSString *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIStoryboardSegueTemplate;
  v5 = -[UIStoryboardSegueTemplate init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UISegueClassName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    segueClassName = v5->_segueClassName;
    v5->_segueClassName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDestinationViewControllerIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    destinationViewControllerIdentifier = v5->_destinationViewControllerIdentifier;
    v5->_destinationViewControllerIdentifier = (NSString *)v13;

    v5->_performOnViewLoad = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIPerformOnViewLoad"));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UIAnimates")))
      v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIAnimates"));
    else
      v15 = 1;
    v5->_animates = v15;
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UICustomPrepareForChildViewControllersSegueName"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v16 = (NSString *)NSSelectorFromString(v16);
    v5->_prepareForChildViewControllerSelector = (SEL)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  NSString *segueClassName;
  const char *prepareForChildViewControllerSelector;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  identifier = self->_identifier;
  v10 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("UIIdentifier"));
    v4 = v10;
  }
  segueClassName = self->_segueClassName;
  if (segueClassName)
  {
    objc_msgSend(v10, "encodeObject:forKey:", segueClassName, CFSTR("UISegueClassName"));
    v4 = v10;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_destinationViewControllerIdentifier, CFSTR("UIDestinationViewControllerIdentifier"));
  if (self->_performOnViewLoad)
    objc_msgSend(v10, "encodeBool:forKey:", 1, CFSTR("UIPerformOnViewLoad"));
  if (!self->_animates)
    objc_msgSend(v10, "encodeBool:forKey:", 0, CFSTR("UIAnimates"));
  prepareForChildViewControllerSelector = self->_prepareForChildViewControllerSelector;
  v8 = v10;
  if (prepareForChildViewControllerSelector)
  {
    NSStringFromSelector(prepareForChildViewControllerSelector);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("UICustomPrepareForChildViewControllersSegueName"));

    v8 = v10;
  }

}

- (NSString)customPrepareForChildViewControllerSelectorName
{
  return NSStringFromSelector(self->_prepareForChildViewControllerSelector);
}

- (void)setCustomPrepareForChildViewControllerSelectorName:(id)a3
{
  self->_prepareForChildViewControllerSelector = NSSelectorFromString((NSString *)a3);
}

- (SEL)prepareForChildViewControllerSelector
{
  return self->_prepareForChildViewControllerSelector;
}

- (id)newDefaultPrepareHandlerForSegue:(id)a3
{
  return 0;
}

- (id)newDefaultPerformHandlerForSegue:(id)a3
{
  return 0;
}

- (id)instantiateOrFindDestinationViewControllerWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storyboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_instantiateViewControllerWithIdentifier:creator:storyboardSegueTemplate:sender:", self->_destinationViewControllerIdentifier, 0, self, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)segueWithDestinationViewController:(id)a3
{
  id v5;
  NSString *segueClassName;
  objc_class *v7;
  void *v8;
  id v9;
  NSString *identifier;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  segueClassName = self->_segueClassName;
  if (segueClassName)
  {
    v7 = NSClassFromString(segueClassName);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardSegueTemplate.m"), 104, CFSTR("Could not create a segue of class '%@'"), 0);

      v7 = 0;
    }
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
  }
  v9 = [v7 alloc];
  identifier = self->_identifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  v12 = (void *)objc_msgSend(v9, "initWithIdentifier:source:destination:", identifier, WeakRetained, v5);

  -[UIStoryboardSegueTemplate newDefaultPrepareHandlerForSegue:](self, "newDefaultPrepareHandlerForSegue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPrepareHandler:", v13);
  -[UIStoryboardSegueTemplate newDefaultPerformHandlerForSegue:](self, "newDefaultPerformHandlerForSegue:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPerformHandler:", v14);

  return v12;
}

- (id)_perform:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UIStoryboardSegueTemplate instantiateOrFindDestinationViewControllerWithSender:](self, "instantiateOrFindDestinationViewControllerWithSender:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardSegueTemplate _performWithDestinationViewController:sender:](self, "_performWithDestinationViewController:sender:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_performWithDestinationViewController:(id)a3 sender:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v12;

  v7 = a4;
  -[UIStoryboardSegueTemplate segueWithDestinationViewController:](self, "segueWithDestinationViewController:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIStoryboardSegueTemplate.m"), 126, CFSTR("Failed to create a segue"));

  }
  objc_msgSend(v8, "setSender:", v7);
  objc_msgSend(v8, "_prepare");
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareForSegue:sender:", v8, v7);

  v10 = +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", -[UIStoryboardSegueTemplate animates](self, "animates"));
  objc_msgSend(v8, "perform");
  +[UIView setAnimationsEnabled:](UIView, "setAnimationsEnabled:", v10);
  objc_msgSend(v8, "setSender:", 0);
  return v8;
}

- (id)perform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  -[UIStoryboardSegueTemplate viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStoryboardSegueTemplate identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "shouldPerformSegueWithIdentifier:sender:", v6, v4);

  if (v7)
  {
    -[UIStoryboardSegueTemplate _perform:](self, "_perform:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void)setViewController:(id)a3
{
  objc_storeWeak((id *)&self->_viewController, a3);
}

- (BOOL)performOnViewLoad
{
  return self->_performOnViewLoad;
}

- (void)setPerformOnViewLoad:(BOOL)a3
{
  self->_performOnViewLoad = a3;
}

- (BOOL)animates
{
  return self->_animates;
}

- (void)setAnimates:(BOOL)a3
{
  self->_animates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationViewControllerIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_segueClassName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
