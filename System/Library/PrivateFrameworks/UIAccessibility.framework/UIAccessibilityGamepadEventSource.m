@implementation UIAccessibilityGamepadEventSource

- (UIAccessibilityGamepadEventSource)init
{
  UIAccessibilityGamepadEventSource *v2;
  NSMutableArray *v3;
  NSMutableArray *handlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityGamepadEventSource;
  v2 = -[UIAccessibilityGamepadEventSource init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    handlers = v2->_handlers;
    v2->_handlers = v3;

  }
  return v2;
}

- (void)publishGamepadEvent:(id)a3
{
  id v4;
  NSMutableArray *handlers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  handlers = self->_handlers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__UIAccessibilityGamepadEventSource_publishGamepadEvent___block_invoke;
  v7[3] = &unk_1E3DFF4B8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](handlers, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __57__UIAccessibilityGamepadEventSource_publishGamepadEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (id)observeGamepadEvents:(id)a3
{
  void *v4;
  NSMutableArray *handlers;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (void *)objc_msgSend(a3, "copy");
  handlers = self->_handlers;
  v6 = _Block_copy(v4);
  -[NSMutableArray addObject:](handlers, "addObject:", v6);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v7 = (void *)get_GCObservationClass_softClass;
  v20 = get_GCObservationClass_softClass;
  v8 = MEMORY[0x1E0C809B0];
  if (!get_GCObservationClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __get_GCObservationClass_block_invoke;
    v16[3] = &unk_1E3DFDD78;
    v16[4] = &v17;
    __get_GCObservationClass_block_invoke((uint64_t)v16);
    v7 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v17, 8);
  v10 = [v9 alloc];
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__UIAccessibilityGamepadEventSource_observeGamepadEvents___block_invoke;
  v14[3] = &unk_1E3DFDA78;
  v14[4] = self;
  v15 = v4;
  v11 = v4;
  v12 = (void *)objc_msgSend(v10, "initWithCleanupHandler:", v14);

  return v12;
}

void __58__UIAccessibilityGamepadEventSource_observeGamepadEvents___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v1, "removeObject:", v2);

}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
