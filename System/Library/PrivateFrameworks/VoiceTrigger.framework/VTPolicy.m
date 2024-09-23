@implementation VTPolicy

- (VTPolicy)init
{
  VTPolicy *v2;
  uint64_t v3;
  NSMutableArray *monitors;
  uint64_t v5;
  NSMutableArray *conditions;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VTPolicy;
  v2 = -[VTPolicy init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    monitors = v2->_monitors;
    v2->_monitors = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    conditions = v2->_conditions;
    v2->_conditions = (NSMutableArray *)v5;

    v7 = dispatch_queue_create("Serial VTPolicy queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)setCallback:(id)a3
{
  void *v4;
  id callback;

  v4 = (void *)MEMORY[0x212BACF9C](a3, a2);
  callback = self->_callback;
  self->_callback = v4;

}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __19__VTPolicy_dealloc__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)VTPolicy;
  -[VTPolicy dealloc](&v4, sel_dealloc);
}

- (void)addConditions:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__VTPolicy_addConditions___block_invoke;
  block[3] = &unk_24C7F48B8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)subscribeEventMonitor:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  VTPolicy *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__VTPolicy_subscribeEventMonitor___block_invoke;
  block[3] = &unk_24C7F4DC0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (BOOL)_checkAllConditionsEnabled
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_conditions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!(*(unsigned int (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)isEnabled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __21__VTPolicy_isEnabled__block_invoke;
  v5[3] = &unk_24C7F4D00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)notifyCallback:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __27__VTPolicy_notifyCallback___block_invoke;
  v4[3] = &unk_24C7F4D98;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)VTEventMonitorDidReceiveEvent:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__VTPolicy_VTEventMonitorDidReceiveEvent___block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
}

_QWORD *__42__VTPolicy_VTEventMonitorDidReceiveEvent___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  result = *(_QWORD **)(a1 + 32);
  v2 = result[3];
  if (v2)
    return (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(result, "_checkAllConditionsEnabled"));
  return result;
}

uint64_t __27__VTPolicy_notifyCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

uint64_t __21__VTPolicy_isEnabled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_checkAllConditionsEnabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __34__VTPolicy_subscribeEventMonitor___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObserver:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", *(_QWORD *)(a1 + 32));
}

void __26__VTPolicy_addConditions___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = (id)MEMORY[0x212BACF9C](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __19__VTPolicy_dealloc__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "removeObserver:", *(_QWORD *)(a1 + 32), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)defaultVoiceTriggerEnablePolicy
{
  __objc2_class **v2;
  _BOOL4 v3;

  if (+[VTUtilities isNano](VTUtilities, "isNano"))
  {
    v2 = off_24C7EFAE8;
  }
  else if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    v2 = off_24C7EFAD8;
  }
  else
  {
    v3 = +[VTUtilities isAlwaysOn](VTUtilities, "isAlwaysOn");
    v2 = off_24C7EFAE0;
    if (v3)
      v2 = off_24C7EFAD0;
  }
  return objc_alloc_init(*v2);
}

@end
