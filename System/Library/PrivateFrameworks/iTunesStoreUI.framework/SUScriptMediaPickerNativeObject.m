@implementation SUScriptMediaPickerNativeObject

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPickerNativeObject;
  -[SUScriptViewControllerNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  objc_super v3;

  objc_msgSend(-[SUScriptNativeObject object](self, "object"), "setDelegate:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPickerNativeObject;
  -[SUScriptViewControllerNativeObject setupNativeObject](&v3, sel_setupNativeObject);
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  SUScriptObject *v5;
  SUScriptMediaPickerEvent *v6;
  SUScriptMediaItemCollection *v7;

  v5 = -[SUScriptNativeObject scriptObject](self, "scriptObject", a3);
  v7 = objc_alloc_init(SUScriptMediaItemCollection);
  -[SUScriptObject setNativeObject:](v7, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", a4));
  v6 = -[SUScriptMediaPickerEvent initWithCollection:]([SUScriptMediaPickerEvent alloc], "initWithCollection:", v7);
  -[SUScriptObject checkInScriptObject:](v5, "checkInScriptObject:", v6);
  -[SUScriptObject dispatchEvent:forName:](v5, "dispatchEvent:forName:", v6, CFSTR("pick"));

}

- (void)mediaPickerDidCancel:(id)a3
{
  SUScriptObject *v3;
  SUScriptMediaPickerEvent *v4;

  v3 = -[SUScriptNativeObject scriptObject](self, "scriptObject", a3);
  v4 = objc_alloc_init(SUScriptMediaPickerEvent);
  -[SUScriptObject checkInScriptObject:](v3, "checkInScriptObject:", v4);
  -[SUScriptObject dispatchEvent:forName:](v3, "dispatchEvent:forName:", v4, CFSTR("pick"));

}

@end
