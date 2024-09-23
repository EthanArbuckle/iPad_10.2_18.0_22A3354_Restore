@implementation UNCThreadsMuteAssertion

+ (id)threadsMuteAssertion
{
  UNCThreadsMuteAssertion *v2;

  v2 = [UNCThreadsMuteAssertion alloc];
  return -[UNCThreadsMuteAssertion _initWithExpirationDateByThreadID:](v2, "_initWithExpirationDateByThreadID:", MEMORY[0x24BDBD1B8]);
}

+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[UNCThreadsMuteAssertion _initWithExpirationDateByThreadID:]([UNCThreadsMuteAssertion alloc], "_initWithExpirationDateByThreadID:", v3);

  return v4;
}

- (id)_initWithExpirationDateByThreadID:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCThreadsMuteAssertion;
  v5 = -[UNCMuteAssertion _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (NSDictionary)expirationDateByThreadID
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_mutableExpirationDateByThreadID, "copy");
}

- (BOOL)isActiveForThreadIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_mutableExpirationDateByThreadID, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v8 = objc_msgSend(v6, "compare:", v7) == 1;
  else
    v8 = 0;

  return v8;
}

- (void)setMutedUntilDate:(id)a3 forThreadIdentifier:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](self->_mutableExpirationDateByThreadID, "setValue:forKey:", a3, a4);
}

- (void)setUnmutedForThreadIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_mutableExpirationDateByThreadID, "removeObjectForKey:", a3);
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_mutableExpirationDateByThreadID, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary valueForKey:](self->_mutableExpirationDateByThreadID, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[UNCThreadsMuteAssertion isActiveForThreadIdentifier:](self, "isActiveForThreadIdentifier:", v12))
        {
          if (!v9 || objc_msgSend(v13, "compare:", v9) == -1)
          {
            v14 = v13;

            v9 = v14;
          }
        }
        else
        {
          -[NSMutableDictionary removeObjectForKey:](self->_mutableExpirationDateByThreadID, "removeObjectForKey:", v12);
          *a4 = 1;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v15 = objc_retainAutorelease(v9);
  *a3 = v15;

}

- (NSSet)threadIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_mutableExpirationDateByThreadID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  NSMutableDictionary *mutableExpirationDateByThreadID;
  unint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 31;
  mutableExpirationDateByThreadID = self->_mutableExpirationDateByThreadID;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__UNCThreadsMuteAssertion_hash__block_invoke;
  v5[3] = &unk_251AE0890;
  v5[4] = &v7;
  v5[5] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableExpirationDateByThreadID, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __31__UNCThreadsMuteAssertion_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v7 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "hash") + v6 * v5;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v10 = objc_msgSend(v7, "hash");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 + v9 * v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v4 = v3) != 0)
  {
    v5 = v4;
    v6 = BSEqualDictionaries();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; expirationDateByThreadID: %@>"),
               objc_opt_class(),
               self,
               self->_mutableExpirationDateByThreadID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary mutableCopy](self->_mutableExpirationDateByThreadID, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UNCThreadsMuteAssertion;
  v4 = a3;
  -[UNCMuteAssertion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mutableExpirationDateByThreadID, CFSTR("expirationDateByThreadID"), v5.receiver, v5.super_class);

}

- (UNCThreadsMuteAssertion)initWithCoder:(id)a3
{
  id v4;
  UNCThreadsMuteAssertion *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableDictionary *mutableExpirationDateByThreadID;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UNCThreadsMuteAssertion;
  v5 = -[UNCMuteAssertion initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("expirationDateByThreadID"));
    v9 = objc_claimAutoreleasedReturnValue();
    mutableExpirationDateByThreadID = v5->_mutableExpirationDateByThreadID;
    v5->_mutableExpirationDateByThreadID = (NSMutableDictionary *)v9;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableExpirationDateByThreadID, 0);
}

@end
