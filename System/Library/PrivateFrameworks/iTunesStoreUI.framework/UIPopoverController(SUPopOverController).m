@implementation UIPopoverController(SUPopOverController)

- (SUScriptPopOver)copyScriptPopOver
{
  SUScriptPopOver *v2;

  v2 = objc_alloc_init(SUScriptPopOver);
  -[SUScriptObject setNativeObject:](v2, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", a1));
  return v2;
}

@end
