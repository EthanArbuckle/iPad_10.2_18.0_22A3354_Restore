@implementation SUScriptMediaLibraryNativeObject

- (void)destroyNativeObject
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUMediaLibraryCacheDidChangeNotification"), 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaLibraryNativeObject;
  -[SUScriptNativeObject destroyNativeObject](&v3, sel_destroyNativeObject);
}

- (void)setupNativeObject
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__libraryChangedNotification_, CFSTR("SUMediaLibraryCacheDidChangeNotification"), 0);
  objc_msgSend(+[SUMediaLibraryAdamIDCache sharedCache](SUMediaLibraryAdamIDCache, "sharedCache"), "populateCache");
  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaLibraryNativeObject;
  -[SUScriptNativeObject setupNativeObject](&v3, sel_setupNativeObject);
}

- (void)_libraryChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](-[SUScriptNativeObject scriptObject](self, "scriptObject", a3), "dispatchEvent:forName:", 0, CFSTR("contentschange"));
}

@end
