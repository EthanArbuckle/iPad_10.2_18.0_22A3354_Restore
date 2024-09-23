@implementation PCSLockAssertion

- (id)initAssertion:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  PCSLockAssertion *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCSLockAssertion;
  v9 = -[PCSLockAssertion init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)holdAssertion
{
  PCSLockAssertion *v2;
  char v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_held)
  {
    v3 = 1;
  }
  else
  {
    v3 = -[PCSLockManager holdAssertion:](v2->_manager, "holdAssertion:", v2);
    v2->_held = v3;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)dropAssertion
{
  PCSLockAssertion *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_held)
    -[PCSLockManager dropAssertion:](obj->_manager, "dropAssertion:");
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  -[PCSLockManager removeAssertion:](self->_manager, "removeAssertion:", self);
  v3.receiver = self;
  v3.super_class = (Class)PCSLockAssertion;
  -[PCSLockAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PCSLockManager)manager
{
  return (PCSLockManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)held
{
  return self->_held;
}

- (void)setHeld:(BOOL)a3
{
  self->_held = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
