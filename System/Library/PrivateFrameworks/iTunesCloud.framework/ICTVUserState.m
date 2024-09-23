@implementation ICTVUserState

- (ICTVUserState)initWithBlock:(id)a3
{
  void (**v5)(id, ICTVUserState *);
  ICTVUserState *v6;
  void *v8;
  objc_super v9;

  v5 = (void (**)(id, ICTVUserState *))a3;
  if (self->_frozen)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICTVUserState.m"), 24, CFSTR("ICTVUserState instance already exists"));

  }
  v9.receiver = self;
  v9.super_class = (Class)ICTVUserState;
  v6 = -[ICTVUserState init](&v9, sel_init);
  if (v6)
  {
    v5[2](v5, v6);
    v6->_frozen = 1;
  }

  return v6;
}

- (id)copyWithBlock:(id)a3
{
  id v4;
  ICTVUserState *v5;
  id v6;
  ICTVUserState *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = [ICTVUserState alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31__ICTVUserState_copyWithBlock___block_invoke;
  v9[3] = &unk_1E438C4D8;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  v7 = -[ICTVUserState initWithBlock:](v5, "initWithBlock:", v9);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ICTVUserState *v4;
  ICTVUserState *v5;
  BOOL v6;
  BOOL v7;
  char v8;

  v4 = (ICTVUserState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ICTVUserState isActiveWatchKitUser](self, "isActiveWatchKitUser");
      v7 = -[ICTVUserState isActiveWatchKitUser](v5, "isActiveWatchKitUser");

      v8 = v6 ^ v7 ^ 1;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_activeWatchKitUser, CFSTR("activeWatchKitUser"));
}

- (ICTVUserState)initWithCoder:(id)a3
{
  id v4;
  ICTVUserState *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICTVUserState;
  v5 = -[ICTVUserState init](&v7, sel_init);
  if (v5)
    v5->_activeWatchKitUser = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("activeWatchKitUser"));

  return v5;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICTVUserState isActiveWatchKitUser](self, "isActiveWatchKitUser"))
    v4 = MEMORY[0x1E0C9AAB0];
  else
    v4 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("activeWatchKitUser"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p [%@]>"), objc_opt_class(), self, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isActiveWatchKitUser
{
  return self->_activeWatchKitUser;
}

- (void)setActiveWatchKitUser:(BOOL)a3
{
  self->_activeWatchKitUser = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

uint64_t __31__ICTVUserState_copyWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 8) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
