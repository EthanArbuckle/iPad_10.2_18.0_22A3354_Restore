@implementation SBHCompoundAssertion

- (SBHCompoundAssertion)initWithReason:(id)a3
{
  return -[SBHCompoundAssertion initWithReason:assertions:](self, "initWithReason:assertions:", a3, MEMORY[0x1E0C9AA60]);
}

- (SBHCompoundAssertion)initWithReason:(id)a3 assertions:(id)a4
{
  id v6;
  id v7;
  SBHCompoundAssertion *v8;
  uint64_t v9;
  NSString *reason;
  uint64_t v11;
  NSMutableArray *assertions;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHCompoundAssertion;
  v8 = -[SBHCompoundAssertion init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    v11 = objc_msgSend(v7, "mutableCopy");
    assertions = v8->_assertions;
    v8->_assertions = (NSMutableArray *)v11;

  }
  return v8;
}

- (SBHCompoundAssertion)init
{
  return -[SBHCompoundAssertion initWithReason:assertions:](self, "initWithReason:assertions:", &stru_1E8D8E958, MEMORY[0x1E0C9AA60]);
}

- (void)addAssertion:(id)a3
{
  -[NSMutableArray addObject:](self->_assertions, "addObject:", a3);
}

- (void)addAssertions:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_assertions, "addObjectsFromArray:", a3);
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBHCompoundAssertion *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __35__SBHCompoundAssertion_description__block_invoke;
  v10 = &unk_1E8D84EF0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __35__SBHCompoundAssertion_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  NSMutableArray *v2;
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

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_assertions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[SBHCompoundAssertion reason](self, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:", v4, CFSTR("reason"));

  v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_assertions, CFSTR("assertions"));
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
