@implementation AXRTTSettingsListenerHelper

- (void)addSelectorKey:(SEL)a3
{
  NSMutableArray *selectorKeys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  selectorKeys = self->_selectorKeys;
  if (!selectorKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_selectorKeys;
    self->_selectorKeys = v6;

    selectorKeys = self->_selectorKeys;
  }
  NSStringFromSelector(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](selectorKeys, "addObject:", v8);

}

- (AXRTTSettingsListenerHelper)initWithListenerAddress:(void *)a3
{
  AXRTTSettingsListenerHelper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXRTTSettingsListenerHelper;
  result = -[AXRTTSettingsListenerHelper init](&v5, sel_init);
  if (result)
    result->_listenerAddress = a3;
  return result;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_selectorKeys;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(NSString **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        +[RTTSettings sharedInstance](RTTSettings, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "registerUpdateBlock:forRetrieveSelector:withListener:", 0, NSSelectorFromString(v8), self->_listenerAddress);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)AXRTTSettingsListenerHelper;
  -[AXRTTSettingsListenerHelper dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectorKeys, 0);
}

@end
