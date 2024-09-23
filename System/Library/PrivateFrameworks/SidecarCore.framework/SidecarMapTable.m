@implementation SidecarMapTable

- (SidecarMapTable)initWithKeyMask:(int64_t)a3 weakObjects:(BOOL)a4
{
  _BOOL4 v4;
  SidecarMapTable *v6;
  SidecarMapTable *v7;
  uint64_t v8;
  NSMapTable *keys2values;
  uint64_t v10;
  uint64_t v11;
  NSMapTable *v12;
  NSMapTable *values2keys;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SidecarMapTable;
  v6 = -[SidecarMapTable init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_keyMask = a3;
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
      v8 = objc_claimAutoreleasedReturnValue();
      keys2values = v7->_keys2values;
      v7->_keys2values = (NSMapTable *)v8;

      objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v7->_keys2values;
      v7->_keys2values = (NSMapTable *)v11;

      objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    }
    v10 = objc_claimAutoreleasedReturnValue();
    values2keys = v7->_values2keys;
    v7->_values2keys = (NSMapTable *)v10;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values2keys, 0);
  objc_storeStrong((id *)&self->_keys2values, 0);
}

@end
