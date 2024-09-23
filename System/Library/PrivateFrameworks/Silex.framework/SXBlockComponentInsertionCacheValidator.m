@implementation SXBlockComponentInsertionCacheValidator

+ (id)validatorWithBlock:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = MEMORY[0x219A070A8](v4);

  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)validateCache:(id)a3 DOMObjectProvider:(id)a4
{
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  char v9;

  v6 = a4;
  v7 = a3;
  -[SXBlockComponentInsertionCacheValidator block](self, "block");
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9 = ((uint64_t (**)(_QWORD, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)block
{
  return self->_block;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
