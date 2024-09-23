@implementation SUScriptMediaPickerEvent

- (SUScriptMediaPickerEvent)initWithCollection:(id)a3
{
  SUScriptMediaPickerEvent *v4;
  SUScriptMediaPickerEvent *v5;
  SUScriptMediaItemCollection *v6;

  v4 = -[SUScriptObject init](self, "init");
  v5 = v4;
  if (a3 && v4)
  {
    v6 = (SUScriptMediaItemCollection *)a3;
    v5->_collection = v6;
    -[SUScriptObject checkInScriptObject:](v5, "checkInScriptObject:", v6);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMediaPickerEvent;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesMediaPickerEvent");
}

- (SUScriptMediaItemCollection)collection
{
  SUScriptMediaItemCollection *collection;

  collection = self->_collection;
  if (collection)
    return collection;
  else
    return (SUScriptMediaItemCollection *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_39, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMediaPickerEvent;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMediaPickerEvent;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_39, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_39 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("collection"), 0);
}

@end
