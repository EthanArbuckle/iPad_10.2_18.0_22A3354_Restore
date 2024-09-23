@implementation SBAutoUnlockComposableRule

- (SBAutoUnlockComposableRule)init
{
  SBAutoUnlockComposableRule *v2;
  NSMutableSet *v3;
  NSMutableSet *rules;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBAutoUnlockComposableRule;
  v2 = -[SBAutoUnlockComposableRule init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    rules = v2->_rules;
    v2->_rules = v3;

  }
  return v2;
}

- (void)addAutoUnlockRule:(id)a3
{
  -[NSMutableSet addObject:](self->_rules, "addObject:", a3);
}

- (void)removeAutoUnlockRule:(id)a3
{
  -[NSMutableSet removeObject:](self->_rules, "removeObject:", a3);
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  NSMutableSet *rules;
  char v4;
  _QWORD v6[5];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  rules = self->_rules;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBAutoUnlockComposableRule_shouldAutoUnlockForSource___block_invoke;
  v6[3] = &unk_1E8EAC830;
  v7 = a3;
  v6[4] = &v8;
  -[NSMutableSet enumerateObjectsUsingBlock:](rules, "enumerateObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __56__SBAutoUnlockComposableRule_shouldAutoUnlockForSource___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldAutoUnlockForSource:", *(unsigned int *)(a1 + 40));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
}

@end
