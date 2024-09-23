@implementation RMSharedLock

+ (id)newSharedLockWithDescription:(id)a3
{
  id v3;
  RMSharedLock *v4;

  v3 = a3;
  v4 = -[RMSharedLock initWithDescription:]([RMSharedLock alloc], "initWithDescription:", v3);

  return v4;
}

- (RMSharedLock)initWithDescription:(id)a3
{
  id v5;
  RMSharedLock *v6;
  RMSharedLock *v7;
  uint64_t v8;
  NSConditionLock *lock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMSharedLock;
  v6 = -[RMSharedLock init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockTitle, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD14D0]), "initWithCondition:", 0);
    lock = v7->_lock;
    v7->_lock = (NSConditionLock *)v8;

  }
  return v7;
}

- (void)lock
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "lockTitle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_21885E000, v2, v3, "Shared lock %{public}@ has been taken", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8_0();
}

- (void)unlock
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "lockTitle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_21885E000, v2, v3, "Shared lock %{public}@ has been released", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_8_0();
}

- (void)performBlockUnderLock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[RMSharedLock lock](self, "lock");
  v4[2](v4);

  -[RMSharedLock unlock](self, "unlock");
}

- (NSString)lockTitle
{
  return self->_lockTitle;
}

- (void)setLockTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockTitle, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
