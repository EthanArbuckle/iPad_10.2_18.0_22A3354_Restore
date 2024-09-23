@implementation SUScriptStorePageNativeObject

- (void)setupNativeObject
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__webViewControllerNote_, CFSTR("SUWebViewControllerDidStartLoad"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__webViewControllerNote_, CFSTR("SUWebViewControllerDidFinishLoad"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__webViewControllerNote_, CFSTR("SUWebViewControllerDidFailLoad"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SUScriptStorePageNativeObject;
  -[SUScriptViewControllerNativeObject setupNativeObject](&v4, sel_setupNativeObject);

}

- (void)destroyNativeObject
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SUScriptStorePageNativeObject;
  -[SUScriptViewControllerNativeObject destroyNativeObject](&v4, sel_destroyNativeObject);
}

- (void)_webViewControllerNote:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptNativeObject object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDescendantOfViewController:", v5);

  if (v6)
  {
    -[SUScriptNativeObject scriptObject](self, "scriptObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUScriptStorePageNativeObject _eventNameForNote:](self, "_eventNameForNote:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchEvent:forName:", 0, v9);

  }
}

- (id)_eventNameForNote:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("SUWebViewControllerDidStartLoad")) & 1) != 0)
  {
    v4 = CFSTR("didstartload");
  }
  else if ((objc_msgSend(v3, "isEqual:", CFSTR("SUWebViewControllerDidFinishLoad")) & 1) != 0)
  {
    v4 = CFSTR("didfinishload");
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("SUWebViewControllerDidFailLoad")))
  {
    v4 = CFSTR("didfailload");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

@end
