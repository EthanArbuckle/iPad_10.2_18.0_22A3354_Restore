@implementation NCAssertion

- (NCAssertion)initWithInstantiationReason:(id)a3
{
  id v4;
  NCAssertion *v5;
  NCAssertion *v6;
  uint64_t v7;
  NSString *instantiationReason;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCAssertion;
  v5 = -[NCAssertion init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_valid = 1;
    v7 = objc_msgSend(v4, "copy");
    instantiationReason = v6->_instantiationReason;
    v6->_instantiationReason = (NSString *)v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NCAssertion isValid](self, "isValid"))
    -[NCAssertion invalidateWithReason:](self, "invalidateWithReason:", CFSTR("deallocation"));
  v3.receiver = self;
  v3.super_class = (Class)NCAssertion;
  -[NCAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; instantiationReason: %@"), self->_instantiationReason);
  v4 = -[NCAssertion isValid](self, "isValid");
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; isValid: %@"), v5);

  if (!v4 && self->_invalidationReason)
    objc_msgSend(v3, "appendFormat:", CFSTR("; invalidationReason: %@"), self->_invalidationReason);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (void)addInvalidationBlock:(id)a3
{
  id v4;
  NCAssertion *v5;
  NSMutableOrderedSet *invalidationBlocks;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  void *v9;
  void *aBlock;

  v4 = a3;
  if (v4)
  {
    aBlock = v4;
    v5 = self;
    objc_sync_enter(v5);
    invalidationBlocks = v5->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v8 = v5->_invalidationBlocks;
      v5->_invalidationBlocks = v7;

      invalidationBlocks = v5->_invalidationBlocks;
    }
    v9 = _Block_copy(aBlock);
    -[NSMutableOrderedSet addObject:](invalidationBlocks, "addObject:", v9);

    objc_sync_exit(v5);
    v4 = aBlock;
  }

}

- (void)invalidateWithReason:(id)a3
{
  id v4;
  NCAssertion *v5;
  uint64_t v6;
  NSString *invalidationReason;
  NSObject *v8;
  NSMutableOrderedSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableOrderedSet *invalidationBlocks;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  NCAssertion *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NCAssertion isValid](self, "isValid"))
  {
    v5 = self;
    objc_sync_enter(v5);
    v5->_valid = 0;
    v6 = objc_msgSend(v4, "copy");
    invalidationReason = v5->_invalidationReason;
    v5->_invalidationReason = (NSString *)v6;

    v8 = *MEMORY[0x1E0DC5FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1CFC3D000, v8, OS_LOG_TYPE_DEFAULT, "Assertion did invalidate: %{public}@", buf, 0xCu);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = v5->_invalidationBlocks;
    v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    invalidationBlocks = v5->_invalidationBlocks;
    v5->_invalidationBlocks = 0;

    objc_sync_exit(v5);
  }
  else
  {
    v14 = *MEMORY[0x1E0DC5FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5FB0], OS_LOG_TYPE_ERROR))
      -[NCAssertion invalidateWithReason:].cold.1((uint64_t)self, v14);
  }

}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)instantiationReason
{
  return self->_instantiationReason;
}

- (NSString)invalidationReason
{
  return self->_invalidationReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationReason, 0);
  objc_storeStrong((id *)&self->_instantiationReason, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
}

- (void)invalidateWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CFC3D000, a2, OS_LOG_TYPE_ERROR, "Attempt to invalidate invalid assertion: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
