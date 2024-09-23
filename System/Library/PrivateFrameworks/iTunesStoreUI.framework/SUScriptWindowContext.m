@implementation SUScriptWindowContext

- (SUScriptWindowContext)init
{
  SUScriptWindowContext *result;
  unsigned int v3;
  unsigned int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptWindowContext;
  result = -[SUScriptWindowContext init](&v5, sel_init);
  if (result)
  {
    do
    {
      v3 = __ldxr((unsigned int *)&init_sTag);
      v4 = v3 + 1;
    }
    while (__stxr(v4, (unsigned int *)&init_sTag));
    result->_tag = v4;
  }
  return result;
}

- (int)tag
{
  return self->_tag;
}

@end
