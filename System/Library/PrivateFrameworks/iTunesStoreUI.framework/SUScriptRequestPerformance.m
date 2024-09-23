@implementation SUScriptRequestPerformance

- (SUScriptRequestPerformance)initWithRequestPerformance:(id)a3
{
  SUScriptRequestPerformance *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptRequestPerformance;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_performance = (ISURLRequestPerformance *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptRequestPerformance;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesRequestPerformance");
}

- (double)finishInterval
{
  double result;

  -[ISURLRequestPerformance finishInterval](self->_performance, "finishInterval");
  return result;
}

- (NSString)JSONHeaders
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend((id)-[ISURLRequestPerformance URLResponse](self->_performance, "URLResponse"), "allHeaderFields");
  v3 = (void *)objc_msgSend(v2, "count");
  if (v3)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    if (v3)
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
  }
  return (NSString *)v3;
}

- (double)receivedResponseInterval
{
  double result;

  -[ISURLRequestPerformance receivedResponseInterval](self->_performance, "receivedResponseInterval");
  return result;
}

- (double)renderBeginInterval
{
  double result;

  -[ISURLRequestPerformance renderBeginInterval](self->_performance, "renderBeginInterval");
  return result;
}

- (double)renderEndInterval
{
  double result;

  -[ISURLRequestPerformance renderEndInterval](self->_performance, "renderEndInterval");
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_78, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptRequestPerformance;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptRequestPerformance;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_78, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_78 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("headers"), CFSTR("JSONHeaders"), CFSTR("requestBeginInterval"), CFSTR("receivedResponseInterval"), CFSTR("requestEndInterval"), CFSTR("finishInterval"), CFSTR("renderBeginInterval"), CFSTR("renderBeginInterval"), CFSTR("renderEndInterval"), CFSTR("renderEndInterval"), 0);
}

@end
