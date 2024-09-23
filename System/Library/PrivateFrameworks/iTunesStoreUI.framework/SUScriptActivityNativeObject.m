@implementation SUScriptActivityNativeObject

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setITunesStoreDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivityNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setITunesStoreDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptActivityNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v3, sel_setupNativeObject);
}

- (BOOL)activity:(id)a3 canPerformWithActivityItems:(id)a4
{
  return 1;
}

- (void)activity:(id)a3 prepareWithActivityItems:(id)a4
{
  -[SUScriptObject _performActionFunctionWithItems:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "_performActionFunctionWithItems:", a4);
}

- (void)performActionForActivity:(id)a3
{
  objc_msgSend(a3, "activityDidFinish:", 1);
}

@end
