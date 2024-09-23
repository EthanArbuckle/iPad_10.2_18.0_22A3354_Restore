@implementation REMUserDefaultsObserver

- (REMUserDefaultsObserver)initWithUserDefaults:(id)a3 key:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  REMUserDefaultsObserver *v12;
  REMUserDefaultsObserver *v13;
  uint64_t v14;
  id block;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)REMUserDefaultsObserver;
  v12 = -[REMUserDefaultsObserver init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    objc_storeStrong((id *)&v13->_userDefaultsKey, a4);
    v14 = MEMORY[0x1B5E3E098](v11);
    block = v13->_block;
    v13->_block = (id)v14;

  }
  return v13;
}

- (void)stopObserving
{
  void *v3;

  if (!-[REMUserDefaultsObserver removed](self, "removed"))
  {
    -[REMUserDefaultsObserver userDefaults](self, "userDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeObserver:", self);

    -[REMUserDefaultsObserver setRemoved:](self, "setRemoved:", 1);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[REMUserDefaultsObserver stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)REMUserDefaultsObserver;
  -[REMUserDefaultsObserver dealloc](&v3, sel_dealloc);
}

- (REMUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (NSString)userDefaultsKey
{
  return self->_userDefaultsKey;
}

- (void)setUserDefaultsKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_userDefaultsKey, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
