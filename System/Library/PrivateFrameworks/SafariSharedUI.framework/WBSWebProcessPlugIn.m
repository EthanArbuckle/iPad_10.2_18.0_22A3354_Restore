@implementation WBSWebProcessPlugIn

- (WKWebProcessPlugInController)plugInController
{
  return self->_plugInController;
}

- (void)webProcessPlugIn:(id)a3 didCreateBrowserContextController:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[WBSWebProcessPlugIn pageControllerWithBrowserContextController:](self, "pageControllerWithBrowserContextController:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_browserContextControllersToWebProcessPlugInPageControllers, "setObject:forKey:", v6, v5);
  -[WBSWebProcessPlugIn didCreatePageController:forBrowserContextController:](self, "didCreatePageController:forBrowserContextController:", v6, v5);

}

- (void)webProcessPlugIn:(id)a3 initializeWithObject:(id)a4
{
  NSMapTable *v6;
  NSMapTable *browserContextControllersToWebProcessPlugInPageControllers;
  id v8;

  objc_storeStrong((id *)&self->_plugInController, a3);
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  browserContextControllersToWebProcessPlugInPageControllers = self->_browserContextControllersToWebProcessPlugInPageControllers;
  self->_browserContextControllersToWebProcessPlugInPageControllers = v6;

}

- (NSArray)searchEnginesForRedirectToSafeSearch
{
  void *v2;
  void *v3;

  -[WKWebProcessPlugInController parameters](self->_plugInController, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("searchEnginesForRedirectToSafeSearch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (WBSSearchProvider)defaultSearchProvider
{
  void *v2;
  void *v3;

  -[WKWebProcessPlugInController parameters](self->_plugInController, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("defaultSearchEngine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSSearchProvider *)v3;
}

- (BOOL)isABTestingEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[WKWebProcessPlugInController parameters](self->_plugInController, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("abTestingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (unint64_t)abGroupIdentifier
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WKWebProcessPlugInController parameters](self->_plugInController, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("abGroupIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)pageControllerWithBrowserContextController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  __objc2_class **v8;
  void *v9;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_groupIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "pageGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("TouchIconExtractor"));
  v8 = off_1E54403C0;
  if (!v7)
    v8 = &off_1E5440490;
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithPlugIn:contextController:", self, v4);

  return v9;
}

- (void)webProcessPlugIn:(id)a3 willDestroyBrowserContextController:(id)a4
{
  NSMapTable *browserContextControllersToWebProcessPlugInPageControllers;
  id v6;
  id v7;

  browserContextControllersToWebProcessPlugInPageControllers = self->_browserContextControllersToWebProcessPlugInPageControllers;
  v6 = a4;
  -[NSMapTable objectForKey:](browserContextControllersToWebProcessPlugInPageControllers, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "willDestroyBrowserContextController:", v6);
  -[WBSWebProcessPlugIn willDestroyPageController:forBrowserContextController:](self, "willDestroyPageController:forBrowserContextController:", v7, v6);
  -[NSMapTable removeObjectForKey:](self->_browserContextControllersToWebProcessPlugInPageControllers, "removeObjectForKey:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plugInController, 0);
  objc_storeStrong((id *)&self->_browserContextControllersToWebProcessPlugInPageControllers, 0);
}

@end
