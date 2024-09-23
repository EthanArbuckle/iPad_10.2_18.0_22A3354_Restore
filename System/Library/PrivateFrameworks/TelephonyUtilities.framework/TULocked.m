@implementation TULocked

- (void)performWhileLocked:(id)a3
{
  void (**v4)(id, id);

  v4 = (void (**)(id, id))a3;
  os_unfair_recursive_lock_lock_with_options();
  v4[2](v4, self->_object);
  os_unfair_recursive_lock_unlock();

}

- (TULocked)initWithObject:(id)a3
{
  id v5;
  TULocked *v6;
  TULocked *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TULocked;
  v6 = -[TULocked init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock = 0;
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TULocked;
  -[TULocked description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_object, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TULocked;
  -[TULocked description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_object, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)object
{
  id v3;

  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_object;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setObject:(id)a3
{
  id v4;
  id object;

  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  object = self->_object;
  self->_object = v4;

  os_unfair_recursive_lock_unlock();
}

- (os_unfair_recursive_lock_s)unfairLockForTesting
{
  return &self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
