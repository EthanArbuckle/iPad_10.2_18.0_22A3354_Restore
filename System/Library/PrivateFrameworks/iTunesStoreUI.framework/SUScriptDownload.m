@implementation SUScriptDownload

- (SUScriptDownload)initWithISUDownload:(id)a3
{
  SUScriptDownload *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptDownload;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_download = (ISUDownload *)a3;
  return v4;
}

- (SUScriptDownload)initWithSSDownload:(id)a3
{
  SUScriptDownload *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptDownload;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_download = -[ISUDownload initWithManagedDownload:]([ISUDownload alloc], "initWithManagedDownload:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptDownload;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

+ (id)phaseStringForDownload:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "phaseIdentifier");
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB2300]) & 1) != 0)
    return CFSTR("failed");
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB2318]) & 1) != 0)
    return CFSTR("paused");
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB2310]) & 1) != 0)
    return CFSTR("installing");
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEB2320]))
    return CFSTR("waiting");
  return CFSTR("downloading");
}

- (NSNumber)adamID
{
  return -[ISUDownload storeItemIdentifier](self->_download, "storeItemIdentifier");
}

- (id)_className
{
  return CFSTR("iTunesDownload");
}

- (NSString)phase
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "phaseStringForDownload:", self->_download);
}

- (float)progress
{
  double v2;

  -[ISUDownload percentComplete](self->_download, "percentComplete");
  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_16, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDownload;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDownload;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_16, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_16 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("adamID"), CFSTR("phase"), CFSTR("phase"), CFSTR("progress"), CFSTR("progress"), 0);
}

@end
