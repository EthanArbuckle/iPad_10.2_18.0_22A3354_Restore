@implementation SUScriptError

- (SUScriptError)initWithError:(id)a3
{
  SUScriptError *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptError;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_error = (NSError *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptError;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesError");
}

- (int64_t)code
{
  return -[NSError code](self->_error, "code");
}

- (NSString)domain
{
  return -[NSError domain](self->_error, "domain");
}

- (NSString)localizedDescription
{
  return -[NSError localizedDescription](self->_error, "localizedDescription");
}

- (NSString)localizedFailureReason
{
  return -[NSError localizedFailureReason](self->_error, "localizedFailureReason");
}

- (NSString)localizedRecoverySuggestion
{
  return -[NSError localizedRecoverySuggestion](self->_error, "localizedRecoverySuggestion");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_63, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptError;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptError;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_63, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_63 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("code"), CFSTR("domain"), CFSTR("domain"), CFSTR("localizedDescription"), CFSTR("localizedDescription"), CFSTR("localizedFailureReason"), CFSTR("localizedFailureReason"), CFSTR("localizedRecoverySuggestion"), CFSTR("localizedRecoverySuggestion"), 0);
}

@end
