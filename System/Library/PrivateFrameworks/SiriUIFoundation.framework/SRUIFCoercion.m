@implementation SRUIFCoercion

- (SRUIFCoercion)initWithBlock:(id)a3
{
  id v4;
  SRUIFCoercion *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFCoercion;
  v5 = -[SRUIFCoercion init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x220736DE0](v4);
    block = v5->_block;
    v5->_block = (id)v6;

  }
  return v5;
}

- (SRUIFCoercion)init
{
  return -[SRUIFCoercion initWithBlock:](self, "initWithBlock:", &__block_literal_global_5);
}

id __21__SRUIFCoercion_init__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)coerceObject:(id)a3 error:(id *)a4
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

+ (id)coercionWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

+ (id)identityCoercion
{
  return (id)objc_msgSend(a1, "coercionWithBlock:", &__block_literal_global_1);
}

id __33__SRUIFCoercion_identityCoercion__block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

+ (id)typeAssertionWithClass:(Class)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__SRUIFCoercion_typeAssertionWithClass___block_invoke;
  v4[3] = &__block_descriptor_40_e12__24__0_8__16lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "coercionWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __40__SRUIFCoercion_typeAssertionWithClass___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Object %@ is not a kind of %@"), v5, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRUIFConversationError errorWithCode:localizedFailureReason:](SRUIFConversationError, "errorWithCode:localizedFailureReason:", 200, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (a3)
LABEL_5:
    *a3 = objc_retainAutorelease(v7);
LABEL_6:

  return v6;
}

+ (id)stringToUUIDCoercion
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__SRUIFCoercion_stringToUUIDCoercion__block_invoke;
  v3[3] = &__block_descriptor_40_e12__24__0_8__16l;
  v3[4] = a1;
  objc_msgSend(a1, "coercionWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __37__SRUIFCoercion_stringToUUIDCoercion__block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  id v14;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v6, "coerceObject:error:", v5, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v7)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
    if (v9)
    {
      v10 = (void *)v9;
      if (!a3)
        goto LABEL_7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create UUID for string \"%@\"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SRUIFConversationError errorWithCode:localizedFailureReason:](SRUIFConversationError, "errorWithCode:localizedFailureReason:", 200, v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = 0;
      v8 = (id)v13;
      if (!a3)
        goto LABEL_7;
    }
    goto LABEL_6;
  }
  v10 = 0;
  if (a3)
LABEL_6:
    *a3 = objc_retainAutorelease(v8);
LABEL_7:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
