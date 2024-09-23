@implementation SVXServiceCommandDelayedActionStore

- (SVXServiceCommandDelayedActionStore)init
{
  SVXServiceCommandDelayedActionStore *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *actionsByKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SVXServiceCommandDelayedActionStore;
  v2 = -[SVXServiceCommandDelayedActionStore init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    actionsByKey = v2->_actionsByKey;
    v2->_actionsByKey = v3;

  }
  return v2;
}

- (id)actionForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_actionsByKey, "objectForKey:", a3);
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *actionsByKey;

  actionsByKey = self->_actionsByKey;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](actionsByKey, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](actionsByKey, "removeObjectForKey:", a4);
}

- (void)removeActionForKey:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_actionsByKey, "removeObjectForKey:", a3);
}

- (void)removeAllActions
{
  -[NSMutableDictionary removeAllObjects](self->_actionsByKey, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByKey, 0);
}

@end
