@implementation SSVSubscriptionResponse

- (id)subscriptionStatusForAccountUniqueIdentifier:(unint64_t)a3
{
  NSMutableDictionary *accountUniqueIdentifierToSubscriptionStatus;
  void *v4;
  void *v5;

  accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](accountUniqueIdentifierToSubscriptionStatus, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSubscriptionStatus:(id)a3 forAccountUniqueIdentifier:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *accountUniqueIdentifierToSubscriptionStatus;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
  v12 = v6;
  if (v6)
  {
    if (!accountUniqueIdentifierToSubscriptionStatus)
    {
      v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v9 = self->_accountUniqueIdentifierToSubscriptionStatus;
      self->_accountUniqueIdentifierToSubscriptionStatus = v8;

      accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](accountUniqueIdentifierToSubscriptionStatus, "setObject:forKey:", v12, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](accountUniqueIdentifierToSubscriptionStatus, "removeObjectForKey:", v11);

    if (-[NSMutableDictionary count](self->_accountUniqueIdentifierToSubscriptionStatus, "count"))
      goto LABEL_7;
    v10 = self->_accountUniqueIdentifierToSubscriptionStatus;
    self->_accountUniqueIdentifierToSubscriptionStatus = 0;
  }

LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary mutableCopy](self->_accountUniqueIdentifierToSubscriptionStatus, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (SSVSubscriptionResponse)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SSVSubscriptionResponse *v8;
  uint64_t v10;
  void *v11;
  _QWORD applier[4];
  SSVSubscriptionResponse *v13;
  objc_super v14;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = MEMORY[0x1A85863E4](v4), v7 = MEMORY[0x1E0C812F8], v6 == MEMORY[0x1E0C812F8]))
  {
    v14.receiver = self;
    v14.super_class = (Class)SSVSubscriptionResponse;
    v8 = -[SSVSubscriptionResponse init](&v14, sel_init);
    if (v8)
    {
      xpc_dictionary_get_value(v5, "0");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10 && MEMORY[0x1A85863E4](v10) == v7)
      {
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __47__SSVSubscriptionResponse_initWithXPCEncoding___block_invoke;
        applier[3] = &unk_1E47BC440;
        v13 = v8;
        xpc_dictionary_apply(v11, applier);

      }
    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

uint64_t __47__SSVSubscriptionResponse_initWithXPCEncoding___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  SSVFairPlaySubscriptionStatus *v6;

  v5 = a3;
  v6 = -[SSVFairPlaySubscriptionStatus initWithXPCEncoding:]([SSVFairPlaySubscriptionStatus alloc], "initWithXPCEncoding:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "setSubscriptionStatus:forAccountUniqueIdentifier:", v6, strtoull(a2, 0, 10));

  return 1;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSMutableDictionary *accountUniqueIdentifierToSubscriptionStatus;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = xpc_dictionary_create(0, 0, 0);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__25;
  v12 = __Block_byref_object_dispose__25;
  v13 = 0;
  accountUniqueIdentifierToSubscriptionStatus = self->_accountUniqueIdentifierToSubscriptionStatus;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SSVSubscriptionResponse_copyXPCEncoding__block_invoke;
  v7[3] = &unk_1E47BC468;
  v7[4] = &v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](accountUniqueIdentifierToSubscriptionStatus, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = (void *)v9[5];
  if (v5)
    xpc_dictionary_set_value(v3, "0", v5);
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __42__SSVSubscriptionResponse_copyXPCEncoding__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = (void *)objc_msgSend(v5, "copyXPCEncoding");
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lli"), objc_msgSend(v13, "longLongValue"));
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v12 = objc_retainAutorelease(v10);
    xpc_dictionary_set_value(v11, (const char *)objc_msgSend(v12, "UTF8String"), v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUniqueIdentifierToSubscriptionStatus, 0);
}

@end
