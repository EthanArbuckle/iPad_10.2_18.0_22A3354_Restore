@implementation SUScriptSegmentedControlNativeObject

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControlNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "addTarget:action:forEvents:", self, sel__valueChanged_, 4096);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSegmentedControlNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v3, sel_setupNativeObject);
}

- (void)_valueChanged:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("valuechange"));
}

@end
